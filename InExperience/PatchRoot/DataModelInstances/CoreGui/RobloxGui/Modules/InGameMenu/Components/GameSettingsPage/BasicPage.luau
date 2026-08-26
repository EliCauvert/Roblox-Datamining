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
local var1 = if game:GetEngineFeature("VRMoreComfortSettings") then require(script.Parent.ComfortSettingsEntry) else nil
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
local foundationModule = require(corePackagesService.Packages.Foundation)
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local var2 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var3 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
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

function basicPage.init(p1)
	-- upvalues: localPlayer (ref), userGameSettingsService (ref), roact (ref)
	p1:setState({
		voiceChatEnabled = false,
		shiftLockEnabled = localPlayer.DevEnableMouseLock,
		fullScreenEnabled = userGameSettingsService:InFullScreen(),
		invertedCameraEnabled = userGameSettingsService.IsUsingCameraYInverted,
		vrActive = p1.props.vrService.VREnabled,
		vrEnabled = userGameSettingsService.VREnabled
	})
	local var4, var5 = roact.createBinding(UDim2.new(0, 0, 0, 0))
	p1.pageSize = var4
	p1.setPageSize = var5
	p1.cameraModeButton = roact.createRef()
	p1.volumeButton = roact.createRef()
end

function basicPage.didUpdate(p1, p2)
	-- upvalues: getFFlagIGMGamepadSelectionHistoryModule (ref), guiService (ref)
	if not getFFlagIGMGamepadSelectionHistoryModule() and p1.props.canCaptureFocus and p1.props.canGamepadCaptureFocus and (not p2.canCaptureFocus or not p2.canGamepadCaptureFocus) then
		if not p1.state.vrActive then
			guiService.SelectedCoreObject = p1.cameraModeButton:getValue()
			
			return
		end
		guiService.SelectedCoreObject = p1.volumeButton:getValue()
	end
end

local function _()
	local var4 = 0
	
	return function()
		-- upvalues: var4 (write)
		var4 += 1
		
		return var4
	end
end

