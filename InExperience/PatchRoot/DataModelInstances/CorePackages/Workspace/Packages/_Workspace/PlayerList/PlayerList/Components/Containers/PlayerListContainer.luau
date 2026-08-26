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

return reactModule.memo(function(p1)
	-- upvalues: fFlagPlayerListReskinModule (ref), reactModule (ref), createLayoutValuesModule (ref), focusNavigationService (ref), reactFocusNavigationModule (ref), signalsReactModule (ref), fFlagEnablePlayerListExposureEventsModule (ref), IXPService (ref), fStringPlayerListIXPLayerModule (ref), fFlagPlayerListLocalizeGameTextModule (ref), inExperienceLocalesModule (ref), localizationService (ref), fFlagPlayerListTwoTabsModule (ref), platformLeaderboardContainerModule (ref), leaderboardStoreContextModule (ref), layoutValuesContextModule (ref), fFlagAddNewPlayerListFocusNavModule (ref), focusNavigationContext (ref), gameTextTranslatorContextModule (ref), localizationProvider (ref)
	local var1, var2
	local _ = nil
	local _ = nil
	
	if fFlagPlayerListReskinModule then
		var1 = reactModule.useMemo(function()
			-- upvalues: createLayoutValuesModule (copy), p1 (ref)
			return createLayoutValuesModule(p1.isTenFoot or false, p1.TopBarConstants)
		end, { p1.isTenFoot, p1.TopBarConstants })
		var2 = reactModule.useMemo(function()
			-- upvalues: focusNavigationService (copy), reactFocusNavigationModule (copy)
			return focusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
		end, {})
	else
		var1 = createLayoutValuesModule(p1.isTenFoot or false, p1.TopBarConstants)
		var2 = focusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
	end
	local var3 = signalsReactModule.useSignalState(p1.leaderboardStore)
	
	if fFlagEnablePlayerListExposureEventsModule then
		reactModule.useEffect(function()
			-- upvalues: IXPService (copy), fStringPlayerListIXPLayerModule (copy)
			IXPService:LogFlagLinkedUserLayerExposure(fStringPlayerListIXPLayerModule)
		end, {})
	end
	local var4 = if fFlagPlayerListLocalizeGameTextModule then reactModule.useMemo(function()
		-- upvalues: inExperienceLocalesModule (copy), localizationService (copy)
		return inExperienceLocalesModule.Localization.new(localizationService.RobloxLocaleId)
	end, {}) else nil
	local var5 = if fFlagPlayerListTwoTabsModule then reactModule.createElement(platformLeaderboardContainerModule, {}, p1.children) else p1.children
	local var6 = reactModule.createElement(leaderboardStoreContextModule.Provider, { value = var3 }, {
		LayoutValuesProvider = reactModule.createElement(layoutValuesContextModule.Provider, { value = var1 }, if fFlagAddNewPlayerListFocusNavModule then {
			FocusNavigationProvider = reactModule.createElement(focusNavigationContext.Provider, { value = var2 }, var5)
		} else var5)
	})
	local var7 = if fFlagPlayerListLocalizeGameTextModule and p1.translateGameText then reactModule.createElement(gameTextTranslatorContextModule.Provider, { value = p1.translateGameText }, { LeaderboardStoreProvider = var6 }) else var6
	
	return if fFlagPlayerListLocalizeGameTextModule then reactModule.createElement(localizationProvider, { localization = var4 }, { LeaderboardTree = var7 }) else var7
end)