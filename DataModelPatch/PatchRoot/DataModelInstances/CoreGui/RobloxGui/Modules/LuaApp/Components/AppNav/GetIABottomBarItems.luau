local GuiService = game:GetService("GuiService")
local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local AppPageModule = require(Modules.LuaApp.AppPage)
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local NavigationRoduxModule = require(CorePackages.Workspace.Packages.NavigationRodux)
local AppNavBarModule = require(CorePackages.Workspace.Packages.AppNavBar)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagAppNavMyStatsTab = SharedFlagsModule.FFlagAppNavMyStatsTab
local ArgoPartyExperimentation = require(CorePackages.Workspace.Packages.SocialExperiments).ArgoPartyExperimentation
local SendBuildExperienceEventModule = require(CorePackages.Workspace.Packages.BuildExperience.sendBuildExperienceEvent)
local Icon = nil
local IconName = nil
local IconVariant = nil
local IconSize = nil
local View = nil
local UseTokensFunction = nil

if FFlagAppNavMyStatsTab or ArgoPartyExperimentation.getIsRenameEnabled() then
	local FoundationModule = require(CorePackages.Packages.Foundation)
	Icon = FoundationModule.Icon
	IconName = FoundationModule.Enums.IconName
	IconVariant = FoundationModule.Enums.IconVariant
	IconSize = FoundationModule.Enums.IconSize
	View = FoundationModule.View
	UseTokensFunction = FoundationModule.Hooks.useTokens
end
local FFlagAppIaHomeSubTab = SharedFlagsModule.FFlagAppIaHomeSubTab
local FFlagEnableArgus = SharedFlagsModule.FFlagEnableArgus
local FFlagEnableArgusTab = SharedFlagsModule.FFlagEnableArgusTab
local FFlagArgoEnableMoments = SharedFlagsModule.FFlagArgoEnableMoments
local GetAppChatNavbarItemConfigModule = require(CorePackages.Workspace.Packages.AppChat.getAppChatNavbarItemConfig)
local FFlagEnableFlyoutSidePanelModule = require(Modules.LuaApp.Flags.FFlagEnableFlyoutSidePanel)
local FFlagMeTabRightOfPartyBottomNavModule = require(Modules.LuaApp.Flags.FFlagMeTabRightOfPartyBottomNav)
local FlyoutSidePanelIXP = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local FFlagEnableAndroidTvAppPolicies = SharedFlagsModule.FFlagEnableAndroidTvAppPolicies
local GetFFlagEnableVRChartsTabFunction = SharedFlagsModule.GetFFlagEnableVRChartsTab
local FFlagRenameAvatarToMe = SharedFlagsModule.FFlagRenameAvatarToMe
local AvatarHeadshotLocalIconModule = require(Modules.AvatarExperience.Common.Components.AvatarHeadshotLocalIcon)
local UniversalAppPolicyModule = require(CorePackages.Workspace.Packages.UniversalAppPolicy)
local list = {
	{
		titleLocalizationKey = "CommonUI.Features.Label.Home",
		actionType = nil,
		page = AppPageModule.Home,
		iconImage = Images["icons/menu/home_on"]
	},
	{
		page = AppPageModule.AvatarExperienceRoot,
		titleLocalizationKey = if FFlagRenameAvatarToMe then "CommonUI.Features.Label.Me" else "CommonUI.Features.Label.Avatar",
		iconComponent = require(Modules.AvatarExperience.Common.Components.AvatarHeadshotSystemBarIcon),
		actionType = Enum.AppShellActionType.TapAvatarTab
	},
	{
		titleLocalizationKey = "Feature.SocialTab.Label.Connect",
		page = AppPageModule.ViewFriends,
		iconImage = Images["icons/menu/friendsOn"],
		actionType = Enum.AppShellActionType.TapChatTab
	}
}
local Flag = false

