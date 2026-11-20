local Parent = script:FindFirstAncestor("AppChat").Parent
local _ = require(Parent.AppChatNetworking)
local DataHydrationModule = require(Parent.DataHydration)
local _ = require(Parent.Signals)
local t = {}

return function()
	-- upvalues: DataHydrationModule (copy), t (copy)
	local DataCache = DataHydrationModule.createDataCache()
	local t1 = {}
	
	return {
		getMessageReactions = function(p1, p2)
			-- upvalues: DataCache (copy)
			return DataCache.getItem(p1).data(p2)
		end,
		hasMessageReactions = function(p1): boolean
			-- upvalues: t1 (copy), DataCache (copy)
			return t1[p1] ~= nil and DataCache.getItem(p1).data(false) ~= nil
		end,
		ingestMessageReactions = function(List)
			-- upvalues: DataCache (copy), t (upval), t1 (copy)
			local t2 = {}
			
			for _, value in List do
				local DataResult = DataCache.getItem(value.id).data(false)
				t2[value.id] = {
					reactions = value.reactions or t,
					pending = if DataResult then DataResult.pending else nil
				}
				t1[value.id] = true
			end
			DataCache.replaceItems(t2)
		end,
		setPendingReaction = function(Key, Pending)
			-- upvalues: DataCache (copy), t (upval), t1 (copy)
			local DataResult = DataCache.getItem(Key).data(false)
			
			if DataResult ~= nil or Pending ~= nil then
				DataCache.replaceItem(Key, {
					reactions = if DataResult then DataResult.reactions else t,
					pending = Pending
				})
				t1[Key] = true
				
				return
			end
		end,
		setConfirmedReactions = function(p1, Reactions)
			-- upvalues: DataCache (copy)
			local DataResult = DataCache.getItem(p1).data(false)
			
			if DataResult ~= nil then
				DataCache.replaceItem(p1, { reactions = Reactions, pending = DataResult.pending })
				
				return
			end
		end,
		evictMessageReactions = function(List)
			-- upvalues: t1 (copy), DataCache (copy)
			for _, value in List do
				if t1[value] ~= nil and DataCache.getItem(value).data(false) ~= nil then
					DataCache.replaceItem(value, nil)
				end
			end
		end,
		clear = DataCache.clear,
		dispose = DataCache.dispose
	}
end