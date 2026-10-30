local CorePackages = game:GetService("CorePackages")
local SignalsModule = require(CorePackages.Packages.Signals)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local GetUIScaleFunction = DisplayModule.GetDisplayStore(false).getUIScale
local Parent = script.Parent.Parent
local TenFootInterfaceModule = require(Parent.TenFootInterface)
local EnabledFunction = require(CorePackages.Workspace.Packages.Chrome).Enabled
local ChromeShared = Parent.Chrome.ChromeShared
local IsNewTiltIconEnabledModule = require(Parent.isNewTiltIconEnabled)
local FFlagTopBarRefactor = require(CorePackages.Workspace.Packages.InExperienceTopBar).Flags.FFlagTopBarRefactor
local FFlagResponsiveUnitsDeprecateTenFoot = require(CorePackages.Workspace.Packages.SharedFlags).FFlagResponsiveUnitsDeprecateTenFoot
local IsSideSheetEnabledModule = require(CorePackages.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local v1 = if EnabledFunction() then require(ChromeShared.Utility.GetStyleTokens)() else nil

local function _(p1)
	-- upvalues: FFlagResponsiveUnitsDeprecateTenFoot (copy), TenFootInterfaceModule (copy), EnabledFunction (copy)
	if FFlagResponsiveUnitsDeprecateTenFoot then
		return p1
	else
		local v2: number = if TenFootInterfaceModule:IsEnabled() then 1.5 else 1
		
		return if EnabledFunction() then v2 * p1 else p1
	end
end

local Size900 = if EnabledFunction() then v1.Size.Size_900 else 36
local SizeDelta = Size900 - 4
local v2 = nil

if EnabledFunction() then
	if FFlagResponsiveUnitsDeprecateTenFoot then
		v2 = 58
	else
		local v3: number = if TenFootInterfaceModule:IsEnabled() then 1.5 else 1
		v2 = if EnabledFunction() then v3 * 58 else 58
	end
else
	v2 = 58
end
local Size1100 = if EnabledFunction() then v1.Size.Size_1100 else 44

local _ = function()
	-- upvalues: IsNewTiltIconEnabledModule (copy), Size900 (copy), EnabledFunction (copy), v2 (copy)
	return if IsNewTiltIconEnabledModule() and EnabledFunction() then v2 else Size900
end

local Size: number = if IsNewTiltIconEnabledModule() and EnabledFunction() then v2 else Size900
local Size1 = if EnabledFunction() then Size1100 else SizeDelta
local XXSmall = if EnabledFunction() then v1.Padding.XXSmall else 2
local Large = if EnabledFunction() then v1.Gap.Large else 16
local Small = if EnabledFunction() then v1.Padding.Small else 12

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
		-- upvalues: GetUIScaleFunction (copy)
		return GetUIScaleFunction(false) * p1
	end,
	useDisplayScaleState = function(p1)
		-- upvalues: SignalsReactModule (copy), SignalsModule (copy), DisplayModule (copy)
		return SignalsReactModule.useSignalState(SignalsModule.createComputed(function(p2)
			-- upvalues: DisplayModule (upval), p1 (copy)
			return p1 * DisplayModule.GetDisplayStore(p2).getUIScale(p2)
		end))
	end,
	TopBarHeight = Size,
	TopBarHeightTenFoot = if EnabledFunction() then nil else 72,
	TopBarButtonHeight = Size1,
	TopBarButtonPadding = XXSmall,
	TopBarTopMargin = if FFlagTopBarRefactor then v1.Gap.Medium else Size - Size1 - 2 * XXSmall,
	LegacyCloseMenuIconSize = if IsNewTiltIconEnabledModule() then Size - v1.Size.Size_100 else 30,
	MENU_ICON_SIZE = if EnabledFunction() then v1.Size.Size_600 else 24,
	UnibarFrame = {
		PaddingTop = if EnabledFunction() then v1.Padding.XXSmall else 2,
		PaddingBottom = if EnabledFunction() then v1.Padding.XXSmall else 2,
		PaddingLeft = Large + Small + (if IsSideSheetEnabledModule then 0 else Size) + (if EnabledFunction() then v1.Padding.XXSmall else 2),
		ExtendedSize = Size - (if EnabledFunction() then v1.Size.Size_100 else 4)
	},
	ScreenSideOffset = Large,
	ScreenSideOffsetTenFoot = if EnabledFunction() then nil else 48,
	TopBarPadding = Small,
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