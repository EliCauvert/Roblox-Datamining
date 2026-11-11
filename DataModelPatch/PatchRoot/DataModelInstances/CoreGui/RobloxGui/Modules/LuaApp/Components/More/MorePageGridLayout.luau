local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local DashModule = require(CorePackages.Packages.Dash)
local ReactModule = require(CorePackages.Packages.React)
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local MorePageSettingsModule = require(Modules.LuaApp.Components.More.Config.MorePageSettings)
local UseMorePageItemsConfigurationModule = require(Modules.LuaApp.Hooks.useMorePageItemsConfiguration)
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local MorePageContentModule = require(Modules.LuaApp.Components.More.MorePageContent)
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local UseBreakpointXOrLargerFunction = ResponsiveModule.useBreakpointXOrLarger
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local UsePropertyFunction = require(CorePackages.Workspace.Packages.GuiObjectUtils).useProperty
local FFlagLuaAppResponsiveEnginePreferredInput = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppResponsiveEnginePreferredInput
local FFlagFixMorePageLogOutCutOffModule = require(Modules.LuaApp.Flags.FFlagFixMorePageLogOutCutOff)
local FFlagEnableMorePageExitButtonSupport = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableMorePageExitButtonSupport
local FFlagEnableMorePageDirectionalLayoutRolloutFix = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableMorePageDirectionalLayoutRolloutFix
local MorePageExitButtonNotAllowed = game:DefineFastFlag("MorePageExitButtonNotAllowed", false)
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local FFlagLuaAppEnableMorePageProfileLink = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEnableMorePageProfileLink
local FFlagLuaAppsDefaultSelection = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppsDefaultSelection
local Sources = nil
local UserInfoModule = nil
local v1: (() -> any)? = nil

