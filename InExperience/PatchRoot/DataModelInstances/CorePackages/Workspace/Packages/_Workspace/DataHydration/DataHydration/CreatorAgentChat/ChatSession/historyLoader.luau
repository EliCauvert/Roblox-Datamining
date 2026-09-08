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
		local var3 = nil
		
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
			local var4 = historyPageUtilsModule.awaitRequestStateCancelled(p1.deps.sessionLoad(p2, { historyPageToken = p3 }).state, p4)
			
			if p4() or var4.status ~= "succeeded" then
				return false, {}, nil
			end
			return true, historyPageUtilsModule.getSessionLoadHistory(var4.result), historyPageUtilsModule.getNextHistoryPageToken(var4.result)
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
				local var4 = p7
				local prefetchHistoryPagesOnRefresh = constantsModule.getPrefetchHistoryPagesOnRefresh()
				while prefetchHistoryPagesOnRefresh > 0 and var4 ~= nil do
					if not p8() and not (if p1.getCasSessionId() == value then p10 ~= p1.getRefreshGeneration() else true) and p9 == var1 then
						local var5, var6, var7 = loadHistoryPage(value, var4, p8)
						
						if var5 and (not p8() and not (if p1.getCasSessionId() == value then p10 ~= p1.getRefreshGeneration() else true) and p9 == var1) then
							p1.mergeHistoryPage(var6, var7)
							var4 = var7
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
		
		local var4 = nil
		
		local function refreshSession(p11, p12)
			-- upvalues: p1 (ref), var2 (write), historyPageUtilsModule (copy), loadHistoryPage (ref), constantsModule (copy), commitRefreshedHistory (ref), var4 (write), var1 (write)
			local casSessionId = p1.getCasSessionId()
			
			if casSessionId == nil or casSessionId == "" then
				return false
			end
			local var5
			local refreshGeneration = p1.getRefreshGeneration()
			
			if p1.getHistoryLoadInFlight() then
				if var2 == casSessionId then
					var5 = false
				else
					p1.setHistoryLoadInFlight(false)
					var2 = nil
				end
				if not var5 then
					return false
				end
				local var6
				local var7 = p1.buildMergedHistory()
				local var8 = historyPageUtilsModule.collectSequenceIds(var7)
				local var9 = #var7 > 0
				local var10 = not var9
				local t = {}
				local t_1 = {}
				local nextHistoryPageToken = nil
				local var11 = 0
				repeat
					var11 += 1
					var6, var31, var32 = loadHistoryPage(casSessionId, nextHistoryPageToken, p11)
					if var6 and (not p11() and not (if p1.getCasSessionId() == casSessionId then refreshGeneration ~= p1.getRefreshGeneration() else true)) then
						if var9 and historyPageUtilsModule.historyOverlapsSequenceIds(var31, var8) then
							var10 = true
						end
						historyPageUtilsModule.appendUniqueHistoryBySequenceId(t, var31, t_1)
						nextHistoryPageToken = var32
					end
					if var2 == casSessionId then
						p1.setHistoryLoadInFlight(false)
						var2 = nil
					end
					return false
				until not (var9 and not var10 and (nextHistoryPageToken ~= nil and constantsModule.getMaxReconciliationHistoryPages() > var11))
				if var9 and var10 then
					if historyPageUtilsModule.appendUniqueHistoryBySequenceId(t, var7, t_1) > 0 then
						nextHistoryPageToken = p1.getNextHistoryPageToken()
					end
				elseif var9 then
					historyPageUtilsModule.appendUniqueHistoryBySequenceId(t, var7, t_1)
				end
				if commitRefreshedHistory(casSessionId, refreshGeneration, t, nextHistoryPageToken, p11) then
					if var2 == casSessionId then
						p1.setHistoryLoadInFlight(false)
						var2 = nil
					end
					if not var9 and nextHistoryPageToken ~= nil then
						if p12 then
							var4(constantsModule.getPrefetchHistoryPagesOnRefresh(), p11, nil)
						else
							var1 += 1
							var6 = var1
							task.defer(function()
								-- upvalues: casSessionId (ref), nextHistoryPageToken (write), p11 (ref), var6 (ref), refreshGeneration (ref), constantsModule (copy), p1 (copy), var1 (copy), loadHistoryPage (copy)
								task.spawn(function()
									-- upvalues: nextHistoryPageToken (ref), constantsModule (copy), casSessionId (ref), var6 (ref), refreshGeneration (ref), p11 (ref), p1 (copy), var1 (copy), loadHistoryPage (copy)
									local var12 = nextHistoryPageToken
									local prefetchHistoryPagesOnRefresh = constantsModule.getPrefetchHistoryPagesOnRefresh()
									while true do
										while prefetchHistoryPagesOnRefresh > 0 and var12 ~= nil do
											if not p11() and not (if p1.getCasSessionId() == casSessionId then refreshGeneration ~= p1.getRefreshGeneration() else true) and var6 == var1 then
												local var13, var14, var15 = loadHistoryPage(casSessionId, var12, p11)
												
												if var13 and (not p11() and not (if p1.getCasSessionId() == casSessionId then refreshGeneration ~= p1.getRefreshGeneration() else true) and var6 == var1) then
													p1.mergeHistoryPage(var14, var15)
													var12 = var15
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
			var5 = true
		end
		
		local function loadOlderHistoryPage(p13)
			-- upvalues: p1 (ref), var2 (write), loadHistoryPage (ref)
			local casSessionId = p1.getCasSessionId()
			local nextHistoryPageToken = p1.getNextHistoryPageToken()
			
			if casSessionId == nil or nextHistoryPageToken == nil then
				return false, nil, nil, nil
			end
			local var12
			local refreshGeneration = p1.getRefreshGeneration()
			
			if p1.getHistoryLoadInFlight() then
				if var2 == casSessionId then
					var12 = false
				else
					p1.setHistoryLoadInFlight(false)
					var2 = nil
				end
				if not var12 then
					return false, nil, nil, nil
				end
				local var13, var14, var15 = loadHistoryPage(casSessionId, nextHistoryPageToken, p13)
				
				if var13 and (not p13() and not (if p1.getCasSessionId() == casSessionId then refreshGeneration ~= p1.getRefreshGeneration() else true)) then
					p1.mergeHistoryPage(var14, var15)
					
					if var2 == casSessionId then
						p1.setHistoryLoadInFlight(false)
						var2 = nil
					end
					if p13() or (if p1.getCasSessionId() == casSessionId then refreshGeneration ~= p1.getRefreshGeneration() else true) then
						return false, nil, nil, nil
					end
					return true, casSessionId, refreshGeneration, var15
				elseif var2 == casSessionId then
					p1.setHistoryLoadInFlight(false)
					var2 = nil
				end
				return false, nil, nil, nil
			end
			var2 = casSessionId
			p1.setHistoryLoadInFlight(true)
			var12 = true
		end
		
		var4 = function(p13, p14, p15)
			-- upvalues: p1 (ref), var3 (write), loadOlderHistoryPage (ref)
			local casSessionId = p1.getCasSessionId()
			
			if casSessionId == nil or p1.getNextHistoryPageToken() == nil then return end
			local refreshGeneration = p1.getRefreshGeneration()
			
			if var3 == nil or var3.sessionId ~= casSessionId or var3.refreshGeneration ~= refreshGeneration then
				local t = {
					sessionId = casSessionId,
					refreshGeneration = refreshGeneration,
					minimumPagesRemaining = p13,
					isCancelled = p14,
					shouldContinue = p15
				}
				var3 = t
				task.defer(function()
					-- upvalues: t (ref), p1 (copy), loadOlderHistoryPage (copy), var3 (copy)
					local ok, status = xpcall(function()
						-- upvalues: t (copy), p1 (copy), loadOlderHistoryPage (copy), var3 (copy)
						while not t.isCancelled() and not (if p1.getCasSessionId() == t.sessionId then t.refreshGeneration ~= p1.getRefreshGeneration() else true) and p1.getNextHistoryPageToken() ~= nil do
							if not (if t.minimumPagesRemaining <= 0 then t.shouldContinue ~= nil and t.shouldContinue() else true) or not loadOlderHistoryPage(function()
								-- upvalues: t (copy), var3 (copy)
								return t.isCancelled() or var3 ~= t
							end) then break end
							if t.minimumPagesRemaining > 0 then
								t.minimumPagesRemaining -= 1
							end
							task.wait()
						end
					end, debug.traceback)
					
					if var3 == t then
						var3 = nil
					end
					if not ok then
						error(status)
					end
				end)
				
				return
			end
			var3.minimumPagesRemaining = math.max(var3.minimumPagesRemaining, p13)
			var3.isCancelled = p14
			
			if p15 ~= nil then
				var3.shouldContinue = p15
			end
		end
		
		return {
			refreshSession = refreshSession,
			loadOlderHistory = function(p16)
				-- upvalues: loadOlderHistoryPage (ref), var1 (write), constantsModule (copy), p1 (ref), loadHistoryPage (ref)
				local var12, var13, var14, var15 = loadOlderHistoryPage(p16)
				
				if var12 and var13 ~= nil and (var14 ~= nil and var15 ~= nil) then
					var1 += 1
					local var16 = var1
					task.defer(function()
						-- upvalues: var13 (ref), var15 (ref), p16 (ref), var16 (ref), var14 (ref), constantsModule (copy), p1 (copy), var1 (copy), loadHistoryPage (copy)
						task.spawn(function()
							-- upvalues: var15 (ref), constantsModule (copy), var13 (ref), var16 (ref), var14 (ref), p16 (ref), p1 (copy), var1 (copy), loadHistoryPage (copy)
							local var17 = var15
							local prefetchHistoryPagesOnRefresh = constantsModule.getPrefetchHistoryPagesOnRefresh()
							while true do
								while prefetchHistoryPagesOnRefresh > 0 and var17 ~= nil do
									if not p16() and not (if p1.getCasSessionId() == var13 then var14 ~= p1.getRefreshGeneration() else true) and var16 == var1 then
										local var18, var19, var20 = loadHistoryPage(var13, var17, p16)
										
										if var18 and (not p16() and not (if p1.getCasSessionId() == var13 then var14 ~= p1.getRefreshGeneration() else true) and var16 == var1) then
											p1.mergeHistoryPage(var19, var20)
											var17 = var20
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
				return var12
			end,
			requestOlderHistoryWhile = function(p17, p18)
				-- upvalues: var4 (write)
				var4(0, p17, p18)
			end
		}
	end
}