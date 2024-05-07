local formatter = require("formatter.util")

local GoConf = {
    exe = "gofmt",
    stdin = true,
  }
require"formatter".setup {
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
        go = {
            GoConf
            -- require("formatter.filetypes.go").gofmt
        },
        javascript = {
            require("formatter.filetypes.javascript").prettier
        },
        typescript = {
            require("formatter.filetypes.typescript").prettier
        },
        lua = {
            require("formatter.filetypes.lua").stylua
        },
        ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace
        }
    }
}

vim.api.nvim_create_autocmd({"BufWritePost"}, {
    command = "FormatWriteLock"
})
