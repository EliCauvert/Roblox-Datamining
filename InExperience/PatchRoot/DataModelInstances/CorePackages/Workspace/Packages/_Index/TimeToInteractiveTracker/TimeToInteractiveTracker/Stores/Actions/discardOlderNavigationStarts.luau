local TimeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local _ = require(script.Parent.Parent.types)
local NavigationEventPrefixModule = require(TimeToInteractiveTracker.Utils.navigationEventPrefix)
local LogTTIDiscardModule = require(TimeToInteractiveTracker.Utils.logTTIDiscard)
local HasNavigationCommittedModule = require(TimeToInteractiveTracker.Utils.hasNavigationCommitted)

return function(Callback, p1)
	-- upvalues: NavigationEventPrefixModule (copy), HasNavigationCommittedModule (copy), LogTTIDiscardModule (copy)
	return function(p2)
		-- upvalues: Callback (copy), NavigationEventPrefixModule (upval), HasNavigationCommittedModule (upval), p1 (copy), LogTTIDiscardModule (upval)
		local List = {}
		local t = {}
		Callback(function(Tbl)
			-- upvalues: p2 (copy), NavigationEventPrefixModule (upval), List (copy), HasNavigationCommittedModule (upval), t (copy)
			local Entry = Tbl[p2]
			
			if Entry == nil or Entry.startTime == nil then
				return Tbl
			end
			for i, value in Tbl do
				if i ~= p2 and string.sub(i, 1, #NavigationEventPrefixModule) == NavigationEventPrefixModule and value ~= nil and value.startTime ~= nil and not value.sent and value.startTime < Entry.startTime then
					table.insert(List, i)
					
					if HasNavigationCommittedModule(value) then
						t[i] = true
					end
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
			
			if t[value] then
				LogTTIDiscardModule(value, "superseded")
			end
		end
	end
end