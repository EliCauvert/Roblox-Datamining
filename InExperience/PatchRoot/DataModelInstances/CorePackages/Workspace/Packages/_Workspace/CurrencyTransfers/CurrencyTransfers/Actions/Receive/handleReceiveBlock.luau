local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local sharedFlagsModule = require(currencyTransfers.Parent.SharedFlags)
local _ = require(currencyTransfers.Stores.createTransferStore)
local getTransferRequestByIdRequestModule = require(currencyTransfers.NetworkRequests.getTransferRequestByIdRequest)
local promptStateModule = require(currencyTransfers.Enums.PromptState)
local _ = require(currencyTransfers.Enums.TransferRetryOrigin)
local currencyTransferTelemetryModule = require(currencyTransfers.Events.CurrencyTransferTelemetry)
local robuxTransferFlowEventNameModule = require(currencyTransfers.Enums.RobuxTransferFlowEventName)
local logCurrencyTransferCounterModule = require(currencyTransfers.Utils.logCurrencyTransferCounter)
local logRobuxTransferFlowEventModule = require(currencyTransfers.Utils.logRobuxTransferFlowEvent)

return function(p0, p1, p2, p3)
	-- upvalues: logCurrencyTransferCounterModule (ref), currencyTransferTelemetryModule (ref), sharedFlagsModule (ref), logRobuxTransferFlowEventModule (ref), robuxTransferFlowEventNameModule (ref), promptStateModule (ref), getTransferRequestByIdRequestModule (ref)
	local setPromptState = p0.setPromptState
	local setAmpRecourseActions = p0.setAmpRecourseActions
	local setAmpFeatureCheck = p0.setAmpFeatureCheck
	local setTransferRetryOrigin = p0.setTransferRetryOrigin
	local setSender = p0.setSender
	local getSender = p0.getSender
	local getTransferRequestId = p0.getTransferRequestId
	
	local function applyBlockState()
		-- upvalues: logCurrencyTransferCounterModule (copy), p0 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy), p1 (ref), setAmpRecourseActions (ref), p2 (ref), setAmpFeatureCheck (ref), p3 (ref), setTransferRetryOrigin (ref), setPromptState (ref), promptStateModule (copy)
		logCurrencyTransferCounterModule(p0, currencyTransferTelemetryModule.CurrencyTransferAmpRecourseRequiredCounter)
		
		if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			logRobuxTransferFlowEventModule(p0, robuxTransferFlowEventNameModule.amp_recourse_required)
		end
		if p1 then
			setAmpRecourseActions(p1)
		end
		if p2 then
			setAmpFeatureCheck(p2)
		end
		if p3 then
			setTransferRetryOrigin(p3)
		end
		setPromptState(promptStateModule.ReceiveBlocked)
	end
	
	if getSender(false) then
		applyBlockState()
		
		return
	end
	local var9 = getTransferRequestId(false)
	
	if var9 then
		getTransferRequestByIdRequestModule({ transferRequestId = var9 }, nil, p0.getNetworkImpl()):andThen(function(p4)
			-- upvalues: setSender (ref), applyBlockState (ref)
			if p4 and p4.transfer and p4.transfer.sender then
				setSender(p4.transfer.sender)
			end
			applyBlockState()
		end):catch(function()
			-- upvalues: applyBlockState (ref)
			applyBlockState()
		end)
		
		return
	end
	applyBlockState()
end