local Parent = script:FindFirstAncestor("FriendsChat").Parent
local SignalsModule = require(Parent.Signals)
local _ = require(Parent.ChatUIPrimitives.MessageEnvelopeModel)
local GetConversationMessageStoreModule = require(Parent.AppChat.GetConversationMessageStore)
local _ = require(script.Parent.Parent.MessageDisplayStore.NameInfo)
local CreateFrozenSortTimesModule = require(script.Parent.Parent.MessageDisplayStore.createFrozenSortTimes)
local ResolveNameInfosModule = require(script.Parent.Parent.MessageDisplayStore.resolveNameInfos)
local GetLocalUserIdModule = require(script.Parent.Parent.Parent.Utils.getLocalUserId)
local _ = require(script.Parent.Parent.Parent.Utils.useLocalize)
local BuildMessageEnvelopesModule = require(script.Parent.buildMessageEnvelopes)
local GetReplyQuoteModule = require(script.Parent.getReplyQuote)
local Frozen = table.freeze({})

local function currentUnixMilliseconds()
	return DateTime.now().UnixTimestampMillis
end

local function isSameNameInfo(p1, p2): boolean
	return p1.name == p2.name and p1.username == p2.username
end

return {
	create = function(Callback, p1)
		-- upvalues: CreateFrozenSortTimesModule (copy), currentUnixMilliseconds (copy), SignalsModule (copy), ResolveNameInfosModule (copy), isSameNameInfo (copy), GetConversationMessageStoreModule (copy), Frozen (copy), GetReplyQuoteModule (copy), BuildMessageEnvelopesModule (copy), GetLocalUserIdModule (copy)
		local t = {}
		local FrozenSortTimesModule = CreateFrozenSortTimesModule({ now = p1.now or currentUnixMilliseconds })
		local t1 = {}
		
		local function _(Key)
			-- upvalues: t1 (copy), SignalsModule (upval), ResolveNameInfosModule (upval), isSameNameInfo (upval)
			local Entry = t1[Key]
			
			if Entry == nil then
				local Computed = SignalsModule.createComputed(function(p2)
					-- upvalues: ResolveNameInfosModule (upval), Key (copy)
					return ResolveNameInfosModule({ Key }, p2)[Key] or { name = nil, username = nil }
				end, isSameNameInfo)
				t1[Key] = Computed
				
				return Computed
			else
				return Entry
			end
		end
		
		local _ = function(Key)
			-- upvalues: t (copy), SignalsModule (upval), GetConversationMessageStoreModule (upval), Frozen (upval), GetReplyQuoteModule (upval), t1 (copy), ResolveNameInfosModule (upval), isSameNameInfo (upval), BuildMessageEnvelopesModule (upval), GetLocalUserIdModule (upval), FrozenSortTimesModule (copy), p1 (copy)
			local Entry = t[Key]
			
			if Entry == nil then
				local Computed = SignalsModule.createComputed(function(p2)
					-- upvalues: GetConversationMessageStoreModule (upval), Key (copy), Frozen (upval), GetReplyQuoteModule (upval), t1 (upval), SignalsModule (upval), ResolveNameInfosModule (upval), isSameNameInfo (upval), BuildMessageEnvelopesModule (upval), GetLocalUserIdModule (upval), FrozenSortTimesModule (upval), p1 (upval)
					local v1 = GetConversationMessageStoreModule(p2)
					local Message = v1.getMessage(Key, p2)
					
					if Message == nil then
						return Frozen
					end
					local List = {}
					
					if Message.sender_user_id ~= nil then
						table.insert(List, Message.sender_user_id)
					end
					local RepliesTo = Message.replies_to
					local ReplyQuote = nil
					
					if RepliesTo ~= nil then
						if RepliesTo.sender_user_id ~= nil then
							table.insert(List, RepliesTo.sender_user_id)
						end
						ReplyQuote = GetReplyQuoteModule(RepliesTo, if RepliesTo.id then v1.getMessage(RepliesTo.id, p2) else nil)
					end
					local NamesByUserId = {}
					
					for _, value in List do
						local v2 = t1[value]
						local Callback = nil
						
						if v2 == nil then
							local Computed = SignalsModule.createComputed(function(p3)
								-- upvalues: ResolveNameInfosModule (upval), value (copy)
								return ResolveNameInfosModule({ value }, p3)[value] or { name = nil, username = nil }
							end, isSameNameInfo)
							t1[value] = Computed
							Callback = Computed
						else
							Callback = v2
						end
						NamesByUserId[value] = Callback(p2)
					end
					return BuildMessageEnvelopesModule(Message, {
						localUserId = GetLocalUserIdModule(),
						namesByUserId = NamesByUserId,
						sentAtUnixMilliseconds = FrozenSortTimesModule(Key, p2),
						replyQuote = ReplyQuote,
						isGroup = p1.getIsGroup(p2),
						localize = p1.localize
					})
				end)
				t[Key] = Computed
				
				return Computed
			else
				return Entry
			end
		end
		
		return {
			getEnvelopes = SignalsModule.createComputed(function(p2)
				-- upvalues: Callback (copy), p1 (copy), t (copy), SignalsModule (upval), GetConversationMessageStoreModule (upval), Frozen (upval), GetReplyQuoteModule (upval), t1 (copy), ResolveNameInfosModule (upval), isSameNameInfo (upval), BuildMessageEnvelopesModule (upval), GetLocalUserIdModule (upval), FrozenSortTimesModule (copy)
				local List = {}
				local Count = 0
				
				for _, value in Callback(p2) do
					if p1.maxMessages > 0 and p1.maxMessages <= Count then break end
					local Entry = t[value]
					local Callback1 = nil
					
					if Entry == nil then
						local Computed = SignalsModule.createComputed(function(p3)
							-- upvalues: GetConversationMessageStoreModule (upval), value (copy), Frozen (upval), GetReplyQuoteModule (upval), t1 (upval), SignalsModule (upval), ResolveNameInfosModule (upval), isSameNameInfo (upval), BuildMessageEnvelopesModule (upval), GetLocalUserIdModule (upval), FrozenSortTimesModule (upval), p1 (upval)
							local v1 = GetConversationMessageStoreModule(p3)
							local Message = v1.getMessage(value, p3)
							
							if Message == nil then
								return Frozen
							end
							local List = {}
							
							if Message.sender_user_id ~= nil then
								table.insert(List, Message.sender_user_id)
							end
							local RepliesTo = Message.replies_to
							local ReplyQuote = nil
							
							if RepliesTo ~= nil then
								if RepliesTo.sender_user_id ~= nil then
									table.insert(List, RepliesTo.sender_user_id)
								end
								ReplyQuote = GetReplyQuoteModule(RepliesTo, if RepliesTo.id then v1.getMessage(RepliesTo.id, p3) else nil)
							end
							local NamesByUserId = {}
							
							for _, value in List do
								local v2 = t1[value]
								local Callback = nil
								
								if v2 == nil then
									local Computed = SignalsModule.createComputed(function(p4)
										-- upvalues: ResolveNameInfosModule (upval), value (copy)
										return ResolveNameInfosModule({ value }, p4)[value] or { name = nil, username = nil }
									end, isSameNameInfo)
									t1[value] = Computed
									Callback = Computed
								else
									Callback = v2
								end
								NamesByUserId[value] = Callback(p3)
							end
							return BuildMessageEnvelopesModule(Message, {
								localUserId = GetLocalUserIdModule(),
								namesByUserId = NamesByUserId,
								sentAtUnixMilliseconds = FrozenSortTimesModule(value, p3),
								replyQuote = ReplyQuote,
								isGroup = p1.getIsGroup(p3),
								localize = p1.localize
							})
						end)
						t[value] = Computed
						Callback1 = Computed
					else
						Callback1 = Entry
					end
					local CallbackResult = Callback1(p2)
					
					if #CallbackResult > 0 then
						Count += 1
						
						for _, value1 in CallbackResult do
							table.insert(List, value1)
						end
					end
				end
				return List
			end)
		}
	end
}