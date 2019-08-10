workflow "Create Release Draft" {
  resolves = ["toolmantim/release-drafter@v5.2.0"]
  on = "push"
}

action "Release Draft" {
  uses = "toolmantim/release-drafter@v5.2.0"
  secrets = ["GITHUB_TOKEN"]
}
