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

local function _(p0)
	-- upvalues: messageType (ref)
	return if p0 == nil then false else p0.type == messageType.User
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
	local var6
	local createdAt = p1.created_at
	
	if createdAt == nil then
		var6 = nil
	else
		local dateTime = DateTime.fromIsoDate(createdAt)
		var6 = if dateTime then dateTime.UnixTimestamp else nil
	end
	local var8
	local createdAt_1 = p2.created_at
	
	if createdAt_1 == nil then
		var8 = nil
	else
		local dateTime = DateTime.fromIsoDate(createdAt_1)
		var8 = if dateTime then dateTime.UnixTimestamp else nil
	end
	return if var6 == nil or var8 == nil then false else math.abs(var6 - var8) > 300
end

local _ = function(p3)
	-- upvalues: messageStatus (ref)
	return p3 ~= nil and p3.status == messageStatus.Moderated
end

local _ = function(p4)
	-- upvalues: messageVisibility (ref)
	return p4 ~= nil and p4.visibility == messageVisibility.Hidden
end

local _ = function(p5)
	return p5 ~= nil and p5.replies_to ~= nil
end

local function canGroupWithAdjacent(p6, p7)
	-- upvalues: messageType (ref), messageVisibility (ref), messageStatus (ref)
	local var10 = false
	
	if p7 ~= nil then
		var10 = if p7 == nil then false else p7.type == messageType.User
		
		if var10 then
			var10 = false
			
			if p7.sender_user_id == p6.sender_user_id then
				var10 = not (p6 ~= nil and p6.visibility == messageVisibility.Hidden)
				
				if var10 then
					var10 = not (p7 ~= nil and p7.visibility == messageVisibility.Hidden)
					
					if var10 then
						var10 = not (p6 ~= nil and p6.status == messageStatus.Moderated)
						
						if var10 then
							var10 = not (p7 ~= nil and p7.status == messageStatus.Moderated)
							
							if var10 then
								local var15
								if p7 == nil or p6 == nil then
									var15 = false
								else
									local var11
									local createdAt = p7.created_at
									
									if createdAt == nil then
										var11 = nil
									else
										local dateTime = DateTime.fromIsoDate(createdAt)
										var11 = if dateTime then dateTime.UnixTimestamp else nil
									end
									local var13
									local createdAt_1 = p6.created_at
									
									if createdAt_1 == nil then
										var13 = nil
									else
										local dateTime = DateTime.fromIsoDate(createdAt_1)
										var13 = if dateTime then dateTime.UnixTimestamp else nil
									end
									var15 = if var11 == nil or var13 == nil then false else math.abs(var11 - var13) > 300
								end
								var10 = not var15
							end
						end
					end
				end
			end
		end
	end
	return var10
end

local function computeGroupedVariant(p8, p9, p10)
	-- upvalues: messageType (ref), canGroupWithAdjacent (ref), groupedMessageVariant (ref)
	if not (if p8 == nil then false else p8.type == messageType.User) then
		return nil
	end
	local var16 = canGroupWithAdjacent(p8, p9)
	
	if var16 then
		var16 = not (p9 ~= nil and p9.replies_to ~= nil)
	end
	local var17 = canGroupWithAdjacent(p8, p10)
	
	if var17 then
		var17 = not (p8 ~= nil and p8.replies_to ~= nil)
	end
	return if not (not var16 and not var17) then if not (not var16 and var17) then if var16 and not var17 then groupedMessageVariant.First else groupedMessageVariant.Middle else groupedMessageVariant.Last else groupedMessageVariant.Single
end

return function(p11, p12)
	-- upvalues: signalsModule (ref), messageType (ref), groupedMessageVariant (ref), computeGroupedVariant (ref)
	local t = {}
	
	return {
		conversationMessageStore = p11,
		conversationMessageListStore = p12,
		getGroupedVariant = function(p13, p14)
			-- upvalues: t (ref), signalsModule (copy), p11 (ref), messageType (copy), p12 (ref), groupedMessageVariant (copy), computeGroupedVariant (copy)
			local var19 = t[p14]
			
			if var19 then
				local var20 = var19[p13]
				
				if var20 == nil then
					local var21 = signalsModule.createComputed(function(p15)
						-- upvalues: p11 (copy), p13 (ref), messageType (copy), p12 (copy), p14 (ref), groupedMessageVariant (copy), computeGroupedVariant (copy)
						local var22 = p11.messages(p15)
						local var23 = var22[p13]
						
						if var23 == nil then
							return nil
						elseif not (if var23 == nil then false else var23.type == messageType.User) then
							return nil
						elseif p12.getIndex(p14, p13, p15) == nil then
							return groupedMessageVariant.Single
						end
						local prevId = p12.getPrevId(p14, p13, p15)
						local nextId = p12.getNextId(p14, p13, p15)
						
						return computeGroupedVariant(var23, if prevId ~= nil then nil else var22[prevId], if nextId ~= nil then nil else var22[nextId])
					end)
					var19[p13] = var21
					
					return var21
				else
					return var20
				end
			else
				var19 = {}
				t[p14] = var19
			end
		end,
		evictConversation = function(p16)
			-- upvalues: t (ref)
			t[p16] = nil
		end
	}
end