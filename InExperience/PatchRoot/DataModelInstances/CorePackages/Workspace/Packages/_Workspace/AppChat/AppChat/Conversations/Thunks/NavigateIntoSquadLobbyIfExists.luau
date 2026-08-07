local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local navigateIntoChatModule = require(appChat.Actions.NavigateIntoChat)
local thunks = require(parent.NavigationRodux).Thunks
local appPage = require(parent.RobloxAppEnums).AppPage
local enumScreensModule = require(appChat.EnumScreens)
local networkingSquads = require(parent.SquadsCore.Http).NetworkingSquads
local getDeepValue2Module = require(appChat.Utils.getDeepValue2)
local fFlagEnableSquadDeeplinkWithChatId = require(parent.SharedFlags).FFlagEnableSquadDeeplinkWithChatId
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var4 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local list = { { name = appPage.Chat } }

return function(p0, p1) --[[ line: 27 ]]
	-- upvalues: fFlagEnableSquadDeeplinkWithChatId (ref), getDeepValue2Module (ref), fFlagSignalsNavP3Dispatch (ref), var4 (ref), list (ref), thunks (ref), navigateIntoChatModule (ref), enumScreensModule (ref), networkingSquads (ref)
	return function(p2) --[[ line: 28 ]]
		-- upvalues: fFlagEnableSquadDeeplinkWithChatId (copy), p0 (ref), getDeepValue2Module (copy), fFlagSignalsNavP3Dispatch (copy), var4 (copy), list (copy), p1 (ref), thunks (copy), navigateIntoChatModule (copy), enumScreensModule (copy), networkingSquads (copy)
		local _ = nil
		local _ = nil
		local _ = nil
		local var6 = if fFlagEnableSquadDeeplinkWithChatId then p0.conversationId else nil
		local var7 = nil
		local var8 = getDeepValue2Module(p2:getState(), "Squad.Squad.currentSquad")
		local squadId = var8 and var8.squadId
		local var10 = if fFlagEnableSquadDeeplinkWithChatId then function() --[[ line: 37 ]]
			-- upvalues: fFlagSignalsNavP3Dispatch (copy), var4 (copy), list (copy), p1 (copy), p2 (ref), thunks (copy), var6 (write), var7 (write), navigateIntoChatModule (copy), enumScreensModule (copy), squadId (write)
			if fFlagSignalsNavP3Dispatch then
				var4.to(var4.fromLegacyPage(list[#list]), p1)
			else
				p2:dispatch(thunks.NavigateToRoute(list, p1))
			end
			if var6 and var6 ~= "" then
				if var7 and var7 ~= "" then
					p2:dispatch(navigateIntoChatModule({
						screen = enumScreensModule.SquadLobby,
						params = {
							conversationId = var6,
							squadId = if squadId and squadId ~= var7 then var7 else nil
						}
					}))
					
					return
				end
				p2:dispatch(navigateIntoChatModule({
					screen = enumScreensModule.ChatConversation,
					params = { conversationId = var6 }
				}))
			end
		end else nil
		
		if not fFlagEnableSquadDeeplinkWithChatId then
			p2:dispatch(networkingSquads.GetSquadFromSquadId.API({ squadId = p0.partyId })):andThen(function(p3) --[[ line: 86 ]]
				-- upvalues: getDeepValue2Module (copy), squadId (write), p0 (copy), fFlagSignalsNavP3Dispatch (copy), var4 (copy), list (copy), p1 (copy), p2 (ref), thunks (copy), navigateIntoChatModule (copy), enumScreensModule (copy)
				if getDeepValue2Module(p3, "responseBody.groupUp.parentChannelId") then
					local t = {
						conversationId = p3.responseBody.groupUp.parentChannelId,
						squadId = if squadId and squadId ~= p0.partyId then p0.partyId else nil
					}
					
					if fFlagSignalsNavP3Dispatch then
						var4.to(var4.fromLegacyPage(list[#list]), p1)
					else
						p2:dispatch(thunks.NavigateToRoute(list, p1))
					end
					p2:dispatch(navigateIntoChatModule({ screen = enumScreensModule.SquadLobby, params = t }))
				end
			end):catch(function(_) --[[ line: 105 ]] end)
		elseif p0.partyId and p0.partyId ~= "" then
			p2:dispatch(networkingSquads.GetSquadFromSquadId.API({ squadId = p0.partyId })):andThen(function(p4) --[[ line: 69 ]]
				-- upvalues: getDeepValue2Module (copy), var7 (write), p0 (copy), var6 (write), var10 (ref)
				if getDeepValue2Module(p4, "responseBody.groupUp.parentChannelId") then
					var7 = p0.partyId
					var6 = p4.responseBody.groupUp.parentChannelId
				end
				var10()
			end):catch(function(_) --[[ line: 77 ]]
				-- upvalues: var10 (ref)
				var10()
			end)
		else
			var10()
		end
	end
end