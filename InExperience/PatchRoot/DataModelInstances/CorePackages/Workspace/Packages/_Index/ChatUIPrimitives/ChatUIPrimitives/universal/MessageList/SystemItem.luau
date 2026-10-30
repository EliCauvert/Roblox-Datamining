local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local EscapeRichTextModule = require(ChatUIPrimitives.Utils.escapeRichText)
local FormatInlineIconModule = require(ChatUIPrimitives.Utils.formatInlineIcon)
local SystemContentModelModule = require(script.Parent.Parent.ContentKinds.System.SystemContentModel)
local SizingModule = require(script.Parent.Sizing)
local _ = require(script.Parent.groupMessages)

local function systemRichText(ItemSignalResult)
	-- upvalues: SystemContentModelModule (copy), EscapeRichTextModule (copy), FormatInlineIconModule (copy)
	local Content = ItemSignalResult.message.contents[1]
	local Detail = if Content == nil then nil else SystemContentModelModule.getDetail(Content)
	
	if Detail == nil then
		return ""
	else
		local EscapeRichTextModuleResult = EscapeRichTextModule(Detail.text)
		
		return if Detail.iconName == nil then EscapeRichTextModuleResult else `{FormatInlineIconModule(Detail.iconName, { weight = "600" })} {EscapeRichTextModuleResult}`
	end
end

return function(p1)
	-- upvalues: SignalsReactModule (copy), systemRichText (copy), SizingModule (copy), FoundationModule (copy), ReactModule (copy)
	return ReactModule.createElement(FoundationModule.Text, {
		RichText = true,
		testId = "message-system",
		tag = FoundationModule.Hooks.useDefaultTags(SizingModule.useSizing().system.tag, "size-full-0 auto-y text-wrap text-align-x-center content-muted"),
		Text = SignalsReactModule.useSignalBinding(function(p2)
			-- upvalues: systemRichText (upval), p1 (copy)
			return (systemRichText(p1.itemSignal(p2)))
		end)
	})
end