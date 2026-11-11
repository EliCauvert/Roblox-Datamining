local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local _ = require(Parent1.Signals)
local SignalsReactModule = require(Parent1.SignalsReact)
local ReactFocusNavigationModule = require(Parent1.ReactFocusNavigation)
local _ = require(Parent1.LeaderboardStore)
local LeaderboardStoreContextModule = require(Parent.Common.LeaderboardStoreContext)
local LayoutValuesContextModule = require(Parent.Common.LayoutValuesContext)
local GameTextTranslatorContextModule = require(Parent.Common.GameTextTranslatorContext)
local CreateLayoutValuesModule = require(Parent.Common.CreateLayoutValues)
local PlatformLeaderboardContainerModule = require(Parent.Components.Containers.PlatformLeaderboardContainer)
local FocusNavigationContext = ReactFocusNavigationModule.FocusNavigationContext
local FocusNavigationService = ReactFocusNavigationModule.FocusNavigationService
local FFlagAddNewPlayerListFocusNavModule = require(Parent.Flags.FFlagAddNewPlayerListFocusNav)
local FFlagEnablePlayerListExposureEventsModule = require(Parent.Flags.FFlagEnablePlayerListExposureEvents)
local FFlagPlayerListLocalizeGameTextModule = require(Parent.Flags.FFlagPlayerListLocalizeGameText)
local FFlagPlayerListTwoTabsModule = require(Parent.Flags.FFlagPlayerListTwoTabs)
local FStringPlayerListIXPLayerModule = require(Parent.Flags.FStringPlayerListIXPLayer)
local IXPService = game:GetService("IXPService")

return ReactModule.memo(function(p1)
	-- upvalues: CreateLayoutValuesModule (copy), SignalsReactModule (copy), FocusNavigationService (copy), ReactFocusNavigationModule (copy), FFlagEnablePlayerListExposureEventsModule (copy), ReactModule (copy), IXPService (copy), FStringPlayerListIXPLayerModule (copy), FFlagPlayerListTwoTabsModule (copy), PlatformLeaderboardContainerModule (copy), LeaderboardStoreContextModule (copy), LayoutValuesContextModule (copy), FFlagAddNewPlayerListFocusNavModule (copy), FocusNavigationContext (copy), FFlagPlayerListLocalizeGameTextModule (copy), GameTextTranslatorContextModule (copy)
	local LayoutValuesModule = CreateLayoutValuesModule(p1.isTenFoot or false, p1.TopBarConstants)
	local UseSignalStateResult = SignalsReactModule.useSignalState(p1.leaderboardStore)
	local NewFocusNavigationService = FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
	
	if FFlagEnablePlayerListExposureEventsModule then
		ReactModule.useEffect(function()
			-- upvalues: IXPService (upval), FStringPlayerListIXPLayerModule (upval)
			IXPService:LogFlagLinkedUserLayerExposure(FStringPlayerListIXPLayerModule)
		end, {})
	end
	local Element = if FFlagPlayerListTwoTabsModule then ReactModule.createElement(PlatformLeaderboardContainerModule, {}, p1.children) else p1.children
	local Element1 = ReactModule.createElement(LeaderboardStoreContextModule.Provider, { value = UseSignalStateResult }, {
		LayoutValuesProvider = ReactModule.createElement(LayoutValuesContextModule.Provider, { value = LayoutValuesModule }, if FFlagAddNewPlayerListFocusNavModule then {
			FocusNavigationProvider = ReactModule.createElement(FocusNavigationContext.Provider, { value = NewFocusNavigationService }, Element)
		} else Element)
	})
	
	return if FFlagPlayerListLocalizeGameTextModule and p1.translateGameText then ReactModule.createElement(GameTextTranslatorContextModule.Provider, { value = p1.translateGameText }, { LeaderboardStoreProvider = Element1 }) else Element1
end)