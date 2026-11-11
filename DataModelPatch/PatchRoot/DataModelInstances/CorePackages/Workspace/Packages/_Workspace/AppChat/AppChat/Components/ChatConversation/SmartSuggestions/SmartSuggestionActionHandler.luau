local SuggestionType = { Message = "message", GameCard = "game_card" }

return {
	SuggestionType = SuggestionType,
	createSmartSuggestionActionHandler = function(p1)
		-- upvalues: SuggestionType (copy)
		local config = {
			[SuggestionType.Message] = function(p2, p3)
				-- upvalues: p1 (copy)
				return p1.sendMessage(p3, p2.message.text)
			end,
			[SuggestionType.GameCard] = function(p2, p3)
				-- upvalues: p1 (copy)
				return p1.sendGameLinkChatMessage(p3, p2.game_card.universe_id)
			end
		}
		
		return function(p2, p3)
			-- upvalues: config (copy)
			local Entry = config[p2.type]
			
			if not Entry then
				error(`SmartSuggestionActionHandler: unknown suggestion type "{tostring(p5.type)}"`)
			end
			return Entry(p2, p3)
		end
	end
}