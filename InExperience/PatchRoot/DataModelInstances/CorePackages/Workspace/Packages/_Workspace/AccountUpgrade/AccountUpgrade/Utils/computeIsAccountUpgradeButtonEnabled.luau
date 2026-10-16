local accountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local inputValidity = require(accountUpgrade.Parent.AuthCommon).Enums.InputValidity
local accountUpgradeFieldModule = require(accountUpgrade.AccountUpgradeField)
local list = {
	accountUpgradeFieldModule.Birthday,
	accountUpgradeFieldModule.Username,
	accountUpgradeFieldModule.Password
}

return function(p1)
	-- upvalues: list (ref), accountUpgradeFieldModule (ref), inputValidity (ref)
	if p1.isSubmitting then
		return false
	end
	local t = {}
	
	for i, v in ipairs(p1.requiredFields or list) do
		t[v] = true
	end
	return if t[accountUpgradeFieldModule.Birthday] and p1.birthday == nil then false elseif t[accountUpgradeFieldModule.Birthday] and p1.isBirthdayOldEnough == false then false elseif t[accountUpgradeFieldModule.Username] and ((p1.username or "") == "" or p1.usernameValid ~= inputValidity.Valid) then false elseif t[accountUpgradeFieldModule.Password] and ((p1.password or "") == "" or p1.passwordValid ~= inputValidity.Valid) then false else (p1.email or "") == "" or p1.emailValid == true
end