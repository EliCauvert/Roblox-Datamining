local Parent = script:FindFirstAncestor("AppChat").Parent
local _ = require(Parent.AppChatNetworking)
local DataHydrationModule = require(Parent.DataHydration)
local _ = require(Parent.Signals)
local t = {}

return function()
	-- upvalues: DataHydrationModule (copy), t (copy)
	local DataCache = DataHydrationModule.createDataCache()
	
	return {
		getMessageReactions = function(p1, p2)
			-- upvalues: DataCache (copy)
			return DataCache.getItem(p1).data(p2)
		end,
		ingestMessageReactions = function(List)
			-- upvalues: DataCache (copy), t (upval)
			local t1 = {}
			
			for _, value in List do
				local DataResult = DataCache.getItem(value.id).data(false)
				t1[value.id] = {
					reactions = value.reactions or t,
					pending = if DataResult then DataResult.pending else nil
				}
			end
			DataCache.replaceItems(t1)
		end,
		evictMessageReactions = function(List)
			-- upvalues: DataCache (copy)
			for _, value in List do
				if DataCache.getItem(value).data(false) ~= nil then
					DataCache.replaceItem(value, nil)
				end
			end
		end,
		clear = DataCache.clear,
		dispose = DataCache.dispose
	}
end