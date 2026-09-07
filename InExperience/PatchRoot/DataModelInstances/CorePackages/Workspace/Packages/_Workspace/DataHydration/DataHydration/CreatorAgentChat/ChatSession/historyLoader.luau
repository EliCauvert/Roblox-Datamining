local _ = require(script.Parent.Parent.types)
local sessionHistoryMergeModule = require(script.Parent.Parent.sessionHistoryMerge)
local constantsModule = require(script.Parent.constants)
local historyPageUtilsModule = require(script.Parent.historyPageUtils)
local _ = require(script.Parent.sessionDeps)

return {
	createHistoryLoader = function(p1)
		-- upvalues: historyPageUtilsModule (ref), sessionHistoryMergeModule (ref), constantsModule (ref)
		local var1 = 0
		local var2 = nil
		
		local function _(p2)
			-- upvalues: p1 (ref)
			return p2 ~= p1.getRefreshGeneration()
		end
		
		local _ = function(p2)
			-- upvalues: var2 (write), p1 (ref)
			if var2 == p2 then
				p1.setHistoryLoadInFlight(false)
				var2 = nil
			end
		end
		
		local _ = function(p2)
			-- upvalues: p1 (ref), var2 (write)
			if p1.getHistoryLoadInFlight() then
				if var2 == p2 then
					return false
				end
				p1.setHistoryLoadInFlight(false)
				var2 = nil
			end
			var2 = p2
			p1.setHistoryLoadInFlight(true)
			
			return true
		end
		
		local function loadHistoryPage(p2, p3, p4)
			-- upvalues: p1 (ref), historyPageUtilsModule (copy)
			local var3 = historyPageUtilsModule.awaitRequestStateCancelled(p1.deps.sessionLoad(p2, { historyPageToken = p3 }).state, p4)
			
			if p4() or var3.status ~= "succeeded" then
				return false, {}, nil
			end
			return true, historyPageUtilsModule.getSessionLoadHistory(var3.result), historyPageUtilsModule.getNextHistoryPageToken(var3.result)
		end
		
		local _ = function(p2, p3, p4)
			-- upvalues: p1 (ref)
			return p4() or (if p1.getCasSessionId() == p2 then p3 ~= p1.getRefreshGeneration() else true)
		end
		
		local _ = function(p2, p3, p4, p5)
			-- upvalues: p1 (ref), var1 (write)
			return p5() or (if p1.getCasSessionId() == p2 then p4 ~= p1.getRefreshGeneration() else true) or p3 ~= var1
		end
		
		local function commitRefreshedHistory(p2, p3, p4, p5, p6)
			-- upvalues: p1 (ref), sessionHistoryMergeModule (copy)
			if p6() or (if p1.getCasSessionId() == p2 then p3 ~= p1.getRefreshGeneration() else true) then
				return false
			end
			local t = {}
			local t_1 = {}
			sessionHistoryMergeModule.mergeHistoryIntoMap(t, p4, t_1)
			
			for i, v in p1.getOverlayBySequenceId() do
				if t[i] == nil then
					t_1[i] = v
				end
			end
			p1.setLoadedBySequenceId(t)
			p1.setOverlayBySequenceId(t_1)
			p1.setNextHistoryPageToken(p5)
			p1.noteHistorySequenceIds(p4)
			p1.notifyMergedHistoryChanged()
			p1.markHistoryLoaded()
			
			return true
		end
		
		local _ = function(value, p7, p8, p9, p10)
			-- upvalues: constantsModule (copy), p1 (ref), var1 (write), loadHistoryPage (ref)
			task.spawn(function()
				-- upvalues: p7 (ref), constantsModule (copy), value (ref), p9 (ref), p10 (ref), p8 (ref), p1 (copy), var1 (copy), loadHistoryPage (copy)
				local var3 = p7
				local prefetchHistoryPagesOnRefresh = constantsModule.getPrefetchHistoryPagesOnRefresh()
				while prefetchHistoryPagesOnRefresh > 0 and var3 ~= nil do
					if not p8() and not (if p1.getCasSessionId() == value then p10 ~= p1.getRefreshGeneration() else true) and p9 == var1 then
						local var4, var5, var6 = loadHistoryPage(value, var3, p8)
						
						if var4 and (not p8() and not (if p1.getCasSessionId() == value then p10 ~= p1.getRefreshGeneration() else true) and p9 == var1) then
							p1.mergeHistoryPage(var5, var6)
							var3 = var6
							prefetchHistoryPagesOnRefresh -= 1
							continue
						end
						return
					end
					return
				end
			end)
		end
		
		local _ = function()
			-- upvalues: var1 (write)
			var1 += 1
			
			return var1
		end
		
		return {
			refreshSession = function(p11)
				-- upvalues: p1 (ref), var2 (write), historyPageUtilsModule (copy), loadHistoryPage (ref), constantsModule (copy), commitRefreshedHistory (ref), var1 (write)
				local casSessionId = p1.getCasSessionId()
				
				if casSessionId == nil or casSessionId == "" then
					return false
				end
				local var3
				local refreshGeneration = p1.getRefreshGeneration()
				
				if p1.getHistoryLoadInFlight() then
					if var2 == casSessionId then
						var3 = false
					else
						p1.setHistoryLoadInFlight(false)
						var2 = nil
					end
					if not var3 then
						return false
					end
					local var4
					local var5 = p1.buildMergedHistory()
					local var6 = historyPageUtilsModule.collectSequenceIds(var5)
					local var7 = #var5 > 0
					local var8 = not var7
					local t = {}
					local t_1 = {}
					local nextHistoryPageToken = nil
					local var9 = 0
					repeat
						var9 += 1
						var4, var27, var28 = loadHistoryPage(casSessionId, nextHistoryPageToken, p11)
						if var4 and (not p11() and not (if p1.getCasSessionId() == casSessionId then refreshGeneration ~= p1.getRefreshGeneration() else true)) then
							if var7 and historyPageUtilsModule.historyOverlapsSequenceIds(var27, var6) then
								var8 = true
							end
							historyPageUtilsModule.appendUniqueHistoryBySequenceId(t, var27, t_1)
							nextHistoryPageToken = var28
						end
						if var2 == casSessionId then
							p1.setHistoryLoadInFlight(false)
							var2 = nil
						end
						return false
					until not (var7 and not var8 and (nextHistoryPageToken ~= nil and constantsModule.getMaxReconciliationHistoryPages() > var9))
					if var7 and var8 then
						if historyPageUtilsModule.appendUniqueHistoryBySequenceId(t, var5, t_1) > 0 then
							nextHistoryPageToken = p1.getNextHistoryPageToken()
						end
					elseif var7 then
						historyPageUtilsModule.appendUniqueHistoryBySequenceId(t, var5, t_1)
					end
					if commitRefreshedHistory(casSessionId, refreshGeneration, t, nextHistoryPageToken, p11) then
						if var2 == casSessionId then
							p1.setHistoryLoadInFlight(false)
							var2 = nil
						end
						if not var7 and nextHistoryPageToken ~= nil then
							var1 += 1
							var4 = var1
							task.defer(function()
								-- upvalues: casSessionId (ref), nextHistoryPageToken (write), p11 (ref), var4 (ref), refreshGeneration (ref), constantsModule (copy), p1 (copy), var1 (copy), loadHistoryPage (copy)
								task.spawn(function()
									-- upvalues: nextHistoryPageToken (ref), constantsModule (copy), casSessionId (ref), var4 (ref), refreshGeneration (ref), p11 (ref), p1 (copy), var1 (copy), loadHistoryPage (copy)
									local var10 = nextHistoryPageToken
									local prefetchHistoryPagesOnRefresh = constantsModule.getPrefetchHistoryPagesOnRefresh()
									while true do
										while prefetchHistoryPagesOnRefresh > 0 and var10 ~= nil do
											if not p11() and not (if p1.getCasSessionId() == casSessionId then refreshGeneration ~= p1.getRefreshGeneration() else true) and var4 == var1 then
												local var11, var12, var13 = loadHistoryPage(casSessionId, var10, p11)
												
												if var11 and (not p11() and not (if p1.getCasSessionId() == casSessionId then refreshGeneration ~= p1.getRefreshGeneration() else true) and var4 == var1) then
													p1.mergeHistoryPage(var12, var13)
													var10 = var13
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
					elseif var2 == casSessionId then
						p1.setHistoryLoadInFlight(false)
						var2 = nil
					end
					return false
				end
				var2 = casSessionId
				p1.setHistoryLoadInFlight(true)
				var3 = true
			end,
			loadOlderHistory = function(p12)
				-- upvalues: p1 (ref), var2 (write), loadHistoryPage (ref), var1 (write), constantsModule (copy)
				local casSessionId = p1.getCasSessionId()
				local nextHistoryPageToken = p1.getNextHistoryPageToken()
				
				if casSessionId == nil or nextHistoryPageToken == nil then
					return false
				end
				local var10
				local refreshGeneration = p1.getRefreshGeneration()
				
				if p1.getHistoryLoadInFlight() then
					if var2 == casSessionId then
						var10 = false
					else
						p1.setHistoryLoadInFlight(false)
						var2 = nil
					end
					if not var10 then
						return false
					end
					local var11, var12, var13 = loadHistoryPage(casSessionId, nextHistoryPageToken, p12)
					
					if var11 and (not p12() and not (if p1.getCasSessionId() == casSessionId then refreshGeneration ~= p1.getRefreshGeneration() else true)) then
						p1.mergeHistoryPage(var12, var13)
						
						if var2 == casSessionId then
							p1.setHistoryLoadInFlight(false)
							var2 = nil
						end
						if p12() or (if p1.getCasSessionId() == casSessionId then refreshGeneration ~= p1.getRefreshGeneration() else true) then
							return false
						elseif var13 ~= nil then
							var1 += 1
							local var14 = var1
							task.defer(function()
								-- upvalues: casSessionId (ref), var13 (ref), p12 (ref), var14 (ref), refreshGeneration (ref), constantsModule (copy), p1 (copy), var1 (copy), loadHistoryPage (copy)
								task.spawn(function()
									-- upvalues: var13 (ref), constantsModule (copy), casSessionId (ref), var14 (ref), refreshGeneration (ref), p12 (ref), p1 (copy), var1 (copy), loadHistoryPage (copy)
									local var15 = var13
									local prefetchHistoryPagesOnRefresh = constantsModule.getPrefetchHistoryPagesOnRefresh()
									while true do
										while prefetchHistoryPagesOnRefresh > 0 and var15 ~= nil do
											if not p12() and not (if p1.getCasSessionId() == casSessionId then refreshGeneration ~= p1.getRefreshGeneration() else true) and var14 == var1 then
												local var16, var17, var18 = loadHistoryPage(casSessionId, var15, p12)
												
												if var16 and (not p12() and not (if p1.getCasSessionId() == casSessionId then refreshGeneration ~= p1.getRefreshGeneration() else true) and var14 == var1) then
													p1.mergeHistoryPage(var17, var18)
													var15 = var18
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
					elseif var2 == casSessionId then
						p1.setHistoryLoadInFlight(false)
						var2 = nil
					end
					return false
				end
				var2 = casSessionId
				p1.setHistoryLoadInFlight(true)
				var10 = true
			end
		}
	end
}