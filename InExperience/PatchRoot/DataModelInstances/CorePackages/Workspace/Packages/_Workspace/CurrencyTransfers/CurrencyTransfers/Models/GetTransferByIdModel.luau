local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = require(CurrencyTransfers.types)
local TModule = require(CurrencyTransfers.Parent.t)
local GetTransferByIdModelModule = {}

function GetTransferByIdModelModule.new(p1) --[[ Line: 14 ]]
	-- upvalues: GetTransferByIdModelModule (copy)
	assert(GetTransferByIdModelModule.isValid(p1))
	GetTransferByIdModelModule.__index = GetTransferByIdModelModule
	setmetatable(p1, GetTransferByIdModelModule)
	
	return p1
end

function GetTransferByIdModelModule.mock(p1) --[[ Line: 26 ]]
	-- upvalues: CurrencyTransfers (copy), GetTransferByIdModelModule (copy)
	local TransferStatusModule = require(CurrencyTransfers.Enums.TransferStatus)
	
	return (GetTransferByIdModelModule.new({
		transfer = (p1 or {}).transfer or {
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
		}
	}))
end

local function formatRobuxTransfer(Transfer) --[[ Line: 56 ]]
	-- upvalues: CurrencyTransfers (copy)
	local TransferStatusModule = require(CurrencyTransfers.Enums.TransferStatus)
	local Sender = Transfer.sender
	local Recipient = Transfer.recipient
	
	return {
		transferId = Transfer.transferId,
		sender = {
			type = Sender.type,
			targetId = Sender.targetId,
			targetName = Sender.targetName,
			targetDisplayName = Sender.targetDisplayName
		},
		recipient = {
			type = Recipient.type,
			targetId = Recipient.targetId,
			targetName = Recipient.targetName,
			targetDisplayName = Recipient.targetDisplayName
		},
		transferAmount = Transfer.transferAmount,
		creationTime = Transfer.creationTime,
		requireRecipientAction = Transfer.requireRecipientAction,
		status = TransferStatusModule.fromValue(Transfer.status) or TransferStatusModule.Completed
	}
end

function GetTransferByIdModelModule.format(p1) --[[ Line: 81 ]]
	-- upvalues: GetTransferByIdModelModule (copy), formatRobuxTransfer (copy)
	local Transfer = p1.transfer
	
	if not Transfer then
		error("GetTransferByIdModel.format: transfer is missing from response")
	end
	return (GetTransferByIdModelModule.new({ transfer = formatRobuxTransfer(Transfer) }))
end

GetTransferByIdModelModule.isValid = TModule.strictInterface({ transfer = TModule.table })

return GetTransferByIdModelModule