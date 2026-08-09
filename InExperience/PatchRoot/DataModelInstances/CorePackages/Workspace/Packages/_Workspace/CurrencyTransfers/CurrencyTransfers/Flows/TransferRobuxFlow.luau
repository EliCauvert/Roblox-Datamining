local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local httpService = game:GetService("HttpService")
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local transferRobuxAppModule = require(currencyTransfers.Components.TransferRobuxApp)
local createTransferStoreModule = require(currencyTransfers.Stores.createTransferStore)
local initiateTransferModule = require(currencyTransfers.Actions.Send.initiateTransfer)
local acceptTransferModule = require(currencyTransfers.Actions.Receive.acceptTransfer)
local transferDirectionModule = require(currencyTransfers.Enums.TransferDirection)
local transferOriginationModule = require(currencyTransfers.Enums.TransferOrigination)
local currencyTransferTelemetryModule = require(currencyTransfers.Events.CurrencyTransferTelemetry)
local robuxTransferFlowEventNameModule = require(currencyTransfers.Enums.RobuxTransferFlowEventName)
local logCurrencyTransferCounterModule = require(currencyTransfers.Utils.logCurrencyTransferCounter)
local logRobuxTransferFlowEventModule = require(currencyTransfers.Utils.logRobuxTransferFlowEvent)

local function _(p0) --[[ line: 32 | named "normalizeTransferOrigination" ]]
	-- upvalues: transferOriginationModule (ref)
	local lowerText = string.lower(p0)
	
	return if lowerText == "unknown" then transferOriginationModule.Unknown elseif lowerText == "profile" then transferOriginationModule.Profile elseif lowerText == "chat" then transferOriginationModule.Chat elseif lowerText == "buyrobux" then transferOriginationModule.BuyRobux elseif lowerText == "inexperience" then transferOriginationModule.InExperience else transferOriginationModule.Unknown
end

local _ = function(p1) --[[ line: 52 | named "validateParams" ]]
	-- upvalues: transferDirectionModule (ref)
	if p1.direction ~= transferDirectionModule.Send and p1.direction ~= transferDirectionModule.Receive then
		error(string.format("[TransferRobuxFlow] Invalid direction: '%s'. Must be either TransferDirection.Send or TransferDirection.Receive.", tostring(p1.direction)))
	end
end

function TransferRobuxFlow(p2) --[[ line: 64 ]]
	-- upvalues: transferDirectionModule (ref), createTransferStoreModule (ref), sharedFlagsModule (ref), httpService (ref), transferOriginationModule (ref), initiateTransferModule (ref), acceptTransferModule (ref), logCurrencyTransferCounterModule (ref), currencyTransferTelemetryModule (ref), logRobuxTransferFlowEventModule (ref), robuxTransferFlowEventNameModule (ref), reactModule (ref), transferRobuxAppModule (ref)
	if p2.direction ~= transferDirectionModule.Send and p2.direction ~= transferDirectionModule.Receive then
		error(string.format("[TransferRobuxFlow] Invalid direction: '%s'. Must be either TransferDirection.Send or TransferDirection.Receive.", tostring(p2.direction)))
	end
	local var15 = createTransferStoreModule()
	
	if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
		var15.setTransferClientSessionId(httpService:GenerateGUID(false))
	end
	var15.setOnClose(p2.onClose)
	var15.setDirection(p2.direction)
	
	if p2.transferOrigination then
		local lowerText = string.lower(p2.transferOrigination)
		var15.setTransferOrigination(if lowerText == "unknown" then transferOriginationModule.Unknown elseif lowerText == "profile" then transferOriginationModule.Profile elseif lowerText == "chat" then transferOriginationModule.Chat elseif lowerText == "buyrobux" then transferOriginationModule.BuyRobux elseif lowerText == "inexperience" then transferOriginationModule.InExperience else transferOriginationModule.Unknown)
	end
	if p2.direction == transferDirectionModule.Send then
		if p2.recipientUserId then
			var15.setRecipientUserId(p2.recipientUserId)
		end
		initiateTransferModule(var15)
	elseif p2.direction == transferDirectionModule.Receive then
		if p2.transferId then
			var15.setTransferRequestId(p2.transferId)
		end
		acceptTransferModule(var15)
	end
	logCurrencyTransferCounterModule(var15, currencyTransferTelemetryModule.CurrencyTransferFlowOpenedCounter)
	
	if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
		logRobuxTransferFlowEventModule(var15, robuxTransferFlowEventNameModule.in_app_flow_open)
	end
	return reactModule.createElement(transferRobuxAppModule, { transferStore = var15 })
end

return TransferRobuxFlow