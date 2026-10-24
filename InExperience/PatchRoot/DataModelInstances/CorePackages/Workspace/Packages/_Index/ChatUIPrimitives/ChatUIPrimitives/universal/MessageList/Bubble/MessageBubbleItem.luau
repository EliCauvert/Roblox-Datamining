local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Signals)
local CreateNextOrderFunction = require(Parent.ReactUtils).createNextOrder
local _ = require(script.Parent.Parent.groupMessages)
local BubbleAvatarModule = require(script.Parent.BubbleAvatar)
local BubbleStyleContextModule = require(script.Parent.BubbleStyleContext)
local BubbleUsernameModule = require(script.Parent.BubbleUsername)
local BubbleViewModule = require(script.Parent.BubbleView)
local GetBubbleToneModule = require(script.Parent.getBubbleTone)
local UseMessageBubbleViewModelModule = require(script.Parent.useMessageBubbleViewModel)
local WithMessageContentModule = require(script.Parent.Parent.Parent.ContentKinds.withMessageContent)
local config = {
	plainText = WithMessageContentModule(require(script.Parent.Parent.Parent.ContentKinds.PlainText.PlainTextBubble), require(script.Parent.Parent.Parent.ContentKinds.PlainText.PlainTextContentModel).getDetail),
	preset = WithMessageContentModule(require(script.Parent.Parent.Parent.ContentKinds.Preset.PresetBubble), require(script.Parent.Parent.Parent.ContentKinds.Preset.PresetContentModel).getDetail),
	emoji = WithMessageContentModule(require(script.Parent.Parent.Parent.ContentKinds.Emoji.EmojiBubble), require(script.Parent.Parent.Parent.ContentKinds.Emoji.EmojiContentModel).getDetail)
}

return function(p1)
	-- upvalues: UseMessageBubbleViewModelModule (copy), FoundationModule (copy), CreateNextOrderFunction (copy), ReactModule (copy), GetBubbleToneModule (copy), BubbleStyleContextModule (copy), config (copy), BubbleUsernameModule (copy), BubbleViewModule (copy), BubbleAvatarModule (copy)
	local UseMessageBubbleViewModelModuleResult = UseMessageBubbleViewModelModule(p1.itemSignal)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local NextOrder = CreateNextOrderFunction()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetBubbleToneModule (upval), UseMessageBubbleViewModelModuleResult (copy), UseTokensResult (copy), BubbleStyleContextModule (upval)
		return {
			backgroundStyle = GetBubbleToneModule(UseMessageBubbleViewModelModuleResult.isObservingUser, UseTokensResult).backgroundStyle,
			style = BubbleStyleContextModule.createBubbleStyle(UseMessageBubbleViewModelModuleResult.isObservingUser, UseTokensResult)
		}
	end, {
		UseMessageBubbleViewModelModuleResult.isObservingUser,
		UseTokensResult
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
	local t = {}
	
	if UseMessageBubbleViewModelModuleResult.showUsername then
		t.Username = ReactModule.createElement(BubbleUsernameModule, {
			LayoutOrder = 1,
			testId = "bubble-username",
			getIdentity = UseMessageBubbleViewModelModuleResult.getIdentity
		})
	end
	t.Bubble = ReactModule.createElement(BubbleViewModule, {
		LayoutOrder = 2,
		testId = "message-bubble",
		backgroundStyle = UseMemoResult.backgroundStyle,
		cornerRadii = UseMessageBubbleViewModelModuleResult.cornerRadii
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
				["row align-x-left align-y-bottom gap-xsmall"] = not IsRight,
				["padding-top-small"] = IsFirst,
				["padding-top-xxsmall"] = not IsFirst
			}
		}, t1)
	})
end