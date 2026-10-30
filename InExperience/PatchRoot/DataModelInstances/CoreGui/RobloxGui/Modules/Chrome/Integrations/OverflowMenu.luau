local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ServiceModule = require(Chrome.Service)
local ChromeUtilsModule = require(Chrome.ChromeShared.Service.ChromeUtils)
local ChromeIntegrationUtilsModule = require(Chrome.Integrations.ChromeIntegrationUtils)
local RespawnUtilsModule = require(Chrome.Integrations.RespawnUtils)
local MappedSignal = ChromeUtilsModule.MappedSignal
local UnibarStyle = require(CorePackages.Workspace.Packages.Chrome).UnibarStyle
local ChromeModule = require(CorePackages.Workspace.Packages.Chrome)
local SideSheetPlacement = ChromeModule.Enums.SideSheetPlacement
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local CommonFtuxTooltipModule = require(Chrome.Integrations.CommonFtuxTooltip)
local AvatarSwitcherFtuxTooltipModule = require(Chrome.Integrations.AvatarSwitcher.AvatarSwitcherFtuxTooltip)
local RunService = game:GetService("RunService")
local VRService = game:GetService("VRService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local PlayerListManagerModule = require(RobloxGui.Modules.PlayerList.PlayerListManager)
local EmotesMenuMasterModule = require(RobloxGui.Modules.EmotesMenu.EmotesMenuMaster)
local FFlagEnableNewBackpack = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local Features = if FFlagEnableNewBackpack then require(CorePackages.Workspace.Packages.System).Features else nil
local BackpackScriptModule = if FFlagEnableNewBackpack then nil else require(RobloxGui.Modules.BackpackScript)
local UseMappedSignalFunction = ChromeModule.Hooks.useMappedSignal
local GetFFlagIsSquadEnabledFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local MenuIconModule = require(RobloxGui.Modules.TopBar.ComponentsV2.MenuIcon)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local SelectionCursorProvider = UIBloxModule.App.SelectionImage.SelectionCursorProvider
local ConstantsModule = require(Chrome.ChromeShared.Unibar.Constants)
local IsSpatialFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local SelfieViewModule = require(RobloxGui.Modules.SelfieView)
local GetFStringConnectTooltipLocalStorageKeyModule = require(Chrome.Flags.GetFStringConnectTooltipLocalStorageKey)
local GetFIntRobloxConnectFtuxShowDelayMsModule = require(Chrome.Flags.GetFIntRobloxConnectFtuxShowDelayMs)
local GetFIntRobloxConnectFtuxDismissDelayMsModule = require(Chrome.Flags.GetFIntRobloxConnectFtuxDismissDelayMs)
local GetShouldShowPlatformChatBasedOnPolicyModule = require(Chrome.Flags.GetShouldShowPlatformChatBasedOnPolicy)
local FixInventoryFilledIcon = game:DefineFastFlag("FixInventoryFilledIcon", false)
local FlagsModule = require(Chrome.ChromeShared.Flags)
local FFlagTokenizeUnibarConstantsWithStyleProvider = FlagsModule.FFlagTokenizeUnibarConstantsWithStyleProvider
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagShowGameAgeRating = SharedFlagsModule.FFlagShowGameAgeRating
local FFlagExperienceAgeRatingBadge = require(CorePackages.Workspace.Packages.InExperienceTopBar).Flags.FFlagExperienceAgeRatingBadge
local MenuIconContextModule = require(script.Parent.Parent.Parent.TopBar.Components.MenuIconContext)
local IsSideSheetEnabledModule = require(CorePackages.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local FFlagSideSheetFocusNav = SharedFlagsModule.FFlagSideSheetFocusNav
local FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls
local AppChatEnabledChromeDropdownFtuxTooltip = game:DefineFastFlag("AppChatEnabledChromeDropdownFtuxTooltip", false)
local AvatarSwitcherFtuxTooltip = game:DefineFastFlag("AvatarSwitcherFtuxTooltip", false)
local FFlagEnableInExperienceShop = game:DefineFastFlag("InExperienceShopFtuxTooltip", false) and SharedFlagsModule.FFlagEnableInExperienceShop
local FFlagChromeNineDotActivityIndicator = SharedFlagsModule.FFlagOfferNineDotActivityIndicator and FlagsModule.FFlagChromeNineDotActivityIndicator
local UseInExperienceOfferExposureModule = require(Chrome.Integrations.InExperienceShop.useInExperienceOfferExposure)
local UseOfferNineDotActivityIndicatorModule = if FFlagChromeNineDotActivityIndicator then require(Chrome.Integrations.InExperienceShop.useOfferNineDotActivityIndicator) else nil
local InExperienceShopFtuxTooltipModule = if FFlagEnableInExperienceShop then require(Chrome.Integrations.InExperienceShop.InExperienceShopFtuxTooltip) else nil
local MenuOfferTooltipModule = require(Chrome.Integrations.InExperienceShop.MenuOfferTooltip)
local UsePublishShopAvailabilityModule = require(Chrome.Integrations.InExperienceShop.usePublishShopAvailability)
local UnibarConnectTooltipPriority = game:DefineFastInt("UnibarConnectTooltipPriority", 2000)
local ShouldShowPlatformChatBasedOnPolicyModule = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAppChatInExperience() and (AppChatEnabledChromeDropdownFtuxTooltip and GetShouldShowPlatformChatBasedOnPolicyModule())
local IsInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local InExperienceUIVRIXP = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP
local SELFIEVIEWID = ConstantsModule.SELFIE_VIEW_ID
local NewMappedSignal = MappedSignal.new(PlayerListManagerModule:GetSetVisibleChangedEvent().Event, function()
	-- upvalues: PlayerListManagerModule (copy)
	return PlayerListManagerModule:GetSetVisible()
end)
ChromeUtilsModule.setCoreGuiAvailability(ServiceModule:register({
	id = "leaderboard",
	label = "CoreScripts.TopBar.Leaderboard",
	sideSheetPlacement = SideSheetPlacement.BelowFold,
	activated = function(_)
		-- upvalues: IsInExperienceUIVREnabled (copy), VRService (copy), RobloxGui (copy), PlayerListManagerModule (copy), IsSpatialFunction (copy), InExperienceUIVRIXP (copy), ChromeIntegrationUtilsModule (copy)
		if not IsInExperienceUIVREnabled and VRService.VREnabled then
			require(RobloxGui.Modules.InGameMenu).openPlayersPage()
			
			return
		end
		if PlayerListManagerModule:GetSetVisible() then
			PlayerListManagerModule:SetVisibility(not PlayerListManagerModule:GetSetVisible())
			
			return
		end
		if IsInExperienceUIVREnabled and IsSpatialFunction() and not InExperienceUIVRIXP:isMovePanelToCenter() then
			PlayerListManagerModule:SetVisibility(not PlayerListManagerModule:GetSetVisible())
			
			return
		else
			ChromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function()
				-- upvalues: PlayerListManagerModule (upval)
				PlayerListManagerModule:SetVisibility(not PlayerListManagerModule:GetSetVisible())
			end)
		end
	end,
	isActivated = NewMappedSignal,
	components = {
		Icon = function(_)
			-- upvalues: CommonIconModule (copy), NewMappedSignal (copy)
			return CommonIconModule("icons/controls/leaderboardOff", "icons/controls/leaderboardOn", NewMappedSignal)
		end
	}
}), Enum.CoreGuiType.PlayerList)
local NewMappedSignal1 = MappedSignal.new(EmotesMenuMasterModule.EmotesMenuToggled.Event, function()
	-- upvalues: EmotesMenuMasterModule (copy)
	return EmotesMenuMasterModule:isOpen()
end)
local RegisterResult = ServiceModule:register({
	id = "emotes",
	label = "CoreScripts.TopBar.Emotes",
	sideSheetPlacement = SideSheetPlacement.BelowFold,
	activated = function(_)
		-- upvalues: EmotesMenuMasterModule (copy), IsInExperienceUIVREnabled (copy), IsSpatialFunction (copy), InExperienceUIVRIXP (copy), ChromeIntegrationUtilsModule (copy)
		if EmotesMenuMasterModule:isOpen() then
			EmotesMenuMasterModule:close()
			
			return
		end
		if IsInExperienceUIVREnabled and IsSpatialFunction() and not InExperienceUIVRIXP:isMovePanelToCenter() then
			EmotesMenuMasterModule:open()
			
			return
		else
			ChromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function()
				-- upvalues: EmotesMenuMasterModule (upval)
				EmotesMenuMasterModule:open()
			end)
		end
	end,
	isActivated = NewMappedSignal1,
	components = {
		Icon = function(_)
			-- upvalues: CommonIconModule (copy), NewMappedSignal1 (copy)
			return CommonIconModule("icons/controls/emoteOff", "icons/controls/emoteOn", NewMappedSignal1)
		end
	}
})
local v1 = false
local MenuIsVisible = EmotesMenuMasterModule.MenuIsVisible

