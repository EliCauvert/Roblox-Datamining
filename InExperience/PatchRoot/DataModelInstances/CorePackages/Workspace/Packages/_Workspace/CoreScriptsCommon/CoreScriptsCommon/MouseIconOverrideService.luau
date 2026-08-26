local userInputService = game:GetService("UserInputService")
local t = {}

local function _()
	-- upvalues: t (ref), userInputService (ref)
	local var1 = t[#t]
	
	if var1 then
		userInputService.OverrideMouseIconBehavior = var1[2]
		
		return
	end
	userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
end

return {
	push = function(p1, p2)
		-- upvalues: t (ref), userInputService (ref)
		assert(if type(p1) ~= "userdata" then type(p1) == "string" else true, "key")
		assert(typeof(p2) == "EnumItem", "behavior")
		assert(p2.EnumType == Enum.OverrideMouseIconBehavior, "behavior.EnumType")
		
		for i, v in ipairs(t) do
			if v[1] == p1 then
				table.remove(t, i)
				break
			end
		end
		table.insert(t, { p1, p2 })
		local var1 = t[#t]
		
		if var1 then
			userInputService.OverrideMouseIconBehavior = var1[2]
			
			return
		end
		userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
	end,
	pop = function(p3)
		-- upvalues: t (ref), userInputService (ref)
		assert(if type(p3) ~= "userdata" then type(p3) == "string" else true, "key")
		local var2 = nil
		
		for i, v in ipairs(t) do
			if v[1] == p3 then
				var2 = i
				break
			end
		end
		if var2 then
			table.remove(t, var2)
		end
		local var3 = t[#t]
		
		if var3 then
			userInputService.OverrideMouseIconBehavior = var3[2]
			
			return
		end
		userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
	end
}