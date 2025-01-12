local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local setup = {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
    },
    show_help = true, -- show help message on the command line when the popup is visible
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
    -- ["a"] = { "<cmd>Alpha<cr>", "Start Screen" },
    -- ["e"] = { "<cmd>NvimTreeToggle<cr>", "File Explorer" },
    -- ["w"] = { "<cmd>w!<CR>", "Save" },
    -- ["q"] = { "<cmd>q!<CR>", "Quit" },
    -- ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
    -- ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
    -- ["P"] = { "<cmd>set spell!<cr>", "sPell Toggle" },
    -- ["d"] = { "<cmd>lua require('notify').dismiss({ silent = true, pending = true })<cr>", "Dismiss Notifications" },
    -- ["n"] = { "<cmd>Navbuddy<cr>", "Navigate"},


    U = {
        name = "Useless",
        s = { "<cmd>PetsNewCustom slime green green_slime<cr>", "Slime"},
        r = { "<cmd>CellularAutomaton make_it_rain<cr>", "Rain"},
        h = { "<cmd>HackFollow<cr>", "Hack into FBI"},
        -- c = { "<cmd>lua require('duck').hatch()<cr>", "Hatch" },
        -- i = { "<cmd>lua require('duck').cook()<cr>", "Cook" },
    },

    p = {
        name = "Packer",
        c = { "<cmd>PackerCompile<cr>", "Compile" },
        i = { "<cmd>PackerInstall<cr>", "Install" },
        s = { "<cmd>PackerSync<cr>", "Sync" },
        S = { "<cmd>PackerStatus<cr>", "Status" },
        u = { "<cmd>PackerUpdate<cr>", "Update" },
    },
    -- L = {
    --     name = "Legendary",
    --     L = { "<cmd>Legendary<cr>", "Legendary" },
    --     c = { "<cmd>Legendary commands<cr>", "Commands" },
    --     f = { "<cmd>Legendary functions<cr>", "Functions" },
    --
    -- },
    -- l = { -- DEFINED IN "lspkeymaps.lua instead"},
    s = {
        name = "Search",
        b = { "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
            "Buffers", },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        s = { "<cmd>Telescope symbols<cr>", "Find Help" },
        C = { "<cmd>Telescope colorscheme<cr>", "Colorschemes" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        p = { "<cmd>lua require('telescope').extensions.neoclip.default()<cr>", "Neoclip"},
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        c = { "<cmd>Telescope commands<cr>", "Commands" },
        F = { "<cmd>Telescope live_grep theme=ivy<cr>", "Live Grep" },
        f = { "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{})<cr>",
            "Find files" }
    },

    t = {
        name = "Terminal",
        f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
        h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
        v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
    },
    S = {
        name = "Silicon Shot",
        s = {
            name = "Save to file",
            v = { function() require("silicon").visualise_api({}) end, "Take visual only" },
            s = { function() require("silicon").visualise_api({ visible = true }) end, "Get whole visible buffer" },
            l = { function() require("silicon").visualise_api({ show_buf = true }) end, "Take whole, highlight visual" },
        },
        c = {
            name = "Copy to clipboard",
            v = { function() require("silicon").visualise_api({ to_clip = true }) end, "Take visual only" },
            s = { function() require("silicon").visualise_api({ visible = true, to_clip = true }) end,
                "Get whole visible buffer" },
            l = { function() require("silicon").visualise_api({ show_buf = true, to_clip = true }) end,
                "Take whole, highlight visual" },
        },
        -- s = {"<cmd>Silicon!<cr>", "Save to file"},
        -- c = {"<cmd>Silicon<cr>", "Copy to Clipboard"},
    }
}


