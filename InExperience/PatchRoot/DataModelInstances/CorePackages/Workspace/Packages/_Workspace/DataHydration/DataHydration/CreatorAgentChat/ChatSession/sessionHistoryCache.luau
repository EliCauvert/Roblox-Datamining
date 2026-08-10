local _ = require(script.Parent.Parent.types)
local historyPageUtilsModule = require(script.Parent.historyPageUtils)
local constantsModule = require(script.Parent.constants)

return {
	createSessionHistoryCache = function(p0) --[[ line: 24 ]]
		-- upvalues: constantsModule (ref), historyPageUtilsModule (ref)
		p0 = p0 or constantsModule.getMaxCachedSessionHistories()
		local t = {}
		local t_1 = {}
		
		local function removeFromOrder(p1) --[[ line: 29 ]]
			-- upvalues: t_1 (ref)
			for i, v in t_1 do
				if v == p1 then
					table.remove(t_1, i)
					
					return
				end
			end
		end
		
		local function _(p2) --[[ line: 38 | named "touch" ]]
			-- upvalues: removeFromOrder (ref), t_1 (ref)
			removeFromOrder(p2)
			table.insert(t_1, p2)
		end
		
		local _ = function() --[[ line: 43 | named "evictOldest" ]]
			-- upvalues: t_1 (ref), t (ref)
			local var6 = t_1[1]
			
			if var6 == nil then
				return
			end
			table.remove(t_1, 1)
			t[var6] = nil
		end
		
		return {
			save = function(p3, p4) --[[ line: 52 ]]
				-- upvalues: t (ref), historyPageUtilsModule (copy), removeFromOrder (ref), t_1 (ref), p0 (ref)
				t[p3] = {
					loadedBySequenceId = historyPageUtilsModule.cloneHistoryBySequenceId(p4.loadedBySequenceId),
					overlayBySequenceId = historyPageUtilsModule.cloneHistoryBySequenceId(p4.overlayBySequenceId),
					hasLoadedHistory = p4.hasLoadedHistory,
					nextHistoryPageToken = p4.nextHistoryPageToken,
					latestObservedHistorySequenceId = p4.latestObservedHistorySequenceId,
					pendingUserMessage = p4.pendingUserMessage
				}
				removeFromOrder(p3)
				table.insert(t_1, p3)
				while p0 < #t_1 do
					local var7 = t_1[1]
					
					if var7 == nil then continue end
					table.remove(t_1, 1)
					t[var7] = nil
				end
			end,
			restore = function(p5) --[[ line: 67 ]]
				-- upvalues: t (ref), removeFromOrder (ref), t_1 (ref), historyPageUtilsModule (copy)
				local var8 = t[p5]
				
				if var8 == nil then
					return nil
				end
				removeFromOrder(p5)
				table.insert(t_1, p5)
				
				return {
					loadedBySequenceId = historyPageUtilsModule.cloneHistoryBySequenceId(var8.loadedBySequenceId),
					overlayBySequenceId = historyPageUtilsModule.cloneHistoryBySequenceId(var8.overlayBySequenceId),
					hasLoadedHistory = var8.hasLoadedHistory,
					nextHistoryPageToken = var8.nextHistoryPageToken,
					latestObservedHistorySequenceId = var8.latestObservedHistorySequenceId,
					pendingUserMessage = var8.pendingUserMessage
				}
			end
		}
	end
}