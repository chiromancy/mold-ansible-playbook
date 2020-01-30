def test_ssh_running_and_enabled(host):
    nginx = host.service("sshd")
    assert nginx.is_running
    assert nginx.is_enabled
