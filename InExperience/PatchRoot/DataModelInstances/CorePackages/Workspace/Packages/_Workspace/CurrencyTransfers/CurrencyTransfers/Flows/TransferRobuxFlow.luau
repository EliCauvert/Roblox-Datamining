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

local function _(p1)
	-- upvalues: transferOriginationModule (ref)
	local lowerText = string.lower(p1)
	
	return if lowerText == "unknown" then transferOriginationModule.Unknown elseif lowerText == "profile" then transferOriginationModule.Profile elseif lowerText == "chat" then transferOriginationModule.Chat elseif lowerText == "buyrobux" then transferOriginationModule.BuyRobux elseif lowerText == "inexperience" then transferOriginationModule.InExperience else transferOriginationModule.Unknown
end

local _ = function(p1)
	-- upvalues: transferDirectionModule (ref)
	if p1.direction ~= transferDirectionModule.Send and p1.direction ~= transferDirectionModule.Receive then
		error(string.format("[TransferRobuxFlow] Invalid direction: '%s'. Must be either TransferDirection.Send or TransferDirection.Receive.", tostring(p1.direction)))
	end
end

local function initializeTransferStore(p1, p2)
	-- upvalues: getFFlagCurrencyTransferUseRoactNetworkingModule (ref), sharedFlagsModule (ref), httpService (ref), transferOriginationModule (ref), transferDirectionModule (ref), initiateTransferModule (ref), acceptTransferModule (ref), logCurrencyTransferCounterModule (ref), currencyTransferTelemetryModule (ref), logRobuxTransferFlowEventModule (ref), robuxTransferFlowEventNameModule (ref)
	p1.setNetworkImpl(if getFFlagCurrencyTransferUseRoactNetworkingModule() then p2.networkImpl else nil)
	
	if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
		p1.setTransferClientSessionId(httpService:GenerateGUID(false))
	end
	p1.setOnClose(p2.onClose)
	
	if sharedFlagsModule.FFlagSduiOpenIncomingTransferUpsellAction then
		p1.setOnPromptOptimisticHide(p2.onPromptOptimisticHide)
		p1.setOnPromptDismissCommitted(p2.onPromptDismissCommitted)
	end
	p1.setDirection(p2.direction)
	
	if p2.transferOrigination then
		local lowerText = string.lower(p2.transferOrigination)
		p1.setTransferOrigination(if lowerText == "unknown" then transferOriginationModule.Unknown elseif lowerText == "profile" then transferOriginationModule.Profile elseif lowerText == "chat" then transferOriginationModule.Chat elseif lowerText == "buyrobux" then transferOriginationModule.BuyRobux elseif lowerText == "inexperience" then transferOriginationModule.InExperience else transferOriginationModule.Unknown)
	end
	if p2.direction == transferDirectionModule.Send then
		if p2.recipientUserId then
			p1.setRecipientUserId(p2.recipientUserId)
		end
		initiateTransferModule(p1)
	elseif p2.direction == transferDirectionModule.Receive then
		if p2.transferId then
			p1.setTransferRequestId(p2.transferId)
		end
		acceptTransferModule(p1)
	end
	logCurrencyTransferCounterModule(p1, currencyTransferTelemetryModule.CurrencyTransferFlowOpenedCounter)
	
	if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
		logRobuxTransferFlowEventModule(p1, robuxTransferFlowEventNameModule.in_app_flow_open)
	end
end

local function renderTransferRobuxFlowImmediate(p1)
	-- upvalues: createTransferStoreModule (ref), initializeTransferStore (ref), reactModule (ref), transferRobuxAppModule (ref)
	local var1 = createTransferStoreModule()
	initializeTransferStore(var1, p1)
	
	return reactModule.createElement(transferRobuxAppModule, { transferStore = var1 })
end

local function TransferRobuxFlowContainer(p1)
	-- upvalues: reactModule (ref), createTransferStoreModule (ref), initializeTransferStore (ref), transferRobuxAppModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(false)
	
	if var1.current == nil then
		var1.current = createTransferStoreModule()
	end
	local current = var1.current
	
	if not var2.current then
		var2.current = true
		initializeTransferStore(current, p1)
	end
	return reactModule.createElement(transferRobuxAppModule, { transferStore = current })
end

return function(p1)
	-- upvalues: transferDirectionModule (ref), sharedFlagsModule (ref), reactModule (ref), TransferRobuxFlowContainer (ref), renderTransferRobuxFlowImmediate (ref)
	if p1.direction ~= transferDirectionModule.Send and p1.direction ~= transferDirectionModule.Receive then
		error(string.format("[TransferRobuxFlow] Invalid direction: '%s'. Must be either TransferDirection.Send or TransferDirection.Receive.", tostring(p1.direction)))
	end
	return if sharedFlagsModule.FFlagSduiOpenIncomingTransferUpsellAction then reactModule.createElement(TransferRobuxFlowContainer, p1) else renderTransferRobuxFlowImmediate(p1)
end