local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local createProxy = require(parent.SignalsExperimental).createProxy
local arraySetModule = require(appChat.DataStructures.ArraySet)

local function _() --[[ line: 90 | named "newConversationOrdering" ]]
	-- upvalues: arraySetModule (ref)
	return { messageIds = arraySetModule.new({}) }
end

local _ = function() --[[ line: 96 | named "newMessagePaginationMetadata" ]]
	return {
		nextPageCursor = nil,
		isLoading = false,
		fetchedOldest = false
	}
end

return function() --[[ line: 104 | named "createConversationMessageListStore" ]]
	-- upvalues: createProxy (ref), arraySetModule (ref), cryoModule (ref)
	local var3 = createProxy({})
	local var4 = createProxy({})
	
	local function _(p0) --[[ line: 112 | named "getOrDefaultOrdering" ]]
		-- upvalues: var3 (ref), arraySetModule (copy)
		local var8 = var3[p0]
		
		return if var8 == nil then { messageIds = arraySetModule.new({}) } else var8
	end
	
	local _ = function(p1) --[[ line: 120 | named "getOrDefaultMetadata" ]]
		-- upvalues: var4 (ref)
		local var9 = var4[p1]
		
		return if var9 == nil then {
			nextPageCursor = nil,
			isLoading = false,
			fetchedOldest = false
		} else var9
	end
	
	local function prependMessages(p2, p3) --[[ line: 130 ]]
		-- upvalues: var3 (ref), arraySetModule (copy)
		local var10 = var3[p2]
		local var11 = if var10 ~= nil then { messageIds = arraySetModule.new({}) } else var10
		
		if var11.messageIds:prependAll(p3) then
			var3[p2] = table.clone(var11)
			
			return
		end
	end
	
	local function appendMessages(p4, p5) --[[ line: 143 ]]
		-- upvalues: var3 (ref), arraySetModule (copy)
		local var12 = var3[p4]
		local var13 = if var12 ~= nil then { messageIds = arraySetModule.new({}) } else var12
		local var14 = false
		
		for i, v in p5 do
			if var13.messageIds:add(v) then
				var14 = true
			end
		end
		if var14 then
			var3[p4] = table.clone(var13)
			
			return
		end
	end
	
	local function updatePagination(p6, p7, p8) --[[ line: 181 ]]
		-- upvalues: var4 (ref), cryoModule (copy)
		local var15 = var4[p6]
		local var16 = if var15 ~= nil then {
			nextPageCursor = nil,
			isLoading = false,
			fetchedOldest = false
		} else var15
		var4[p6] = cryoModule.Dictionary.union(var16, {
			isLoading = false,
			nextPageCursor = if p7 and p7 ~= "" then p7 else var16.nextPageCursor,
			fetchedOldest = p8
		})
	end
	
	return {
		conversations = var3,
		metadata = var4,
		prependMessages = prependMessages,
		appendMessages = appendMessages,
		removeMessage = function(p9, p10) --[[ line: 161 ]]
			-- upvalues: var3 (ref)
			local var17 = var3[p9]
			
			if var17 == nil then return end
			if var17.messageIds:remove(p10) then
				var3[p9] = table.clone(var17)
				
				return
			end
		end,
		setLoading = function(value, p11) --[[ line: 173 ]]
			-- upvalues: var4 (ref), cryoModule (copy)
			local var18 = var4[value]
			var4[value] = cryoModule.Dictionary.union(if var18 ~= nil then {
				nextPageCursor = nil,
				isLoading = false,
				fetchedOldest = false
			} else var18, { isLoading = p11 })
		end,
		updatePagination = updatePagination,
		receivePage = function(p12, p13, p14) --[[ line: 191 ]]
			-- upvalues: appendMessages (ref), updatePagination (ref)
			appendMessages(p12, p13)
			updatePagination(p12, p14, if p14 ~= nil then p14 == "" else true)
		end,
		clearConversation = function(p15) --[[ line: 196 ]]
			-- upvalues: var3 (ref), var4 (ref)
			var3[p15] = nil
			var4[p15] = nil
		end,
		clear = function() --[[ line: 201 ]]
			-- upvalues: var3 (ref), var4 (ref)
			for i in var3 do
				var3[i] = nil
			end
			for i_1 in var4 do
				var4[i_1] = nil
			end
		end,
		getIndex = function(p16, p17, p18) --[[ line: 210 ]]
			-- upvalues: var3 (ref)
			local var19 = var3(p18)[p16]
			
			return if var19 == nil then nil else var19.messageIds:indexOf(p17)
		end,
		getOrderedIds = function(p19, p20) --[[ line: 218 ]]
			-- upvalues: var3 (ref)
			local var20 = var3(p20)[p19]
			
			return if var20 == nil then {} else var20.messageIds:values()
		end,
		getPrevId = function(p21, p22, p23) --[[ line: 226 ]]
			-- upvalues: var3 (ref)
			local var21 = var3(p23)[p21]
			
			if var21 == nil then
				return nil
			end
			local var22 = var21.messageIds:indexOf(p22)
			
			return if var22 == nil or var22 <= 1 then nil else var21.messageIds:at(var22 - 1)
		end,
		getNextId = function(p24, p25, p26) --[[ line: 238 ]]
			-- upvalues: var3 (ref)
			local var23 = var3(p26)[p24]
			
			if var23 == nil then
				return nil
			end
			local var24 = var23.messageIds:indexOf(p25)
			
			return if var24 == nil or var23.messageIds:size() <= var24 then nil else var23.messageIds:at(var24 + 1)
		end,
		getMetadata = function(p27, p28) --[[ line: 250 ]]
			-- upvalues: var4 (ref)
			return var4(p28)[p27]
		end
	}
end