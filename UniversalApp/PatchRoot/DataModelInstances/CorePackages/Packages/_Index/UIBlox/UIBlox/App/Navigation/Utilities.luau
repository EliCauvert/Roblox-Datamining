local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local InputTypeModule = require(Parent1.Enums.InputType)
local CryoModule = require(Parent1.Parent.Cryo)
local _ = require(Parent.ShortcutBar.Types)

local function _(p1) --[[ Line: 10 ]]
	-- upvalues: InputTypeModule (copy), CryoModule (copy)
	return function(p2, _) --[[ Line: 11 ]]
		-- upvalues: p1 (copy), InputTypeModule (upval), CryoModule (upval)
		local Icon = p2.icon
		
		if typeof(Icon) == "string" or typeof(Icon) == "table" and Icon.Image then return end
		if typeof(Icon) == "EnumItem" or #Icon > 0 and typeof(Icon[1]) == "EnumItem" and p1 == InputTypeModule.MouseAndKeyboard then
			return p2
		elseif not Icon[p1] then return end
		return CryoModule.Dictionary.join(p2, { icon = Icon[p1] })
	end
end

return {
	filterItems = function(p1, MouseAndKeyboard) --[[ Line: 35 ]]
		-- upvalues: CryoModule (copy), InputTypeModule (copy)
		local FilterResult = CryoModule.List.filter(p1, function(p2, _) --[[ Line: 37 ]]
			local Icon = p2.icon
			
			return typeof(Icon) == "string" or typeof(Icon) == "table" and Icon.Image
		end)
		
		if MouseAndKeyboard then
			assert(MouseAndKeyboard, "Assert inputType not nil at this point to silence type checker")
			
			return (CryoModule.List.join(FilterResult, CryoModule.List.filterMap(p1, function(p2, _) --[[ Line: 11 ]]
				-- upvalues: MouseAndKeyboard (copy), InputTypeModule (upval), CryoModule (upval)
				local Icon = p2.icon
				
				if typeof(Icon) == "string" or typeof(Icon) == "table" and Icon.Image then return end
				if typeof(Icon) == "EnumItem" or #Icon > 0 and typeof(Icon[1]) == "EnumItem" and MouseAndKeyboard == InputTypeModule.MouseAndKeyboard then
					return p2
				elseif not Icon[MouseAndKeyboard] then return end
				return CryoModule.Dictionary.join(p2, { icon = Icon[MouseAndKeyboard] })
			end)))
		else
			return FilterResult
		end
	end
}