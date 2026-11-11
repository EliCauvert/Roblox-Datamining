local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ReactModule = require(CorePackages.Packages.React)
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local ContainerModule = require(Modules.LuaApp.Navigation.AndroidBackButtonNavigationHandler.Container)
local IsRootRouteInRNModule = require(Modules.LuaApp.Navigation.isRootRouteInRN)
local MemoizeFunction = require(CorePackages.Workspace.Packages.AppCommonLib).memoize
local TModule = require(CorePackages.Packages.t)
local ApplySetNavigationLockedModule = require(Modules.LuaApp.Actions.ApplySetNavigationLocked)
local AppPageModule = require(Modules.LuaApp.AppPage)
local CurrentTabContextModule = require(Modules.LuaApp.Navigation.CurrentTabContext)
local SwitchNavigatorVisibleContextModule = require(Modules.LuaApp.Navigation.SwitchNavigatorVisibleContext)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local MakeNavigationStateLoggerModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.Debug.makeNavigationStateLogger)
local MakeAppRouterRootContainerModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.makeAppRouterRootContainer)
local FFlagAXFixTryOnItemVR = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixTryOnItemVR
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local FFlagSignalsNavP3gAvatarExperience = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local CryoModule = require(CorePackages.Packages.Cryo)
local UseSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3gAvatarExperience then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local AvatarExperienceWrapper = RoactModule.Component:extend("AvatarExperienceWrapper")
AvatarExperienceWrapper.validateProps = TModule.strictInterface({
	routeName = TModule.string,
	params = TModule.interface({ detail = TModule.string }),
	currentAppPageName = TModule.optional(TModule.string),
	currentAppPageDetail = TModule.optional(TModule.string),
	unlockNavigation = TModule.callback
})

function AvatarExperienceWrapper.init(p1)
	-- upvalues: MakeAppRouterRootContainerModule (copy), RoactNavigationModule (copy), MemoizeFunction (copy), AppPageModule (copy), RoactModule (copy), ContainerModule (copy), IsRootRouteInRNModule (copy), MakeNavigationStateLoggerModule (copy)
	p1.navigationAppContainer = RoactNavigationModule.createAppContainer(MakeAppRouterRootContainerModule(p1.props.routeName), nil)
	p1.isAndroidBackButtonHandlerDisabled = MemoizeFunction(function(AvatarExperienceWrapper, p2, p3): boolean
		-- upvalues: AppPageModule (upval)
		return not (if AvatarExperienceWrapper == AppPageModule.AvatarExperienceWrapper then p2 == p3 else AvatarExperienceWrapper == AppPageModule.AvatarExperienceWrapperTransparent and p2 == p3)
	end)
	p1.renderAndroidBackButtonNavigationHandler = MemoizeFunction(function(Disabled)
		-- upvalues: RoactModule (upval), ContainerModule (upval), IsRootRouteInRNModule (upval)
		return function(p2)
			-- upvalues: RoactModule (upval), ContainerModule (upval), IsRootRouteInRNModule (upval), Disabled (copy)
			return RoactModule.createElement(ContainerModule, {
				canGoBackInRN = not IsRootRouteInRNModule(p2.state),
				navigateBackInRN = p2.pop,
				disabled = Disabled
			})
		end
	end)
	local NavigationStateLoggerModule = MakeNavigationStateLoggerModule("AvatarExperienceWrapper:" .. p1.props.routeName)
	
	function p1.onNavigationStateChange(p2, p3, p4)
		-- upvalues: NavigationStateLoggerModule (copy), p1 (copy)
		NavigationStateLoggerModule(p2, p3, p4)
		
		if not p3.isTransitioning then
			p1.props.unlockNavigation()
		end
	end
end

function AvatarExperienceWrapper.render(p1)
	-- upvalues: FFlagAXFixTryOnItemVR (copy), RoactModule (copy), CurrentTabContextModule (copy), AvatarScreen (copy), SwitchNavigatorVisibleContextModule (copy)
	local IsAndroidBackButtonHandlerDisabled = p1.isAndroidBackButtonHandlerDisabled(p1.props.currentAppPageName, p1.props.currentAppPageDetail, p1.props.params and p1.props.params.detail or nil)
	
	return if FFlagAXFixTryOnItemVR then RoactModule.createElement(CurrentTabContextModule.Provider, { value = AvatarScreen.AvatarExperienceRoot }, {
		SwitchNavigatorVisibleProvider = RoactModule.createElement(SwitchNavigatorVisibleContextModule.Provider, { value = not IsAndroidBackButtonHandlerDisabled }, {
			NavigationAppContainer = RoactModule.createElement(p1.navigationAppContainer, {
				onNavigationStateChange = p1.onNavigationStateChange,
				renderAndroidBackButtonNavigationHandler = p1.renderAndroidBackButtonNavigationHandler(IsAndroidBackButtonHandlerDisabled),
				params = p1.props.params
			})
		})
	}) else RoactModule.createElement(p1.navigationAppContainer, {
		onNavigationStateChange = p1.onNavigationStateChange,
		renderAndroidBackButtonNavigationHandler = p1.renderAndroidBackButtonNavigationHandler(IsAndroidBackButtonHandlerDisabled),
		params = p1.props.params
	})
end

local function mapStateToProps(p1, _)
	-- upvalues: FFlagUseNavigationSelectors (copy), Selectors (copy)
	local SelectCurrentLegacyPageResult = nil
	if FFlagUseNavigationSelectors then
		SelectCurrentLegacyPageResult = Selectors.selectCurrentLegacyPage(p1)
	else
		local HistoryEntry = p1.Navigation.history[#p1.Navigation.history]
		SelectCurrentLegacyPageResult = HistoryEntry[#HistoryEntry]
	end
	return {
		currentAppPageName = SelectCurrentLegacyPageResult and SelectCurrentLegacyPageResult.name or nil,
		currentAppPageDetail = SelectCurrentLegacyPageResult and SelectCurrentLegacyPageResult.detail or nil
	}
end

local v1 = if FFlagSignalsNavP3gAvatarExperience then function(p1)
	-- upvalues: GetLegacyNavigationStore (copy), UseSignalState (copy), ReactModule (copy), v1 (copy), CryoModule (copy)
	local v2 = UseSignalState(GetLegacyNavigationStore(false).getCurrentPage)
	
	return ReactModule.createElement(v1, CryoModule.Dictionary.union(p1, {
		currentAppPageName = v2 and v2.name or nil,
		currentAppPageDetail = v2 and v2.detail or nil
	}))
end else RoactRoduxModule.connect(if FFlagSignalsNavP3gAvatarExperience then nil else mapStateToProps, function(Callback)
	-- upvalues: FFlagSignalsNavP3gAvatarExperience (copy), ApplySetNavigationLockedModule (copy)
	return {
		unlockNavigation = function()
			-- upvalues: FFlagSignalsNavP3gAvatarExperience (upval), Callback (copy), ApplySetNavigationLockedModule (upval)
			if not FFlagSignalsNavP3gAvatarExperience then
				Callback(ApplySetNavigationLockedModule(false))
			end
		end
	}
end)(AvatarExperienceWrapper)

return v1