local options = {
	lsp_fallback = true,

	formatters_by_ft = {
		lua = { "stylua" },

		javascript = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },

		sh = { "shfmt" },
	},

  -- adding same formatter for multiple filetypes can look too much work for some
  -- instead of the above code you could just use a loop! the config is just a table after all!

	-- format_on_save = {
	--   -- These options will be passed to conform.format()
	--   timeout_ms = 500,
	--   lsp_fallback = true,
	-- },
}

require("conform").setup(options)


-- local formatters = {
--   lua = { "stylua" },
--   python = { "autopep8" },
--   cpp = { "clang_format" },
--   c = { "clang_format" },
--   go = { "gofumpt" },
--   cs = { "csharpier" },
--   yaml = { "yamlfmt" },
-- }
--
-- local prettier_ft = {
--   "css",
--   "flow",
--   "graphql",
--   "html",
--   "json",
--   "javascriptreact",
--   "javascript",
--   "less",
--   "markdown",
--   "scss",
--   "typescript",
--   "typescriptreact",
--   "vue",
-- }
--
-- for _, filetype in pairs(prettier_ft) do
--   formatters[filetype] = { "prettier" }
-- end
-- return {
--   -- format_on_save = {
--   --   -- These options will be passed to conform.format()
--   --   async = true,
--   --   quiet = true,
--   --   lsp_fallback = true,
--   -- },
--   formatters_by_ft = formatters,
-- }
