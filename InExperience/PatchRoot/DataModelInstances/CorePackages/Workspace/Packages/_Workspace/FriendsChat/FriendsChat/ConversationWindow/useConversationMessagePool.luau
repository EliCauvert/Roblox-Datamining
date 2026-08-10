local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local expChatSharedModule = require(parent.ExpChatShared)
local localizationModule = require(parent.Localization)
local localizationRoactContext = localizationModule.LocalizationRoactContext
local localizeStrings = localizationModule.localizeStrings
local getConversationMessageListStoreModule = require(parent.AppChat.GetConversationMessageListStore)
local fetchMessagePageModule = require(parent.AppChat.fetchMessagePage)
local useMessagePool = require(parent.ChatUIPrimitives).useMessagePool
local useMessageDisplayStoreModule = require(script.Parent.Parent.Message.MessageDisplayStore.useMessageDisplayStore)
local friendsChatTextMessageModule = require(script.Parent.Parent.Message.FriendsChatTextMessage)
local name = expChatSharedModule.Logger:new(script.Name)
local UIListLayout = reactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder })

return function(p0) --[[ line: 48 | named "useConversationMessagePool" ]]
	-- upvalues: reactModule (ref), getConversationMessageListStoreModule (ref), localizationRoactContext (ref), localizeStrings (ref), useMessageDisplayStoreModule (ref), friendsChatTextMessageModule (ref), useMessagePool (ref), signalsModule (ref), UIListLayout (ref), fetchMessagePageModule (ref), name (ref)
	local conversationId = p0.conversationId
	local shouldLoadMessages = p0.shouldLoadMessages
	local var10 = reactModule.useMemo(function() --[[ line: 57 ]]
		-- upvalues: shouldLoadMessages (ref), getConversationMessageListStoreModule (copy), conversationId (ref)
		return if shouldLoadMessages then function(p1) --[[ line: 63 ]]
			-- upvalues: getConversationMessageListStoreModule (copy), conversationId (copy)
			return getConversationMessageListStoreModule(p1).getOrderedIds(conversationId, p1)
		end else function() --[[ line: 59 ]]
			return {}
		end
	end, { conversationId, shouldLoadMessages })
	local var11 = reactModule.useContext(localizationRoactContext)
	local var12 = reactModule.useCallback(function(p2) --[[ line: 70 ]]
		-- upvalues: var11 (ref), localizeStrings (copy)
		if var11 == nil then
			return ""
		end
		local ok, status = pcall(function() --[[ line: 74 ]]
			-- upvalues: localizeStrings (copy), var11 (copy), p2 (ref)
			return localizeStrings(var11, { value = p2 }).value
		end)
		
		return if ok and typeof(status) == "string" then status else ""
	end, { var11 })
	local var13 = useMessageDisplayStoreModule(var10, conversationId)
	local var14 = useMessagePool({
		maxSlots = 50,
		messageIdsSignal = var13.getDisplayIds,
		createSlotElement = reactModule.useCallback(function(p3) --[[ line: 89 ]]
			-- upvalues: reactModule (copy), friendsChatTextMessageModule (copy), var13 (ref), p0 (ref), var12 (ref)
			return reactModule.createElement(friendsChatTextMessageModule, {
				getDisplayId = p3.getMessageId,
				getDisplayFromId = var13.getDisplayFromId,
				getLayoutOrder = p3.getLayoutOrder,
				chatWindowSettings = p0.chatWindowSettings,
				textTransparency = p0.textTransparency,
				isSpatialUIEnabled = p0.isSpatialUIEnabled,
				localize = var12
			})
		end, {
			var13,
			p0.chatWindowSettings,
			p0.textTransparency,
			p0.isSpatialUIEnabled,
			var12
		})
	})
	local var15 = reactModule.useMemo(function() --[[ line: 112 ]]
		-- upvalues: signalsModule (copy), var14 (ref), UIListLayout (copy)
		return signalsModule.createComputed(function(p4) --[[ line: 113 ]]
			-- upvalues: var14 (copy), UIListLayout (copy)
			local cloned = table.clone(var14(p4))
			cloned["$layout"] = UIListLayout
			
			return cloned
		end)
	end, { var14 })
	reactModule.useEffect(function() --[[ line: 121 ]]
		-- upvalues: shouldLoadMessages (ref), fetchMessagePageModule (copy), conversationId (ref), name (copy)
		if shouldLoadMessages then
			local var17 = false
			fetchMessagePageModule(conversationId, nil):catch(function(p5) --[[ line: 136 ]]
				-- upvalues: var17 (write), name (copy), conversationId (copy)
				if var17 then
					return
				end
				name:warning(`Failed to fetch conversation messages for {conversationId}: {tostring(p5)}`)
			end)
			
			return function() --[[ line: 143 ]]
				-- upvalues: var17 (write)
				var17 = true
			end
		end
	end, { conversationId, shouldLoadMessages })
	
	return var15
end