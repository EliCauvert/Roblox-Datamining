local playersService = game:GetService("Players")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local guiService = game:GetService("GuiService")
local corePackagesService = game:GetService("CorePackages")
local VRService = game:GetService("VRService")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local platform = game:GetService("UserInputService"):GetPlatform()
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local t = inGameMenuDependenciesModule.t
local UIBlox = inGameMenuDependenciesModule.UIBlox
local localPlayer = playersService.LocalPlayer
local devEnableMouseLockPropertyChangedSignal = localPlayer:GetPropertyChangedSignal("DevEnableMouseLock")
local isUsingCameraYInvertedPropertyChangedSignal = userGameSettingsService:GetPropertyChangedSignal("IsUsingCameraYInverted")
local focusHandlerModule = require(script.Parent.Parent.Connection.FocusHandler)
local parent = script.Parent.Parent.Parent
local dividerModule = require(parent.Components.Divider)
local externalEventConnectionModule = require(parent.Utility.ExternalEventConnection)
local pageModule = require(parent.Components.Page)
local themedTextLabelModule = require(parent.Components.ThemedTextLabel)
local withLocalizationModule = require(parent.Localization.withLocalization)
local assetsModule = require(parent.Resources.Assets)
local setCurrentPageModule = require(parent.Actions.SetCurrentPage)
local autoPropertyToggleEntryModule = require(script.Parent.AutoPropertyToggleEntry)
local safetyBubbleModeEntryModule = require(script.Parent.SafetyBubbleModeEntry)
local var20 = if game:GetEngineFeature("VRMoreComfortSettings") then require(script.Parent.ComfortSettingsEntry) else nil
local cameraModeEntryModule = require(script.Parent.CameraModeEntry)
local cameraSensitivityEntryModule = require(script.Parent.CameraSensitivityEntry)
local categoryHeaderModule = require(script.Parent.CategoryHeader)
local deviceSelectionEntryModule = require(script.Parent.DeviceSelectionEntry)
local graphicsQualityEntryModule = require(script.Parent.GraphicsQualityEntry)
local movementModeEntryModule = require(script.Parent.MovementModeEntry)
local toggleEntryModule = require(script.Parent.ToggleEntry)
local volumeEntryModule = require(script.Parent.VolumeEntry)
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)
local constantsModule = require(parent.Resources.Constants)
local withSelectionCursorProvider = UIBlox.App.SelectionImage.withSelectionCursorProvider
local cursorKind = UIBlox.App.SelectionImage.CursorKind
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local getFFlagIGMGamepadSelectionHistoryModule = require(parent.Flags.GetFFlagIGMGamepadSelectionHistory)
local getFFlagAlwaysShowVRToggleModule = require(robloxGui.Modules.Flags.GetFFlagAlwaysShowVRToggle)
local VRMoreComfortSettingsEngineFeature = game:GetEngineFeature("VRMoreComfortSettings")
local VREnabledPropertyChangedSignal = userGameSettingsService:GetPropertyChangedSignal("VREnabled")
local isVRAppBuild = require(corePackagesService.Workspace.Packages.AppCommonLib).IsVRAppBuild
local basicPage = roact.PureComponent:extend("BasicPage")
basicPage.validateProps = t.strictInterface({
	switchToAdvancedPage = t.callback,
	switchToVRComfortSettingsPage = t.callback,
	pageTitle = t.string,
	isMenuOpen = t.boolean,
	currentPage = t.optional(t.string),
	canCaptureFocus = t.optional(t.boolean),
	canGamepadCaptureFocus = t.optional(t.boolean),
	vrService = t.optional(t.union(t.Instance, t.table)),
	isVRAppBuild = t.optional(t.callback),
	currentZone = getFFlagIGMGamepadSelectionHistoryModule() and t.optional(t.number) or nil
})
basicPage.defaultProps = { vrService = VRService, isVRAppBuild = isVRAppBuild }
local VREnabled = userGameSettingsService.VREnabled

function basicPage.init(p0) --[[ line: 94 ]]
	-- upvalues: localPlayer (ref), userGameSettingsService (ref), roact (ref)
	p0:setState({
		voiceChatEnabled = false,
		shiftLockEnabled = localPlayer.DevEnableMouseLock,
		fullScreenEnabled = userGameSettingsService:InFullScreen(),
		invertedCameraEnabled = userGameSettingsService.IsUsingCameraYInverted,
		vrActive = p0.props.vrService.VREnabled,
		vrEnabled = userGameSettingsService.VREnabled
	})
	local var36, var37 = roact.createBinding(UDim2.new(0, 0, 0, 0))
	p0.pageSize = var36
	p0.setPageSize = var37
	p0.cameraModeButton = roact.createRef()
	p0.volumeButton = roact.createRef()
