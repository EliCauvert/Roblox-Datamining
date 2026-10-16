local UserInputService = game:GetService("UserInputService")
local List = {}

local function _() --[[ Line: 18 | Named "update" ]]
	-- upvalues: List (copy), UserInputService (copy)
	local Entry = List[#List]
	
	if Entry then
		UserInputService.OverrideMouseIconBehavior = Entry[2]
		
		return
	else
		UserInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
	end
end

return {
	push = function(p1, p2) --[[ Line: 28 ]]
		-- upvalues: List (copy), UserInputService (copy)
		assert(type(p1) == "userdata" or type(p1) == "string", "key")
		assert(typeof(p2) == "EnumItem", "behavior")
		assert(p2.EnumType == Enum.OverrideMouseIconBehavior, "behavior.EnumType")
		
		for i, value in ipairs(List) do
			if value[1] == p1 then
				table.remove(List, i)
				break
			end
		end
		table.insert(List, { p1, p2 })
		local Entry = List[#List]
		
		if Entry then
			UserInputService.OverrideMouseIconBehavior = Entry[2]
			
			return
		else
			UserInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
		end
	end,
	pop = function(p3) --[[ Line: 43 ]]
		-- upvalues: List (copy), UserInputService (copy)
		assert(type(p3) == "userdata" or type(p3) == "string", "key")
		local Index = nil
		
		for i, value in ipairs(List) do
			if value[1] == p3 then
				Index = i
				break
			end
		end
		if Index then
			table.remove(List, Index)
		end
		local Entry = List[#List]
		
		if Entry then
			UserInputService.OverrideMouseIconBehavior = Entry[2]
			
			return
		else
			UserInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
		end
	end
}