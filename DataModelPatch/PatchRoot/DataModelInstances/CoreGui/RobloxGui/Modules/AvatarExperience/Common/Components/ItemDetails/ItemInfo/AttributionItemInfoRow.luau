local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local ItemInfoRowModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.ItemInfo.ItemInfoRow)
local _ = require(CorePackages.Workspace.Packages.PlayabilityRodux)
local GameIconReducer = require(CorePackages.Workspace.Packages.GameIconRodux).GameIcons.GameIconReducer
local _ = require(Modules.AvatarExperience.Common.Types)
local AttributionConstantsModule = require(Modules.AvatarExperience.Catalog.AttributionConstants)

return (require(CorePackages.Packages.RoactRodux).connect(function(p1, p2)
	-- upvalues: GameIconReducer (copy)
	local v1 = p1[GameIconReducer.key][p2.creatingUniverseId]
	
	return { thumbnailUrl = if v1 then v1.url else nil }
end)((require(Modules.LuaApp.Common.Experience.Connectors.LaunchExperienceConnector).connect(function(p1)
	return {
		launchSource = "AttributionItemRow",
		referralSource = "ItemDetailsPage",
		extraParams = if p1.gameJoinContext then { gameJoinContext = p1.gameJoinContext } else nil,
		universeId = p1.creatingUniverseId
	}
end, function(p1, _)
	return {
		playabilityStatus = p1.playabilityStatus,
		playButtonState = p1.playButtonState,
		gameName = p1.gameName,
		onPlayButtonActivated = p1.onPlayButtonActivated
	}
end)((ReactModule.forwardRef(function(Frame, _)
	-- upvalues: AttributionConstantsModule (copy), UseNavigationFunction (copy), AvatarScreen (copy), ReactModule (copy), Focusable (copy), ItemInfoRowModule (copy)
	local ShowPlayableAttributionMapperEntry = nil
	local ShowTraversalAlertMapperEntry = nil
	
	if Frame.playabilityStatus then
		local PlayabilityStatus = Frame.playabilityStatus.playabilityStatus
		ShowPlayableAttributionMapperEntry = AttributionConstantsModule.ShowPlayableAttributionMapper[PlayabilityStatus]
		ShowTraversalAlertMapperEntry = AttributionConstantsModule.ShowTraversalAlertMapper[PlayabilityStatus]
	end
	local UseNavigationResult = UseNavigationFunction()
	
	local function onClickAttribution()
		-- upvalues: ShowTraversalAlertMapperEntry (ref), UseNavigationResult (copy), AvatarScreen (upval), Frame (copy)
		if ShowTraversalAlertMapperEntry then
			UseNavigationResult.navigate(AvatarScreen.OpenExperienceTraversalPrompt, {
				onPlayButtonActivated = Frame.onPlayButtonActivated,
				gameName = Frame.gameName,
				gameUniverseId = Frame.creatingUniverseId,
				thumbnailUrl = Frame.thumbnailUrl
			})
			
			return
		else
			Frame.onPlayButtonActivated()
		end
	end
	
	return ShowPlayableAttributionMapperEntry and ReactModule.createElement(Focusable[ItemInfoRowModule], {
		infoName = Frame.infoName,
		infoData = if Frame.gameName then Frame.gameName else "",
		onActivate = onClickAttribution,
		LayoutOrder = Frame.LayoutOrder,
		hideDivider = Frame.hideDivider,
		ref = Frame.attributionRef,
		NextSelectionUp = Frame.NextSelectionUp,
		NextSelectionDown = Frame.NextSelectionDown
	})
end))))))