if FFlagLuaAppEnableMorePageProfileLink then
	Sources = require(CorePackages.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums.Sources
	UserInfoModule = require(Modules.LuaApp.Components.GridHome.Header.UserInfo)
	
	v1 = function()
		-- upvalues: ReactModule (copy), UserInfoModule (ref), Sources (ref)
		return ReactModule.createElement(UserInfoModule, { source = Sources.MorePageSelfWidget })
	end
end
local UseNavBarPlacement = if FFlagFixMorePageLogOutCutOffModule then require(CorePackages.Workspace.Packages.AppNavBar).useNavBarPlacement else nil

return function()
	-- upvalues: UseStyleFunction (copy), UseBreakpointXOrLargerFunction (copy), ResponsiveModule (copy), UseSelectorFunction (copy), UseMorePageItemsConfigurationModule (copy), ReactModule (copy), DashModule (copy), MorePageSettingsModule (copy), FFlagEnableMorePageDirectionalLayoutRolloutFix (copy), UseAppPolicyFunction (copy), UsePropertyFunction (copy), UserInputService (copy), FFlagLuaAppResponsiveEnginePreferredInput (copy), FFlagEnableMorePageExitButtonSupport (copy), MorePageExitButtonNotAllowed (copy), FFlagFixMorePageLogOutCutOffModule (copy), UseNavBarPlacement (copy), FFlagLuaAppEnableMorePageProfileLink (copy), v1 (ref), TopBarModule (copy), FFlagLuaAppsDefaultSelection (copy), ReactFocusNavigationModule (copy), FFlagEnableLeftNavOnConsole (copy), MorePageContentModule (copy)
	local BackgroundDefault = UseStyleFunction().Theme.BackgroundDefault
	local UseBreakpointXOrLargerResult = UseBreakpointXOrLargerFunction(ResponsiveModule.Keys.Medium)
	local UseSelectorResult = UseSelectorFunction(function(p1)
		return p1.TopBar.topBarHeight
	end)
	local UseMorePageItemsConfigurationModuleResult = UseMorePageItemsConfigurationModule()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: DashModule (upval), UseMorePageItemsConfigurationModuleResult (copy), MorePageSettingsModule (upval)
		return DashModule.reduce(UseMorePageItemsConfigurationModuleResult, function(Entry, p1)
			-- upvalues: MorePageSettingsModule (upval), DashModule (upval)
			return if p1.type == MorePageSettingsModule.SectionType.Navigation then { DashModule.append(Entry[1], p1.contents), Entry[2] } elseif p1.type == MorePageSettingsModule.SectionType.Action then { Entry[1], DashModule.append(Entry[2], p1.contents) } else Entry
		end, { {}, {} })
	end, { UseMorePageItemsConfigurationModuleResult })
	local IsExitButtonSupported = false
	local UseAppPolicyResult = nil
	
	if FFlagEnableMorePageDirectionalLayoutRolloutFix then
		UseAppPolicyResult = UseAppPolicyFunction(function(p1)
			return p1.getMoreGridDirectionalLayoutPreferred()
		end)
	else
		local TouchEnabled = UsePropertyFunction(UserInputService, "TouchEnabled")
		local KeyboardEnabled = UsePropertyFunction(UserInputService, "KeyboardEnabled")
		local MouseEnabled = UsePropertyFunction(UserInputService, "MouseEnabled")
		UseAppPolicyResult = if FFlagLuaAppResponsiveEnginePreferredInput then ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional and not (TouchEnabled or (KeyboardEnabled or MouseEnabled)) else ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional
	end
	if FFlagEnableMorePageExitButtonSupport then
		IsExitButtonSupported = UseAppPolicyFunction(function(p1)
			return p1.getMorePageExitButtonEnabled()
		end) and not MorePageExitButtonNotAllowed
	end
	local UseNavBarPlacementResult = if FFlagFixMorePageLogOutCutOffModule then UseNavBarPlacement() else nil
	local ForceCompactMode: boolean? = nil
	local RightItems = nil
	
	if FFlagLuaAppEnableMorePageProfileLink then
		local UseAppPolicyResult1 = UseAppPolicyFunction(function(p1)
			return p1.useGridPageLayout()
		end)
		local UseBreakpointXOrLargerResult1 = UseBreakpointXOrLargerFunction(ResponsiveModule.Keys.Large)
		
		if UseAppPolicyResult1 then
			ForceCompactMode = not UseBreakpointXOrLargerResult1
			RightItems = {
				v1,
				TopBarModule.BuyRobuxButton,
				TopBarModule.NotificationsButton
			}
		else
			RightItems = {
				TopBarModule.BuyRobuxButton,
				TopBarModule.NotificationsButton
			}
		end
	else
		RightItems = {
			TopBarModule.BuyRobuxButton,
			TopBarModule.NotificationsButton
		}
	end
	local v2 = nil
	local v3 = nil
	
	if FFlagLuaAppsDefaultSelection then
		v2, v41 = ReactFocusNavigationModule.useMostRecentOrDefaultFocusBehavior()
	end
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		ref = if FFlagLuaAppsDefaultSelection then v3 else nil,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = if UseAppPolicyResult and not FFlagEnableLeftNavOnConsole then nil else BackgroundDefault.Color,
		BackgroundTransparency = if UseAppPolicyResult and not FFlagEnableLeftNavOnConsole then 1 else BackgroundDefault.Transparency
	}, {
		TopBarMorePage = if UseAppPolicyResult then nil else ReactModule.createElement(TopBarModule.Container, {
			leftItem = TopBarModule.BackButton,
			rightItems = RightItems,
			forceCompactMode = ForceCompactMode
		}),
		MorePageContent = ReactModule.createElement(MorePageContentModule, {
			defaultFocusRef = if FFlagLuaAppsDefaultSelection then v2 else nil,
			isWideView = UseBreakpointXOrLargerResult,
			isDirectional = UseAppPolicyResult,
			isExitButtonSupported = IsExitButtonSupported,
			itemTable = UseMemoResult,
			topBarHeight = if UseAppPolicyResult then 0 else UseSelectorResult,
			navBarPlacement = UseNavBarPlacementResult
		})
	})
end