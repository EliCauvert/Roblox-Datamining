local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local _ = require(parent_1.Signals)
local signalsReactModule = require(parent_1.SignalsReact)
local reactFocusNavigationModule = require(parent_1.ReactFocusNavigation)
local _ = require(parent_1.LeaderboardStore)
local localizationService = game:GetService("LocalizationService")
local inExperienceLocalesModule = require(parent_1.InExperienceLocales)
local localizationProvider = require(parent_1.Localization).LocalizationProvider
local leaderboardStoreContextModule = require(parent.Common.LeaderboardStoreContext)
local layoutValuesContextModule = require(parent.Common.LayoutValuesContext)
local gameTextTranslatorContextModule = require(parent.Common.GameTextTranslatorContext)
local createLayoutValuesModule = require(parent.Common.CreateLayoutValues)
local platformLeaderboardContainerModule = require(parent.Components.Containers.PlatformLeaderboardContainer)
local focusNavigationContext = reactFocusNavigationModule.FocusNavigationContext
local focusNavigationService = reactFocusNavigationModule.FocusNavigationService
local fFlagAddNewPlayerListFocusNavModule = require(parent.Flags.FFlagAddNewPlayerListFocusNav)
local fFlagEnablePlayerListExposureEventsModule = require(parent.Flags.FFlagEnablePlayerListExposureEvents)
local fFlagPlayerListLocalizeGameTextModule = require(parent.Flags.FFlagPlayerListLocalizeGameText)
local fFlagPlayerListReskinModule = require(parent.Flags.FFlagPlayerListReskin)
local fFlagPlayerListTwoTabsModule = require(parent.Flags.FFlagPlayerListTwoTabs)
local fStringPlayerListIXPLayerModule = require(parent.Flags.FStringPlayerListIXPLayer)
local IXPService = game:GetService("IXPService")

return reactModule.memo(function(p0)
	-- upvalues: fFlagPlayerListReskinModule (ref), reactModule (ref), createLayoutValuesModule (ref), focusNavigationService (ref), reactFocusNavigationModule (ref), signalsReactModule (ref), fFlagEnablePlayerListExposureEventsModule (ref), IXPService (ref), fStringPlayerListIXPLayerModule (ref), fFlagPlayerListLocalizeGameTextModule (ref), inExperienceLocalesModule (ref), localizationService (ref), fFlagPlayerListTwoTabsModule (ref), platformLeaderboardContainerModule (ref), leaderboardStoreContextModule (ref), layoutValuesContextModule (ref), fFlagAddNewPlayerListFocusNavModule (ref), focusNavigationContext (ref), gameTextTranslatorContextModule (ref), localizationProvider (ref)
	local var17, var18
	local _ = nil
	local _ = nil
	
	if fFlagPlayerListReskinModule then
		var17 = reactModule.useMemo(function()
			-- upvalues: createLayoutValuesModule (copy), p0 (ref)
			return createLayoutValuesModule(p0.isTenFoot or false, p0.TopBarConstants)
		end, { p0.isTenFoot, p0.TopBarConstants })
		var18 = reactModule.useMemo(function()
			-- upvalues: focusNavigationService (copy), reactFocusNavigationModule (copy)
			return focusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
		end, {})
	else
		var17 = createLayoutValuesModule(p0.isTenFoot or false, p0.TopBarConstants)
		var18 = focusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
	end
	local var19 = signalsReactModule.useSignalState(p0.leaderboardStore)
	
	if fFlagEnablePlayerListExposureEventsModule then
		reactModule.useEffect(function()
			-- upvalues: IXPService (copy), fStringPlayerListIXPLayerModule (copy)
			IXPService:LogFlagLinkedUserLayerExposure(fStringPlayerListIXPLayerModule)
		end, {})
	end
	local var20 = if fFlagPlayerListLocalizeGameTextModule then reactModule.useMemo(function()
		-- upvalues: inExperienceLocalesModule (copy), localizationService (copy)
		return inExperienceLocalesModule.Localization.new(localizationService.RobloxLocaleId)
	end, {}) else nil
	local var21 = if fFlagPlayerListTwoTabsModule then reactModule.createElement(platformLeaderboardContainerModule, {}, p0.children) else p0.children
	local var22 = reactModule.createElement(leaderboardStoreContextModule.Provider, { value = var19 }, {
		LayoutValuesProvider = reactModule.createElement(layoutValuesContextModule.Provider, { value = var17 }, if fFlagAddNewPlayerListFocusNavModule then {
			FocusNavigationProvider = reactModule.createElement(focusNavigationContext.Provider, { value = var18 }, var21)
		} else var21)
	})
	local var23 = if fFlagPlayerListLocalizeGameTextModule and p0.translateGameText then reactModule.createElement(gameTextTranslatorContextModule.Provider, { value = p0.translateGameText }, { LeaderboardStoreProvider = var22 }) else var22
	
	return if fFlagPlayerListLocalizeGameTextModule then reactModule.createElement(localizationProvider, { localization = var20 }, { LeaderboardTree = var23 }) else var23
end)