local corePackagesService = game:GetService("CorePackages")
local signalsModule = require(corePackagesService.Packages.Signals)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local displayModule = require(corePackagesService.Workspace.Packages.Display)
local getUIScale = displayModule.GetDisplayStore(false).getUIScale
local parent = script.Parent.Parent
local tenFootInterfaceModule = require(parent.TenFootInterface)
local enabled = require(corePackagesService.Workspace.Packages.Chrome).Enabled
local chromeShared = parent.Chrome.ChromeShared
local isNewTiltIconEnabledModule = require(parent.isNewTiltIconEnabled)
local fFlagTopBarRefactor = require(corePackagesService.Workspace.Packages.InExperienceTopBar).Flags.FFlagTopBarRefactor
local isSideSheetEnabledModule = require(corePackagesService.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local var1 = if enabled() then require(chromeShared.Utility.GetStyleTokens)() else nil

local function _(p1)
	-- upvalues: tenFootInterfaceModule (ref), enabled (ref)
	return if enabled() then (if tenFootInterfaceModule:IsEnabled() then 1.5 else 1) * p1 else p1
end

local var2 = if enabled() then var1.Size.Size_900 else 36
local var3 = var2 - 4
local var4 = if enabled() then if enabled() then (if tenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 58 else 58 else 58
local var5 = if enabled() then var1.Size.Size_1100 else 44

local _ = function()
	-- upvalues: isNewTiltIconEnabledModule (ref), var2 (ref), enabled (ref), var4 (ref)
	return if isNewTiltIconEnabledModule() then if enabled() then var4 else var2 else var2
end

local var6 = if not isNewTiltIconEnabledModule() then var2 elseif enabled() then var4 else var2
local var7 = if enabled() then var5 else var3
local var8 = if enabled() then var1.Padding.XXSmall else 2
local var9 = if enabled() then var1.Gap.Large else 16
local var10 = if enabled() then var1.Padding.Small else 12

return {
	MenuIconOpenScale = 1.25,
	MenuIconKeepOutAreaId = "roblox-menu-icon",
	HealthBarKeepOutAreaId = "health-bar",
	MoreMenuKeepOutAreaId = "more-menu",
	ChatIconKeepOutAreaId = "chat-icon",
	BackIconKeepOutAreaId = "back-icon",
	TopBarKeepOutAreaId = "roblox-topbar",
	InitialHealth = 100,
	HealthPercentForOverlay = 0.05,
	ApplyDisplayScale = function(p1)
		-- upvalues: getUIScale (ref)
		return getUIScale(false) * p1
	end,
	useDisplayScaleState = function(p1)
		-- upvalues: signalsReactModule (ref), signalsModule (ref), displayModule (ref)
		return signalsReactModule.useSignalState(signalsModule.createComputed(function(p2)
			-- upvalues: displayModule (copy), p1 (ref)
			return p1 * displayModule.GetDisplayStore(p2).getUIScale(p2)
		end))
	end,
	TopBarHeight = var6,
	TopBarHeightTenFoot = if enabled() then nil else 72,
	TopBarButtonHeight = var7,
	TopBarButtonPadding = var8,
	TopBarTopMargin = if fFlagTopBarRefactor then var1.Gap.Medium else var6 - var7 - 2 * var8,
	LegacyCloseMenuIconSize = if isNewTiltIconEnabledModule() then var6 - var1.Size.Size_100 else 30,
	MENU_ICON_SIZE = if enabled() then var1.Size.Size_600 else 24,
	UnibarFrame = {
		PaddingTop = if enabled() then var1.Padding.XXSmall else 2,
		PaddingBottom = if enabled() then var1.Padding.XXSmall else 2,
		PaddingLeft = var9 + var10 + (if isSideSheetEnabledModule then 0 else var6) + (if enabled() then var1.Padding.XXSmall else 2),
		ExtendedSize = var6 - (if enabled() then var1.Size.Size_100 else 4)
	},
	ScreenSideOffset = var9,
	ScreenSideOffsetTenFoot = if enabled() then nil else 48,
	TopBarPadding = var10,
	HealthRedColor = Color3.fromRGB(255, 28, 0),
	HealthYellowColor = Color3.fromRGB(250, 235, 0),
	HealthGreenColor = Color3.fromRGB(27, 252, 107),
	InputType = {
		MouseAndKeyBoard = "MouseAndKeyboard",
		Touch = "Touch",
		Gamepad = "Gamepad"
	},
	GamepadInputTypes = {
		Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2,
		Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4,
		Enum.UserInputType.Gamepad5, Enum.UserInputType.Gamepad6,
		Enum.UserInputType.Gamepad7, Enum.UserInputType.Gamepad8
	},
	Analytics = {
		ShowGamepadNavigationDialog = "show-gamepad-navigation-dialog",
		DismissGamepadNavigationDialog = "dismiss-gamepad-navigation-dialog",
		EventNameTopBarButtonActivated = "topbar-button-activated",
		ChatButtonName = "chat",
		MoreMenuButtonName = "more-menu",
		InventoryButtonName = "inventory",
		LeaderboardButtonName = "leaderboard",
		EmotesButtonName = "emotes",
		StatusActive = "active",
		StatusInactive = "inactive"
	},
	LocalizedKeys = {
		UILessTooltipTitle = "CoreScripts.TopBar.Label.UILessHintTitle",
		UILessTooltipDescription = "CoreScripts.TopBar.Label.UILessHintDescription"
	}
}