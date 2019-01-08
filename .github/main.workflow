workflow "New workflow" {
  on = "push"
  resolves = ["run sh"]
}

action "run sh" {
  uses = "actions/bin/sh@master"
  args = "ls -al"
}
