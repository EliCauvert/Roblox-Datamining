local CorePackages = game:GetService("CorePackages")

return {
	SocialLibraries = require(CorePackages.Packages.LuaSocialLibrariesDeps).SocialLibraries.config({}),
	ShareLinksRodux = require(CorePackages.Workspace.Packages.ShareLinksRodux).config({})
}