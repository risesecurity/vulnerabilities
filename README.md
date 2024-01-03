Vulnerabilities
===============


* [CVE-2010-0415](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2010-0415)  
  The do_pages_move function in mm/migrate.c in the Linux kernel before 2.6.33-rc7 does not validate node values, which allows local users to read arbitrary kernel memory locations, cause a denial of service (OOPS), and possibly have unspecified other impact by specifying a node that is not part of the kernel's node set.

* [CVE-2009-2727](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2009-2727)  
  Stack-based buffer overflow in the _tt_internal_realpath function in the ToolTalk library (libtt.a) in IBM AIX 5.2.0, 5.3.0, 5.3.7 through 5.3.10, and 6.1.0 through 6.1.3, when the rpc.ttdbserver daemon is enabled in /etc/inetd.conf, allows remote attackers to execute arbitrary code via a long XDR-encoded ASCII string to remote procedure 15.

* [CVE-2009-2407](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2009-2407)  
  Heap-based buffer overflow in the parse_tag_3_packet function in fs/ecryptfs/keystore.c in the eCryptfs subsystem in the Linux kernel before 2.6.30.4 allows local users to cause a denial of service (system crash) or possibly gain privileges via vectors involving a crafted eCryptfs file, related to a large encrypted key size in a Tag 3 packet.

* [CVE-2009-2406](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2009-2406)  
  Stack-based buffer overflow in the parse_tag_11_packet function in fs/ecryptfs/keystore.c in the eCryptfs subsystem in the Linux kernel before 2.6.30.4 allows local users to cause a denial of service (system crash) or possibly gain privileges via vectors involving a crafted eCryptfs file, related to not ensuring that the key signature length in a Tag 11 packet is compatible with the key signature buffer size.

* [CVE-2008-4556](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-4556)  
  Stack-based buffer overflow in the adm_build_path function in sadmind in Sun Solstice AdminSuite on Solaris 8 and 9 allows remote attackers to execute arbitrary code via a crafted request.

* [CVE-2007-5246](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2007-5246)  
  Multiple stack-based buffer overflows in Firebird LI 2.0.0.12748 and 2.0.1.12855, and WI 2.0.0.12748 and 2.0.1.12855, allow remote attackers to execute arbitrary code via (1) a long attach request on TCP port 3050 to the isc_attach_database function or (2) a long create request on TCP port 3050 to the isc_create_database function.

* [CVE-2007-5245](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2007-5245)  
  Multiple stack-based buffer overflows in Firebird LI 1.5.3.4870 and 1.5.4.4910, and WI 1.5.3.4870 and 1.5.4.4910, allow remote attackers to execute arbitrary code via (1) a long service attach request on TCP port 3050 to the SVC_attach function or (2) unspecified vectors involving the INET_connect function.

* [CVE-2007-5244](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2007-5244)  
  Stack-based buffer overflow in Borland InterBase LI 8.0.0.53 through 8.1.0.253 on Linux, and possibly unspecified versions on Solaris, allows remote attackers to execute arbitrary code via a long attach request on TCP port 3050 to the open_marker_file function.

* [CVE-2007-5243](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2007-5243)  
  Multiple stack-based buffer overflows in Borland InterBase LI 8.0.0.53 through 8.1.0.253, and WI 5.1.1.680 through 8.1.0.257, allow remote attackers to execute arbitrary code via (1) a long service attach request on TCP port 3050 to the (a) SVC_attach or (b) INET_connect function, (2) a long create request on TCP port 3050 to the (c) isc_create_database or (d) jrd8_create_database function, (3) a long attach request on TCP port 3050 to the (e) isc_attach_database or (f) PWD_db_aliased function, or unspecified vectors involving the (4) jrd8_attach_database or (5) expand_filename2 function.

* [CVE-2007-4684](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2007-4684)  
  Integer overflow in the kernel in Apple Mac OS X 10.4 through 10.4.10 allows local users to execute arbitrary code via a large num_sels argument to the i386_set_ldt system call.

* [CVE-2007-0430](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2007-0430)  
  The shared_region_map_file_np function in Apple Mac OS X 10.4.8 and earlier kernel allows local users to cause a denial of service (memory corruption) via a large mappingCount value.

* [CVE-2006-4655](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2006-4655)  
  Buffer overflow in the Strcmp function in the XKEYBOARD extension in X Window System X11R6.4 and earlier, as used in SCO UnixWare 7.1.3 and Sun Solaris 8 through 10, allows local users to gain privileges via a long _XKB_CHARSET environment variable value.

* [CVE-2006-4178](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2006-4178)  
  Integer signedness error in the i386_set_ldt call in FreeBSD 5.5, and possibly earlier versions down to 5.2, allows local users to cause a denial of service (crash) via unspecified arguments that use negative signed integers to cause the bzero function to be called with a large length parameter, a different vulnerability than CVE-2006-4172.

* [CVE-2006-4172](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2006-4172)  
  Integer overflow vulnerability in the i386_set_ldt call in FreeBSD 5.5, and possibly earlier versions down to 5.2, allows local users to cause a denial of service (crash) and possibly execute arbitrary code via unspecified vectors, a different vulnerability than CVE-2006-4178.


[^1]: Descriptions from [MITRE CVE List](https://www.cve.org/).
