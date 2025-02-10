return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "phpcs",
        "php-cs-fixer",
      },
      handlers = {
        phpcs = function(config)
          config.cmd = { "phpcs", "--standard=PSR2" }
        end,
      },
    },
  },
}
