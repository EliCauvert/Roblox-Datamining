local corePackagesService = game:GetService("CorePackages")

return if require(script.Parent.Parent.Flags.FFlagTopBarDeprecateGameInfoRodux) then nil else require(corePackagesService.Packages.Rodux).createReducer({
	name = require(corePackagesService.Workspace.Packages.RobloxTranslator):FormatByKey("CoreScripts.TopBar.GameNamePlaceHolder")
}, {
	[require(script.Parent.Parent.Actions.SetGameName).name] = function(_, p0) --[[ line: 22 ]]
		return { name = p0.gameName }
	end
})