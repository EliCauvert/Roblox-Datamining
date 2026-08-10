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

local function _(p0) --[[ line: 44 | named "normalizeTransferOrigination" ]]
	-- upvalues: transferOriginationModule (ref)
	local lowerText = string.lower(p0)
	
	return if lowerText == "unknown" then transferOriginationModule.Unknown elseif lowerText == "profile" then transferOriginationModule.Profile elseif lowerText == "chat" then transferOriginationModule.Chat elseif lowerText == "buyrobux" then transferOriginationModule.BuyRobux elseif lowerText == "inexperience" then transferOriginationModule.InExperience else transferOriginationModule.Unknown
end

local _ = function(p1) --[[ line: 64 | named "validateParams" ]]
	-- upvalues: transferDirectionModule (ref)
	if p1.direction ~= transferDirectionModule.Send and p1.direction ~= transferDirectionModule.Receive then
		error(string.format("[TransferRobuxFlow] Invalid direction: '%s'. Must be either TransferDirection.Send or TransferDirection.Receive.", tostring(p1.direction)))
	end
end

local function initializeTransferStore(p2, p3) --[[ line: 76 ]]
	-- upvalues: getFFlagCurrencyTransferUseRoactNetworkingModule (ref), sharedFlagsModule (ref), httpService (ref), transferOriginationModule (ref), transferDirectionModule (ref), initiateTransferModule (ref), acceptTransferModule (ref), logCurrencyTransferCounterModule (ref), currencyTransferTelemetryModule (ref), logRobuxTransferFlowEventModule (ref), robuxTransferFlowEventNameModule (ref)
	p2.setNetworkImpl(if getFFlagCurrencyTransferUseRoactNetworkingModule() then p3.networkImpl else nil)
	
	if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
		p2.setTransferClientSessionId(httpService:GenerateGUID(false))
	end
	p2.setOnClose(p3.onClose)
	
	if sharedFlagsModule.FFlagSduiOpenIncomingTransferUpsellAction then
		p2.setOnPromptOptimisticHide(p3.onPromptOptimisticHide)
		p2.setOnPromptDismissCommitted(p3.onPromptDismissCommitted)
	end
	p2.setDirection(p3.direction)
	
	if p3.transferOrigination then
		local lowerText = string.lower(p3.transferOrigination)
		p2.setTransferOrigination(if lowerText == "unknown" then transferOriginationModule.Unknown elseif lowerText == "profile" then transferOriginationModule.Profile elseif lowerText == "chat" then transferOriginationModule.Chat elseif lowerText == "buyrobux" then transferOriginationModule.BuyRobux elseif lowerText == "inexperience" then transferOriginationModule.InExperience else transferOriginationModule.Unknown)
	end
	if p3.direction == transferDirectionModule.Send then
		if p3.recipientUserId then
			p2.setRecipientUserId(p3.recipientUserId)
		end
		initiateTransferModule(p2)
	elseif p3.direction == transferDirectionModule.Receive then
		if p3.transferId then
			p2.setTransferRequestId(p3.transferId)
		end
		acceptTransferModule(p2)
	end
	logCurrencyTransferCounterModule(p2, currencyTransferTelemetryModule.CurrencyTransferFlowOpenedCounter)
	
	if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
		logRobuxTransferFlowEventModule(p2, robuxTransferFlowEventNameModule.in_app_flow_open)
	end
end

local function renderTransferRobuxFlowImmediate(p4) --[[ line: 111 ]]
	-- upvalues: createTransferStoreModule (ref), initializeTransferStore (ref), reactModule (ref), transferRobuxAppModule (ref)
	local var20 = createTransferStoreModule()
	initializeTransferStore(var20, p4)
	
	return reactModule.createElement(transferRobuxAppModule, { transferStore = var20 })
end

local function TransferRobuxFlowContainer(p5) --[[ line: 119 ]]
	-- upvalues: reactModule (ref), createTransferStoreModule (ref), initializeTransferStore (ref), transferRobuxAppModule (ref)
	local var21 = reactModule.useRef(nil)
	local var22 = reactModule.useRef(false)
	
	if var21.current == nil then
		var21.current = createTransferStoreModule()
	end
	local current = var21.current
	
	if not var22.current then
		var22.current = true
		initializeTransferStore(current, p5)
	end
	return reactModule.createElement(transferRobuxAppModule, { transferStore = current })
end

return function(p6) --[[ line: 138 | named "TransferRobuxFlow" ]]
	-- upvalues: transferDirectionModule (ref), sharedFlagsModule (ref), reactModule (ref), TransferRobuxFlowContainer (ref), renderTransferRobuxFlowImmediate (ref)
	if p6.direction ~= transferDirectionModule.Send and p6.direction ~= transferDirectionModule.Receive then
		error(string.format("[TransferRobuxFlow] Invalid direction: '%s'. Must be either TransferDirection.Send or TransferDirection.Receive.", tostring(p6.direction)))
	end
	return if sharedFlagsModule.FFlagSduiOpenIncomingTransferUpsellAction then reactModule.createElement(TransferRobuxFlowContainer, p6) else renderTransferRobuxFlowImmediate(p6)
end