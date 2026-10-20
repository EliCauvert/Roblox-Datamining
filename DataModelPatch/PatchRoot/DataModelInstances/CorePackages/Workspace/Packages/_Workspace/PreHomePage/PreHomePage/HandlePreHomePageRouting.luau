local PreHomePage = script:FindFirstAncestor("PreHomePage")
local Parent = PreHomePage.Parent
local Logger = require(Parent.Loggers).Logger
local PromiseModule = require(Parent.Promise)
local SharedFlagsModule = require(Parent.SharedFlags)
local CommonModule = require(PreHomePage.Common)
local HandlePasskeyUpsell = require(PreHomePage.Routes.PasskeyUpsell).HandlePasskeyUpsell
local HandleTutorialUpsell = require(PreHomePage.Routes.TutorialUpsell).HandleTutorialUpsell
local HandleSilentUpgradeFunction = require(PreHomePage.Routes.SilentUpgrade).HandleSilentUpgrade
local HandleNotificationsPermissions = require(PreHomePage.Routes.Notifications).HandleNotificationsPermissions
local FFlagPreHomePageRoutingEnabled = SharedFlagsModule.FFlagPreHomePageRoutingEnabled
local FFlagPasskeyUpsellEnabled = SharedFlagsModule.FFlagPasskeyUpsellEnabled
local FFlagPasskeySilentUpgradeEnabled = SharedFlagsModule.FFlagPasskeySilentUpgradeEnabled
local FFlagTutorialUpsellEnabled = SharedFlagsModule.FFlagTutorialUpsellEnabled
local FFlagEnableSystemTrayModals = SharedFlagsModule.FFlagEnableSystemTrayModals
local FFlagEnablePWManagerSignupCheck = SharedFlagsModule.FFlagEnablePWManagerSignupCheck
local DidUsePasswordManagerMediatedLoginFunction = CommonModule.Checks.didUsePasswordManagerMediatedLogin
local DidUsePasswordManagerMediatedSignupFunction = CommonModule.Checks.didUsePasswordManagerMediatedSignup
local LaunchContext = require(Parent.AppStartup).Enums.LaunchContext

local function handleUpsellRouting(p1, Callback, p2, p3, p4): boolean
	-- upvalues: Logger (copy)
	local v1, v2 = Callback(p2, p3, p4):andThen(function(Result): boolean
		-- upvalues: Logger (upval), p1 (copy)
		if Result then
			Logger:info("User is eligible for {} upsell, proceeding with upsell", p1)
			
			return true
		else
			Logger:info("User is not eligible for {} upsell", p1)
			
			return false
		end
	end):catch(function(Err): boolean
		-- upvalues: Logger (upval), p1 (copy)
		Logger:warning("Error checking {} upsell eligibility: {}", p1, Err)
		
		return false
	end):await()
	
	if v1 then
		return if v2 then true else false
	else
		Logger:warning("Unknown error checking {} upsell eligibility", p1)
		
		return false
	end
end

return function(p1, p2, p3)
	-- upvalues: FFlagPreHomePageRoutingEnabled (copy), FFlagPasskeyUpsellEnabled (copy), PromiseModule (copy), FFlagEnablePWManagerSignupCheck (copy), DidUsePasswordManagerMediatedSignupFunction (copy), HandleSilentUpgradeFunction (copy), LaunchContext (copy), DidUsePasswordManagerMediatedLoginFunction (copy), FFlagPasskeySilentUpgradeEnabled (copy), handleUpsellRouting (copy), HandlePasskeyUpsell (copy), FFlagTutorialUpsellEnabled (copy), HandleTutorialUpsell (copy), FFlagEnableSystemTrayModals (copy), HandleNotificationsPermissions (copy)
	if not FFlagPreHomePageRoutingEnabled and not FFlagPasskeyUpsellEnabled then
		return PromiseModule.resolve(false)
	end
	if FFlagEnablePWManagerSignupCheck and DidUsePasswordManagerMediatedSignupFunction() then
		HandleSilentUpgradeFunction(p1, p2, LaunchContext.SignUp)
	elseif DidUsePasswordManagerMediatedLoginFunction() then
		if FFlagPasskeySilentUpgradeEnabled then
			HandleSilentUpgradeFunction(p1, p2)
		end
	elseif FFlagPasskeyUpsellEnabled and handleUpsellRouting("passkey", HandlePasskeyUpsell, p1, p2, p3) then
		return PromiseModule.resolve(true)
	end
	return if FFlagTutorialUpsellEnabled and handleUpsellRouting("tutorial", HandleTutorialUpsell, p1, p2, p3) then PromiseModule.resolve(true) elseif FFlagEnableSystemTrayModals and handleUpsellRouting("notifications", HandleNotificationsPermissions, p1, p2, p3) then PromiseModule.resolve(false) else PromiseModule.resolve(false)
end