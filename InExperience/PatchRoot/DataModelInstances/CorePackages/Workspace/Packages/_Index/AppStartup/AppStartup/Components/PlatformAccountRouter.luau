local parent = script:FindFirstAncestor("AppStartup").Parent
local reactModule = require(parent.React)
local useNavigation = require(parent.Navigation).useNavigation
local appPage = require(parent.RobloxAppEnums).AppPage
local thirdPartyUserService = game:GetService("ThirdPartyUserService")
local default = require(parent.LoggingProtocol).default
local useProperty = require(parent.GuiObjectUtils).useProperty

return if thirdPartyUserService and thirdPartyUserService.IsSingleSignOnSupported and thirdPartyUserService:IsSingleSignOnSupported() then function(_) --[[ line: 17 ]]
	-- upvalues: useNavigation (ref), useProperty (ref), thirdPartyUserService (ref), reactModule (ref), default (ref), appPage (ref)
	local var3 = useNavigation()
	local var4 = useProperty(thirdPartyUserService, "HasActiveUser")
	reactModule.useEffect(function() --[[ line: 21 ]]
		-- upvalues: default (copy)
		default:logEventOnce("platform_account_router_page_did_mount")
	end, {})
	reactModule.useEffect(function() --[[ line: 25 ]]
		-- upvalues: var4 (ref), default (copy), var3 (ref), appPage (copy)
		if var4 then
			default:logEventOnce("platform_account_router_page_did_continue")
			var3.replace(appPage.SingleSignOnContainer)
		end
	end, { var4, var3 })
	
	return nil
end else function(_) --[[ line: 34 ]]
	-- upvalues: useNavigation (ref), reactModule (ref), default (ref), appPage (ref)
	local var2 = useNavigation()
	reactModule.useEffect(function() --[[ line: 36 ]]
		-- upvalues: default (copy), var2 (ref), appPage (copy)
		default:logEventOnce("platform_account_router_page_did_mount")
		default:logEventOnce("platform_account_router_page_did_continue")
		var2.replace(appPage.Startup)
	end, { var2 })
	
	return nil
end