{
  description = "Onix shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixsecpkgs = {
      url = "github:onix-sec/nixsecpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixsecpkgs,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      devShells."${system}".default =
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
            overlays = [ nixsecpkgs.overlays.default ];
          };
        in
        pkgs.mkShell {
          packages = with pkgs; [
            # from nixsecpkgs
            awrbacs
            buster
            byp4xx
            carbon14
            cmsmap
            crackhound
            dfscoerce
            entropy
            finduncommonshares
            git-dumper
            gmsadumper
            go-bhtool
            go-evilarc
            go-windapsearch
            goldencopy
            gosecretsdump
            goshs
            gpp-decrypt
            haiti
            hakrevdns
            hashonymize
            homoglyph
            jackit
            keyt
            pof
            pywhisket
            robotstester
            shellerator
            shuffledns
            smartbrute
            smtp-user-enum
            sprayhound
            sublist3r
            toutatis
            uberfile
            waybackurls
            webclientservicescanner
            whatportis
            xsser

            # from nixpkgs
            adidnsdump
            aircrack-ng
            amass
            amber
            androguard
            android-tools # android-tools-adb
            anew
            apksigner
            apktool
            arjun
            arsenal
            ascii
            assetfinder
            autoconf
            avrdude
            awscli
            bettercap
            binwalk
            bloodhound
            bolt
            brakeman
            bruteforce-luks
            bully
            burpsuite
            certipy
            certsync
            cewl
            chisel
            python312Packages.cloudsplaining
            coercer
            cowpatty
            netexec # maintained fork of crackmapexec
            crunch
            dex2jar
            dirb
            das # divideandscan
            dns2tcp
            dnschef
            dnsenum
            dnsx
            donpapi
            enum4linux-ng
            evil-winrm
            exif
            exifprobe
            exiftool
            exiv2
            eye-witness
            fcrackzip
            feroxbuster
            ffuf
            fierce
            findomain
            firefox
            foremost
            freerdp3 # freerdp2-x11
            frida-tools
            gau
            gf
            ghidra
            git # gittools
            gobuster
            gowitness
            gqrx
            gron
            h8mail
            hackrf
            hakrawler
            hashcat
            hcxdumptool
            hcxtools
            hexedit
            holehe
            hping # hping3
            httprobe
            httpx
            imagemagick
            python312Packages.impacket
            ipinfo
            iptables
            jadx
            john
            joomscan
            # jwt-cli # jwt
            jwt-hack
            kerbrute
            kiterunner
            kubectl
            python312Packages.ldapdomaindump
            openldap # ldapsearch
            ldeep
            libmspack
            libnfc
            # libnfc # libnfc-crypto1-crack
            libusb1
            ligolo-ng
            xnlinkfinder # linkfinder
            python312Packages.lsassy # lsassy
            ltrace
            maltego
            libmysqlclient # mariadb-client
            python312Packages.masky # masky
            masscan
            mdcat
            metasploit
            mfcuk
            mfoc
            minicom
            mitm6
            naabu
            python312Packages.name-that-hash # name-that-hash
            nasm
            nbtscan
            neo4j
            netdiscover
            conntrack-tools # nfct
            ngrok
            nmap
            nuclei
            onesixtyone
            python311Packages.patator
            pdfcrack
            photon
            php
            powershell
            pre2k
            prowler
            proxmark3
            proxychains
            pwncat
            pwninit
            pwndbg
            pwntools
            python312Packages.pypykatz
            radare2
            rdesktop
            reaverwps
            remmina
            responder
            rlwrap
            rockyou
            rsync
            rtl_433 # rtl-433
            ruler
            samdump2
            scout
            scrcpy
            exploitdb # searchsploit
            seclists
            semgrep
            sipvicious
            sleuthkit
            samba # smbclient
            smbmap
            soapui # SoapUI
            sqlmap
            ssh-audit
            sshuttle
            sslscan
            strace
            subfinder
            swaks
            tailscale
            tcpdump
            testdisk
            testssl
            theharvester
            tor
            traceroute
            trilium-desktop
            tshark
            updog
            username-anarchy
            util-linux
            volatility3
            wabt
            wafw00f
            weevely
            wfuzz
            whatweb
            whois
            wifite2
            wireshark
            wpscan
            wuzz
            yt-dlp
            zsteg

            # added:
            wordlists
            dalfox
            dnsrecon
            dnstwist
            nikto
            snallygaster
            webanalyze

            # TODO:
            # aclpwn
            # python311Packages.angr # FIXME: broken
            # autorecon
            # bloodhound-import
            # bloodhound-quickwin
            # bloodhound.py
            # bqm
            # byp4xx
            # carbon14
            # checksec-py
            # cloudfail
            # cloudmapper
            # cloudsploit
            # clusterd
            # cmsmap
            # constellation
            # corscanner
            # crackhound
            # cupp
            # cyperoth
            # darkarmour
            # dfscoerce
            # dirsearch
            # droopescan
            # drupwn
            # eaphammer
            # enyx
            # finalrecon
            # finduncommonshares
            # fuxploider
            # genusernames
            # git-dumper
            # githubemail
            # gopherus
            # gosecretsdump
            # h2csmuggler
            # httpmethods
            # hydra
            # ida-free # FIXME: fails to build
            # ignorant
            # infoga
            # jd-gui # FIXME fails to build
            # jdwp
            # kadimus
            # KeePwn
            # Kraken
            # krbrelayx
            # ldaprelayscan
            # ldapsearch-ad
            # linkedin2username
            # lnkup
            # maigret # FIXME: build fails
            # manspider
            # mfdread
            # moodlescan
            # mousejack
            # msprobe
            # noPac
            # nosqlmap
            # ntlmv1-multi
            # oaburl
            # objection
            # objectwalker
            # oneforall
            # osrframework
            # pass
            # PassTheCert
            # pcredz
            # pcsclite # pcsc
            # peepdf
            # petitpotam
            # phoneinfoga
            # filter
            # chain
            # generator
            # phpggc
            # pkinittools
            # polenum
            # prips
            # privexchange
            # pst-utils
            # pth-tools
            # pwndb
            # pwnedornot
            # pygpoabuse
            # pykek
            # pylaps
            # pyrit
            # pywhisker
            # pywsus
            # recon-ng
            # recondog
            # redis-tools
            # roastinthemiddle
            # routersploit # FIXME: fail tests
            # rsactftool
            # rusthound
            # shadowcoerce
            # simplyemail
            # sliver
            # smali
            # smuggler
            # spiderfoot
            # ssrfmap
            # steghide
            # stegolsb
            # stegosuite
            # symfony-exploits
            # targetedKerberoast
            # timing
            # tls-map
            # tls-scanner
            # tomcatwardeployer
            # trevorspray
            # trid
            # vulny-code-static-analysis
            # XSpear
            # xsrfprobe
            # xsstrike
            # tightvnc # FIXME: not maintained anymore
            # ysoserial
            # zerologon
            # zipalign
            # pagodo
            # https://github.com/Ge0rg3/requests-ip-rotator
            # https://github.com/RetireJS/retire.js
          ];

          shellHook = ''
            echo "Welcome to Onix"
          '';
        };
    };
}
