local parent = script:FindFirstAncestor("AppStartup").Parent
local reactModule = require(parent.React)
local useNavigation = require(parent.Navigation).useNavigation
local appPage = require(parent.RobloxAppEnums).AppPage
local thirdPartyUserService = game:GetService("ThirdPartyUserService")
local default = require(parent.LoggingProtocol).default
local useProperty = require(parent.GuiObjectUtils).useProperty

return if thirdPartyUserService and thirdPartyUserService.IsSingleSignOnSupported and thirdPartyUserService:IsSingleSignOnSupported() then function(_)
	-- upvalues: useNavigation (ref), useProperty (ref), thirdPartyUserService (ref), reactModule (ref), default (ref), appPage (ref)
	local var1 = useNavigation()
	local var2 = useProperty(thirdPartyUserService, "HasActiveUser")
	reactModule.useEffect(function()
		-- upvalues: default (copy)
		default:logEventOnce("platform_account_router_page_did_mount")
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), default (copy), var1 (ref), appPage (copy)
		if var2 then
			default:logEventOnce("platform_account_router_page_did_continue")
			var1.replace(appPage.SingleSignOnContainer)
		end
	end, { var2, var1 })
	
	return nil
end else function(_)
	-- upvalues: useNavigation (ref), reactModule (ref), default (ref), appPage (ref)
	local var1 = useNavigation()
	reactModule.useEffect(function()
		-- upvalues: default (copy), var1 (ref), appPage (copy)
		default:logEventOnce("platform_account_router_page_did_mount")
		default:logEventOnce("platform_account_router_page_did_continue")
		var1.replace(appPage.Startup)
	end, { var1 })
	
	return nil
end