local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local inputTypeModule = require(parent.InputType)
local getInputGroup = inputTypeModule.getInputGroup
local inputTypeConstants = inputTypeModule.InputTypeConstants

local function _(p1)
	-- upvalues: inputTypeConstants (ref)
	return if p1.PreferredInput == Enum.PreferredInput.Gamepad then inputTypeConstants.Gamepad elseif p1.TouchEnabled then inputTypeConstants.Touch else inputTypeConstants.MouseAndKeyboard
end

return function(p1)
	-- upvalues: userInputService (ref), reactModule (ref), inputTypeConstants (ref), getInputGroup (ref)
	p1 = p1 or userInputService
	local var1, var2 = reactModule.useState(function()
		-- upvalues: p1 (ref), inputTypeConstants (copy)
		return if p1.PreferredInput == Enum.PreferredInput.Gamepad then inputTypeConstants.Gamepad elseif p1.TouchEnabled then inputTypeConstants.Touch else inputTypeConstants.MouseAndKeyboard
	end)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref), getInputGroup (copy)
		local lastInputTypeChangedConnection = p1.LastInputTypeChanged:Connect(function(p2)
			-- upvalues: var2 (copy), getInputGroup (copy)
			var2(getInputGroup(p2))
		end)
		
		return function()
			-- upvalues: lastInputTypeChangedConnection (ref)
			lastInputTypeChangedConnection:Disconnect()
		end
	end, { p1 })
	
	return var1
end