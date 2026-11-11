local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UserInputService = game:GetService("UserInputService")
local AppStorageService = game:GetService("AppStorageService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local Parent = script.Parent
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local FoundationModule = require(CorePackages.Packages.Foundation)
local InputSize = FoundationModule.Enums.InputSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local BadgeVariant = FoundationModule.Enums.BadgeVariant
local AlertSeverity = FoundationModule.Enums.AlertSeverity
local Toggle = FoundationModule.Toggle
local FeedbackAlert = FoundationModule.FeedbackAlert
local Badge = FoundationModule.Badge
local DropdownMenu = UIBloxModule.App.Menu.DropdownMenu
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local Slider = FoundationModule.Slider
local ConstantsModule = require(Modules.LuaApp.Constants)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local DeviceSettingsPageContentConstantsModule = require(Parent.DeviceSettingsPageContentConstants)
local DeviceSettingsEnumModule = require(Parent.DeviceSettingsEnum)
local ChangeAccessibilitySettingFromAppModule = require(Modules.LuaApp.Analytics.Events.changeAccessibilitySettingFromApp)
local DeviceSettingsPageSettingModule = require(Parent.DeviceSettingsPageSetting)
local MasterVolumeSettingModule = require(Modules.LuaApp.Components.More.MasterVolumeSetting)
local PartyVoiceVolumeSettingsModule = require(Modules.LuaApp.Components.More.PartyVoiceVolumeSettings)
local HapticsToggleSettingModule = require(Modules.LuaApp.Components.More.HapticsToggleSetting)
local ThemeContext = require(CorePackages.Workspace.Packages.Style).ThemeContext
local LocalPlayerPartyVoiceEligibleBinderModule = require(CorePackages.Workspace.Packages.SquadsCore.LocalPlayerPartyVoiceEligibleBinder)
local VREnvironmentSettingModule = require(Modules.LuaApp.Components.More.VREnvironmentSetting)
local SkyStyleSettingModule = require(Modules.LuaApp.Components.More.SkyStyleSetting)
local CryoModule = require(CorePackages.Packages.Cryo)
local SystemThemeFeatureModule = require(Modules.LuaApp.Components.EventReceivers.SystemThemeFeature)
local SystemThemeEnabled = SystemThemeFeatureModule.GetSystemThemeEnabled()
local SystemThemeService = SystemThemeFeatureModule.GetSystemThemeService()
local SystemThemeEnum = SystemThemeFeatureModule.GetSystemThemeEnum()
local Logger = require(CorePackages.Workspace.Packages.Loggers).Logger
local Default = require(CorePackages.Workspace.Packages.AppCommonLib).Utils.AppStorageJsonCacheUtils.default
local LocalStorageKey = require(CorePackages.Workspace.Packages.LocalStorage).Enums.LocalStorageKey
local GetFFlagEnableUiNavigationKeyBindSettingInAppShellSettingsModule = require(Modules.LuaApp.Flags.GetFFlagEnableUiNavigationKeyBindSettingInAppShellSettings)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligiblePartyFunction = SharedFlagsModule.GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty
local FFlagEnableDevicePreferenceLayoutUpdateModule = require(Modules.LuaApp.Flags.FFlagEnableDevicePreferenceLayoutUpdate)
local FFlagMacMenuBarContentUpdates = SharedFlagsModule.GetFFlagMacMenuBarContentUpdates()
local GetFFlagEnableReadAloudInUAFunction = SharedFlagsModule.GetFFlagEnableReadAloudInUA
local GetFFlagSystemTrayEnabledFunction = SharedFlagsModule.GetFFlagSystemTrayEnabled
local GetFFlagHideLaunchAtStartupMacFunction = SharedFlagsModule.GetFFlagHideLaunchAtStartupMac
local UseLocalUserIdFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useLocalUserId
local GetFFlagEnableThemeUpdatedLoggingFixModule = require(Modules.LuaApp.Flags.GetFFlagEnableThemeUpdatedLoggingFix)
local GetFFlagEnableVREnvironmentSettingFunction = SharedFlagsModule.GetFFlagEnableVREnvironmentSetting
local GetFFlagEnableSkyStyleFunction = SharedFlagsModule.GetFFlagEnableSkyStyle
local Default1 = require(CorePackages.Workspace.Packages.CrossExperienceVoice).IXPManager.default
local ApplyThemeSelectionModule = require(Parent.ApplyThemeSelection)
local GetSystemThemeModule = require(Modules.LuaApp.Components.EventReceivers.GetSystemTheme)
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local FFlagEnableRobloxPlusThemeSetting = SharedFlagsModule.FFlagEnableRobloxPlusThemeSetting
local RobloxPlusThemeModule = if FFlagEnableRobloxPlusThemeSetting then require(Modules.LuaApp.Themes.RobloxPlusTheme) else nil
local GetRobloxPlusThemeStoreModule = if FFlagEnableRobloxPlusThemeSetting then require(Modules.LuaApp.Themes.Stores.GetRobloxPlusThemeStore) else nil
local UseShowRobloxPlusThemeSettingModule = if FFlagEnableRobloxPlusThemeSetting then require(Modules.LuaApp.Hooks.useShowRobloxPlusThemeSetting) else nil
local RobloxPlusThemePreviewSheetModule = if FFlagEnableRobloxPlusThemeSetting then require(Parent.RobloxPlusThemePreviewSheet) else nil
local DataHydrationModule = if FFlagEnableRobloxPlusThemeSetting then require(CorePackages.Workspace.Packages.DataHydration) else nil
local HasPartyVoiceVolume = Default1 and Default1.getHasPartyVoiceVolume()
local DeviceLevelThemeKey = DeviceSettingsPageContentConstantsModule.DeviceLevelThemeKey
local LAYOUTORDER = DeviceSettingsPageContentConstantsModule.LAYOUT_ORDER
local Order = if FFlagEnableRobloxPlusThemeSetting then RobloxPlusThemeModule.Order else {}
local UseIsSpatialFunction = require(CorePackages.Workspace.Packages.Responsive).useIsSpatial
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy

local function _()
	-- upvalues: LAYOUTORDER (copy)
	local v1 = 0
	
	return function(DeviceLevelTheme)
		-- upvalues: LAYOUTORDER (upval), v1 (ref)
		if DeviceLevelTheme then
			return LAYOUTORDER[DeviceLevelTheme]
		else
			v1 += 1
			
			return v1
		end
	end
end

local DeviceSettingsPageContent = RoactModule.PureComponent:extend("DeviceSettingsPageContent")

if SystemThemeEnabled then
	DeviceSettingsPageContent.validateProps = TModule.strictInterface({
		formFactor = TModule.string,
		platform = TModule.EnumItem,
		themeSelectedCallback = TModule.callback,
		themeCellHeight = TModule.UDim,
		userId = TModule.string,
		screenSize = TModule.Vector2,
		isSpatial = TModule.optional(TModule.boolean),
		isMacVariant = if FFlagMacMenuBarContentUpdates then TModule.optional(TModule.boolean) else nil,
		robloxPlusTheme = if FFlagEnableRobloxPlusThemeSetting then TModule.optional(TModule.string) else nil,
		setRobloxPlusTheme = if FFlagEnableRobloxPlusThemeSetting then TModule.optional(TModule.callback) else nil,
		showRobloxPlusThemeSetting = if FFlagEnableRobloxPlusThemeSetting then TModule.optional(TModule.boolean) else nil,
		canChangeRobloxPlusTheme = if FFlagEnableRobloxPlusThemeSetting then TModule.optional(TModule.boolean) else nil,
		roactAnalytics = TModule.union(TModule.Instance, TModule.table)
	})
else
	DeviceSettingsPageContent.validateProps = TModule.strictInterface({
		formFactor = TModule.string,
		platform = TModule.EnumItem,
		isSpatial = TModule.optional(TModule.boolean),
		isMacVariant = if FFlagMacMenuBarContentUpdates then TModule.optional(TModule.boolean) else nil,
		robloxPlusTheme = if FFlagEnableRobloxPlusThemeSetting then TModule.optional(TModule.string) else nil,
		setRobloxPlusTheme = if FFlagEnableRobloxPlusThemeSetting then TModule.optional(TModule.callback) else nil,
		showRobloxPlusThemeSetting = if FFlagEnableRobloxPlusThemeSetting then TModule.optional(TModule.boolean) else nil,
		canChangeRobloxPlusTheme = if FFlagEnableRobloxPlusThemeSetting then TModule.optional(TModule.boolean) else nil,
		roactAnalytics = TModule.union(TModule.Instance, TModule.table)
	})
end
function DeviceSettingsPageContent.eventDisconnect(p1)
	-- upvalues: GetFFlagEnableReadAloudInUAFunction (copy)
	if p1.onReducedMotionChangedSignal then
		p1.onReducedMotionChangedSignal:Disconnect()
		p1.onReducedMotionChangedSignal = nil
	end
	if p1.onPreferredTransparencyChangedSignal then
		p1.onPreferredTransparencyChangedSignal:Disconnect()
		p1.onPreferredTransparencyChangedSignal = nil
	end
	if p1.onPreferredTextSizeChangedSignal then
		p1.onPreferredTextSizeChangedSignal:Disconnect()
		p1.onPreferredTextSizeChangedSignal = nil
	end
	if p1.onUiNavigationKeyBindEnabledChanged then
		p1.onUiNavigationKeyBindEnabledChanged:Disconnect()
		p1.onUiNavigationKeyBindEnabledChanged = nil
	end
	if p1.onKeyboardEnabledChangedSignal then
		p1.onKeyboardEnabledChangedSignal:Disconnect()
		p1.onKeyboardEnabledChangedSignal = nil
	end
	if GetFFlagEnableReadAloudInUAFunction() and p1.onReadAloudChangedSignal then
		p1.onReadAloudChangedSignal:Disconnect()
		p1.onReadAloudChangedSignal = nil
	end
end

function DeviceSettingsPageContent.init(p1)
	-- upvalues: GetFFlagSystemTrayEnabledFunction (copy), AppStorageService (copy), UserInputService (copy), UserGameSettings (copy), GetFFlagEnableReadAloudInUAFunction (copy), LocalStorageKey (copy), GetFFlagEnableVREnvironmentSettingFunction (copy), GetFFlagEnableSkyStyleFunction (copy), FFlagEnableRobloxPlusThemeSetting (copy), GetFFlagHideLaunchAtStartupMacFunction (copy), ChangeAccessibilitySettingFromAppModule (copy), EventStreamConstantsModule (copy), DeviceSettingsEnumModule (copy)
	local function _(p2: number): number
		return 10 - math.clamp(math.floor(p2 * 10 + 0.5), 0, 10)
	end
	
	local _ = function(p2): number
		return p2.Value - 1
	end
	
	local _ = function(Key)
		-- upvalues: GetFFlagSystemTrayEnabledFunction (upval), AppStorageService (upval)
		return if GetFFlagSystemTrayEnabledFunction() then AppStorageService:GetItem(Key) == "true" else nil
	end
	
	local LaunchAtStartup = LocalStorageKey.LaunchAtStartup
	local IsTrue = if GetFFlagSystemTrayEnabledFunction() then AppStorageService:GetItem(LaunchAtStartup) == "true" else nil
	local MinimizeToTray = LocalStorageKey.MinimizeToTray
	p1.state = {
		isLocalPlayerPartyVoiceEligible = false,
		keyboardEnabled = UserInputService.KeyboardEnabled,
		reducedMotionEnabled = UserGameSettings.ReducedMotion,
		preferredTransparencyValue = 10 - math.clamp(math.floor(UserGameSettings.PreferredTransparency * 10 + 0.5), 0, 10),
		preferredTextSizeValue = UserGameSettings.PreferredTextSize.Value - 1,
		uiNavigationKeyBindEnabled = UserGameSettings.UiNavigationKeyBindEnabled,
		readAloudEnabled = if GetFFlagEnableReadAloudInUAFunction() then UserGameSettings.ReadAloud else nil,
		isLaunchAtStartupEnabled = IsTrue,
		isMinimizeToTrayEnabled = if GetFFlagSystemTrayEnabledFunction() then AppStorageService:GetItem(MinimizeToTray) == "true" else nil,
		openDropdownSetting = if GetFFlagEnableVREnvironmentSettingFunction() or GetFFlagEnableSkyStyleFunction() or FFlagEnableRobloxPlusThemeSetting then "" else nil,
		isThemePreviewSheetOpen = not FFlagEnableRobloxPlusThemeSetting and nil
	}
	
	if FFlagEnableRobloxPlusThemeSetting then
		function p1.openThemePreviewSheet()
			-- upvalues: p1 (copy)
			p1:setState({ isThemePreviewSheetOpen = true })
		end
		
		function p1.closeThemePreviewSheet()
			-- upvalues: p1 (copy)
			p1:setState({ isThemePreviewSheetOpen = false })
		end
	end
	if GetFFlagEnableVREnvironmentSettingFunction() or GetFFlagEnableSkyStyleFunction() or FFlagEnableRobloxPlusThemeSetting then
		function p1.getDropdownRowZIndex(DeviceLevelTheme): number
			-- upvalues: p1 (copy)
			return if p1.state.openDropdownSetting == DeviceLevelTheme then 3 else 2
		end
		
		function p1.onDropdownMenuOpenChange(DeviceLevelTheme, p2)
			-- upvalues: p1 (copy)
			p1:setState(function(p3)
				-- upvalues: p2 (copy), DeviceLevelTheme (copy)
				local OpenDropdownSetting = p3.openDropdownSetting
				
				if p2 then
					OpenDropdownSetting = DeviceLevelTheme
				elseif OpenDropdownSetting == DeviceLevelTheme then
					OpenDropdownSetting = ""
				end
				return { openDropdownSetting = OpenDropdownSetting }
			end)
		end
	end
	if GetFFlagSystemTrayEnabledFunction() and not GetFFlagHideLaunchAtStartupMacFunction() then
		function p1.onLaunchAtStartupActivated()
			-- upvalues: p1 (copy), AppStorageService (upval), LocalStorageKey (upval)
			local NoIsLaunchAtStartupEnabled = not p1.state.isLaunchAtStartupEnabled
			AppStorageService:SetItem(LocalStorageKey.LaunchAtStartup, (tostring(NoIsLaunchAtStartupEnabled)))
			AppStorageService:Flush()
			p1:setState({ isLaunchAtStartupEnabled = NoIsLaunchAtStartupEnabled })
		end
		
		function p1.onMinimizeToTrayActivated()
			-- upvalues: p1 (copy), AppStorageService (upval), LocalStorageKey (upval)
			local NoIsMinimizeToTrayEnabled = not p1.state.isMinimizeToTrayEnabled
			AppStorageService:SetItem(LocalStorageKey.MinimizeToTray, (tostring(NoIsMinimizeToTrayEnabled)))
			AppStorageService:Flush()
			p1:setState({ isMinimizeToTrayEnabled = NoIsMinimizeToTrayEnabled })
		end
	end
	function p1.onReducedMotionActivated()
		-- upvalues: p1 (copy), UserGameSettings (upval), ChangeAccessibilitySettingFromAppModule (upval), EventStreamConstantsModule (upval)
		local NoReducedMotionEnabled = not p1.state.reducedMotionEnabled
		UserGameSettings.ReducedMotion = NoReducedMotionEnabled
		ChangeAccessibilitySettingFromAppModule(p1.props.roactAnalytics.EventStream, EventStreamConstantsModule.Context.AccessibilitySettingsPage, "ReducedMotion", tostring(p1.state.reducedMotionEnabled), (tostring(NoReducedMotionEnabled)))
	end
	
	p1.onReducedMotionChangedSignal = UserGameSettings:GetPropertyChangedSignal("ReducedMotion"):Connect(function()
		-- upvalues: p1 (copy), UserGameSettings (upval)
		p1:setState({ reducedMotionEnabled = UserGameSettings.ReducedMotion })
	end)
	
	if GetFFlagEnableReadAloudInUAFunction() then
		function p1.onReadAloudActivated()
			-- upvalues: p1 (copy), UserGameSettings (upval), ChangeAccessibilitySettingFromAppModule (upval), EventStreamConstantsModule (upval), DeviceSettingsEnumModule (upval)
			local NoReadAloudEnabled = not p1.state.readAloudEnabled
			UserGameSettings.ReadAloud = NoReadAloudEnabled
			ChangeAccessibilitySettingFromAppModule(p1.props.roactAnalytics.EventStream, EventStreamConstantsModule.Context.AccessibilitySettingsPage, DeviceSettingsEnumModule.ReadAloud, tostring(p1.state.readAloudEnabled), (tostring(NoReadAloudEnabled)))
		end
		
		p1.onReadAloudChangedSignal = UserGameSettings:GetPropertyChangedSignal("ReadAloud"):Connect(function()
			-- upvalues: p1 (copy), UserGameSettings (upval)
			p1:setState({ readAloudEnabled = UserGameSettings.ReadAloud })
		end)
	end
	function p1.onPreferredTransparencyValueChanged(Value: number)
		-- upvalues: UserGameSettings (upval), ChangeAccessibilitySettingFromAppModule (upval), p1 (copy), EventStreamConstantsModule (upval)
		local ClampedValueRatio = (10 - math.clamp(math.floor(Value), 0, 10)) / 10
		UserGameSettings.PreferredTransparency = ClampedValueRatio
		ChangeAccessibilitySettingFromAppModule(p1.props.roactAnalytics.EventStream, EventStreamConstantsModule.Context.AccessibilitySettingsPage, "PreferredTransparency", tostring(UserGameSettings.PreferredTransparency), (tostring(ClampedValueRatio)))
	end
	
	p1.onPreferredTransparencyChangedSignal = UserGameSettings:GetPropertyChangedSignal("PreferredTransparency"):Connect(function()
		-- upvalues: p1 (copy), UserGameSettings (upval)
		p1:setState({
			preferredTransparencyValue = 10 - math.clamp(math.floor(UserGameSettings.PreferredTransparency * 10 + 0.5), 0, 10)
		})
	end)
	
	function p1.onPreferredTextSizeValueChanged(p2: number)
		-- upvalues: UserGameSettings (upval), ChangeAccessibilitySettingFromAppModule (upval), p1 (copy), EventStreamConstantsModule (upval)
		local EnumItem = Enum.PreferredTextSize:GetEnumItems()[p2 + 1]
		UserGameSettings.PreferredTextSize = EnumItem
		ChangeAccessibilitySettingFromAppModule(p1.props.roactAnalytics.EventStream, EventStreamConstantsModule.Context.AccessibilitySettingsPage, "PreferredTextSize", tostring(UserGameSettings.PreferredTextSize), (tostring(EnumItem)))
	end
	
	p1.onPreferredTextSizeChangedSignal = UserGameSettings:GetPropertyChangedSignal("PreferredTextSize"):Connect(function()
		-- upvalues: p1 (copy), UserGameSettings (upval)
		p1:setState({
			preferredTextSizeValue = UserGameSettings.PreferredTextSize.Value - 1
		})
	end)
	
	function p1.onUiNavigationKeyBindActivated()
		-- upvalues: p1 (copy), UserGameSettings (upval), ChangeAccessibilitySettingFromAppModule (upval), EventStreamConstantsModule (upval)
		local NoUiNavigationKeyBindEnabled = not p1.state.uiNavigationKeyBindEnabled
		UserGameSettings.UiNavigationKeyBindEnabled = NoUiNavigationKeyBindEnabled
		ChangeAccessibilitySettingFromAppModule(p1.props.roactAnalytics.EventStream, EventStreamConstantsModule.Context.AccessibilitySettingsPage, "UiNavigationKeyBind", tostring(p1.state.uiNavigationKeyBindEnabled), (tostring(NoUiNavigationKeyBindEnabled)))
	end
	
	p1.onUiNavigationKeyBindEnabledChanged = UserGameSettings:GetPropertyChangedSignal("UiNavigationKeyBindEnabled"):Connect(function()
		-- upvalues: p1 (copy), UserGameSettings (upval)
		p1:setState({
			uiNavigationKeyBindEnabled = UserGameSettings.UiNavigationKeyBindEnabled
		})
	end)
	p1.onKeyboardEnabledChangedSignal = UserInputService:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function()
		-- upvalues: p1 (copy), UserInputService (upval)
		p1:setState({ keyboardEnabled = UserInputService.KeyboardEnabled })
	end)
