local SduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local Parent = SduiSharedContent.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local PlayButton = require(Parent.GamePlayButton).PlayButton
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local ExecuteActionFunction = SduiCoreSystemModule.executeAction
local FindAnalyticsFieldFunction = SduiCoreSystemModule.findAnalyticsField
local SduiActionType = SduiCoreSystemModule.SduiActionType
local GetSduiActionHandlerRegistryFunction = SduiCoreSystemModule.getSduiActionHandlerRegistry
local UseSduiReportExperienceLaunchedModule = require(SduiSharedContent.Components.useSduiReportExperienceLaunched)
local GetSduiFocusActivationStoreFunction = require(Parent.SduiSharedUtilities).getSduiFocusActivationStore
local FFlagSduiExperienceDetailsSupport = require(Parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local FFlagLuaAppResetHoverOnSduiPlayButtonActivation = require(Parent.SharedFlags).FFlagLuaAppResetHoverOnSduiPlayButtonActivation
local FFlagLuaAppLaunchWhenLoadingEdp = require(Parent.SharedFlags).FFlagLuaAppLaunchWhenLoadingEdp
local FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp = require(Parent.SharedFlags).FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), GetSduiActionHandlerRegistryFunction (copy), SduiActionType (copy), FindAnalyticsFieldFunction (copy), FFlagSduiExperienceDetailsSupport (copy), UseSduiReportExperienceLaunchedModule (copy), FFlagLuaAppResetHoverOnSduiPlayButtonActivation (copy), ExecuteActionFunction (copy), GetSduiFocusActivationStoreFunction (copy), PlayButton (copy), CryoModule (copy), FFlagLuaAppLaunchWhenLoadingEdp (copy), FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp (copy)
	local AnalyticsContext = p1.analyticsContext
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: GetSduiActionHandlerRegistryFunction (upval), SduiActionType (upval), p1 (copy)
		local ActionHandlerConfig = GetSduiActionHandlerRegistryFunction().getActionHandlerConfig(SduiActionType.OpenGameDetails)
		
		if ActionHandlerConfig and ActionHandlerConfig.handler then
			ActionHandlerConfig.handler(nil, p1.analyticsContext, p1.sduiContext)
		end
	end, { p1.sduiContext, p1.analyticsContext })
	local PlaceId = p1.placeId or p1.rootPlaceId
	local LaunchData = if FFlagSduiExperienceDetailsSupport and p1.experienceJoinData then p1.experienceJoinData.launchData else nil
	local UseResult1 = if FFlagSduiExperienceDetailsSupport then ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy), GetSduiFocusActivationStoreFunction (upval)
		local Tag = p1.tag
		
		return if Tag == nil then function() end else GetSduiFocusActivationStoreFunction().register(Tag, p2)
	end, { p1.tag }) else nil
	local LaunchSource = if FFlagSduiExperienceDetailsSupport then FindAnalyticsFieldFunction("launchSource", AnalyticsContext.analyticsData) else nil
	
	return ReactModule.createElement(PlayButton, CryoModule.Dictionary.join(p1, {
		AnchorPoint = p1.anchorPoint,
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		tag = if FFlagSduiExperienceDetailsSupport then p1.tag else nil,
		onRegisterActivation = if FFlagSduiExperienceDetailsSupport then UseResult1 else nil,
		fetchDelayInSeconds = p1.fetchDelayInSeconds or 0.1,
		universeId = p1.universeId,
		placeId = p1.placeId,
		useUIBloxButton = if FFlagSduiExperienceDetailsSupport then p1.enableUiBloxButton else nil,
		reportExperienceLaunched = UseSduiReportExperienceLaunchedModule(p1.sduiContext, p1.analyticsContext, p1.universeId, PlaceId, p1.rootPlaceId or PlaceId, p1.appliedFilters, if FFlagSduiExperienceDetailsSupport then LaunchData else nil),
		onPurchaseRequiredCallback = if p1.openGameDetailsOnPurchaseRequired then UseResult else nil,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: FFlagLuaAppResetHoverOnSduiPlayButtonActivation (upval), p1 (copy), SduiActionType (upval), ExecuteActionFunction (upval), AnalyticsContext (copy)
			if FFlagLuaAppResetHoverOnSduiPlayButtonActivation and p1.onActivatedEffect then
				p1.onActivatedEffect()
			end
			ExecuteActionFunction({ actionType = SduiActionType.PlayButtonClick }, AnalyticsContext, p1.sduiContext)
		end, {
			AnalyticsContext,
			p1.sduiContext,
			if FFlagLuaAppResetHoverOnSduiPlayButtonActivation then p1.onActivatedEffect else nil
		}),
		referralSource = FindAnalyticsFieldFunction("referralSource", AnalyticsContext.analyticsData),
		eventContext = FindAnalyticsFieldFunction("eventContext", AnalyticsContext.analyticsData, "ExperienceTile"),
		launchSource = if FFlagSduiExperienceDetailsSupport then LaunchSource else nil,
		launchWhenLoading = if FFlagLuaAppLaunchWhenLoadingEdp then p1.launchWhenLoading else nil,
		launchOnReleaseAfterUnmount = if FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp then p1.launchOnReleaseAfterUnmount else nil
	}))
end)