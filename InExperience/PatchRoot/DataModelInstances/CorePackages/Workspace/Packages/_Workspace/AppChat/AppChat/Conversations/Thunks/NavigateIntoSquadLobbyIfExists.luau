local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local NavigateIntoChatModule = require(AppChat.Actions.NavigateIntoChat)
local Thunks = require(Parent.NavigationRodux).Thunks
local EnumScreensModule = require(AppChat.EnumScreens)
local NetworkingSquads = require(Parent.SquadsCore.Http).NetworkingSquads
local GetDeepValue2Module = require(AppChat.Utils.getDeepValue2)
local FFlagEnableSquadDeeplinkWithChatId = require(Parent.SharedFlags).FFlagEnableSquadDeeplinkWithChatId
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local list = { { name = require(Parent.RobloxAppEnums).AppPage.Chat } }

return function(p1, p2) --[[ Line: 32 ]]
	-- upvalues: FFlagEnableSquadDeeplinkWithChatId (copy), GetDeepValue2Module (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), list (copy), Thunks (copy), NavigateIntoChatModule (copy), EnumScreensModule (copy), NetworkingSquads (copy)
	return function(p3) --[[ Line: 33 ]]
		-- upvalues: FFlagEnableSquadDeeplinkWithChatId (upval), p1 (copy), GetDeepValue2Module (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), list (upval), p2 (copy), Thunks (upval), NavigateIntoChatModule (upval), EnumScreensModule (upval), NetworkingSquads (upval)
		local SquadId = nil
		local ConversationId = if FFlagEnableSquadDeeplinkWithChatId then p1.conversationId else nil
		local PartyId = nil
		local SquadSquadCurrentSquad = GetDeepValue2Module(p3:getState(), "Squad.Squad.currentSquad")
		SquadId = SquadSquadCurrentSquad and SquadSquadCurrentSquad.squadId
		local Callback: () -> () = if FFlagEnableSquadDeeplinkWithChatId then function() --[[ Line: 42 ]]
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), list (upval), p2 (upval), p3 (copy), Thunks (upval), ConversationId (ref), PartyId (ref), NavigateIntoChatModule (upval), EnumScreensModule (upval), SquadId (ref)
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.to(NavigationCommands.fromLegacyPage(list[#list]), p2)
			else
				p3:dispatch(Thunks.NavigateToRoute(list, p2))
			end
			if ConversationId and ConversationId ~= "" then
				if PartyId and PartyId ~= "" then
					p3:dispatch(NavigateIntoChatModule({
						screen = EnumScreensModule.SquadLobby,
						params = {
							conversationId = ConversationId,
							squadId = if SquadId and SquadId ~= PartyId then PartyId else nil
						}
					}))
					
					return
				end
				p3:dispatch(NavigateIntoChatModule({
					screen = EnumScreensModule.ChatConversation,
					params = { conversationId = ConversationId }
				}))
			end
		end else nil
		
		if not FFlagEnableSquadDeeplinkWithChatId then
			p3:dispatch(NetworkingSquads.GetSquadFromSquadId.API({ squadId = p1.partyId })):andThen(function(Result) --[[ Line: 91 ]]
				-- upvalues: GetDeepValue2Module (upval), SquadId (ref), p1 (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), list (upval), p2 (upval), p3 (copy), Thunks (upval), NavigateIntoChatModule (upval), EnumScreensModule (upval)
				if GetDeepValue2Module(Result, "responseBody.groupUp.parentChannelId") then
					local Params = {
						conversationId = Result.responseBody.groupUp.parentChannelId,
						squadId = if SquadId and SquadId ~= p1.partyId then p1.partyId else nil
					}
					
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.to(NavigationCommands.fromLegacyPage(list[#list]), p2)
					else
						p3:dispatch(Thunks.NavigateToRoute(list, p2))
					end
					p3:dispatch(NavigateIntoChatModule({ screen = EnumScreensModule.SquadLobby, params = Params }))
				end
			end):catch(function(_) --[[ Line: 110 ]] end)
		elseif p1.partyId and p1.partyId ~= "" then
			p3:dispatch(NetworkingSquads.GetSquadFromSquadId.API({ squadId = p1.partyId })):andThen(function(Result) --[[ Line: 74 ]]
				-- upvalues: GetDeepValue2Module (upval), PartyId (ref), p1 (upval), ConversationId (ref), Callback (copy)
				if GetDeepValue2Module(Result, "responseBody.groupUp.parentChannelId") then
					PartyId = p1.partyId
					ConversationId = Result.responseBody.groupUp.parentChannelId
				end
				Callback()
			end):catch(function(_) --[[ Line: 82 ]]
				-- upvalues: Callback (copy)
				Callback()
			end)
		else
			Callback()
		end
	end
end