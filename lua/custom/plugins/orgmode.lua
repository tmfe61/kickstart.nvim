local meetingNotesTarget = "~/org/meeting-notes/%<%Y-%m-%d-%A>.org"
return {
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    config = function()
      -- Setup orgmode
      require("orgmode").setup({
        org_agenda_files = "~/org/**/*",
        org_default_notes_file = "~/org/refile.org",
        org_capture_templates = {
          t = {
            description = "Task",
            template = "* TODO %?\n  %u",
            taget = meetingNotesTarget,
          },
          m = "Meeting",
          mt = {
            description = "task",
            template = "* TODO %? :task:\n  [[file:%F]]",
            target = meetingNotesTarget,
          },
          mp = {
            description = "progress",
            template = "* TODO %? :progress:\n  [[file:%F]]",
            target = meetingNotesTarget,
          },
          mf = {
            description = "question",
            template = "* TODO %? :question:\n  [[file:%F]]",
            target = meetingNotesTarget,
          },
        },
      })

      -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
      -- add ~org~ to ignore_install
      -- require('nvim-treesitter.configs').setup({
      --   ensure_installed = 'all',
      --   ignore_install = { 'org' },
      -- })
    end,
  },
}