local function v35()
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), AvatarHeadshotLocalIconModule (copy), AppPageModule (copy), Images (copy), FFlagAppIaHomeSubTab (copy), NavigationRoduxModule (copy), AppNavBarModule (copy), FFlagRenameAvatarToMe (copy), GetAppChatNavbarItemConfigModule (copy), ArgoPartyExperimentation (copy), Icon (ref), IconVariant (ref), FFlagAppNavMyStatsTab (copy), UseTokensFunction (ref), Flag (ref), SendBuildExperienceEventModule (copy), View (ref), IconName (ref), IconSize (ref), FFlagEnableLeftNavOnConsole (copy), IsVRAppBuildFunction (copy), GuiService (copy), FFlagEnableArgus (copy), UniversalAppPolicyModule (copy), FFlagArgoEnableMoments (copy), CorePackages (copy), FFlagEnableArgusTab (copy), GetFFlagEnableVRChartsTabFunction (copy), FlyoutSidePanelIXP (copy), FFlagMeTabRightOfPartyBottomNavModule (copy)
	local function v36(p1)
		-- upvalues: UseStyleFunction (upval), ReactModule (upval), AvatarHeadshotLocalIconModule (upval)
		local Tokens = UseStyleFunction().Tokens
		local Emphasis = if p1.isChecked then Tokens.Color.Content.Emphasis else Tokens.Color.Content.Default
		
		return ReactModule.createElement(AvatarHeadshotLocalIconModule, {
			ZIndex = 0,
			Size = Tokens.Size.Size_700,
			BackgroundColor3 = Emphasis.Color3,
			BackgroundTransparency = Emphasis.Transparency
		})
	end
	
	local config = {
		labelText = "CommonUI.Features.Label.Home",
		badgeCount = nil,
		page = AppPageModule.Home,
		iconImage = Images["icons/menu/home_off"],
		iconCheckedImage = Images["icons/menu/home_on"],
		actionType = Enum.AppShellActionType.TapHomePageTab
	}
	local config1 = {
		labelText = "CommonUI.Features.Label.Charts",
		badgeCount = nil,
		page = AppPageModule.Games,
		iconImage = Images["icons/menu/charts_off"],
		iconCheckedImage = Images["icons/menu/charts_on"],
		actionType = Enum.AppShellActionType.TapGamePageTab
	}
	local config2 = {
		labelText = "CommonUI.Features.Label.Moments",
		actionType = nil,
		badgeCount = nil,
		page = AppPageModule.Moments,
		iconImage = Images["icons/brands/moments"],
		iconCheckedImage = Images["icons/brands/moments-fill"]
	}
	local Config = if FFlagAppIaHomeSubTab then {
		labelText = "CommonUI.Features.Label.Home",
		badgeCount = nil,
		page = NavigationRoduxModule.Constants.HomeContainerName,
		subTabPages = AppNavBarModule.Constants.HOME_CONTAINER_SUB_TAB_PAGES,
		iconImage = Images["icons/menu/home_off"],
		iconCheckedImage = Images["icons/menu/home_on"],
		actionType = Enum.AppShellActionType.TapHomePageTab
	} else nil
	local config3 = {
		badgeCount = nil,
		page = AppPageModule.AvatarExperienceRoot,
		renderIcon = function(IsChecked, _)
			-- upvalues: ReactModule (upval), v36 (copy)
			return ReactModule.createElement(v36, { isChecked = IsChecked })
		end,
		labelText = if FFlagRenameAvatarToMe then "CommonUI.Features.Label.Me" else "CommonUI.Features.Label.Avatar",
		actionType = Enum.AppShellActionType.TapAvatarTab
	}
	local AppChatNavbarItemConfigModule = GetAppChatNavbarItemConfigModule()
	local config4 = {
		badgeCount = nil,
		page = AppPageModule.Chat,
		iconImage = if ArgoPartyExperimentation.getIsRenameEnabled() then nil else Images[AppChatNavbarItemConfigModule.icon.off],
		iconCheckedImage = if ArgoPartyExperimentation.getIsRenameEnabled() then nil else Images[AppChatNavbarItemConfigModule.icon.on],
		labelText = AppChatNavbarItemConfigModule.label,
		actionType = Enum.AppShellActionType.TapChatTab,
		renderIcon = if ArgoPartyExperimentation.getIsRenameEnabled() then function(p1)
			-- upvalues: ReactModule (upval), Icon (upval), AppChatNavbarItemConfigModule (copy), IconVariant (upval)
			return ReactModule.createElement(Icon, {
				name = AppChatNavbarItemConfigModule.icon,
				variant = if p1 then IconVariant.Filled else IconVariant.Regular
			})
		end else nil
	}
	local config5 = {
		labelText = "CommonUI.Features.Label.More",
		actionType = nil,
		badgeCount = nil,
		page = AppPageModule.More,
		iconImage = Images["icons/menu/more_off"],
		iconCheckedImage = Images["icons/menu/more_on"]
	}
	local v1 = nil
	
	if FFlagAppNavMyStatsTab then
		local function v47(p1)
			-- upvalues: UseTokensFunction (upval), ReactModule (upval), Flag (upval), SendBuildExperienceEventModule (upval), View (upval), Icon (upval), IconName (upval), IconSize (upval), IconVariant (upval)
			local UseTokensResult = UseTokensFunction()
			ReactModule.useEffect(function()
				-- upvalues: Flag (upval), SendBuildExperienceEventModule (upval)
				if not Flag then
					Flag = true
					SendBuildExperienceEventModule("TAB_IMPRESSION", {})
				end
			end, {})
			
			return ReactModule.createElement(View, { tag = "auto-xy padding-xxsmall" }, {
				Icon = ReactModule.createElement(Icon, {
					name = IconName.Nebula,
					size = IconSize.Large,
					variant = if p1.isChecked then IconVariant.Filled else IconVariant.Regular,
					style = if p1.isChecked then UseTokensResult.Color.Content.Emphasis else UseTokensResult.Color.Content.Default
				})
			})
		end
		
		v1 = {
			labelText = "CommonUI.Features.NavBar.Build",
			actionType = nil,
			badgeCount = nil,
			page = AppPageModule.MyStats,
			renderIcon = function(IsChecked, _)
				-- upvalues: ReactModule (upval), v47 (copy)
				return ReactModule.createElement(v47, { isChecked = IsChecked })
			end
		}
	end
	local Config1 = if FFlagEnableLeftNavOnConsole then {
		labelText = "Feature.SocialTab.Label.Connect",
		badgeCount = nil,
		page = AppPageModule.ViewFriends,
		iconImage = Images["icons/menu/friends"],
		iconCheckedImage = Images["icons/menu/friendsOn"],
		actionType = Enum.AppShellActionType.TapChatTab
	} else nil
	local IsVRAppBuild = IsVRAppBuildFunction()
	local IsTenFootInterface = GuiService:IsTenFootInterface()
	local IsTab = if FFlagEnableArgus and UniversalAppPolicyModule.getAppFeaturePolicies().getDisplayMomentsMoreTabTile() then if FFlagArgoEnableMoments then true else require(CorePackages.Workspace.Packages.MomentsCommon.ArgusExperiment).getCurrentExperimentConfig().entryType == "tab" or FFlagEnableArgusTab else false
	local List = nil
	
	if IsVRAppBuild then
		config3.isSecondary = true
		List = if GetFFlagEnableVRChartsTabFunction() then {
			config,
			config1,
			config4,
			config5,
			config3
		} else { config, config4, config5, config3 }
	else
		List = if FFlagEnableLeftNavOnConsole and IsTenFootInterface then { config, config3, Config1, config5 } elseif FFlagAppIaHomeSubTab and FlyoutSidePanelIXP.isHomeSubTabEnabled() then if FFlagMeTabRightOfPartyBottomNavModule then { Config, config4, config3, config5 } else { Config, config3, config4, config5 } elseif FFlagMeTabRightOfPartyBottomNavModule then {
			config,
			config1,
			config4,
			config3,
			config5
		} else {
			config,
			config1,
			config3,
			config4,
			config5
		}
	end
	if IsTab and not IsVRAppBuild and (not FFlagEnableLeftNavOnConsole or not IsTenFootInterface) then
		table.insert(List, 2, config2)
	end
	if FFlagAppNavMyStatsTab and (not IsVRAppBuild and not IsTenFootInterface) then
		table.insert(List, v1)
	end
	return List
