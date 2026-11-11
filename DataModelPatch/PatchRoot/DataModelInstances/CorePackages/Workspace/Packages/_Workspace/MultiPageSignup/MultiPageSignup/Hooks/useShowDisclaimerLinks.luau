local Parent = script:FindFirstAncestor("MultiPageSignup").Parent
local ReactModule = require(Parent.React)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UserActivationFrameworkModule = require(Parent.UserActivationFramework)
local PayloadKey = UserActivationFrameworkModule.Enums.PayloadKey
local UserActivationSignupPageState = UserActivationFrameworkModule.Enums.UserActivationSignupPageState
local FullPageActivationFrameworkContext = UserActivationFrameworkModule.Context.FullPageActivationFrameworkContext

return function()
	-- upvalues: UseAppPolicyFunction (copy), ReactModule (copy), FullPageActivationFrameworkContext (copy), PayloadKey (copy), UserActivationSignupPageState (copy)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1)
		return p1
	end)
	local ShowDisclaimerLinkForUnderageSignupsOnAllSignupPages = UseAppPolicyResult.getShowDisclaimerLinkForUnderageSignupsOnAllSignupPages()
	local AgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages = UseAppPolicyResult.getAgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages()
	local UseContextResult = ReactModule.useContext(FullPageActivationFrameworkContext)
	
	return ReactModule.useMemo(function(): boolean
		-- upvalues: UseContextResult (copy), PayloadKey (upval), AgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages (copy), UserActivationSignupPageState (upval), ShowDisclaimerLinkForUnderageSignupsOnAllSignupPages (copy)
		local ActivationFrameworkState = UseContextResult.activationFrameworkState
		local IsAgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPagesAbove = (tonumber(ActivationFrameworkState.payloadTable[PayloadKey.SignupAge]) or -1) < AgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages
		
		return ActivationFrameworkState.currentState == UserActivationSignupPageState.EnterBirthday or (if IsAgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPagesAbove and ShowDisclaimerLinkForUnderageSignupsOnAllSignupPages then true else false)
	end, {
		UseContextResult,
		ShowDisclaimerLinkForUnderageSignupsOnAllSignupPages
	})
end