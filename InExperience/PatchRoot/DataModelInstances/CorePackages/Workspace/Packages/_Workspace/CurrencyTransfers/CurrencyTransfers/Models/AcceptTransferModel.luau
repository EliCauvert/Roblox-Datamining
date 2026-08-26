local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = require(currencyTransfers.types)
local tModule = require(currencyTransfers.Parent.t)
local t = {}

function t.new(p1)
	-- upvalues: t (ref)
	assert(t.isValid(p1))
	t.__index = t
	setmetatable(p1, t)
	
	return p1
end

function t.mock(p1)
	-- upvalues: currencyTransfers (ref), t (ref)
	p1 = p1 or {}
	
	return t.new({
		robuxTransfer = p1.robuxTransfer or {
			transferId = 123456,
			transferAmount = 100,
			creationTime = "2025-01-01T00:00:00Z",
			requireRecipientAction = false,
			sender = {
				type = 1,
				targetId = 100,
				targetName = "SenderUser",
				targetDisplayName = "Sender Display"
			},
			recipient = {
				type = 1,
				targetId = 200,
				targetName = "RecipientUser",
				targetDisplayName = "Recipient Display"
			},
			status = require(currencyTransfers.Enums.TransferStatus).Completed
		},
		isAlreadyAccepted = if p1.isAlreadyAccepted ~= nil then false else p1.isAlreadyAccepted
	})
end

function t.format(p1)
	-- upvalues: currencyTransfers (ref), t (ref)
	local robuxTransfer = p1.robuxTransfer or p1.RobuxTransfer
	local var1 = if p1.isAlreadyAccepted ~= nil then p1.IsAlreadyAccepted == true else p1.isAlreadyAccepted
	local transferStatusModule = require(currencyTransfers.Enums.TransferStatus)
	
	if not robuxTransfer then
		error("AcceptTransferModel.format: robuxTransfer is missing from response")
	end
	return t.new({
		isAlreadyAccepted = var1,
		robuxTransfer = {
			transferId = robuxTransfer.transferId or robuxTransfer.TransferId,
			sender = {
				type = robuxTransfer.sender.type or robuxTransfer.Sender.Type,
				targetId = robuxTransfer.sender.targetId or robuxTransfer.Sender.TargetId,
				targetName = robuxTransfer.sender.targetName or robuxTransfer.Sender.TargetName,
				targetDisplayName = robuxTransfer.sender.targetDisplayName or robuxTransfer.Sender.TargetDisplayName
			},
			recipient = {
				type = robuxTransfer.recipient.type or robuxTransfer.Recipient.Type,
				targetId = robuxTransfer.recipient.targetId or robuxTransfer.Recipient.TargetId,
				targetName = robuxTransfer.recipient.targetName or robuxTransfer.Recipient.TargetName,
				targetDisplayName = robuxTransfer.recipient.targetDisplayName or robuxTransfer.Recipient.TargetDisplayName
			},
			transferAmount = robuxTransfer.transferAmount or robuxTransfer.TransferAmount,
			receivingAmount = robuxTransfer.receivingAmount or robuxTransfer.ReceivingAmount,
			creationTime = robuxTransfer.creationTime or robuxTransfer.CreationTime,
			requireRecipientAction = robuxTransfer.requireRecipientAction or robuxTransfer.RequireRecipientAction,
			status = transferStatusModule.fromValue(robuxTransfer.status or robuxTransfer.Status) or transferStatusModule.Completed
		}
	})
end

t.isValid = tModule.strictInterface({
	robuxTransfer = tModule.table,
	isAlreadyAccepted = tModule.boolean
})

return t