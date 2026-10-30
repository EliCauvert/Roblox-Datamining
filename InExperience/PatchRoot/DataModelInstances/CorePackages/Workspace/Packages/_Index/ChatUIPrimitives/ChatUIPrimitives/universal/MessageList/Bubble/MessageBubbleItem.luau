local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Signals)
local CreateNextOrderFunction = require(Parent.ReactUtils).createNextOrder
local _ = require(script.Parent.Parent.groupMessages)
local BubbleAvatarModule = require(script.Parent.BubbleAvatar)
local SizingModule = require(script.Parent.Parent.Sizing)
local BubbleStyleContextModule = require(script.Parent.BubbleStyleContext)
local BubbleUsernameModule = require(script.Parent.BubbleUsername)
local BubbleViewModule = require(script.Parent.BubbleView)
local ReplyQuoteModule = require(script.Parent.Parent.Reply.ReplyQuote)
local GetBubbleToneModule = require(script.Parent.getBubbleTone)
local UseMessageBubbleViewModelModule = require(script.Parent.useMessageBubbleViewModel)
local WithMessageContentModule = require(script.Parent.Parent.Parent.ContentKinds.withMessageContent)
local config = {
	plainText = WithMessageContentModule(require(script.Parent.Parent.Parent.ContentKinds.PlainText.PlainTextBubble), require(script.Parent.Parent.Parent.ContentKinds.PlainText.PlainTextContentModel).getDetail),
	preset = WithMessageContentModule(require(script.Parent.Parent.Parent.ContentKinds.Preset.PresetBubble), require(script.Parent.Parent.Parent.ContentKinds.Preset.PresetContentModel).getDetail),
	emoji = WithMessageContentModule(require(script.Parent.Parent.Parent.ContentKinds.Emoji.EmojiBubble), require(script.Parent.Parent.Parent.ContentKinds.Emoji.EmojiContentModel).getDetail)
}

return function(p1)
	-- upvalues: UseMessageBubbleViewModelModule (copy), FoundationModule (copy), SizingModule (copy), CreateNextOrderFunction (copy), ReactModule (copy), GetBubbleToneModule (copy), config (copy), ReplyQuoteModule (copy), BubbleUsernameModule (copy), BubbleViewModule (copy), BubbleAvatarModule (copy), BubbleStyleContextModule (copy)
	local UseMessageBubbleViewModelModuleResult = UseMessageBubbleViewModelModule(p1.itemSignal)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local IsCompact = SizingModule.useSizing().density == "compact"
	local NextOrder = CreateNextOrderFunction()
	local IsSending = UseMessageBubbleViewModelModuleResult.deliveryState == "sending"
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetBubbleToneModule (upval), UseMessageBubbleViewModelModuleResult (copy), UseTokensResult (copy), IsSending (copy)
		local BubbleToneModule = GetBubbleToneModule(UseMessageBubbleViewModelModuleResult.isObservingUser, UseTokensResult, IsSending)
		
		return {
			backgroundStyle = BubbleToneModule.backgroundStyle,
			style = { textStyle = BubbleToneModule.textStyle }
		}
	end, {
		UseMessageBubbleViewModelModuleResult.isObservingUser,
		UseTokensResult,
		IsSending
	})
	local Elements = {}
	
	for LayoutOrder, content in UseMessageBubbleViewModelModuleResult.contents do
		local Entry = config[content.kind]
		
		if Entry then
			Elements["content" .. LayoutOrder] = ReactModule.createElement(Entry, {
				getContent = content.getContent,
				LayoutOrder = LayoutOrder
			})
		end
	end
	local IsRight = UseMessageBubbleViewModelModuleResult.alignment == "right"
	local IsFirst = UseMessageBubbleViewModelModuleResult.groupPosition.isFirst
	local NextOrder1 = CreateNextOrderFunction()
	local t = {}
	
	if UseMessageBubbleViewModelModuleResult.replyText ~= nil then
		t.Reply = ReactModule.createElement(ReplyQuoteModule.Bubble, {
			text = UseMessageBubbleViewModelModuleResult.replyText,
			label = UseMessageBubbleViewModelModuleResult.replyLabel,
			isObservingUser = UseMessageBubbleViewModelModuleResult.isObservingUser,
			LayoutOrder = NextOrder1()
		})
	end
	if UseMessageBubbleViewModelModuleResult.showUsername then
		t.Username = ReactModule.createElement(BubbleUsernameModule, {
			testId = "bubble-username",
			getIdentity = UseMessageBubbleViewModelModuleResult.getIdentity,
			LayoutOrder = NextOrder1()
		})
	end
	t.Bubble = ReactModule.createElement(BubbleViewModule, {
		testId = "message-bubble",
		backgroundStyle = UseMemoResult.backgroundStyle,
		cornerRadii = UseMessageBubbleViewModelModuleResult.cornerRadii,
		LayoutOrder = NextOrder1()
	}, Elements)
	local t1 = {}
	
	if not UseMessageBubbleViewModelModuleResult.isObservingUser then
		t1.Avatar = ReactModule.createElement(BubbleAvatarModule, {
			testId = "bubble-avatar",
			getIdentity = UseMessageBubbleViewModelModuleResult.getIdentity,
			visible = UseMessageBubbleViewModelModuleResult.showAvatar,
			LayoutOrder = NextOrder()
		})
	end
	t1.Stack = ReactModule.createElement(FoundationModule.View, {
		tag = {
			["col align-x-right gap-xxsmall auto-xy"] = IsRight,
			["col align-x-left gap-xxsmall auto-xy"] = not IsRight
		},
		LayoutOrder = NextOrder()
	}, t)
	
	return ReactModule.createElement(BubbleStyleContextModule.Context.Provider, { value = UseMemoResult.style }, {
		Row = ReactModule.createElement(FoundationModule.View, {
			testId = "message-bubble-row",
			tag = {
				["size-full-0 auto-y"] = true,
				["col align-x-right"] = IsRight,
				["row align-x-left align-y-bottom"] = not IsRight,
				["gap-xsmall"] = not IsRight and not IsCompact,
				["gap-xxsmall"] = not IsRight and IsCompact,
				["padding-top-small"] = IsFirst,
				["padding-top-xxsmall"] = not IsFirst
			}
		}, t1)
	})
end