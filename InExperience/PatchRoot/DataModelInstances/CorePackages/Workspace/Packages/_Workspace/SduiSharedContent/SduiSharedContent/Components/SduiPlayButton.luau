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
local AppPage = require(Parent.RobloxAppEnums).AppPage
local FFlagLuaAppLaunchWhenLoadingEdp = require(Parent.SharedFlags).FFlagLuaAppLaunchWhenLoadingEdp
local FFlagEnableGameJoinEarlyAccess = require(Parent.SharedFlags).FFlagEnableGameJoinEarlyAccess

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), GetSduiActionHandlerRegistryFunction (copy), SduiActionType (copy), FindAnalyticsFieldFunction (copy), UseSduiReportExperienceLaunchedModule (copy), ExecuteActionFunction (copy), GetSduiFocusActivationStoreFunction (copy), FFlagEnableGameJoinEarlyAccess (copy), AppPage (copy), PlayButton (copy), CryoModule (copy), FFlagLuaAppLaunchWhenLoadingEdp (copy)
	local AnalyticsContext = p1.analyticsContext
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: GetSduiActionHandlerRegistryFunction (upval), SduiActionType (upval), p1 (copy)
		local ActionHandlerConfig = GetSduiActionHandlerRegistryFunction().getActionHandlerConfig(SduiActionType.OpenGameDetails)
		
		if ActionHandlerConfig and ActionHandlerConfig.handler then
			ActionHandlerConfig.handler(nil, p1.analyticsContext, p1.sduiContext)
		end
	end, { p1.sduiContext, p1.analyticsContext })
	local PlaceId = p1.placeId or p1.rootPlaceId
	local IsAppPageMatch: boolean = FFlagEnableGameJoinEarlyAccess and (p1.sduiContext.appPage == AppPage.ExperienceDetail or p1.sduiContext.appPage == AppPage.GameDetail)
	
	return ReactModule.createElement(PlayButton, CryoModule.Dictionary.join(p1, {
		AnchorPoint = p1.anchorPoint,
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		tag = p1.tag,
		expandWidthForSecondaryPlayButton = p1.expandWidthForSecondaryPlayButton,
		preferSecondaryPlayButton = p1.preferSecondaryPlayButton,
		onRegisterActivation = ReactModule.useCallback(function(p2)
			-- upvalues: p1 (copy), GetSduiFocusActivationStoreFunction (upval)
			local Tag = p1.tag
			
			return if Tag == nil then function() end else GetSduiFocusActivationStoreFunction().register(Tag, p2)
		end, { p1.tag }),
		fetchDelayInSeconds = p1.fetchDelayInSeconds or 0.1,
		universeId = p1.universeId,
		placeId = p1.placeId,
		useUIBloxButton = p1.enableUiBloxButton,
		reportExperienceLaunched = UseSduiReportExperienceLaunchedModule(p1.sduiContext, p1.analyticsContext, p1.universeId, PlaceId, p1.rootPlaceId or PlaceId, p1.appliedFilters, if p1.experienceJoinData then p1.experienceJoinData.launchData else nil),
		onPurchaseRequiredCallback = if p1.openGameDetailsOnPurchaseRequired then UseResult else nil,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: p1 (copy), SduiActionType (upval), ExecuteActionFunction (upval), AnalyticsContext (copy)
			if p1.onActivatedEffect then
				p1.onActivatedEffect()
			end
			ExecuteActionFunction({ actionType = SduiActionType.PlayButtonClick }, AnalyticsContext, p1.sduiContext)
		end, { AnalyticsContext, p1.sduiContext, p1.onActivatedEffect }),
		referralSource = FindAnalyticsFieldFunction("referralSource", AnalyticsContext.analyticsData),
		eventContext = FindAnalyticsFieldFunction("eventContext", AnalyticsContext.analyticsData, "ExperienceTile"),
		launchSource = FindAnalyticsFieldFunction("launchSource", AnalyticsContext.analyticsData),
		launchWhenLoading = if FFlagLuaAppLaunchWhenLoadingEdp then p1.launchWhenLoading else nil,
		launchOnReleaseAfterUnmount = p1.launchOnReleaseAfterUnmount,
		enableEarlyAccessPlusTooltip = if FFlagEnableGameJoinEarlyAccess and IsAppPageMatch then true else nil,
		enableEarlyAccessState = if FFlagEnableGameJoinEarlyAccess and p1.enableEarlyAccessState ~= nil then p1.enableEarlyAccessState elseif FFlagEnableGameJoinEarlyAccess and IsAppPageMatch then true else nil
	}))
end)