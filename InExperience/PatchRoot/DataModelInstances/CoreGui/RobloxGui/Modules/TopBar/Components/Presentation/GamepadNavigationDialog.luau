local CorePackages = game:GetService("CorePackages")
local _ = game:GetService("AppStorageService")
local _ = game:GetService("HttpService")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(CorePackages.Packages.React)
local _ = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local _ = require(CorePackages.Packages.t)
local _ = require(CorePackages.Packages.UIBlox).Core.Style.withStyle
local GamepadNavigationDialogShowCounterModule = require(script.GamepadNavigationDialogShowCounter)
local Parent = script.Parent.Parent.Parent
local SetGamepadNavigationDialogOpenModule = require(script.Parent.Parent.Parent.Actions.SetGamepadNavigationDialogOpen)
local FFlagAlwaysShowGamepadNavigationDialogModule = require(Parent.Flags.FFlagAlwaysShowGamepadNavigationDialog)

local function GamepadNavigationDialogContainer(_) --[[ Line: 31 ]]
	-- upvalues: ReactModule (copy), UserInputService (copy), GuiService (copy), GamepadNavigationDialogShowCounterModule (copy), FFlagAlwaysShowGamepadNavigationDialogModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function() --[[ Line: 34 ]]
		-- upvalues: UserInputService (upval), UseStateResult2 (copy), GuiService (upval)
		local Connection = nil
		
		local function disconnectGamepadConnected() --[[ Line: 36 ]]
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
		end
		
		if UserInputService:GetGamepadConnected(Enum.UserInputType.Gamepad1) then
			UseStateResult2(true)
		else
			Connection = UserInputService.GamepadConnected:Connect(function() --[[ Line: 45 ]]
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

local v1 = require(Parent.Flags.GetFStringGamepadNavigationDialogABTestLayerName)()
local v2 = require(CorePackages.Packages.RoactAppExperiment).connectUserLayer({ v1 }, function(p1, _) --[[ Line: 71 ]]
	-- upvalues: v1 (copy), FFlagAlwaysShowGamepadNavigationDialogModule (copy)
	local v3 = p1[v1] or {}
	
	return {
		appStorageKey = "GamepadMenuVirtualCursorPromptShown",
		maxShownCount = 1,
		isGamepadNavigationDialogEnabled = FFlagAlwaysShowGamepadNavigationDialogModule or v3.isGamepadNavigationDialogEnabled,
		selectButtonDismissesGamepadNavigationDialog = v3.selectButtonDismissesGamepadNavigationDialog
	}
end)(GamepadNavigationDialogShowCounterModule)

return if require(Parent.Flags.FFlagTopBarDeprecateGamepadNavigationDialogRodux) then GamepadNavigationDialogContainer else RoactRoduxModule.connect(function(p1) --[[ Line: 86 ]]
	return {
		isGamepadNavigationDialogOpen = p1.displayOptions.isGamepadNavigationDialogOpen
	}
end, function(Callback) --[[ Line: 90 ]]
	-- upvalues: SetGamepadNavigationDialogOpenModule (copy)
	return {
		SetGamepadNavigationDialogOpen = function(p1) --[[ Line: 92 ]]
			-- upvalues: Callback (copy), SetGamepadNavigationDialogOpenModule (upval)
			return Callback(SetGamepadNavigationDialogOpenModule(p1))
		end
	}
end)(v2)