function updateEmoteAvailability()
	-- upvalues: v1 (ref), MenuIsVisible (ref), RegisterResult (copy)
	if v1 and MenuIsVisible then
		RegisterResult.availability:available()
		
		return
	else
		RegisterResult.availability:unavailable()
	end
end

ChromeUtilsModule.setCoreGuiAvailability(RegisterResult, Enum.CoreGuiType.EmotesMenu, function(p1)
	-- upvalues: v1 (ref)
	v1 = p1
	updateEmoteAvailability()
end)
EmotesMenuMasterModule.MenuVisibilityChanged.Event:Connect(function()
	-- upvalues: MenuIsVisible (ref), EmotesMenuMasterModule (copy)
	MenuIsVisible = EmotesMenuMasterModule.MenuIsVisible
	updateEmoteAvailability()
end)
local NewMappedSignal2 = if FFlagEnableNewBackpack then nil else MappedSignal.new(BackpackScriptModule.StateChanged.Event, function()
	-- upvalues: BackpackScriptModule (copy)
	return BackpackScriptModule.IsOpen
end)
local NewMappedSignal3 = nil

if FFlagEnableNewBackpack then
	local NewSignal = Signal.new()
	Features.onVisibilityChanged(Features.FeatureName.Backpack, function()
		-- upvalues: NewSignal (copy)
		NewSignal:fire()
		
		return nil
	end)
	NewMappedSignal3 = MappedSignal.new(NewSignal, function()
		-- upvalues: Features (copy)
		return Features.getVisibility(Features.FeatureName.Backpack)
	end)
