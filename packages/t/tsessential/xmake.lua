package("tsessential")
    add_urls("https://github.com/TSEssentialDev/TSEssential/releases/download/v$(version)/SDK.zip")

    on_install(function (package)
        os.cp("include", package:installdir())
        os.cp("lib/*.lib", package:installdir("lib"))
    end)
