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
local var1 = require(parent.Flags.GetFStringGamepadNavigationDialogABTestLayerName)()

return if require(parent.Flags.FFlagTopBarDeprecateGamepadNavigationDialogRodux) then function(_)
	-- upvalues: reactModule (ref), userInputService (ref), guiService (ref), gamepadNavigationDialogShowCounterModule (ref), fFlagAlwaysShowGamepadNavigationDialogModule (ref)
	local var2, var3 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), var3 (ref), guiService (copy)
		local gamepadConnectedConnection = nil
		
		local function disconnectGamepadConnected()
			-- upvalues: gamepadConnectedConnection (write)
			if gamepadConnectedConnection then
				gamepadConnectedConnection:Disconnect()
				gamepadConnectedConnection = nil
			end
		end
		
		if userInputService:GetGamepadConnected(Enum.UserInputType.Gamepad1) then
			var3(true)
		else
			gamepadConnectedConnection = userInputService.GamepadConnected:Connect(function()
				-- upvalues: var3 (copy), gamepadConnectedConnection (write)
				var3(true)
				
				if gamepadConnectedConnection then
					gamepadConnectedConnection:Disconnect()
					gamepadConnectedConnection = nil
				end
			end)
		end
		guiService:GetPropertyChangedSignal("MenuIsOpen"):Connect(disconnectGamepadConnected)
		
		return disconnectGamepadConnected
	end, {})
	
	return if var2 then reactModule.createElement(gamepadNavigationDialogShowCounterModule, {
		selectButtonDismissesGamepadNavigationDialog = false,
		appStorageKey = "GamepadMenuVirtualCursorPromptShown",
		maxShownCount = 1,
		isGamepadNavigationDialogEnabled = fFlagAlwaysShowGamepadNavigationDialogModule,
		isGamepadNavigationDialogOpen = var2,
		SetGamepadNavigationDialogOpen = var3
	}) else nil
end else roactRoduxModule.connect(function(p1)
	return {
		isGamepadNavigationDialogOpen = p1.displayOptions.isGamepadNavigationDialogOpen
	}
end, function(p1)
	-- upvalues: setGamepadNavigationDialogOpenModule (ref)
	return {
		SetGamepadNavigationDialogOpen = function(value)
			-- upvalues: p1 (ref), setGamepadNavigationDialogOpenModule (copy)
			return p1(setGamepadNavigationDialogOpenModule(value))
		end
	}
end)(roactAppExperimentModule.connectUserLayer({ var1 }, function(p1, _)
	-- upvalues: var1 (ref), fFlagAlwaysShowGamepadNavigationDialogModule (ref)
	local var2 = p1[var1] or {}
	
	return {
		appStorageKey = "GamepadMenuVirtualCursorPromptShown",
		maxShownCount = 1,
		isGamepadNavigationDialogEnabled = fFlagAlwaysShowGamepadNavigationDialogModule or var2.isGamepadNavigationDialogEnabled,
		selectButtonDismissesGamepadNavigationDialog = var2.selectButtonDismissesGamepadNavigationDialog
	}
end)(gamepadNavigationDialogShowCounterModule))