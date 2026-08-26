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

return function(p1, p2, p3, p4)
	-- upvalues: logCurrencyTransferCounterModule (ref), currencyTransferTelemetryModule (ref), sharedFlagsModule (ref), logRobuxTransferFlowEventModule (ref), robuxTransferFlowEventNameModule (ref), promptStateModule (ref), getTransferRequestByIdRequestModule (ref)
	local setPromptState = p1.setPromptState
	local setAmpRecourseActions = p1.setAmpRecourseActions
	local setAmpFeatureCheck = p1.setAmpFeatureCheck
	local setTransferRetryOrigin = p1.setTransferRetryOrigin
	local setSender = p1.setSender
	local getSender = p1.getSender
	local getTransferRequestId = p1.getTransferRequestId
	
	local function applyBlockState()
		-- upvalues: logCurrencyTransferCounterModule (copy), p1 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy), p2 (ref), setAmpRecourseActions (ref), p3 (ref), setAmpFeatureCheck (ref), p4 (ref), setTransferRetryOrigin (ref), setPromptState (ref), promptStateModule (copy)
		logCurrencyTransferCounterModule(p1, currencyTransferTelemetryModule.CurrencyTransferAmpRecourseRequiredCounter)
		
		if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			logRobuxTransferFlowEventModule(p1, robuxTransferFlowEventNameModule.amp_recourse_required)
		end
		if p2 then
			setAmpRecourseActions(p2)
		end
		if p3 then
			setAmpFeatureCheck(p3)
		end
		if p4 then
			setTransferRetryOrigin(p4)
		end
		setPromptState(promptStateModule.ReceiveBlocked)
	end
	
	if getSender(false) then
		applyBlockState()
		
		return
	end
	local var1 = getTransferRequestId(false)
	
	if var1 then
		getTransferRequestByIdRequestModule({ transferRequestId = var1 }, nil, p1.getNetworkImpl()):andThen(function(p5)
			-- upvalues: setSender (ref), applyBlockState (ref)
			if p5 and p5.transfer and p5.transfer.sender then
				setSender(p5.transfer.sender)
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