end

local function Divider(p1)
	-- upvalues: RoactModule (copy)
	local Style = p1.style
	
	return RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 1),
		BackgroundColor3 = Style.Theme.Divider.Color,
		BackgroundTransparency = Style.Theme.Divider.Transparency,
		LayoutOrder = p1.layoutOrder
	})
end

local function getThemeDropdownProperties(p1, UserId)
	-- upvalues: SystemThemeEnabled (copy), SystemThemeEnum (copy), Default (copy), SystemThemeFeatureModule (copy), DeviceLevelThemeKey (copy), GetFFlagEnableThemeUpdatedLoggingFixModule (copy)
	local Dark = nil
	local DeviceLevelThemeLight = nil
	
	if SystemThemeEnabled and SystemThemeEnum then
		local Result = Default:decodeInternal(SystemThemeFeatureModule.DeviceLevelThemeLocalStorageKey).result
		local Entry = Result and Result[UserId] or nil
		
		if Entry then
			local SystemThemeEnum1 = SystemThemeEnum.getSystemThemeEnum(Entry)
			
			if SystemThemeEnum1 == SystemThemeEnum.Light then
				Dark = DeviceLevelThemeKey.Light
				DeviceLevelThemeLight = p1.deviceLevelThemeLight
			elseif SystemThemeEnum1 == SystemThemeEnum.Dark then
				Dark = DeviceLevelThemeKey.Dark
				DeviceLevelThemeLight = p1.deviceLevelThemeDark
			elseif SystemThemeEnum1 == SystemThemeEnum.SystemLight or SystemThemeEnum1 == SystemThemeEnum.SystemDark then
				Dark = DeviceLevelThemeKey.System
				DeviceLevelThemeLight = p1.deviceLevelThemeSystem
			end
		end
	end
	if GetFFlagEnableThemeUpdatedLoggingFixModule() and SystemThemeEnabled and (DeviceLevelThemeLight == nil or DeviceLevelThemeLight == "") then
		DeviceLevelThemeLight = p1.deviceLevelThemeLight or (p1.deviceLevelThemeDark or (p1.deviceLevelThemeSystem or ""))
	end
	if GetFFlagEnableThemeUpdatedLoggingFixModule() and DeviceLevelThemeLight == nil then
		DeviceLevelThemeLight = ""
	end
	return Dark, DeviceLevelThemeLight
