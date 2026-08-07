local parent = script:FindFirstAncestor("InlineRichText").Parent
local cryoModule = require(parent.Cryo)
local renderableInlineElement = require(parent.InlineLayout).Components.InlineLayoutElements.RenderableInlineElement
local icon = require(parent.Foundation).Icon
local t = {}

local function mapProps(p0) --[[ line: 13 ]]
	-- upvalues: cryoModule (ref)
	return cryoModule.Dictionary.omit(p0, "id", "Size")
end

function t.new(p1) --[[ line: 25 ]]
	-- upvalues: renderableInlineElement (ref), icon (ref), cryoModule (ref), mapProps (ref)
	return renderableInlineElement.new(icon, cryoModule.Dictionary.join(p1, { Size = UDim2.fromOffset(p1.size, p1.size) }), mapProps)
end

return t