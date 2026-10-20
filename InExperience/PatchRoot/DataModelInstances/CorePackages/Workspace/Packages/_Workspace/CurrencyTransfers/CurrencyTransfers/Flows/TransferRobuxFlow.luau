local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local HttpService = game:GetService("HttpService")
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local TransferRobuxAppModule = require(CurrencyTransfers.Components.TransferRobuxApp)
local CreateTransferStoreModule = require(CurrencyTransfers.Stores.createTransferStore)
local InitiateTransferModule = require(CurrencyTransfers.Actions.Send.initiateTransfer)
local AcceptTransferModule = require(CurrencyTransfers.Actions.Receive.acceptTransfer)
local TransferDirectionModule = require(CurrencyTransfers.Enums.TransferDirection)
local TransferOriginationModule = require(CurrencyTransfers.Enums.TransferOrigination)
local CurrencyTransferTelemetryModule = require(CurrencyTransfers.Events.CurrencyTransferTelemetry)
local RobuxTransferFlowEventNameModule = require(CurrencyTransfers.Enums.RobuxTransferFlowEventName)
local LogCurrencyTransferCounterModule = require(CurrencyTransfers.Utils.logCurrencyTransferCounter)
local LogRobuxTransferFlowEventModule = require(CurrencyTransfers.Utils.logRobuxTransferFlowEvent)
local GetFFlagCurrencyTransferUseRoactNetworkingModule = require(CurrencyTransfers.Flags.GetFFlagCurrencyTransferUseRoactNetworking)

local function _(Text: string)
	-- upvalues: TransferOriginationModule (copy)
	local Lowered = string.lower(Text)
	
	return if Lowered == "unknown" then TransferOriginationModule.Unknown elseif Lowered == "profile" then TransferOriginationModule.Profile elseif Lowered == "chat" then TransferOriginationModule.Chat elseif Lowered == "buyrobux" then TransferOriginationModule.BuyRobux elseif Lowered == "inexperience" then TransferOriginationModule.InExperience else TransferOriginationModule.Unknown
end

local _ = function(p1)
	-- upvalues: TransferDirectionModule (copy)
	if p1.direction ~= TransferDirectionModule.Send and p1.direction ~= TransferDirectionModule.Receive then
		error(string.format("[TransferRobuxFlow] Invalid direction: '%s'. Must be either TransferDirection.Send or TransferDirection.Receive.", (tostring(p1.direction))))
	end
end

local function initializeTransferStore(Current, p1)
	-- upvalues: GetFFlagCurrencyTransferUseRoactNetworkingModule (copy), SharedFlagsModule (copy), HttpService (copy), TransferOriginationModule (copy), TransferDirectionModule (copy), InitiateTransferModule (copy), AcceptTransferModule (copy), LogCurrencyTransferCounterModule (copy), CurrencyTransferTelemetryModule (copy), LogRobuxTransferFlowEventModule (copy), RobuxTransferFlowEventNameModule (copy)
	Current.setNetworkImpl(if GetFFlagCurrencyTransferUseRoactNetworkingModule() then p1.networkImpl else nil)
	
	if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
		Current.setTransferClientSessionId(HttpService:GenerateGUID(false))
	end
	Current.setOnClose(p1.onClose)
	
	if SharedFlagsModule.FFlagSduiOpenIncomingTransferUpsellAction then
		Current.setOnPromptOptimisticHide(p1.onPromptOptimisticHide)
		Current.setOnPromptDismissCommitted(p1.onPromptDismissCommitted)
	end
	Current.setDirection(p1.direction)
	
	if p1.transferOrigination then
		local Lowered = string.lower(p1.transferOrigination)
		Current.setTransferOrigination(if Lowered == "unknown" then TransferOriginationModule.Unknown elseif Lowered == "profile" then TransferOriginationModule.Profile elseif Lowered == "chat" then TransferOriginationModule.Chat elseif Lowered == "buyrobux" then TransferOriginationModule.BuyRobux elseif Lowered == "inexperience" then TransferOriginationModule.InExperience else TransferOriginationModule.Unknown)
	end
	if p1.direction == TransferDirectionModule.Send then
		if p1.recipientUserId then
			Current.setRecipientUserId(p1.recipientUserId)
		end
		InitiateTransferModule(Current)
	elseif p1.direction == TransferDirectionModule.Receive then
		if p1.transferId then
			Current.setTransferRequestId(p1.transferId)
		end
		AcceptTransferModule(Current)
	end
	LogCurrencyTransferCounterModule(Current, CurrencyTransferTelemetryModule.CurrencyTransferFlowOpenedCounter)
	
	if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
		LogRobuxTransferFlowEventModule(Current, RobuxTransferFlowEventNameModule.in_app_flow_open)
	end
end

local function renderTransferRobuxFlowImmediate(p1)
	-- upvalues: CreateTransferStoreModule (copy), initializeTransferStore (copy), ReactModule (copy), TransferRobuxAppModule (copy)
	local TransferStoreModule = CreateTransferStoreModule()
	initializeTransferStore(TransferStoreModule, p1)
	
	return ReactModule.createElement(TransferRobuxAppModule, { transferStore = TransferStoreModule })
end

local function TransferRobuxFlowContainer(p1)
	-- upvalues: ReactModule (copy), CreateTransferStoreModule (copy), initializeTransferStore (copy), TransferRobuxAppModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(false)
	
	if UseRefResult.current == nil then
		UseRefResult.current = CreateTransferStoreModule()
	end
	local Current = UseRefResult.current
	
	if not UseRefResult1.current then
		UseRefResult1.current = true
		initializeTransferStore(Current, p1)
	end
	return ReactModule.createElement(TransferRobuxAppModule, { transferStore = Current })
end

return function(p1)
	-- upvalues: TransferDirectionModule (copy), SharedFlagsModule (copy), ReactModule (copy), TransferRobuxFlowContainer (copy), renderTransferRobuxFlowImmediate (copy)
	if p1.direction ~= TransferDirectionModule.Send and p1.direction ~= TransferDirectionModule.Receive then
		error(string.format("[TransferRobuxFlow] Invalid direction: '%s'. Must be either TransferDirection.Send or TransferDirection.Receive.", (tostring(p1.direction))))
	end
	return if SharedFlagsModule.FFlagSduiOpenIncomingTransferUpsellAction then ReactModule.createElement(TransferRobuxFlowContainer, p1) else renderTransferRobuxFlowImmediate(p1)
end