#!/bin/bash

echo "============================================"
echo "    GitHub Connection Test Script"
echo "============================================"
echo ""

# Test 1: Ping GitHub
echo "[1] Testing Ping to github.com..."
if ping -c 3 -W 5 github.com > /dev/null 2>&1; then
    echo "    ✓ Ping SUCCESS"
else
    echo "    ✗ Ping FAILED"
fi
echo ""

# Test 2: HTTPS connection (port 443)
echo "[2] Testing HTTPS connection (port 443)..."
if curl -s --connect-timeout 10 https://github.com > /dev/null 2>&1; then
    echo "    ✓ HTTPS connection SUCCESS"
else
    echo "    ✗ HTTPS connection FAILED"
fi
echo ""

# Test 3: SSH connection (port 22)
echo "[3] Testing SSH connection (port 22)..."
timeout 10 bash -c "echo '' | nc -v github.com 22" 2>&1 | grep -q succeeded && echo "    ✓ SSH port 22 OPEN" || echo "    ✗ SSH port 22 BLOCKED"
echo ""

# Test 4: SSH over HTTPS (port 443)
echo "[4] Testing SSH over HTTPS (port 443)..."
timeout 10 bash -c "echo '' | nc -v ssh.github.com 443" 2>&1 | grep -q succeeded && echo "    ✓ SSH over port 443 OPEN" || echo "    ✗ SSH over port 443 BLOCKED"
echo ""

# Test 5: Git protocol
echo "[5] Testing Git protocol..."
if timeout 15 git ls-remote https://github.com > /dev/null 2>&1; then
    echo "    ✓ Git HTTPS protocol SUCCESS"
else
    echo "    ✗ Git HTTPS protocol FAILED"
fi
echo ""

# Test 6: SSH authentication
echo "[6] Testing SSH authentication with GitHub..."
SSH_RESULT=$(timeout 15 ssh -T git@github.com 2>&1)
if echo "$SSH_RESULT" | grep -q "successfully authenticated"; then
    echo "    ✓ SSH authentication SUCCESS"
    echo "    Message: $SSH_RESULT"
elif echo "$SSH_RESULT" | grep -q "Permission denied"; then
    echo "    ✗ SSH authentication FAILED (Permission denied)"
    echo "    Please add your SSH key to GitHub"
else
    echo "    ✗ SSH connection FAILED"
    echo "    Error: $SSH_RESULT"
fi
echo ""

# Test 7: Check proxy settings
echo "[7] Checking proxy settings..."
if [ -n "$http_proxy" ] || [ -n "$https_proxy" ] || [ -n "$all_proxy" ]; then
    echo "    Proxy configured:"
    [ -n "$http_proxy" ] && echo "      http_proxy=$http_proxy"
    [ -n "$https_proxy" ] && echo "      https_proxy=$https_proxy"
    [ -n "$all_proxy" ] && echo "      all_proxy=$all_proxy"
else
    echo "    No proxy configured"
fi
echo ""

# Test 8: DNS resolution
echo "[8] Testing DNS resolution..."
if host github.com > /dev/null 2>&1; then
    GITHUB_IP=$(host github.com | head -1 | awk '{print $NF}')
    echo "    ✓ DNS resolution SUCCESS"
    echo "    GitHub IP: $GITHUB_IP"
else
    echo "    ✗ DNS resolution FAILED"
fi
echo ""

echo "============================================"
echo "    Test Complete"
echo "============================================"
