local Parent = script:FindFirstAncestor("Components").Parent.Parent
local DashModule = require(Parent.Dash)
local RenderableInlineElementModule = require(script:FindFirstAncestor("InlineLayoutElements").RenderableInlineElement)
local Image = require(Parent.Foundation).Image

local function mapProps(p1) --[[ Line: 13 ]]
	-- upvalues: DashModule (copy)
	return DashModule.omit(p1, { "id" })
end

return {
	new = function(Image1) --[[ Line: 17 ]]
		-- upvalues: RenderableInlineElementModule (copy), Image (copy), mapProps (copy)
		return RenderableInlineElementModule.new(Image, Image1, mapProps)
	end
}