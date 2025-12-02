terraform {
  source = find_in_parent_folders("_modules/trivial")
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

inputs = {}
