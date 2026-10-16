local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("FocusNavigationUtils").Parent
local reactModule = require(parent.React)
local useLastInputMethodModule = require(script.Parent.useLastInputMethod)
local useFocusedTextBoxModule = require(script.Parent.useFocusedTextBox)
local VRService = require(parent.MockableProxyServices).VRService
local gamepadService = game:GetService("GamepadService")
local guiService = game:GetService("GuiService")
local fFlagFixSelectionWithWebViews = require(parent.SharedFlags).FFlagFixSelectionWithWebViews
local t = {
	Keyboard = "Focus",
	Gamepad = "Focus",
	Mouse = "Cursor",
	Touch = "Cursor",
	None = "None"
}
local t_1 = {
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
	-- upvalues: useLastInputMethodModule (ref), t (ref), useFocusedTextBoxModule (ref), reactModule (ref), gamepadService (ref), userInputService (ref), fFlagFixSelectionWithWebViews (ref), guiService (ref), t_1 (ref), VRService (ref)
	local var1 = useLastInputMethodModule()
	local var2 = t[var1]
	local var3 = useFocusedTextBoxModule()
	local var4, var5 = reactModule.useState(gamepadService.GamepadCursorEnabled)
	local var6, var7 = reactModule.useState(false)
	local var8 = reactModule.useRef(if var1 == "Keyboard" then "Cursor" else var2)
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), fFlagFixSelectionWithWebViews (copy), guiService (copy), t_1 (copy), var3 (ref), var7 (ref)
		local inputBeganConnection = userInputService.InputBegan:Connect(function(p1)
			-- upvalues: fFlagFixSelectionWithWebViews (copy), guiService (copy), t_1 (copy), var3 (copy), var7 (copy)
			if t_1[p1.KeyCode] and var3 == nil and (if fFlagFixSelectionWithWebViews then guiService.CoreGuiNavigationEnabled else true) then
				var7(true)
				
				return
			end
			var7(false)
		end)
		
		return function()
			-- upvalues: inputBeganConnection (ref)
			inputBeganConnection:Disconnect()
		end
	end, { var3 })
	reactModule.useEffect(function()
		-- upvalues: gamepadService (copy), var5 (ref)
		local var9 = gamepadService:GetPropertyChangedSignal("GamepadCursorEnabled"):Connect(function()
			-- upvalues: var5 (copy), gamepadService (copy)
			var5(gamepadService.GamepadCursorEnabled)
		end)
		
		return function()
			-- upvalues: var9 (ref)
			var9:Disconnect()
		end
	end, {})
	
	if VRService.VREnabled then
		var2 = "Cursor"
	elseif var1 == "Keyboard" then
		var2 = if var6 or var8.current == "Focus" then "Focus" else "Cursor"
	elseif var1 == "Gamepad" then
		var2 = if var4 then "Cursor" else "Focus"
	end
	var8.current = var2
	
	return var2
end