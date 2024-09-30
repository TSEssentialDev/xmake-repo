package("tellurium_scriptx")
    add_urls("https://github.com/TelluriumDev/ScriptX.git")
    add_versions("1.0.0", "abe9bc4c0b83727bf04c1af838951c05226fb65f")

    add_configs("backend", {default = "lua", values = {"lua", "quickjs"}})
    add_includedirs(
        "include/src/include/"
    )

    on_install(function (package)
        local configs = {
            backend = package:config("backend"),
        }
        import("package.tools.xmake").install(package, configs)
    end)

    on_load(function (package)
        local backend = package:config("backend")

        local deps = {
            Lua = "lua",
            quickjs = "quickjs",
        }

        print("Using ScriptX config: backend=" .. backend)
    
        package:add("defines", "SCRIPTX_BACKEND=" .. backend)
        package:add("defines", "SCRIPTX_BACKEND_TRAIT_PREFIX=../backend/" .. backend .. "/trait/Trait")
        package:add("deps", deps[backend])
    end)