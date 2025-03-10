return {
  "snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[
███╗   ██╗██╗ ██████╗██╗  ██╗
████╗  ██║██║██╔════╝██║ ██╔╝
██╔██╗ ██║██║██║     █████╔╝ 
██║╚██╗██║██║██║     ██╔═██╗ 
██║ ╚████║██║╚██████╗██║  ██╗
╚═╝  ╚═══╝╚═╝ ╚═════╝╚═╝  ╚═╝]],
        keys = {
          { icon = "🎠", title = "- My little toys -" },
          { icon = " ", key = "lt", desc = "Play a Game", action = ":Leet" },
          { icon = " ", key = "f", desc = "Find file", action = ":Telescope find_files" },
          { icon = " ", key = "p", desc = "Preview image", action = ":Telescope media_files" },
          { icon = " ", key = "n", desc = "New file", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find text", action = ":Telescope live_grep" },
          { icon = " ", key = "r", desc = "Recent files", action = ":Telescope oldfiles" },
          { icon = " ", key = "c", desc = "Config", action = ":Telescope find_files cwd=~/.config/nvim" },
          { icon = " ", key = "s", desc = "Restore session", section = "session" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        {
          section = "terminal",
          cmd = [[
            clear;
            export COLORTERM=truecolor;
            lines=$(tput lines);
            cols=$(tput cols);
            height=$(( cols * 9 / 16 ));

            if [ $height -gt $lines ]; then height=$lines; fi

            top_padding=$(( (lines - height) / 7));

            printf '\n%.0s' $(seq 1 $top_padding);

            chafa ~/.config/nvim/lua/assets/avatar.jpg --symbols vhalf --size 50x50;
            sleep .1
          ]],
          height = 50,
          padding = 0,
        },
        {
          pane = 2,
          {
            section = "header",
          },
        },
        {
          pane = 2,
          {
            section = "keys",
            padding = 1,
            gap = 1,
          },
        },
        {
          pane = 2,
          icon = " ",
          title = "- Recent files -",
          section = "recent_files",
          indent = 5,
          padding = { 2, 1 },
          gap = 1,
        },
        {
          pane = 2,
          icon = " ",
          title = "- Projects -",
          section = "projects",
          indent = 5,
          padding = { 2, 1 },
          gap = 1,
        },
        { pane = 2, section = "startup" },
      },
    },
    bigfile = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
