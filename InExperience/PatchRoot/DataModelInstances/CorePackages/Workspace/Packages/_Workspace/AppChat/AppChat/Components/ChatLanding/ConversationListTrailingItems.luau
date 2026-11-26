local Parent = script:FindFirstAncestor("AppChat").Parent
local _ = require(Parent.DataHydration.FriendsRequests)
local _ = require(Parent.React)
local ConversationListItemKindModule = require(script.Parent.ConversationListItemKind)

return table.freeze({
	sectionHeader = function(Text, Text1)
		-- upvalues: ConversationListItemKindModule (copy)
		return {
			id = "trailing:" .. Text,
			kind = ConversationListItemKindModule.SectionHeader,
			text = Text1
		}
	end,
	statusText = function(Text, Text1)
		-- upvalues: ConversationListItemKindModule (copy)
		return {
			id = "trailing:" .. Text,
			kind = ConversationListItemKindModule.StatusText,
			text = Text1
		}
	end,
	suggestedUser = function(p1)
		-- upvalues: ConversationListItemKindModule (copy)
		return {
			id = `trailing:suggestedUser:{p1.userId}`,
			kind = ConversationListItemKindModule.SuggestedUser,
			userId = p1.userId,
			source = p1.source,
			request = p1.request
		}
	end,
	suggestedUserPlaceholder = function(p1)
		-- upvalues: ConversationListItemKindModule (copy)
		return {
			id = `trailing:suggestedUserPlaceholder:{p1}`,
			kind = ConversationListItemKindModule.SuggestedUserPlaceholder
		}
	end
})