local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local SharedFlagsModule = require(CurrencyTransfers.Parent.SharedFlags)
local _ = require(CurrencyTransfers.Stores.createTransferStore)
local GetTransferRequestByIdRequestModule = require(CurrencyTransfers.NetworkRequests.getTransferRequestByIdRequest)
local PromptStateModule = require(CurrencyTransfers.Enums.PromptState)
local _ = require(CurrencyTransfers.Enums.TransferRetryOrigin)
local CurrencyTransferTelemetryModule = require(CurrencyTransfers.Events.CurrencyTransferTelemetry)
local RobuxTransferFlowEventNameModule = require(CurrencyTransfers.Enums.RobuxTransferFlowEventName)
local LogCurrencyTransferCounterModule = require(CurrencyTransfers.Utils.logCurrencyTransferCounter)
local LogRobuxTransferFlowEventModule = require(CurrencyTransfers.Utils.logRobuxTransferFlowEvent)

return function(p1, p2, p3, p4)
	-- upvalues: LogCurrencyTransferCounterModule (copy), CurrencyTransferTelemetryModule (copy), SharedFlagsModule (copy), LogRobuxTransferFlowEventModule (copy), RobuxTransferFlowEventNameModule (copy), PromptStateModule (copy), GetTransferRequestByIdRequestModule (copy)
	local SetPromptStateFunction = p1.setPromptState
	local SetAmpRecourseActionsFunction = p1.setAmpRecourseActions
	local SetAmpFeatureCheckFunction = p1.setAmpFeatureCheck
	local SetTransferRetryOriginFunction = p1.setTransferRetryOrigin
	local SetSenderFunction = p1.setSender
	local GetTransferRequestIdFunction = p1.getTransferRequestId
	
	local function applyBlockState()
		-- upvalues: LogCurrencyTransferCounterModule (upval), p1 (copy), CurrencyTransferTelemetryModule (upval), SharedFlagsModule (upval), LogRobuxTransferFlowEventModule (upval), RobuxTransferFlowEventNameModule (upval), p2 (copy), SetAmpRecourseActionsFunction (copy), p3 (copy), SetAmpFeatureCheckFunction (copy), p4 (copy), SetTransferRetryOriginFunction (copy), SetPromptStateFunction (copy), PromptStateModule (upval)
		LogCurrencyTransferCounterModule(p1, CurrencyTransferTelemetryModule.CurrencyTransferAmpRecourseRequiredCounter)
		
		if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			LogRobuxTransferFlowEventModule(p1, RobuxTransferFlowEventNameModule.amp_recourse_required)
		end
		if p2 then
			SetAmpRecourseActionsFunction(p2)
		end
		if p3 then
			SetAmpFeatureCheckFunction(p3)
		end
		if p4 then
			SetTransferRetryOriginFunction(p4)
		end
		SetPromptStateFunction(PromptStateModule.ReceiveBlocked)
	end
	
	if p1.getSender(false) then
		applyBlockState()
		
		return
	end
	local TransferRequestId = GetTransferRequestIdFunction(false)
	
	if TransferRequestId then
		GetTransferRequestByIdRequestModule({ transferRequestId = TransferRequestId }):andThen(function(Result)
			-- upvalues: SetSenderFunction (copy), applyBlockState (copy)
			if Result and Result.transfer and Result.transfer.sender then
				SetSenderFunction(Result.transfer.sender)
			end
			applyBlockState()
		end):catch(function()
			-- upvalues: applyBlockState (copy)
			applyBlockState()
		end)
		
		return
	else
		applyBlockState()
	end
end