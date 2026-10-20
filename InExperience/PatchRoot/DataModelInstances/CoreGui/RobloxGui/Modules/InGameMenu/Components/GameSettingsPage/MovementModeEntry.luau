local UserGameSettings = UserSettings():GetService("UserGameSettings")
local ComputerMovementModePropertyChangedSignal = UserGameSettings:GetPropertyChangedSignal("ComputerMovementMode")
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
	[Enum.ComputerMovementMode.KeyboardMouse] = "CoreScripts.InGameMenu.GameSettings.ComputerMoveModeKeyboardMouse",
	[Enum.ComputerMovementMode.ClickToMove] = "CoreScripts.InGameMenu.GameSettings.ComputerMoveModeClickToMove",
	[Enum.ComputerMovementMode.Default] = "CoreScripts.InGameMenu.GameSettings.Default"
}
local config1 = {
	[Enum.DevComputerMovementMode.KeyboardMouse] = "CoreScripts.InGameMenu.GameSettings.ComputerMoveModeKeyboardMouse",
	[Enum.DevComputerMovementMode.ClickToMove] = "CoreScripts.InGameMenu.GameSettings.ComputerMoveModeClickToMove"
}
local MovementModeEntry = Roact.PureComponent:extend("MovementModeEntry")
MovementModeEntry.validateProps = T.strictInterface({
	LayoutOrder = T.integer,
	canOpen = T.optional(T.boolean),
	canCaptureFocus = T.optional(T.boolean)
})
MovementModeEntry.defaultProps = { canOpen = true }

function MovementModeEntry.init(p1)
	-- upvalues: UserGameSettings (copy), PlayerScripts (copy), LocalPlayer (copy)
	p1:setState({
		selectedComputerMode = UserGameSettings.ComputerMovementMode,
		computerOptions = PlayerScripts and PlayerScripts:GetRegisteredComputerMovementModes() or {},
		developerComputerMode = LocalPlayer.DevComputerMovementMode
	})
end

function MovementModeEntry.render(p1)
	-- upvalues: Roact (copy), ExternalEventConnectionModule (copy), ComputerMovementModePropertyChangedSignal (copy), UserGameSettings (copy), PlayerScripts (copy), DevComputerMovementModePropertyChangedSignal (copy), LocalPlayer (copy), config (copy), InputLabelModule (copy), WithLocalizationModule (copy), config1 (copy), DropDownSelectionModule (copy), SendAnalyticsModule (copy), ConstantsModule (copy), DeveloperLockLabelModule (copy)
	local config2 = {
		ComputerMovementModeListener = Roact.createElement(ExternalEventConnectionModule, {
			event = ComputerMovementModePropertyChangedSignal,
			callback = function()
				-- upvalues: p1 (copy), UserGameSettings (upval)
				p1:setState({
					selectedComputerMode = UserGameSettings.ComputerMovementMode
				})
			end
		}),
		ComputerMovementModeRegisteredListener = PlayerScripts and Roact.createElement(ExternalEventConnectionModule, {
			event = PlayerScripts.ComputerMovementModeRegistered,
			callback = function()
				-- upvalues: p1 (copy), PlayerScripts (upval)
				p1:setState({
					computerOptions = PlayerScripts:GetRegisteredComputerMovementModes()
				})
			end
		}),
		DevComputerMovementMode = Roact.createElement(ExternalEventConnectionModule, {
			event = DevComputerMovementModePropertyChangedSignal,
			callback = function()
				-- upvalues: p1 (copy), LocalPlayer (upval)
				p1:setState({
					developerComputerMode = LocalPlayer.DevComputerMovementMode
				})
			end
		})
	}
	
	if #p1.state.computerOptions == 0 then
		return Roact.createFragment(config2)
	end
	local IsNotDeveloperComputerModeMatch = p1.state.developerComputerMode ~= Enum.DevComputerMovementMode.UserChoice
	local Selections = {}
	local SelectedIndex = 0
	
	if not IsNotDeveloperComputerModeMatch then
		for i, computerOption in ipairs(p1.state.computerOptions) do
			Selections[i] = config[computerOption]
			assert(Selections[i] ~= nil, "Movement mode " .. computerOption.Name .. " has no localization key")
			
			if p1.state.selectedComputerMode.Value == computerOption.Value then
				SelectedIndex = i
			end
		end
	end
	config2.MovementModeEntrySelector = Roact.createElement("Frame", {
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
			localizationKey = "CoreScripts.InGameMenu.GameSettings.MovementMode",
			Size = UDim2.new(1, 0, 0, 56),
			Position = UDim2.new(0, 0, 0, 0),
			AnchorPoint = Vector2.new(0, 0)
		}),
		Dropdown = WithLocalizationModule({
			placeholder = IsNotDeveloperComputerModeMatch and config1[p1.state.developerComputerMode] or nil
		})(function(p2)
			-- upvalues: Roact (upval), DropDownSelectionModule (upval), Selections (copy), SelectedIndex (ref), IsNotDeveloperComputerModeMatch (copy), p1 (copy), UserGameSettings (upval), SendAnalyticsModule (upval), ConstantsModule (upval)
			return Roact.createElement(DropDownSelectionModule, {
				localize = true,
				selectionParentName = "MovementModeEntryDropdown",
				Size = UDim2.new(1, 0, 0, 44),
				Position = UDim2.new(0, 0, 0, 56),
				selections = Selections,
				selectedIndex = SelectedIndex,
				placeHolderText = p2.placeholder,
				enabled = not IsNotDeveloperComputerModeMatch,
				canOpen = p1.props.canOpen,
				canCaptureFocus = p1.props.canCaptureFocus,
				selectionChanged = function(p3)
					-- upvalues: UserGameSettings (upval), p1 (upval), SendAnalyticsModule (upval), ConstantsModule (upval)
					UserGameSettings.ComputerMovementMode = p1.state.computerOptions[p3]
					SendAnalyticsModule(ConstantsModule.AnalyticsSettingsChangeName, nil, {}, true)
				end
			})
		end),
		LockedLabel = IsNotDeveloperComputerModeMatch and Roact.createElement(DeveloperLockLabelModule, {
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, 0),
			Size = UDim2.new(1, -72, 0.25, 0)
		})
	})
	
	return Roact.createFragment(config2)
end

return MovementModeEntry