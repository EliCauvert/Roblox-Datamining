local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local Players = game:GetService("Players")
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local AdCampaignToolCallStatusModule = require(Parent.DataHydration.AdCampaignToolCallStatus)
local _ = require(BuildExperience.Chat.chatTypes)
local Computed = SignalsModule.createComputed(function()
	return { cardStates = {}, pendingToolCallIds = {} }
end)

local function _(List): string
	return table.concat(List, "\0")
end

return function(List, p1)
	-- upvalues: Players (copy), AdCampaignToolCallStatusModule (copy), ReactModule (copy), Computed (copy), SignalsModule (copy), SignalsReactModule (copy)
	local LocalPlayer = Players.LocalPlayer
	local P0 = p1 or (if LocalPlayer == nil or LocalPlayer.UserId <= 0 then nil else LocalPlayer.UserId)
	local AdCampaignToolCallStatusStore = AdCampaignToolCallStatusModule.getAdCampaignToolCallStatusStore(false)
	local Joined = table.concat(List, "\0")
	local UseRefResult = ReactModule.useRef({ key = "", value = {} })
	
	if UseRefResult.current.key ~= Joined then
		UseRefResult.current = { key = Joined, value = table.clone(List) }
	end
	local Value = UseRefResult.current.value
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: P0 (copy), Value (copy), Computed (upval), SignalsModule (upval), AdCampaignToolCallStatusStore (copy)
		return if P0 == nil or #Value == 0 then Computed else SignalsModule.createComputed(function(p2)
			-- upvalues: Value (upval), AdCampaignToolCallStatusStore (upval), P0 (upval)
			local CardStates = {}
			local PendingToolCallIds = {}
			
			for _, value in Value do
				local AndFetchToolCallStatus = AdCampaignToolCallStatusStore.getAndFetchToolCallStatus(P0, value)
				local DataResult = AndFetchToolCallStatus.data(p2)
				local StatusResult = AndFetchToolCallStatus.status(p2)
				
				if StatusResult == "NotReady" then
					PendingToolCallIds[value] = true
				elseif StatusResult == "Ready" and DataResult ~= nil then
					if DataResult.campaignId ~= nil then
						CardStates[value] = {
							variant = nil,
							campaignStartDate = nil,
							campaignEndDate = nil,
							campaignId = DataResult.campaignId
						}
					elseif DataResult.status == "processing" or DataResult.status == "created" then
						PendingToolCallIds[value] = true
					end
				end
			end
			return {
				cardStates = CardStates,
				pendingToolCallIds = PendingToolCallIds
			}
		end)
	end, { AdCampaignToolCallStatusStore, P0, Value })))
	local UseRefResult1 = ReactModule.useRef({})
	ReactModule.useEffect(function()
		-- upvalues: P0 (copy), UseSignalStateResult (copy), UseRefResult1 (copy), AdCampaignToolCallStatusStore (copy)
		if P0 == nil or next(UseSignalStateResult.pendingToolCallIds) == nil then return end
		local Current = UseRefResult1.current
		
		for i in Current do
			if UseSignalStateResult.pendingToolCallIds[i] == nil then
				Current[i] = nil
			end
		end
		local t = {}
		
		for pendingToolCallId in UseSignalStateResult.pendingToolCallIds do
			local CurrentEntry = Current[pendingToolCallId] or 0
			local IsCurrentEntryAbove = CurrentEntry >= 3
			local DelayedThread = nil
			
			if not IsCurrentEntryAbove then
				DelayedThread = nil
				DelayedThread = task.delay(5 * 2 ^ CurrentEntry, function()
					-- upvalues: DelayedThread (ref), t (copy), AdCampaignToolCallStatusStore (upval), P0 (upval), pendingToolCallId (copy), Current (copy), CurrentEntry (copy)
					if DelayedThread ~= nil then
						t[DelayedThread] = nil
					end
					local ToolCallStatus = AdCampaignToolCallStatusStore.getToolCallStatus(P0, pendingToolCallId)
					local DataResult = ToolCallStatus.data(false)
					
					if ToolCallStatus.status(false) == "Ready" and DataResult ~= nil and DataResult.campaignId == nil and (DataResult.status == "processing" or DataResult.status == "created") then
						Current[pendingToolCallId] = CurrentEntry + 1
						AdCampaignToolCallStatusStore.fetchToolCallStatus(P0, pendingToolCallId)
					end
				end)
				IsCurrentEntryAbove = DelayedThread == nil
			end
			if not IsCurrentEntryAbove then
				t[DelayedThread] = true
			end
		end
		return function()
			-- upvalues: t (copy)
			for i in t do
				task.cancel(i)
			end
		end
	end, { UseSignalStateResult, P0, AdCampaignToolCallStatusStore })
	
	return UseSignalStateResult
end