local visual_opts = {
    mode = "v", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local visual_mappings = {
    ["a"] = { "<cmd>Alpha<cr>", "Start Screen" },
    ["e"] = { "<cmd>NvimTreeToggle<cr>", "File Explorer" },
    ["w"] = { "<cmd>w!<CR>", "Save" },
    ["q"] = { "<cmd>q!<CR>", "Quit" },
    ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
    ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
    ["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
    -- ["Z"] = { "<cmd>Goyo<CR><cmd>Twilight<CR>", "Focus Mode" },
    ["d"] = { "<cmd>lua require('notify').dismiss({ silent = true, pending = true })<CR>", "Dismiss Notifs" },
    -- D = {
    --     name = "Ducks",
    --     d = {"<cmd>lua require('duck').hatch()<cr>", 'Hatch'},
    --     k = {"<cmd>lua require('duck').cook()<cr>", 'Kill'},
    -- },

    p = {
        name = "Packer",
        c = { "<cmd>PackerCompile<cr>", "Compile" },
        i = { "<cmd>PackerInstall<cr>", "Install" },
        s = { "<cmd>PackerSync<cr>", "Sync" },
        S = { "<cmd>PackerStatus<cr>", "Status" },
        u = { "<cmd>PackerUpdate<cr>", "Update" },
    },
    -- l = { -- DEFINED IN "lsp/kemaps.lua instead"},
    s = {
        name = "Search",
        b = { "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
            "Buffers", },
        --       c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
        F = { "<cmd>Telescope live_grep theme=ivy<cr>", "Live Grep" },
        f = { "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{})<cr>",
            "Find files" }
    },

    t = {
        name = "Terminal",
        f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
        h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
        v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
    },
    S = {
        name = "Silicon Shot",
        -- v = {function() require("silicon").visualise_cmdline({}) end, "Take visual only"},
        s = {
            name = "Save to file",
            v = { function() require("silicon").visualise_api({}) end, "Take visual only" },
            s = { function() require("silicon").visualise_api({ visible = true }) end, "Get whole visible buffer" },
            l = { function() require("silicon").visualise_api({ show_buf = true }) end, "Take whole, highlight visual" },
        },
        c = {
            name = "Copy to clipboard",
            v = { function() require("silicon").visualise_api({ to_clip = true }) end, "Take visual only" },
            s = { function() require("silicon").visualise_api({ visible = true, to_clip = true }) end,
                "Get whole visible buffer" },
            l = { function() require("silicon").visualise_api({ show_buf = true, to_clip = true }) end,
                "Take whole, highlight visual" },
        },
    }
}

-- Compile and run feature
vim.api.nvim_create_autocmd("Filetype", {
    pattern = "cpp",
    callback = function()
        local complr = {
            r = {
                name = "Compiler",
                b = { "<cmd>2TermExec cmd='g++ % -o %:r'<cr>", "Build" },
                c = { "<cmd>2TermExec cmd='g++ % -c'<cr>", "Compile" },
                r = { "<cmd>2TermExec cmd='./%:r'<cr>", "Run" },
                R = { "<cmd>2TermExec cmd='g++ % -o %:r && ./%:r'<cr>", "Build and Run" }, -- Build with g++ and run
                -- m = {"<cmd>2TermExec cmd='cd $(dirname %) && make'<cr>", "Make"},        -- Change to current directory and make
                m = { "<cmd>2TermExec cmd='make'<cr>", "Make" }, -- Change to current directory and make
                B = { "<cmd>2TermExec cmd='g++ -std=c++11 % -o c11%:r'<cr>", "C++11 Build" },
            },
            d = {
                name = "Debug",
                u = { "<cmd>lua require('dapui').open()<cr>", "DAP UI" },
                b = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Breakpoint Toggle" },
                B = { "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
                    "Breakpoint Conditional" },
                l = { "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
                    "Log Point (Breakpoint)" },
                c = { "<Cmd>lua require'dap'.continue()<CR>", "Continue" },
                o = { "<Cmd>lua require'dap'.step_over()<CR>", "Step Over" },
                i = { "<Cmd>lua require'dap'.step_into()<CR>", "Step Into" },
                O = { "<Cmd>lua require'dap'.step_out()<CR>", "Step Out" },
                r = { "<Cmd>lua require'dap'.repl.open()<CR>", "Repl Open" },
                R = { "<Cmd>lua require'dap'.run_last()<CR>", "Run last" },
            }
        }
        which_key.register(complr, opts)
    end
})


vim.api.nvim_create_autocmd("Filetype", {
    pattern = "c",
    callback = function()
        local complr = {
            r = {
                name = "Compiler",
                b = { "<cmd>2TermExec cmd='gcc % -o %:r'<cr>", "Build" },
                c = { "<cmd>2TermExec cmd='gcc -std=c99 % -c'<cr>", "Compile" },
                r = { "<cmd>2TermExec cmd='./%:r'<cr>", "Run" },
                R = { "<cmd>2TermExec cmd='gcc -std=c99 % -o %:r && ./%:r'<cr>", "Build and Run" }, -- Build with g++ and run
                -- m = {"<cmd>2TermExec cmd='cd $(dirname %) && make'<cr>", "Make"},        -- Change to current directory and make
                m = { "<cmd>2TermExec cmd='make'<cr>", "Make" }, -- Change to current directory and make
                B = { "<cmd>2TermExec cmd='gcc -std=c99 % -o c99%:r'<cr>", "C99 Build" },
            },
        }
        which_key.register(complr, opts)
    end
})


vim.api.nvim_create_autocmd("Filetype", {
    pattern = "rust",
    callback = function()
        local complr = {
            b = {
                name = "Cargo",
                b = { "<cmd>2TermExec cmd='cargo build'<cr>", "Cargo Build" },
                r = { "<cmd>2TermExec cmd='cargo run'<cr>", "Cargo Run" },
--                R = { "<cmd>2TermExec cmd='rustc % && ./%:r'<cr>", "Build and Run" }, -- Build with g++ and run
                -- m = {"<cmd>2TermExec cmd='cd $(dirname %) && make'<cr>", "Make"},        -- Change to current directory and make
                -- m = { "<cmd>2TermExec cmd='make'<cr>", "Make" }, -- Change to current directory and make
                -- B = { "<cmd>2TermExec cmd='gcc -std=c99 % -o c99%:r'<cr>", "C99 Build" },
            },
            r = {
                name = "Compiler",
                b = { "<cmd>2TermExec cmd='rustc %'<cr>", "Compile" },
                r = { "<cmd>2TermExec cmd='./%:r'<cr>", "Run" },
                R = { "<cmd>2TermExec cmd='rustc % && ./%:r'<cr>", "Build and Run" }, -- Build with g++ and run
                -- m = {"<cmd>2TermExec cmd='cd $(dirname %) && make'<cr>", "Make"},        -- Change to current directory and make
                -- m = { "<cmd>2TermExec cmd='make'<cr>", "Make" }, -- Change to current directory and make
                -- B = { "<cmd>2TermExec cmd='gcc -std=c99 % -o c99%:r'<cr>", "C99 Build" },
            },
        }
        which_key.register(complr, opts)
    end
})


vim.api.nvim_create_autocmd("Filetype", {
    pattern = "python",
    callback = function()
        local complr = {
            r = {
                name = "Run",
                r = { "<cmd>2TermExec cmd='python %'<cr>", "Run" },
                p = {"<cmd>2TermExec cmd='poetry run python %'<cr>", "Poetry Run"}
            }
        }
        which_key.register(complr, opts)
    end
})

vim.api.nvim_create_autocmd("Filetype", {
    pattern = "tex",
    callback = function()
        local complr = {
            r = {
                name = "LaTeX Functions",
                w = { "<cmd>w !detex %|wc -w<cr>", "Word Count" }
            }
        }
        which_key.register(complr, opts)
    end
})

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(visual_mappings, visual_opts)
