local parent = script.Parent
local parent_1 = parent.Parent.Parent
local inputTypeModule = require(parent_1.Enums.InputType)
local cryoModule = require(parent_1.Parent.Cryo)
local _ = require(parent.ShortcutBar.Types)

local _ = function(p1)
	-- upvalues: inputTypeModule (ref), cryoModule (ref)
	return function(p2, _)
		-- upvalues: p1 (ref), inputTypeModule (copy), cryoModule (copy)
		local icon = p2.icon
		
		if typeof(icon) == "string" or typeof(icon) == "table" and icon.Image then return end
		if typeof(icon) == "EnumItem" or #icon > 0 and typeof(icon[1]) == "EnumItem" and p1 == inputTypeModule.MouseAndKeyboard then
			return p2
		elseif icon[p1] then
			return cryoModule.Dictionary.join(p2, { icon = icon[p1] })
		end
	end
end

return {
	filterItems = function(p1, p2)
		-- upvalues: cryoModule (ref), inputTypeModule (ref)
		local var1 = cryoModule.List.filter(p1, function(p3, _)
			local icon = p3.icon
			
			return if typeof(icon) ~= "string" then typeof(icon) == "table" and icon.Image else true
		end)
		
		if p2 then
			assert(p2, "Assert inputType not nil at this point to silence type checker")
			
			return cryoModule.List.join(var1, cryoModule.List.filterMap(p1, function(p3, _)
				-- upvalues: p2 (ref), inputTypeModule (copy), cryoModule (copy)
				local icon = p3.icon
				
				if typeof(icon) == "string" or typeof(icon) == "table" and icon.Image then return end
				if typeof(icon) == "EnumItem" or #icon > 0 and typeof(icon[1]) == "EnumItem" and p2 == inputTypeModule.MouseAndKeyboard then
					return p3
				elseif icon[p2] then
					return cryoModule.Dictionary.join(p3, { icon = icon[p2] })
				end
			end))
		end
		return var1
	end
}