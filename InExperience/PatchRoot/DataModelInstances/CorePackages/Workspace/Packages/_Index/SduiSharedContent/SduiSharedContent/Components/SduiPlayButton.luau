local sduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local parent = sduiSharedContent.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local playButton = require(parent.GamePlayButton).PlayButton
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local executeAction = sduiCoreSystemModule.executeAction
local findAnalyticsField = sduiCoreSystemModule.findAnalyticsField
local sduiActionType = sduiCoreSystemModule.SduiActionType
local getSduiActionHandlerRegistry = sduiCoreSystemModule.getSduiActionHandlerRegistry
local useSduiReportExperienceLaunchedModule = require(sduiSharedContent.Components.useSduiReportExperienceLaunched)
local getSduiFocusActivationStore = require(parent.SduiSharedUtilities).getSduiFocusActivationStore
local appPage = require(parent.RobloxAppEnums).AppPage
local fFlagLuaAppResetHoverOnSduiPlayButtonActivation = require(parent.SharedFlags).FFlagLuaAppResetHoverOnSduiPlayButtonActivation
local fFlagLuaAppLaunchWhenLoadingEdp = require(parent.SharedFlags).FFlagLuaAppLaunchWhenLoadingEdp
local fFlagEnableGameJoinEarlyAccess = require(parent.SharedFlags).FFlagEnableGameJoinEarlyAccess

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), getSduiActionHandlerRegistry (ref), sduiActionType (ref), findAnalyticsField (ref), useSduiReportExperienceLaunchedModule (ref), fFlagLuaAppResetHoverOnSduiPlayButtonActivation (ref), executeAction (ref), getSduiFocusActivationStore (ref), fFlagEnableGameJoinEarlyAccess (ref), appPage (ref), playButton (ref), cryoModule (ref), fFlagLuaAppLaunchWhenLoadingEdp (ref)
	local analyticsContext = p1.analyticsContext
	local var1 = reactModule.useCallback(function()
		-- upvalues: getSduiActionHandlerRegistry (copy), sduiActionType (copy), p1 (ref)
		local actionHandlerConfig = getSduiActionHandlerRegistry().getActionHandlerConfig(sduiActionType.OpenGameDetails)
		
		if actionHandlerConfig and actionHandlerConfig.handler then
			actionHandlerConfig.handler(nil, p1.analyticsContext, p1.sduiContext)
		end
	end, { p1.sduiContext, p1.analyticsContext })
	local placeId = p1.placeId or p1.rootPlaceId
	local var2 = fFlagEnableGameJoinEarlyAccess and (if p1.sduiContext.appPage ~= appPage.ExperienceDetail then p1.sduiContext.appPage == appPage.GameDetail else true)
	
	return reactModule.createElement(playButton, cryoModule.Dictionary.join(p1, {
		AnchorPoint = p1.anchorPoint,
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		tag = p1.tag,
		expandWidthForSecondaryPlayButton = p1.expandWidthForSecondaryPlayButton,
		preferSecondaryPlayButton = p1.preferSecondaryPlayButton,
		onRegisterActivation = reactModule.useCallback(function(p2)
			-- upvalues: p1 (ref), getSduiFocusActivationStore (copy)
			local tag = p1.tag
			
			return if tag == nil then function() end else getSduiFocusActivationStore().register(tag, p2)
		end, { p1.tag }),
		fetchDelayInSeconds = p1.fetchDelayInSeconds or 0.1,
		universeId = p1.universeId,
		placeId = p1.placeId,
		useUIBloxButton = p1.enableUiBloxButton,
		reportExperienceLaunched = useSduiReportExperienceLaunchedModule(p1.sduiContext, p1.analyticsContext, p1.universeId, placeId, p1.rootPlaceId or placeId, p1.appliedFilters, if p1.experienceJoinData then p1.experienceJoinData.launchData else nil),
		onPurchaseRequiredCallback = if p1.openGameDetailsOnPurchaseRequired then var1 else nil,
		onActivated = reactModule.useCallback(function()
			-- upvalues: fFlagLuaAppResetHoverOnSduiPlayButtonActivation (copy), p1 (ref), sduiActionType (copy), executeAction (copy), analyticsContext (ref)
			if fFlagLuaAppResetHoverOnSduiPlayButtonActivation and p1.onActivatedEffect then
				p1.onActivatedEffect()
			end
			executeAction({ actionType = sduiActionType.PlayButtonClick }, analyticsContext, p1.sduiContext)
		end, {
			analyticsContext,
			p1.sduiContext,
			if fFlagLuaAppResetHoverOnSduiPlayButtonActivation then p1.onActivatedEffect else nil
		}),
		referralSource = findAnalyticsField("referralSource", analyticsContext.analyticsData),
		eventContext = findAnalyticsField("eventContext", analyticsContext.analyticsData, "ExperienceTile"),
		launchSource = findAnalyticsField("launchSource", analyticsContext.analyticsData),
		launchWhenLoading = if fFlagLuaAppLaunchWhenLoadingEdp then p1.launchWhenLoading else nil,
		launchOnReleaseAfterUnmount = p1.launchOnReleaseAfterUnmount,
		enableEarlyAccessPlusTooltip = if fFlagEnableGameJoinEarlyAccess and var2 then true else nil,
		enableEarlyAccessState = if fFlagEnableGameJoinEarlyAccess and p1.enableEarlyAccessState ~= nil then p1.enableEarlyAccessState elseif fFlagEnableGameJoinEarlyAccess and var2 then true else nil
	}))
end)