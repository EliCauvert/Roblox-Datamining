local parent = script:FindFirstAncestor("Components").Parent.Parent
local inlineLayoutElements = script:FindFirstAncestor("InlineLayoutElements")
local foundationModule = require(parent.Foundation)
local dashModule = require(parent.Dash)
local renderableInlineElementModule = require(inlineLayoutElements.RenderableInlineElement)
local image = foundationModule.Image
local t = {}

local function mapProps(p1)
	-- upvalues: dashModule (ref)
	return dashModule.omit(p1, { "id" })
end

function t.new(p1)
	-- upvalues: renderableInlineElementModule (ref), image (ref), mapProps (ref)
	return renderableInlineElementModule.new(image, p1, mapProps)
end

return t