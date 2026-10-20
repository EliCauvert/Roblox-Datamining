local _ = require(script.Parent.Parent.types)
local HistoryPageUtilsModule = require(script.Parent.historyPageUtils)
local ConstantsModule = require(script.Parent.constants)

return {
	createSessionHistoryCache = function(p1)
		-- upvalues: ConstantsModule (copy), HistoryPageUtilsModule (copy)
		local P0 = p1 or ConstantsModule.getMaxCachedSessionHistories()
		local t = {}
		local List = {}
		
		local function removeFromOrder(Key)
			-- upvalues: List (copy)
			for i, value in List do
				if value == Key then
					table.remove(List, i)
					break
				end
			end
		end
		
		local function _(p2)
			-- upvalues: removeFromOrder (copy), List (copy)
			removeFromOrder(p2)
			table.insert(List, p2)
		end
		
		local _ = function()
			-- upvalues: List (copy), t (copy)
			local Entry = List[1]
			
			if Entry ~= nil then
				table.remove(List, 1)
				t[Entry] = nil
				
				return
			end
		end
		
		return {
			save = function(Key, p2)
				-- upvalues: t (copy), HistoryPageUtilsModule (upval), removeFromOrder (copy), List (copy), P0 (copy)
				t[Key] = {
					loadedBySequenceId = HistoryPageUtilsModule.cloneHistoryBySequenceId(p2.loadedBySequenceId),
					overlayBySequenceId = HistoryPageUtilsModule.cloneHistoryBySequenceId(p2.overlayBySequenceId),
					hasLoadedHistory = p2.hasLoadedHistory,
					nextHistoryPageToken = p2.nextHistoryPageToken,
					latestObservedHistorySequenceId = p2.latestObservedHistorySequenceId,
					pendingUserMessage = p2.pendingUserMessage
				}
				removeFromOrder(Key)
				table.insert(List, Key)
				while P0 < #List do
					local Entry = List[1]
					
					if Entry == nil then continue end
					table.remove(List, 1)
					t[Entry] = nil
				end
			end,
			restore = function(p3)
				-- upvalues: t (copy), removeFromOrder (copy), List (copy), HistoryPageUtilsModule (upval)
				local Entry = t[p3]
				
				if Entry == nil then
					return nil
				else
					removeFromOrder(p3)
					table.insert(List, p3)
					
					return {
						loadedBySequenceId = HistoryPageUtilsModule.cloneHistoryBySequenceId(Entry.loadedBySequenceId),
						overlayBySequenceId = HistoryPageUtilsModule.cloneHistoryBySequenceId(Entry.overlayBySequenceId),
						hasLoadedHistory = Entry.hasLoadedHistory,
						nextHistoryPageToken = Entry.nextHistoryPageToken,
						latestObservedHistorySequenceId = Entry.latestObservedHistorySequenceId,
						pendingUserMessage = Entry.pendingUserMessage
					}
				end
			end
		}
	end
}