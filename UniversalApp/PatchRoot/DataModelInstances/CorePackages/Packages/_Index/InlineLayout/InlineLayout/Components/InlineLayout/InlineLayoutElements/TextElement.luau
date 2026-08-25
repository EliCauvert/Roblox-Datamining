local parent = script:FindFirstAncestor("Components").Parent.Parent
local dashModule = require(parent.Dash)
local baseTextElementModule = require(script:FindFirstAncestor("InlineLayoutElements").BaseTextElement)
local text = require(parent.Foundation).Text
local t = {
	new = function(p0)
		-- upvalues: baseTextElementModule (ref), text (ref)
		return baseTextElementModule.new(text, p0, mapProps)
	end
}

function mapProps(p1)
	-- upvalues: dashModule (ref)
	return dashModule.omit(p1, { "id", "EngineTags" })
end

return t