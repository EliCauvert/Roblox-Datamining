local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local computerCameraMovementModePropertyChangedSignal = userGameSettingsService:GetPropertyChangedSignal("ComputerCameraMovementMode")
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
	[Enum.ComputerCameraMovementMode.Classic] = "CoreScripts.InGameMenu.GameSettings.CameraModeClassic",
	[Enum.ComputerCameraMovementMode.Follow] = "CoreScripts.InGameMenu.GameSettings.CameraModeFollow",
	[Enum.ComputerCameraMovementMode.Default] = "CoreScripts.InGameMenu.GameSettings.Default",
	[Enum.ComputerCameraMovementMode.CameraToggle] = "CoreScripts.InGameMenu.GameSettings.CameraModeCameraToggle"
}
local cameraModeEntry = roact.PureComponent:extend("CameraModeEntry")
cameraModeEntry.validateProps = t.strictInterface({
	LayoutOrder = t.integer,
	canOpen = t.optional(t.boolean),
	canCaptureFocus = t.optional(t.boolean),
	ButtonRef = t.optional(t.union(t.callback, t.table))
})
cameraModeEntry.defaultProps = { canOpen = true }

function cameraModeEntry.init(p1)
	-- upvalues: userGameSettingsService (ref), playerScripts (ref), localPlayer (ref)
	p1:setState({
		selectedComputerMode = userGameSettingsService.ComputerCameraMovementMode,
		computerOptions = playerScripts and playerScripts:GetRegisteredComputerCameraMovementModes() or {},
		developerComputerMode = localPlayer.DevComputerCameraMode
	})
end

function cameraModeEntry.render(p1)
	-- upvalues: roact (ref), externalEventConnectionModule (ref), computerCameraMovementModePropertyChangedSignal (ref), userGameSettingsService (ref), playerScripts (ref), devComputerMovementModePropertyChangedSignal (ref), localPlayer (ref), t_1 (ref), inputLabelModule (ref), withLocalizationModule (ref), dropDownSelectionModule (ref), sendAnalyticsModule (ref), constantsModule (ref), developerLockLabelModule (ref)
	local t = {
		ComputerCameraMovementModeListener = roact.createElement(externalEventConnectionModule, {
			event = computerCameraMovementModePropertyChangedSignal,
			callback = function()
				-- upvalues: p1 (ref), userGameSettingsService (copy)
				p1:setState({
					selectedComputerMode = userGameSettingsService.ComputerCameraMovementMode
				})
			end
		}),
		ComputerCameraMovementModeRegisteredListener = playerScripts and roact.createElement(externalEventConnectionModule, {
			event = playerScripts.ComputerCameraMovementModeRegistered,
			callback = function()
				-- upvalues: p1 (ref), playerScripts (copy)
				p1:setState({
					computerOptions = playerScripts:GetRegisteredComputerCameraMovementModes()
				})
			end
		}),
		LocalPlayerComputerMovementMode = roact.createElement(externalEventConnectionModule, {
			event = devComputerMovementModePropertyChangedSignal,
			callback = function()
				-- upvalues: p1 (ref), localPlayer (copy)
				p1:setState({
					developerComputerMode = localPlayer.DevComputerCameraMode
				})
			end
		})
	}
	
	if #p1.state.computerOptions == 0 then
		return roact.createFragment(t)
	end
	local var1 = p1.state.developerComputerMode ~= Enum.DevComputerCameraMovementMode.UserChoice
	local t_2 = {}
	local var2 = 0
	
	if not var1 then
		for i, v in ipairs(p1.state.computerOptions) do
			t_2[i] = t_1[v]
			assert(t_2[i] ~= nil, "Camera movement mode " .. v.Name .. " has no localization key")
			
			if p1.state.selectedComputerMode.Value == v.Value then
				var2 = i
			end
		end
	end
	t.CameraModeEntrySelector = roact.createElement("Frame", {
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
			localizationKey = "CoreScripts.InGameMenu.GameSettings.CameraMode",
			Size = UDim2.new(1, 0, 0, 56),
			Position = UDim2.new(0, 0, 0, 0),
			AnchorPoint = Vector2.new(0, 0)
		}),
		Dropdown = withLocalizationModule({
			placeholder = if var1 then t_1[p1.state.developerComputerMode] else nil
		})(function(_)
			-- upvalues: roact (copy), dropDownSelectionModule (copy), t_2 (ref), var2 (write), p1 (ref), var1 (ref), userGameSettingsService (copy), sendAnalyticsModule (copy), constantsModule (copy)
			return roact.createElement(dropDownSelectionModule, {
				localize = true,
				selectionParentName = "cameraModeDropdown",
				Size = UDim2.new(1, 0, 0, 44),
				Position = UDim2.new(0, 0, 0, 56),
				selections = t_2,
				selectedIndex = var2,
				placeHolderText = p1.state.developerComputerMode.Name,
				enabled = not var1,
				selectionChanged = function(p2)
					-- upvalues: userGameSettingsService (copy), p1 (copy), sendAnalyticsModule (copy), constantsModule (copy)
					userGameSettingsService.ComputerCameraMovementMode = p1.state.computerOptions[p2]
					sendAnalyticsModule(constantsModule.AnalyticsSettingsChangeName, nil, {}, true)
				end,
				canOpen = p1.props.canOpen,
				canCaptureFocus = p1.props.canCaptureFocus,
				ButtonRef = p1.props.ButtonRef
			})
		end),
		LockedLabel = var1 and roact.createElement(developerLockLabelModule, {
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, 0),
			Size = UDim2.new(1, -72, 0.25, 0)
		})
	})
	
	return roact.createFragment(t)
end

return cameraModeEntry