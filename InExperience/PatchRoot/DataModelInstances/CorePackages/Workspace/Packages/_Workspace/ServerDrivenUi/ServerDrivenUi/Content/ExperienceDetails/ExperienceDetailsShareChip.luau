local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SignalsReactModule = require(Parent.SignalsReact)
local Game = require(Parent.DataHydration).Game
local SduiChip = require(Parent.SduiSharedContent).SduiChip
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseExperienceDetailsShareModule = require(ServerDrivenUi.Content.ExperienceDetails.Hooks.useExperienceDetailsShare)

return ReactModule.memo(function(p1)
	-- upvalues: UseLocalizationFunction (copy), SignalsReactModule (copy), Game (copy), UseExperienceDetailsShareModule (copy), ReactModule (copy), SduiChip (copy), FoundationModule (copy)
	local UniverseId = p1.universeId
	local UseSignalStateResult = SignalsReactModule.useSignalState(Game.getGameInfoStore(false).getAndFetchGameInfo(UniverseId).data)
	
	return ReactModule.createElement(SduiChip, {
		text = UseLocalizationFunction({ share = "Feature.SocialShare.Action.Share" }).share,
		leadingIconName = FoundationModule.Enums.IconName.ArrowThickToRight,
		onActivated = UseExperienceDetailsShareModule(UniverseId, UseSignalStateResult and UseSignalStateResult.rootPlaceId or nil, "ExperienceDetailsShareChip"),
		layoutOrder = p1.layoutOrder
	})
end)