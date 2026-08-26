local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local playersService = game:GetService("Players")
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local signalsReactModule = require(parent.SignalsReact)
local dataHydrationModule = require(parent.DataHydration)
local sduiSharedContentModule = require(parent.SduiSharedContent)
local gameTileModule = require(parent.GameTile)
local localizationModule = require(parent.Localization)
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local sduiChip = sduiSharedContentModule.SduiChip
local usePlayerCountText = gameTileModule.usePlayerCountText
local useLocalization = localizationModule.Hooks.useLocalization
local gameDetailsSubpage = discoveryAnalyticsModule.Events.gameDetailsSubpage
local useNavigateToServersModule = require(serverDrivenUi.Content.ExperienceDetails.Hooks.useNavigateToServers)

return reactModule.memo(function(p1)
	-- upvalues: signalsReactModule (ref), dataHydrationModule (ref), usePlayerCountText (ref), useLocalization (ref), useNavigateToServersModule (ref), reactModule (ref), playersService (ref), gameDetailsSubpage (ref), sduiChip (ref), foundationModule (ref)
	local layoutOrder = p1.layoutOrder
	local universeId = p1.universeId
	local var1 = signalsReactModule.useSignalState(dataHydrationModule.Game.getGameInfoStore(false).getAndFetchGameInfo(universeId).data)
	local var2 = useNavigateToServersModule(universeId)
	
	return reactModule.createElement(sduiChip, {
		text = useLocalization({
			numActivePlayers = {
				"Feature.GameDetails.Label.LowercaseNumberPlaying",
				numActivePlayers = usePlayerCountText(if var1 then var1.playerCount else 0)
			}
		}).numActivePlayers,
		layoutOrder = layoutOrder,
		leadingIconName = foundationModule.Enums.IconName.TwoPeople,
		onActivated = reactModule.useCallback(function()
			-- upvalues: var1 (ref), playersService (copy), gameDetailsSubpage (copy), universeId (ref), var2 (ref)
			local rootPlaceId = var1 and var1.rootPlaceId
			
			if rootPlaceId then
				gameDetailsSubpage({
					subpage = "Servers",
					action = "open",
					ctx = "ExperienceDetailsActiveCountChip",
					uid = tostring(playersService.LocalPlayer and playersService.LocalPlayer.UserId),
					universeId = universeId,
					placeId = tostring(rootPlaceId)
				}, "ExperienceDetailsActiveCountChip")
			end
			var2()
		end, { universeId, var1, var2 })
	})
end)