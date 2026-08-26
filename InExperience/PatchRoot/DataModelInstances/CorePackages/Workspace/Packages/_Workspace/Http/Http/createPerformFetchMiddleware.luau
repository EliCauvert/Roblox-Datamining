local http = script:FindFirstAncestor("Http")
local updateFetchingStatus = require(http.Actions).UpdateFetchingStatus
local batchUpdateFetchingStatus = require(http.Actions).BatchUpdateFetchingStatus

return function(p1)
	-- upvalues: batchUpdateFetchingStatus (ref), updateFetchingStatus (ref)
	local t = {}
	local var1 = false
	p1 = p1 or 0
	
	return function(p2, p3)
		-- upvalues: var1 (write), p1 (ref), t (write), batchUpdateFetchingStatus (copy), updateFetchingStatus (copy)
		local function _()
			-- upvalues: var1 (copy), p1 (copy), t (copy), p3 (ref), batchUpdateFetchingStatus (copy)
			if var1 then
				return
			end
			var1 = true
			task.delay(p1, function()
				-- upvalues: t (copy), var1 (copy), p3 (copy), batchUpdateFetchingStatus (copy)
				t = {}
				var1 = false
				p3:dispatch(batchUpdateFetchingStatus(t, true))
			end)
		end
		
		return function(p4)
			-- upvalues: updateFetchingStatus (copy), t (copy), var1 (copy), p1 (copy), p3 (ref), batchUpdateFetchingStatus (copy), p2 (ref)
			if p4.type == updateFetchingStatus.name then
				table.insert(t, p4)
				
				if not var1 then
					var1 = true
					task.delay(p1, function()
						-- upvalues: t (copy), var1 (copy), p3 (copy), batchUpdateFetchingStatus (copy)
						t = {}
						var1 = false
						p3:dispatch(batchUpdateFetchingStatus(t, true))
					end)
				end
			elseif p4.type ~= batchUpdateFetchingStatus.name or p4.shouldImmediatelyDispatch then
				return p2(p4)
			end
			for i, v in pairs(p4.fetchingStatuses) do
				table.insert(t, v)
			end
			if not var1 then
				var1 = true
				task.delay(p1, function()
					-- upvalues: t (copy), var1 (copy), p3 (copy), batchUpdateFetchingStatus (copy)
					t = {}
					var1 = false
					p3:dispatch(batchUpdateFetchingStatus(t, true))
				end)
			end
			return nil
		end
	end
end