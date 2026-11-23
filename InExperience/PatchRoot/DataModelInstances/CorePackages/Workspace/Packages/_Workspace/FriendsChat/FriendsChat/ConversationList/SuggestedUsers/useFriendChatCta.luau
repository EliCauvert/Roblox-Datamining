local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local UserListModule = require(Parent.UserList)
local ConversationChannelsModule = require(Parent.AppChat.ConversationChannels)
local GetConversationStoreModule = require(Parent.AppChat.GetConversationStore)
local ButtonVariant = require(Parent.Foundation).Enums.ButtonVariant
local ButtonTypes = UserListModule.Enums.ButtonTypes
local Computed = SignalsModule.createComputed(function()
	return nil
end)

local function NOOP() end

local function findOneToOneConversationId(Conversations, Value)
	-- upvalues: ConversationChannelsModule (copy)
	for _, conversation in Conversations do
		if (conversation.type == ConversationChannelsModule.Type.OneToOne or conversation.source == ConversationChannelsModule.Source.Friends) and conversation.participants and table.find(conversation.participants, Value) then
			return conversation.id
		end
	end
	return nil
end

local function useOneToOneConversationId(p1, p2)
	-- upvalues: ReactModule (copy), Computed (copy), GetConversationStoreModule (copy), SignalsModule (copy), findOneToOneConversationId (copy), SignalsReactModule (copy)
	return SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: p2 (copy), Computed (upval), GetConversationStoreModule (upval), SignalsModule (upval), findOneToOneConversationId (upval), p1 (copy)
		if p2 then
			local ConversationStoreModule = GetConversationStoreModule(false)
			
			return SignalsModule.createComputed(function(p3)
				-- upvalues: findOneToOneConversationId (upval), ConversationStoreModule (copy), p1 (upval)
				return (findOneToOneConversationId(ConversationStoreModule.getConversations(p3), p1))
			end)
		else
			return Computed
		end
	end, { p1, p2 })))
end

return function(p1, p2, Callback)
	-- upvalues: useOneToOneConversationId (copy), ReactModule (copy), ButtonTypes (copy), ButtonVariant (copy), NOOP (copy), UserListModule (copy)
	local UseOneToOneConversationIdResult = useOneToOneConversationId(p1, p2)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseOneToOneConversationIdResult (copy), Callback (copy)
		return if UseOneToOneConversationIdResult == nil or Callback == nil then nil else function()
			-- upvalues: Callback (upval), UseOneToOneConversationIdResult (upval)
			Callback(UseOneToOneConversationIdResult)
		end
	end, { UseOneToOneConversationIdResult, Callback })
	
	return ReactModule.useMemo(function()
		-- upvalues: ButtonTypes (upval), ButtonVariant (upval), UseMemoResult (copy), NOOP (upval), UserListModule (upval)
		return {
			type = ButtonTypes.Chat,
			variant = ButtonVariant.Standard,
			onActivated = UseMemoResult or NOOP,
			isDisabled = UseMemoResult == nil or nil,
			minWidth = UserListModule.DefaultPrimaryCtaMinWidth,
			maxWidth = UserListModule.DefaultPrimaryCtaMaxWidth
		}
	end, { UseMemoResult }), UseMemoResult
end