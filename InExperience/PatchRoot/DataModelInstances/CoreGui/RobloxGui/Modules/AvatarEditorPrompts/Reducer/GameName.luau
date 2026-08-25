local corePackagesService = game:GetService("CorePackages")
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")

return require(corePackagesService.Packages.Rodux).createReducer(require(corePackagesService.Workspace.Packages.RobloxTranslator):FormatByKey("CoreScripts.AvatarEditorPrompts.GameNamePlaceHolder"), {
	[require(script.Parent.Parent.Actions.GameNameFetched).name] = function(_, p0)
		return p0.gameName
	end
})