local appChat = script:FindFirstAncestor("AppChat")
local signalsModule = require(appChat.Parent.Signals)
local _ = require(appChat.MessageData.Types)
local enumsModule = require(appChat.MessageData.Enums)
local _ = require(script.Parent.Parent.GetConversationMessageStore.createConversationMessageStore)
local _ = require(script.Parent.Parent.GetConversationMessageListStore.createConversationMessageListStore)
local groupedMessageVariant = enumsModule.GroupedMessageVariant
local messageStatus = enumsModule.MessageStatus
local messageType = enumsModule.MessageType
local messageVisibility = enumsModule.MessageVisibility

local function _(p1)
	-- upvalues: messageType (ref)
	return if p1 == nil then false else p1.type == messageType.User
end

local _ = function(value)
	if value == nil then
		return nil
	end
	local dateTime = DateTime.fromIsoDate(value)
	
	return if dateTime then dateTime.UnixTimestamp else nil
end

local _ = function(p1, p2)
	if p1 == nil or p2 == nil then
		return false
	end
	local var1
	local createdAt = p1.created_at
	
	if createdAt == nil then
		var1 = nil
	else
		local dateTime = DateTime.fromIsoDate(createdAt)
		var1 = if dateTime then dateTime.UnixTimestamp else nil
	end
	local var2
	local createdAt_1 = p2.created_at
	
	if createdAt_1 == nil then
		var2 = nil
	else
		local dateTime = DateTime.fromIsoDate(createdAt_1)
		var2 = if dateTime then dateTime.UnixTimestamp else nil
	end
	return if var1 == nil or var2 == nil then false else math.abs(var1 - var2) > 300
end

local _ = function(p1)
	-- upvalues: messageStatus (ref)
	return p1 ~= nil and p1.status == messageStatus.Moderated
end

local _ = function(p1)
	-- upvalues: messageVisibility (ref)
	return p1 ~= nil and p1.visibility == messageVisibility.Hidden
end

local _ = function(p1)
	return p1 ~= nil and p1.replies_to ~= nil
end

local function canGroupWithAdjacent(p1, p2)
	-- upvalues: messageType (ref), messageVisibility (ref), messageStatus (ref)
	local var1 = false
	
	if p2 ~= nil then
		var1 = if p2 == nil then false else p2.type == messageType.User
		
		if var1 then
			var1 = false
			
			if p2.sender_user_id == p1.sender_user_id then
				var1 = not (p1 ~= nil and p1.visibility == messageVisibility.Hidden)
				
				if var1 then
					var1 = not (p2 ~= nil and p2.visibility == messageVisibility.Hidden)
					
					if var1 then
						var1 = not (p1 ~= nil and p1.status == messageStatus.Moderated)
						
						if var1 then
							var1 = not (p2 ~= nil and p2.status == messageStatus.Moderated)
							
							if var1 then
								local var2
								if p2 == nil or p1 == nil then
									var2 = false
								else
									local var3
									local createdAt = p2.created_at
									
									if createdAt == nil then
										var3 = nil
									else
										local dateTime = DateTime.fromIsoDate(createdAt)
										var3 = if dateTime then dateTime.UnixTimestamp else nil
									end
									local var4
									local createdAt_1 = p1.created_at
									
									if createdAt_1 == nil then
										var4 = nil
									else
										local dateTime = DateTime.fromIsoDate(createdAt_1)
										var4 = if dateTime then dateTime.UnixTimestamp else nil
									end
									var2 = if var3 == nil or var4 == nil then false else math.abs(var3 - var4) > 300
								end
								var1 = not var2
							end
						end
					end
				end
			end
		end
	end
	return var1
end

local function computeGroupedVariant(p1, p2, p3)
	-- upvalues: messageType (ref), canGroupWithAdjacent (ref), groupedMessageVariant (ref)
	if not (if p1 == nil then false else p1.type == messageType.User) then
		return nil
	end
	local var1 = canGroupWithAdjacent(p1, p2)
	
	if var1 then
		var1 = not (p2 ~= nil and p2.replies_to ~= nil)
	end
	local var2 = canGroupWithAdjacent(p1, p3)
	
	if var2 then
		var2 = not (p1 ~= nil and p1.replies_to ~= nil)
	end
	return if not (not var1 and not var2) then if not (not var1 and var2) then if var1 and not var2 then groupedMessageVariant.First else groupedMessageVariant.Middle else groupedMessageVariant.Last else groupedMessageVariant.Single
end

return function(p1, p2)
	-- upvalues: signalsModule (ref), messageType (ref), groupedMessageVariant (ref), computeGroupedVariant (ref)
	local t = {}
	
	return {
		conversationMessageStore = p1,
		conversationMessageListStore = p2,
		getGroupedVariant = function(p3, p4)
			-- upvalues: t (ref), signalsModule (copy), p1 (ref), messageType (copy), p2 (ref), groupedMessageVariant (copy), computeGroupedVariant (copy)
			local var1 = t[p4]
			
			if var1 then
				local var2 = var1[p3]
				
				if var2 == nil then
					local var3 = signalsModule.createComputed(function(p5)
						-- upvalues: p1 (copy), p3 (ref), messageType (copy), p2 (copy), p4 (ref), groupedMessageVariant (copy), computeGroupedVariant (copy)
						local var4 = p1.messages(p5)
						local var5 = var4[p3]
						
						if var5 == nil then
							return nil
						elseif not (if var5 == nil then false else var5.type == messageType.User) then
							return nil
						elseif p2.getIndex(p4, p3, p5) == nil then
							return groupedMessageVariant.Single
						end
						local prevId = p2.getPrevId(p4, p3, p5)
						local nextId = p2.getNextId(p4, p3, p5)
						
						return computeGroupedVariant(var5, if prevId ~= nil then nil else var4[prevId], if nextId ~= nil then nil else var4[nextId])
					end)
					var1[p3] = var3
					
					return var3
				else
					return var2
				end
			else
				var1 = {}
				t[p4] = var1
			end
		end,
		evictConversation = function(p3)
			-- upvalues: t (ref)
			t[p3] = nil
		end
	}
end