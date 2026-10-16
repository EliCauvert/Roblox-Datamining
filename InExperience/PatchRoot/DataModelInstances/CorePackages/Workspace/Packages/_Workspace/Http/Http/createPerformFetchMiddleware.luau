local Http = script:FindFirstAncestor("Http")
local UpdateFetchingStatus = require(Http.Actions).UpdateFetchingStatus
local BatchUpdateFetchingStatusFunction = require(Http.Actions).BatchUpdateFetchingStatus

return function(p1) --[[ Line: 5 | Named "createPerformFetchMiddleware" ]]
	-- upvalues: BatchUpdateFetchingStatusFunction (copy), UpdateFetchingStatus (copy)
	local List = {}
	local Flag = false
	local Delay = p1 or 0
	
	return function(Callback, p2) --[[ Line: 10 ]]
		-- upvalues: Flag (ref), Delay (copy), List (ref), BatchUpdateFetchingStatusFunction (upval), UpdateFetchingStatus (upval)
		local function _() --[[ Line: 11 | Named "runBatchDispatcher" ]]
			-- upvalues: Flag (upval), Delay (upval), List (upval), p2 (copy), BatchUpdateFetchingStatusFunction (upval)
			if not Flag then
				Flag = true
				task.delay(Delay, function() --[[ Line: 17 ]]
					-- upvalues: List (upval), Flag (upval), p2 (upval), BatchUpdateFetchingStatusFunction (upval)
					local v1 = List
					List = {}
					Flag = false
					p2:dispatch(BatchUpdateFetchingStatusFunction(v1, true))
				end)
				
				return
			end
		end
		
		return function(p3) --[[ Line: 26 ]]
			-- upvalues: UpdateFetchingStatus (upval), List (upval), Flag (upval), Delay (upval), p2 (copy), BatchUpdateFetchingStatusFunction (upval), Callback (copy)
			if p3.type == UpdateFetchingStatus.name then
				table.insert(List, p3)
				
				if not Flag then
					Flag = true
					task.delay(Delay, function() --[[ Line: 17 ]]
						-- upvalues: List (upval), Flag (upval), p2 (upval), BatchUpdateFetchingStatusFunction (upval)
						local v1 = List
						List = {}
						Flag = false
						p2:dispatch(BatchUpdateFetchingStatusFunction(v1, true))
					end)
				end
			else
				if p3.type ~= BatchUpdateFetchingStatusFunction.name or p3.shouldImmediatelyDispatch then
					return Callback(p3)
				end
				for _, fetchingStatus in pairs(p3.fetchingStatuses) do
					table.insert(List, fetchingStatus)
				end
				if not Flag then
					Flag = true
					task.delay(Delay, function() --[[ Line: 17 ]]
						-- upvalues: List (upval), Flag (upval), p2 (upval), BatchUpdateFetchingStatusFunction (upval)
						local v1 = List
						List = {}
						Flag = false
						p2:dispatch(BatchUpdateFetchingStatusFunction(v1, true))
					end)
				end
			end
			return nil
		end
	end
end