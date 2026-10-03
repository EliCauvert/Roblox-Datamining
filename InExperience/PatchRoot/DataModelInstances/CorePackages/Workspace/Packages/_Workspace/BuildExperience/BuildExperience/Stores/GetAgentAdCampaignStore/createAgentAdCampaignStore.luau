local parent = script:FindFirstAncestor("BuildExperience").Parent
local httpService = game:GetService("HttpService")
local _ = require(parent.Signals)
local signalsUtilsModule = require(parent.SignalsUtils)
local _ = require(parent.DataHydration.CreatorAgentChat)

return function()
	-- upvalues: signalsUtilsModule (ref), httpService (ref)
	local var1, var2 = signalsUtilsModule.createSessionScopedSignal({})
	local var3, var4 = signalsUtilsModule.createSessionScopedSignal({})
	
	return {
		getAttempts = var1,
		start = function(p1, p2)
			-- upvalues: var1 (ref), httpService (copy), var2 (ref)
			local var5 = var1(false)
			local toolCallId = var5[p1.toolCallId]
			local var6 = toolCallId ~= nil and (toolCallId.selectedOption.campaignOption == p2.campaignOption and toolCallId.selectedOption.paymentType == p2.paymentType)
			
			if toolCallId ~= nil and (toolCallId.isPending or toolCallId.universeId ~= p1.universeId or (toolCallId.sessionId ~= p1.sessionId or toolCallId.toolCallId ~= p1.toolCallId) or not var6 and (toolCallId.failureKind == nil or toolCallId.failureKind == "unknown")) then
				return nil
			end
			local var7 = if toolCallId == nil or not var6 then p1 else toolCallId
			local t = {
				isPending = true,
				failureKind = nil,
				universeId = var7.universeId,
				sessionId = var7.sessionId,
				toolCallId = var7.toolCallId,
				offers = {
					feedback = if var7.offers.feedback ~= nil then nil else table.clone(var7.offers.feedback),
					plays = if var7.offers.plays ~= nil then nil else table.clone(var7.offers.plays)
				},
				runStartTimeMs = var7.runStartTimeMs,
				selectedOption = table.clone(p2),
				idempotencyKey = if toolCallId == nil or not var6 then httpService:GenerateGUID(false) else toolCallId.idempotencyKey
			}
			local cloned = table.clone(var5)
			cloned[p1.toolCallId] = t
			var2(cloned)
			
			return t
		end,
		finish = function(p1, p2, p3)
			-- upvalues: var1 (ref), var2 (ref)
			local var5 = var1(false)
			
			if var5[p1.toolCallId] ~= p1 then
				return false
			end
			local cloned = table.clone(var5)
			
			if p2 then
				cloned[p1.toolCallId] = nil
			else
				local cloned_1 = table.clone(p1)
				cloned_1.isPending = false
				cloned_1.failureKind = p3
				cloned[p1.toolCallId] = cloned_1
			end
			var2(cloned)
			
			return true
		end,
		markImpressed = function(p1, p2)
			-- upvalues: var3 (ref), var4 (ref)
			local var5 = var3(false)
			
			if var5[p1] == nil or not var5[p1][p2] then
				local cloned = table.clone(var5)
				cloned[p1] = table.clone(var5[p1] or {})
				cloned[p1][p2] = true
				var4(cloned)
				
				return true
			end
			return false
		end,
		reset = function()
			-- upvalues: var2 (ref), var4 (ref)
			var2({})
			var4({})
		end
	}
end