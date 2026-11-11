local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local LoginStatus = require(CorePackages.Workspace.Packages.RobloxAppEnums).LoginStatus
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local CheckForVngAppUpsellForVnUsersModule = require(script.Parent.CheckForVngAppUpsellForVnUsers)

return function(_)
	-- upvalues: UseSelectorFunction (copy), LoginStatus (copy), UseAppPolicyFunction (copy), ReactModule (copy), CheckForVngAppUpsellForVnUsersModule (copy)
	local UseSelectorResult = UseSelectorFunction(function(p1): boolean
		-- upvalues: LoginStatus (upval)
		local CountryCode = p1.CountryCode
		
		return p1.AuthenticationStatus.status == LoginStatus.LOGGED_IN and CountryCode == "VN"
	end)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1)
		return p1.getVngAppUpsell()
	end)
	
	return if UseSelectorResult and UseAppPolicyResult then ReactModule.createElement(CheckForVngAppUpsellForVnUsersModule) else nil
end