local parent = script.Parent.Parent
local reactModule = require(parent.React)
local useEventConnection = require(parent.ReactUtils).useEventConnection

local function _(p0) --[[ line: 18 | named "resolveTarget" ]]
	local target = p0.Target
	
	return if target and target:IsA("TextChannel") then target else nil
end

return function(value) --[[ line: 26 | named "useTextChannelWindowProps" ]]
	-- upvalues: reactModule (ref), useEventConnection (ref)
	local var1, var2 = reactModule.useState(function() --[[ line: 27 ]]
		-- upvalues: value (ref)
		local target = value.Target
		
		return if target and target:IsA("TextChannel") then target else nil
	end)
	useEventConnection(value:GetPropertyChangedSignal("Target"), function() --[[ line: 31 ]]
		-- upvalues: var2 (ref), value (ref)
		local target = value.Target
		var2(if target and target:IsA("TextChannel") then target else nil)
	end, { value })
	
	return { target = var1 }
end