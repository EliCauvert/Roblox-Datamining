local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local promptStateModule = require(currencyTransfers.Enums.PromptState)
local transferRobuxInputSheetModule = require(currencyTransfers.Components.Send.TransferRobuxInputSheet)
local transferRobuxConfirmSheetModule = require(currencyTransfers.Components.Send.TransferRobuxConfirmSheet)
local transferRobuxErrorSheetModule = require(currencyTransfers.Components.Send.TransferRobuxErrorSheet)
local insufficientBalanceSheetModule = require(currencyTransfers.Components.Send.InsufficientBalanceSheet)
local transferRobuxSuccessToastModule = require(currencyTransfers.Components.Send.TransferRobuxSuccessToast)
local transferRobuxSuccessModalModule = require(currencyTransfers.Components.Send.TransferRobuxSuccessModal)
local transferBlockSheetModule = require(currencyTransfers.Components.Send.TransferBlockSheet)
local receiveRobuxSuccessToastModule = require(currencyTransfers.Components.Receive.ReceiveRobuxSuccessToast)
local receiveBlockSheetModule = require(currencyTransfers.Components.Receive.ReceiveBlockSheet)
local receiveErrorSheetModule = require(currencyTransfers.Components.Receive.ReceiveErrorSheet)
local getFFlagCurrencyTransferSuccessModalModule = require(currencyTransfers.Flags.GetFFlagCurrencyTransferSuccessModal)
local useTransferStoreModule = require(currencyTransfers.Hooks.useTransferStore)

return function(_)
	-- upvalues: useTransferStoreModule (ref), signalsReactModule (ref), promptStateModule (ref), reactModule (ref), transferRobuxInputSheetModule (ref), insufficientBalanceSheetModule (ref), transferRobuxConfirmSheetModule (ref), getFFlagCurrencyTransferSuccessModalModule (ref), transferRobuxSuccessModalModule (ref), transferRobuxSuccessToastModule (ref), transferRobuxErrorSheetModule (ref), transferBlockSheetModule (ref), receiveRobuxSuccessToastModule (ref), receiveBlockSheetModule (ref), receiveErrorSheetModule (ref)
	local var16 = signalsReactModule.useSignalState(useTransferStoreModule().getPromptState)
	
	return if var16 == promptStateModule.TransferInput then reactModule.createElement(transferRobuxInputSheetModule, {}) elseif var16 == promptStateModule.TransferInsufficientBalance then reactModule.createElement(insufficientBalanceSheetModule, {}) elseif var16 == promptStateModule.TransferConfirm then reactModule.createElement(transferRobuxConfirmSheetModule, {}) elseif var16 == promptStateModule.TransferSuccess then if getFFlagCurrencyTransferSuccessModalModule() then reactModule.createElement(transferRobuxSuccessModalModule, {}) else reactModule.createElement(transferRobuxSuccessToastModule, {}) elseif var16 == promptStateModule.TransferError then reactModule.createElement(transferRobuxErrorSheetModule, {}) elseif var16 == promptStateModule.TransferBlocked then reactModule.createElement(transferBlockSheetModule) elseif var16 == promptStateModule.ReceiveSuccess then reactModule.createElement(receiveRobuxSuccessToastModule, {}) elseif var16 == promptStateModule.ReceiveBlocked then reactModule.createElement(receiveBlockSheetModule) elseif var16 == promptStateModule.ReceiveError then reactModule.createElement(receiveErrorSheetModule, {}) else nil
end