end

function DeviceSettingsPageContent.renderWithProviders(p1, p2, _, Style)
	-- upvalues: FormFactor (copy), LAYOUTORDER (copy), GetFFlagEnableUiNavigationKeyBindSettingInAppShellSettingsModule (copy), DeviceSettingsPageContentConstantsModule (copy), SystemThemeEnabled (copy), getThemeDropdownProperties (copy), FFlagEnableRobloxPlusThemeSetting (copy), RobloxPlusThemeModule (copy), GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligiblePartyFunction (copy), RoactModule (copy), DeviceSettingsEnumModule (copy), FFlagEnableDevicePreferenceLayoutUpdateModule (copy), DeviceSettingsPageSettingModule (copy), Toggle (copy), InputSize (copy), Divider (copy), ConstantsModule (copy), Slider (copy), FoundationModule (copy), MasterVolumeSettingModule (copy), HasPartyVoiceVolume (copy), PartyVoiceVolumeSettingsModule (copy), HapticsToggleSettingModule (copy), GetFFlagEnableVREnvironmentSettingFunction (copy), GetFFlagEnableSkyStyleFunction (copy), DropdownMenu (copy), DeviceLevelThemeKey (copy), Badge (copy), BadgeVariant (copy), FeedbackAlert (copy), AlertSeverity (copy), ButtonVariant (copy), CryoModule (copy), Order (copy), RobloxPlusThemePreviewSheetModule (copy), GetFFlagEnableReadAloudInUAFunction (copy), LocalPlayerPartyVoiceEligibleBinderModule (copy), GetFFlagSystemTrayEnabledFunction (copy), GetFFlagHideLaunchAtStartupMacFunction (copy), ReactModule (copy), VREnvironmentSettingModule (copy), SkyStyleSettingModule (copy)
	local IsFormFactorMatch = p1.props.formFactor == FormFactor.WIDE
	local v1 = 0
	
	local function v94(DeviceLevelTheme)
		-- upvalues: LAYOUTORDER (upval), v1 (ref)
		if DeviceLevelTheme then
			return LAYOUTORDER[DeviceLevelTheme]
		else
			v1 += 1
			
			return v1
		end
	end
	
	local UserId = p1.props.userId
	local IsSpatial = p1.props.isSpatial
	local NoIsSpatial = not IsSpatial
	local NoIsSpatial1 = not IsSpatial
	local KeyboardEnabled = GetFFlagEnableUiNavigationKeyBindSettingInAppShellSettingsModule() and p1.state.keyboardEnabled
	local BaseSize = Style.Font.BaseSize
	local ScaledBaseSize = BaseSize * Style.Font.Body.RelativeSize
	local ScaledBaseSize1 = BaseSize * Style.Font.CaptionBody.RelativeSize
	local BodyFont = Style.Font.Body.Font
	local CaptionBodyFont = Style.Font.CaptionBody.Font
	local ScaledStandard = Style.Tokens.Stroke.Standard * DeviceSettingsPageContentConstantsModule.CONTEXTUAL_SLIDER_BASE_WIDTH
	local DefaultKey = nil
	local Placeholder = nil
	
	if SystemThemeEnabled then
		DefaultKey, Placeholder = getThemeDropdownProperties(p2, UserId)
	end
	local HasSetRobloxPlusTheme: boolean = FFlagEnableRobloxPlusThemeSetting and (p1.props.showRobloxPlusThemeSetting == true and p1.props.setRobloxPlusTheme ~= nil)
	local IsCanChangeRobloxPlusTheme = p1.props.canChangeRobloxPlusTheme == true
	local NoIsCanChangeRobloxPlusTheme: boolean = FFlagEnableRobloxPlusThemeSetting and (HasSetRobloxPlusTheme and not IsCanChangeRobloxPlusTheme)
	local Config = if FFlagEnableRobloxPlusThemeSetting then {
		[RobloxPlusThemeModule.Default] = p2.appThemeNameDefault,
		[RobloxPlusThemeModule.Emerald] = p2.appThemeNameEmerald,
		[RobloxPlusThemeModule.Peridot] = p2.appThemeNamePeridot,
		[RobloxPlusThemeModule.Ruby] = p2.appThemeNameRuby,
		[RobloxPlusThemeModule.Rose] = p2.appThemeNameRose,
		[RobloxPlusThemeModule.Amethyst] = p2.appThemeNameAmethyst
	} else nil
	
	local function OnChange(IsLocalPlayerPartyVoiceEligible)
		-- upvalues: GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligiblePartyFunction (upval), p1 (copy)
		if GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligiblePartyFunction() then
			p1:setState({
				isLocalPlayerPartyVoiceEligible = IsLocalPlayerPartyVoiceEligible
			})
		end
	end
	
	return RoactModule.createFragment({
		Frame = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = v94(DeviceSettingsEnumModule.SettingDescription)
		}, {
			UIPadding = if FFlagEnableDevicePreferenceLayoutUpdateModule then nil else RoactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 25) }),
			SettingDescriptionText = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 0),
				Text = p2.accessibilityDescription,
				Font = BodyFont,
				TextSize = ScaledBaseSize,
				TextColor3 = Style.Theme.TextDefault.Color,
				TextTransparency = Style.Theme.TextDefault.Transparency,
				TextXAlignment = Enum.TextXAlignment.Left,
				AutomaticSize = Enum.AutomaticSize.Y
			})
		}),
		ReducedMotion = if NoIsSpatial then RoactModule.createElement(DeviceSettingsPageSettingModule, {
			style = Style,
			header = p2.reducedMotionHeader,
			description = p2.reducedMotionDescription,
			layoutOrder = v94(DeviceSettingsEnumModule.ReducedMotion),
			Control = RoactModule.createElement(Toggle, {
				label = "",
				isChecked = p1.state.reducedMotionEnabled,
				onActivated = p1.onReducedMotionActivated,
				size = InputSize.Large
			})
		}) else nil,
		Divider1 = if NoIsSpatial then Divider({
			style = Style,
			layoutOrder = v94(DeviceSettingsEnumModule.PreferredTransparencyDivider)
		}) else nil,
		PreferredTransparency = if NoIsSpatial1 then RoactModule.createElement(DeviceSettingsPageSettingModule, {
			style = Style,
			header = p2.preferredTransparencyHeader,
			description = p2.preferredTransparencyDescription,
			layoutOrder = v94(DeviceSettingsEnumModule.PreferredTransparency),
			topToBottom = not IsFormFactorMatch,
			Control = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = if IsFormFactorMatch then UDim2.new(0, ScaledStandard, 0, 0) else UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.Name,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, ConstantsModule.MORE_PAGE_SECTION_PADDING)
				}),
				ContextualSlider = RoactModule.createElement(Slider, {
					step = 1,
					width = UDim.new(1, 0),
					range = NumberRange.new(0, 10),
					value = p1.state.preferredTransparencyValue,
					onValueChanged = p1.onPreferredTransparencyValueChanged,
					size = FoundationModule.Enums.InputSize.Large,
					knobVisibility = FoundationModule.Enums.ScrollBarVisibility.Always,
					variant = FoundationModule.Enums.SliderVariant.Emphasis
				}),
				Frame = RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					UIPadding = RoactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, -10) }),
					LeftText = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						LayoutOrder = 1,
						Size = UDim2.fromScale(1, 0),
						Text = p2.preferredTransparencyTransparent,
						Font = CaptionBodyFont,
						TextSize = ScaledBaseSize1,
						TextColor3 = Style.Theme.TextMuted.Color,
						TextTransparency = Style.Theme.TextMuted.Transparency,
						TextXAlignment = Enum.TextXAlignment.Left
					}),
					RightText = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						LayoutOrder = 2,
						Size = UDim2.fromScale(1, 0),
						Text = p2.preferredTransparencyOpaque,
						Font = CaptionBodyFont,
						TextSize = ScaledBaseSize1,
						TextColor3 = Style.Theme.TextMuted.Color,
						TextTransparency = Style.Theme.TextMuted.Transparency,
						TextXAlignment = Enum.TextXAlignment.Right
					})
				})
			})
		}) else nil,
		Divider2 = if NoIsSpatial1 then Divider({
			style = Style,
			layoutOrder = v94(DeviceSettingsEnumModule.PreferredTextSizeDivider)
		}) else nil,
		PreferredTextSize = RoactModule.createElement(DeviceSettingsPageSettingModule, {
			style = Style,
			header = p2.preferredTextSizeHeader,
			description = p2.preferredTextSizeDescription,
			layoutOrder = v94(DeviceSettingsEnumModule.PreferredTextSize),
			topToBottom = not IsFormFactorMatch,
			Control = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = if IsFormFactorMatch then UDim2.new(0, ScaledStandard, 0, 0) else UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.Name,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, ConstantsModule.MORE_PAGE_SECTION_PADDING)
				}),
				ContextualSlider = RoactModule.createElement(Slider, {
					step = 1,
					width = UDim.new(1, 0),
					range = NumberRange.new(0, 3),
					value = p1.state.preferredTextSizeValue,
					onValueChanged = p1.onPreferredTextSizeValueChanged,
					size = FoundationModule.Enums.InputSize.Large,
					knobVisibility = FoundationModule.Enums.ScrollBarVisibility.Always,
					variant = FoundationModule.Enums.SliderVariant.Emphasis
				}),
				Frame = RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					UIPadding = RoactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, -10) }),
					LeftText = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						LayoutOrder = 1,
						Size = UDim2.fromScale(1, 0),
						Text = p2.preferredTextSizeDefault,
						Font = CaptionBodyFont,
						TextSize = ScaledBaseSize1,
						TextColor3 = Style.Theme.TextMuted.Color,
						TextTransparency = Style.Theme.TextMuted.Transparency,
						TextXAlignment = Enum.TextXAlignment.Left
					}),
					RightText = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						LayoutOrder = 2,
						Size = UDim2.fromScale(1, 0),
						Text = p2.preferredTextSizeLargest,
						Font = CaptionBodyFont,
						TextSize = ScaledBaseSize1,
						TextColor3 = Style.Theme.TextMuted.Color,
						TextTransparency = Style.Theme.TextMuted.Transparency,
						TextXAlignment = Enum.TextXAlignment.Right
					})
				})
			})
		}),
		Divider3 = if KeyboardEnabled then Divider({
			style = Style,
			layoutOrder = v94(DeviceSettingsEnumModule.UINavigationKeyBindDivider)
		}) else nil,
		UiNavigationKeyBind = if KeyboardEnabled then RoactModule.createElement(DeviceSettingsPageSettingModule, {
			style = Style,
			header = p2.uiNavigationKeyBindHeader,
			description = p2.uiNavigationKeyBindDescription,
			layoutOrder = v94(DeviceSettingsEnumModule.UINavigationKeyBind),
			Control = RoactModule.createElement(Toggle, {
				label = "",
				isChecked = p1.state.uiNavigationKeyBindEnabled,
				onActivated = p1.onUiNavigationKeyBindActivated,
				size = InputSize.Large
			})
		}) else nil,
		Divider4 = Divider({
			style = Style,
			layoutOrder = v94(DeviceSettingsEnumModule.ReducedMotionDivider)
		}),
		MasterVolume = RoactModule.createElement(MasterVolumeSettingModule, { layoutOrder = v94(DeviceSettingsEnumModule.MasterVolume) }),
		Divider5 = if HasPartyVoiceVolume and (not GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligiblePartyFunction() or p1.state.isLocalPlayerPartyVoiceEligible) then Divider({
			style = Style,
			layoutOrder = v94(DeviceSettingsEnumModule.PartyVoiceVolumeDivider)
		}) else nil,
		PartyVoiceVolume = if HasPartyVoiceVolume and (not GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligiblePartyFunction() or p1.state.isLocalPlayerPartyVoiceEligible) then RoactModule.createElement(PartyVoiceVolumeSettingsModule, {
			layoutOrder = v94(DeviceSettingsEnumModule.PartyVoiceVolume)
		}) else nil,
		Divider6 = Divider({
			style = Style,
			layoutOrder = v94(DeviceSettingsEnumModule.HapticsDivider)
		}),
		HapticsToggle = RoactModule.createElement(HapticsToggleSettingModule, { layoutOrder = v94(DeviceSettingsEnumModule.Haptics) }),
		Divider7 = if SystemThemeEnabled then Divider({
			style = Style,
			layoutOrder = v94(DeviceSettingsEnumModule.DeviceLevelThemeDivider)
		}) else nil,
		DeviceLevelThemeDropdown = if SystemThemeEnabled then RoactModule.createElement(DeviceSettingsPageSettingModule, {
			style = Style,
			header = if FFlagEnableRobloxPlusThemeSetting then p2.appThemeModeHeading else p2.deviceLevelThemeHeading,
			description = if FFlagEnableRobloxPlusThemeSetting then p2.appThemeModeDescription else p2.deviceLevelThemeDescription,
			layoutOrder = v94(DeviceSettingsEnumModule.DeviceLevelTheme),
			zIndex = if GetFFlagEnableVREnvironmentSettingFunction() or (GetFFlagEnableSkyStyleFunction() or FFlagEnableRobloxPlusThemeSetting) then p1.getDropdownRowZIndex(DeviceSettingsEnumModule.DeviceLevelTheme) else 2,
			topToBottom = not IsFormFactorMatch,
			Control = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = if IsFormFactorMatch then UDim2.new(0, ScaledStandard, 0, p1.props.themeCellHeight.Offset) else UDim2.new(1, 0, 0, p1.props.themeCellHeight.Offset)
			}, {
				RoactModule.createElement(DropdownMenu, {
					errorState = false,
					showDropShadow = false,
					dropdownMenuListPositionFixed = true,
					placeholder = Placeholder,
					onChange = p1.props.themeSelectedCallback,
					height = p1.props.themeCellHeight,
					screenSize = p1.props.screenSize,
					onMenuOpenChange = if GetFFlagEnableVREnvironmentSettingFunction() or (GetFFlagEnableSkyStyleFunction() or FFlagEnableRobloxPlusThemeSetting) then function(p3)
						-- upvalues: p1 (copy), DeviceSettingsEnumModule (upval)
						p1.onDropdownMenuOpenChange(DeviceSettingsEnumModule.DeviceLevelTheme, p3)
					end else nil,
					defaultKey = DefaultKey,
					cellDatas = {
						{
							key = DeviceLevelThemeKey.System,
							text = p2.deviceLevelThemeSystem
						},
						{
							key = DeviceLevelThemeKey.Dark,
							text = p2.deviceLevelThemeDark
						},
						{
							key = DeviceLevelThemeKey.Light,
							text = p2.deviceLevelThemeLight
						}
					}
				})
			})
		}) else nil,
		RobloxPlusThemeDivider = if HasSetRobloxPlusTheme then Divider({
			style = Style,
			layoutOrder = v94(DeviceSettingsEnumModule.RobloxPlusThemeDivider)
		}) else nil,
		RobloxPlusThemeDropdown = if HasSetRobloxPlusTheme then RoactModule.createElement(DeviceSettingsPageSettingModule, {
			style = Style,
			header = p2.deviceAppThemeHeading,
			headerBadge = RoactModule.createElement(Badge, {
				text = p2.appThemeBadgeNew,
				variant = BadgeVariant.Contrast
			}),
			description = p2.deviceAppThemeDescription,
			layoutOrder = v94(DeviceSettingsEnumModule.RobloxPlusTheme),
			zIndex = p1.getDropdownRowZIndex(DeviceSettingsEnumModule.RobloxPlusTheme),
			topToBottom = if NoIsCanChangeRobloxPlusTheme then true else not IsFormFactorMatch,
			Control = if NoIsCanChangeRobloxPlusTheme then RoactModule.createElement(FeedbackAlert, {
				testId = "RobloxPlusThemePreviewTrigger",
				severity = AlertSeverity.Info,
				title = p2.appThemesSheetTitle,
				description = p2.appThemeUpsellBody,
				actions = {
					{
						text = p2.appThemeTryItText,
						onActivated = p1.openThemePreviewSheet,
						variant = ButtonVariant.Standard
					}
				}
			}) else RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = if IsFormFactorMatch then UDim2.new(0, ScaledStandard, 0, p1.props.themeCellHeight.Offset) else UDim2.new(1, 0, 0, p1.props.themeCellHeight.Offset)
			}, {
				RoactModule.createElement(DropdownMenu, {
					errorState = false,
					showDropShadow = false,
					dropdownMenuListPositionFixed = true,
					placeholder = Config[p1.props.robloxPlusTheme] or Config[RobloxPlusThemeModule.Default],
					onChange = p1.props.setRobloxPlusTheme,
					height = p1.props.themeCellHeight,
					screenSize = p1.props.screenSize,
					onMenuOpenChange = function(p3)
						-- upvalues: p1 (copy), DeviceSettingsEnumModule (upval)
						p1.onDropdownMenuOpenChange(DeviceSettingsEnumModule.RobloxPlusTheme, p3)
					end,
					defaultKey = p1.props.robloxPlusTheme,
					cellDatas = CryoModule.List.map(Order, function(Key)
						-- upvalues: Config (copy), IsCanChangeRobloxPlusTheme (copy)
						return {
							key = Key,
							text = Config[Key],
							disabled = not IsCanChangeRobloxPlusTheme
						}
					end)
				})
			})
		}) else nil,
		RobloxPlusThemePreviewSheet = if NoIsCanChangeRobloxPlusTheme then RoactModule.createElement(RobloxPlusThemePreviewSheetModule, {
			isOpen = p1.state.isThemePreviewSheetOpen == true,
			onClose = p1.closeThemePreviewSheet,
			title = p2.appThemesSheetTitle,
			description = p2.appThemeUpsellBody,
			subscribeText = p2.appThemeSubscribeText,
			themeLabels = Config
		}) else nil,
		Divider8 = if GetFFlagEnableReadAloudInUAFunction() then Divider({
			style = Style,
			layoutOrder = v94(DeviceSettingsEnumModule.ReadAloudDivider)
		}) else nil,
		ReadAloud = if GetFFlagEnableReadAloudInUAFunction() then RoactModule.createElement(DeviceSettingsPageSettingModule, {
			header = "Read Aloud",
			description = "Experimental feature to allow text to be read aloud when right clicking.",
			style = Style,
			layoutOrder = v94(DeviceSettingsEnumModule.ReadAloud),
			Control = RoactModule.createElement(Toggle, {
				label = "",
				isChecked = p1.state.readAloudEnabled,
				onActivated = p1.onReadAloudActivated,
				size = InputSize.Large
			})
		}) else nil,
		LocalPlayerPartyVoiceEligibleBinder = if GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligiblePartyFunction() then RoactModule.createElement(LocalPlayerPartyVoiceEligibleBinderModule, { onChange = OnChange }) else nil,
		Divider9 = if GetFFlagSystemTrayEnabledFunction() and not GetFFlagHideLaunchAtStartupMacFunction() then Divider({
			style = Style,
			layoutOrder = v94(DeviceSettingsEnumModule.LaunchAtStartupDivider)
		}) else nil,
		LaunchAtStartup = if GetFFlagSystemTrayEnabledFunction() and not GetFFlagHideLaunchAtStartupMacFunction() then RoactModule.createElement(DeviceSettingsPageSettingModule, {
			style = Style,
			header = p2.launchAtStartupHeader,
			description = p2.launchAtStartupDescription,
			layoutOrder = v94(DeviceSettingsEnumModule.LaunchAtStartup),
			Control = RoactModule.createElement(Toggle, {
				label = "",
				isChecked = p1.state.isLaunchAtStartupEnabled,
				onActivated = p1.onLaunchAtStartupActivated,
				size = InputSize.Large
			})
		}) else nil,
		Divider10 = if GetFFlagSystemTrayEnabledFunction() then Divider({
			style = Style,
			layoutOrder = v94(DeviceSettingsEnumModule.MinimizeToTrayDivider)
		}) else nil,
		MinimizeToTray = if GetFFlagSystemTrayEnabledFunction() then RoactModule.createElement(DeviceSettingsPageSettingModule, {
			style = Style,
			header = p2.minimizeToTrayHeader,
			description = p2.minimizeToTrayDescription,
			layoutOrder = v94(DeviceSettingsEnumModule.MinimizeToTray),
			Control = RoactModule.createElement(Toggle, {
				label = "",
				isChecked = p1.state.isMinimizeToTrayEnabled,
				onActivated = p1.onMinimizeToTrayActivated,
				size = InputSize.Large
			})
		}) else nil,
		Divider11 = if GetFFlagEnableVREnvironmentSettingFunction() and not GetFFlagEnableSkyStyleFunction() and IsSpatial then Divider({
			style = Style,
			layoutOrder = v94(DeviceSettingsEnumModule.VREnvironmentSettingDivider)
		}) else nil,
		VREnvironmentSetting = if GetFFlagEnableVREnvironmentSettingFunction() and (not GetFFlagEnableSkyStyleFunction() and IsSpatial) then ReactModule.createElement(VREnvironmentSettingModule, {
			layoutOrder = v94(DeviceSettingsEnumModule.VREnvironmentSetting),
			isWideView = IsFormFactorMatch,
			contextualSliderWidth = ScaledStandard,
			screenSize = p1.props.screenSize,
			zIndex = p1.getDropdownRowZIndex(DeviceSettingsEnumModule.VREnvironmentSetting),
			onMenuOpenChange = function(p3)
				-- upvalues: p1 (copy), DeviceSettingsEnumModule (upval)
				p1.onDropdownMenuOpenChange(DeviceSettingsEnumModule.VREnvironmentSetting, p3)
			end
		}) else nil,
		Divider12 = if GetFFlagEnableSkyStyleFunction() and IsSpatial then Divider({
			style = Style,
			layoutOrder = v94(DeviceSettingsEnumModule.SkyStyleDivider)
		}) else nil,
		SkyStyle = if GetFFlagEnableSkyStyleFunction() and IsSpatial then ReactModule.createElement(SkyStyleSettingModule, {
			layoutOrder = v94(DeviceSettingsEnumModule.SkyStyle),
			isWideView = IsFormFactorMatch,
			contextualSliderWidth = ScaledStandard,
			screenSize = p1.props.screenSize,
			zIndex = p1.getDropdownRowZIndex(DeviceSettingsEnumModule.SkyStyle),
			onMenuOpenChange = function(p3)
				-- upvalues: p1 (copy), DeviceSettingsEnumModule (upval)
				p1.onDropdownMenuOpenChange(DeviceSettingsEnumModule.SkyStyle, p3)
			end
		}) else nil
	})
