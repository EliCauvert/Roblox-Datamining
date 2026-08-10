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
local fFlagEnableSideSheet = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableSideSheet
local var6 = if enabled() then require(chromeShared.Utility.GetStyleTokens)() else nil

local function _(p0) --[[ line: 22 | named "withUIScale" ]]
	-- upvalues: tenFootInterfaceModule (ref), enabled (ref)
	return if enabled() then (if tenFootInterfaceModule:IsEnabled() then 1.5 else 1) * p0 else p0
end

local var7 = if enabled() then var6.Size.Size_900 else 36
local var8 = var7 - 4
local var9 = if enabled() then if enabled() then (if tenFootInterfaceModule:IsEnabled() then 1.5 else 1) * 58 else 58 else 58
local var10 = if enabled() then var6.Size.Size_1100 else 44

local _ = function() --[[ line: 32 | named "getTopbarHeight" ]]
	-- upvalues: isNewTiltIconEnabledModule (ref), var7 (ref), enabled (ref), var9 (ref)
	return if isNewTiltIconEnabledModule() then if enabled() then var9 else var7 else var7
end

local var11 = if not isNewTiltIconEnabledModule() then var7 elseif enabled() then var9 else var7
local var12 = if enabled() then var10 else var8
local var13 = if enabled() then var6.Padding.XXSmall else 2
local var14 = if enabled() then var6.Gap.Large else 16
local var15 = if enabled() then var6.Padding.Small else 12

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
	ApplyDisplayScale = function(p1) --[[ line: 63 ]]
		-- upvalues: getUIScale (ref)
		return getUIScale(false) * p1
	end,
	useDisplayScaleState = function(p2) --[[ line: 66 ]]
		-- upvalues: signalsReactModule (ref), signalsModule (ref), displayModule (ref)
		return signalsReactModule.useSignalState(signalsModule.createComputed(function(p3) --[[ line: 67 ]]
			-- upvalues: displayModule (copy), p2 (ref)
			return p2 * displayModule.GetDisplayStore(p3).getUIScale(p3)
		end))
	end,
	TopBarHeight = var11,
	TopBarHeightTenFoot = if enabled() then nil else 72,
	TopBarButtonHeight = var12,
	TopBarButtonPadding = var13,
	TopBarTopMargin = if fFlagTopBarRefactor then var6.Gap.Medium else var11 - var12 - 2 * var13,
	LegacyCloseMenuIconSize = if isNewTiltIconEnabledModule() then var11 - var6.Size.Size_100 else 30,
	MENU_ICON_SIZE = if enabled() then var6.Size.Size_600 else 24,
	UnibarFrame = {
		PaddingTop = if enabled() then var6.Padding.XXSmall else 2,
		PaddingBottom = if enabled() then var6.Padding.XXSmall else 2,
		PaddingLeft = var14 + var15 + (if fFlagEnableSideSheet then 0 else var11) + (if enabled() then var6.Padding.XXSmall else 2),
		ExtendedSize = var11 - (if enabled() then var6.Size.Size_100 else 4)
	},
	ScreenSideOffset = var14,
	ScreenSideOffsetTenFoot = if enabled() then nil else 48,
	TopBarPadding = var15,
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