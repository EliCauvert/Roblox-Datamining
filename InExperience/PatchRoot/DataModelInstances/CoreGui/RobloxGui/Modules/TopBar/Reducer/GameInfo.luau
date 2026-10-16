local CorePackages = game:GetService("CorePackages")
local RoduxModule = require(CorePackages.Packages.Rodux)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local SetGameNameModule = require(script.Parent.Parent.Actions.SetGameName)

return if require(script.Parent.Parent.Flags.FFlagTopBarDeprecateGameInfoRodux) then nil else RoduxModule.createReducer({
	name = RobloxTranslatorModule:FormatByKey("CoreScripts.TopBar.GameNamePlaceHolder")
}, {
	[SetGameNameModule.name] = function(_, p1) --[[ Line: 22 ]]
		return { name = p1.gameName }
	end
})