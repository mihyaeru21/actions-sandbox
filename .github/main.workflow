workflow "New workflow" {
  on = "push"
  resolves = ["echo"]
}

action "run sh" {
  uses = "actions/bin/sh@master"
  args = ["ls -al"]
}

action "cat" {
  uses = "actions/bin/sh@master"
  needs = ["run sh"]
  args = "[\"cat LICENSE\"]"
}

action "echo" {
  uses = "actions/bin/sh@master"
  args = "[\"echo $HOGE\"]"
  env = {
    HOGE = "環境変数だよ"
  }
  needs = ["cat"]
}
