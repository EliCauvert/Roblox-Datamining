local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local adCampaignScheduleUtilsModule = require(buildExperience.Components.Ads.adCampaignScheduleUtils)

local function now()
	return DateTime.now().UnixTimestampMillis
end

return function(p1, p2)
	-- upvalues: now (ref), reactModule (ref), adCampaignScheduleUtilsModule (ref), localizationStringsModule (ref)
	p2 = p2 or now
	local var1 = p2()
	local var2 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		return { universeId = p1.universeId, sessionId = p1.sessionId }
	end, { p1.universeId, p1.sessionId })
	local var3 = reactModule.useRef(var2)
	var3.current = var2
	local var4 = reactModule.useRef(true)
	local var5 = reactModule.useRef({})
	local var6, var7 = reactModule.useState(nil)
	local var8 = reactModule.useRef(nil)
	local _, var9 = reactModule.useState(0)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref)
		var4.current = true
		
		return function()
			-- upvalues: var4 (copy)
			var4.current = false
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), var7 (ref)
		var8.current = nil
		var7(nil)
	end, { var2 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), adCampaignScheduleUtilsModule (copy), var1 (ref), p2 (ref), var9 (ref)
		if not p1.isPageVisible then return end
		local var10 = 1e999
		
		for i, v in p1.campaignsByToolCallId do
			local var11 = adCampaignScheduleUtilsModule.campaignEndExclusiveMs(v.runStartTimeMs, v.durationDays)
			
			if var1 < var11 then
				var10 = math.min(var10, var11)
			end
		end
		if var10 == 1e999 then
			return
		end
		local delayedThread = nil
		delayedThread = task.delay(math.max(0, var10 - p2()) / 1000, function()
			-- upvalues: delayedThread (write), var9 (copy)
			delayedThread = nil
			var9(function(p3)
				return p3 + 1
			end)
		end)
		
		return function()
			-- upvalues: delayedThread (write)
			if delayedThread ~= nil then
				task.cancel(delayedThread)
			end
		end
	end, { p1.campaignsByToolCallId, p1.isPageVisible, var1, p2 })
	
	return {
		isSheetOpen = var6 ~= nil and var6.scope == var2,
		onUpsellActivated = reactModule.useCallback(function(p3)
			-- upvalues: p1 (ref), var8 (ref), var5 (ref), var2 (ref), var7 (ref)
			if not p1.isPageVisible or p1.universeId == nil or (p1.universeId == 0 or p1.sessionId == nil) or (p3 == "" or p1.campaignsByToolCallId[p3] ~= nil or var8.current ~= nil) then return end
			local universeId = var5.current[p1.universeId]
			
			if universeId == nil then
				universeId = {}
				var5.current[p1.universeId] = universeId
			end
			local sessionId = universeId[p1.sessionId]
			
			if sessionId == nil then
				sessionId = {}
				universeId[p1.sessionId] = sessionId
			end
			if sessionId[p3] then
				return
			end
			local t = { scope = var2, toolCallId = p3, confirmed = sessionId }
			var8.current = t
			var7(t)
		end, {
			p1.isPageVisible,
			p1.universeId,
			p1.sessionId,
			p1.campaignsByToolCallId,
			var2
		}),
		onCampaignCreated = reactModule.useCallback(function(p3)
			-- upvalues: var6 (ref), p1 (ref), var8 (ref), var4 (ref), var3 (ref), var7 (ref)
			if var6 == nil or var6.confirmed[var6.toolCallId] then return end
			var6.confirmed[var6.toolCallId] = true
			p1.onCardCreated(var6.toolCallId, table.clone(p3), table.clone(var6.scope))
			local current = var8.current
			
			if var4.current and current ~= nil and (var3.current == current.scope and current.confirmed == var6.confirmed) and current.toolCallId == var6.toolCallId then
				var8.current = nil
				var7(nil)
				p1.onReturnToChat()
			end
		end, { var6, p1.onCardCreated, p1.onReturnToChat }),
		onSheetClose = reactModule.useCallback(function()
			-- upvalues: var6 (ref), var8 (ref), var7 (ref)
			if var6 ~= nil and var8.current == var6 then
				var8.current = nil
				var7(nil)
			end
		end, { var6 }),
		getCardState = reactModule.useCallback(function(p3)
			-- upvalues: p1 (ref), var1 (ref), adCampaignScheduleUtilsModule (copy), localizationStringsModule (copy)
			local var12 = p1.campaignsByToolCallId[p3]
			
			return if var12 == nil then nil else {
				variant = if adCampaignScheduleUtilsModule.campaignEndExclusiveMs(var12.runStartTimeMs, var12.durationDays) <= var1 then "complete" else "active",
				campaignStartDate = localizationStringsModule.formatAdCampaignSheetLocalDate(var12.runStartTimeMs),
				campaignEndDate = localizationStringsModule.formatAdCampaignSheetLocalDate(adCampaignScheduleUtilsModule.campaignEndMs(var12.runStartTimeMs, var12.durationDays))
			}
		end, { p1.campaignsByToolCallId, var1 })
	}
end