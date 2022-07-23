package = "kong-plugin-auth-middleware"

version = "1.0.1-1"

supported_platforms = {"linux", "macosx"}

source = {
  url = "git://github.com/gialynguyen/gln-space.git",
  branch = "master"
}

description = {
  summary = "A Kong plugin that make GET auth request before proxying the original.",
  license = "MIT"
}

dependencies = {
  "lua ~> 5"
}

build = {
  type = "builtin",
  modules = {
    ["kong.plugins.kong-auth-middleware.access"] = "src/access.lua",
    ["kong.plugins.kong-auth-middleware.handler"] = "src/handler.lua",
    ["kong.plugins.kong-auth-middleware.schema"] = "src/schema.lua"
  }
}
