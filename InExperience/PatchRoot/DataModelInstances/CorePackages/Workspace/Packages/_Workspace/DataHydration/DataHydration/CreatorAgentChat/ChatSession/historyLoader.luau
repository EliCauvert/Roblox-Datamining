local _ = require(script.Parent.Parent.types)
local sessionHistoryMergeModule = require(script.Parent.Parent.sessionHistoryMerge)
local subagentTasksModule = require(script.Parent.Parent.SubagentTasks)
local constantsModule = require(script.Parent.constants)
local historyPageUtilsModule = require(script.Parent.historyPageUtils)
local _ = require(script.Parent.sessionDeps)

local function readSubagentTasks(p0, p1, p2) --[[ line: 41 ]]
	-- upvalues: historyPageUtilsModule (ref), subagentTasksModule (ref)
	local var5 = historyPageUtilsModule.awaitRequestStateCancelled(p0.deps.sessionReadTasks(p1).state, p2)
	
	if p2() or var5.status ~= "succeeded" then
		return
	end
	p0.setSubagentTaskState(subagentTasksModule.fromTasks(if var5.result ~= nil then nil else var5.result.tasks))
end

return {
	createHistoryLoader = function(p3) --[[ line: 51 ]]
		-- upvalues: historyPageUtilsModule (ref), sessionHistoryMergeModule (ref), readSubagentTasks (ref), constantsModule (ref)
		local var6 = 0
		local var7 = nil
		
		local function _(p4) --[[ line: 55 | named "isRefreshGenerationStale" ]]
			-- upvalues: p3 (ref)
			return p4 ~= p3.getRefreshGeneration()
		end
		
		local _ = function(p5) --[[ line: 59 | named "clearHistoryLoadInFlightIfOwned" ]]
			-- upvalues: var7 (write), p3 (ref)
			if var7 == p5 then
				p3.setHistoryLoadInFlight(false)
				var7 = nil
			end
		end
		
		local _ = function(p6) --[[ line: 66 | named "tryAcquireHistoryLoad" ]]
			-- upvalues: p3 (ref), var7 (write)
			if p3.getHistoryLoadInFlight() then
				if var7 == p6 then
					return false
				end
				p3.setHistoryLoadInFlight(false)
				var7 = nil
			end
			var7 = p6
			p3.setHistoryLoadInFlight(true)
			
			return true
		end
		
		local function loadHistoryPage(p7, p8, p9) --[[ line: 79 ]]
			-- upvalues: p3 (ref), historyPageUtilsModule (copy)
			local var10 = historyPageUtilsModule.awaitRequestStateCancelled(p3.deps.sessionLoad(p7, { historyPageToken = p8 }).state, p9)
			
			if p9() or var10.status ~= "succeeded" then
				return false, {}, nil
			end
			return true, historyPageUtilsModule.getSessionLoadHistory(var10.result), historyPageUtilsModule.getNextHistoryPageToken(var10.result)
		end
		
		local _ = function(p10, p11, p12) --[[ line: 97 | named "isSessionLoadStale" ]]
			-- upvalues: p3 (ref)
			return p12() or (if p3.getCasSessionId() == p10 then p11 ~= p3.getRefreshGeneration() else true)
		end
		
		local _ = function(p13, p14, p15, p16) --[[ line: 105 | named "isPrefetchStale" ]]
			-- upvalues: p3 (ref), var6 (write)
			return p16() or (if p3.getCasSessionId() == p13 then p15 ~= p3.getRefreshGeneration() else true) or p14 ~= var6
		end
		
		local function commitRefreshedHistory(p17, p18, p19, p20, p21) --[[ line: 115 ]]
			-- upvalues: p3 (ref), sessionHistoryMergeModule (copy)
			if p21() or (if p3.getCasSessionId() == p17 then p18 ~= p3.getRefreshGeneration() else true) then
				return false
			end
			local t = {}
			local t_1 = {}
			sessionHistoryMergeModule.mergeHistoryIntoMap(t, p19, t_1)
			p3.setLoadedBySequenceId(t)
			p3.setOverlayBySequenceId(t_1)
			p3.setNextHistoryPageToken(p20)
			p3.noteHistorySequenceIds(p19)
			p3.notifyMergedHistoryChanged()
			p3.markHistoryLoaded()
			
			return true
		end
		
		local _ = function(p22, p23) --[[ line: 138 | named "spawnReadSubagentTasks" ]]
			-- upvalues: readSubagentTasks (copy), p3 (ref)
			task.spawn(function() --[[ line: 139 ]]
				-- upvalues: readSubagentTasks (copy), p3 (copy), p22 (ref), p23 (ref)
				readSubagentTasks(p3, p22, p23)
			end)
		end
		
		local _ = function(value, p24, p25, p26, p27) --[[ line: 144 | named "prefetchOlderHistoryPagesInBackground" ]]
			-- upvalues: constantsModule (copy), p3 (ref), var6 (write), loadHistoryPage (ref)
			task.spawn(function() --[[ line: 151 ]]
				-- upvalues: p24 (ref), constantsModule (copy), value (ref), p26 (ref), p27 (ref), p25 (ref), p3 (copy), var6 (copy), loadHistoryPage (copy)
				local var13 = p24
				local prefetchHistoryPagesOnRefresh = constantsModule.getPrefetchHistoryPagesOnRefresh()
				while prefetchHistoryPagesOnRefresh > 0 and var13 ~= nil do
					if not p25() and not (if p3.getCasSessionId() == value then p27 ~= p3.getRefreshGeneration() else true) and p26 == var6 then
						local var15, var16, var17 = loadHistoryPage(value, var13, p25)
						
						if var15 and (not p25() and not (if p3.getCasSessionId() == value then p27 ~= p3.getRefreshGeneration() else true) and p26 == var6) then
							p3.mergeHistoryPage(var16, var17)
							var13 = var17
							prefetchHistoryPagesOnRefresh -= 1
							continue
						end
						return
					end
					return
				end
			end)
		end
		
		local _ = function() --[[ line: 169 | named "beginPrefetchGeneration" ]]
			-- upvalues: var6 (write)
			var6 += 1
			
			return var6
		end
		
		return {
			refreshSession = function(p28) --[[ line: 174 ]]
				-- upvalues: p3 (ref), var7 (write), readSubagentTasks (copy), historyPageUtilsModule (copy), loadHistoryPage (ref), constantsModule (copy), commitRefreshedHistory (ref), var6 (write)
				local casSessionId = p3.getCasSessionId()
				
				if casSessionId == nil or casSessionId == "" then
					return false
				end
				local var20
				local refreshGeneration = p3.getRefreshGeneration()
				
				if p3.getHistoryLoadInFlight() then
					if var7 == casSessionId then
						var20 = false
					else
						p3.setHistoryLoadInFlight(false)
						var7 = nil
					end
					if not var20 then
						return false
					end
					local var29
					task.spawn(function() --[[ line: 139 ]]
						-- upvalues: readSubagentTasks (copy), p3 (copy), casSessionId (ref), p28 (ref)
						readSubagentTasks(p3, casSessionId, p28)
					end)
					local var21 = p3.buildMergedHistory()
					local var22 = historyPageUtilsModule.collectSequenceIds(var21)
					local var23 = #var21 > 0
					local var24 = not var23
					local t = {}
					local t_1 = {}
					local nextHistoryPageToken = nil
					local var28 = 0
					repeat
						var28 += 1
						var29, var30, var31 = loadHistoryPage(casSessionId, nextHistoryPageToken, p28)
						if var29 and (not p28() and not (if p3.getCasSessionId() == casSessionId then refreshGeneration ~= p3.getRefreshGeneration() else true)) then
							if var23 and historyPageUtilsModule.historyOverlapsSequenceIds(var30, var22) then
								var24 = true
							end
							historyPageUtilsModule.appendUniqueHistoryBySequenceId(t, var30, t_1)
							nextHistoryPageToken = var31
						end
						if var7 == casSessionId then
							p3.setHistoryLoadInFlight(false)
							var7 = nil
						end
						return false
					until not (var23 and not var24 and (nextHistoryPageToken ~= nil and constantsModule.getMaxReconciliationHistoryPages() > var28))
					if var23 and var24 then
						if historyPageUtilsModule.appendUniqueHistoryBySequenceId(t, var21, t_1) > 0 then
							nextHistoryPageToken = p3.getNextHistoryPageToken()
						end
					elseif var23 then
						historyPageUtilsModule.appendUniqueHistoryBySequenceId(t, var21, t_1)
					end
					if commitRefreshedHistory(casSessionId, refreshGeneration, t, nextHistoryPageToken, p28) then
						if var7 == casSessionId then
							p3.setHistoryLoadInFlight(false)
							var7 = nil
						end
						if not var23 and nextHistoryPageToken ~= nil then
							var6 += 1
							var29 = var6
							task.defer(function() --[[ line: 237 ]]
								-- upvalues: casSessionId (ref), nextHistoryPageToken (write), p28 (ref), var29 (ref), refreshGeneration (ref), constantsModule (copy), p3 (copy), var6 (copy), loadHistoryPage (copy)
								task.spawn(function() --[[ line: 151 ]]
									-- upvalues: nextHistoryPageToken (ref), constantsModule (copy), casSessionId (ref), var29 (ref), refreshGeneration (ref), p28 (ref), p3 (copy), var6 (copy), loadHistoryPage (copy)
									local var13 = nextHistoryPageToken
									local prefetchHistoryPagesOnRefresh = constantsModule.getPrefetchHistoryPagesOnRefresh()
									while true do
										while prefetchHistoryPagesOnRefresh > 0 and var13 ~= nil do
											if not p28() and not (if p3.getCasSessionId() == casSessionId then refreshGeneration ~= p3.getRefreshGeneration() else true) and var29 == var6 then
												local var15, var16, var17 = loadHistoryPage(casSessionId, var13, p28)
												
												if var15 and (not p28() and not (if p3.getCasSessionId() == casSessionId then refreshGeneration ~= p3.getRefreshGeneration() else true) and var29 == var6) then
													p3.mergeHistoryPage(var16, var17)
													var13 = var17
													prefetchHistoryPagesOnRefresh -= 1
													continue
													continue
												end
												return
											end
											return
										end
									end
								end)
							end)
						end
						return true
					elseif var7 == casSessionId then
						p3.setHistoryLoadInFlight(false)
						var7 = nil
					end
					return false
				end
				var7 = casSessionId
				p3.setHistoryLoadInFlight(true)
				var20 = true
			end,
			loadOlderHistory = function(p29) --[[ line: 251 ]]
				-- upvalues: p3 (ref), var7 (write), readSubagentTasks (copy), loadHistoryPage (ref), var6 (write), constantsModule (copy)
				local casSessionId = p3.getCasSessionId()
				local nextHistoryPageToken = p3.getNextHistoryPageToken()
				
				if casSessionId == nil or nextHistoryPageToken == nil then
					return false
				end
				local var35
				local refreshGeneration = p3.getRefreshGeneration()
				
				if p3.getHistoryLoadInFlight() then
					if var7 == casSessionId then
						var35 = false
					else
						p3.setHistoryLoadInFlight(false)
						var7 = nil
					end
					if not var35 then
						return false
					end
					task.spawn(function() --[[ line: 139 ]]
						-- upvalues: readSubagentTasks (copy), p3 (copy), casSessionId (ref), p29 (ref)
						readSubagentTasks(p3, casSessionId, p29)
					end)
					local var36, var37, var38 = loadHistoryPage(casSessionId, nextHistoryPageToken, p29)
					
					if var36 and (not p29() and not (if p3.getCasSessionId() == casSessionId then refreshGeneration ~= p3.getRefreshGeneration() else true)) then
						p3.mergeHistoryPage(var37, var38)
						
						if var7 == casSessionId then
							p3.setHistoryLoadInFlight(false)
							var7 = nil
						end
						if p29() or (if p3.getCasSessionId() == casSessionId then refreshGeneration ~= p3.getRefreshGeneration() else true) then
							return false
						elseif var38 ~= nil then
							var6 += 1
							local var39 = var6
							task.defer(function() --[[ line: 279 ]]
								-- upvalues: casSessionId (ref), var38 (ref), p29 (ref), var39 (ref), refreshGeneration (ref), constantsModule (copy), p3 (copy), var6 (copy), loadHistoryPage (copy)
								task.spawn(function() --[[ line: 151 ]]
									-- upvalues: var38 (ref), constantsModule (copy), casSessionId (ref), var39 (ref), refreshGeneration (ref), p29 (ref), p3 (copy), var6 (copy), loadHistoryPage (copy)
									local var13 = var38
									local prefetchHistoryPagesOnRefresh = constantsModule.getPrefetchHistoryPagesOnRefresh()
									while true do
										while prefetchHistoryPagesOnRefresh > 0 and var13 ~= nil do
											if not p29() and not (if p3.getCasSessionId() == casSessionId then refreshGeneration ~= p3.getRefreshGeneration() else true) and var39 == var6 then
												local var15, var16, var17 = loadHistoryPage(casSessionId, var13, p29)
												
												if var15 and (not p29() and not (if p3.getCasSessionId() == casSessionId then refreshGeneration ~= p3.getRefreshGeneration() else true) and var39 == var6) then
													p3.mergeHistoryPage(var16, var17)
													var13 = var17
													prefetchHistoryPagesOnRefresh -= 1
													continue
													continue
													continue
												end
												return
											end
											return
										end
									end
								end)
							end)
						end
						return true
					elseif var7 == casSessionId then
						p3.setHistoryLoadInFlight(false)
						var7 = nil
					end
					return false
				end
				var7 = casSessionId
				p3.setHistoryLoadInFlight(true)
				var35 = true
			end
		}
	end
}