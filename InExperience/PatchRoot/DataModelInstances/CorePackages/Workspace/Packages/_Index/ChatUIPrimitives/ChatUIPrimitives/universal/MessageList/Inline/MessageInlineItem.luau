local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Signals)
local CreateNextOrderFunction = require(Parent.ReactUtils).createNextOrder
local _ = require(script.Parent.Parent.groupMessages)
local IdentityInlineModule = require(script.Parent.Parent.Parent.Identity.IdentityInline)
local ReplyQuoteModule = require(script.Parent.Parent.Reply.ReplyQuote)
local UseMessageInlineViewModelModule = require(script.Parent.useMessageInlineViewModel)
local WithMessageContentModule = require(script.Parent.Parent.Parent.ContentKinds.withMessageContent)
local config = {
	plainText = WithMessageContentModule(require(script.Parent.Parent.Parent.ContentKinds.PlainText.PlainTextInline), require(script.Parent.Parent.Parent.ContentKinds.PlainText.PlainTextContentModel).getDetail),
	preset = WithMessageContentModule(require(script.Parent.Parent.Parent.ContentKinds.Preset.PresetInline), require(script.Parent.Parent.Parent.ContentKinds.Preset.PresetContentModel).getDetail),
	emoji = WithMessageContentModule(require(script.Parent.Parent.Parent.ContentKinds.Emoji.EmojiInline), require(script.Parent.Parent.Parent.ContentKinds.Emoji.EmojiContentModel).getDetail)
}

return function(p1)
	-- upvalues: UseMessageInlineViewModelModule (copy), CreateNextOrderFunction (copy), config (copy), ReactModule (copy), IdentityInlineModule (copy), FoundationModule (copy), ReplyQuoteModule (copy)
	local UseMessageInlineViewModelModuleResult = UseMessageInlineViewModelModule(p1.itemSignal)
	local NextOrder = CreateNextOrderFunction()
	local Elements = {}
	
	for LayoutOrder, content in UseMessageInlineViewModelModuleResult.contents do
		local Entry = config[content.kind]
		
		if Entry then
			Elements["content" .. LayoutOrder] = ReactModule.createElement(Entry, {
				getContent = content.getContent,
				LayoutOrder = LayoutOrder
			})
		end
	end
	local t = {}
	
	if UseMessageInlineViewModelModuleResult.hasIdentity then
		t.Identity = ReactModule.createElement(IdentityInlineModule, {
			getIdentity = UseMessageInlineViewModelModuleResult.getIdentity,
			LayoutOrder = NextOrder()
		})
	end
	t.Message = ReactModule.createElement(FoundationModule.View, {
		tag = "col grow size-0 auto-y",
		LayoutOrder = NextOrder()
	}, Elements)
	
	return ReactModule.createElement(FoundationModule.View, { tag = "col size-full-0 auto-y" }, {
		Reply = if UseMessageInlineViewModelModuleResult.replyText == nil then nil else ReactModule.createElement(ReplyQuoteModule.Inline, {
			LayoutOrder = 1,
			text = UseMessageInlineViewModelModuleResult.replyText
		}),
		Row = ReactModule.createElement(FoundationModule.View, {
			tag = "row align-x-left gap-xsmall size-full-0 auto-y",
			LayoutOrder = 2
		}, t)
	})
end