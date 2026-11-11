local CorePackages = game:GetService("CorePackages")
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")

return require(CorePackages.Packages.Rodux).createReducer(require(CorePackages.Workspace.Packages.RobloxTranslator):FormatByKey("CoreScripts.AvatarEditorPrompts.GameNamePlaceHolder"), {
	[require(script.Parent.Parent.Actions.GameNameFetched).name] = function(_, p1)
		return p1.gameName
	end
})