# Manual configuration of Tor

These docs are a beginner-friendly version of the [Tor documentation from Bitcoin Core](https://github.com/bitcoin/bitcoin/blob/master/doc/tor.md). If you are technical, please read and follow those docs instead.

At this time, your Linux distribution must use the `apt` Package manager.

## `apt` Package Manager (Ubuntu, Debian, etc.)

This procedure has been tested on Ubuntu 24.

### Install Tor and Configure Your Machine

1. Install Tor using the package manager. Run the following command in Terminal:

   ```sh
   sudo apt -qq update && sudo apt -qq install -y tor
   ```

2. Check that Tor service properly installed. Run the following command in Terminal:

   ```sh
   systemctl status tor
   ```

3. The response should show that the Tor service is enabled and active. For example:

   ```text
   user1@comp1:~$ systemctl status tor
   ● tor.service - Anonymizing overlay network for TCP (multi-instance-master)
        Loaded: loaded (/usr/lib/systemd/system/tor.service; enabled; preset: enabled)
        Active: active (exited) since Mon 2024-06-10 11:03:10 UTC; 6min ago
       Process: 12789 ExecStart=/bin/true (code=exited, status=0/SUCCESS)
      Main PID: 12789 (code=exited, status=0/SUCCESS)
           CPU: 1ms
   ```

4. Configure Tor, Bitcoin Core, and your user permissions. Run the following command in Terminal:

   ```sh
   printf 'ControlPort 9051\nCookieAuthentication 1\nCookieAuthFileGroupReadable 1\nDataDirectoryGroupReadable 1' |
     sudo tee -a /etc/tor/torrc
   sudo usermod -a -G "$(stat -c '%G' /run/tor/control.authcookie)" "${USER}"
   printf 'listen=1\n' >> ~/.bitcoin/bitcoin.conf
   printf 'proxy=127.0.0.1:9050\n' >> ~/.bitcoin/bitcoin.conf
   ```

5. Shut down Bitcoin Core if it's running and wait for the "Bitcoin Core is shutting down" dialog to disappear.

6. Reboot your system and re-run Bitcoin Core.

7. Check again that the Tor service is up. Run the following command in Terminal:

   ```sh
   systemctl status Tor
   ```

8. Open the `Window -> Console` option and run the following command:

   ```text
   getnetworkinfo
   ```

9. Look for the `localaddresses` field at the end of the response. You should see a long address ending in `.onion`. For example:

   ```text
     ...
     "relayfee": 0.00001000,
     "incrementalfee": 0.00001000,
     "localaddresses": [
       {
         "address": "lku5sksm4cxiny3dhpp5jobudfm57p3wl3w5w6dm4n4ehev4xpyc3cid.onion",
         "port": 8333,
         "score": 4
       }
     ],
     "warnings": ""
   }
   ```

10. Click on the Peers tab and wait for a peer to connect where the Network is Onion.

## `dnf` Package Manager (Fedora, RHEL, Amazon Linux, Oracle Linux, etc.)

To be determined.
