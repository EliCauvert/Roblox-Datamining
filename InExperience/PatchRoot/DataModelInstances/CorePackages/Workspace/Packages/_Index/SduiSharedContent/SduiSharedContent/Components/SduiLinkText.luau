local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local _ = require(parent.SduiCompat)
local checkAndFormatPossibleLink = require(parent.CollectionViews).checkAndFormatPossibleLink
local sduiTextModule = require(script.Parent.SduiText)
local useTokens = foundationModule.Hooks.useTokens

return function(p0) --[[ line: 24 | named "SduiLinkText" ]]
	-- upvalues: useTokens (ref), checkAndFormatPossibleLink (ref), reactModule (ref), sduiTextModule (ref), cryoModule (ref)
	local var4 = useTokens()
	local text = p0.text
	local richText = p0.richText
	
	if text then
		local var5 = if p0.linkStyle and p0.linkStyle.Color3 then p0.linkStyle.Color3 else var4.Color.Content.Link.Color3
		local var6, var7 = checkAndFormatPossibleLink(text, nil, nil, `<font color="{string.format("rgb(%d, %d, %d)", math.round(var5.R * 255), math.round(var5.G * 255), math.round(var5.B * 255))}"><b>`, "</b></font>")
		
		if var6 then
			text = var7
			richText = true
		end
	end
	return reactModule.createElement(sduiTextModule, cryoModule.Dictionary.join(p0, {
		text = text,
		richText = richText,
		linkStyle = cryoModule.None
	}))
end