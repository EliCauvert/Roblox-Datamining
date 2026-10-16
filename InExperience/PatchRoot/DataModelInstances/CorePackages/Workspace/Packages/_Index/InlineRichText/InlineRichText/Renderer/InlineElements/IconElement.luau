local Parent = script:FindFirstAncestor("InlineRichText").Parent
local CryoModule = require(Parent.Cryo)
local RenderableInlineElement = require(Parent.InlineLayout).Components.InlineLayoutElements.RenderableInlineElement
local Icon = require(Parent.Foundation).Icon

local function mapProps(p1) --[[ Line: 13 ]]
	-- upvalues: CryoModule (copy)
	return CryoModule.Dictionary.omit(p1, "id", "Size")
end

return {
	new = function(Icon1) --[[ Line: 25 ]]
		-- upvalues: RenderableInlineElement (copy), Icon (copy), CryoModule (copy), mapProps (copy)
		return RenderableInlineElement.new(Icon, CryoModule.Dictionary.join(Icon1, { Size = UDim2.fromOffset(Icon1.size, Icon1.size) }), mapProps)
	end
}