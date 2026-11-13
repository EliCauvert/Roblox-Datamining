local Parent = script:FindFirstAncestor("AppChat").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactionsModule = require(Parent.Reactions)
local UseMessageReactionCountsModule = require(script.Parent.useMessageReactionCounts)

return ReactModule.memo(function(p1)
	-- upvalues: UseMessageReactionCountsModule (copy), ReactModule (copy), FoundationModule (copy), ReactionsModule (copy)
	local UseMessageReactionCountsModuleResult = UseMessageReactionCountsModule(p1.messageId)
	
	return if UseMessageReactionCountsModuleResult == nil then nil else ReactModule.createElement(FoundationModule.View, {
		ZIndex = 2,
		testId = "MessageReactionChip",
		tag = {
			["col align-y-bottom size-full-600"] = true,
			["align-x-left"] = p1.isIncoming,
			["align-x-right"] = not p1.isIncoming
		},
		LayoutOrder = p1.layoutOrder
	}, {
		ReactionChip = ReactModule.createElement(ReactionsModule.ReactionChip, { reactionCounts = UseMessageReactionCountsModuleResult })
	})
end)