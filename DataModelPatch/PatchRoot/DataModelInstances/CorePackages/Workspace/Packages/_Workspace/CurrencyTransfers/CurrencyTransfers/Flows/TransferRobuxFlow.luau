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

function TransferRobuxFlow(p1)
	-- upvalues: TransferDirectionModule (copy), CreateTransferStoreModule (copy), SharedFlagsModule (copy), HttpService (copy), TransferOriginationModule (copy), InitiateTransferModule (copy), AcceptTransferModule (copy), LogCurrencyTransferCounterModule (copy), CurrencyTransferTelemetryModule (copy), LogRobuxTransferFlowEventModule (copy), RobuxTransferFlowEventNameModule (copy), ReactModule (copy), TransferRobuxAppModule (copy)
	if p1.direction ~= TransferDirectionModule.Send and p1.direction ~= TransferDirectionModule.Receive then
		error(string.format("[TransferRobuxFlow] Invalid direction: '%s'. Must be either TransferDirection.Send or TransferDirection.Receive.", (tostring(p1.direction))))
	end
	local TransferStoreModule = CreateTransferStoreModule()
	
	if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
		TransferStoreModule.setTransferClientSessionId(HttpService:GenerateGUID(false))
	end
	TransferStoreModule.setOnClose(p1.onClose)
	TransferStoreModule.setDirection(p1.direction)
	
	if p1.transferOrigination then
		local Lowered = string.lower(p1.transferOrigination)
		TransferStoreModule.setTransferOrigination(if Lowered == "unknown" then TransferOriginationModule.Unknown elseif Lowered == "profile" then TransferOriginationModule.Profile elseif Lowered == "chat" then TransferOriginationModule.Chat elseif Lowered == "buyrobux" then TransferOriginationModule.BuyRobux elseif Lowered == "inexperience" then TransferOriginationModule.InExperience else TransferOriginationModule.Unknown)
	end
	if p1.direction == TransferDirectionModule.Send then
		if p1.recipientUserId then
			TransferStoreModule.setRecipientUserId(p1.recipientUserId)
		end
		InitiateTransferModule(TransferStoreModule)
	elseif p1.direction == TransferDirectionModule.Receive then
		if p1.transferId then
			TransferStoreModule.setTransferRequestId(p1.transferId)
		end
		AcceptTransferModule(TransferStoreModule)
	end
	LogCurrencyTransferCounterModule(TransferStoreModule, CurrencyTransferTelemetryModule.CurrencyTransferFlowOpenedCounter)
	
	if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
		LogRobuxTransferFlowEventModule(TransferStoreModule, RobuxTransferFlowEventNameModule.in_app_flow_open)
	end
	return (ReactModule.createElement(TransferRobuxAppModule, { transferStore = TransferStoreModule }))
end

return TransferRobuxFlow