end

function DeviceSettingsPageContent.render(p1)
	-- upvalues: WithLocalizationModule (copy), UserInputService (copy), FFlagEnableRobloxPlusThemeSetting (copy), RobloxPlusThemeModule (copy), FFlagMacMenuBarContentUpdates (copy), WithStyleFunction (copy)
	return WithLocalizationModule({
		accessibilityDescription = "Feature.Accessibility.Description.Main",
		reducedMotionHeader = "Feature.Accessibility.Heading.ReducedMotion",
		reducedMotionDescription = "Feature.Accessibility.Description.ReducedMotion",
		preferredTransparencyHeader = "Feature.Accessibility.Heading.PreferredTransparency",
		preferredTransparencyDescription = "Feature.Accessibility.Description.PreferredTransparency",
		preferredTransparencyOpaque = "Feature.Accessibility.PreferredTransparency.Opaque",
		preferredTransparencyTransparent = "Feature.Accessibility.PreferredTransparency.Transparent",
		preferredTextSizeHeader = "Feature.Accessibility.Heading.PreferredTextSize",
		preferredTextSizeDescription = "Feature.Accessibility.Description.PreferredTextSize",
		preferredTextSizeLargest = "Feature.Accessibility.PreferredTextSize.Largest",
		preferredTextSizeDefault = "Feature.Accessibility.PreferredTextSize.Default",
		uiNavigationKeyBindHeader = "Feature.Accessibility.Heading.UiNavigationKeyBind",
		uiNavigationKeyBindDescription = {
			"Feature.Accessibility.Description.UiNavigationKeyBind",
			uiNavigationKey = UserInputService:GetStringForKeyCode(Enum.KeyCode.BackSlash)
		},
		deviceLevelThemeHeading = "Feature.Accessibility.Heading.DeviceLevelTheme",
		deviceLevelThemeDescription = "Feature.Accessibility.Description.DeviceLevelTheme",
		deviceLevelThemeDark = "Feature.Accessibility.DeviceLevelTheme.Dark",
		deviceLevelThemeLight = "Feature.Accessibility.DeviceLevelTheme.Light",
		deviceLevelThemeSystem = "Feature.Accessibility.DeviceLevelTheme.System",
		deviceAppThemeHeading = if FFlagEnableRobloxPlusThemeSetting then "Feature.Accessibility.Heading.DeviceAppTheme" else nil,
		deviceAppThemeDescription = if FFlagEnableRobloxPlusThemeSetting then "Feature.Accessibility.Description.DeviceAppTheme" else nil,
		appThemeModeHeading = if FFlagEnableRobloxPlusThemeSetting then "Feature.Accessibility.Heading.AppThemeMode" else nil,
		appThemeModeDescription = if FFlagEnableRobloxPlusThemeSetting then "Feature.Accessibility.Description.AppThemeMode" else nil,
		appThemeUpsellBody = if FFlagEnableRobloxPlusThemeSetting then "Feature.Accessibility.Label.AppThemeUpsell" else nil,
		appThemeTryItText = if FFlagEnableRobloxPlusThemeSetting then "Feature.Accessibility.Action.AppThemeTryIt" else nil,
		appThemeBadgeNew = if FFlagEnableRobloxPlusThemeSetting then "Feature.Accessibility.Label.AppThemeBadgeNew" else nil,
		appThemesSheetTitle = if FFlagEnableRobloxPlusThemeSetting then "Feature.Accessibility.Heading.AppThemes" else nil,
		appThemeSubscribeText = if FFlagEnableRobloxPlusThemeSetting then "Feature.RobloxSubscription.Action.Subscribe" else nil,
		appThemeNameDefault = if FFlagEnableRobloxPlusThemeSetting then RobloxPlusThemeModule.Labels[RobloxPlusThemeModule.Default] else nil,
		appThemeNameEmerald = if FFlagEnableRobloxPlusThemeSetting then RobloxPlusThemeModule.Labels[RobloxPlusThemeModule.Emerald] else nil,
		appThemeNamePeridot = if FFlagEnableRobloxPlusThemeSetting then RobloxPlusThemeModule.Labels[RobloxPlusThemeModule.Peridot] else nil,
		appThemeNameRuby = if FFlagEnableRobloxPlusThemeSetting then RobloxPlusThemeModule.Labels[RobloxPlusThemeModule.Ruby] else nil,
		appThemeNameRose = if FFlagEnableRobloxPlusThemeSetting then RobloxPlusThemeModule.Labels[RobloxPlusThemeModule.Rose] else nil,
		appThemeNameAmethyst = if FFlagEnableRobloxPlusThemeSetting then RobloxPlusThemeModule.Labels[RobloxPlusThemeModule.Amethyst] else nil,
		launchAtStartupHeader = if FFlagMacMenuBarContentUpdates and p1.props.isMacVariant then "Feature.Accessibility.Heading.LaunchAtLogin" else "Feature.Accessibility.Heading.LaunchAtStartup",
		launchAtStartupDescription = if FFlagMacMenuBarContentUpdates and p1.props.isMacVariant then nil else "Feature.Accessibility.Description.LaunchAtStartup",
		minimizeToTrayHeader = if FFlagMacMenuBarContentUpdates and p1.props.isMacVariant then "Feature.Accessibility.Header.ShowInMenuBar" else "Feature.Accessibility.Heading.MinimizeToTray",
		minimizeToTrayDescription = if FFlagMacMenuBarContentUpdates and p1.props.isMacVariant then nil else "Feature.Accessibility.Description.MinimizeToTray"
	})(function(p2)
		-- upvalues: WithStyleFunction (upval), p1 (copy)
		return WithStyleFunction(function(Style)
			-- upvalues: p1 (upval), p2 (copy)
			return p1:renderWithProviders(p2, Style.Theme.BackgroundDefault, Style)
		end)
	end)
