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
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local list = { { name = appPage.Chat } }

return function(p1, p2)
	-- upvalues: fFlagEnableSquadDeeplinkWithChatId (ref), getDeepValue2Module (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), list (ref), thunks (ref), navigateIntoChatModule (ref), enumScreensModule (ref), networkingSquads (ref)
	return function(p3)
		-- upvalues: fFlagEnableSquadDeeplinkWithChatId (copy), p1 (ref), getDeepValue2Module (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), list (copy), p2 (ref), thunks (copy), navigateIntoChatModule (copy), enumScreensModule (copy), networkingSquads (copy)
		local _ = nil
		local _ = nil
		local _ = nil
		local var2 = if fFlagEnableSquadDeeplinkWithChatId then p1.conversationId else nil
		local var3 = nil
		local var4 = getDeepValue2Module(p3:getState(), "Squad.Squad.currentSquad")
		local squadId = var4 and var4.squadId
		local var5 = if fFlagEnableSquadDeeplinkWithChatId then function()
			-- upvalues: fFlagSignalsNavP3Dispatch (copy), var1 (copy), list (copy), p2 (copy), p3 (ref), thunks (copy), var2 (write), var3 (write), navigateIntoChatModule (copy), enumScreensModule (copy), squadId (write)
			if fFlagSignalsNavP3Dispatch then
				var1.to(var1.fromLegacyPage(list[#list]), p2)
			else
				p3:dispatch(thunks.NavigateToRoute(list, p2))
			end
			if var2 and var2 ~= "" then
				if var3 and var3 ~= "" then
					p3:dispatch(navigateIntoChatModule({
						screen = enumScreensModule.SquadLobby,
						params = {
							conversationId = var2,
							squadId = if squadId and squadId ~= var3 then var3 else nil
						}
					}))
					
					return
				end
				p3:dispatch(navigateIntoChatModule({
					screen = enumScreensModule.ChatConversation,
					params = { conversationId = var2 }
				}))
			end
		end else nil
		
		if not fFlagEnableSquadDeeplinkWithChatId then
			p3:dispatch(networkingSquads.GetSquadFromSquadId.API({ squadId = p1.partyId })):andThen(function(p4)
				-- upvalues: getDeepValue2Module (copy), squadId (write), p1 (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), list (copy), p2 (copy), p3 (ref), thunks (copy), navigateIntoChatModule (copy), enumScreensModule (copy)
				if getDeepValue2Module(p4, "responseBody.groupUp.parentChannelId") then
					local t = {
						conversationId = p4.responseBody.groupUp.parentChannelId,
						squadId = if squadId and squadId ~= p1.partyId then p1.partyId else nil
					}
					
					if fFlagSignalsNavP3Dispatch then
						var1.to(var1.fromLegacyPage(list[#list]), p2)
					else
						p3:dispatch(thunks.NavigateToRoute(list, p2))
					end
					p3:dispatch(navigateIntoChatModule({ screen = enumScreensModule.SquadLobby, params = t }))
				end
			end):catch(function(_) end)
		elseif p1.partyId and p1.partyId ~= "" then
			p3:dispatch(networkingSquads.GetSquadFromSquadId.API({ squadId = p1.partyId })):andThen(function(p4)
				-- upvalues: getDeepValue2Module (copy), var3 (write), p1 (copy), var2 (write), var5 (ref)
				if getDeepValue2Module(p4, "responseBody.groupUp.parentChannelId") then
					var3 = p1.partyId
					var2 = p4.responseBody.groupUp.parentChannelId
				end
				var5()
			end):catch(function(_)
				-- upvalues: var5 (ref)
				var5()
			end)
		else
			var5()
		end
	end
end