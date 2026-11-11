local Parent = script:FindFirstAncestor("AppStartup").Parent
local ReactModule = require(Parent.React)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local AppPage = require(Parent.RobloxAppEnums).AppPage
local ThirdPartyUserService = game:GetService("ThirdPartyUserService")
local Default = require(Parent.LoggingProtocol).default
local UsePropertyFunction = require(Parent.GuiObjectUtils).useProperty

return if ThirdPartyUserService and ThirdPartyUserService.IsSingleSignOnSupported and ThirdPartyUserService:IsSingleSignOnSupported() then function(_)
	-- upvalues: UseNavigationFunction (copy), UsePropertyFunction (copy), ThirdPartyUserService (copy), ReactModule (copy), Default (copy), AppPage (copy)
	local UseNavigationResult = UseNavigationFunction()
	local HasActiveUser = UsePropertyFunction(ThirdPartyUserService, "HasActiveUser")
	ReactModule.useEffect(function()
		-- upvalues: Default (upval)
		Default:logEventOnce("platform_account_router_page_did_mount")
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: HasActiveUser (copy), Default (upval), UseNavigationResult (copy), AppPage (upval)
		if HasActiveUser then
			Default:logEventOnce("platform_account_router_page_did_continue")
			UseNavigationResult.replace(AppPage.SingleSignOnContainer)
		end
	end, { HasActiveUser, UseNavigationResult })
	
	return nil
end else function(_)
	-- upvalues: UseNavigationFunction (copy), ReactModule (copy), Default (copy), AppPage (copy)
	local UseNavigationResult = UseNavigationFunction()
	ReactModule.useEffect(function()
		-- upvalues: Default (upval), UseNavigationResult (copy), AppPage (upval)
		Default:logEventOnce("platform_account_router_page_did_mount")
		Default:logEventOnce("platform_account_router_page_did_continue")
		UseNavigationResult.replace(AppPage.Startup)
	end, { UseNavigationResult })
	
	return nil
end