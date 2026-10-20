local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local SignalsModule = require(CurrencyTransfers.Parent.Signals)
local PromptStateModule = require(CurrencyTransfers.Enums.PromptState)
local _ = require(CurrencyTransfers.types)
local _ = require(CurrencyTransfers.Enums.TransferDirection)
local _ = require(CurrencyTransfers.Enums.TransferOrigination)
local _ = require(CurrencyTransfers.Models.ErrorTransferModel)
local _ = require(CurrencyTransfers.Enums.TransferRetryOrigin)

return function()
	-- upvalues: SignalsModule (copy), PromptStateModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(PromptStateModule.Unspecified)
	local Signal1, Signal2_1 = SignalsModule.createSignal(nil)
	local Signal3, Signal2_2 = SignalsModule.createSignal(0)
	local Signal4, Signal2_3 = SignalsModule.createSignal(0)
	local Signal5, Signal2_4 = SignalsModule.createSignal(false)
	local Signal6, Signal2_5 = SignalsModule.createSignal(nil)
	local Signal7, Signal2_6 = SignalsModule.createSignal(nil)
	local Signal8, Signal2_7 = SignalsModule.createSignal(nil)
	local Signal9, Signal2_8 = SignalsModule.createSignal(nil)
	local Signal10, Signal2_9 = SignalsModule.createSignal(nil)
	local Signal11, Signal2_10 = SignalsModule.createSignal(nil)
	local Signal12, Signal2_11 = SignalsModule.createSignal(nil)
	local Signal13, Signal2_12 = SignalsModule.createSignal(false)
	local Signal14, Signal2_13 = SignalsModule.createSignal(nil)
	local Signal15, Signal2_14 = SignalsModule.createSignal(nil)
	local Signal16, Signal2_15 = SignalsModule.createSignal(nil)
	local Signal17, Signal2_16 = SignalsModule.createSignal(nil)
	local Signal18, Signal2_17 = SignalsModule.createSignal(nil)
	local Signal19, Signal2_18 = SignalsModule.createSignal("")
	local Signal20, Signal2_19 = SignalsModule.createSignal(nil)
	local Signal21, Signal2_20 = SignalsModule.createSignal(nil)
	local Callback = nil
	local Callback1 = nil
	local Callback2 = nil
	local Flag = false
	local NetworkImpl = nil
	
	return {
		getPromptState = Signal,
		setPromptState = Signal2,
		getTransferRequestId = Signal1,
		setTransferRequestId = Signal2_1,
		getRecipientUserId = Signal3,
		setRecipientUserId = Signal2_2,
		getRobuxBalanceAmount = Signal4,
		setRobuxBalanceAmount = Signal2_3,
		getBalanceReceivedFromApi = Signal5,
		setBalanceReceivedFromApi = Signal2_4,
		getSelectedAmount = Signal6,
		setSelectedAmount = Signal2_5,
		getUserRelationshipDetail = Signal7,
		setUserRelationshipDetail = Signal2_6,
		getRecipient = Signal8,
		setRecipient = Signal2_7,
		getSender = Signal9,
		setSender = Signal2_8,
		getDirection = Signal10,
		setDirection = Signal2_9,
		getTransferOrigination = Signal11,
		setTransferOrigination = Signal2_10,
		getRobuxTransfer = Signal12,
		setRobuxTransfer = Signal2_11,
		getIsAlreadyAccepted = Signal13,
		setIsAlreadyAccepted = Signal2_12,
		getErrorTransferModel = Signal14,
		setErrorTransferModel = Signal2_13,
		getAmpRecourseActions = Signal15,
		setAmpRecourseActions = Signal2_14,
		getAmpFeatureCheck = Signal16,
		setAmpFeatureCheck = Signal2_15,
		getPreviousPromptState = Signal17,
		setPreviousPromptState = Signal2_16,
		getTransferRetryOrigin = Signal18,
		setTransferRetryOrigin = Signal2_17,
		getTransferClientSessionId = Signal19,
		setTransferClientSessionId = Signal2_18,
		getMinimumTransferAmount = Signal20,
		setMinimumTransferAmount = Signal2_19,
		getMaximumTransferAmount = Signal21,
		setMaximumTransferAmount = Signal2_20,
		setOnClose = function(Value)
			-- upvalues: Callback (ref)
			Callback = Value
		end,
		triggerOnClose = function()
			-- upvalues: Callback (ref)
			if Callback then
				Callback()
			end
		end,
		setOnPromptOptimisticHide = function(Value)
			-- upvalues: Callback1 (ref)
			Callback1 = Value
		end,
		triggerOnPromptOptimisticHide = function()
			-- upvalues: Callback1 (ref)
			if Callback1 then
				Callback1()
			end
		end,
		setOnPromptDismissCommitted = function(Value)
			-- upvalues: Callback2 (ref), Flag (ref)
			Callback2 = Value
			Flag = false
		end,
		triggerOnPromptDismissCommitted = function()
			-- upvalues: Flag (ref), Callback2 (ref)
			if not Flag and Callback2 ~= nil then
				Flag = true
				Callback2()
				
				return
			end
		end,
		getNetworkImpl = function()
			-- upvalues: NetworkImpl (ref)
			return NetworkImpl
		end,
		setNetworkImpl = function(Value)
			-- upvalues: NetworkImpl (ref)
			NetworkImpl = Value
		end
	}
end