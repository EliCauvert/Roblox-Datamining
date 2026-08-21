local parent = script.Parent.Parent
local reactModule = require(parent.React)
local useEventConnection = require(parent.ReactUtils).useEventConnection

local function _(p0) --[[ line: 19 | named "resolveTarget" ]]
	local target = p0.Target
	
	return if target and target:IsA("TextChannel") then target else nil
end

return function(value) --[[ line: 27 | named "useTextChannelWindowProps" ]]
	-- upvalues: reactModule (ref), useEventConnection (ref)
	local var1, var2 = reactModule.useState(function() --[[ line: 28 ]]
		-- upvalues: value (ref)
		local target = value.Target
		
		return if target and target:IsA("TextChannel") then target else nil
	end)
	local var3, var4 = reactModule.useState(function() --[[ line: 32 ]]
		-- upvalues: value (ref)
		return value.BackgroundColor3
	end)
	local var5 = reactModule.useRef(var1)
	useEventConnection(value:GetPropertyChangedSignal("Target"), function() --[[ line: 38 ]]
		-- upvalues: value (ref), var5 (ref), var2 (ref)
		local target = value.Target
		local var6 = if target and target:IsA("TextChannel") then target else nil
		var5.current = var6
		var2(var6)
	end, { value })
	useEventConnection(value:GetPropertyChangedSignal("BackgroundColor3"), function() --[[ line: 45 ]]
		-- upvalues: var4 (ref), value (ref)
		var4(value.BackgroundColor3)
	end, { value })
	
	return { target = var1, backgroundColor = var3 }
end