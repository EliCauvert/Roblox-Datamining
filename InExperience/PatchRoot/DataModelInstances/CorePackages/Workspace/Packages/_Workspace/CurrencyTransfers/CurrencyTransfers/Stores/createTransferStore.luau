local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local signalsModule = require(currencyTransfers.Parent.Signals)
local promptStateModule = require(currencyTransfers.Enums.PromptState)
local _ = require(currencyTransfers.types)
local _ = require(currencyTransfers.Enums.TransferDirection)
local _ = require(currencyTransfers.Enums.TransferOrigination)
local _ = require(currencyTransfers.Models.ErrorTransferModel)
local _ = require(currencyTransfers.Enums.TransferRetryOrigin)

return function()
	-- upvalues: signalsModule (ref), promptStateModule (ref)
	local var3, var4 = signalsModule.createSignal(promptStateModule.Unspecified)
	local var5, var6 = signalsModule.createSignal(nil)
	local var7, var8 = signalsModule.createSignal(0)
	local var9, var10 = signalsModule.createSignal(0)
	local var11, var12 = signalsModule.createSignal(false)
	local var13, var14 = signalsModule.createSignal(nil)
	local var15, var16 = signalsModule.createSignal(nil)
	local var17, var18 = signalsModule.createSignal(nil)
	local var19, var20 = signalsModule.createSignal(nil)
	local var21, var22 = signalsModule.createSignal(nil)
	local var23, var24 = signalsModule.createSignal(nil)
	local var25, var26 = signalsModule.createSignal(nil)
	local var27, var28 = signalsModule.createSignal(false)
	local var29, var30 = signalsModule.createSignal(nil)
	local var31, var32 = signalsModule.createSignal(nil)
	local var33, var34 = signalsModule.createSignal(nil)
	local var35, var36 = signalsModule.createSignal(nil)
	local var37, var38 = signalsModule.createSignal(nil)
	local var39, var40 = signalsModule.createSignal("")
	local var41, var42 = signalsModule.createSignal(nil)
	local var43, var44 = signalsModule.createSignal(nil)
	local var45 = nil
	local var46 = nil
	local var47 = nil
	local var48 = false
	local var49 = nil
	
	return {
		getPromptState = var3,
		setPromptState = var4,
		getTransferRequestId = var5,
		setTransferRequestId = var6,
		getRecipientUserId = var7,
		setRecipientUserId = var8,
		getRobuxBalanceAmount = var9,
		setRobuxBalanceAmount = var10,
		getBalanceReceivedFromApi = var11,
		setBalanceReceivedFromApi = var12,
		getSelectedAmount = var13,
		setSelectedAmount = var14,
		getUserRelationshipDetail = var15,
		setUserRelationshipDetail = var16,
		getRecipient = var17,
		setRecipient = var18,
		getSender = var19,
		setSender = var20,
		getDirection = var21,
		setDirection = var22,
		getTransferOrigination = var23,
		setTransferOrigination = var24,
		getRobuxTransfer = var25,
		setRobuxTransfer = var26,
		getIsAlreadyAccepted = var27,
		setIsAlreadyAccepted = var28,
		getErrorTransferModel = var29,
		setErrorTransferModel = var30,
		getAmpRecourseActions = var31,
		setAmpRecourseActions = var32,
		getAmpFeatureCheck = var33,
		setAmpFeatureCheck = var34,
		getPreviousPromptState = var35,
		setPreviousPromptState = var36,
		getTransferRetryOrigin = var37,
		setTransferRetryOrigin = var38,
		getTransferClientSessionId = var39,
		setTransferClientSessionId = var40,
		getMinimumTransferAmount = var41,
		setMinimumTransferAmount = var42,
		getMaximumTransferAmount = var43,
		setMaximumTransferAmount = var44,
		setOnClose = function(value)
			-- upvalues: var45 (write)
			var45 = value
		end,
		triggerOnClose = function()
			-- upvalues: var45 (write)
			if var45 then
				var45()
			end
		end,
		setOnPromptOptimisticHide = function(value)
			-- upvalues: var46 (write)
			var46 = value
		end,
		triggerOnPromptOptimisticHide = function()
			-- upvalues: var46 (write)
			if var46 then
				var46()
			end
		end,
		setOnPromptDismissCommitted = function(value)
			-- upvalues: var47 (write), var48 (write)
			var47 = value
			var48 = false
		end,
		triggerOnPromptDismissCommitted = function()
			-- upvalues: var48 (write), var47 (write)
			if var48 or var47 == nil then
				return
			end
			var48 = true
			var47()
		end,
		getNetworkImpl = function()
			-- upvalues: var49 (write)
			return var49
		end,
		setNetworkImpl = function(value)
			-- upvalues: var49 (write)
			var49 = value
		end
	}
end