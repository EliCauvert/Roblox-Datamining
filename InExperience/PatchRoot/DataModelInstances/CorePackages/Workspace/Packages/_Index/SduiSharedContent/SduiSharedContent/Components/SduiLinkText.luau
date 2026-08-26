local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local _ = require(parent.SduiCompat)
local checkAndFormatPossibleLink = require(parent.CollectionViews).checkAndFormatPossibleLink
local sduiTextModule = require(script.Parent.SduiText)
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), checkAndFormatPossibleLink (ref), reactModule (ref), sduiTextModule (ref), cryoModule (ref)
	local var1 = useTokens()
	local text = p1.text
	local richText = p1.richText
	
	if text then
		local var2 = if p1.linkStyle and p1.linkStyle.Color3 then p1.linkStyle.Color3 else var1.Color.Content.Link.Color3
		local var3, var4 = checkAndFormatPossibleLink(text, nil, nil, `<font color="{string.format("rgb(%d, %d, %d)", math.round(var5.R * 255), math.round(var5.G * 255), math.round(var5.B * 255))}"><b>`, "</b></font>")
		
		if var3 then
			text = var4
			richText = true
		end
	end
	return reactModule.createElement(sduiTextModule, cryoModule.Dictionary.join(p1, {
		text = text,
		richText = richText,
		linkStyle = cryoModule.None
	}))
end