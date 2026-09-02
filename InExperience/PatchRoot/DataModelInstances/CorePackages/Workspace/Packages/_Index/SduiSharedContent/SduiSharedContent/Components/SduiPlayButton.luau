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
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local fFlagLuaAppResetHoverOnSduiPlayButtonActivation = require(parent.SharedFlags).FFlagLuaAppResetHoverOnSduiPlayButtonActivation
local fFlagLuaAppLaunchWhenLoadingEdp = require(parent.SharedFlags).FFlagLuaAppLaunchWhenLoadingEdp
local fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp = require(parent.SharedFlags).FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), getSduiActionHandlerRegistry (ref), sduiActionType (ref), findAnalyticsField (ref), fFlagSduiExperienceDetailsSupport (ref), useSduiReportExperienceLaunchedModule (ref), fFlagLuaAppResetHoverOnSduiPlayButtonActivation (ref), executeAction (ref), getSduiFocusActivationStore (ref), playButton (ref), cryoModule (ref), fFlagLuaAppLaunchWhenLoadingEdp (ref), fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp (ref)
	local analyticsContext = p1.analyticsContext
	local placeId = p1.placeId or p1.rootPlaceId
	
	return reactModule.createElement(playButton, cryoModule.Dictionary.join(p1, {
		AnchorPoint = p1.anchorPoint,
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		tag = if fFlagSduiExperienceDetailsSupport then p1.tag else nil,
		expandWidthForSecondaryPlayButton = p1.expandWidthForSecondaryPlayButton,
		preferSecondaryPlayButton = p1.preferSecondaryPlayButton,
		onRegisterActivation = if fFlagSduiExperienceDetailsSupport then if fFlagSduiExperienceDetailsSupport then reactModule.useCallback(function(p2)
			-- upvalues: p1 (ref), getSduiFocusActivationStore (copy)
			local tag = p1.tag
			
			return if tag == nil then function() end else getSduiFocusActivationStore().register(tag, p2)
		end, { p1.tag }) else nil else nil,
		fetchDelayInSeconds = p1.fetchDelayInSeconds or 0.1,
		universeId = p1.universeId,
		placeId = p1.placeId,
		useUIBloxButton = if fFlagSduiExperienceDetailsSupport then p1.enableUiBloxButton else nil,
		reportExperienceLaunched = useSduiReportExperienceLaunchedModule(p1.sduiContext, p1.analyticsContext, p1.universeId, placeId, p1.rootPlaceId or placeId, p1.appliedFilters, if fFlagSduiExperienceDetailsSupport then if fFlagSduiExperienceDetailsSupport and p1.experienceJoinData then p1.experienceJoinData.launchData else nil else nil),
		onPurchaseRequiredCallback = if p1.openGameDetailsOnPurchaseRequired then reactModule.useCallback(function()
			-- upvalues: getSduiActionHandlerRegistry (copy), sduiActionType (copy), p1 (ref)
			local actionHandlerConfig = getSduiActionHandlerRegistry().getActionHandlerConfig(sduiActionType.OpenGameDetails)
			
			if actionHandlerConfig and actionHandlerConfig.handler then
				actionHandlerConfig.handler(nil, p1.analyticsContext, p1.sduiContext)
			end
		end, { p1.sduiContext, p1.analyticsContext }) else nil,
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
		launchSource = if fFlagSduiExperienceDetailsSupport then if fFlagSduiExperienceDetailsSupport then findAnalyticsField("launchSource", analyticsContext.analyticsData) else nil else nil,
		launchWhenLoading = if fFlagLuaAppLaunchWhenLoadingEdp then p1.launchWhenLoading else nil,
		launchOnReleaseAfterUnmount = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp then p1.launchOnReleaseAfterUnmount else nil
	}))
end)