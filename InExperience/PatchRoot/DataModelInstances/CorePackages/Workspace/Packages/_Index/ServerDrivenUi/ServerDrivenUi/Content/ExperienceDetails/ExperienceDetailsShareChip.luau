local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local signalsReactModule = require(parent.SignalsReact)
local game = require(parent.DataHydration).Game
local sduiChip = require(parent.SduiSharedContent).SduiChip
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useExperienceDetailsShareModule = require(serverDrivenUi.Content.ExperienceDetails.Hooks.useExperienceDetailsShare)

return reactModule.memo(function(p1)
	-- upvalues: useLocalization (ref), signalsReactModule (ref), game (ref), useExperienceDetailsShareModule (ref), reactModule (ref), sduiChip (ref), foundationModule (ref)
	local layoutOrder = p1.layoutOrder
	local universeId = p1.universeId
	local var1 = signalsReactModule.useSignalState(game.getGameInfoStore(false).getAndFetchGameInfo(universeId).data)
	
	return reactModule.createElement(sduiChip, {
		text = useLocalization({ share = "Feature.SocialShare.Action.Share" }).share,
		leadingIconName = foundationModule.Enums.IconName.ArrowThickToRight,
		onActivated = useExperienceDetailsShareModule(universeId, if var1 then var1.rootPlaceId else nil, "ExperienceDetailsShareChip"),
		layoutOrder = layoutOrder
	})
end)