for h in $(cat $1); do  true | openssl s_client -connect $h:443  2>/dev/null  | openssl x509 -noout -text | perl -l -0777 -ne '@names=/\bDNS:([^\s,]+)/g; print join("\n", sort @names);'; done
