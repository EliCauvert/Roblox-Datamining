local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local transferDirectionModule = require(currencyTransfers.Enums.TransferDirection)
local promptStateModule = require(currencyTransfers.Enums.PromptState)

return function(p1, p2)
	-- upvalues: transferDirectionModule (ref), promptStateModule (ref)
	local var1 = if p2 and p2.direction ~= nil then p2.direction else transferDirectionModule.Send
	
	local function _(p3, p4)
		-- upvalues: p1 (ref)
		if p1[p3] == nil then
			p1[p3] = p4
		end
	end
	
	local var2 = function()
		-- upvalues: var1 (ref)
		return var1
	end
	
	if p1.getDirection == nil then
		p1.getDirection = var2
	end
	local var3 = function()
		return nil
	end
	
	if p1.getRecipient == nil then
		p1.getRecipient = var3
	end
	local var4 = function()
		return 0
	end
	
	if p1.getRecipientUserId == nil then
		p1.getRecipientUserId = var4
	end
	local var5 = function()
		return nil
	end
	
	if p1.getSender == nil then
		p1.getSender = var5
	end
	local var6 = function()
		return nil
	end
	
	if p1.getTransferRequestId == nil then
		p1.getTransferRequestId = var6
	end
	local var7 = function()
		return nil
	end
	
	if p1.getSelectedAmount == nil then
		p1.getSelectedAmount = var7
	end
	local var8 = function()
		return nil
	end
	
	if p1.getRobuxTransfer == nil then
		p1.getRobuxTransfer = var8
	end
	local var9 = function()
		return nil
	end
	
	if p1.getTransferOrigination == nil then
		p1.getTransferOrigination = var9
	end
	local var10 = function()
		-- upvalues: promptStateModule (copy)
		return promptStateModule.Unspecified
	end
	
	if p1.getPromptState == nil then
		p1.getPromptState = var10
	end
	local var11 = function()
		return ""
	end
	
	if p1.getTransferClientSessionId == nil then
		p1.getTransferClientSessionId = var11
	end
	local var12 = function()
		return false
	end
	
	if p1.getBalanceReceivedFromApi == nil then
		p1.getBalanceReceivedFromApi = var12
	end
	local var13 = function()
		return 0
	end
	
	if p1.getRobuxBalanceAmount == nil then
		p1.getRobuxBalanceAmount = var13
	end
	local var14 = function()
		return nil
	end
	
	if p1.getNetworkImpl == nil then
		p1.getNetworkImpl = var14
	end
	local var15 = function()
		return nil
	end
	
	if p1.triggerOnPromptOptimisticHide == nil then
		p1.triggerOnPromptOptimisticHide = var15
	end
	local var16 = function()
		return nil
	end
	
	if p1.triggerOnPromptDismissCommitted == nil then
		p1.triggerOnPromptDismissCommitted = var16
	end
end