local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local InputTypeModule = require(Parent.InputType)
local GetInputGroupFunction = InputTypeModule.getInputGroup
local InputTypeConstants = InputTypeModule.InputTypeConstants
local FFlagLuaSupportMicroGamepadPreferredInput = require(Parent.SharedFlags).FFlagLuaSupportMicroGamepadPreferredInput

local function _(p1)
	-- upvalues: FFlagLuaSupportMicroGamepadPreferredInput (copy), InputTypeConstants (copy)
	return if p1.PreferredInput == Enum.PreferredInput.Gamepad or FFlagLuaSupportMicroGamepadPreferredInput and p1.PreferredInput == Enum.PreferredInput.MicroGamepad then InputTypeConstants.Gamepad elseif p1.TouchEnabled then InputTypeConstants.Touch else InputTypeConstants.MouseAndKeyboard
end

return function(p1)
	-- upvalues: UserInputService (copy), ReactModule (copy), FFlagLuaSupportMicroGamepadPreferredInput (copy), InputTypeConstants (copy), GetInputGroupFunction (copy)
	local P1 = p1 or UserInputService
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: P1 (copy), FFlagLuaSupportMicroGamepadPreferredInput (upval), InputTypeConstants (upval)
		return if P1.PreferredInput == Enum.PreferredInput.Gamepad or FFlagLuaSupportMicroGamepadPreferredInput and P1.PreferredInput == Enum.PreferredInput.MicroGamepad then InputTypeConstants.Gamepad elseif P1.TouchEnabled then InputTypeConstants.Touch else InputTypeConstants.MouseAndKeyboard
	end)
	ReactModule.useEffect(function()
		-- upvalues: P1 (copy), UseStateResult2 (copy), GetInputGroupFunction (upval)
		local LastInputTypeChangedConnection = P1.LastInputTypeChanged:Connect(function(LastInputType)
			-- upvalues: UseStateResult2 (upval), GetInputGroupFunction (upval)
			UseStateResult2(GetInputGroupFunction(LastInputType))
		end)
		
		return function()
			-- upvalues: LastInputTypeChangedConnection (copy)
			LastInputTypeChangedConnection:Disconnect()
		end
	end, { P1 })
	
	return UseStateResult
end