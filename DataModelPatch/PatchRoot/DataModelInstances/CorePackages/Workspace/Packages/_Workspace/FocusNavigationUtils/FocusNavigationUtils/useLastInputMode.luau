local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("FocusNavigationUtils").Parent
local ReactModule = require(Parent.React)
local UseLastInputMethodModule = require(script.Parent.useLastInputMethod)
local UseFocusedTextBoxModule = require(script.Parent.useFocusedTextBox)
local VRService = require(Parent.MockableProxyServices).VRService
local GamepadService = game:GetService("GamepadService")
local GuiService = game:GetService("GuiService")
local FFlagFixSelectionWithWebViews = require(Parent.SharedFlags).FFlagFixSelectionWithWebViews
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

return function()
	-- upvalues: UseLastInputMethodModule (copy), config (copy), UseFocusedTextBoxModule (copy), ReactModule (copy), GamepadService (copy), UserInputService (copy), FFlagFixSelectionWithWebViews (copy), GuiService (copy), config1 (copy), VRService (copy)
	local UseLastInputMethodModuleResult = UseLastInputMethodModule()
	local Entry = config[UseLastInputMethodModuleResult]
	local UseFocusedTextBoxModuleResult = UseFocusedTextBoxModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(GamepadService.GamepadCursorEnabled)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(if UseLastInputMethodModuleResult == "Keyboard" then "Cursor" else Entry)
	ReactModule.useEffect(function()
		-- upvalues: UserInputService (upval), FFlagFixSelectionWithWebViews (upval), GuiService (upval), config1 (upval), UseFocusedTextBoxModuleResult (copy), UseStateResult2_1 (copy)
		local InputBeganConnection = UserInputService.InputBegan:Connect(function(Input)
			-- upvalues: FFlagFixSelectionWithWebViews (upval), GuiService (upval), config1 (upval), UseFocusedTextBoxModuleResult (upval), UseStateResult2_1 (upval)
			local NoFFlagFixSelectionWithWebViews = not FFlagFixSelectionWithWebViews or GuiService.CoreGuiNavigationEnabled
			
			if config1[Input.KeyCode] and UseFocusedTextBoxModuleResult == nil and NoFFlagFixSelectionWithWebViews then
				UseStateResult2_1(true)
				
				return
			else
				UseStateResult2_1(false)
			end
		end)
		
		return function()
			-- upvalues: InputBeganConnection (copy)
			InputBeganConnection:Disconnect()
		end
	end, { UseFocusedTextBoxModuleResult })
	ReactModule.useEffect(function()
		-- upvalues: GamepadService (upval), UseStateResult2 (copy)
		local Connection = GamepadService:GetPropertyChangedSignal("GamepadCursorEnabled"):Connect(function()
			-- upvalues: UseStateResult2 (upval), GamepadService (upval)
			UseStateResult2(GamepadService.GamepadCursorEnabled)
		end)
		
		return function()
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
	
	return Entry
end