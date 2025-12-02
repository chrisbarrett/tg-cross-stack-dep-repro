terraform {
  source = find_in_parent_folders("_modules/trivial")
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

dependency "cross_stack" {
  config_path = "../dep-stack/.terragrunt-stack/trivial"
  mock_outputs = {
    out = "hello"
  }
}

inputs = {
  test = dependency.cross_stack.outputs.out
}
