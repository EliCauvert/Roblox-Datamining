local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local _ = require(parent_1.Signals)
local signalsReactModule = require(parent_1.SignalsReact)
local reactFocusNavigationModule = require(parent_1.ReactFocusNavigation)
local _ = require(parent_1.LeaderboardStore)
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
local fFlagPlayerListReskinOptimizationModule = require(parent.Flags.FFlagPlayerListReskinOptimization)
local fFlagPlayerListTwoTabsModule = require(parent.Flags.FFlagPlayerListTwoTabs)
local fStringPlayerListIXPLayerModule = require(parent.Flags.FStringPlayerListIXPLayer)
local IXPService = game:GetService("IXPService")

return reactModule.memo(function(p0) --[[ line: 37 ]]
	-- upvalues: fFlagPlayerListReskinOptimizationModule (ref), reactModule (ref), createLayoutValuesModule (ref), focusNavigationService (ref), reactFocusNavigationModule (ref), signalsReactModule (ref), fFlagEnablePlayerListExposureEventsModule (ref), IXPService (ref), fStringPlayerListIXPLayerModule (ref), fFlagPlayerListTwoTabsModule (ref), platformLeaderboardContainerModule (ref), leaderboardStoreContextModule (ref), layoutValuesContextModule (ref), fFlagAddNewPlayerListFocusNavModule (ref), focusNavigationContext (ref), fFlagPlayerListLocalizeGameTextModule (ref), gameTextTranslatorContextModule (ref)
	local var15, var16
	local _ = nil
	local _ = nil
	
	if fFlagPlayerListReskinOptimizationModule then
		var15 = reactModule.useMemo(function() --[[ line: 41 ]]
			-- upvalues: createLayoutValuesModule (copy), p0 (ref)
			return createLayoutValuesModule(p0.isTenFoot or false, p0.TopBarConstants)
		end, { p0.isTenFoot, p0.TopBarConstants })
		var16 = reactModule.useMemo(function() --[[ line: 44 ]]
			-- upvalues: focusNavigationService (copy), reactFocusNavigationModule (copy)
			return focusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
		end, {})
	else
		var15 = createLayoutValuesModule(p0.isTenFoot or false, p0.TopBarConstants)
		var16 = focusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
	end
	local var17 = signalsReactModule.useSignalState(p0.leaderboardStore)
	
	if fFlagEnablePlayerListExposureEventsModule then
		reactModule.useEffect(function() --[[ line: 54 ]]
			-- upvalues: IXPService (copy), fStringPlayerListIXPLayerModule (copy)
			IXPService:LogFlagLinkedUserLayerExposure(fStringPlayerListIXPLayerModule)
		end, {})
	end
	local var18 = if fFlagPlayerListTwoTabsModule then reactModule.createElement(platformLeaderboardContainerModule, {}, p0.children) else p0.children
	local var19 = reactModule.createElement(leaderboardStoreContextModule.Provider, { value = var17 }, {
		LayoutValuesProvider = reactModule.createElement(layoutValuesContextModule.Provider, { value = var15 }, if fFlagAddNewPlayerListFocusNavModule then {
			FocusNavigationProvider = reactModule.createElement(focusNavigationContext.Provider, { value = var16 }, var18)
		} else var18)
	})
	
	return if fFlagPlayerListLocalizeGameTextModule and p0.translateGameText then reactModule.createElement(gameTextTranslatorContextModule.Provider, { value = p0.translateGameText }, { LeaderboardStoreProvider = var19 }) else var19
end)