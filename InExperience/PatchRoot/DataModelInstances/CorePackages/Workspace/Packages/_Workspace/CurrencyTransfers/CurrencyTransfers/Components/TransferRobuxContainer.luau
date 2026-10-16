local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local PromptStateModule = require(CurrencyTransfers.Enums.PromptState)
local TransferRobuxInputSheetModule = require(CurrencyTransfers.Components.Send.TransferRobuxInputSheet)
local TransferRobuxConfirmSheetModule = require(CurrencyTransfers.Components.Send.TransferRobuxConfirmSheet)
local TransferRobuxErrorSheetModule = require(CurrencyTransfers.Components.Send.TransferRobuxErrorSheet)
local InsufficientBalanceSheetModule = require(CurrencyTransfers.Components.Send.InsufficientBalanceSheet)
local TransferRobuxSuccessToastModule = require(CurrencyTransfers.Components.Send.TransferRobuxSuccessToast)
local TransferRobuxSuccessModalModule = require(CurrencyTransfers.Components.Send.TransferRobuxSuccessModal)
local TransferBlockSheetModule = require(CurrencyTransfers.Components.Send.TransferBlockSheet)
local ReceiveRobuxSuccessToastModule = require(CurrencyTransfers.Components.Receive.ReceiveRobuxSuccessToast)
local ReceiveBlockSheetModule = require(CurrencyTransfers.Components.Receive.ReceiveBlockSheet)
local ReceiveErrorSheetModule = require(CurrencyTransfers.Components.Receive.ReceiveErrorSheet)
local GetFFlagCurrencyTransferSuccessModalModule = require(CurrencyTransfers.Flags.GetFFlagCurrencyTransferSuccessModal)
local UseTransferStoreModule = require(CurrencyTransfers.Hooks.useTransferStore)

return function(_) --[[ Line: 30 | Named "TransferRobuxContainer" ]]
	-- upvalues: UseTransferStoreModule (copy), SignalsReactModule (copy), PromptStateModule (copy), ReactModule (copy), TransferRobuxInputSheetModule (copy), InsufficientBalanceSheetModule (copy), TransferRobuxConfirmSheetModule (copy), GetFFlagCurrencyTransferSuccessModalModule (copy), TransferRobuxSuccessModalModule (copy), TransferRobuxSuccessToastModule (copy), TransferRobuxErrorSheetModule (copy), TransferBlockSheetModule (copy), ReceiveRobuxSuccessToastModule (copy), ReceiveBlockSheetModule (copy), ReceiveErrorSheetModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseTransferStoreModule().getPromptState)
	
	return if UseSignalStateResult == PromptStateModule.TransferInput then ReactModule.createElement(TransferRobuxInputSheetModule, {}) elseif UseSignalStateResult == PromptStateModule.TransferInsufficientBalance then ReactModule.createElement(InsufficientBalanceSheetModule, {}) elseif UseSignalStateResult == PromptStateModule.TransferConfirm then ReactModule.createElement(TransferRobuxConfirmSheetModule, {}) elseif UseSignalStateResult == PromptStateModule.TransferSuccess then if GetFFlagCurrencyTransferSuccessModalModule() then ReactModule.createElement(TransferRobuxSuccessModalModule, {}) else ReactModule.createElement(TransferRobuxSuccessToastModule, {}) elseif UseSignalStateResult == PromptStateModule.TransferError then ReactModule.createElement(TransferRobuxErrorSheetModule, {}) elseif UseSignalStateResult == PromptStateModule.TransferBlocked then ReactModule.createElement(TransferBlockSheetModule) elseif UseSignalStateResult == PromptStateModule.ReceiveSuccess then ReactModule.createElement(ReceiveRobuxSuccessToastModule, {}) elseif UseSignalStateResult == PromptStateModule.ReceiveBlocked then ReactModule.createElement(ReceiveBlockSheetModule) elseif UseSignalStateResult == PromptStateModule.ReceiveError then ReactModule.createElement(ReceiveErrorSheetModule, {}) else nil
end