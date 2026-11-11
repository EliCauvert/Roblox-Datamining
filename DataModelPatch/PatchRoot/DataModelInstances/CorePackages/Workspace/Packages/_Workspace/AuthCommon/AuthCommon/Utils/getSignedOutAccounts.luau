local AuthCommon = script:FindFirstAncestor("AuthCommon")
local AppStorageUtilitiesModule = require(AuthCommon.Utils.AppStorageUtilities)
local _ = require(AuthCommon.Utils.PreviousAccountEntry)
local Parent = AuthCommon.Parent
local CryoModule = require(Parent.Cryo)
local GetFFlagShowInvoluntarilySignedOutAccountsFunction = require(Parent.SharedFlags).GetFFlagShowInvoluntarilySignedOutAccounts

local function _(p1, p2, p3)
	local List = {}
	
	for i = p2, p3 do
		table.insert(List, p1[i])
	end
	return List
end

return function(p4: number, p5, Enabled)
	-- upvalues: AppStorageUtilitiesModule (copy), GetFFlagShowInvoluntarilySignedOutAccountsFunction (copy), CryoModule (copy)
	local PreviousAccountsList = AppStorageUtilitiesModule.getPreviousAccountsList()
	local FFlagShowInvoluntarilySignedOutAccounts = GetFFlagShowInvoluntarilySignedOutAccountsFunction()
	local FilterResult = CryoModule.List.filter(CryoModule.Dictionary.values(PreviousAccountsList), function(p6)
		-- upvalues: FFlagShowInvoluntarilySignedOutAccounts (copy), p5 (copy), Enabled (copy)
		if FFlagShowInvoluntarilySignedOutAccounts then
			local IsNotShowInAccountPicker: boolean = Enabled == true and p6.showInAccountPicker == false
			
			return not (p5 ~= nil and (p6.userId ~= nil and p5[p6.userId] == true)) and not IsNotShowInAccountPicker
		else
			return p6.signOutTimestamp
		end
	end)
	local SortResult = if FFlagShowInvoluntarilySignedOutAccounts then CryoModule.List.sort(FilterResult, function(p6, p7): boolean
		return (p7.signOutTimestamp or (p7.signInTimestamp or 0)) < (p6.signOutTimestamp or (p6.signInTimestamp or 0))
	end) else CryoModule.List.sort(FilterResult, function(p6, p7): boolean
		return p7.signOutTimestamp < p6.signOutTimestamp
	end)
	
	if not SortResult then
		return {}
	end
	local List = {}
	
	for i = 1, math.min(p4, #SortResult) do
		table.insert(List, SortResult[i])
	end
	return List
end