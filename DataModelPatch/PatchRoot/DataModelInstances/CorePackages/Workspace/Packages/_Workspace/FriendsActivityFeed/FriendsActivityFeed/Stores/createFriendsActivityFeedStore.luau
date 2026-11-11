local FriendsActivityFeed = script:FindFirstAncestor("FriendsActivityFeed")
local _ = require(FriendsActivityFeed.Common.ActivityFeedTypes)
local CreateSignalFunction = require(FriendsActivityFeed.Parent.Signals).createSignal

return function(p1)
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction({})
	local Loading, Loading2 = CreateSignalFunction("Loading")
	local Signal1, Signal2_1 = CreateSignalFunction(nil)
	local Flag = false
	local Count = 0
	
	local function runFetch()
		-- upvalues: Flag (ref), Count (ref), Signal2_1 (copy), Loading2 (copy), p1 (copy), Signal2 (copy)
		if not Flag then
			Count += 1
			local Count1: number = Count
			Signal2_1(nil)
			Loading2("Loading")
			task.spawn(function()
				-- upvalues: p1 (upval), Flag (upval), Count1 (copy), Count (upval), Signal2 (upval), Loading2 (upval), Signal2_1 (upval)
				local Success, Result = pcall(p1.fetchAsync, nil)
				
				if Flag or Count1 ~= Count then return end
				local Result1 = if Success and type(Result) == "table" and type(Result.items) == "table" then Result else nil
				
				if Result1 == nil then
					Signal2({})
					Signal2_1(if Success then "Malformed feed batch" else tostring(Result))
					Loading2("Failed")
					
					return
				else
					Signal2(Result1.items)
					Loading2(if #Result1.items == 0 then "Empty" else "Loaded")
				end
			end)
			
			return
		end
	end
	
	return {
		getItems = Signal,
		getStatus = Loading,
		getError = Signal1,
		loadInitial = runFetch,
		refresh = runFetch,
		dispose = function()
			-- upvalues: Flag (ref), p1 (copy)
			Flag = true
			
			if p1.dispose then
				p1.dispose()
			end
		end
	}
end