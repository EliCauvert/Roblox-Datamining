local SduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local Parent = SduiSharedContent.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.SduiCompat)
local CheckAndFormatPossibleLinkFunction = require(Parent.CollectionViews).checkAndFormatPossibleLink
local SduiTextModule = require(script.Parent.SduiText)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local FFlagSduiLinkTextStyleOverrideModule = require(SduiSharedContent.Flags.FFlagSduiLinkTextStyleOverride)

return function(p1) --[[ Line: 28 | Named "SduiLinkText" ]]
	-- upvalues: UseTokensFunction (copy), FFlagSduiLinkTextStyleOverrideModule (copy), CheckAndFormatPossibleLinkFunction (copy), ReactModule (copy), SduiTextModule (copy), CryoModule (copy)
	local UseTokensResult = UseTokensFunction()
	local Text = p1.text
	local RichText = p1.richText
	
	if Text then
		local LinkStyleColor3 = if p1.linkStyle and p1.linkStyle.Color3 then p1.linkStyle.Color3 else UseTokensResult.Color.Content.Link.Color3
		local NoFFlagSduiLinkTextStyleOverrideModule: boolean = not FFlagSduiLinkTextStyleOverrideModule or p1.isLinkBold ~= false
		local ColorName: string = `<font color="{string.format("rgb(%d, %d, %d)", math.round(LinkStyleColor3.R * 255), math.round(LinkStyleColor3.G * 255), (math.round(LinkStyleColor3.B * 255)))}">`
		local Text1 = "</font>"
		
		if if FFlagSduiLinkTextStyleOverrideModule then p1.isLinkUnderlined == true else false then
			ColorName ..= "<u>"
			Text1 = "</u>" .. Text1
		end
		if NoFFlagSduiLinkTextStyleOverrideModule then
			ColorName ..= "<b>"
			Text1 = "</b>" .. Text1
		end
		local CheckAndFormatPossibleLinkResult, CheckAndFormatPossibleLinkResult2 = CheckAndFormatPossibleLinkFunction(Text, nil, nil, ColorName, Text1)
		
		if CheckAndFormatPossibleLinkResult then
			Text = CheckAndFormatPossibleLinkResult2
			RichText = true
		end
	end
	return ReactModule.createElement(SduiTextModule, CryoModule.Dictionary.join(p1, {
		text = Text,
		richText = RichText,
		linkStyle = CryoModule.None,
		isLinkBold = if FFlagSduiLinkTextStyleOverrideModule then CryoModule.None else nil,
		isLinkUnderlined = if FFlagSduiLinkTextStyleOverrideModule then CryoModule.None else nil
	}))
end