local Parent = script:FindFirstAncestor("PreHomePage").Parent
local LaunchContext = require(Parent.AppStartup).Enums.LaunchContext
local GetPasswordManagerUsageStoreFunction = require(Parent.AuthCommon).Stores.GetPasswordManagerUsageStore

return {
	userJustLoggedIn = function(p1): boolean
		-- upvalues: LaunchContext (copy)
		p1:flush()
		
		return p1:getState().LaunchContext == LaunchContext.Login
	end,
	didUsePasswordManagerMediatedLogin = function()
		-- upvalues: GetPasswordManagerUsageStoreFunction (copy)
		local PasswordManagerUsageStore = GetPasswordManagerUsageStoreFunction(false)
		
		return PasswordManagerUsageStore ~= nil and (PasswordManagerUsageStore.getLoggedinUsingSavedPassword(false) or PasswordManagerUsageStore.getSavedPasswordAfterLogin(false))
	end,
	didUsePasswordManagerMediatedSignup = function()
		-- upvalues: GetPasswordManagerUsageStoreFunction (copy)
		local PasswordManagerUsageStore = GetPasswordManagerUsageStoreFunction(false)
		
		return PasswordManagerUsageStore ~= nil and PasswordManagerUsageStore.getPasswordManagerMediatedSignup(false)
	end
}