end

function getBottomBarItems()
	-- upvalues: FFlagEnableLeftNavOnConsole (copy), GuiService (copy), list (copy), v35 (copy)
	return if FFlagEnableLeftNavOnConsole or not GuiService:IsTenFootInterface() then v35() else list
end

return function()
	-- upvalues: GuiService (copy), UniversalAppPolicyModule (copy), CryoModule (copy), AppPageModule (copy), FFlagEnableFlyoutSidePanelModule (copy), FFlagEnableAndroidTvAppPolicies (copy), FFlagAppIaHomeSubTab (copy)
	local t = {}
	local BottomBarItems = getBottomBarItems()
	
	if not GuiService:IsTenFootInterface() then
		local GetCanSeeChatTabFunction = UniversalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTab
		
		if GetCanSeeChatTabFunction and not GetCanSeeChatTabFunction() then
			BottomBarItems = CryoModule.List.filter(BottomBarItems, function(p1): boolean
				-- upvalues: AppPageModule (upval)
				return p1.page ~= AppPageModule.Chat
			end)
		end
	end
	if FFlagEnableFlyoutSidePanelModule then
		BottomBarItems = CryoModule.List.filter(BottomBarItems, function(p1): boolean
			-- upvalues: AppPageModule (upval)
			return p1.page ~= AppPageModule.More
		end)
	end
	if FFlagEnableAndroidTvAppPolicies then
		local GetHidesGamesTabFunction = UniversalAppPolicyModule.getAppFeaturePolicies().getHidesGamesTab
		
		if GetHidesGamesTabFunction and GetHidesGamesTabFunction() then
			BottomBarItems = CryoModule.List.filter(BottomBarItems, function(p1): boolean
				-- upvalues: AppPageModule (upval)
				return p1.page ~= AppPageModule.Games
			end)
		end
	end
	for i, bottomBarItem in ipairs(BottomBarItems) do
		if not FFlagAppIaHomeSubTab or not bottomBarItem.subTabPages then
			t[bottomBarItem.page] = i
			continue
		end
		for _, subTabPage in ipairs(bottomBarItem.subTabPages) do
			t[subTabPage] = i
		end
	end
	return BottomBarItems, t
end