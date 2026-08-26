local suggestionType = require(script.Parent.Types).SuggestionType

return {
	createSmartSuggestionActionHandler = function(p1)
		-- upvalues: suggestionType (ref)
		local t = {
			[suggestionType.Message] = function(p2, p3)
				-- upvalues: p1 (ref)
				return p1.sendMessage(p3, p2.message.text)
			end,
			[suggestionType.GameCard] = function(p2, p3)
				-- upvalues: p1 (ref)
				return p1.sendGameLinkChatMessage(p3, p2.game_card.universe_id)
			end,
			[suggestionType.StartParty] = function(_, p2)
				-- upvalues: p1 (ref)
				return p1.startParty(p2)
			end
		}
		
		return function(p2, p3)
			-- upvalues: t (ref)
			local type = t[p2.type]
			
			if not type then
				error(`SmartSuggestionActionHandler: unknown suggestion type "{tostring(p6.type)}"`)
			end
			return type(p2, p3)
		end
	end
}