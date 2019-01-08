workflow "New workflow" {
  on = "push"
  resolves = ["\tactions/bin/sh@master"]
}

action "run sh" {
  uses = "actions/bin/sh@master"
  args = ["ls -al"]
}

action "\tactions/bin/sh@master" {
  uses = "\tactions/bin/sh@master"
  needs = ["run sh"]
}
