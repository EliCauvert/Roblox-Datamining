local AccountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local InputValidity = require(AccountUpgrade.Parent.AuthCommon).Enums.InputValidity
local AccountUpgradeFieldModule = require(AccountUpgrade.AccountUpgradeField)
local list = {
	AccountUpgradeFieldModule.Birthday,
	AccountUpgradeFieldModule.Username,
	AccountUpgradeFieldModule.Password
}

return function(p1): boolean
	-- upvalues: list (copy), AccountUpgradeFieldModule (copy), InputValidity (copy)
	if p1.isSubmitting then
		return false
	end
	local t = {}
	
	for _, value in ipairs(p1.requiredFields or list) do
		t[value] = true
	end
	if t[AccountUpgradeFieldModule.Birthday] and p1.birthday == nil then
		return false
	else
		local Username = p1.username or ""
		local Password = p1.password or ""
		local Email = p1.email or ""
		
		return (not t[AccountUpgradeFieldModule.Username] or Username ~= "" and p1.usernameValid == InputValidity.Valid) and ((not t[AccountUpgradeFieldModule.Password] or Password ~= "" and p1.passwordValid == InputValidity.Valid) and (Email == "" or p1.emailValid == true))
	end
end