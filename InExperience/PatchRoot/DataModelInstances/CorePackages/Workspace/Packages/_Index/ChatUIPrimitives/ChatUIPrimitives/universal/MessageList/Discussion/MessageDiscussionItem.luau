local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Signals)
local CreateNextOrderFunction = require(Parent.ReactUtils).createNextOrder
local _ = require(script.Parent.Parent.groupMessages)
local SizingModule = require(script.Parent.Parent.Parent.Sizing)
local MessageAvatarModule = require(script.Parent.Parent.Parent.Adornments.MessageAvatar)
local DiscussionTopLineModule = require(script.Parent.DiscussionTopLine)
local UseMessageDiscussionViewModelModule = require(script.Parent.useMessageDiscussionViewModel)
local WithMessageContentModule = require(script.Parent.Parent.Parent.ContentKinds.withMessageContent)
local config = {
	plainText = WithMessageContentModule(require(script.Parent.Parent.Parent.ContentKinds.PlainText.PlainTextInline), require(script.Parent.Parent.Parent.ContentKinds.PlainText.PlainTextContentModel).getDetail),
	emoji = WithMessageContentModule(require(script.Parent.Parent.Parent.ContentKinds.Emoji.EmojiInline), require(script.Parent.Parent.Parent.ContentKinds.Emoji.EmojiContentModel).getDetail)
}

return function(p1)
	-- upvalues: UseMessageDiscussionViewModelModule (copy), SizingModule (copy), CreateNextOrderFunction (copy), ReactModule (copy), DiscussionTopLineModule (copy), config (copy), FoundationModule (copy), MessageAvatarModule (copy)
	local UseMessageDiscussionViewModelModuleResult = UseMessageDiscussionViewModelModule(p1.itemSignal)
	local Discussion = SizingModule.useSizing().discussion
	local NextOrder = CreateNextOrderFunction()
	local NextOrder1 = CreateNextOrderFunction()
	local Elements = {}
	
	if UseMessageDiscussionViewModelModuleResult.showIdentity then
		Elements.TopLine = ReactModule.createElement(DiscussionTopLineModule, {
			testId = "discussion-top-line",
			getIdentity = UseMessageDiscussionViewModelModuleResult.getIdentity,
			getSentAtUnixMilliseconds = UseMessageDiscussionViewModelModuleResult.getSentAtUnixMilliseconds,
			tag = Discussion.topLineTag,
			nameTag = Discussion.nameTag,
			timestampTag = Discussion.timestampTag,
			LayoutOrder = NextOrder1()
		})
	end
	for i, content in UseMessageDiscussionViewModelModuleResult.contents do
		local Entry = config[content.kind]
		
		if Entry then
			Elements["content" .. i] = ReactModule.createElement(Entry, {
				getContent = content.getContent,
				LayoutOrder = NextOrder1()
			})
		end
	end
	return ReactModule.createElement(FoundationModule.View, {
		testId = "message-discussion-row",
		tag = if UseMessageDiscussionViewModelModuleResult.showIdentity then Discussion.headRowTag else Discussion.continuationRowTag
	}, {
		Avatar = ReactModule.createElement(MessageAvatarModule, {
			testId = "discussion-avatar",
			getIdentity = UseMessageDiscussionViewModelModuleResult.getIdentity,
			visible = UseMessageDiscussionViewModelModuleResult.showIdentity,
			sizeTag = Discussion.avatarTag,
			gutterTag = Discussion.gutterTag,
			LayoutOrder = NextOrder()
		}),
		Column = ReactModule.createElement(FoundationModule.View, { tag = Discussion.columnTag, LayoutOrder = NextOrder() }, Elements)
	})
end