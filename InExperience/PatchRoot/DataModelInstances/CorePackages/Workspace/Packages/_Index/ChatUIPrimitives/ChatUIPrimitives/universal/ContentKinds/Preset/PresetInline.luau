local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local EscapeRichTextModule = require(ChatUIPrimitives.Utils.escapeRichText)
local _ = require(script.Parent.PresetTypes)
local GetPresetIconRichTextModule = require(script.Parent.getPresetIconRichText)

return function(Frame)
	-- upvalues: FoundationModule (copy), SignalsReactModule (copy), ReactModule (copy), GetPresetIconRichTextModule (copy), EscapeRichTextModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetPresetIconRichTextModule (upval), UseTokensResult (copy)
		return GetPresetIconRichTextModule(UseTokensResult.Typography.BodyLarge.FontSize)
	end, { UseTokensResult })
	
	return ReactModule.createElement(FoundationModule.Text, {
		tag = "size-full-0 auto-y text-wrap text-align-x-left text-align-y-top",
		RichText = true,
		Text = SignalsReactModule.useSignalBinding(Frame.getContent):map(function(p1): string
			-- upvalues: EscapeRichTextModule (upval), UseMemoResult (copy)
			return `{EscapeRichTextModule(p1.displayText)} {UseMemoResult}`
		end),
		LayoutOrder = Frame.LayoutOrder
	})
end