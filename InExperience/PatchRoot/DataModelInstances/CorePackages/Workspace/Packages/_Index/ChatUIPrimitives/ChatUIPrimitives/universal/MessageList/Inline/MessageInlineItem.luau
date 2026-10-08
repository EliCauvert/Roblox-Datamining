local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(parent.Signals)
local createNextOrder = require(parent.ReactUtils).createNextOrder
local _ = require(script.Parent.Parent.Parent.Types)
local _ = require(script.Parent.Parent.groupMessages)
local identityInlineModule = require(script.Parent.Parent.Parent.Identity.IdentityInline)
local useMessageInlineViewModelModule = require(script.Parent.useMessageInlineViewModel)
local t = {
	plainText = require(script.Parent.Parent.Parent.ContentKinds.PlainText.PlainTextInline)
}

return function(p1)
	-- upvalues: useMessageInlineViewModelModule (ref), createNextOrder (ref), t (ref), reactModule (ref), identityInlineModule (ref), foundationModule (ref)
	local var1 = useMessageInlineViewModelModule(p1.itemSignal)
	local var2 = createNextOrder()
	local t_1 = {}
	
	for i, v in var1.contents do
		local kind = t[v.kind]
		
		if kind then
			t_1["content" .. i] = reactModule.createElement(kind, { getContent = v.getContent, LayoutOrder = i })
		end
	end
	local t_2 = {}
	
	if var1.hasIdentity then
		t_2.Identity = reactModule.createElement(identityInlineModule, { getIdentity = var1.getIdentity, LayoutOrder = var2() })
	end
	t_2.Message = reactModule.createElement(foundationModule.View, { tag = "col grow size-0 auto-y", LayoutOrder = var2() }, t_1)
	
	return reactModule.createElement(foundationModule.View, { tag = "row align-x-left gap-xsmall size-full-0 auto-y" }, t_2)
end