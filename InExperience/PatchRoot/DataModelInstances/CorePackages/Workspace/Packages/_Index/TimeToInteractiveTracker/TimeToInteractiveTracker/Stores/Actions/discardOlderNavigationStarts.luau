local _ = require(script.Parent.Parent.types)
local NavigationEventPrefixModule = require(script:FindFirstAncestor("TimeToInteractiveTracker").Utils.navigationEventPrefix)

return function(Callback, p1)
	-- upvalues: NavigationEventPrefixModule (copy)
	return function(p2)
		-- upvalues: Callback (copy), NavigationEventPrefixModule (upval), p1 (copy)
		local List = {}
		Callback(function(Tbl)
			-- upvalues: p2 (copy), NavigationEventPrefixModule (upval), List (copy)
			local Entry = Tbl[p2]
			
			if Entry == nil or Entry.startTime == nil then
				return Tbl
			end
			for i, value in Tbl do
				if i ~= p2 and string.sub(i, 1, #NavigationEventPrefixModule) == NavigationEventPrefixModule and value ~= nil and value.startTime ~= nil and not value.sent and value.startTime < Entry.startTime then
					table.insert(List, i)
				end
			end
			if #List == 0 then
				return Tbl
			end
			local Copy = table.clone(Tbl)
			
			for _, value1 in List do
				Copy[value1] = nil
			end
			return Copy
		end)
		
		for _, value in List do
			p1[value] = true
		end
	end
end