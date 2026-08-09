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

return reactModule.memo(function(p0) --[[ line: 82 | named "SduiPlayButton" ]]
	-- upvalues: reactModule (ref), getSduiActionHandlerRegistry (ref), sduiActionType (ref), findAnalyticsField (ref), fFlagSduiExperienceDetailsSupport (ref), useSduiReportExperienceLaunchedModule (ref), fFlagLuaAppResetHoverOnSduiPlayButtonActivation (ref), executeAction (ref), getSduiFocusActivationStore (ref), playButton (ref), cryoModule (ref), fFlagLuaAppLaunchWhenLoadingEdp (ref), fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp (ref)
	local analyticsContext = p0.analyticsContext
	local placeId = p0.placeId or p0.rootPlaceId
	
	return reactModule.createElement(playButton, cryoModule.Dictionary.join(p0, {
		AnchorPoint = p0.anchorPoint,
		LayoutOrder = p0.layoutOrder,
		Position = p0.position,
		tag = if fFlagSduiExperienceDetailsSupport then p0.tag else nil,
		onRegisterActivation = if fFlagSduiExperienceDetailsSupport then if fFlagSduiExperienceDetailsSupport then reactModule.useCallback(function(p1) --[[ line: 137 ]]
			-- upvalues: p0 (ref), getSduiFocusActivationStore (copy)
			local tag = p0.tag
			
			return if tag == nil then function() --[[ line: 140 ]] end else getSduiFocusActivationStore().register(tag, p1)
		end, { p0.tag }) else nil else nil,
		fetchDelayInSeconds = p0.fetchDelayInSeconds or 0.1,
		universeId = p0.universeId,
		placeId = p0.placeId,
		useUIBloxButton = if fFlagSduiExperienceDetailsSupport then p0.enableUiBloxButton else nil,
		reportExperienceLaunched = useSduiReportExperienceLaunchedModule(p0.sduiContext, p0.analyticsContext, p0.universeId, placeId, p0.rootPlaceId or placeId, p0.appliedFilters, if fFlagSduiExperienceDetailsSupport then if fFlagSduiExperienceDetailsSupport and p0.experienceJoinData then p0.experienceJoinData.launchData else nil else nil),
		onPurchaseRequiredCallback = if p0.openGameDetailsOnPurchaseRequired then reactModule.useCallback(function() --[[ line: 85 ]]
			-- upvalues: getSduiActionHandlerRegistry (copy), sduiActionType (copy), p0 (ref)
			local actionHandlerConfig = getSduiActionHandlerRegistry().getActionHandlerConfig(sduiActionType.OpenGameDetails)
			
			if actionHandlerConfig and actionHandlerConfig.handler then
				actionHandlerConfig.handler(nil, p0.analyticsContext, p0.sduiContext)
			end
		end, { p0.sduiContext, p0.analyticsContext }) else nil,
		onActivated = reactModule.useCallback(function() --[[ line: 114 ]]
			-- upvalues: fFlagLuaAppResetHoverOnSduiPlayButtonActivation (copy), p0 (ref), sduiActionType (copy), executeAction (copy), analyticsContext (ref)
			if fFlagLuaAppResetHoverOnSduiPlayButtonActivation and p0.onActivatedEffect then
				p0.onActivatedEffect()
			end
			executeAction({ actionType = sduiActionType.PlayButtonClick }, analyticsContext, p0.sduiContext)
		end, {
			analyticsContext,
			p0.sduiContext,
			if fFlagLuaAppResetHoverOnSduiPlayButtonActivation then p0.onActivatedEffect else nil
		}),
		referralSource = findAnalyticsField("referralSource", analyticsContext.analyticsData),
		eventContext = findAnalyticsField("eventContext", analyticsContext.analyticsData, "ExperienceTile"),
		launchSource = if fFlagSduiExperienceDetailsSupport then if fFlagSduiExperienceDetailsSupport then findAnalyticsField("launchSource", analyticsContext.analyticsData) else nil else nil,
		launchWhenLoading = if fFlagLuaAppLaunchWhenLoadingEdp then p0.launchWhenLoading else nil,
		launchOnReleaseAfterUnmount = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp then p0.launchOnReleaseAfterUnmount else nil
	}))
end)