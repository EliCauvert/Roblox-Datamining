local CorePackages = game:GetService("CorePackages")
local _ = game:GetService("AppStorageService")
local _ = game:GetService("HttpService")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(CorePackages.Packages.React)
local _ = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local _ = require(CorePackages.Packages.t)
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local _ = require(CorePackages.Packages.UIBlox).Core.Style.withStyle
local GamepadNavigationDialogShowCounterModule = require(script.GamepadNavigationDialogShowCounter)
local Parent = script.Parent.Parent.Parent
local SetGamepadNavigationDialogOpenModule = require(script.Parent.Parent.Parent.Actions.SetGamepadNavigationDialogOpen)
local GetFStringGamepadNavigationDialogABTestLayerNameModule = require(Parent.Flags.GetFStringGamepadNavigationDialogABTestLayerName)
local FFlagAlwaysShowGamepadNavigationDialogModule = require(Parent.Flags.FFlagAlwaysShowGamepadNavigationDialog)
local FFlagTopBarDeprecateGamepadNavigationDialogRoduxModule = require(Parent.Flags.FFlagTopBarDeprecateGamepadNavigationDialogRodux)

local function GamepadNavigationDialogContainer(_)
	-- upvalues: ReactModule (copy), UserInputService (copy), GuiService (copy), GamepadNavigationDialogShowCounterModule (copy), FFlagAlwaysShowGamepadNavigationDialogModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: UserInputService (upval), UseStateResult2 (copy), GuiService (upval)
		local Connection = nil
		
		local function disconnectGamepadConnected()
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
		end
		
		if UserInputService:GetGamepadConnected(Enum.UserInputType.Gamepad1) then
			UseStateResult2(true)
		else
			Connection = UserInputService.GamepadConnected:Connect(function()
				-- upvalues: UseStateResult2 (upval), Connection (ref)
				UseStateResult2(true)
				
				if Connection then
					Connection:Disconnect()
					Connection = nil
				end
			end)
		end
		GuiService:GetPropertyChangedSignal("MenuIsOpen"):Connect(disconnectGamepadConnected)
		
		return disconnectGamepadConnected
	end, {})
	
	return if UseStateResult then ReactModule.createElement(GamepadNavigationDialogShowCounterModule, {
		selectButtonDismissesGamepadNavigationDialog = false,
		appStorageKey = "GamepadMenuVirtualCursorPromptShown",
		maxShownCount = 1,
		isGamepadNavigationDialogEnabled = FFlagAlwaysShowGamepadNavigationDialogModule,
		isGamepadNavigationDialogOpen = UseStateResult,
		SetGamepadNavigationDialogOpen = UseStateResult2
	}) else nil
end

local FStringGamepadNavigationDialogABTestLayerNameModule = GetFStringGamepadNavigationDialogABTestLayerNameModule()
local v1 = RoactAppExperimentModule.connectUserLayer({ FStringGamepadNavigationDialogABTestLayerNameModule }, function(p1, _)
	-- upvalues: FStringGamepadNavigationDialogABTestLayerNameModule (copy), FFlagAlwaysShowGamepadNavigationDialogModule (copy)
	local v2 = p1[FStringGamepadNavigationDialogABTestLayerNameModule] or {}
	
	return {
		appStorageKey = "GamepadMenuVirtualCursorPromptShown",
		maxShownCount = 1,
		isGamepadNavigationDialogEnabled = FFlagAlwaysShowGamepadNavigationDialogModule or v2.isGamepadNavigationDialogEnabled,
		selectButtonDismissesGamepadNavigationDialog = v2.selectButtonDismissesGamepadNavigationDialog
	}
end)(GamepadNavigationDialogShowCounterModule)

return if FFlagTopBarDeprecateGamepadNavigationDialogRoduxModule then GamepadNavigationDialogContainer else RoactRoduxModule.connect(function(p1)
	return {
		isGamepadNavigationDialogOpen = p1.displayOptions.isGamepadNavigationDialogOpen
	}
end, function(Callback)
	-- upvalues: SetGamepadNavigationDialogOpenModule (copy)
	return {
		SetGamepadNavigationDialogOpen = function(p1)
			-- upvalues: Callback (copy), SetGamepadNavigationDialogOpenModule (upval)
			return Callback(SetGamepadNavigationDialogOpenModule(p1))
		end
	}
end)(v1)