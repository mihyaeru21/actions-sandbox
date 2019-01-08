workflow "New workflow" {
  on = "push"
  resolves = ["cpu-mem"]
}

action "run sh" {
  uses = "actions/bin/sh@master"
  args = ["ls -al"]
}

action "cat" {
  uses = "actions/bin/sh@master"
  needs = ["run sh"]
  args = ["cat LICENSE"]
}

action "echo" {
  uses = "actions/bin/sh@master"
  args = ["echo $HOGE"]
  env = {
    HOGE = "環境変数だよ"
  }
  needs = ["cat"]
}

action "uname" {
  uses = "actions/bin/sh@master"
  needs = ["echo"]
  args = ["uname -a"]
}

action "cpu-mem" {
  uses = "actions/bin/sh@master"
  needs = ["uname"]
  args = ["cat /proc/cpuinfo; cat /proc/meminfo"]
}
