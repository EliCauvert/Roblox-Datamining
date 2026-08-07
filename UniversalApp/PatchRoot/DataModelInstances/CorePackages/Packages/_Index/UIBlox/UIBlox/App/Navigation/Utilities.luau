local parent = script.Parent
local parent_1 = parent.Parent.Parent
local inputTypeModule = require(parent_1.Enums.InputType)
local cryoModule = require(parent_1.Parent.Cryo)
local _ = require(parent.ShortcutBar.Types)

local _ = function(p0) --[[ line: 10 ]]
	-- upvalues: inputTypeModule (ref), cryoModule (ref)
	return function(p1, _) --[[ line: 11 ]]
		-- upvalues: p0 (ref), inputTypeModule (copy), cryoModule (copy)
		local icon = p1.icon
		
		if typeof(icon) == "string" or typeof(icon) == "table" and icon.Image then return end
		if typeof(icon) == "EnumItem" or #icon > 0 and typeof(icon[1]) == "EnumItem" and p0 == inputTypeModule.MouseAndKeyboard then
			return p1
		elseif icon[p0] then
			return cryoModule.Dictionary.join(p1, { icon = icon[p0] })
		end
	end
end

return {
	filterItems = function(p2, p3) --[[ line: 35 ]]
		-- upvalues: cryoModule (ref), inputTypeModule (ref)
		local var2 = cryoModule.List.filter(p2, function(p4, _) --[[ line: 37 ]]
			local icon = p4.icon
			
			return if typeof(icon) ~= "string" then typeof(icon) == "table" and icon.Image else true
		end)
		
		if p3 then
			assert(p3, "Assert inputType not nil at this point to silence type checker")
			
			return cryoModule.List.join(var2, cryoModule.List.filterMap(p2, function(p5, _) --[[ line: 11 ]]
				-- upvalues: p3 (ref), inputTypeModule (copy), cryoModule (copy)
				local icon = p5.icon
				
				if typeof(icon) == "string" or typeof(icon) == "table" and icon.Image then return end
				if typeof(icon) == "EnumItem" or #icon > 0 and typeof(icon[1]) == "EnumItem" and p3 == inputTypeModule.MouseAndKeyboard then
					return p5
				elseif icon[p3] then
					return cryoModule.Dictionary.join(p5, { icon = icon[p3] })
				end
			end))
		end
		return var2
	end
}