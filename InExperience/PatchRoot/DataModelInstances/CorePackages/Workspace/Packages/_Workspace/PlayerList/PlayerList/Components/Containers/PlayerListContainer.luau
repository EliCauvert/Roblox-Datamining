local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local SignalsModule = require(Parent1.Signals)
local SignalsReactModule = require(Parent1.SignalsReact)
local ReactFocusNavigationModule = require(Parent1.ReactFocusNavigation)
local _ = require(Parent1.LeaderboardStore)
local LocalizationService = game:GetService("LocalizationService")
local InExperienceLocalesModule = require(Parent1.InExperienceLocales)
local LocalizationProvider = require(Parent1.Localization).LocalizationProvider
local LeaderboardStoreContextModule = require(Parent.Common.LeaderboardStoreContext)
local LayoutValuesContextModule = require(Parent.Common.LayoutValuesContext)
local GameTextTranslatorContextModule = require(Parent.Common.GameTextTranslatorContext)
local PlayerListVisibilityStoreModule = require(Parent.Common.PlayerListVisibilityStore)
local CreateLayoutValuesModule = require(Parent.Common.CreateLayoutValues)
local PlatformLeaderboardContainerModule = require(Parent.Components.Containers.PlatformLeaderboardContainer)
local FocusNavigationContext = ReactFocusNavigationModule.FocusNavigationContext
local FocusNavigationService = ReactFocusNavigationModule.FocusNavigationService
local FFlagAddNewPlayerListFocusNavModule = require(Parent.Flags.FFlagAddNewPlayerListFocusNav)
local FFlagEnablePlayerListExposureEventsModule = require(Parent.Flags.FFlagEnablePlayerListExposureEvents)
local FFlagPlayerListLocalizeGameTextModule = require(Parent.Flags.FFlagPlayerListLocalizeGameText)
local FFlagPlayerListReskinModule = require(Parent.Flags.FFlagPlayerListReskin)
local FStringPlayerListIXPLayerModule = require(Parent.Flags.FStringPlayerListIXPLayer)
local IXPService = game:GetService("IXPService")
local LeaderboardViewChangeTelemetryModule = nil

local function _()
	-- upvalues: LeaderboardViewChangeTelemetryModule (ref), Parent (copy)
	if LeaderboardViewChangeTelemetryModule == nil then
		LeaderboardViewChangeTelemetryModule = require(Parent.Common.LeaderboardViewChangeTelemetry)
	end
	return LeaderboardViewChangeTelemetryModule
end

return ReactModule.memo(function(p1)
	-- upvalues: FFlagPlayerListReskinModule (copy), ReactModule (copy), CreateLayoutValuesModule (copy), FocusNavigationService (copy), ReactFocusNavigationModule (copy), SignalsReactModule (copy), FFlagEnablePlayerListExposureEventsModule (copy), IXPService (copy), FStringPlayerListIXPLayerModule (copy), FFlagPlayerListLocalizeGameTextModule (copy), InExperienceLocalesModule (copy), LocalizationService (copy), SignalsModule (copy), PlayerListVisibilityStoreModule (copy), LeaderboardViewChangeTelemetryModule (ref), Parent (copy), PlatformLeaderboardContainerModule (copy), LeaderboardStoreContextModule (copy), LayoutValuesContextModule (copy), FFlagAddNewPlayerListFocusNavModule (copy), FocusNavigationContext (copy), GameTextTranslatorContextModule (copy), LocalizationProvider (copy)
	local UseMemoResult = nil
	local UseMemoResult1 = nil
	if FFlagPlayerListReskinModule then
		UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: CreateLayoutValuesModule (upval), p1 (copy)
			return CreateLayoutValuesModule(p1.isTenFoot or false, p1.TopBarConstants)
		end, { p1.isTenFoot, p1.TopBarConstants })
		UseMemoResult1 = ReactModule.useMemo(function()
			-- upvalues: FocusNavigationService (upval), ReactFocusNavigationModule (upval)
			return FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
		end, {})
	else
		UseMemoResult = CreateLayoutValuesModule(p1.isTenFoot or false, p1.TopBarConstants)
		UseMemoResult1 = FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
	end
	local UseSignalStateResult = SignalsReactModule.useSignalState(p1.leaderboardStore)
	
	if FFlagEnablePlayerListExposureEventsModule then
		ReactModule.useEffect(function()
			-- upvalues: IXPService (upval), FStringPlayerListIXPLayerModule (upval)
			IXPService:LogFlagLinkedUserLayerExposure(FStringPlayerListIXPLayerModule)
		end, {})
	end
	local UseMemoResult2 = if FFlagPlayerListLocalizeGameTextModule then ReactModule.useMemo(function()
		-- upvalues: InExperienceLocalesModule (upval), LocalizationService (upval)
		return InExperienceLocalesModule.Localization.new(LocalizationService.RobloxLocaleId)
	end, {}) else nil
	
	if FFlagPlayerListReskinModule then
		ReactModule.useEffect(function()
			-- upvalues: SignalsModule (upval), PlayerListVisibilityStoreModule (upval), LeaderboardViewChangeTelemetryModule (upval), Parent (upval)
			local Flag = false
			
			return SignalsModule.createEffect(function(p2)
				-- upvalues: PlayerListVisibilityStoreModule (upval), Flag (ref), LeaderboardViewChangeTelemetryModule (upval), Parent (upval)
				local EffectiveVisible = PlayerListVisibilityStoreModule.getEffectiveVisible(p2)
				
				if not Flag then
					Flag = true
					
					return
				end
				if LeaderboardViewChangeTelemetryModule == nil then
					LeaderboardViewChangeTelemetryModule = require(Parent.Common.LeaderboardViewChangeTelemetry)
				end
				LeaderboardViewChangeTelemetryModule.logVisibility(EffectiveVisible, true)
			end)
		end, {})
	end
	local Element = if FFlagPlayerListReskinModule then ReactModule.createElement(PlatformLeaderboardContainerModule, {}, p1.children) else p1.children
	local Element1 = ReactModule.createElement(LeaderboardStoreContextModule.Provider, { value = UseSignalStateResult }, {
		LayoutValuesProvider = ReactModule.createElement(LayoutValuesContextModule.Provider, { value = UseMemoResult }, if FFlagAddNewPlayerListFocusNavModule then {
			FocusNavigationProvider = ReactModule.createElement(FocusNavigationContext.Provider, { value = UseMemoResult1 }, Element)
		} else Element)
	})
	local Element2 = if FFlagPlayerListLocalizeGameTextModule and p1.translateGameText then ReactModule.createElement(GameTextTranslatorContextModule.Provider, { value = p1.translateGameText }, { LeaderboardStoreProvider = Element1 }) else Element1
	
	return if FFlagPlayerListLocalizeGameTextModule then ReactModule.createElement(LocalizationProvider, { localization = UseMemoResult2 }, { LeaderboardTree = Element2 }) else Element2
end)