function basicPage.renderWithSelectionCursor(p1, p2)
	-- upvalues: getFFlagAlwaysShowVRToggleModule (ref), platform (ref), userGameSettingsService (ref), roact (ref), pageModule (ref), getFFlagIGMGamepadSelectionHistoryModule (ref), focusHandlerModule (ref), constantsModule (ref), guiService (ref), categoryHeaderModule (ref), VRMoreComfortSettingsEngineFeature (ref), autoPropertyToggleEntryModule (ref), var1 (write), withLocalizationModule (ref), themedTextLabelModule (ref), imageSetLabel (ref), assetsModule (ref), VREnabled (ref), safetyBubbleModeEntryModule (ref), dividerModule (ref), cameraModeEntryModule (ref), cameraSensitivityEntryModule (ref), movementModeEntryModule (ref), volumeEntryModule (ref), deviceSelectionEntryModule (ref), graphicsQualityEntryModule (ref), toggleEntryModule (ref), sendAnalyticsModule (ref), var3 (ref), externalEventConnectionModule (ref), devEnableMouseLockPropertyChangedSignal (ref), localPlayer (ref), isUsingCameraYInvertedPropertyChangedSignal (ref), VREnabledPropertyChangedSignal (ref)
	local var4
	local var5 = 0
	
	local var6 = function()
		-- upvalues: var5 (write)
		var5 += 1
		
		return var5
	end
	
	local var7 = p1.state.voiceChatEnabled and not p1.props.isVRAppBuild()
	
	if getFFlagAlwaysShowVRToggleModule() then
		var4 = true
		
		if platform ~= Enum.Platform.Windows then
			local _ = platform == Enum.Platform.UWP
		end
	elseif not p1.state.vrActive then
		var4 = userGameSettingsService.HasEverUsedVR and not p1.props.isVRAppBuild()
	end
	local createElement_1
	local createElement = roact.createElement
	local t = {
		pageTitle = p1.props.pageTitle,
		position = p1.props.position
	}
	local t_1 = {}
	
	if getFFlagIGMGamepadSelectionHistoryModule() then
		createElement_1 = roact.createElement
		createElement_1 = createElement_1(focusHandlerModule, {
			isFocused = p1.props.canCaptureFocus and p1.props.canGamepadCaptureFocus,
			shouldForgetPreviousSelection = if p1.props.currentPage ~= constantsModule.MainPagePageKey then p1.props.currentZone == 0 else true,
			didFocus = function(p3)
				-- upvalues: guiService (copy), p1 (ref)
				if p3 then
					guiService.SelectedCoreObject = p3
					
					return
				elseif p1.state.vrActive then
					guiService.SelectedCoreObject = p1.volumeButton:getValue()
					
					return
				end
				guiService.SelectedCoreObject = p1.cameraModeButton:getValue()
			end
		}) or nil
	end
	t_1.FocusHandler = createElement_1
	t_1.PageContents = roact.createElement("ScrollingFrame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Selectable = false,
		CanvasSize = p1.pageSize,
		Position = p1.props.position,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		Layout = roact.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			[roact.Change.AbsoluteContentSize] = function(p3)
				-- upvalues: p1 (ref)
				p1.setPageSize(UDim2.new(0, 0, 0, p3.AbsoluteContentSize.Y))
			end
		}),
		VRControlsHeader = if p1.state.vrActive then roact.createElement(categoryHeaderModule, {
			localizationKey = "CoreScripts.InGameMenu.GameSettings.VrControlsTitle",
			LayoutOrder = var6()
		}) else nil,
		VignetteEnabled = if VRMoreComfortSettingsEngineFeature or not p1.state.vrActive then nil else roact.createElement(autoPropertyToggleEntryModule, {
			labelKey = "CoreScripts.InGameMenu.GameSettings.VignetteEnabled",
			valueKey = "VignetteEnabled",
			LayoutOrder = var6(),
			instance = userGameSettingsService
		}),
		VRSmoothRotationEnabled = if VRMoreComfortSettingsEngineFeature or not p1.state.vrActive then nil else roact.createElement(autoPropertyToggleEntryModule, {
			labelKey = "CoreScripts.InGameMenu.GameSettings.VRSmoothRotationEnabled",
			valueKey = "VRSmoothRotationEnabled",
			LayoutOrder = var6(),
			instance = userGameSettingsService
		}),
		VRComfortSettings = if VRMoreComfortSettingsEngineFeature and p1.state.vrActive then roact.createElement(var1, { LayoutOrder = var6() }) else nil,
		VRComfortSettingsPageButton = if VRMoreComfortSettingsEngineFeature and p1.state.vrActive then roact.createElement("TextButton", {
			LayoutOrder = var6(),
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 54),
			Text = "",
			[roact.Event.Activated] = p1.props.switchToVRComfortSettingsPage
		}, {
			Text = withLocalizationModule({
				text = "CoreScripts.InGameMenu.GameSettings.SwitchToVRComfortSettings"
			})(function(p3)
				-- upvalues: roact (copy), themedTextLabelModule (copy)
				return roact.createElement(themedTextLabelModule, {
					fontKey = "Body",
					themeKey = "TextDefault",
					Text = p3.text,
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
		VRMode = if var4 then roact.createElement(autoPropertyToggleEntryModule, {
			labelKey = "CoreScripts.InGameMenu.GameSettings.VREnabled",
			valueKey = "VREnabled",
			subtextKey = "CoreScripts.InGameMenu.GameSettings.RestartPending",
			LayoutOrder = var6(),
			instance = userGameSettingsService,
			subtextEnabled = p1.state.vrEnabled ~= VREnabled
		}) else nil,
		VRSafetyBubbleMode = if p1.state.vrActive then roact.createElement(safetyBubbleModeEntryModule, { LayoutOrder = var6() }) else nil,
		VRControlsDivider = if p1.state.vrActive then roact.createElement(dividerModule, { LayoutOrder = var6(), Size = UDim2.new(1, -24, 0, 1) }) else nil,
		CameraHeader = if not p1.state.vrActive then roact.createElement(categoryHeaderModule, {
			localizationKey = "CoreScripts.InGameMenu.GameSettings.CameraTitle",
			LayoutOrder = var6()
		}) else nil,
		CameraMode = not p1.state.vrActive and roact.createElement(cameraModeEntryModule, {
			LayoutOrder = var6(),
			ButtonRef = p1.cameraModeButton,
			canOpen = p1.props.canCaptureFocus,
			canCaptureFocus = p1.props.canGamepadCaptureFocus
		}),
		InvertedCamera = not p1.state.vrActive and (p1.state.invertedCameraEnabled and roact.createElement(autoPropertyToggleEntryModule, {
			labelKey = "CoreScripts.InGameMenu.GameSettings.InvertedCamera",
			valueKey = "CameraYInverted",
			LayoutOrder = var6(),
			instance = userGameSettingsService
		})),
		CameraSensitivity = not p1.state.vrActive and roact.createElement(cameraSensitivityEntryModule, {
			LayoutOrder = var6(),
			canCaptureFocus = p1.props.canCaptureFocus and p1.props.canGamepadCaptureFocus,
			isMenuOpen = p1.props.isMenuOpen
		}),
		CameraDivider = if not p1.state.vrActive then roact.createElement(dividerModule, { LayoutOrder = var6(), Size = UDim2.new(1, -24, 0, 1) }) else nil,
		ControlsHeader = roact.createElement(categoryHeaderModule, {
			localizationKey = "CoreScripts.InGameMenu.GameSettings.ControlsAudio",
			LayoutOrder = var6()
		}),
		ShiftLock = not p1.state.vrActive and roact.createElement(autoPropertyToggleEntryModule, {
			labelKey = "CoreScripts.InGameMenu.GameSettings.ShiftLock",
			valueKey = "ControlMode",
			LayoutOrder = var6(),
			instance = userGameSettingsService,
			onValue = Enum.ControlMode.MouseLockSwitch,
			offValue = Enum.ControlMode.Classic,
			lockedToOff = not p1.state.shiftLockEnabled
		}),
		MovementMode = not p1.state.vrActive and roact.createElement(movementModeEntryModule, {
			LayoutOrder = var6(),
			canOpen = p1.props.canCaptureFocus,
			canCaptureFocus = p1.props.canGamepadCaptureFocus
		}),
		VolumeEntry = roact.createElement(volumeEntryModule, {
			LayoutOrder = var6(),
			buttonRef = p1.volumeButton,
			canCaptureFocus = p1.props.canCaptureFocus and p1.props.canGamepadCaptureFocus,
			isMenuOpen = p1.props.isMenuOpen
		}),
		HapticsToggle = roact.createElement(autoPropertyToggleEntryModule, {
			labelKey = "Feature.Accessibility.Header.Haptics",
			valueKey = "HapticStrength",
			onValue = 1,
			offValue = 0,
			LayoutOrder = var6(),
			instance = userGameSettingsService
		}),
		InputDevice = var7 and roact.createElement(deviceSelectionEntryModule, {
			LayoutOrder = var6(),
			deviceType = deviceSelectionEntryModule.DeviceType.Input,
			isMenuOpen = p1.props.isMenuOpen,
			canOpen = p1.props.canCaptureFocus,
			canCaptureFocus = p1.props.canGamepadCaptureFocus
		}),
		OutputDevice = var7 and roact.createElement(deviceSelectionEntryModule, {
			LayoutOrder = var6(),
			deviceType = deviceSelectionEntryModule.DeviceType.Output,
			isMenuOpen = p1.props.isMenuOpen,
			canOpen = p1.props.canCaptureFocus,
			canCaptureFocus = p1.props.canGamepadCaptureFocus
		}),
		ControlsDivider = roact.createElement(dividerModule, { LayoutOrder = var6(), Size = UDim2.new(1, -24, 0, 1) }),
		GraphicsHeader = roact.createElement(categoryHeaderModule, {
			localizationKey = "CoreScripts.InGameMenu.GameSettings.GraphicsTitle",
			LayoutOrder = var6()
		}),
		GraphicsQualityEntry = roact.createElement(graphicsQualityEntryModule, {
			LayoutOrder = var6(),
			canCaptureFocus = p1.props.canCaptureFocus and p1.props.canGamepadCaptureFocus,
			isMenuOpen = p1.props.isMenuOpen
		}),
		FullScreen = not p1.state.vrActive and roact.createElement(toggleEntryModule, {
			labelKey = "CoreScripts.InGameMenu.GameSettings.FullScreen",
			LayoutOrder = var6(),
			checked = p1.state.fullScreenEnabled,
			onToggled = function()
				-- upvalues: guiService (copy), sendAnalyticsModule (copy), constantsModule (copy)
				guiService:ToggleFullscreen()
				sendAnalyticsModule(constantsModule.AnalyticsSettingsChangeName, nil, {}, true)
			end
		}),
		GraphicsDivider = roact.createElement(dividerModule, { LayoutOrder = var6(), Size = UDim2.new(1, -24, 0, 1) }),
		AdvancedSettings = roact.createElement("TextButton", {
			LayoutOrder = var6(),
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 54),
			Text = "",
			SelectionImageObject = p2(var3.Square),
			[roact.Event.Activated] = p1.props.switchToAdvancedPage
		}, {
			Text = withLocalizationModule({
				text = "CoreScripts.InGameMenu.GameSettings.SwitchToAdvancedSettings"
			})(function(p3)
				-- upvalues: roact (copy), themedTextLabelModule (copy)
				return roact.createElement(themedTextLabelModule, {
					fontKey = "Body",
					themeKey = "TextDefault",
					Text = p3.text,
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
		AdvancedDivider = roact.createElement(dividerModule, { LayoutOrder = var6(), Size = UDim2.new(1, -24, 0, 1) }),
		ShiftLockEnabledListener = roact.createElement(externalEventConnectionModule, {
			event = devEnableMouseLockPropertyChangedSignal,
			callback = function()
				-- upvalues: p1 (ref), localPlayer (copy)
				p1:setState({ shiftLockEnabled = localPlayer.DevEnableMouseLock })
			end
		}),
		FullScreenListener = roact.createElement(externalEventConnectionModule, {
			event = userGameSettingsService.FullscreenChanged,
			callback = function(p3)
				-- upvalues: p1 (ref), sendAnalyticsModule (copy), constantsModule (copy)
				p1:setState({ fullScreenEnabled = p3 })
				sendAnalyticsModule(constantsModule.AnalyticsInGameMenuName, constantsModule.AnalyticsFullscreenModeName, { enabled = p3 })
			end
		}),
		CameraYInvertedListener = roact.createElement(externalEventConnectionModule, {
			event = isUsingCameraYInvertedPropertyChangedSignal,
			callback = function()
				-- upvalues: p1 (ref), userGameSettingsService (copy)
				p1:setState({
					invertedCameraEnabled = userGameSettingsService.IsUsingCameraYInverted
				})
			end
		}),
		VRActiveListener = roact.createElement(externalEventConnectionModule, {
			event = p1.props.vrService:GetPropertyChangedSignal("VREnabled"),
			callback = function()
				-- upvalues: p1 (ref), userGameSettingsService (copy)
				if p1.props.vrService.VREnabled then
					userGameSettingsService.HasEverUsedVR = true
				end
				p1:setState({ vrActive = p1.props.vrService.VREnabled })
			end
		}),
		VREnabledListener = roact.createElement(externalEventConnectionModule, {
			event = VREnabledPropertyChangedSignal,
			callback = function()
				-- upvalues: p1 (ref), userGameSettingsService (copy)
				p1:setState({ vrEnabled = userGameSettingsService.VREnabled })
			end
		})
	})
	
	return createElement(pageModule, t, t_1)
end

function basicPage.render(p1)
	-- upvalues: var2 (ref)
	return var2(function(p2)
		-- upvalues: p1 (ref)
		return p1:renderWithSelectionCursor(p2)
	end)
end

function basicPage.didMount(p1)
	-- upvalues: robloxGui (ref)
	spawn(function()
		-- upvalues: robloxGui (copy), p1 (ref)
		require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default:asyncInit():andThen(function()
			-- upvalues: p1 (copy)
			p1:setState({ voiceChatEnabled = true })
		end):catch(function() end)
	end)
end

return roactRodux.UNSTABLE_connect2(function(p1)
	-- upvalues: constantsModule (ref), getFFlagIGMGamepadSelectionHistoryModule (ref)
	return {
		isMenuOpen = p1.isMenuOpen,
		currentPage = p1.menuPage,
		currentZone = if getFFlagIGMGamepadSelectionHistoryModule() then p1.currentZone else nil,
		canCaptureFocus = p1.menuPage == "GameSettings" and (p1.isMenuOpen and not p1.respawn.dialogOpen),
		canGamepadCaptureFocus = p1.displayOptions.inputType == constantsModule.InputType.Gamepad and p1.currentZone == 1
	}
end, function(p1)
	-- upvalues: setCurrentPageModule (ref), constantsModule (ref)
	return {
		switchToAdvancedPage = function()
			-- upvalues: p1 (ref), setCurrentPageModule (copy), constantsModule (copy)
			p1(setCurrentPageModule(constantsModule.advancedSettingsPageKey))
		end,
		switchToVRComfortSettingsPage = function()
			-- upvalues: p1 (ref), setCurrentPageModule (copy), constantsModule (copy)
			p1(setCurrentPageModule(constantsModule.vrComfortSettingsPageKey))
		end
	}
end)(basicPage)