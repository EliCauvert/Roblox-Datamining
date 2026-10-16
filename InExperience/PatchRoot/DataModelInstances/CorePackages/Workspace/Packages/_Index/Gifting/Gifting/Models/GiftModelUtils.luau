local Gifting = script:FindFirstAncestor("Gifting")
local TModule = require(Gifting.Parent.t)
local ItemTypeModule = require(Gifting.Enums.ItemType)
local _ = require(Gifting.Types)
local GiftModelUtils = {
	invalidField = function(p1, ItemType): string --[[ Line: 22 ]]
		return `invalid {p1}: {tostring(ItemType)}`
	end,
	nonEmptyString = TModule.intersection(TModule.string, function(p1) --[[ Line: 26 ]]
		return p1 ~= "", "non-empty string expected, got empty string"
	end)
}
local InterfaceResult = TModule.interface({ itemId = GiftModelUtils.nonEmptyString })
local InterfaceResult1 = TModule.interface({
	year = TModule.number,
	month = TModule.number,
	day = TModule.number
})
local InterfaceResult2 = TModule.interface({ userId = TModule.number })
local InterfaceResult3 = TModule.interface({
	areFriends = TModule.boolean,
	mutualFriendsCount = TModule.number,
	userAccountSinceYear = TModule.number
})

function GiftModelUtils.formatList(p1, List, Callback) --[[ Line: 51 ]]
	-- upvalues: TModule (copy)
	local v1, v2 = TModule.table(List)
	
	if not v1 then
		return nil, `{p1}: {v2}`
	end
	local List1 = {}
	local CallbackResult2 = nil
	
	for i, value in List do
		local CallbackResult
		CallbackResult, CallbackResult2 = Callback(value)
		
		if CallbackResult == nil then
			return nil, `{p1}[{i}]: {CallbackResult2}`
		end
		table.insert(List1, CallbackResult)
	end
	return List1
end

function GiftModelUtils.formatItem(p2) --[[ Line: 68 ]]
	-- upvalues: InterfaceResult (copy), ItemTypeModule (copy), GiftModelUtils (copy)
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult(p2)
	
	if not InterfaceResultResult then
		return nil, `item: {InterfaceResultResult2}`
	end
	local FromValueResult = ItemTypeModule.fromValue(p2.itemType)
	
	if FromValueResult == nil or FromValueResult == ItemTypeModule.Invalid then
		return nil, GiftModelUtils.invalidField("itemType", p2.itemType)
	else
		return { itemType = FromValueResult, itemId = p2.itemId }
	end
end

function GiftModelUtils.formatDateInfo(FriendSinceDate) --[[ Line: 85 ]]
	-- upvalues: InterfaceResult1 (copy)
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult1(FriendSinceDate)
	
	if InterfaceResultResult then
		return {
			year = FriendSinceDate.year,
			month = FriendSinceDate.month,
			day = FriendSinceDate.day
		}
	else
		return nil, `date: {InterfaceResultResult2}`
	end
end

function GiftModelUtils.formatGiftSenderInfo(p2) --[[ Line: 99 ]]
	-- upvalues: InterfaceResult2 (copy)
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult2(p2)
	
	if InterfaceResultResult then
		return {
			userId = p2.userId,
			username = p2.username or "",
			displayName = p2.displayName or ""
		}
	else
		return nil, `sender: {InterfaceResultResult2}`
	end
end

function GiftModelUtils.formatUserRelationshipDetail(p2) --[[ Line: 113 ]]
	-- upvalues: InterfaceResult3 (copy), GiftModelUtils (copy), TModule (copy)
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult3(p2)
	
	if not InterfaceResultResult then
		return nil, `userRelationshipDetail: {InterfaceResultResult2}`
	end
	local FriendSinceDate = nil
	
	if p2.friendSinceDate ~= nil then
		local FormatDateInfoResult2
		FriendSinceDate, FormatDateInfoResult2 = GiftModelUtils.formatDateInfo(p2.friendSinceDate)
		
		if FriendSinceDate == nil then
			return nil, `userRelationshipDetail.friendSinceDate: {FormatDateInfoResult2}`
		end
	end
	return {
		areFriends = p2.areFriends,
		mutualFriendsCount = p2.mutualFriendsCount,
		friendSinceYear = if TModule.number(p2.friendSinceYear) then p2.friendSinceYear else nil,
		friendSinceDate = FriendSinceDate,
		userAccountSinceYear = p2.userAccountSinceYear
	}
end

return GiftModelUtils