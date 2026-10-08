local sduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local parent = sduiSharedContent.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local _ = require(parent.SduiCompat)
local checkAndFormatPossibleLink = require(parent.CollectionViews).checkAndFormatPossibleLink
local sduiTextModule = require(script.Parent.SduiText)
local useTokens = foundationModule.Hooks.useTokens
local fFlagSduiLinkTextStyleOverrideModule = require(sduiSharedContent.Flags.FFlagSduiLinkTextStyleOverride)

return function(p1)
	-- upvalues: useTokens (ref), fFlagSduiLinkTextStyleOverrideModule (ref), checkAndFormatPossibleLink (ref), reactModule (ref), sduiTextModule (ref), cryoModule (ref)
	local var1 = useTokens()
	local text = p1.text
	local richText = p1.richText
	
	if text then
		local var2
		local var3 = if p1.linkStyle and p1.linkStyle.Color3 then p1.linkStyle.Color3 else var1.Color.Content.Link.Color3
		local formattedText = string.format("rgb(%d, %d, %d)", math.round(var3.R * 255), math.round(var3.G * 255), math.round(var3.B * 255))
		
		if fFlagSduiLinkTextStyleOverrideModule then
			var2 = p1.isLinkBold ~= false
			var2 = nil
		else
			var2 = true
		end
		local var4
		if fFlagSduiLinkTextStyleOverrideModule then
			var4 = p1.isLinkUnderlined == true
			var4 = nil
		else
			var4 = false
		end
		local var5 = `<font color="{formattedText}">`
		local var6 = "</font>"
		
		if var4 then
			var5 ..= "<u>"
			var6 = "</u>" .. var12
		end
		if var2 then
			var5 ..= "<b>"
			var6 = "</b>" .. var12
		end
		local var7, var8 = checkAndFormatPossibleLink(text, nil, nil, var5, var6)
		
		if var7 then
			text = var8
			richText = true
		end
	end
	return reactModule.createElement(sduiTextModule, cryoModule.Dictionary.join(p1, {
		text = text,
		richText = richText,
		linkStyle = cryoModule.None,
		isLinkBold = if fFlagSduiLinkTextStyleOverrideModule then cryoModule.None else nil,
		isLinkUnderlined = if fFlagSduiLinkTextStyleOverrideModule then cryoModule.None else nil
	}))
end