local parent = script:FindFirstAncestor("Components").Parent.Parent
local dashModule = require(parent.Dash)
local baseTextElementModule = require(script:FindFirstAncestor("InlineLayoutElements").BaseTextElement)
local text = require(parent.Foundation).Text
local t = {
	new = function(p1)
		-- upvalues: baseTextElementModule (ref), text (ref)
		return baseTextElementModule.new(text, p1, mapProps)
	end
}

function mapProps(p1)
	-- upvalues: dashModule (ref)
	return dashModule.join(dashModule.omit(p1, { "id", "EngineTags" }), {
		TextXAlignment = Enum.TextXAlignment.Left,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	})
end

return t