module.exports = {
  apps: [{
    name: "pswg-web",
    script: "npm",
    args: "prod",
    max_memory_restart: "1G",
    restart_delay: 2000
  }]
}