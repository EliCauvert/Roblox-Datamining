local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local inputTypeModule = require(parent.InputType)
local getInputGroup = inputTypeModule.getInputGroup
local inputTypeConstants = inputTypeModule.InputTypeConstants

local function _(p0)
	-- upvalues: inputTypeConstants (ref)
	return if p0.PreferredInput == Enum.PreferredInput.Gamepad then inputTypeConstants.Gamepad elseif p0.TouchEnabled then inputTypeConstants.Touch else inputTypeConstants.MouseAndKeyboard
end

return function(p1)
	-- upvalues: userInputService (ref), reactModule (ref), inputTypeConstants (ref), getInputGroup (ref)
	p1 = p1 or userInputService
	local var4, var5 = reactModule.useState(function()
		-- upvalues: p1 (ref), inputTypeConstants (copy)
		return if p1.PreferredInput == Enum.PreferredInput.Gamepad then inputTypeConstants.Gamepad elseif p1.TouchEnabled then inputTypeConstants.Touch else inputTypeConstants.MouseAndKeyboard
	end)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var5 (ref), getInputGroup (copy)
		local lastInputTypeChangedConnection = p1.LastInputTypeChanged:Connect(function(p2)
			-- upvalues: var5 (copy), getInputGroup (copy)
			var5(getInputGroup(p2))
		end)
		
		return function()
			-- upvalues: lastInputTypeChangedConnection (ref)
			lastInputTypeChangedConnection:Disconnect()
		end
	end, { p1 })
	
	return var4
end