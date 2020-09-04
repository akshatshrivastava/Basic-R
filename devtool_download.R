remove.packages(c("curl","httr"))
install.packages(c("curl", "httr"))
Sys.setenv(CURL_CA_BUNDLE="/usr/lib64/microsoft-r/3.4/lib64/R/lib/microsoft-r-cacert.pem")
devtools::install_git("https://github.com/yihui/xaringan")