end

function basicPage.didUpdate(p1, p2) --[[ line: 110 ]]
	-- upvalues: getFFlagIGMGamepadSelectionHistoryModule (ref), guiService (ref)
	if not getFFlagIGMGamepadSelectionHistoryModule() and p1.props.canCaptureFocus and p1.props.canGamepadCaptureFocus and (not p2.canCaptureFocus or not p2.canGamepadCaptureFocus) then
		if not p1.state.vrActive then
			guiService.SelectedCoreObject = p1.cameraModeButton:getValue()
			
			return
		end
		guiService.SelectedCoreObject = p1.volumeButton:getValue()
	end
end

local function _() --[[ line: 127 | named "createLayoutOrderGenerator" ]]
	local var38 = 0
	
	return function() --[[ line: 129 ]]
		-- upvalues: var38 (write)
		var38 += 1
		
		return var38
	end
end

function basicPage.renderWithSelectionCursor(p3, p4) --[[ line: 135 ]]
	-- upvalues: getFFlagAlwaysShowVRToggleModule (ref), platform (ref), userGameSettingsService (ref), roact (ref), pageModule (ref), getFFlagIGMGamepadSelectionHistoryModule (ref), focusHandlerModule (ref), constantsModule (ref), guiService (ref), categoryHeaderModule (ref), VRMoreComfortSettingsEngineFeature (ref), autoPropertyToggleEntryModule (ref), var20 (write), withLocalizationModule (ref), themedTextLabelModule (ref), imageSetLabel (ref), assetsModule (ref), VREnabled (ref), safetyBubbleModeEntryModule (ref), dividerModule (ref), cameraModeEntryModule (ref), cameraSensitivityEntryModule (ref), movementModeEntryModule (ref), volumeEntryModule (ref), deviceSelectionEntryModule (ref), graphicsQualityEntryModule (ref), toggleEntryModule (ref), sendAnalyticsModule (ref), cursorKind (ref), externalEventConnectionModule (ref), devEnableMouseLockPropertyChangedSignal (ref), localPlayer (ref), isUsingCameraYInvertedPropertyChangedSignal (ref), VREnabledPropertyChangedSignal (ref)
	local var42
	local var39 = 0
	
	local var40 = function() --[[ line: 129 ]]
		-- upvalues: var39 (write)
		var39 += 1
		
		return var39
	end
	
	local var41 = p3.state.voiceChatEnabled and not p3.props.isVRAppBuild()
	
	if getFFlagAlwaysShowVRToggleModule() then
		var42 = true
		
		if platform ~= Enum.Platform.Windows then
			local _ = platform == Enum.Platform.UWP
		end
	elseif not p3.state.vrActive then
		var42 = userGameSettingsService.HasEverUsedVR and not p3.props.isVRAppBuild()
	end
	local createElement_1
	local createElement = roact.createElement
	local t = {
		pageTitle = p3.props.pageTitle,
		position = p3.props.position
	}
	local t_1 = {}
	
	if getFFlagIGMGamepadSelectionHistoryModule() then
		createElement_1 = roact.createElement
		createElement_1 = createElement_1(focusHandlerModule, {
			isFocused = p3.props.canCaptureFocus and p3.props.canGamepadCaptureFocus,
			shouldForgetPreviousSelection = if p3.props.currentPage ~= constantsModule.MainPagePageKey then p3.props.currentZone == 0 else true,
			didFocus = function(p5) --[[ line: 150 ]]
				-- upvalues: guiService (copy), p3 (ref)
				if p5 then
					guiService.SelectedCoreObject = p5
					
					return
				elseif p3.state.vrActive then
					guiService.SelectedCoreObject = p3.volumeButton:getValue()
					
					return
				end
				guiService.SelectedCoreObject = p3.cameraModeButton:getValue()
			end
		}) or nil
	end
	t_1.FocusHandler = createElement_1
	t_1.PageContents = roact.createElement("ScrollingFrame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Selectable = false,
		CanvasSize = p3.pageSize,
		Position = p3.props.position,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		Layout = roact.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			[roact.Change.AbsoluteContentSize] = function(p6) --[[ line: 172 ]]
				-- upvalues: p3 (ref)
				p3.setPageSize(UDim2.new(0, 0, 0, p6.AbsoluteContentSize.Y))
			end
		}),
		VRControlsHeader = if p3.state.vrActive then roact.createElement(categoryHeaderModule, {
			localizationKey = "CoreScripts.InGameMenu.GameSettings.VrControlsTitle",
			LayoutOrder = var40()
		}) else nil,
		VignetteEnabled = if VRMoreComfortSettingsEngineFeature or not p3.state.vrActive then nil else roact.createElement(autoPropertyToggleEntryModule, {
			labelKey = "CoreScripts.InGameMenu.GameSettings.VignetteEnabled",
			valueKey = "VignetteEnabled",
			LayoutOrder = var40(),
			instance = userGameSettingsService
		}),
		VRSmoothRotationEnabled = if VRMoreComfortSettingsEngineFeature or not p3.state.vrActive then nil else roact.createElement(autoPropertyToggleEntryModule, {
			labelKey = "CoreScripts.InGameMenu.GameSettings.VRSmoothRotationEnabled",
			valueKey = "VRSmoothRotationEnabled",
			LayoutOrder = var40(),
			instance = userGameSettingsService
		}),
		VRComfortSettings = if VRMoreComfortSettingsEngineFeature and p3.state.vrActive then roact.createElement(var20, { LayoutOrder = var40() }) else nil,
		VRComfortSettingsPageButton = if VRMoreComfortSettingsEngineFeature and p3.state.vrActive then roact.createElement("TextButton", {
			LayoutOrder = var40(),
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 54),
			Text = "",
			[roact.Event.Activated] = p3.props.switchToVRComfortSettingsPage
		}, {
			Text = withLocalizationModule({
				text = "CoreScripts.InGameMenu.GameSettings.SwitchToVRComfortSettings"
			})(function(p7) --[[ line: 213 ]]
				-- upvalues: roact (copy), themedTextLabelModule (copy)
				return roact.createElement(themedTextLabelModule, {
					fontKey = "Body",
					themeKey = "TextDefault",
					Text = p7.text,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(1, -96, 1, 0),
					Position = UDim2.new(0, 24, 0.5, 0),
					AnchorPoint = Vector2.new(0, 0.5)
				})
			end),
			Icon = roact.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				Image = assetsModule.Images.NavigateForward,
				Size = UDim2.new(0, 36, 0, 36),
				Position = UDim2.new(1, -36, 0.5, 0),
				AnchorPoint = Vector2.new(1, 0.5)
			})
		}) else nil,
		VRMode = if var42 then roact.createElement(autoPropertyToggleEntryModule, {
			labelKey = "CoreScripts.InGameMenu.GameSettings.VREnabled",
			valueKey = "VREnabled",
			subtextKey = "CoreScripts.InGameMenu.GameSettings.RestartPending",
			LayoutOrder = var40(),
			instance = userGameSettingsService,
			subtextEnabled = p3.state.vrEnabled ~= VREnabled
		}) else nil,
		VRSafetyBubbleMode = if p3.state.vrActive then roact.createElement(safetyBubbleModeEntryModule, { LayoutOrder = var40() }) else nil,
		VRControlsDivider = if p3.state.vrActive then roact.createElement(dividerModule, { LayoutOrder = var40(), Size = UDim2.new(1, -24, 0, 1) }) else nil,
		CameraHeader = if not p3.state.vrActive then roact.createElement(categoryHeaderModule, {
			localizationKey = "CoreScripts.InGameMenu.GameSettings.CameraTitle",
			LayoutOrder = var40()
		}) else nil,
		CameraMode = not p3.state.vrActive and roact.createElement(cameraModeEntryModule, {
			LayoutOrder = var40(),
			ButtonRef = p3.cameraModeButton,
			canOpen = p3.props.canCaptureFocus,
			canCaptureFocus = p3.props.canGamepadCaptureFocus
		}),
		InvertedCamera = not p3.state.vrActive and (p3.state.invertedCameraEnabled and roact.createElement(autoPropertyToggleEntryModule, {
			labelKey = "CoreScripts.InGameMenu.GameSettings.InvertedCamera",
			valueKey = "CameraYInverted",
			LayoutOrder = var40(),
			instance = userGameSettingsService
		})),
		CameraSensitivity = not p3.state.vrActive and roact.createElement(cameraSensitivityEntryModule, {
			LayoutOrder = var40(),
			canCaptureFocus = p3.props.canCaptureFocus and p3.props.canGamepadCaptureFocus,
			isMenuOpen = p3.props.isMenuOpen
		}),
		CameraDivider = if not p3.state.vrActive then roact.createElement(dividerModule, { LayoutOrder = var40(), Size = UDim2.new(1, -24, 0, 1) }) else nil,
		ControlsHeader = roact.createElement(categoryHeaderModule, {
			localizationKey = "CoreScripts.InGameMenu.GameSettings.ControlsAudio",
			LayoutOrder = var40()
		}),
		ShiftLock = not p3.state.vrActive and roact.createElement(autoPropertyToggleEntryModule, {
			labelKey = "CoreScripts.InGameMenu.GameSettings.ShiftLock",
			valueKey = "ControlMode",
			LayoutOrder = var40(),
			instance = userGameSettingsService,
			onValue = Enum.ControlMode.MouseLockSwitch,
			offValue = Enum.ControlMode.Classic,
			lockedToOff = not p3.state.shiftLockEnabled
		}),
		MovementMode = not p3.state.vrActive and roact.createElement(movementModeEntryModule, {
			LayoutOrder = var40(),
			canOpen = p3.props.canCaptureFocus,
			canCaptureFocus = p3.props.canGamepadCaptureFocus
		}),
		VolumeEntry = roact.createElement(volumeEntryModule, {
			LayoutOrder = var40(),
			buttonRef = p3.volumeButton,
			canCaptureFocus = p3.props.canCaptureFocus and p3.props.canGamepadCaptureFocus,
			isMenuOpen = p3.props.isMenuOpen
		}),
		HapticsToggle = roact.createElement(autoPropertyToggleEntryModule, {
			labelKey = "Feature.Accessibility.Header.Haptics",
			valueKey = "HapticStrength",
			onValue = 1,
			offValue = 0,
			LayoutOrder = var40(),
			instance = userGameSettingsService
		}),
		InputDevice = var41 and roact.createElement(deviceSelectionEntryModule, {
			LayoutOrder = var40(),
			deviceType = deviceSelectionEntryModule.DeviceType.Input,
			isMenuOpen = p3.props.isMenuOpen,
			canOpen = p3.props.canCaptureFocus,
			canCaptureFocus = p3.props.canGamepadCaptureFocus
		}),
		OutputDevice = var41 and roact.createElement(deviceSelectionEntryModule, {
			LayoutOrder = var40(),
			deviceType = deviceSelectionEntryModule.DeviceType.Output,
			isMenuOpen = p3.props.isMenuOpen,
			canOpen = p3.props.canCaptureFocus,
			canCaptureFocus = p3.props.canGamepadCaptureFocus
		}),
		ControlsDivider = roact.createElement(dividerModule, { LayoutOrder = var40(), Size = UDim2.new(1, -24, 0, 1) }),
		GraphicsHeader = roact.createElement(categoryHeaderModule, {
			localizationKey = "CoreScripts.InGameMenu.GameSettings.GraphicsTitle",
			LayoutOrder = var40()
		}),
		GraphicsQualityEntry = roact.createElement(graphicsQualityEntryModule, {
			LayoutOrder = var40(),
			canCaptureFocus = p3.props.canCaptureFocus and p3.props.canGamepadCaptureFocus,
			isMenuOpen = p3.props.isMenuOpen
		}),
		FullScreen = not p3.state.vrActive and roact.createElement(toggleEntryModule, {
			labelKey = "CoreScripts.InGameMenu.GameSettings.FullScreen",
			LayoutOrder = var40(),
			checked = p3.state.fullScreenEnabled,
			onToggled = function() --[[ line: 355 ]]
				-- upvalues: guiService (copy), sendAnalyticsModule (copy), constantsModule (copy)
				guiService:ToggleFullscreen()
				sendAnalyticsModule(constantsModule.AnalyticsSettingsChangeName, nil, {}, true)
			end
		}),
		GraphicsDivider = roact.createElement(dividerModule, { LayoutOrder = var40(), Size = UDim2.new(1, -24, 0, 1) }),
		AdvancedSettings = roact.createElement("TextButton", {
			LayoutOrder = var40(),
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 54),
			Text = "",
			SelectionImageObject = p4(cursorKind.Square),
			[roact.Event.Activated] = p3.props.switchToAdvancedPage
		}, {
			Text = withLocalizationModule({
				text = "CoreScripts.InGameMenu.GameSettings.SwitchToAdvancedSettings"
			})(function(p8) --[[ line: 374 ]]
				-- upvalues: roact (copy), themedTextLabelModule (copy)
				return roact.createElement(themedTextLabelModule, {
					fontKey = "Body",
					themeKey = "TextDefault",
					Text = p8.text,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(1, -96, 1, 0),
					Position = UDim2.new(0, 24, 0.5, 0),
					AnchorPoint = Vector2.new(0, 0.5)
				})
			end),
			Icon = roact.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				Image = assetsModule.Images.NavigateForward,
				Size = UDim2.new(0, 36, 0, 36),
				Position = UDim2.new(1, -36, 0.5, 0),
				AnchorPoint = Vector2.new(1, 0.5)
			})
		}),
		AdvancedDivider = roact.createElement(dividerModule, { LayoutOrder = var40(), Size = UDim2.new(1, -24, 0, 1) }),
		ShiftLockEnabledListener = roact.createElement(externalEventConnectionModule, {
			event = devEnableMouseLockPropertyChangedSignal,
			callback = function() --[[ line: 405 ]]
				-- upvalues: p3 (ref), localPlayer (copy)
				p3:setState({ shiftLockEnabled = localPlayer.DevEnableMouseLock })
			end
		}),
		FullScreenListener = roact.createElement(externalEventConnectionModule, {
			event = userGameSettingsService.FullscreenChanged,
			callback = function(p9) --[[ line: 413 ]]
				-- upvalues: p3 (ref), sendAnalyticsModule (copy), constantsModule (copy)
				p3:setState({ fullScreenEnabled = p9 })
				sendAnalyticsModule(constantsModule.AnalyticsInGameMenuName, constantsModule.AnalyticsFullscreenModeName, { enabled = p9 })
			end
		}),
		CameraYInvertedListener = roact.createElement(externalEventConnectionModule, {
			event = isUsingCameraYInvertedPropertyChangedSignal,
			callback = function() --[[ line: 425 ]]
				-- upvalues: p3 (ref), userGameSettingsService (copy)
				p3:setState({
					invertedCameraEnabled = userGameSettingsService.IsUsingCameraYInverted
				})
			end
		}),
		VRActiveListener = roact.createElement(externalEventConnectionModule, {
			event = p3.props.vrService:GetPropertyChangedSignal("VREnabled"),
			callback = function() --[[ line: 433 ]]
				-- upvalues: p3 (ref), userGameSettingsService (copy)
				if p3.props.vrService.VREnabled then
					userGameSettingsService.HasEverUsedVR = true
				end
				p3:setState({ vrActive = p3.props.vrService.VREnabled })
			end
		}),
		VREnabledListener = roact.createElement(externalEventConnectionModule, {
			event = VREnabledPropertyChangedSignal,
			callback = function() --[[ line: 444 ]]
				-- upvalues: p3 (ref), userGameSettingsService (copy)
				p3:setState({ vrEnabled = userGameSettingsService.VREnabled })
			end
		})
	})
	
	return createElement(pageModule, t, t_1)
