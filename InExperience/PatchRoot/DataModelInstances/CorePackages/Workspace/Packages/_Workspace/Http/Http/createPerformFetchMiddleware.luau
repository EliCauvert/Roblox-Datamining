local http = script:FindFirstAncestor("Http")
local updateFetchingStatus = require(http.Actions).UpdateFetchingStatus
local batchUpdateFetchingStatus = require(http.Actions).BatchUpdateFetchingStatus

return function(p0) --[[ line: 5 | named "createPerformFetchMiddleware" ]]
	-- upvalues: batchUpdateFetchingStatus (ref), updateFetchingStatus (ref)
	local t = {}
	local var2 = false
	p0 = p0 or 0
	
	return function(p1, p2) --[[ line: 10 ]]
		-- upvalues: var2 (write), p0 (ref), t (write), batchUpdateFetchingStatus (copy), updateFetchingStatus (copy)
		local function _() --[[ line: 11 | named "runBatchDispatcher" ]]
			-- upvalues: var2 (copy), p0 (copy), t (copy), p2 (ref), batchUpdateFetchingStatus (copy)
			if var2 then
				return
			end
			var2 = true
			task.delay(p0, function() --[[ line: 17 ]]
				-- upvalues: t (copy), var2 (copy), p2 (copy), batchUpdateFetchingStatus (copy)
				t = {}
				var2 = false
				p2:dispatch(batchUpdateFetchingStatus(t, true))
			end)
		end
		
		return function(p3) --[[ line: 26 ]]
			-- upvalues: updateFetchingStatus (copy), t (copy), var2 (copy), p0 (copy), p2 (ref), batchUpdateFetchingStatus (copy), p1 (ref)
			if p3.type == updateFetchingStatus.name then
				table.insert(t, p3)
				
				if not var2 then
					var2 = true
					task.delay(p0, function() --[[ line: 17 ]]
						-- upvalues: t (copy), var2 (copy), p2 (copy), batchUpdateFetchingStatus (copy)
						t = {}
						var2 = false
						p2:dispatch(batchUpdateFetchingStatus(t, true))
					end)
				end
			elseif p3.type ~= batchUpdateFetchingStatus.name or p3.shouldImmediatelyDispatch then
				return p1(p3)
			end
			for i, v in pairs(p3.fetchingStatuses) do
				table.insert(t, v)
			end
			if not var2 then
				var2 = true
				task.delay(p0, function() --[[ line: 17 ]]
					-- upvalues: t (copy), var2 (copy), p2 (copy), batchUpdateFetchingStatus (copy)
					t = {}
					var2 = false
					p2:dispatch(batchUpdateFetchingStatus(t, true))
				end)
			end
			return nil
		end
	end
end