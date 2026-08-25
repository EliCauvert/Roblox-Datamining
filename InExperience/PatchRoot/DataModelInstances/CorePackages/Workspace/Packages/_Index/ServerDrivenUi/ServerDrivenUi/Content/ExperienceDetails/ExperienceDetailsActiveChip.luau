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

return reactModule.memo(function(p0)
	-- upvalues: signalsReactModule (ref), dataHydrationModule (ref), usePlayerCountText (ref), useLocalization (ref), useNavigateToServersModule (ref), reactModule (ref), playersService (ref), gameDetailsSubpage (ref), sduiChip (ref), foundationModule (ref)
	local layoutOrder = p0.layoutOrder
	local universeId = p0.universeId
	local var11 = signalsReactModule.useSignalState(dataHydrationModule.Game.getGameInfoStore(false).getAndFetchGameInfo(universeId).data)
	local var12 = useNavigateToServersModule(universeId)
	
	return reactModule.createElement(sduiChip, {
		text = useLocalization({
			numActivePlayers = {
				"Feature.GameDetails.Label.LowercaseNumberPlaying",
				numActivePlayers = usePlayerCountText(if var11 then var11.playerCount else 0)
			}
		}).numActivePlayers,
		layoutOrder = layoutOrder,
		leadingIconName = foundationModule.Enums.IconName.TwoPeople,
		onActivated = reactModule.useCallback(function()
			-- upvalues: var11 (ref), playersService (copy), gameDetailsSubpage (copy), universeId (ref), var12 (ref)
			local rootPlaceId = var11 and var11.rootPlaceId
			
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
			var12()
		end, { universeId, var11, var12 })
	})
end)