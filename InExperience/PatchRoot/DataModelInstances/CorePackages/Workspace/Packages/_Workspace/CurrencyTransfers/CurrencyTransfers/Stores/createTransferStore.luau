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
	local var1, var2 = signalsModule.createSignal(promptStateModule.Unspecified)
	local var3, var4 = signalsModule.createSignal(nil)
	local var5, var6 = signalsModule.createSignal(0)
	local var7, var8 = signalsModule.createSignal(0)
	local var9, var10 = signalsModule.createSignal(false)
	local var11, var12 = signalsModule.createSignal(nil)
	local var13, var14 = signalsModule.createSignal(nil)
	local var15, var16 = signalsModule.createSignal(nil)
	local var17, var18 = signalsModule.createSignal(nil)
	local var19, var20 = signalsModule.createSignal(nil)
	local var21, var22 = signalsModule.createSignal(nil)
	local var23, var24 = signalsModule.createSignal(nil)
	local var25, var26 = signalsModule.createSignal(false)
	local var27, var28 = signalsModule.createSignal(nil)
	local var29, var30 = signalsModule.createSignal(nil)
	local var31, var32 = signalsModule.createSignal(nil)
	local var33, var34 = signalsModule.createSignal(nil)
	local var35, var36 = signalsModule.createSignal(nil)
	local var37, var38 = signalsModule.createSignal("")
	local var39, var40 = signalsModule.createSignal(nil)
	local var41, var42 = signalsModule.createSignal(nil)
	local var43 = nil
	local var44 = nil
	local var45 = nil
	local var46 = false
	local var47 = nil
	
	return {
		getPromptState = var1,
		setPromptState = var2,
		getTransferRequestId = var3,
		setTransferRequestId = var4,
		getRecipientUserId = var5,
		setRecipientUserId = var6,
		getRobuxBalanceAmount = var7,
		setRobuxBalanceAmount = var8,
		getBalanceReceivedFromApi = var9,
		setBalanceReceivedFromApi = var10,
		getSelectedAmount = var11,
		setSelectedAmount = var12,
		getUserRelationshipDetail = var13,
		setUserRelationshipDetail = var14,
		getRecipient = var15,
		setRecipient = var16,
		getSender = var17,
		setSender = var18,
		getDirection = var19,
		setDirection = var20,
		getTransferOrigination = var21,
		setTransferOrigination = var22,
		getRobuxTransfer = var23,
		setRobuxTransfer = var24,
		getIsAlreadyAccepted = var25,
		setIsAlreadyAccepted = var26,
		getErrorTransferModel = var27,
		setErrorTransferModel = var28,
		getAmpRecourseActions = var29,
		setAmpRecourseActions = var30,
		getAmpFeatureCheck = var31,
		setAmpFeatureCheck = var32,
		getPreviousPromptState = var33,
		setPreviousPromptState = var34,
		getTransferRetryOrigin = var35,
		setTransferRetryOrigin = var36,
		getTransferClientSessionId = var37,
		setTransferClientSessionId = var38,
		getMinimumTransferAmount = var39,
		setMinimumTransferAmount = var40,
		getMaximumTransferAmount = var41,
		setMaximumTransferAmount = var42,
		setOnClose = function(value)
			-- upvalues: var43 (write)
			var43 = value
		end,
		triggerOnClose = function()
			-- upvalues: var43 (write)
			if var43 then
				var43()
			end
		end,
		setOnPromptOptimisticHide = function(value)
			-- upvalues: var44 (write)
			var44 = value
		end,
		triggerOnPromptOptimisticHide = function()
			-- upvalues: var44 (write)
			if var44 then
				var44()
			end
		end,
		setOnPromptDismissCommitted = function(value)
			-- upvalues: var45 (write), var46 (write)
			var45 = value
			var46 = false
		end,
		triggerOnPromptDismissCommitted = function()
			-- upvalues: var46 (write), var45 (write)
			if var46 or var45 == nil then
				return
			end
			var46 = true
			var45()
		end,
		getNetworkImpl = function()
			-- upvalues: var47 (write)
			return var47
		end,
		setNetworkImpl = function(value)
			-- upvalues: var47 (write)
			var47 = value
		end
	}
end