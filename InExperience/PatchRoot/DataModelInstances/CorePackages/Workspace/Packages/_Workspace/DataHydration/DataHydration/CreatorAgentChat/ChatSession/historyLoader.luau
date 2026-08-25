local _ = require(script.Parent.Parent.types)
local sessionHistoryMergeModule = require(script.Parent.Parent.sessionHistoryMerge)
local constantsModule = require(script.Parent.constants)
local historyPageUtilsModule = require(script.Parent.historyPageUtils)
local _ = require(script.Parent.sessionDeps)

return {
	createHistoryLoader = function(p0)
		-- upvalues: historyPageUtilsModule (ref), sessionHistoryMergeModule (ref), constantsModule (ref)
		local var3 = 0
		local var4 = nil
		
		local function _(p1)
			-- upvalues: p0 (ref)
			return p1 ~= p0.getRefreshGeneration()
		end
		
		local _ = function(p2)
			-- upvalues: var4 (write), p0 (ref)
			if var4 == p2 then
				p0.setHistoryLoadInFlight(false)
				var4 = nil
			end
		end
		
		local _ = function(p3)
			-- upvalues: p0 (ref), var4 (write)
			if p0.getHistoryLoadInFlight() then
				if var4 == p3 then
					return false
				end
				p0.setHistoryLoadInFlight(false)
				var4 = nil
			end
			var4 = p3
			p0.setHistoryLoadInFlight(true)
			
			return true
		end
		
		local function loadHistoryPage(p4, p5, p6)
			-- upvalues: p0 (ref), historyPageUtilsModule (copy)
			local var7 = historyPageUtilsModule.awaitRequestStateCancelled(p0.deps.sessionLoad(p4, { historyPageToken = p5 }).state, p6)
			
			if p6() or var7.status ~= "succeeded" then
				return false, {}, nil
			end
			return true, historyPageUtilsModule.getSessionLoadHistory(var7.result), historyPageUtilsModule.getNextHistoryPageToken(var7.result)
		end
		
		local _ = function(p7, p8, p9)
			-- upvalues: p0 (ref)
			return p9() or (if p0.getCasSessionId() == p7 then p8 ~= p0.getRefreshGeneration() else true)
		end
		
		local _ = function(p10, p11, p12, p13)
			-- upvalues: p0 (ref), var3 (write)
			return p13() or (if p0.getCasSessionId() == p10 then p12 ~= p0.getRefreshGeneration() else true) or p11 ~= var3
		end
		
		local function commitRefreshedHistory(p14, p15, p16, p17, p18)
			-- upvalues: p0 (ref), sessionHistoryMergeModule (copy)
			if p18() or (if p0.getCasSessionId() == p14 then p15 ~= p0.getRefreshGeneration() else true) then
				return false
			end
			local t = {}
			local t_1 = {}
			sessionHistoryMergeModule.mergeHistoryIntoMap(t, p16, t_1)
			
			for i, v in p0.getOverlayBySequenceId() do
				if t[i] == nil then
					t_1[i] = v
				end
			end
			p0.setLoadedBySequenceId(t)
			p0.setOverlayBySequenceId(t_1)
			p0.setNextHistoryPageToken(p17)
			p0.noteHistorySequenceIds(p16)
			p0.notifyMergedHistoryChanged()
			p0.markHistoryLoaded()
			
			return true
		end
		
		local _ = function(value, p19, p20, p21, p22)
			-- upvalues: constantsModule (copy), p0 (ref), var3 (write), loadHistoryPage (ref)
			task.spawn(function()
				-- upvalues: p19 (ref), constantsModule (copy), value (ref), p21 (ref), p22 (ref), p20 (ref), p0 (copy), var3 (copy), loadHistoryPage (copy)
				local var10 = p19
				local prefetchHistoryPagesOnRefresh = constantsModule.getPrefetchHistoryPagesOnRefresh()
				while prefetchHistoryPagesOnRefresh > 0 and var10 ~= nil do
					if not p20() and not (if p0.getCasSessionId() == value then p22 ~= p0.getRefreshGeneration() else true) and p21 == var3 then
						local var12, var13, var14 = loadHistoryPage(value, var10, p20)
						
						if var12 and (not p20() and not (if p0.getCasSessionId() == value then p22 ~= p0.getRefreshGeneration() else true) and p21 == var3) then
							p0.mergeHistoryPage(var13, var14)
							var10 = var14
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
			-- upvalues: var3 (write)
			var3 += 1
			
			return var3
		end
		
		return {
			refreshSession = function(p23)
				-- upvalues: p0 (ref), var4 (write), historyPageUtilsModule (copy), loadHistoryPage (ref), constantsModule (copy), commitRefreshedHistory (ref), var3 (write)
				local casSessionId = p0.getCasSessionId()
				
				if casSessionId == nil or casSessionId == "" then
					return false
				end
				local var17
				local refreshGeneration = p0.getRefreshGeneration()
				
				if p0.getHistoryLoadInFlight() then
					if var4 == casSessionId then
						var17 = false
					else
						p0.setHistoryLoadInFlight(false)
						var4 = nil
					end
					if not var17 then
						return false
					end
					local var26
					local var18 = p0.buildMergedHistory()
					local var19 = historyPageUtilsModule.collectSequenceIds(var18)
					local var20 = #var18 > 0
					local var21 = not var20
					local t = {}
					local t_1 = {}
					local nextHistoryPageToken = nil
					local var25 = 0
					repeat
						var25 += 1
						var26, var27, var28 = loadHistoryPage(casSessionId, nextHistoryPageToken, p23)
						if var26 and (not p23() and not (if p0.getCasSessionId() == casSessionId then refreshGeneration ~= p0.getRefreshGeneration() else true)) then
							if var20 and historyPageUtilsModule.historyOverlapsSequenceIds(var27, var19) then
								var21 = true
							end
							historyPageUtilsModule.appendUniqueHistoryBySequenceId(t, var27, t_1)
							nextHistoryPageToken = var28
						end
						if var4 == casSessionId then
							p0.setHistoryLoadInFlight(false)
							var4 = nil
						end
						return false
					until not (var20 and not var21 and (nextHistoryPageToken ~= nil and constantsModule.getMaxReconciliationHistoryPages() > var25))
					if var20 and var21 then
						if historyPageUtilsModule.appendUniqueHistoryBySequenceId(t, var18, t_1) > 0 then
							nextHistoryPageToken = p0.getNextHistoryPageToken()
						end
					elseif var20 then
						historyPageUtilsModule.appendUniqueHistoryBySequenceId(t, var18, t_1)
					end
					if commitRefreshedHistory(casSessionId, refreshGeneration, t, nextHistoryPageToken, p23) then
						if var4 == casSessionId then
							p0.setHistoryLoadInFlight(false)
							var4 = nil
						end
						if not var20 and nextHistoryPageToken ~= nil then
							var3 += 1
							var26 = var3
							task.defer(function()
								-- upvalues: casSessionId (ref), nextHistoryPageToken (write), p23 (ref), var26 (ref), refreshGeneration (ref), constantsModule (copy), p0 (copy), var3 (copy), loadHistoryPage (copy)
								task.spawn(function()
									-- upvalues: nextHistoryPageToken (ref), constantsModule (copy), casSessionId (ref), var26 (ref), refreshGeneration (ref), p23 (ref), p0 (copy), var3 (copy), loadHistoryPage (copy)
									local var10 = nextHistoryPageToken
									local prefetchHistoryPagesOnRefresh = constantsModule.getPrefetchHistoryPagesOnRefresh()
									while true do
										while prefetchHistoryPagesOnRefresh > 0 and var10 ~= nil do
											if not p23() and not (if p0.getCasSessionId() == casSessionId then refreshGeneration ~= p0.getRefreshGeneration() else true) and var26 == var3 then
												local var12, var13, var14 = loadHistoryPage(casSessionId, var10, p23)
												
												if var12 and (not p23() and not (if p0.getCasSessionId() == casSessionId then refreshGeneration ~= p0.getRefreshGeneration() else true) and var26 == var3) then
													p0.mergeHistoryPage(var13, var14)
													var10 = var14
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
					elseif var4 == casSessionId then
						p0.setHistoryLoadInFlight(false)
						var4 = nil
					end
					return false
				end
				var4 = casSessionId
				p0.setHistoryLoadInFlight(true)
				var17 = true
			end,
			loadOlderHistory = function(p24)
				-- upvalues: p0 (ref), var4 (write), loadHistoryPage (ref), var3 (write), constantsModule (copy)
				local casSessionId = p0.getCasSessionId()
				local nextHistoryPageToken = p0.getNextHistoryPageToken()
				
				if casSessionId == nil or nextHistoryPageToken == nil then
					return false
				end
				local var32
				local refreshGeneration = p0.getRefreshGeneration()
				
				if p0.getHistoryLoadInFlight() then
					if var4 == casSessionId then
						var32 = false
					else
						p0.setHistoryLoadInFlight(false)
						var4 = nil
					end
					if not var32 then
						return false
					end
					local var33, var34, var35 = loadHistoryPage(casSessionId, nextHistoryPageToken, p24)
					
					if var33 and (not p24() and not (if p0.getCasSessionId() == casSessionId then refreshGeneration ~= p0.getRefreshGeneration() else true)) then
						p0.mergeHistoryPage(var34, var35)
						
						if var4 == casSessionId then
							p0.setHistoryLoadInFlight(false)
							var4 = nil
						end
						if p24() or (if p0.getCasSessionId() == casSessionId then refreshGeneration ~= p0.getRefreshGeneration() else true) then
							return false
						elseif var35 ~= nil then
							var3 += 1
							local var36 = var3
							task.defer(function()
								-- upvalues: casSessionId (ref), var35 (ref), p24 (ref), var36 (ref), refreshGeneration (ref), constantsModule (copy), p0 (copy), var3 (copy), loadHistoryPage (copy)
								task.spawn(function()
									-- upvalues: var35 (ref), constantsModule (copy), casSessionId (ref), var36 (ref), refreshGeneration (ref), p24 (ref), p0 (copy), var3 (copy), loadHistoryPage (copy)
									local var10 = var35
									local prefetchHistoryPagesOnRefresh = constantsModule.getPrefetchHistoryPagesOnRefresh()
									while true do
										while prefetchHistoryPagesOnRefresh > 0 and var10 ~= nil do
											if not p24() and not (if p0.getCasSessionId() == casSessionId then refreshGeneration ~= p0.getRefreshGeneration() else true) and var36 == var3 then
												local var12, var13, var14 = loadHistoryPage(casSessionId, var10, p24)
												
												if var12 and (not p24() and not (if p0.getCasSessionId() == casSessionId then refreshGeneration ~= p0.getRefreshGeneration() else true) and var36 == var3) then
													p0.mergeHistoryPage(var13, var14)
													var10 = var14
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
					elseif var4 == casSessionId then
						p0.setHistoryLoadInFlight(false)
						var4 = nil
					end
					return false
				end
				var4 = casSessionId
				p0.setHistoryLoadInFlight(true)
				var32 = true
			end
		}
	end
}