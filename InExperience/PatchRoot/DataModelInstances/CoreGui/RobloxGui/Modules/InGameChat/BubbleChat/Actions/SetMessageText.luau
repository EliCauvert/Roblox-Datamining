local CorePackages = game:GetService("CorePackages")
local ExpChatModule = require(CorePackages.Workspace.Packages.ExpChat)
local TModule = require(CorePackages.Packages.t)
local MaybeAssertModule = require(script.Parent.Parent.Helpers.maybeAssert)
local TupleResult = TModule.tuple(TModule.string, TModule.string)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(MessageId, NewText) --[[ Line: 10 ]]
	-- upvalues: MaybeAssertModule (copy), TupleResult (copy), ExpChatModule (copy)
	MaybeAssertModule(TupleResult(MessageId, NewText))
	ExpChatModule.Events.LegacyBubbleTextUpdated(MessageId, NewText)
	
	return { messageId = MessageId, newText = NewText }
end)