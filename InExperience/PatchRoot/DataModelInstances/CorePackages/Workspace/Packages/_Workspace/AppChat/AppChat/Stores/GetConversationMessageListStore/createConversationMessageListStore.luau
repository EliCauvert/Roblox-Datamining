local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local createProxy = require(parent.SignalsExperimental).createProxy
local arraySetModule = require(appChat.DataStructures.ArraySet)

local function _()
	-- upvalues: arraySetModule (ref)
	return { messageIds = arraySetModule.new({}) }
end

local _ = function()
	return {
		nextPageCursor = nil,
		isLoading = false,
		fetchedOldest = false
	}
end

return function()
	-- upvalues: createProxy (ref), arraySetModule (ref), cryoModule (ref)
	local var1 = createProxy({})
	local var2 = createProxy({})
	
	local function _(p1)
		-- upvalues: var1 (ref), arraySetModule (copy)
		local var3 = var1[p1]
		
		return if var3 == nil then { messageIds = arraySetModule.new({}) } else var3
	end
	
	local _ = function(p1)
		-- upvalues: var2 (ref)
		local var3 = var2[p1]
		
		return if var3 == nil then {
			nextPageCursor = nil,
			isLoading = false,
			fetchedOldest = false
		} else var3
	end
	
	local function prependMessages(p1, p2)
		-- upvalues: var1 (ref), arraySetModule (copy)
		local var3 = var1[p1]
		local var4 = if var3 ~= nil then { messageIds = arraySetModule.new({}) } else var3
		
		if var4.messageIds:prependAll(p2) then
			var1[p1] = table.clone(var4)
			
			return
		end
	end
	
	local function appendMessages(p1, p2)
		-- upvalues: var1 (ref), arraySetModule (copy)
		local var3 = var1[p1]
		local var4 = if var3 ~= nil then { messageIds = arraySetModule.new({}) } else var3
		local var5 = false
		
		for i, v in p2 do
			if var4.messageIds:add(v) then
				var5 = true
			end
		end
		if var5 then
			var1[p1] = table.clone(var4)
			
			return
		end
	end
	
	local function updatePagination(p3, p4, p5)
		-- upvalues: var2 (ref), cryoModule (copy)
		local var6 = var2[p3]
		local var7 = if var6 ~= nil then {
			nextPageCursor = nil,
			isLoading = false,
			fetchedOldest = false
		} else var6
		var2[p3] = cryoModule.Dictionary.union(var7, {
			isLoading = false,
			nextPageCursor = if p4 and p4 ~= "" then p4 else var7.nextPageCursor,
			fetchedOldest = p5
		})
	end
	
	return {
		conversations = var1,
		metadata = var2,
		prependMessages = prependMessages,
		appendMessages = appendMessages,
		removeMessage = function(p3, p4)
			-- upvalues: var1 (ref)
			local var6 = var1[p3]
			
			if var6 == nil then return end
			if var6.messageIds:remove(p4) then
				var1[p3] = table.clone(var6)
				
				return
			end
		end,
		setLoading = function(value, p3)
			-- upvalues: var2 (ref), cryoModule (copy)
			local var6 = var2[value]
			var2[value] = cryoModule.Dictionary.union(if var6 ~= nil then {
				nextPageCursor = nil,
				isLoading = false,
				fetchedOldest = false
			} else var6, { isLoading = p3 })
		end,
		updatePagination = updatePagination,
		receivePage = function(p3, p4, p5)
			-- upvalues: appendMessages (ref), updatePagination (ref)
			appendMessages(p3, p4)
			updatePagination(p3, p5, if p5 ~= nil then p5 == "" else true)
		end,
		clearConversation = function(p3)
			-- upvalues: var1 (ref), var2 (ref)
			var1[p3] = nil
			var2[p3] = nil
		end,
		clear = function()
			-- upvalues: var1 (ref), var2 (ref)
			for i in var1 do
				var1[i] = nil
			end
			for i_1 in var2 do
				var2[i_1] = nil
			end
		end,
		getIndex = function(p3, p4, p5)
			-- upvalues: var1 (ref)
			local var6 = var1(p5)[p3]
			
			return if var6 == nil then nil else var6.messageIds:indexOf(p4)
		end,
		getOrderedIds = function(p3, p4)
			-- upvalues: var1 (ref)
			local var6 = var1(p4)[p3]
			
			return if var6 == nil then {} else var6.messageIds:values()
		end,
		getPrevId = function(p3, p4, p5)
			-- upvalues: var1 (ref)
			local var6 = var1(p5)[p3]
			
			if var6 == nil then
				return nil
			end
			local var7 = var6.messageIds:indexOf(p4)
			
			return if var7 == nil or var7 <= 1 then nil else var6.messageIds:at(var7 - 1)
		end,
		getNextId = function(p3, p4, p5)
			-- upvalues: var1 (ref)
			local var6 = var1(p5)[p3]
			
			if var6 == nil then
				return nil
			end
			local var7 = var6.messageIds:indexOf(p4)
			
			return if var7 == nil or var6.messageIds:size() <= var7 then nil else var6.messageIds:at(var7 + 1)
		end,
		getMetadata = function(p3, p4)
			-- upvalues: var2 (ref)
			return var2(p4)[p3]
		end
	}
end