end

function basicPage.render(p10) --[[ line: 454 ]]
	-- upvalues: withSelectionCursorProvider (ref)
	return withSelectionCursorProvider(function(p11) --[[ line: 455 ]]
		-- upvalues: p10 (ref)
		return p10:renderWithSelectionCursor(p11)
	end)
end

function basicPage.didMount(p12) --[[ line: 460 ]]
	-- upvalues: robloxGui (ref)
	spawn(function() --[[ line: 461 ]]
		-- upvalues: robloxGui (copy), p12 (ref)
		require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default:asyncInit():andThen(function() --[[ line: 466 ]]
			-- upvalues: p12 (copy)
			p12:setState({ voiceChatEnabled = true })
		end):catch(function() --[[ line: 471 ]] end)
	end)
end

return roactRodux.UNSTABLE_connect2(function(p13) --[[ line: 475 ]]
	-- upvalues: constantsModule (ref), getFFlagIGMGamepadSelectionHistoryModule (ref)
	return {
		isMenuOpen = p13.isMenuOpen,
		currentPage = p13.menuPage,
		currentZone = if getFFlagIGMGamepadSelectionHistoryModule() then p13.currentZone else nil,
		canCaptureFocus = p13.menuPage == "GameSettings" and (p13.isMenuOpen and not p13.respawn.dialogOpen),
		canGamepadCaptureFocus = p13.displayOptions.inputType == constantsModule.InputType.Gamepad and p13.currentZone == 1
	}
end, function(p14) --[[ line: 493 ]]
	-- upvalues: setCurrentPageModule (ref), constantsModule (ref)
	return {
		switchToAdvancedPage = function() --[[ line: 495 ]]
			-- upvalues: p14 (ref), setCurrentPageModule (copy), constantsModule (copy)
			p14(setCurrentPageModule(constantsModule.advancedSettingsPageKey))
		end,
		switchToVRComfortSettingsPage = function() --[[ line: 498 ]]
			-- upvalues: p14 (ref), setCurrentPageModule (copy), constantsModule (copy)
			p14(setCurrentPageModule(constantsModule.vrComfortSettingsPageKey))
		end
	}
end)(basicPage)