local corePackagesService = game:GetService("CorePackages")
local _ = game:GetService("AppStorageService")
local _ = game:GetService("HttpService")
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local reactModule = require(corePackagesService.Packages.React)
local _ = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local _ = require(corePackagesService.Packages.t)
local roactAppExperimentModule = require(corePackagesService.Packages.RoactAppExperiment)
local _ = require(corePackagesService.Packages.UIBlox).Core.Style.withStyle
local gamepadNavigationDialogShowCounterModule = require(script.GamepadNavigationDialogShowCounter)
local parent = script.Parent.Parent.Parent
local setGamepadNavigationDialogOpenModule = require(script.Parent.Parent.Parent.Actions.SetGamepadNavigationDialogOpen)
local fFlagAlwaysShowGamepadNavigationDialogModule = require(parent.Flags.FFlagAlwaysShowGamepadNavigationDialog)
local var9 = require(parent.Flags.GetFStringGamepadNavigationDialogABTestLayerName)()

return if require(parent.Flags.FFlagTopBarDeprecateGamepadNavigationDialogRodux) then function(_) --[[ line: 31 | named "GamepadNavigationDialogContainer" ]]
	-- upvalues: reactModule (ref), userInputService (ref), guiService (ref), gamepadNavigationDialogShowCounterModule (ref), fFlagAlwaysShowGamepadNavigationDialogModule (ref)
	local var11, var12 = reactModule.useState(false)
	reactModule.useEffect(function() --[[ line: 34 ]]
		-- upvalues: userInputService (copy), var12 (ref), guiService (copy)
		local gamepadConnectedConnection = nil
		
		local function disconnectGamepadConnected() --[[ line: 36 ]]
			-- upvalues: gamepadConnectedConnection (write)
			if gamepadConnectedConnection then
				gamepadConnectedConnection:Disconnect()
				gamepadConnectedConnection = nil
			end
		end
		
		if userInputService:GetGamepadConnected(Enum.UserInputType.Gamepad1) then
			var12(true)
		else
			gamepadConnectedConnection = userInputService.GamepadConnected:Connect(function() --[[ line: 46 ]]
				-- upvalues: var12 (copy), gamepadConnectedConnection (write)
				var12(true)
				
				if gamepadConnectedConnection then
					gamepadConnectedConnection:Disconnect()
					gamepadConnectedConnection = nil
				end
			end)
		end
		guiService:GetPropertyChangedSignal("MenuIsOpen"):Connect(disconnectGamepadConnected)
		
		return disconnectGamepadConnected
	end, {})
	
	return if var11 then reactModule.createElement(gamepadNavigationDialogShowCounterModule, {
		selectButtonDismissesGamepadNavigationDialog = false,
		appStorageKey = "GamepadMenuVirtualCursorPromptShown",
		maxShownCount = 1,
		isGamepadNavigationDialogEnabled = fFlagAlwaysShowGamepadNavigationDialogModule,
		isGamepadNavigationDialogOpen = var11,
		SetGamepadNavigationDialogOpen = var12
	}) else nil
end else roactRoduxModule.connect(function(p1) --[[ line: 87 ]]
	return {
		isGamepadNavigationDialogOpen = p1.displayOptions.isGamepadNavigationDialogOpen
	}
end, function(p2) --[[ line: 91 ]]
	-- upvalues: setGamepadNavigationDialogOpenModule (ref)
	return {
		SetGamepadNavigationDialogOpen = function(value) --[[ line: 93 ]]
			-- upvalues: p2 (ref), setGamepadNavigationDialogOpenModule (copy)
			return p2(setGamepadNavigationDialogOpenModule(value))
		end
	}
end)(roactAppExperimentModule.connectUserLayer({ var9 }, function(p0, _) --[[ line: 72 ]]
	-- upvalues: var9 (ref), fFlagAlwaysShowGamepadNavigationDialogModule (ref)
	local var10 = p0[var9] or {}
	
	return {
		appStorageKey = "GamepadMenuVirtualCursorPromptShown",
		maxShownCount = 1,
		isGamepadNavigationDialogEnabled = fFlagAlwaysShowGamepadNavigationDialogModule or var10.isGamepadNavigationDialogEnabled,
		selectButtonDismissesGamepadNavigationDialog = var10.selectButtonDismissesGamepadNavigationDialog
	}
end)(gamepadNavigationDialogShowCounterModule))