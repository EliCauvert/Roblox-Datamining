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
	local var8 = useLastInputMethodModule()
	local var9 = t[var8]
	local var10 = useFocusedTextBoxModule()
	local var11, var12 = reactModule.useState(gamepadService.GamepadCursorEnabled)
	local var13, var14 = reactModule.useState(false)
	local var15 = reactModule.useRef(if var8 == "Keyboard" then "Cursor" else var9)
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), fFlagFixSelectionWithWebViews (copy), guiService (copy), t_1 (copy), var10 (ref), var14 (ref)
		local inputBeganConnection = userInputService.InputBegan:Connect(function(p0)
			-- upvalues: fFlagFixSelectionWithWebViews (copy), guiService (copy), t_1 (copy), var10 (copy), var14 (copy)
			if t_1[p0.KeyCode] and var10 == nil and (if fFlagFixSelectionWithWebViews then guiService.CoreGuiNavigationEnabled else true) then
				var14(true)
				
				return
			end
			var14(false)
		end)
		
		return function()
			-- upvalues: inputBeganConnection (ref)
			inputBeganConnection:Disconnect()
		end
	end, { var10 })
	reactModule.useEffect(function()
		-- upvalues: gamepadService (copy), var12 (ref)
		local var17 = gamepadService:GetPropertyChangedSignal("GamepadCursorEnabled"):Connect(function()
			-- upvalues: var12 (copy), gamepadService (copy)
			var12(gamepadService.GamepadCursorEnabled)
		end)
		
		return function()
			-- upvalues: var17 (ref)
			var17:Disconnect()
		end
	end, {})
	
	if VRService.VREnabled then
		var9 = "Cursor"
	elseif var8 == "Keyboard" then
		var9 = if var13 or var15.current == "Focus" then "Focus" else "Cursor"
	elseif var8 == "Gamepad" then
		var9 = if var11 then "Cursor" else "Focus"
	end
	var15.current = var9
	
	return var9
end