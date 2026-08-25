local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local transferDirectionModule = require(currencyTransfers.Enums.TransferDirection)
local promptStateModule = require(currencyTransfers.Enums.PromptState)

return function(p0, p1)
	-- upvalues: transferDirectionModule (ref), promptStateModule (ref)
	local var3 = if p1 and p1.direction ~= nil then p1.direction else transferDirectionModule.Send
	
	local function _(p2, p3)
		-- upvalues: p0 (ref)
		if p0[p2] == nil then
			p0[p2] = p3
		end
	end
	
	local var4 = function()
		-- upvalues: var3 (ref)
		return var3
	end
	
	if p0.getDirection == nil then
		p0.getDirection = var4
	end
	local var5 = function()
		return nil
	end
	
	if p0.getRecipient == nil then
		p0.getRecipient = var5
	end
	local var6 = function()
		return 0
	end
	
	if p0.getRecipientUserId == nil then
		p0.getRecipientUserId = var6
	end
	local var7 = function()
		return nil
	end
	
	if p0.getSender == nil then
		p0.getSender = var7
	end
	local var8 = function()
		return nil
	end
	
	if p0.getTransferRequestId == nil then
		p0.getTransferRequestId = var8
	end
	local var9 = function()
		return nil
	end
	
	if p0.getSelectedAmount == nil then
		p0.getSelectedAmount = var9
	end
	local var10 = function()
		return nil
	end
	
	if p0.getRobuxTransfer == nil then
		p0.getRobuxTransfer = var10
	end
	local var11 = function()
		return nil
	end
	
	if p0.getTransferOrigination == nil then
		p0.getTransferOrigination = var11
	end
	local var12 = function()
		-- upvalues: promptStateModule (copy)
		return promptStateModule.Unspecified
	end
	
	if p0.getPromptState == nil then
		p0.getPromptState = var12
	end
	local var13 = function()
		return ""
	end
	
	if p0.getTransferClientSessionId == nil then
		p0.getTransferClientSessionId = var13
	end
	local var14 = function()
		return false
	end
	
	if p0.getBalanceReceivedFromApi == nil then
		p0.getBalanceReceivedFromApi = var14
	end
	local var15 = function()
		return 0
	end
	
	if p0.getRobuxBalanceAmount == nil then
		p0.getRobuxBalanceAmount = var15
	end
	local var16 = function()
		return nil
	end
	
	if p0.getNetworkImpl == nil then
		p0.getNetworkImpl = var16
	end
	local var17 = function()
		return nil
	end
	
	if p0.triggerOnPromptOptimisticHide == nil then
		p0.triggerOnPromptOptimisticHide = var17
	end
	local var18 = function()
		return nil
	end
	
	if p0.triggerOnPromptDismissCommitted == nil then
		p0.triggerOnPromptDismissCommitted = var18
	end
end