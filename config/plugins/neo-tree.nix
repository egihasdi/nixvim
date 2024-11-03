let
  icons = {
    GitAdd = "";
    GitBranch = "";
    GitChange = "";
    GitConflict = "";
    GitDelete = "";
    GitIgnored = "◌";
    GitRenamed = "➜";
    GitSign = "▎";
    GitStaged = "✓";
    GitUnstaged = "✗";
    GitUntracked = "★";
  };
in {
  plugins.neo-tree = {
    enable = true;
    enableGitStatus = true;
    eventHandlers = {
      neo_tree_buffer_enter = ''
        function()
          vim.opt_local.number = true;
          vim.opt_local.relativenumber = true;
          vim.opt_local.signcolumn = "auto";
          vim.opt_local.foldcolumn = "0";
        end
      '';
    };

    defaultComponentConfigs = {
      indent = {
        indentSize = 1;
        padding = 1;
      };
    };
    window = {
      position = "left";
      width = 180;
      mappings = {
        h = "parent_or_close";
        l = "child_or_open";
        F = "find_file_in_dir";
      };
    };
    extraOptions = {
      open_files_do_not_replace_types = [ "terminal" "Trouble" "qf" "edgy" ];
      commands = {
        child_or_open.__raw = ''
          function(state)
            local node = state.tree:get_node()
            if node:has_children() then
              if not node:is_expanded() then -- if unexpanded, expand
              state.commands.toggle_node(state)
              else -- if expanded and has children, select the next child
              if node.type == "file" then
                state.commands.open(state)
              else
                require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
              end
              end
            else -- if has no children
              state.commands.open(state)
            end
          end
        '';
        parent_or_close.__raw = ''
          function(state)
            local node = state.tree:get_node()
            if node:has_children() and node:is_expanded() then
              state.commands.toggle_node(state)
            else
              require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
            end
          end
        '';
        find_file_in_dir.__raw = ''
          function(state)
            local node = state.tree:get_node()
            local path = node.type == "file" and node:get_parent_id() or node:get_id()
            require("telescope.builtin").find_files({ cwd = path })          
          end
        '';
      };

    };

    # Sources tabs
    # sourceSelector = {
    #   # Label position
    #   contentLayout.__raw = "'center'";
    #
    #   # No tabs separator
    #   separator = "";
    #
    #   # Show tabs on winbar
    #   winbar = true;
    #
    #   # Sources to show and their labels
    #   sources = [
    #     {
    #       displayName = "Files";
    #       source = "filesystem";
    #     }
    #     {
    #       displayName = "Bufs";
    #       source = "buffers";
    #     }
    #     {
    #       displayName = "Git";
    #       source = "git_status";
    #     }
    #   ];
    # };
    defaultComponentConfigs = {
      gitStatus.symbols = {
        added = icons.GitAdd;
        conflict = icons.GitConflict;
        deleted = icons.GitDelete;
        ignored = icons.GitIgnored;
        modified = icons.GitChange;
        renamed = icons.GitRenamed;
        staged = icons.GitStaged;
        unstaged = icons.GitUnstaged;
        untracked = icons.GitUntracked;
      };
    };
  };
}