end

function DeviceSettingsPageContent.willUnmount(p1)
	p1:eventDisconnect()
end

local v1 = RoactRoduxModule.connect(function(p1, _)
	-- upvalues: SystemThemeEnabled (copy)
	return {
		formFactor = p1.FormFactor,
		platform = p1.Platform,
		screenSize = if SystemThemeEnabled then p1.ScreenSize else nil
	}
end)(DeviceSettingsPageContent)

if FFlagMacMenuBarContentUpdates then
	v1 = RoactAppPolicy.connect(function(p1)
		return {
			isMacVariant = p1.getDevicePreferencesPersistentPresenceVariant() == "mac"
		}
	end)(v1)
end
local function DeviceSettingsPageContentContainer(p1)
	-- upvalues: ReactModule (copy), ThemeContext (copy), SystemThemeEnabled (copy), UseLocalUserIdFunction (copy), GetFFlagEnableThemeUpdatedLoggingFixModule (copy), ApplyThemeSelectionModule (copy), DeviceLevelThemeKey (copy), SystemThemeService (copy), GetSystemThemeModule (copy), SystemThemeEnum (copy), Logger (copy), UseTokensFunction (copy), FFlagEnableRobloxPlusThemeSetting (copy), GetRobloxPlusThemeStoreModule (copy), UseSignalStateFunction (copy), DataHydrationModule (copy), UseShowRobloxPlusThemeSettingModule (copy), CryoModule (copy), UseIsSpatialFunction (copy), v1 (ref)
	local UseLocalUserIdResult = if SystemThemeEnabled then UseLocalUserIdFunction() else nil
	local UseResult = ReactModule.useCallback(function(Dark)
		-- upvalues: GetFFlagEnableThemeUpdatedLoggingFixModule (upval), ApplyThemeSelectionModule (upval), DeviceLevelThemeKey (upval), SystemThemeService (upval), GetSystemThemeModule (upval), SystemThemeEnum (upval), Logger (upval)
		if GetFFlagEnableThemeUpdatedLoggingFixModule() then
			ApplyThemeSelectionModule(Dark, {})
			
			return
		end
		local SystemThemeModule = (if Dark == DeviceLevelThemeKey.System then SystemThemeService and GetSystemThemeModule(SystemThemeService) elseif Dark == DeviceLevelThemeKey.Light then SystemThemeEnum and SystemThemeEnum.Light else Dark == DeviceLevelThemeKey.Dark and (SystemThemeEnum and SystemThemeEnum.Dark)) or nil
		Logger:info("The user selected theme: " .. Dark .. ". Setting theme to: " .. tostring(SystemThemeModule))
		
		if SystemThemeService and SystemThemeModule then
			SystemThemeService:setTheme(SystemThemeModule)
		end
	end, { (ReactModule.useContext(ThemeContext)) })
	local _UDim = UDim.new(0, UseTokensFunction().Size.Size_1200)
	local RobloxPlusTheme = nil
	local UseResult1 = nil
	local IsRobloxPlusUpsellEligible = nil
	local HasRobloxPlusSubscription = nil
	
	if FFlagEnableRobloxPlusThemeSetting then
		local RobloxPlusThemeStoreModule = GetRobloxPlusThemeStoreModule(false)
		RobloxPlusTheme = UseSignalStateFunction(RobloxPlusThemeStoreModule.getColorThemeKey)
		UseResult1 = ReactModule.useCallback(function(p2)
			-- upvalues: RobloxPlusThemeStoreModule (copy), FFlagEnableRobloxPlusThemeSetting (upval), DataHydrationModule (upval)
			RobloxPlusThemeStoreModule.setColorThemeKey(p2)
			
			if FFlagEnableRobloxPlusThemeSetting then
				DataHydrationModule.UserSettings.getUserSettingsStore(false).updateAccountTheme(p2)
			end
		end, { RobloxPlusThemeStoreModule })
		local UseShowRobloxPlusThemeSettingModuleResult = UseShowRobloxPlusThemeSettingModule()
		IsRobloxPlusUpsellEligible = UseShowRobloxPlusThemeSettingModuleResult.isRobloxPlusUpsellEligible
		HasRobloxPlusSubscription = UseShowRobloxPlusThemeSettingModuleResult.hasRobloxPlusSubscription
	end
	return ReactModule.createElement(v1, (CryoModule.Dictionary.join(p1, {
		themeSelectedCallback = UseResult,
		themeCellHeight = _UDim,
		userId = UseLocalUserIdResult,
		isSpatial = UseIsSpatialFunction(),
		robloxPlusTheme = RobloxPlusTheme,
		setRobloxPlusTheme = UseResult1,
		showRobloxPlusThemeSetting = IsRobloxPlusUpsellEligible,
		canChangeRobloxPlusTheme = HasRobloxPlusSubscription
	})))
end

return if SystemThemeEnabled then RoactServices.connect({ roactAnalytics = RoactAnalyticsModule })(DeviceSettingsPageContentContainer) else RoactServices.connect({ roactAnalytics = RoactAnalyticsModule })(v1)