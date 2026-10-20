local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = require(CurrencyTransfers.types)
local TModule = require(CurrencyTransfers.Parent.t)
local InitiateTransferModelModule = {}

function InitiateTransferModelModule.new(p1)
	-- upvalues: InitiateTransferModelModule (copy)
	assert(InitiateTransferModelModule.isValid(p1))
	InitiateTransferModelModule.__index = InitiateTransferModelModule
	setmetatable(p1, InitiateTransferModelModule)
	
	return p1
end

function InitiateTransferModelModule.mock(p1)
	-- upvalues: InitiateTransferModelModule (copy)
	local P1 = p1 or {}
	local RobuxTransfer = P1.robuxTransfer or {}
	
	return (InitiateTransferModelModule.new({
		transferRequestId = P1.transferRequestId or "RXT-1234567890",
		robuxTransfer = {
			transferId = RobuxTransfer.transferId or 1234567890,
			sender = RobuxTransfer.sender or {
				targetDisplayName = "MockSender",
				targetId = 0,
				targetName = "mock",
				type = 1
			},
			recipient = RobuxTransfer.recipient or {
				targetDisplayName = "MockRecipient",
				targetId = 0,
				targetName = "mock",
				type = 1
			}
		},
		userRelationshipDetail = P1.userRelationshipDetail or {
			mutualFriendsCount = 0,
			userAccountSinceYear = 0,
			areFriends = false
		},
		senderRobuxBalance = P1.senderRobuxBalance or 0
	}))
end

function InitiateTransferModelModule.format(p1)
	-- upvalues: InitiateTransferModelModule (copy)
	local RobuxTransfer = p1.robuxTransfer
	local Sender = RobuxTransfer.sender
	
	return (InitiateTransferModelModule.new({
		transferRequestId = p1.transferRequestId,
		robuxTransfer = {
			transferId = RobuxTransfer.transferId,
			sender = if Sender then {
				targetDisplayName = Sender.targetDisplayName,
				targetId = Sender.targetId,
				targetName = Sender.targetName,
				type = Sender.type
			} else {
				targetDisplayName = "",
				targetId = 0,
				targetName = "",
				type = 0
			},
			recipient = {
				targetDisplayName = RobuxTransfer.recipient.targetDisplayName,
				targetId = RobuxTransfer.recipient.targetId,
				targetName = RobuxTransfer.recipient.targetName,
				type = RobuxTransfer.recipient.type
			}
		},
		senderRobuxBalance = p1.senderRobuxBalance,
		minimumTransferAmount = p1.minimumTransferAmount,
		maximumTransferAmount = p1.maximumTransferAmount,
		userRelationshipDetail = {
			friendSinceYear = p1.userRelationshipDetail.friendSinceYear,
			friendSinceDate = p1.userRelationshipDetail.friendSinceDate,
			mutualFriendsCount = p1.userRelationshipDetail.mutualFriendsCount,
			userAccountSinceYear = p1.userRelationshipDetail.userAccountSinceYear,
			areFriends = p1.userRelationshipDetail.areFriends
		}
	}))
end

InitiateTransferModelModule.isValid = TModule.strictInterface({
	transferRequestId = TModule.string,
	robuxTransfer = TModule.strictInterface({
		transferId = TModule.number,
		sender = TModule.strictInterface({
			targetDisplayName = TModule.string,
			targetId = TModule.number,
			targetName = TModule.string,
			type = TModule.number
		}),
		recipient = TModule.strictInterface({
			targetDisplayName = TModule.string,
			targetId = TModule.number,
			targetName = TModule.string,
			type = TModule.number
		})
	}),
	userRelationshipDetail = TModule.strictInterface({
		friendSinceYear = TModule.optional(TModule.number),
		friendSinceDate = TModule.optional(TModule.strictInterface({
			year = TModule.number,
			month = TModule.number,
			day = TModule.number
		})),
		mutualFriendsCount = TModule.number,
		userAccountSinceYear = TModule.number,
		areFriends = TModule.boolean
	}),
	senderRobuxBalance = TModule.number,
	minimumTransferAmount = TModule.optional(TModule.number),
	maximumTransferAmount = TModule.optional(TModule.number)
})

return InitiateTransferModelModule