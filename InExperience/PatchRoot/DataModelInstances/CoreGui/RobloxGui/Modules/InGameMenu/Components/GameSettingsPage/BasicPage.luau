local UserGameSettings = UserSettings():GetService("UserGameSettings")
local GuiService = game:GetService("GuiService")
local CorePackages = game:GetService("CorePackages")
local VRService = game:GetService("VRService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local Platform = game:GetService("UserInputService"):GetPlatform()
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local RoactRodux = InGameMenuDependenciesModule.RoactRodux
local T = InGameMenuDependenciesModule.t
local UIBlox = InGameMenuDependenciesModule.UIBlox
local LocalPlayer = game:GetService("Players").LocalPlayer
local DevEnableMouseLockPropertyChangedSignal = LocalPlayer:GetPropertyChangedSignal("DevEnableMouseLock")
local IsUsingCameraYInvertedPropertyChangedSignal = UserGameSettings:GetPropertyChangedSignal("IsUsingCameraYInverted")
local FocusHandlerModule = require(script.Parent.Parent.Connection.FocusHandler)
local Parent = script.Parent.Parent.Parent
local DividerModule = require(Parent.Components.Divider)
local ExternalEventConnectionModule = require(Parent.Utility.ExternalEventConnection)
local PageModule = require(Parent.Components.Page)
local ThemedTextLabelModule = require(Parent.Components.ThemedTextLabel)
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local AssetsModule = require(Parent.Resources.Assets)
local SetCurrentPageModule = require(Parent.Actions.SetCurrentPage)
local AutoPropertyToggleEntryModule = require(script.Parent.AutoPropertyToggleEntry)
local SafetyBubbleModeEntryModule = require(script.Parent.SafetyBubbleModeEntry)
local ComfortSettingsEntryModule = if game:GetEngineFeature("VRMoreComfortSettings") then require(script.Parent.ComfortSettingsEntry) else nil
local CameraModeEntryModule = require(script.Parent.CameraModeEntry)
local CameraSensitivityEntryModule = require(script.Parent.CameraSensitivityEntry)
local CategoryHeaderModule = require(script.Parent.CategoryHeader)
local DeviceSelectionEntryModule = require(script.Parent.DeviceSelectionEntry)
local GraphicsQualityEntryModule = require(script.Parent.GraphicsQualityEntry)
local MovementModeEntryModule = require(script.Parent.MovementModeEntry)
local ToggleEntryModule = require(script.Parent.ToggleEntry)
local VolumeEntryModule = require(script.Parent.VolumeEntry)
local SendAnalyticsModule = require(Parent.Utility.SendAnalytics)
local ConstantsModule = require(Parent.Resources.Constants)
local FoundationModule = require(CorePackages.Packages.Foundation)
local FFlagCoreUiMigrateUIBloxToFoundation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local WithCursorMigration = if FFlagCoreUiMigrateUIBloxToFoundation then FoundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local CursorType = if FFlagCoreUiMigrateUIBloxToFoundation then FoundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local GetFFlagIGMGamepadSelectionHistoryModule = require(Parent.Flags.GetFFlagIGMGamepadSelectionHistory)
local GetFFlagAlwaysShowVRToggleModule = require(RobloxGui.Modules.Flags.GetFFlagAlwaysShowVRToggle)
local VRMoreComfortSettingsEngineFeature = game:GetEngineFeature("VRMoreComfortSettings")
local VREnabledPropertyChangedSignal = UserGameSettings:GetPropertyChangedSignal("VREnabled")
local IsVRAppBuild = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local BasicPage = Roact.PureComponent:extend("BasicPage")
BasicPage.validateProps = T.strictInterface({
	switchToAdvancedPage = T.callback,
	switchToVRComfortSettingsPage = T.callback,
	pageTitle = T.string,
	isMenuOpen = T.boolean,
	currentPage = T.optional(T.string),
	canCaptureFocus = T.optional(T.boolean),
	canGamepadCaptureFocus = T.optional(T.boolean),
	vrService = T.optional(T.union(T.Instance, T.table)),
	isVRAppBuild = T.optional(T.callback),
	currentZone = GetFFlagIGMGamepadSelectionHistoryModule() and T.optional(T.number) or nil
})
BasicPage.defaultProps = { vrService = VRService, isVRAppBuild = IsVRAppBuild }
local VREnabled = UserGameSettings.VREnabled

function BasicPage.init(p1) --[[ Line: 101 ]]
	-- upvalues: LocalPlayer (copy), UserGameSettings (copy), Roact (copy)
	p1:setState({
		voiceChatEnabled = false,
		shiftLockEnabled = LocalPlayer.DevEnableMouseLock,
		fullScreenEnabled = UserGameSettings:InFullScreen(),
		invertedCameraEnabled = UserGameSettings.IsUsingCameraYInverted,
		vrActive = p1.props.vrService.VREnabled,
		vrEnabled = UserGameSettings.VREnabled
	})
	p1.pageSize, p1.setPageSize = Roact.createBinding(UDim2.new(0, 0, 0, 0))
	p1.cameraModeButton = Roact.createRef()
	p1.volumeButton = Roact.createRef()
end

function BasicPage.didUpdate(p1, p2) --[[ Line: 117 ]]
	-- upvalues: GetFFlagIGMGamepadSelectionHistoryModule (copy), GuiService (copy)
	if not GetFFlagIGMGamepadSelectionHistoryModule() and p1.props.canCaptureFocus and p1.props.canGamepadCaptureFocus and (not p2.canCaptureFocus or not p2.canGamepadCaptureFocus) then
		if not p1.state.vrActive then
			GuiService.SelectedCoreObject = p1.cameraModeButton:getValue()
			
			return
		end
		GuiService.SelectedCoreObject = p1.volumeButton:getValue()
	end
end

local function _() --[[ Line: 134 | Named "createLayoutOrderGenerator" ]]
	local v1 = 0
	
	return function(): number --[[ Line: 136 ]]
		-- upvalues: v1 (ref)
		v1 += 1
		
		return v1
	end
end

function BasicPage.renderWithSelectionCursor(p1, Callback) --[[ Line: 142 ]]
	-- upvalues: GetFFlagAlwaysShowVRToggleModule (copy), Platform (copy), UserGameSettings (copy), Roact (copy), PageModule (copy), GetFFlagIGMGamepadSelectionHistoryModule (copy), FocusHandlerModule (copy), ConstantsModule (copy), GuiService (copy), CategoryHeaderModule (copy), VRMoreComfortSettingsEngineFeature (copy), AutoPropertyToggleEntryModule (copy), ComfortSettingsEntryModule (ref), WithLocalizationModule (copy), ThemedTextLabelModule (copy), ImageSetLabel (copy), AssetsModule (copy), VREnabled (copy), SafetyBubbleModeEntryModule (copy), DividerModule (copy), CameraModeEntryModule (copy), CameraSensitivityEntryModule (copy), MovementModeEntryModule (copy), VolumeEntryModule (copy), DeviceSelectionEntryModule (copy), GraphicsQualityEntryModule (copy), ToggleEntryModule (copy), SendAnalyticsModule (copy), CursorType (copy), ExternalEventConnectionModule (copy), DevEnableMouseLockPropertyChangedSignal (copy), LocalPlayer (copy), IsUsingCameraYInvertedPropertyChangedSignal (copy), VREnabledPropertyChangedSignal (copy)
	local v1 = 0
	
	local function v51(): number --[[ Line: 136 ]]
		-- upvalues: v1 (ref)
		v1 += 1
		
		return v1
	end
	
	local Inverted: boolean = p1.state.voiceChatEnabled and not p1.props.isVRAppBuild()
	local IsPlatformMatch: boolean = if GetFFlagAlwaysShowVRToggleModule() then Platform == Enum.Platform.Windows or Platform == Enum.Platform.UWP elseif p1.state.vrActive then not p1.props.isVRAppBuild() else UserGameSettings.HasEverUsedVR and not p1.props.isVRAppBuild()
	
	return Roact.createElement(PageModule, {
		pageTitle = p1.props.pageTitle,
		position = p1.props.position
	}, {
		FocusHandler = GetFFlagIGMGamepadSelectionHistoryModule() and Roact.createElement(FocusHandlerModule, {
			isFocused = p1.props.canCaptureFocus and p1.props.canGamepadCaptureFocus,
			shouldForgetPreviousSelection = p1.props.currentPage == ConstantsModule.MainPagePageKey or p1.props.currentZone == 0,
			didFocus = function(SelectedCoreObject) --[[ Line: 157 ]]
				-- upvalues: GuiService (upval), p1 (copy)
				if SelectedCoreObject then
					GuiService.SelectedCoreObject = SelectedCoreObject
					
					return
				end
				if p1.state.vrActive then
					GuiService.SelectedCoreObject = p1.volumeButton:getValue()
					
					return
				else
					GuiService.SelectedCoreObject = p1.cameraModeButton:getValue()
				end
			end
		}) or nil,
		PageContents = Roact.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Selectable = false,
			CanvasSize = p1.pageSize,
			Position = p1.props.position,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			Layout = Roact.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				[Roact.Change.AbsoluteContentSize] = function(p2) --[[ Line: 179 ]]
					-- upvalues: p1 (copy)
					p1.setPageSize(UDim2.new(0, 0, 0, p2.AbsoluteContentSize.Y))
				end
			}),
			VRControlsHeader = if p1.state.vrActive then Roact.createElement(CategoryHeaderModule, {
				localizationKey = "CoreScripts.InGameMenu.GameSettings.VrControlsTitle",
				LayoutOrder = v51()
			}) else nil,
			VignetteEnabled = if VRMoreComfortSettingsEngineFeature or not p1.state.vrActive then nil else Roact.createElement(AutoPropertyToggleEntryModule, {
				labelKey = "CoreScripts.InGameMenu.GameSettings.VignetteEnabled",
				valueKey = "VignetteEnabled",
				LayoutOrder = v51(),
				instance = UserGameSettings
			}),
			VRSmoothRotationEnabled = if VRMoreComfortSettingsEngineFeature or not p1.state.vrActive then nil else Roact.createElement(AutoPropertyToggleEntryModule, {
				labelKey = "CoreScripts.InGameMenu.GameSettings.VRSmoothRotationEnabled",
				valueKey = "VRSmoothRotationEnabled",
				LayoutOrder = v51(),
				instance = UserGameSettings
			}),
			VRComfortSettings = if VRMoreComfortSettingsEngineFeature and p1.state.vrActive then Roact.createElement(ComfortSettingsEntryModule, { LayoutOrder = v51() }) else nil,
			VRComfortSettingsPageButton = if VRMoreComfortSettingsEngineFeature and p1.state.vrActive then Roact.createElement("TextButton", {
				LayoutOrder = v51(),
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 54),
				Text = "",
				[Roact.Event.Activated] = p1.props.switchToVRComfortSettingsPage
			}, {
				Text = WithLocalizationModule({
					text = "CoreScripts.InGameMenu.GameSettings.SwitchToVRComfortSettings"
				})(function(p2) --[[ Line: 220 ]]
					-- upvalues: Roact (upval), ThemedTextLabelModule (upval)
					return Roact.createElement(ThemedTextLabelModule, {
						fontKey = "Body",
						themeKey = "TextDefault",
						Text = p2.text,
						TextXAlignment = Enum.TextXAlignment.Left,
						Size = UDim2.new(1, -96, 1, 0),
						Position = UDim2.new(0, 24, 0.5, 0),
						AnchorPoint = Vector2.new(0, 0.5)
					})
				end),
				Icon = Roact.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Image = AssetsModule.Images.NavigateForward,
					Size = UDim2.new(0, 36, 0, 36),
					Position = UDim2.new(1, -36, 0.5, 0),
					AnchorPoint = Vector2.new(1, 0.5)
				})
			}) else nil,
			VRMode = if IsPlatformMatch then Roact.createElement(AutoPropertyToggleEntryModule, {
				labelKey = "CoreScripts.InGameMenu.GameSettings.VREnabled",
				valueKey = "VREnabled",
				subtextKey = "CoreScripts.InGameMenu.GameSettings.RestartPending",
				LayoutOrder = v51(),
				instance = UserGameSettings,
				subtextEnabled = p1.state.vrEnabled ~= VREnabled
			}) else nil,
			VRSafetyBubbleMode = if p1.state.vrActive then Roact.createElement(SafetyBubbleModeEntryModule, { LayoutOrder = v51() }) else nil,
			VRControlsDivider = if p1.state.vrActive then Roact.createElement(DividerModule, { LayoutOrder = v51(), Size = UDim2.new(1, -24, 0, 1) }) else nil,
			CameraHeader = if p1.state.vrActive then nil else Roact.createElement(CategoryHeaderModule, {
				localizationKey = "CoreScripts.InGameMenu.GameSettings.CameraTitle",
				LayoutOrder = v51()
			}),
			CameraMode = not p1.state.vrActive and Roact.createElement(CameraModeEntryModule, {
				LayoutOrder = v51(),
				ButtonRef = p1.cameraModeButton,
				canOpen = p1.props.canCaptureFocus,
				canCaptureFocus = p1.props.canGamepadCaptureFocus
			}),
			InvertedCamera = not p1.state.vrActive and (p1.state.invertedCameraEnabled and Roact.createElement(AutoPropertyToggleEntryModule, {
				labelKey = "CoreScripts.InGameMenu.GameSettings.InvertedCamera",
				valueKey = "CameraYInverted",
				LayoutOrder = v51(),
				instance = UserGameSettings
			})),
			CameraSensitivity = not p1.state.vrActive and Roact.createElement(CameraSensitivityEntryModule, {
				LayoutOrder = v51(),
				canCaptureFocus = p1.props.canCaptureFocus and p1.props.canGamepadCaptureFocus,
				isMenuOpen = p1.props.isMenuOpen
			}),
			CameraDivider = if p1.state.vrActive then nil else Roact.createElement(DividerModule, { LayoutOrder = v51(), Size = UDim2.new(1, -24, 0, 1) }),
			ControlsHeader = Roact.createElement(CategoryHeaderModule, {
				localizationKey = "CoreScripts.InGameMenu.GameSettings.ControlsAudio",
				LayoutOrder = v51()
			}),
			ShiftLock = not p1.state.vrActive and Roact.createElement(AutoPropertyToggleEntryModule, {
				labelKey = "CoreScripts.InGameMenu.GameSettings.ShiftLock",
				valueKey = "ControlMode",
				LayoutOrder = v51(),
				instance = UserGameSettings,
				onValue = Enum.ControlMode.MouseLockSwitch,
				offValue = Enum.ControlMode.Classic,
				lockedToOff = not p1.state.shiftLockEnabled
			}),
			MovementMode = not p1.state.vrActive and Roact.createElement(MovementModeEntryModule, {
				LayoutOrder = v51(),
				canOpen = p1.props.canCaptureFocus,
				canCaptureFocus = p1.props.canGamepadCaptureFocus
			}),
			VolumeEntry = Roact.createElement(VolumeEntryModule, {
				LayoutOrder = v51(),
				buttonRef = p1.volumeButton,
				canCaptureFocus = p1.props.canCaptureFocus and p1.props.canGamepadCaptureFocus,
				isMenuOpen = p1.props.isMenuOpen
			}),
			HapticsToggle = Roact.createElement(AutoPropertyToggleEntryModule, {
				labelKey = "Feature.Accessibility.Header.Haptics",
				valueKey = "HapticStrength",
				onValue = 1,
				offValue = 0,
				LayoutOrder = v51(),
				instance = UserGameSettings
			}),
			InputDevice = Inverted and Roact.createElement(DeviceSelectionEntryModule, {
				LayoutOrder = v51(),
				deviceType = DeviceSelectionEntryModule.DeviceType.Input,
				isMenuOpen = p1.props.isMenuOpen,
				canOpen = p1.props.canCaptureFocus,
				canCaptureFocus = p1.props.canGamepadCaptureFocus
			}),
			OutputDevice = Inverted and Roact.createElement(DeviceSelectionEntryModule, {
				LayoutOrder = v51(),
				deviceType = DeviceSelectionEntryModule.DeviceType.Output,
				isMenuOpen = p1.props.isMenuOpen,
				canOpen = p1.props.canCaptureFocus,
				canCaptureFocus = p1.props.canGamepadCaptureFocus
			}),
			ControlsDivider = Roact.createElement(DividerModule, { LayoutOrder = v51(), Size = UDim2.new(1, -24, 0, 1) }),
			GraphicsHeader = Roact.createElement(CategoryHeaderModule, {
				localizationKey = "CoreScripts.InGameMenu.GameSettings.GraphicsTitle",
				LayoutOrder = v51()
			}),
			GraphicsQualityEntry = Roact.createElement(GraphicsQualityEntryModule, {
				LayoutOrder = v51(),
				canCaptureFocus = p1.props.canCaptureFocus and p1.props.canGamepadCaptureFocus,
				isMenuOpen = p1.props.isMenuOpen
			}),
			FullScreen = not p1.state.vrActive and Roact.createElement(ToggleEntryModule, {
				labelKey = "CoreScripts.InGameMenu.GameSettings.FullScreen",
				LayoutOrder = v51(),
				checked = p1.state.fullScreenEnabled,
				onToggled = function() --[[ Line: 362 ]]
					-- upvalues: GuiService (upval), SendAnalyticsModule (upval), ConstantsModule (upval)
					GuiService:ToggleFullscreen()
					SendAnalyticsModule(ConstantsModule.AnalyticsSettingsChangeName, nil, {}, true)
				end
			}),
			GraphicsDivider = Roact.createElement(DividerModule, { LayoutOrder = v51(), Size = UDim2.new(1, -24, 0, 1) }),
			AdvancedSettings = Roact.createElement("TextButton", {
				LayoutOrder = v51(),
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 54),
				Text = "",
				SelectionImageObject = Callback(CursorType.Square),
				[Roact.Event.Activated] = p1.props.switchToAdvancedPage
			}, {
				Text = WithLocalizationModule({
					text = "CoreScripts.InGameMenu.GameSettings.SwitchToAdvancedSettings"
				})(function(p2) --[[ Line: 381 ]]
					-- upvalues: Roact (upval), ThemedTextLabelModule (upval)
					return Roact.createElement(ThemedTextLabelModule, {
						fontKey = "Body",
						themeKey = "TextDefault",
						Text = p2.text,
						TextXAlignment = Enum.TextXAlignment.Left,
						Size = UDim2.new(1, -96, 1, 0),
						Position = UDim2.new(0, 24, 0.5, 0),
						AnchorPoint = Vector2.new(0, 0.5)
					})
				end),
				Icon = Roact.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Image = AssetsModule.Images.NavigateForward,
					Size = UDim2.new(0, 36, 0, 36),
					Position = UDim2.new(1, -36, 0.5, 0),
					AnchorPoint = Vector2.new(1, 0.5)
				})
			}),
			AdvancedDivider = Roact.createElement(DividerModule, { LayoutOrder = v51(), Size = UDim2.new(1, -24, 0, 1) }),
			ShiftLockEnabledListener = Roact.createElement(ExternalEventConnectionModule, {
				event = DevEnableMouseLockPropertyChangedSignal,
				callback = function() --[[ Line: 412 ]]
					-- upvalues: p1 (copy), LocalPlayer (upval)
					p1:setState({ shiftLockEnabled = LocalPlayer.DevEnableMouseLock })
				end
			}),
			FullScreenListener = Roact.createElement(ExternalEventConnectionModule, {
				event = UserGameSettings.FullscreenChanged,
				callback = function(Enabled) --[[ Line: 420 ]]
					-- upvalues: p1 (copy), SendAnalyticsModule (upval), ConstantsModule (upval)
					p1:setState({ fullScreenEnabled = Enabled })
					SendAnalyticsModule(ConstantsModule.AnalyticsInGameMenuName, ConstantsModule.AnalyticsFullscreenModeName, { enabled = Enabled })
				end
			}),
			CameraYInvertedListener = Roact.createElement(ExternalEventConnectionModule, {
				event = IsUsingCameraYInvertedPropertyChangedSignal,
				callback = function() --[[ Line: 432 ]]
					-- upvalues: p1 (copy), UserGameSettings (upval)
					p1:setState({
						invertedCameraEnabled = UserGameSettings.IsUsingCameraYInverted
					})
				end
			}),
			VRActiveListener = Roact.createElement(ExternalEventConnectionModule, {
				event = p1.props.vrService:GetPropertyChangedSignal("VREnabled"),
				callback = function() --[[ Line: 440 ]]
					-- upvalues: p1 (copy), UserGameSettings (upval)
					if p1.props.vrService.VREnabled then
						UserGameSettings.HasEverUsedVR = true
					end
					p1:setState({ vrActive = p1.props.vrService.VREnabled })
				end
			}),
			VREnabledListener = Roact.createElement(ExternalEventConnectionModule, {
				event = VREnabledPropertyChangedSignal,
				callback = function() --[[ Line: 451 ]]
					-- upvalues: p1 (copy), UserGameSettings (upval)
					p1:setState({ vrEnabled = UserGameSettings.VREnabled })
				end
			})
		})
	})
