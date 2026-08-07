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
local getFFlagCurrencyTransferUseRoactNetworkingModule = require(currencyTransfers.Flags.GetFFlagCurrencyTransferUseRoactNetworking)

local function _(p0) --[[ line: 40 | named "normalizeTransferOrigination" ]]
	-- upvalues: transferOriginationModule (ref)
	local lowerText = string.lower(p0)
	
	return if lowerText == "unknown" then transferOriginationModule.Unknown elseif lowerText == "profile" then transferOriginationModule.Profile elseif lowerText == "chat" then transferOriginationModule.Chat elseif lowerText == "buyrobux" then transferOriginationModule.BuyRobux elseif lowerText == "inexperience" then transferOriginationModule.InExperience else transferOriginationModule.Unknown
end

local _ = function(p1) --[[ line: 60 | named "validateParams" ]]
	-- upvalues: transferDirectionModule (ref)
	if p1.direction ~= transferDirectionModule.Send and p1.direction ~= transferDirectionModule.Receive then
		error(string.format("[TransferRobuxFlow] Invalid direction: '%s'. Must be either TransferDirection.Send or TransferDirection.Receive.", tostring(p1.direction)))
	end
end

function TransferRobuxFlow(p2) --[[ line: 72 ]]
	-- upvalues: transferDirectionModule (ref), createTransferStoreModule (ref), getFFlagCurrencyTransferUseRoactNetworkingModule (ref), sharedFlagsModule (ref), httpService (ref), transferOriginationModule (ref), initiateTransferModule (ref), acceptTransferModule (ref), logCurrencyTransferCounterModule (ref), currencyTransferTelemetryModule (ref), logRobuxTransferFlowEventModule (ref), robuxTransferFlowEventNameModule (ref), reactModule (ref), transferRobuxAppModule (ref)
	if p2.direction ~= transferDirectionModule.Send and p2.direction ~= transferDirectionModule.Receive then
		error(string.format("[TransferRobuxFlow] Invalid direction: '%s'. Must be either TransferDirection.Send or TransferDirection.Receive.", tostring(p2.direction)))
	end
	local var16 = createTransferStoreModule()
	var16.setNetworkImpl(if getFFlagCurrencyTransferUseRoactNetworkingModule() then p2.networkImpl else nil)
	
	if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
		var16.setTransferClientSessionId(httpService:GenerateGUID(false))
	end
	var16.setOnClose(p2.onClose)
	var16.setDirection(p2.direction)
	
	if p2.transferOrigination then
		local lowerText = string.lower(p2.transferOrigination)
		var16.setTransferOrigination(if lowerText == "unknown" then transferOriginationModule.Unknown elseif lowerText == "profile" then transferOriginationModule.Profile elseif lowerText == "chat" then transferOriginationModule.Chat elseif lowerText == "buyrobux" then transferOriginationModule.BuyRobux elseif lowerText == "inexperience" then transferOriginationModule.InExperience else transferOriginationModule.Unknown)
	end
	if p2.direction == transferDirectionModule.Send then
		if p2.recipientUserId then
			var16.setRecipientUserId(p2.recipientUserId)
		end
		initiateTransferModule(var16)
	elseif p2.direction == transferDirectionModule.Receive then
		if p2.transferId then
			var16.setTransferRequestId(p2.transferId)
		end
		acceptTransferModule(var16)
	end
	logCurrencyTransferCounterModule(var16, currencyTransferTelemetryModule.CurrencyTransferFlowOpenedCounter)
	
	if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
		logRobuxTransferFlowEventModule(var16, robuxTransferFlowEventNameModule.in_app_flow_open)
	end
	return reactModule.createElement(transferRobuxAppModule, { transferStore = var16 })
end

return TransferRobuxFlow