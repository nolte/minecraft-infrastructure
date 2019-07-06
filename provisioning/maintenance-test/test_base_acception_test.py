
import pytest
import testinfra

def test_os_release(host):
    assert host.file("/etc/os-release").contains("CentOS")


@pytest.mark.parametrize(
    "service", ["firewalld","fail2ban", "spigot"]
)
def test_service_active(host,service):
    assert host.service(service).is_running is True