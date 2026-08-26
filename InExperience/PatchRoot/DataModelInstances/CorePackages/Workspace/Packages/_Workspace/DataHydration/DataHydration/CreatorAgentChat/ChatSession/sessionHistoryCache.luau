local _ = require(script.Parent.Parent.types)
local historyPageUtilsModule = require(script.Parent.historyPageUtils)
local constantsModule = require(script.Parent.constants)

return {
	createSessionHistoryCache = function(p1)
		-- upvalues: constantsModule (ref), historyPageUtilsModule (ref)
		p1 = p1 or constantsModule.getMaxCachedSessionHistories()
		local t = {}
		local t_1 = {}
		
		local function removeFromOrder(p2)
			-- upvalues: t_1 (ref)
			for i, v in t_1 do
				if v == p2 then
					table.remove(t_1, i)
					
					return
				end
			end
		end
		
		local function _(p3)
			-- upvalues: removeFromOrder (ref), t_1 (ref)
			removeFromOrder(p3)
			table.insert(t_1, p3)
		end
		
		local _ = function()
			-- upvalues: t_1 (ref), t (ref)
			local var1 = t_1[1]
			
			if var1 == nil then
				return
			end
			table.remove(t_1, 1)
			t[var1] = nil
		end
		
		return {
			save = function(p3, p4)
				-- upvalues: t (ref), historyPageUtilsModule (copy), removeFromOrder (ref), t_1 (ref), p1 (ref)
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
				while p1 < #t_1 do
					local var1 = t_1[1]
					
					if var1 == nil then continue end
					table.remove(t_1, 1)
					t[var1] = nil
				end
			end,
			restore = function(p5)
				-- upvalues: t (ref), removeFromOrder (ref), t_1 (ref), historyPageUtilsModule (copy)
				local var2 = t[p5]
				
				if var2 == nil then
					return nil
				end
				removeFromOrder(p5)
				table.insert(t_1, p5)
				
				return {
					loadedBySequenceId = historyPageUtilsModule.cloneHistoryBySequenceId(var2.loadedBySequenceId),
					overlayBySequenceId = historyPageUtilsModule.cloneHistoryBySequenceId(var2.overlayBySequenceId),
					hasLoadedHistory = var2.hasLoadedHistory,
					nextHistoryPageToken = var2.nextHistoryPageToken,
					latestObservedHistorySequenceId = var2.latestObservedHistorySequenceId,
					pendingUserMessage = var2.pendingUserMessage
				}
			end
		}
	end
}