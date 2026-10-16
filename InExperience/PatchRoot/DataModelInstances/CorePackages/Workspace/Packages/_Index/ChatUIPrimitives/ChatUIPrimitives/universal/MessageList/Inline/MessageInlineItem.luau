local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Signals)
local CreateNextOrderFunction = require(Parent.ReactUtils).createNextOrder
local _ = require(script.Parent.Parent.groupMessages)
local IdentityInlineModule = require(script.Parent.Parent.Parent.Identity.IdentityInline)
local UseMessageInlineViewModelModule = require(script.Parent.useMessageInlineViewModel)
local WithMessageContentModule = require(script.Parent.Parent.Parent.ContentKinds.withMessageContent)
local config = {
	plainText = WithMessageContentModule(require(script.Parent.Parent.Parent.ContentKinds.PlainText.PlainTextInline), require(script.Parent.Parent.Parent.ContentKinds.PlainText.PlainTextContentModel).getDetail),
	preset = WithMessageContentModule(require(script.Parent.Parent.Parent.ContentKinds.Preset.PresetInline), require(script.Parent.Parent.Parent.ContentKinds.Preset.PresetContentModel).getDetail)
}

return function(p1) --[[ Line: 30 | Named "MessageInlineItem" ]]
	-- upvalues: UseMessageInlineViewModelModule (copy), CreateNextOrderFunction (copy), config (copy), ReactModule (copy), IdentityInlineModule (copy), FoundationModule (copy)
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
	
	return ReactModule.createElement(FoundationModule.View, { tag = "row align-x-left gap-xsmall size-full-0 auto-y" }, t)
end