local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local EscapeRichTextModule = require(ChatUIPrimitives.Utils.escapeRichText)
local BubbleStyleContextModule = require(script.Parent.Parent.Parent.MessageList.Bubble.BubbleStyleContext)
local SizingModule = require(script.Parent.Parent.Parent.MessageList.Sizing)
local _ = require(script.Parent.PresetTypes)
local GetPresetIconRichTextModule = require(script.Parent.getPresetIconRichText)

return function(Frame)
	-- upvalues: BubbleStyleContextModule (copy), SignalsReactModule (copy), SizingModule (copy), ReactModule (copy), GetPresetIconRichTextModule (copy), FoundationModule (copy), EscapeRichTextModule (copy)
	local UseBubbleFontStyleResult, UseBubbleFontStyleResult2 = BubbleStyleContextModule.useBubbleFontStyle()
	local ContentMaxWidth = SizingModule.useSizing().bubble.contentMaxWidth
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetPresetIconRichTextModule (upval), UseBubbleFontStyleResult2 (copy)
		return GetPresetIconRichTextModule(UseBubbleFontStyleResult2.FontSize)
	end, { UseBubbleFontStyleResult2.FontSize })
	
	return ReactModule.createElement(FoundationModule.Text, {
		tag = "auto-xy text-wrap text-align-x-left text-align-y-top",
		RichText = true,
		Text = SignalsReactModule.useSignalBinding(Frame.getContent):map(function(p1): string
			-- upvalues: EscapeRichTextModule (upval), UseMemoResult (copy)
			return `{EscapeRichTextModule(p1.displayText)} {UseMemoResult}`
		end),
		textStyle = UseBubbleFontStyleResult.textStyle,
		fontStyle = UseBubbleFontStyleResult2,
		sizeConstraint = ReactModule.useMemo(function()
			-- upvalues: ContentMaxWidth (copy)
			return {
				MinSize = Vector2.new(0, 0),
				MaxSize = Vector2.new(ContentMaxWidth, 1e999)
			}
		end, { ContentMaxWidth }),
		LayoutOrder = Frame.LayoutOrder
	})
end