end

function BasicPage.render(p1) --[[ Line: 461 ]]
	-- upvalues: WithCursorMigration (copy)
	return WithCursorMigration(function(p2) --[[ Line: 462 ]]
		-- upvalues: p1 (copy)
		return p1:renderWithSelectionCursor(p2)
	end)
end

function BasicPage.didMount(p1) --[[ Line: 467 ]]
	-- upvalues: RobloxGui (copy)
	spawn(function() --[[ Line: 468 ]]
		-- upvalues: RobloxGui (upval), p1 (copy)
		require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default:asyncInit():andThen(function() --[[ Line: 473 ]]
			-- upvalues: p1 (upval)
			p1:setState({ voiceChatEnabled = true })
		end):catch(function() --[[ Line: 478 ]] end)
	end)
end

return RoactRodux.UNSTABLE_connect2(function(p1) --[[ Line: 482 ]]
	-- upvalues: ConstantsModule (copy), GetFFlagIGMGamepadSelectionHistoryModule (copy)
	return {
		isMenuOpen = p1.isMenuOpen,
		currentPage = p1.menuPage,
		currentZone = if GetFFlagIGMGamepadSelectionHistoryModule() then p1.currentZone else nil,
		canCaptureFocus = p1.menuPage == "GameSettings" and (p1.isMenuOpen and not p1.respawn.dialogOpen),
		canGamepadCaptureFocus = p1.displayOptions.inputType == ConstantsModule.InputType.Gamepad and p1.currentZone == 1
	}
end, function(Callback) --[[ Line: 500 ]]
	-- upvalues: SetCurrentPageModule (copy), ConstantsModule (copy)
	return {
		switchToAdvancedPage = function() --[[ Line: 502 ]]
			-- upvalues: Callback (copy), SetCurrentPageModule (upval), ConstantsModule (upval)
			Callback(SetCurrentPageModule(ConstantsModule.advancedSettingsPageKey))
		end,
		switchToVRComfortSettingsPage = function() --[[ Line: 505 ]]
			-- upvalues: Callback (copy), SetCurrentPageModule (upval), ConstantsModule (upval)
			Callback(SetCurrentPageModule(ConstantsModule.vrComfortSettingsPageKey))
		end
	}
end)(BasicPage)