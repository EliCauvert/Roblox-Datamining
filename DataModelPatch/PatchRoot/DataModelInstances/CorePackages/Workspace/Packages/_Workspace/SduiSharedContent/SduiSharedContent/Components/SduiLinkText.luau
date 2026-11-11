local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.SduiCompat)
local CheckAndFormatPossibleLinkFunction = require(Parent.CollectionViews).checkAndFormatPossibleLink
local SduiTextModule = require(script.Parent.SduiText)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens

return function(p1)
	-- upvalues: UseTokensFunction (copy), CheckAndFormatPossibleLinkFunction (copy), ReactModule (copy), SduiTextModule (copy), CryoModule (copy)
	local UseTokensResult = UseTokensFunction()
	local Text = p1.text
	local RichText = p1.richText
	
	if Text then
		local LinkStyleColor3 = if p1.linkStyle and p1.linkStyle.Color3 then p1.linkStyle.Color3 else UseTokensResult.Color.Content.Link.Color3
		local _Font, Font2 = CheckAndFormatPossibleLinkFunction(Text, nil, nil, `<font color="{string.format("rgb(%d, %d, %d)", math.round(LinkStyleColor3.R * 255), math.round(LinkStyleColor3.G * 255), (math.round(LinkStyleColor3.B * 255)))}"><b>`, "</b></font>")
		
		if _Font then
			Text = Font2
			RichText = true
		end
	end
	return ReactModule.createElement(SduiTextModule, CryoModule.Dictionary.join(p1, {
		text = Text,
		richText = RichText,
		linkStyle = CryoModule.None
	}))
end