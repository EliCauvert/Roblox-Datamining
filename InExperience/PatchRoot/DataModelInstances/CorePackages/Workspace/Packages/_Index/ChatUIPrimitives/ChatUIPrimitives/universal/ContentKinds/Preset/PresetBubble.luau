local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local EscapeRichTextModule = require(ChatUIPrimitives.Utils.escapeRichText)
local BubbleStyleContextModule = require(script.Parent.Parent.Parent.MessageList.Bubble.BubbleStyleContext)
local UseBubbleContentMaxWidthFunction = require(script.Parent.Parent.Parent.MessageList.Bubble.useBubbleMaxWidth).useBubbleContentMaxWidth
local _ = require(script.Parent.PresetTypes)
local GetPresetIconRichTextModule = require(script.Parent.getPresetIconRichText)

return function(Frame) --[[ Line: 21 | Named "PresetBubble" ]]
	-- upvalues: BubbleStyleContextModule (copy), SignalsReactModule (copy), UseBubbleContentMaxWidthFunction (copy), ReactModule (copy), GetPresetIconRichTextModule (copy), FoundationModule (copy), EscapeRichTextModule (copy)
	local UseBubbleFontStyleResult, UseBubbleFontStyleResult2 = BubbleStyleContextModule.useBubbleFontStyle()
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding(Frame.getContent)
	local UseBubbleContentMaxWidthResult = UseBubbleContentMaxWidthFunction()
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 35 ]]
		-- upvalues: GetPresetIconRichTextModule (upval), UseBubbleFontStyleResult (copy)
		return GetPresetIconRichTextModule(UseBubbleFontStyleResult.fontSize)
	end, { UseBubbleFontStyleResult.fontSize })
	
	return ReactModule.createElement(FoundationModule.Text, {
		tag = "auto-xy text-wrap text-align-x-left text-align-y-top",
		RichText = true,
		Text = UseSignalBindingResult:map(function(p1): string --[[ Line: 41 ]]
			-- upvalues: EscapeRichTextModule (upval), UseMemoResult (copy)
			return `{EscapeRichTextModule(p1.displayText)} {UseMemoResult}`
		end),
		textStyle = UseBubbleFontStyleResult.textStyle,
		fontStyle = UseBubbleFontStyleResult2,
		sizeConstraint = ReactModule.useMemo(function() --[[ Line: 27 ]]
			-- upvalues: UseBubbleContentMaxWidthResult (copy)
			return {
				MinSize = Vector2.new(0, 0),
				MaxSize = Vector2.new(UseBubbleContentMaxWidthResult, 1e999)
			}
		end, { UseBubbleContentMaxWidthResult }),
		LayoutOrder = Frame.LayoutOrder
	})
end