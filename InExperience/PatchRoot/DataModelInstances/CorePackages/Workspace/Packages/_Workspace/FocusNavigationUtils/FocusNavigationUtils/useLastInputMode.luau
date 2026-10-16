local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("FocusNavigationUtils").Parent
local ReactModule = require(Parent.React)
local UseLastInputMethodModule = require(script.Parent.useLastInputMethod)
local UseFocusedTextBoxModule = require(script.Parent.useFocusedTextBox)
local VRService = require(Parent.MockableProxyServices).VRService
local GamepadService = game:GetService("GamepadService")
local GuiService = game:GetService("GuiService")
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagFixSelectionWithWebViews = SharedFlagsModule.FFlagFixSelectionWithWebViews
local FFlagEnableFocusNavTelemetry = SharedFlagsModule.FFlagEnableFocusNavTelemetry
local config = {
	Keyboard = "Focus",
	Gamepad = "Focus",
	Mouse = "Cursor",
	Touch = "Cursor",
	None = "None"
}
local config1 = {
	[Enum.KeyCode.Up] = true,
	[Enum.KeyCode.Down] = true,
	[Enum.KeyCode.Left] = true,
	[Enum.KeyCode.Right] = true,
	[Enum.KeyCode.W] = true,
	[Enum.KeyCode.A] = true,
	[Enum.KeyCode.S] = true,
	[Enum.KeyCode.D] = true,
	[Enum.KeyCode.Escape] = true
}

return function() --[[ Line: 40 ]]
	-- upvalues: UseLastInputMethodModule (copy), config (copy), UseFocusedTextBoxModule (copy), ReactModule (copy), GamepadService (copy), FFlagEnableFocusNavTelemetry (copy), UserInputService (copy), FFlagFixSelectionWithWebViews (copy), GuiService (copy), config1 (copy), VRService (copy)
	local UseLastInputMethodModuleResult = UseLastInputMethodModule()
	local Entry = config[UseLastInputMethodModuleResult]
	local UseFocusedTextBoxModuleResult = UseFocusedTextBoxModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(GamepadService.GamepadCursorEnabled)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(if UseLastInputMethodModuleResult == "Keyboard" then "Cursor" else Entry)
	local UseRefResult1 = if FFlagEnableFocusNavTelemetry then ReactModule.useRef(nil) else nil
	ReactModule.useEffect(function() --[[ Line: 54 ]]
		-- upvalues: UserInputService (upval), FFlagFixSelectionWithWebViews (upval), GuiService (upval), config1 (upval), UseFocusedTextBoxModuleResult (copy), FFlagEnableFocusNavTelemetry (upval), UseRefResult1 (ref), UseStateResult2_1 (copy)
		local InputBeganConnection = UserInputService.InputBegan:Connect(function(Input) --[[ Line: 55 ]]
			-- upvalues: FFlagFixSelectionWithWebViews (upval), GuiService (upval), config1 (upval), UseFocusedTextBoxModuleResult (upval), FFlagEnableFocusNavTelemetry (upval), UseRefResult1 (upval), UseStateResult2_1 (upval)
			local NoFFlagFixSelectionWithWebViews = not FFlagFixSelectionWithWebViews or GuiService.CoreGuiNavigationEnabled
			
			if not config1[Input.KeyCode] or UseFocusedTextBoxModuleResult ~= nil or not NoFFlagFixSelectionWithWebViews then
				UseStateResult2_1(false)
				
				return
			end
			if FFlagEnableFocusNavTelemetry and UseRefResult1 then
				UseRefResult1.current = Input.KeyCode
			end
			UseStateResult2_1(true)
		end)
		
		return function() --[[ Line: 69 ]]
			-- upvalues: InputBeganConnection (copy)
			InputBeganConnection:Disconnect()
		end
	end, { UseFocusedTextBoxModuleResult })
	ReactModule.useEffect(function() --[[ Line: 73 ]]
		-- upvalues: GamepadService (upval), UseStateResult2 (copy)
		local Connection = GamepadService:GetPropertyChangedSignal("GamepadCursorEnabled"):Connect(function() --[[ Line: 74 ]]
			-- upvalues: UseStateResult2 (upval), GamepadService (upval)
			UseStateResult2(GamepadService.GamepadCursorEnabled)
		end)
		
		return function() --[[ Line: 78 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	
	if VRService.VREnabled then
		Entry = "Cursor"
	elseif UseLastInputMethodModuleResult == "Keyboard" then
		Entry = if UseStateResult1 or UseRefResult.current == "Focus" then "Focus" else "Cursor"
	elseif UseLastInputMethodModuleResult == "Gamepad" then
		Entry = if UseStateResult then "Cursor" else "Focus"
	end
	UseRefResult.current = Entry
	
	if FFlagEnableFocusNavTelemetry and UseRefResult1 and Entry == "Focus" and UseLastInputMethodModuleResult == "Keyboard" then
		return Entry, UseRefResult1.current
	else
		return Entry
	end
end