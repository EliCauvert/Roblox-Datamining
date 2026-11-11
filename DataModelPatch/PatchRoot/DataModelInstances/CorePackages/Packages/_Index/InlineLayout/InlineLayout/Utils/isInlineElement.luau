local Parent = script:FindFirstAncestor("Utils").Parent
local HardBreakElementModule = require(Parent.Components.InlineLayout.InlineLayoutElements.HardBreakElement)
local InlineElementTypeModule = require(Parent.Utils.InlineElementType)

return function(HardBreakElementModule1): boolean
	-- upvalues: HardBreakElementModule (copy), InlineElementTypeModule (copy)
	if HardBreakElementModule1 == HardBreakElementModule then
		return true
	elseif type(HardBreakElementModule1) == "table" then
		local Meta = getmetatable(HardBreakElementModule1)
		
		return Meta ~= nil and Meta.__type == InlineElementTypeModule
	else
		return false
	end
end