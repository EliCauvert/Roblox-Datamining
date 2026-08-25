local parent = script:FindFirstAncestor("Utils").Parent
local hardBreakElementModule = require(parent.Components.InlineLayout.InlineLayoutElements.HardBreakElement)
local inlineElementTypeModule = require(parent.Utils.InlineElementType)

return function(p0)
	-- upvalues: hardBreakElementModule (ref), inlineElementTypeModule (ref)
	if p0 == hardBreakElementModule then
		return true
	elseif type(p0) ~= "table" then
		return false
	end
	local var2 = getmetatable(p0)
	
	return var2 ~= nil and var2.__type == inlineElementTypeModule
end