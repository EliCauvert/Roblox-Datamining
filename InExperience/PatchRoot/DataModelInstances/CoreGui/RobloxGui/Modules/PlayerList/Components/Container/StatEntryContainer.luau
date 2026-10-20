local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local GameTranslatorModule = require(CoreGui:WaitForChild("RobloxGui").Modules.GameTranslator)
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local SignalsModule = require(CorePackages.Packages.Signals)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local PlayerListModule = require(CorePackages.Workspace.Packages.PlayerList)
local _ = require(CorePackages.Workspace.Packages.LeaderboardStore)
local UseLeaderboardStoreFunction = PlayerListModule.Hooks.useLeaderboardStore
local StatEntryView = PlayerListModule.Presentation.StatEntryView

return ReactModule.memo(function(p1)
	-- upvalues: UseLeaderboardStoreFunction (copy), ReactModule (copy), GameTranslatorModule (copy), CoreGui (copy), SignalsReactModule (copy), SignalsModule (copy), CryoModule (copy), StatEntryView (copy)
	local Data = UseLeaderboardStoreFunction().getGameStatsList().getData(p1.statName, false)
	
	return ReactModule.createElement(StatEntryView, (CryoModule.Dictionary.join({
		statName = ReactModule.useMemo(function()
			-- upvalues: GameTranslatorModule (upval), CoreGui (upval), p1 (copy)
			return GameTranslatorModule:TranslateGameText(CoreGui, p1.statName)
		end, { p1.statName }),
		statValue = SignalsReactModule.useSignalBinding(SignalsModule.createComputed(function(p2)
			-- upvalues: p1 (copy)
			return if p1.stat then p1.stat(p2) else "-"
		end)),
		layoutOrder = SignalsReactModule.useSignalBinding(SignalsModule.createComputed(function(p2)
			-- upvalues: Data (copy)
			return if Data then Data.order(p2) else 1e999
		end))
	}, p1)))
end)