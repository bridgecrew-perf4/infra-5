# IP

module "lb_ip" {
  source  = "./modules/scw-ip"
  name    = "lb"
  aliases = ["bag", "blog", "cloud", "crypto", "git", "grocy", "mail", "ndata", "pfa", "rspamd", "wedding", "www"]
}

module "mail_ip" {
  source  = "./modules/scw-ip"
  name    = "smtp"
  aliases = ["imap"]
}
