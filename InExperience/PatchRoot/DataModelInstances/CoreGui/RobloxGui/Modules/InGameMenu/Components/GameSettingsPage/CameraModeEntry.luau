local UserGameSettings = UserSettings():GetService("UserGameSettings")
local ComputerCameraMovementModePropertyChangedSignal = UserGameSettings:GetPropertyChangedSignal("ComputerCameraMovementMode")
local LocalPlayer = game:GetService("Players").LocalPlayer
local PlayerScripts = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.CoreUtility).waitForChildOfClass(LocalPlayer, "PlayerScripts")
local DevComputerMovementModePropertyChangedSignal = LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode")
local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local Parent = script.Parent.Parent.Parent
local DropDownSelectionModule = require(Parent.Components.DropDownSelection)
local ExternalEventConnectionModule = require(Parent.Utility.ExternalEventConnection)
local InputLabelModule = require(script.Parent.InputLabel)
local DeveloperLockLabelModule = require(script.Parent.DeveloperLockLabel)
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local SendAnalyticsModule = require(Parent.Utility.SendAnalytics)
local ConstantsModule = require(Parent.Resources.Constants)
local config = {
	[Enum.ComputerCameraMovementMode.Classic] = "CoreScripts.InGameMenu.GameSettings.CameraModeClassic",
	[Enum.ComputerCameraMovementMode.Follow] = "CoreScripts.InGameMenu.GameSettings.CameraModeFollow",
	[Enum.ComputerCameraMovementMode.Default] = "CoreScripts.InGameMenu.GameSettings.Default",
	[Enum.ComputerCameraMovementMode.CameraToggle] = "CoreScripts.InGameMenu.GameSettings.CameraModeCameraToggle"
}
local CameraModeEntry = Roact.PureComponent:extend("CameraModeEntry")
CameraModeEntry.validateProps = T.strictInterface({
	LayoutOrder = T.integer,
	canOpen = T.optional(T.boolean),
	canCaptureFocus = T.optional(T.boolean),
	ButtonRef = T.optional(T.union(T.callback, T.table))
})
CameraModeEntry.defaultProps = { canOpen = true }

function CameraModeEntry.init(p1) --[[ Line: 52 ]]
	-- upvalues: UserGameSettings (copy), PlayerScripts (copy), LocalPlayer (copy)
	p1:setState({
		selectedComputerMode = UserGameSettings.ComputerCameraMovementMode,
		computerOptions = PlayerScripts and PlayerScripts:GetRegisteredComputerCameraMovementModes() or {},
		developerComputerMode = LocalPlayer.DevComputerCameraMode
	})
end

function CameraModeEntry.render(p1) --[[ Line: 60 ]]
	-- upvalues: Roact (copy), ExternalEventConnectionModule (copy), ComputerCameraMovementModePropertyChangedSignal (copy), UserGameSettings (copy), PlayerScripts (copy), DevComputerMovementModePropertyChangedSignal (copy), LocalPlayer (copy), config (copy), InputLabelModule (copy), WithLocalizationModule (copy), DropDownSelectionModule (copy), SendAnalyticsModule (copy), ConstantsModule (copy), DeveloperLockLabelModule (copy)
	local config1 = {
		ComputerCameraMovementModeListener = Roact.createElement(ExternalEventConnectionModule, {
			event = ComputerCameraMovementModePropertyChangedSignal,
			callback = function() --[[ Line: 66 ]]
				-- upvalues: p1 (copy), UserGameSettings (upval)
				p1:setState({
					selectedComputerMode = UserGameSettings.ComputerCameraMovementMode
				})
			end
		}),
		ComputerCameraMovementModeRegisteredListener = PlayerScripts and Roact.createElement(ExternalEventConnectionModule, {
			event = PlayerScripts.ComputerCameraMovementModeRegistered,
			callback = function() --[[ Line: 75 ]]
				-- upvalues: p1 (copy), PlayerScripts (upval)
				p1:setState({
					computerOptions = PlayerScripts:GetRegisteredComputerCameraMovementModes()
				})
			end
		}),
		LocalPlayerComputerMovementMode = Roact.createElement(ExternalEventConnectionModule, {
			event = DevComputerMovementModePropertyChangedSignal,
			callback = function() --[[ Line: 83 ]]
				-- upvalues: p1 (copy), LocalPlayer (upval)
				p1:setState({
					developerComputerMode = LocalPlayer.DevComputerCameraMode
				})
			end
		})
	}
	
	if #p1.state.computerOptions == 0 then
		return Roact.createFragment(config1)
	end
	local IsNotDeveloperComputerModeMatch = p1.state.developerComputerMode ~= Enum.DevComputerCameraMovementMode.UserChoice
	local Selections = {}
	local SelectedIndex = 0
	
	if not IsNotDeveloperComputerModeMatch then
		for i, computerOption in ipairs(p1.state.computerOptions) do
			Selections[i] = config[computerOption]
			assert(Selections[i] ~= nil, "Camera movement mode " .. computerOption.Name .. " has no localization key")
			
			if p1.state.selectedComputerMode.Value == computerOption.Value then
				SelectedIndex = i
			end
		end
	end
	config1.CameraModeEntrySelector = Roact.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 2,
		Size = UDim2.new(1, 0, 0, 120),
		LayoutOrder = p1.props.LayoutOrder
	}, {
		Padding = Roact.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 24),
			PaddingRight = UDim.new(0, 24)
		}),
		InputLabel = Roact.createElement(InputLabelModule, {
			localizationKey = "CoreScripts.InGameMenu.GameSettings.CameraMode",
			Size = UDim2.new(1, 0, 0, 56),
			Position = UDim2.new(0, 0, 0, 0),
			AnchorPoint = Vector2.new(0, 0)
		}),
		Dropdown = WithLocalizationModule({
			placeholder = IsNotDeveloperComputerModeMatch and config[p1.state.developerComputerMode] or nil
		})(function(_) --[[ Line: 128 ]]
			-- upvalues: Roact (upval), DropDownSelectionModule (upval), Selections (copy), SelectedIndex (ref), p1 (copy), IsNotDeveloperComputerModeMatch (copy), UserGameSettings (upval), SendAnalyticsModule (upval), ConstantsModule (upval)
			return Roact.createElement(DropDownSelectionModule, {
				localize = true,
				selectionParentName = "cameraModeDropdown",
				Size = UDim2.new(1, 0, 0, 44),
				Position = UDim2.new(0, 0, 0, 56),
				selections = Selections,
				selectedIndex = SelectedIndex,
				placeHolderText = p1.state.developerComputerMode.Name,
				enabled = not IsNotDeveloperComputerModeMatch,
				selectionChanged = function(p2) --[[ Line: 137 ]]
					-- upvalues: UserGameSettings (upval), p1 (upval), SendAnalyticsModule (upval), ConstantsModule (upval)
					UserGameSettings.ComputerCameraMovementMode = p1.state.computerOptions[p2]
					SendAnalyticsModule(ConstantsModule.AnalyticsSettingsChangeName, nil, {}, true)
				end,
				canOpen = p1.props.canOpen,
				canCaptureFocus = p1.props.canCaptureFocus,
				ButtonRef = p1.props.ButtonRef
			})
		end),
		LockedLabel = IsNotDeveloperComputerModeMatch and Roact.createElement(DeveloperLockLabelModule, {
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, 0),
			Size = UDim2.new(1, -72, 0.25, 0)
		})
	})
	
	return Roact.createFragment(config1)
end

return CameraModeEntry