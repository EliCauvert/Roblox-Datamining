local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = require(CurrencyTransfers.types)
local TModule = require(CurrencyTransfers.Parent.t)
local AcceptTransferModelModule = {}

function AcceptTransferModelModule.new(p1) --[[ Line: 15 ]]
	-- upvalues: AcceptTransferModelModule (copy)
	assert(AcceptTransferModelModule.isValid(p1))
	AcceptTransferModelModule.__index = AcceptTransferModelModule
	setmetatable(p1, AcceptTransferModelModule)
	
	return p1
end

function AcceptTransferModelModule.mock(p1) --[[ Line: 27 ]]
	-- upvalues: CurrencyTransfers (copy), AcceptTransferModelModule (copy)
	local P1 = p1 or {}
	local TransferStatusModule = require(CurrencyTransfers.Enums.TransferStatus)
	
	return (AcceptTransferModelModule.new({
		robuxTransfer = P1.robuxTransfer or {
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
			status = TransferStatusModule.Completed
		},
		isAlreadyAccepted = P1.isAlreadyAccepted ~= nil and P1.isAlreadyAccepted
	}))
end

function AcceptTransferModelModule.format(p1) --[[ Line: 57 ]]
	-- upvalues: CurrencyTransfers (copy), AcceptTransferModelModule (copy)
	local RobuxTransfer = p1.robuxTransfer or p1.RobuxTransfer
	local IsIsAlreadyAccepted = if p1.isAlreadyAccepted == nil then p1.IsAlreadyAccepted == true else p1.isAlreadyAccepted
	local TransferStatusModule = require(CurrencyTransfers.Enums.TransferStatus)
	
	if not RobuxTransfer then
		error("AcceptTransferModel.format: robuxTransfer is missing from response")
	end
	return (AcceptTransferModelModule.new({
		isAlreadyAccepted = IsIsAlreadyAccepted,
		robuxTransfer = {
			transferId = RobuxTransfer.transferId or RobuxTransfer.TransferId,
			sender = {
				type = RobuxTransfer.sender.type or RobuxTransfer.Sender.Type,
				targetId = RobuxTransfer.sender.targetId or RobuxTransfer.Sender.TargetId,
				targetName = RobuxTransfer.sender.targetName or RobuxTransfer.Sender.TargetName,
				targetDisplayName = RobuxTransfer.sender.targetDisplayName or RobuxTransfer.Sender.TargetDisplayName
			},
			recipient = {
				type = RobuxTransfer.recipient.type or RobuxTransfer.Recipient.Type,
				targetId = RobuxTransfer.recipient.targetId or RobuxTransfer.Recipient.TargetId,
				targetName = RobuxTransfer.recipient.targetName or RobuxTransfer.Recipient.TargetName,
				targetDisplayName = RobuxTransfer.recipient.targetDisplayName or RobuxTransfer.Recipient.TargetDisplayName
			},
			transferAmount = RobuxTransfer.transferAmount or RobuxTransfer.TransferAmount,
			receivingAmount = RobuxTransfer.receivingAmount or RobuxTransfer.ReceivingAmount,
			creationTime = RobuxTransfer.creationTime or RobuxTransfer.CreationTime,
			requireRecipientAction = RobuxTransfer.requireRecipientAction or RobuxTransfer.RequireRecipientAction,
			status = TransferStatusModule.fromValue(RobuxTransfer.status or RobuxTransfer.Status) or TransferStatusModule.Completed
		}
	}))
end

AcceptTransferModelModule.isValid = TModule.strictInterface({
	robuxTransfer = TModule.table,
	isAlreadyAccepted = TModule.boolean
})

return AcceptTransferModelModule