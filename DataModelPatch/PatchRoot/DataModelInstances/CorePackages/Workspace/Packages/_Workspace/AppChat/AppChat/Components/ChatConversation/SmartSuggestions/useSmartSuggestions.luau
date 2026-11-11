local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local SmartSuggestionActionHandlerModule = require(script.Parent.SmartSuggestionActionHandler)
local SuggestionType = SmartSuggestionActionHandlerModule.SuggestionType
local CreateSmartSuggestionActionHandlerFunction = SmartSuggestionActionHandlerModule.createSmartSuggestionActionHandler
local Suggestions = {
	{
		display_text = "Sounds good!",
		type = SuggestionType.Message,
		message = { text = "Sounds good!" }
	},
	{
		display_text = "On my way",
		type = SuggestionType.Message,
		message = { text = "On my way" }
	},
	{
		display_text = "Let's play later",
		type = SuggestionType.Message,
		message = { text = "Let's play later" }
	},
	{
		display_text = "Share a game",
		type = SuggestionType.GameCard,
		game_card = { universe_id = 1537690962 }
	}
}

return function(p1, SendMessage, SendGameLinkChatMessage)
	-- upvalues: ReactModule (copy), CreateSmartSuggestionActionHandlerFunction (copy), CryoModule (copy), Suggestions (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CreateSmartSuggestionActionHandlerFunction (upval), SendMessage (copy), SendGameLinkChatMessage (copy)
		return CreateSmartSuggestionActionHandlerFunction({
			sendMessage = SendMessage,
			sendGameLinkChatMessage = SendGameLinkChatMessage
		})
	end, { SendMessage, SendGameLinkChatMessage })
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		return {}
	end)
	
	return {
		isLoading = false,
		suggestions = Suggestions,
		hiddenSuggestions = UseStateResult,
		onActivated = ReactModule.useCallback(function(p2)
			-- upvalues: UseStateResult2 (copy), CryoModule (upval), UseMemoResult (copy), p1 (copy)
			UseStateResult2(function(p3)
				-- upvalues: CryoModule (upval), p2 (copy)
				return CryoModule.Dictionary.join(p3, { [p2] = true })
			end)
			local UseMemoResultResult = UseMemoResult(p2, p1)
			
			if typeof(UseMemoResultResult) == "table" and typeof(UseMemoResultResult.catch) == "function" then
				UseMemoResultResult:catch(function()
					-- upvalues: UseStateResult2 (upval), CryoModule (upval), p2 (copy)
					UseStateResult2(function(p3)
						-- upvalues: CryoModule (upval), p2 (upval)
						return CryoModule.Dictionary.join(p3, { [p2] = CryoModule.None })
					end)
				end)
			end
		end, { UseMemoResult, p1 })
	}
end