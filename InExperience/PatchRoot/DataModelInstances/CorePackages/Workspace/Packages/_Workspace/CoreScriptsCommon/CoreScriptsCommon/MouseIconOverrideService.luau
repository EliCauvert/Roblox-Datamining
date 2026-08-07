local userInputService = game:GetService("UserInputService")
local t = {}

local function _() --[[ line: 18 | named "update" ]]
	-- upvalues: t (ref), userInputService (ref)
	local var2 = t[#t]
	
	if var2 then
		userInputService.OverrideMouseIconBehavior = var2[2]
		
		return
	end
	userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
end

return {
	push = function(p0, p1) --[[ line: 28 ]]
		-- upvalues: t (ref), userInputService (ref)
		assert(if type(p0) ~= "userdata" then type(p0) == "string" else true, "key")
		assert(typeof(p1) == "EnumItem", "behavior")
		assert(p1.EnumType == Enum.OverrideMouseIconBehavior, "behavior.EnumType")
		
		for i, v in ipairs(t) do
			if v[1] == p0 then
				table.remove(t, i)
				break
			end
		end
		table.insert(t, { p0, p1 })
		local var3 = t[#t]
		
		if var3 then
			userInputService.OverrideMouseIconBehavior = var3[2]
			
			return
		end
		userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
	end,
	pop = function(p2) --[[ line: 43 ]]
		-- upvalues: t (ref), userInputService (ref)
		assert(if type(p2) ~= "userdata" then type(p2) == "string" else true, "key")
		local var4 = nil
		
		for i, v in ipairs(t) do
			if v[1] == p2 then
				var4 = i
				break
			end
		end
		if var4 then
			table.remove(t, var4)
		end
		local var5 = t[#t]
		
		if var5 then
			userInputService.OverrideMouseIconBehavior = var5[2]
			
			return
		end
		userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
	end
}