else
	NewMappedSignal3 = NewMappedSignal2
end
if IsSideSheetEnabledModule and FFlagSideSheetFocusNav and FFlagEnableConsoleExpControls then
	NewMappedSignal3:connect(function(p1)
		-- upvalues: ServiceModule (copy)
		ServiceModule:setHideShortcutBar("Backpack", p1)
	end)
end
ChromeUtilsModule.setCoreGuiAvailability(ServiceModule:register({
	id = "backpack",
	label = "CoreScripts.TopBar.Inventory",
	sideSheetPlacement = SideSheetPlacement.BelowFold,
	activated = function(_)
		-- upvalues: FFlagEnableNewBackpack (copy), Features (copy), IsInExperienceUIVREnabled (copy), IsSpatialFunction (copy), InExperienceUIVRIXP (copy), ChromeIntegrationUtilsModule (copy), BackpackScriptModule (copy)
		if FFlagEnableNewBackpack then
			if Features.getVisibility(Features.FeatureName.Backpack) then
				Features.toggleVisibility(Features.FeatureName.Backpack)
				
				return
			end
			if IsInExperienceUIVREnabled and IsSpatialFunction() and not InExperienceUIVRIXP:isMovePanelToCenter() then
				Features.toggleVisibility(Features.FeatureName.Backpack)
				
				return
			else
				ChromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function()
					-- upvalues: Features (upval)
					Features.toggleVisibility(Features.FeatureName.Backpack)
				end)
				
				return
			end
		elseif BackpackScriptModule.IsOpen then
			BackpackScriptModule:OpenClose()
			
			return
		else
			if IsInExperienceUIVREnabled and IsSpatialFunction() and not InExperienceUIVRIXP:isMovePanelToCenter() then
				BackpackScriptModule:OpenClose()
				
				return
			else
				ChromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function()
					-- upvalues: BackpackScriptModule (upval)
					BackpackScriptModule:OpenClose()
				end)
			end
		end
	end,
	isActivated = NewMappedSignal3,
	components = {
		Icon = function(_)
			-- upvalues: CommonIconModule (copy), FixInventoryFilledIcon (copy), NewMappedSignal2 (copy)
			return CommonIconModule("icons/menu/inventoryOff", if FixInventoryFilledIcon then "icons/menu/inventoryOn" else "icons/menu/inventory", NewMappedSignal2)
		end
	}
}), Enum.CoreGuiType.Backpack)
local RegisterResult1 = ServiceModule:register({
	id = "respawn",
	label = "CoreScripts.InGameMenu.QuickActions.Respawn",
	sideSheetPlacement = SideSheetPlacement.BelowFold,
	activated = function(_)
		-- upvalues: RespawnUtilsModule (copy)
		RespawnUtilsModule.respawnPage()
	end,
	isActivated = RespawnUtilsModule.respawnPageOpenSignal,
	components = {
		Icon = function(_)
			-- upvalues: CommonIconModule (copy)
			return CommonIconModule("icons/actions/respawn")
		end
	}
})

