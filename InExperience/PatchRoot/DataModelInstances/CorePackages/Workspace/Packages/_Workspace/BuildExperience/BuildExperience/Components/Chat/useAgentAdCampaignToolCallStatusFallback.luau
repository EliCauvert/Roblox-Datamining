local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local playersService = game:GetService("Players")
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local adCampaignToolCallStatusModule = require(parent.DataHydration.AdCampaignToolCallStatus)
local _ = require(buildExperience.Chat.chatTypes)
local var1 = signalsModule.createComputed(function()
	return { cardStates = {}, pendingToolCallIds = {} }
end)

local function _(p1)
	return table.concat(p1, "\0")
end

return function(p1, p2)
	-- upvalues: playersService (ref), adCampaignToolCallStatusModule (ref), reactModule (ref), var1 (ref), signalsModule (ref), signalsReactModule (ref)
	local localPlayer = playersService.LocalPlayer
	local var2 = p2
	
	if not var2 then
		var2 = if localPlayer == nil or localPlayer.UserId <= 0 then nil else localPlayer.UserId
	end
	local adCampaignToolCallStatusStore = adCampaignToolCallStatusModule.getAdCampaignToolCallStatusStore(false)
	local joined = table.concat(p1, "\0")
	local var3 = reactModule.useRef({ key = "", value = {} })
	
	if var3.current.key ~= joined then
		var3.current = { key = joined, value = table.clone(p1) }
	end
	local value = var3.current.value
	local var4 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var2 (ref), value (ref), var1 (copy), signalsModule (copy), adCampaignToolCallStatusStore (ref)
		return if var2 == nil or #value == 0 then var1 else signalsModule.createComputed(function(p3)
			-- upvalues: value (copy), adCampaignToolCallStatusStore (copy), var2 (copy)
			local t = {}
			local t_1 = {}
			
			for i, v in value do
				local andFetchToolCallStatus = adCampaignToolCallStatusStore.getAndFetchToolCallStatus(var2, v)
				local var5 = andFetchToolCallStatus.data(p3)
				local var6 = andFetchToolCallStatus.status(p3)
				
				if var6 == "NotReady" then
					t_1[v] = true
				elseif var6 == "Ready" and var5 ~= nil then
					if var5.campaignId ~= nil then
						t[v] = {
							variant = nil,
							campaignStartDate = nil,
							campaignEndDate = nil,
							campaignId = var5.campaignId
						}
					elseif var5.status == "processing" or var5.status == "created" then
						t_1[v] = true
					end
				end
			end
			return { cardStates = t, pendingToolCallIds = t_1 }
		end)
	end, { adCampaignToolCallStatusStore, var2, value }))
	local var5 = reactModule.useRef({})
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var4 (ref), var5 (ref), adCampaignToolCallStatusStore (ref)
		if var2 == nil or next(var4.pendingToolCallIds) == nil then return end
		local current = var5.current
		
		for i in current do
			if var4.pendingToolCallIds[i] == nil then
				current[i] = nil
			end
		end
		local t = {}
		
		for i_1 in var4.pendingToolCallIds do
			local var6 = current[i_1] or 0
			
			if var6 < 3 then
				local delayedThread = nil
				delayedThread = task.delay(5 * 2 ^ var6, function()
					-- upvalues: delayedThread (write), t (ref), adCampaignToolCallStatusStore (copy), var2 (copy), i_1 (ref), current (ref), var6 (ref)
					if delayedThread ~= nil then
						t[delayedThread] = nil
					end
					local toolCallStatus = adCampaignToolCallStatusStore.getToolCallStatus(var2, i_1)
					local var7 = toolCallStatus.data(false)
					
					if toolCallStatus.status(false) == "Ready" and var7 ~= nil and var7.campaignId == nil and (var7.status == "processing" or var7.status == "created") then
						current[i_1] = var6 + 1
						adCampaignToolCallStatusStore.fetchToolCallStatus(var2, i_1)
					end
				end)
				
				if delayedThread ~= nil then
					t[delayedThread] = true
				end
			end
		end
		return function()
			-- upvalues: t (ref)
			for i in t do
				task.cancel(i)
			end
		end
	end, { var4, var2, adCampaignToolCallStatusStore })
	
	return var4
end