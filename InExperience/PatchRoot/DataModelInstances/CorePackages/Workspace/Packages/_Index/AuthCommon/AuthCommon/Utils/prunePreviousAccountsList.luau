local AuthCommon = script:FindFirstAncestor("AuthCommon")
local AppStorageUtilitiesModule = require(AuthCommon.Utils.AppStorageUtilities)
local CryoModule = require(AuthCommon.Parent.Cryo)
local DefaultMaxPruneAccounts = game:DefineFastInt("DefaultMaxPruneAccounts", 50)
local _ = require(AuthCommon.Utils.PreviousAccountEntry)

return function(): boolean --[[ Line: 10 | Named "prunePreviousAccountsList" ]]
	-- upvalues: AppStorageUtilitiesModule (copy), CryoModule (copy), DefaultMaxPruneAccounts (copy)
	local ValuesResult = CryoModule.Dictionary.values((AppStorageUtilitiesModule.getPreviousAccountsList()))
	local FilterResult = CryoModule.List.filter(ValuesResult, function(p1): boolean --[[ Line: 13 ]]
		return p1.signOutTimestamp == nil
	end)
	local FilterResult1 = CryoModule.List.filter(ValuesResult, function(p1): boolean --[[ Line: 16 ]]
		return p1.signOutTimestamp ~= nil
	end)
	
	if #FilterResult1 <= DefaultMaxPruneAccounts then
		return true
	end
	local t = {}
	local Count = 0
	
	for _, value in ipairs((CryoModule.List.sort(FilterResult1, function(p1, p2): boolean --[[ Line: 28 ]]
		return p2.signOutTimestamp < p1.signOutTimestamp
	end))) do
		if DefaultMaxPruneAccounts <= Count then break end
		if value.userId then
			t[value.userId] = value
		end
		Count += 1
	end
	for _, value1 in ipairs(FilterResult) do
		if value1.userId then
			t[value1.userId] = value1
		end
	end
	AppStorageUtilitiesModule.setPreviousAccountsList(t)
	
	return true
end