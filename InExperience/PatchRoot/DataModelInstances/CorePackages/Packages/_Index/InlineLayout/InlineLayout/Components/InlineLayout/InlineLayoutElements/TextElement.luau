local Parent = script:FindFirstAncestor("Components").Parent.Parent
local DashModule = require(Parent.Dash)
local FoundationModule = require(Parent.Foundation)
local BaseTextElementModule = require(script:FindFirstAncestor("InlineLayoutElements").BaseTextElement)
local Text = FoundationModule.Text

function mapProps(p1)
	-- upvalues: DashModule (copy)
	return DashModule.join(DashModule.omit(p1, { "id", "EngineTags" }), {
		TextXAlignment = Enum.TextXAlignment.Left,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	})
end

return {
	new = function(p1)
		-- upvalues: BaseTextElementModule (copy), Text (copy)
		return BaseTextElementModule.new(Text, p1, mapProps)
	end
}