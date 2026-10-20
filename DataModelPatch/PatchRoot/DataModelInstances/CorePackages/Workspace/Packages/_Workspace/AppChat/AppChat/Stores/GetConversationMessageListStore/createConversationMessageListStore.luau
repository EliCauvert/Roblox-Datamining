local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local CreateProxyFunction = require(Parent.SignalsExperimental).createProxy
local ArraySetModule = require(AppChat.DataStructures.ArraySet)

local function _()
	-- upvalues: ArraySetModule (copy)
	return { messageIds = ArraySetModule.new({}) }
end

local _ = function()
	return {
		nextPageCursor = nil,
		isLoading = false,
		fetchedOldest = false
	}
end

return function()
	-- upvalues: CreateProxyFunction (copy), ArraySetModule (copy), CryoModule (copy)
	local Proxy = CreateProxyFunction({})
	local Proxy1 = CreateProxyFunction({})
	
	local function _(p1)
		-- upvalues: Proxy (copy), ArraySetModule (upval)
		local ProxyEntry = Proxy[p1]
		
		return if ProxyEntry == nil then { messageIds = ArraySetModule.new({}) } else ProxyEntry
	end
	
	local _ = function(p1)
		-- upvalues: Proxy1 (copy)
		local ProxyEntry = Proxy1[p1]
		
		return if ProxyEntry == nil then {
			nextPageCursor = nil,
			isLoading = false,
			fetchedOldest = false
		} else ProxyEntry
	end
	
	local function appendMessages(Key, List)
		-- upvalues: Proxy (copy), ArraySetModule (upval)
		local ProxyEntry = Proxy[Key]
		local Config = if ProxyEntry == nil then { messageIds = ArraySetModule.new({}) } else ProxyEntry
		local Flag = false
		
		for _, value in List do
			if Config.messageIds:add(value) then
				Flag = true
			end
		end
		if Flag then
			Proxy[Key] = table.clone(Config)
			
			return
		end
	end
	
	local function updatePagination(Key, p1, FetchedOldest)
		-- upvalues: Proxy1 (copy), CryoModule (upval)
		local ProxyEntry = Proxy1[Key]
		local Config = if ProxyEntry == nil then {
			nextPageCursor = nil,
			isLoading = false,
			fetchedOldest = false
		} else ProxyEntry
		Proxy1[Key] = CryoModule.Dictionary.union(Config, {
			isLoading = false,
			nextPageCursor = if p1 and p1 ~= "" then p1 else Config.nextPageCursor,
			fetchedOldest = FetchedOldest
		})
	end
	
	return {
		conversations = Proxy,
		metadata = Proxy1,
		prependMessages = function(Key, p1)
			-- upvalues: Proxy (copy), ArraySetModule (upval)
			local ProxyEntry = Proxy[Key]
			local Config = if ProxyEntry == nil then { messageIds = ArraySetModule.new({}) } else ProxyEntry
			
			if Config.messageIds:prependAll(p1) then
				Proxy[Key] = table.clone(Config)
				
				return
			end
		end,
		appendMessages = appendMessages,
		removeMessage = function(Key, p1)
			-- upvalues: Proxy (copy)
			local ProxyEntry = Proxy[Key]
			
			if ProxyEntry == nil then return end
			if ProxyEntry.messageIds:remove(p1) then
				Proxy[Key] = table.clone(ProxyEntry)
				
				return
			end
		end,
		setLoading = function(Key, IsLoading)
			-- upvalues: Proxy1 (copy), CryoModule (upval)
			local ProxyEntry = Proxy1[Key]
			Proxy1[Key] = CryoModule.Dictionary.union(if ProxyEntry == nil then {
				nextPageCursor = nil,
				isLoading = false,
				fetchedOldest = false
			} else ProxyEntry, { isLoading = IsLoading })
		end,
		updatePagination = updatePagination,
		receivePage = function(p1, p2, p3)
			-- upvalues: appendMessages (copy), updatePagination (copy)
			appendMessages(p1, p2)
			updatePagination(p1, p3, p3 == nil or p3 == "")
		end,
		clearConversation = function(Key)
			-- upvalues: Proxy (copy), Proxy1 (copy)
			Proxy[Key] = nil
			Proxy1[Key] = nil
		end,
		clear = function()
			-- upvalues: Proxy (copy), Proxy1 (copy)
			for i in Proxy do
				Proxy[i] = nil
			end
			for i1 in Proxy1 do
				Proxy1[i1] = nil
			end
		end,
		getIndex = function(p1, p2, p3)
			-- upvalues: Proxy (copy)
			local ProxyResultEntry = Proxy(p3)[p1]
			
			return if ProxyResultEntry == nil then nil else ProxyResultEntry.messageIds:indexOf(p2)
		end,
		getOrderedIds = function(p1, p2)
			-- upvalues: Proxy (copy)
			local ProxyResultEntry = Proxy(p2)[p1]
			
			return if ProxyResultEntry == nil then {} else ProxyResultEntry.messageIds:values()
		end,
		getPrevId = function(p1, p2, p3)
			-- upvalues: Proxy (copy)
			local ProxyResultEntry = Proxy(p3)[p1]
			
			if ProxyResultEntry == nil then
				return nil
			else
				local IndexOfResult: number = ProxyResultEntry.messageIds:indexOf(p2)
				
				return if IndexOfResult == nil or IndexOfResult <= 1 then nil else ProxyResultEntry.messageIds:at(IndexOfResult - 1)
			end
		end,
		getNextId = function(p1, p2, p3)
			-- upvalues: Proxy (copy)
			local ProxyResultEntry = Proxy(p3)[p1]
			
			if ProxyResultEntry == nil then
				return nil
			else
				local IndexOfResult: number = ProxyResultEntry.messageIds:indexOf(p2)
				
				return if IndexOfResult == nil or ProxyResultEntry.messageIds:size() <= IndexOfResult then nil else ProxyResultEntry.messageIds:at(IndexOfResult + 1)
			end
		end,
		getMetadata = function(p1, p2)
			-- upvalues: Proxy1 (copy)
			return Proxy1(p2)[p1]
		end
	}
end