local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local Players = game:GetService("Players")
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SignalsReactModule = require(Parent.SignalsReact)
local DataHydrationModule = require(Parent.DataHydration)
local SduiChip = require(Parent.SduiSharedContent).SduiChip
local UsePlayerCountTextFunction = require(Parent.GameTile).usePlayerCountText
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local GameDetailsSubpageFunction = require(Parent.DiscoveryAnalytics).Events.gameDetailsSubpage
local UseNavigateToServersModule = require(ServerDrivenUi.Content.ExperienceDetails.Hooks.useNavigateToServers)

return ReactModule.memo(function(p1) --[[ Line: 26 | Named "ExperienceDetailsActiveCountChip" ]]
	-- upvalues: SignalsReactModule (copy), DataHydrationModule (copy), UsePlayerCountTextFunction (copy), UseLocalizationFunction (copy), UseNavigateToServersModule (copy), ReactModule (copy), Players (copy), GameDetailsSubpageFunction (copy), SduiChip (copy), FoundationModule (copy)
	local LayoutOrder = p1.layoutOrder
	local UniverseId = p1.universeId
	local UseSignalStateResult = SignalsReactModule.useSignalState(DataHydrationModule.Game.getGameInfoStore(false).getAndFetchGameInfo(UniverseId).data)
	local UseLocalizationResult = UseLocalizationFunction({
		numActivePlayers = {
			"Feature.GameDetails.Label.LowercaseNumberPlaying",
			numActivePlayers = UsePlayerCountTextFunction(UseSignalStateResult and UseSignalStateResult.playerCount or 0)
		}
	})
	local UseNavigateToServersModuleResult = UseNavigateToServersModule(UniverseId)
	
	return ReactModule.createElement(SduiChip, {
		text = UseLocalizationResult.numActivePlayers,
		layoutOrder = LayoutOrder,
		leadingIconName = FoundationModule.Enums.IconName.TwoPeople,
		onActivated = ReactModule.useCallback(function() --[[ Line: 41 ]]
			-- upvalues: UseSignalStateResult (copy), Players (upval), GameDetailsSubpageFunction (upval), UniverseId (copy), UseNavigateToServersModuleResult (copy)
			local RootPlaceId = UseSignalStateResult and UseSignalStateResult.rootPlaceId
			
			if RootPlaceId then
				GameDetailsSubpageFunction({
					subpage = "Servers",
					action = "open",
					ctx = "ExperienceDetailsActiveCountChip",
					uid = tostring(Players.LocalPlayer and Players.LocalPlayer.UserId),
					universeId = UniverseId,
					placeId = tostring(RootPlaceId)
				}, "ExperienceDetailsActiveCountChip")
			end
			UseNavigateToServersModuleResult()
		end, {
			UniverseId,
			UseSignalStateResult,
			UseNavigateToServersModuleResult
		})
	})
end)