function updateRespawn(p1)
	-- upvalues: RegisterResult1 (copy)
	if p1 then
		RegisterResult1.availability:available()
		
		return
	else
		RegisterResult1.availability:unavailable()
	end
end

task.defer(function()
	-- upvalues: RobloxGui (copy)
	local SettingsHubModule = require(RobloxGui.Modules.Settings.SettingsHub)
	SettingsHubModule.RespawnBehaviourChangedEvent.Event:connect(updateRespawn)
	updateRespawn(SettingsHubModule:GetRespawnBehaviour())
end)
local CurrentSubMenuResult = ServiceModule:currentSubMenu()
local NewMappedSignal4 = MappedSignal.new(CurrentSubMenuResult:signal(), function(): boolean
	-- upvalues: CurrentSubMenuResult (copy)
	return CurrentSubMenuResult:get() == "nine_dot"
end)

if ServiceModule:orderAlignment():get() == Enum.HorizontalAlignment.Right then
	NewMappedSignal4:connect(function(p1)
		-- upvalues: PlayerListManagerModule (copy)
		PlayerListManagerModule:SetMinimized(p1)
	end)
end
function HamburgerButton(p1)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), RunService (copy), FFlagChromeNineDotActivityIndicator (copy), UsePublishShopAvailabilityModule (copy), UseInExperienceOfferExposureModule (copy), UseOfferNineDotActivityIndicatorModule (ref), FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), ConstantsModule (copy), NewMappedSignal4 (copy), UseMappedSignalFunction (copy), ShouldShowPlatformChatBasedOnPolicyModule (copy), CommonFtuxTooltipModule (copy), UnibarConnectTooltipPriority (copy), GetFFlagIsSquadEnabledFunction (copy), GetFStringConnectTooltipLocalStorageKeyModule (copy), GetFIntRobloxConnectFtuxShowDelayMsModule (copy), GetFIntRobloxConnectFtuxDismissDelayMsModule (copy), FFlagShowGameAgeRating (copy), UseAppPolicyFunction (copy), FFlagExperienceAgeRatingBadge (copy), MenuIconContextModule (copy), IsSideSheetEnabledModule (copy), SelectionCursorProvider (copy), MenuIconModule (copy), ImageSetLabel (copy), Images (copy), SelfieViewModule (copy), ServiceModule (copy), SELFIEVIEWID (copy), AvatarSwitcherFtuxTooltip (copy), AvatarSwitcherFtuxTooltipModule (copy), FFlagEnableInExperienceShop (copy), InExperienceShopFtuxTooltipModule (ref), MenuOfferTooltipModule (copy)
	local ToggleTransition = p1.toggleTransition
	local UseStyleResult = UseStyleFunction()
	local UseRefResult = ReactModule.useRef(nil)
	
	if not RunService:IsStudio() or FFlagChromeNineDotActivityIndicator then
		UsePublishShopAvailabilityModule()
		UseInExperienceOfferExposureModule()
	end
	if FFlagChromeNineDotActivityIndicator then
		UseOfferNineDotActivityIndicatorModule()
	end
	local ICONSIZE = nil
	local MEDIUMICONSIZE = nil
	
	if FFlagTokenizeUnibarConstantsWithStyleProvider then
		local UseResult = UnibarStyle.use()
		ICONSIZE = UseResult.ICON_SIZE
		MEDIUMICONSIZE = UseResult.MEDIUM_ICON_SIZE
	else
		ICONSIZE = ConstantsModule.ICON_SIZE
		MEDIUMICONSIZE = ConstantsModule.MEDIUM_ICON_SIZE
	end
	local UseMappedSignalResult = NewMappedSignal4 and UseMappedSignalFunction(NewMappedSignal4) or false
	local UseAppPolicyResult = if FFlagShowGameAgeRating then UseAppPolicyFunction(function(p2)
		return p2.getShowGameAgeRating()
	end) else UseAppPolicyFunction(function(p2)
		return p2.getShowBadgeOver12()
	end)
	local ReplacesAgeRating = if FFlagExperienceAgeRatingBadge then ReactModule.useContext(MenuIconContextModule).replacesAgeRating else false
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(0, ICONSIZE, 0, ICONSIZE),
		ref = if RunService:IsStudio() then nil else UseRefResult,
		BackgroundColor3 = UseStyleResult.Theme.BackgroundOnHover.Color,
		BackgroundTransparency = ToggleTransition:map(function(p2): number
			-- upvalues: UseStyleResult (copy)
			return 1 - (1 - UseStyleResult.Theme.BackgroundOnHover.Transparency) * p2
		end)
	}, {
		ReactModule.createElement("UICorner", { Name = "Corner", CornerRadius = UDim.new(1, 0) }),
		if IsSideSheetEnabledModule then ReactModule.createElement(SelectionCursorProvider, {}, {
			Icon = ReactModule.createElement(MenuIconModule, {
				showBadgeOver12 = UseAppPolicyResult and not ReplacesAgeRating
			})
		}) else nil,
		if IsSideSheetEnabledModule then nil else ReactModule.createElement(ImageSetLabel, {
			Name = "Overflow",
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Image = Images["icons/common/hamburgermenu"],
			Size = ToggleTransition:map(function(p2: number): UDim2
				-- upvalues: ICONSIZE (ref)
				local v2 = 1 - p2
				
				return UDim2.new(0, ICONSIZE * v2, 0, ICONSIZE * v2)
			end),
			ImageColor3 = UseStyleResult.Theme.IconEmphasis.Color,
			ImageTransparency = ToggleTransition:map(function(p2)
				-- upvalues: UseStyleResult (copy)
				return p2 * UseStyleResult.Theme.IconEmphasis.Transparency
			end)
		}),
		if IsSideSheetEnabledModule then nil else ReactModule.createElement(ImageSetLabel, {
			Name = "Close",
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Image = Images["icons/navigation/close"],
			Size = ToggleTransition:map(function(p2): UDim2
				-- upvalues: MEDIUMICONSIZE (ref)
				return UDim2.new(0, MEDIUMICONSIZE * p2, 0, MEDIUMICONSIZE * p2)
			end),
			ImageColor3 = UseStyleResult.Theme.IconEmphasis.Color,
			ImageTransparency = ToggleTransition:map(function(p2: number)
				-- upvalues: UseStyleResult (copy)
				return (1 - p2) * UseStyleResult.Theme.IconEmphasis.Transparency
			end)
		}),
		if SelfieViewModule.useCameraOn() and (not ServiceModule:isWindowOpen(SELFIEVIEWID) and not UseMappedSignalResult) then ReactModule.createElement(SelfieViewModule.CameraStatusDot, {
			Name = "CameraStatusDot",
			ZIndex = 2,
			Position = UDim2.new(1, -4, 1, -7)
		}) else nil,
		if ShouldShowPlatformChatBasedOnPolicyModule then CommonFtuxTooltipModule({
			id = "CONNECT_TOOLTIP",
			priority = UnibarConnectTooltipPriority,
			isIconVisible = p1.visible,
			headerKey = if GetFFlagIsSquadEnabledFunction() then "CoreScripts.FTUX.Heading.CheckOutRobloxParty" else "CoreScripts.FTUX.Heading.CheckOutRobloxConnect",
			bodyKey = if GetFFlagIsSquadEnabledFunction() then "CoreScripts.FTUX.Label.PartyWithYourFriendsAnytime" else "CoreScripts.FTUX.Label.ChatWithYourFriendsAnytime",
			localStorageKey = GetFStringConnectTooltipLocalStorageKeyModule(),
			showDelay = GetFIntRobloxConnectFtuxShowDelayMsModule(),
			dismissDelay = GetFIntRobloxConnectFtuxDismissDelayMsModule()
		}) else nil,
		if AvatarSwitcherFtuxTooltip then ReactModule.createElement(AvatarSwitcherFtuxTooltipModule, { visible = p1.visible }) else nil,
		if FFlagEnableInExperienceShop then ReactModule.createElement(InExperienceShopFtuxTooltipModule, { visible = p1.visible }) else nil,
		if RunService:IsStudio() then nil else ReactModule.createElement(MenuOfferTooltipModule, { anchorRef = UseRefResult, visible = p1.visible })
	})
end

return ServiceModule:register({
	id = "nine_dot",
	initialAvailability = ServiceModule.AvailabilitySignal.Pinned,
	label = if IsSideSheetEnabledModule then "CoreScripts.TopBar.RobloxMenu" else "CoreScripts.TopBar.MoreMenu",
	sideSheetPlacement = SideSheetPlacement.None,
	hotkeyCodes = if IsSideSheetEnabledModule then { Enum.KeyCode.Escape } else nil,
	isActivated = NewMappedSignal4,
	components = {
		Icon = function(p1)
			-- upvalues: ReactModule (copy)
			return ReactModule.createElement(HamburgerButton, p1)
		end
	}
})