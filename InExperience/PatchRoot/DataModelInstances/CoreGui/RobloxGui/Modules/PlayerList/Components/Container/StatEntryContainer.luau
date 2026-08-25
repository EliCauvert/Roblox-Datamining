local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local gameTranslatorModule = require(coreGuiService:WaitForChild("RobloxGui").Modules.GameTranslator)
local reactModule = require(corePackagesService.Packages.React)
local cryoModule = require(corePackagesService.Packages.Cryo)
local signalsModule = require(corePackagesService.Packages.Signals)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local _ = require(corePackagesService.Workspace.Packages.LeaderboardStore)
local useLeaderboardStore = playerListModule.Hooks.useLeaderboardStore
local statEntryView = playerListModule.Presentation.StatEntryView

return reactModule.memo(function(p0)
	-- upvalues: useLeaderboardStore (ref), reactModule (ref), gameTranslatorModule (ref), coreGuiService (ref), signalsReactModule (ref), signalsModule (ref), cryoModule (ref), statEntryView (ref)
	local data = useLeaderboardStore().getGameStatsList().getData(p0.statName, false)
	
	return reactModule.createElement(statEntryView, cryoModule.Dictionary.join({
		statName = reactModule.useMemo(function()
			-- upvalues: gameTranslatorModule (copy), coreGuiService (copy), p0 (ref)
			return gameTranslatorModule:TranslateGameText(coreGuiService, p0.statName)
		end, { p0.statName }),
		statValue = signalsReactModule.useSignalBinding(signalsModule.createComputed(function(p1)
			-- upvalues: p0 (ref)
			return if p0.stat then p0.stat(p1) else "-"
		end)),
		layoutOrder = signalsReactModule.useSignalBinding(signalsModule.createComputed(function(p2)
			-- upvalues: data (ref)
			return if data then data.order(p2) else 1e999
		end))
	}, p0))
end)