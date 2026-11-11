local _ = require(script.Parent.Parent.types)
local SessionHistoryMergeModule = require(script.Parent.Parent.sessionHistoryMerge)
local ConstantsModule = require(script.Parent.constants)
local HistoryPageUtilsModule = require(script.Parent.historyPageUtils)
local _ = require(script.Parent.sessionDeps)

return {
	createHistoryLoader = function(p1)
		-- upvalues: HistoryPageUtilsModule (copy), SessionHistoryMergeModule (copy), ConstantsModule (copy)
		local Count = 0
		local CasSessionId = nil
		
		local function _(RefreshGeneration): boolean
			-- upvalues: p1 (copy)
			return RefreshGeneration ~= p1.getRefreshGeneration()
		end
		
		local _ = function(p2)
			-- upvalues: CasSessionId (ref), p1 (copy)
			if CasSessionId == p2 then
				p1.setHistoryLoadInFlight(false)
				CasSessionId = nil
			end
		end
		
		local _ = function(p2): boolean
			-- upvalues: p1 (copy), CasSessionId (ref)
			if p1.getHistoryLoadInFlight() then
				if CasSessionId == p2 then
					return false
				end
				p1.setHistoryLoadInFlight(false)
				CasSessionId = nil
			end
			CasSessionId = p2
			p1.setHistoryLoadInFlight(true)
			
			return true
		end
		
		local function loadHistoryPage(CasSessionId, HistoryPageToken, Callback)
			-- upvalues: p1 (copy), HistoryPageUtilsModule (upval)
			local AwaitRequestStateCancelledResult = HistoryPageUtilsModule.awaitRequestStateCancelled(p1.deps.sessionLoad(CasSessionId, { historyPageToken = HistoryPageToken }).state, Callback)
			
			if Callback() or AwaitRequestStateCancelledResult.status ~= "succeeded" then
				return false, {}, nil
			else
				return true, HistoryPageUtilsModule.getSessionLoadHistory(AwaitRequestStateCancelledResult.result), HistoryPageUtilsModule.getNextHistoryPageToken(AwaitRequestStateCancelledResult.result)
			end
		end
		
		local _ = function(CasSessionId, RefreshGeneration, Callback)
			-- upvalues: p1 (copy)
			return Callback() or (p1.getCasSessionId() ~= CasSessionId or RefreshGeneration ~= p1.getRefreshGeneration())
		end
		
		local _ = function(CasSessionId, Count1, RefreshGeneration, Callback)
			-- upvalues: p1 (copy), Count (ref)
			return (if Callback() then Callback() else p1.getCasSessionId() ~= CasSessionId or RefreshGeneration ~= p1.getRefreshGeneration()) or Count1 ~= Count
		end
		
		local function commitRefreshedHistory(CasSessionId, RefreshGeneration, p2, NextHistoryPageToken, Callback): boolean
			-- upvalues: p1 (copy), SessionHistoryMergeModule (upval)
			if Callback() or (p1.getCasSessionId() ~= CasSessionId or RefreshGeneration ~= p1.getRefreshGeneration()) then
				return false
			end
			local t = {}
			local t1 = {}
			SessionHistoryMergeModule.mergeHistoryIntoMap(t, p2, t1)
			
			for i, value in p1.getOverlayBySequenceId() do
				if t[i] == nil then
					t1[i] = value
				end
			end
			p1.setLoadedBySequenceId(t)
			p1.setOverlayBySequenceId(t1)
			p1.setNextHistoryPageToken(NextHistoryPageToken)
			p1.noteHistorySequenceIds(p2)
			p1.notifyMergedHistoryChanged()
			p1.markHistoryLoaded()
			
			return true
		end
		
		local _ = function(p3, p4, p5, p6, p7)
			-- upvalues: ConstantsModule (upval), p1 (copy), Count (ref), loadHistoryPage (copy)
			task.spawn(function()
				-- upvalues: p4 (copy), ConstantsModule (upval), p3 (copy), p6 (copy), p7 (copy), p5 (copy), p1 (upval), Count (upval), loadHistoryPage (upval)
				local HistoryPageToken = p4
				local PrefetchHistoryPagesOnRefresh = ConstantsModule.getPrefetchHistoryPagesOnRefresh()
				while PrefetchHistoryPagesOnRefresh > 0 and HistoryPageToken ~= nil do
					if p5() or (p1.getCasSessionId() ~= p3 or p7 ~= p1.getRefreshGeneration()) or p6 ~= Count then break end
					local v1, v2, v3 = loadHistoryPage(p3, HistoryPageToken, p5)
					
					if not v1 or (p5() or (p1.getCasSessionId() ~= p3 or p7 ~= p1.getRefreshGeneration()) or p6 ~= Count) then break end
					p1.mergeHistoryPage(v2, v3)
					HistoryPageToken = v3
					PrefetchHistoryPagesOnRefresh -= 1
				end
			end)
		end
		
		local _ = function(): number
			-- upvalues: Count (ref)
			Count += 1
			
			return Count
		end
		
		return {
			refreshSession = function(Callback): boolean
				-- upvalues: p1 (copy), CasSessionId (ref), HistoryPageUtilsModule (upval), loadHistoryPage (copy), ConstantsModule (upval), commitRefreshedHistory (copy), Count (ref)
				local CasSessionId1 = p1.getCasSessionId()
				
				if CasSessionId1 == nil or CasSessionId1 == "" then
					return false
				end
				local RefreshGeneration = p1.getRefreshGeneration()
				local Flag = nil
				repeat
					if p1.getHistoryLoadInFlight() then
						if CasSessionId == CasSessionId1 then
							Flag = false
							break
						end
						p1.setHistoryLoadInFlight(false)
						CasSessionId = nil
					end
					CasSessionId = CasSessionId1
					p1.setHistoryLoadInFlight(true)
					Flag = true
				until true
				if not Flag then
					return false
				end
				local MergedHistory = p1.buildMergedHistory()
				local CollectSequenceIdsResult = HistoryPageUtilsModule.collectSequenceIds(MergedHistory)
				local v1 = #MergedHistory > 0
				local NoV29 = not v1
				local t = {}
				local t2 = {}
				local NextHistoryPageToken = nil
				local Count1 = 0
				repeat
					Count1 += 1
					local HistoryPage, HistoryPage2, HistoryPage3 = loadHistoryPage(CasSessionId1, NextHistoryPageToken, Callback)
					if HistoryPage and (not Callback() and (p1.getCasSessionId() == CasSessionId1 and RefreshGeneration == p1.getRefreshGeneration())) then
						if v1 and HistoryPageUtilsModule.historyOverlapsSequenceIds(HistoryPage2, CollectSequenceIdsResult) then
							NoV29 = true
						end
						HistoryPageUtilsModule.appendUniqueHistoryBySequenceId(t, HistoryPage2, t2)
						NextHistoryPageToken = HistoryPage3
					else
						if CasSessionId == CasSessionId1 then
							p1.setHistoryLoadInFlight(false)
							CasSessionId = nil
						end
						return false
					end
				until not v1 or NoV29 or NextHistoryPageToken == nil or ConstantsModule.getMaxReconciliationHistoryPages() <= Count1
				if v1 and NoV29 then
					if HistoryPageUtilsModule.appendUniqueHistoryBySequenceId(t, MergedHistory, t2) > 0 then
						NextHistoryPageToken = p1.getNextHistoryPageToken()
					end
				elseif v1 then
					HistoryPageUtilsModule.appendUniqueHistoryBySequenceId(t, MergedHistory, t2)
				end
				if commitRefreshedHistory(CasSessionId1, RefreshGeneration, t, NextHistoryPageToken, Callback) then
					if CasSessionId == CasSessionId1 then
						p1.setHistoryLoadInFlight(false)
						CasSessionId = nil
					end
					if not v1 and NextHistoryPageToken ~= nil then
						Count += 1
						local Count2: number = Count
						task.defer(function()
							-- upvalues: CasSessionId1 (copy), NextHistoryPageToken (ref), Callback (copy), Count2 (copy), RefreshGeneration (copy), ConstantsModule (upval), p1 (upval), Count (upval), loadHistoryPage (upval)
							local NextHistoryPageToken1 = NextHistoryPageToken
							task.spawn(function()
								-- upvalues: NextHistoryPageToken1 (copy), ConstantsModule (upval), CasSessionId1 (copy), Count2 (copy), RefreshGeneration (copy), Callback (copy), p1 (upval), Count (upval), loadHistoryPage (upval)
								local HistoryPageToken = NextHistoryPageToken1
								local PrefetchHistoryPagesOnRefresh = ConstantsModule.getPrefetchHistoryPagesOnRefresh()
								while PrefetchHistoryPagesOnRefresh > 0 and HistoryPageToken ~= nil do
									if Callback() or (p1.getCasSessionId() ~= CasSessionId1 or RefreshGeneration ~= p1.getRefreshGeneration()) or Count2 ~= Count then break end
									local v2, v3, v4 = loadHistoryPage(CasSessionId1, HistoryPageToken, Callback)
									
									if not v2 or (Callback() or (p1.getCasSessionId() ~= CasSessionId1 or RefreshGeneration ~= p1.getRefreshGeneration()) or Count2 ~= Count) then break end
									p1.mergeHistoryPage(v3, v4)
									HistoryPageToken = v4
									PrefetchHistoryPagesOnRefresh -= 1
								end
							end)
						end)
					end
					return true
				else
					if CasSessionId == CasSessionId1 then
						p1.setHistoryLoadInFlight(false)
						CasSessionId = nil
					end
					return false
				end
			end,
			loadOlderHistory = function(Callback): boolean
				-- upvalues: p1 (copy), CasSessionId (ref), loadHistoryPage (copy), Count (ref), ConstantsModule (upval)
				local CasSessionId1 = p1.getCasSessionId()
				local NextHistoryPageToken = p1.getNextHistoryPageToken()
				
				if CasSessionId1 == nil or NextHistoryPageToken == nil then
					return false
				end
				local RefreshGeneration = p1.getRefreshGeneration()
				local Flag = nil
				repeat
					if p1.getHistoryLoadInFlight() then
						if CasSessionId == CasSessionId1 then
							Flag = false
							break
						end
						p1.setHistoryLoadInFlight(false)
						CasSessionId = nil
					end
					CasSessionId = CasSessionId1
					p1.setHistoryLoadInFlight(true)
					Flag = true
				until true
				if not Flag then
					return false
				end
				local HistoryPage, HistoryPage2, HistoryPage3 = loadHistoryPage(CasSessionId1, NextHistoryPageToken, Callback)
				
				if HistoryPage and (not Callback() and (p1.getCasSessionId() == CasSessionId1 and RefreshGeneration == p1.getRefreshGeneration())) then
					p1.mergeHistoryPage(HistoryPage2, HistoryPage3)
					
					if CasSessionId == CasSessionId1 then
						p1.setHistoryLoadInFlight(false)
						CasSessionId = nil
					end
					if Callback() or (p1.getCasSessionId() ~= CasSessionId1 or RefreshGeneration ~= p1.getRefreshGeneration()) then
						return false
					end
					if HistoryPage3 ~= nil then
						Count += 1
						local Count1: number = Count
						task.defer(function()
							-- upvalues: CasSessionId1 (copy), HistoryPage3 (copy), Callback (copy), Count1 (copy), RefreshGeneration (copy), ConstantsModule (upval), p1 (upval), Count (upval), loadHistoryPage (upval)
							task.spawn(function()
								-- upvalues: HistoryPage3 (copy), ConstantsModule (upval), CasSessionId1 (copy), Count1 (copy), RefreshGeneration (copy), Callback (copy), p1 (upval), Count (upval), loadHistoryPage (upval)
								local HistoryPageToken = HistoryPage3
								local PrefetchHistoryPagesOnRefresh = ConstantsModule.getPrefetchHistoryPagesOnRefresh()
								while PrefetchHistoryPagesOnRefresh > 0 and HistoryPageToken ~= nil do
									if Callback() or (p1.getCasSessionId() ~= CasSessionId1 or RefreshGeneration ~= p1.getRefreshGeneration()) or Count1 ~= Count then break end
									local v2, v3, v4 = loadHistoryPage(CasSessionId1, HistoryPageToken, Callback)
									
									if not v2 or (Callback() or (p1.getCasSessionId() ~= CasSessionId1 or RefreshGeneration ~= p1.getRefreshGeneration()) or Count1 ~= Count) then break end
									p1.mergeHistoryPage(v3, v4)
									HistoryPageToken = v4
									PrefetchHistoryPagesOnRefresh -= 1
								end
							end)
						end)
					end
					return true
				else
					if CasSessionId == CasSessionId1 then
						p1.setHistoryLoadInFlight(false)
						CasSessionId = nil
					end
					return false
				end
			end
		}
	end
}