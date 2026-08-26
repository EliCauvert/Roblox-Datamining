local parent = script:FindFirstAncestor("Utils").Parent
local hardBreakElementModule = require(parent.Components.InlineLayout.InlineLayoutElements.HardBreakElement)
local inlineElementTypeModule = require(parent.Utils.InlineElementType)

return function(p1)
	-- upvalues: hardBreakElementModule (ref), inlineElementTypeModule (ref)
	if p1 == hardBreakElementModule then
		return true
	elseif type(p1) ~= "table" then
		return false
	end
	local var1 = getmetatable(p1)
	
	return var1 ~= nil and var1.__type == inlineElementTypeModule
end