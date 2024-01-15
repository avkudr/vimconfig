vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Shorten function name
local keymap = vim.keymap.set

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

------------------------ Normal Mode -------------------------------------------

-- buffers
keymap("n", "<leader>bd", "<cmd>Bdelete!<CR>", { desc = "Delete current buffer" })

-- cmake
keymap("n", "<leader>cg", "<cmd>CMakeGenerate<CR>", { desc = "Generate" })
keymap("n", "<leader>cx", "<cmd>CMakeGenerate!<CR>", { desc = "Clean and generate" })
keymap("n", "<leader>cb", "<cmd>CMakeBuild<CR>", { desc = "Build" })
keymap("n", "<leader>cr", "<cmd>CMakeRun<CR>", { desc = "Run" })
keymap("n", "<leader>cy", "<cmd>CMakeSelectBuildType<CR>", { desc = "Select Build Type" })
keymap("n", "<leader>cl", "<cmd>CMakeSelectTarget<CR>", { desc = "Select Target" })
keymap("n", "<leader>ce", "<cmd>CMakeOpenExecutor<CR>", { desc = "Open CMake Console" })
keymap("n", "<leader>cc", "<cmd>CMakeCloseExecutor<CR>", { desc = "Close CMake Console" })
keymap("n", "<leader>ci", "<cmd>CMakeInstall<CR>", { desc = "Intall CMake target" })
keymap("n", "<leader>cs", function()
  vim.cmd([[CMakeStopRunner]])
  vim.cmd([[CMakeStopExecutor]])
end, { desc = "Stop CMake Process" })

-- find
keymap("n", "<C-p>", "<cmd>Telescope git_files<CR>", { desc = "Git files" })
keymap("n", "<leader>ff",
  [[<cmd>lua require('telescope.builtin').find_files()<CR>]],
  { desc = "Find files" })
keymap("n", "<leader>fF",
  "<cmd>lua require('telescope.builtin').find_files({no_ignore=true})<CR>",
  { desc = "Find files but no ignore" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
keymap("n", "<leader>fm", "<cmd>Telescope man_pages<CR>", { desc = "Man Pages" })
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent File" })
keymap("n", "<leader>fR", "<cmd>Telescope registers<CR>", { desc = "Registers" })
keymap("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "Keymaps" })
keymap("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Todos" })

-- misc
keymap({"n", "v"}, "<leader>d", [["_d]]) -- delete without overwriting the buffer

-- overseer
keymap({"n", "v"}, "<leader>o<leader>", "<cmd>OverseerToggle<CR>")
keymap({"n", "v"}, "<leader>os", "<cmd>OverseerQuickAction stop<CR>")
keymap({"n", "v"}, "<leader>or", "<cmd>OverseerQuickAction restart<CR>")
keymap({"n", "v"}, "<leader>oq", "<cmd>OverseerQuickAction open output in quickfix<CR>")
keymap({"n", "v"}, "<leader>ox", "<cmd>OverseerQuickAction open output in quickfix<CR><cmd>ccl<CR><cmd>TroubleToggle quickfix<CR>")

-- trouble
keymap("n", "<leader>x<leader>", function() require("trouble").toggle() end, { desc = "Show trouble" })
keymap("n", "<leader>xn", function() require("trouble").next({skip_groups = true, jump = true}) end, { desc = "Jump to next trouble" })
keymap("n", "<leader>xb", function() require("trouble").toggle("document_diagnostics") end, { desc = "Buffer diagnostics" })
keymap("n", "<leader>xN", function() require("trouble").next({skip_groups = true, jump = true}) end, { desc = "Jump to previous trouble" })
keymap("n", "<leader>xl", function() require("trouble").toggle("lsp_references") end, { desc = "Lsp references" })

-- Resize
keymap("n", "<C-Up>", ":resize +2<CR>", { silent = true, desc = "Increase window height" })
keymap("n", "<C-Down>", ":resize -2<CR>", { silent = true, desc = "Decrease window height" })
keymap("n", "<C-Left>", ":vertical :resize -2<CR>", { silent = true, desc = "Decrease window width" })
keymap("n", "<C-Right>", ":vertical :resize +2<CR>", { silent = true, desc = "Increase window width" })

-- Clangd
keymap("n", "<F4>", "<cmd>ClangdSwitchSourceHeader<CR>", { silent = true, desc = "Switch source/header cpp" })


------------------------ Insert Mode -------------------------------------------

------------------------ Visual Mode -------------------------------------------

------------------------ Visual Block Mode -------------------------------------

------------------------ Terminal Mode -----------------------------------------
-- <C-\>: toggle terminal window
keymap('t', '<esc>', [[<C-\><C-n>]], { silent = true })
