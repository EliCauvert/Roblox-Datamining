local suggestionType = require(script.Parent.Types).SuggestionType

return {
	createSmartSuggestionActionHandler = function(p0) --[[ line: 21 ]]
		-- upvalues: suggestionType (ref)
		local t = {
			[suggestionType.Message] = function(p1, p2) --[[ line: 25 ]]
				-- upvalues: p0 (ref)
				return p0.sendMessage(p2, p1.message.text)
			end,
			[suggestionType.GameCard] = function(p3, p4) --[[ line: 28 ]]
				-- upvalues: p0 (ref)
				return p0.sendGameLinkChatMessage(p4, p3.game_card.universe_id)
			end,
			[suggestionType.StartParty] = function(_, p5) --[[ line: 31 ]]
				-- upvalues: p0 (ref)
				return p0.startParty(p5)
			end
		}
		
		return function(p6, p7) --[[ line: 36 ]]
			-- upvalues: t (ref)
			local type = t[p6.type]
			
			if not type then
				error(`SmartSuggestionActionHandler: unknown suggestion type "{tostring(p6.type)}"`)
			end
			return type(p6, p7)
		end
	end
}