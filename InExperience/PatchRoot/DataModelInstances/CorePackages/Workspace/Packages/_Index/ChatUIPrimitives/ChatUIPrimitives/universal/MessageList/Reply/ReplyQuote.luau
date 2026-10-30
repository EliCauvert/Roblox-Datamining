local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local EscapeRichTextModule = require(ChatUIPrimitives.Utils.escapeRichText)
local FormatInlineIconModule = require(ChatUIPrimitives.Utils.formatInlineIcon)
local BubbleViewModule = require(script.Parent.Parent.Bubble.BubbleView)
local SizingModule = require(script.Parent.Parent.Sizing)

return {
	Bubble = function(Frame)
		-- upvalues: SizingModule (copy), FoundationModule (copy), ReactModule (copy), BubbleViewModule (copy)
		local UseSizingResult = SizingModule.useSizing()
		local IsObservingUser = Frame.isObservingUser
		local Reply = UseSizingResult.reply
		local CornerRadius = UseSizingResult.bubble.cornerRadius
		local ContentMaxWidth = UseSizingResult.bubble.contentMaxWidth
		local AutoXyContentMuted = FoundationModule.Hooks.useDefaultTags(if IsObservingUser then Reply.rightLabelTag else Reply.leftLabelTag, "auto-xy content-muted")
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: ContentMaxWidth (copy)
			return {
				MinSize = Vector2.new(0, 0),
				MaxSize = Vector2.new(ContentMaxWidth, 1e999)
			}
		end, { ContentMaxWidth })
		
		return ReactModule.createElement(FoundationModule.View, {
			tag = {
				["col gap-xxsmall auto-xy padding-bottom-xxsmall"] = true,
				["align-x-right"] = IsObservingUser,
				["align-x-left"] = not IsObservingUser
			},
			LayoutOrder = Frame.LayoutOrder
		}, {
			Label = if Frame.label == nil then nil else ReactModule.createElement(FoundationModule.Text, {
				LayoutOrder = 1,
				testId = "message-reply-label",
				tag = AutoXyContentMuted,
				Text = Frame.label,
				TextTruncate = Enum.TextTruncate.AtEnd,
				sizeConstraint = UseMemoResult
			}),
			Quote = ReactModule.createElement(FoundationModule.View, {
				tag = "row gap-small auto-xy",
				LayoutOrder = 2,
				testId = "message-reply-quote"
			}, {
				Marker = ReactModule.createElement(FoundationModule.View, {
					tag = "self-stretch radius-circle bg-shift-400",
					testId = "message-reply-marker",
					Size = UDim2.fromOffset(Reply.markerWidth, 0),
					LayoutOrder = if IsObservingUser then 2 else 1
				}),
				Bubble = ReactModule.createElement(BubbleViewModule, {
					backgroundStyle = FoundationModule.Hooks.useTokens().Color.Shift.Shift_200,
					cornerRadii = ReactModule.useMemo(function()
						-- upvalues: CornerRadius (copy)
						return {
							topLeft = CornerRadius,
							topRight = CornerRadius,
							bottomLeft = CornerRadius,
							bottomRight = CornerRadius
						}
					end, { CornerRadius }),
					LayoutOrder = if IsObservingUser then 1 else 2
				}, {
					Text = ReactModule.createElement(FoundationModule.Text, {
						tag = "auto-xy text-wrap text-align-x-left text-align-y-top content-muted",
						testId = "message-reply",
						fontStyle = Reply.fontStyle,
						Text = Frame.text,
						TextTruncate = Enum.TextTruncate.AtEnd,
						sizeConstraint = ReactModule.useMemo(function()
							-- upvalues: Reply (copy)
							return {
								MinSize = Vector2.new(0, 0),
								MaxSize = Vector2.new(Reply.textMaxWidth, Reply.textMaxHeight)
							}
						end, { Reply.textMaxWidth, Reply.textMaxHeight })
					})
				})
			})
		})
	end,
	Inline = function(Frame)
		-- upvalues: ReactModule (copy), FormatInlineIconModule (copy), FoundationModule (copy), EscapeRichTextModule (copy)
		return ReactModule.createElement(FoundationModule.Text, {
			tag = "size-full-0 auto-y text-caption-small text-align-x-left content-muted",
			RichText = true,
			testId = "message-reply",
			Text = ReactModule.useMemo(function(): string
				-- upvalues: Frame (copy), FormatInlineIconModule (upval), FoundationModule (upval), EscapeRichTextModule (upval)
				return `{FormatInlineIconModule(FoundationModule.Enums.IconName.ArrowCurlToLeft, { weight = "600" })} {EscapeRichTextModule((string.gsub(Frame.text, "%s+", " ")))}`
			end, { Frame.text }),
			TextTruncate = Enum.TextTruncate.AtEnd,
			LayoutOrder = Frame.LayoutOrder
		})
	end
}