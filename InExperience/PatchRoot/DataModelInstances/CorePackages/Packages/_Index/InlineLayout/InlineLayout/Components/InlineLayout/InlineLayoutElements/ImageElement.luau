local Parent = script:FindFirstAncestor("Components").Parent.Parent
local FoundationModule = require(Parent.Foundation)
local DashModule = require(Parent.Dash)
local RenderableInlineElementModule = require(script:FindFirstAncestor("InlineLayoutElements").RenderableInlineElement)
local Image = FoundationModule.Image

local function mapProps(p1)
	-- upvalues: DashModule (copy)
	return DashModule.omit(p1, { "id" })
end

return {
	new = function(Image1)
		-- upvalues: RenderableInlineElementModule (copy), Image (copy), mapProps (copy)
		return RenderableInlineElementModule.new(Image, Image1, mapProps)
	end
}