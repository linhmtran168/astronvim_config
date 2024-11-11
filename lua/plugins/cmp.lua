return {
  "hrsh7th/nvim-cmp",
  -- override the options table that is used in the `require("cmp").setup()` call
  opts = function(_, opts)
    -- opts parameter is the default options table
    -- the function is lazy loaded so cmp is able to be required
    local cmp = require "cmp"
    -- modify the mapping part of the table
    opts.mapping["<C-l>"] = cmp.mapping(
      function(_fallback)
        vim.api.nvim_feedkeys(
          vim.fn["copilot#Accept"](vim.api.nvim_replace_termcodes("<Tab>", true, true, true)),
          "n",
          true
        )
      end
    )
    opts.experimental = {
      ghost_text = false, -- this feature conflict with copilot.vim's preview.
    }
  end,
}
