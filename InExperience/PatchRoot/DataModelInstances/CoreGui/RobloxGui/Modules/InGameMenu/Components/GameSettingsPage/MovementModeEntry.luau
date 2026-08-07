local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local computerMovementModePropertyChangedSignal = userGameSettingsService:GetPropertyChangedSignal("ComputerMovementMode")
local localPlayer = playersService.LocalPlayer
local playerScripts = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.CoreUtility).waitForChildOfClass(localPlayer, "PlayerScripts")
local devComputerMovementModePropertyChangedSignal = localPlayer:GetPropertyChangedSignal("DevComputerMovementMode")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local parent = script.Parent.Parent.Parent
local dropDownSelectionModule = require(parent.Components.DropDownSelection)
local externalEventConnectionModule = require(parent.Utility.ExternalEventConnection)
local inputLabelModule = require(script.Parent.InputLabel)
local developerLockLabelModule = require(script.Parent.DeveloperLockLabel)
local withLocalizationModule = require(parent.Localization.withLocalization)
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)
local constantsModule = require(parent.Resources.Constants)
local t_1 = {
	[Enum.ComputerMovementMode.KeyboardMouse] = "CoreScripts.InGameMenu.GameSettings.ComputerMoveModeKeyboardMouse",
	[Enum.ComputerMovementMode.ClickToMove] = "CoreScripts.InGameMenu.GameSettings.ComputerMoveModeClickToMove",
	[Enum.ComputerMovementMode.Default] = "CoreScripts.InGameMenu.GameSettings.Default"
}
local t_2 = {
	[Enum.DevComputerMovementMode.KeyboardMouse] = "CoreScripts.InGameMenu.GameSettings.ComputerMoveModeKeyboardMouse",
	[Enum.DevComputerMovementMode.ClickToMove] = "CoreScripts.InGameMenu.GameSettings.ComputerMoveModeClickToMove"
}
local movementModeEntry = roact.PureComponent:extend("MovementModeEntry")
movementModeEntry.validateProps = t.strictInterface({
	LayoutOrder = t.integer,
	canOpen = t.optional(t.boolean),
	canCaptureFocus = t.optional(t.boolean)
})
movementModeEntry.defaultProps = { canOpen = true }

function movementModeEntry.init(p0) --[[ line: 55 ]]
	-- upvalues: userGameSettingsService (ref), playerScripts (ref), localPlayer (ref)
	p0:setState({
		selectedComputerMode = userGameSettingsService.ComputerMovementMode,
		computerOptions = playerScripts and playerScripts:GetRegisteredComputerMovementModes() or {},
		developerComputerMode = localPlayer.DevComputerMovementMode
	})
end

function movementModeEntry.render(p1) --[[ line: 63 ]]
	-- upvalues: roact (ref), externalEventConnectionModule (ref), computerMovementModePropertyChangedSignal (ref), userGameSettingsService (ref), playerScripts (ref), devComputerMovementModePropertyChangedSignal (ref), localPlayer (ref), t_1 (ref), inputLabelModule (ref), withLocalizationModule (ref), t_2 (ref), dropDownSelectionModule (ref), sendAnalyticsModule (ref), constantsModule (ref), developerLockLabelModule (ref)
	local t = {
		ComputerMovementModeListener = roact.createElement(externalEventConnectionModule, {
			event = computerMovementModePropertyChangedSignal,
			callback = function() --[[ line: 69 ]]
				-- upvalues: p1 (ref), userGameSettingsService (copy)
				p1:setState({
					selectedComputerMode = userGameSettingsService.ComputerMovementMode
				})
			end
		}),
		ComputerMovementModeRegisteredListener = playerScripts and roact.createElement(externalEventConnectionModule, {
			event = playerScripts.ComputerMovementModeRegistered,
			callback = function() --[[ line: 77 ]]
				-- upvalues: p1 (ref), playerScripts (copy)
				p1:setState({
					computerOptions = playerScripts:GetRegisteredComputerMovementModes()
				})
			end
		}),
		DevComputerMovementMode = roact.createElement(externalEventConnectionModule, {
			event = devComputerMovementModePropertyChangedSignal,
			callback = function() --[[ line: 85 ]]
				-- upvalues: p1 (ref), localPlayer (copy)
				p1:setState({
					developerComputerMode = localPlayer.DevComputerMovementMode
				})
			end
		})
	}
	
	if #p1.state.computerOptions == 0 then
		return roact.createFragment(t)
	end
	local var18 = p1.state.developerComputerMode ~= Enum.DevComputerMovementMode.UserChoice
	local t_3 = {}
	local var20 = 0
	
	if not var18 then
		for i, v in ipairs(p1.state.computerOptions) do
			t_3[i] = t_1[v]
			assert(t_3[i] ~= nil, "Movement mode " .. v.Name .. " has no localization key")
			
			if p1.state.selectedComputerMode.Value == v.Value then
				var20 = i
			end
		end
	end
	t.MovementModeEntrySelector = roact.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 2,
		Size = UDim2.new(1, 0, 0, 120),
		LayoutOrder = p1.props.LayoutOrder
	}, {
		Padding = roact.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 24),
			PaddingRight = UDim.new(0, 24)
		}),
		InputLabel = roact.createElement(inputLabelModule, {
			localizationKey = "CoreScripts.InGameMenu.GameSettings.MovementMode",
			Size = UDim2.new(1, 0, 0, 56),
			Position = UDim2.new(0, 0, 0, 0),
			AnchorPoint = Vector2.new(0, 0)
		}),
		Dropdown = withLocalizationModule({
			placeholder = if var18 then t_2[p1.state.developerComputerMode] else nil
		})(function(p2) --[[ line: 130 ]]
			-- upvalues: roact (copy), dropDownSelectionModule (copy), t_3 (ref), var20 (write), var18 (ref), p1 (ref), userGameSettingsService (copy), sendAnalyticsModule (copy), constantsModule (copy)
			return roact.createElement(dropDownSelectionModule, {
				localize = true,
				selectionParentName = "MovementModeEntryDropdown",
				Size = UDim2.new(1, 0, 0, 44),
				Position = UDim2.new(0, 0, 0, 56),
				selections = t_3,
				selectedIndex = var20,
				placeHolderText = p2.placeholder,
				enabled = not var18,
				canOpen = p1.props.canOpen,
				canCaptureFocus = p1.props.canCaptureFocus,
				selectionChanged = function(p3) --[[ line: 142 ]]
					-- upvalues: userGameSettingsService (copy), p1 (copy), sendAnalyticsModule (copy), constantsModule (copy)
					userGameSettingsService.ComputerMovementMode = p1.state.computerOptions[p3]
					sendAnalyticsModule(constantsModule.AnalyticsSettingsChangeName, nil, {}, true)
				end
			})
		end),
		LockedLabel = var18 and roact.createElement(developerLockLabelModule, {
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, 0),
			Size = UDim2.new(1, -72, 0.25, 0)
		})
	})
	
	return roact.createFragment(t)
end

return movementModeEntry