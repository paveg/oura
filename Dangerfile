# frozen_string_literal: true

def check_rubocop
  files = git.modified_files + git.added_files
  rubocop.lint(files: files, force_exclusion: true, report_danger: true)
end

check_rubocop
