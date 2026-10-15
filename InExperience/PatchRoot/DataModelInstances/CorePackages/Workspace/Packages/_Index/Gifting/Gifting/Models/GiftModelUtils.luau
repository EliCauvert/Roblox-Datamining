local gifting = script:FindFirstAncestor("Gifting")
local tModule = require(gifting.Parent.t)
local itemTypeModule = require(gifting.Enums.ItemType)
local _ = require(gifting.Types)
local t = {
	invalidField = function(p1, p2)
		return `invalid {p1}: {tostring(p2)}`
	end,
	nonEmptyString = tModule.intersection(tModule.string, function(p1)
		return p1 ~= "", "non-empty string expected, got empty string"
	end)
}
local var1 = tModule.interface({ itemId = t.nonEmptyString })
local var2 = tModule.interface({
	year = tModule.number,
	month = tModule.number,
	day = tModule.number
})
local var3 = tModule.interface({ userId = tModule.number })
local var4 = tModule.interface({
	areFriends = tModule.boolean,
	mutualFriendsCount = tModule.number,
	userAccountSinceYear = tModule.number
})

function t.formatList(p1, p2, p3)
	-- upvalues: tModule (ref)
	local var5, var6 = tModule.table(p2)
	
	if not var5 then
		return nil, `{p1}: {var6}`
	end
	local t = {}
	
	for i, v in p2 do
		local var7, var8 = p3(v)
		
		if var7 ~= nil then
			table.insert(t, var7)
			continue
		end
		return nil, `{p1}[{i}]: {var8}`
	end
	return t
end

function t.formatItem(p4)
	-- upvalues: var1 (ref), itemTypeModule (ref), t (ref)
	local var9, var10 = var1(p4)
	
	if not var9 then
		return nil, `item: {var10}`
	end
	local var11 = itemTypeModule.fromValue(p4.itemType)
	
	if var11 == nil or var11 == itemTypeModule.Invalid then
		return nil, t.invalidField("itemType", p4.itemType)
	end
	return { itemType = var11, itemId = p4.itemId }
end

function t.formatDateInfo(p4)
	-- upvalues: var2 (ref)
	local var9, var10 = var2(p4)
	
	if var9 then
		return { year = p4.year, month = p4.month, day = p4.day }
	end
	return nil, `date: {var10}`
end

function t.formatGiftSenderInfo(p4)
	-- upvalues: var3 (ref)
	local var9, var10 = var3(p4)
	
	if var9 then
		return {
			userId = p4.userId,
			username = p4.username or "",
			displayName = p4.displayName or ""
		}
	end
	return nil, `sender: {var10}`
end

function t.formatUserRelationshipDetail(p4)
	-- upvalues: var4 (ref), t (ref), tModule (ref)
	local var9, var10 = var4(p4)
	
	if not var9 then
		return nil, `userRelationshipDetail: {var10}`
	end
	local var11 = nil
	
	if p4.friendSinceDate ~= nil then
		local _ = nil
		local var12, var13 = t.formatDateInfo(p4.friendSinceDate)
		var11 = var12
		local var14 = var13
		
		if var11 == nil then
			return nil, `userRelationshipDetail.friendSinceDate: {var14}`
		end
	end
	return {
		areFriends = p4.areFriends,
		mutualFriendsCount = p4.mutualFriendsCount,
		friendSinceYear = if tModule.number(p4.friendSinceYear) then p4.friendSinceYear else nil,
		friendSinceDate = var11,
		userAccountSinceYear = p4.userAccountSinceYear
	}
end

return t