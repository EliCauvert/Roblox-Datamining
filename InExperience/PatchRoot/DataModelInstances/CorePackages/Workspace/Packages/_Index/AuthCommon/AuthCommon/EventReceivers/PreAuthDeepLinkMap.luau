local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local GetFFlagEnableUnifiedWebViewsFunction = require(Parent.SharedFlags).GetFFlagEnableUnifiedWebViews
local HttpService = game:GetService("HttpService")
local BrowserService = game:GetService("BrowserService")
local WebViewService = if GetFFlagEnableUnifiedWebViewsFunction() then game:GetService("WebViewService") else nil
local NavigateSidewaysFunction = require(Parent.NavigationRodux).Thunks.NavigateSideways
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local HandleAuthTicketModule = require(AuthCommon.Thunks.HandleAuthTicket)
local LaunchContext = require(Parent.AppStartup).Enums.LaunchContext
local AppPage = require(Parent.RobloxAppEnums).AppPage
local EnableAccountRecoveryPreAuthDeepLink2 = game:DefineFastFlag("EnableAccountRecoveryPreAuthDeepLink2", true)
local WaitAfterCloseChallengeWebViewSeconds = game:DefineFastInt("WaitAfterCloseChallengeWebViewSeconds", 500)
local PreAuthDeepLinkMapModule = {
	{
		regexPattern = "roblox.*//testing/preauth.*",
		preauthOnly = false,
		handler = function(List, List1): boolean --[[ Line: 62 ]]
			print("preauth deeplink example called with query params:")
			
			for i, value in pairs(List) do
				print(i, "=", value)
			end
			print("context:")
			
			for i1, value1 in pairs(List1) do
				print(i1, "=", value1)
			end
			return true
		end
	}
}

if game:DefineFastFlag("EnableJoinV2PreAuthDeepLink", false) then
	table.insert(PreAuthDeepLinkMapModule, {
		regexPattern = "roblox.*://join_v2/join.*",
		preauthOnly = false,
		handler = function(p1, p2) --[[ Line: 82 ]]
			-- upvalues: LaunchContext (copy), HandleAuthTicketModule (copy)
			return HandleAuthTicketModule(p2.networking, p1.ticket, p1.placelauncherurl, function() --[[ Line: 83 ]]
				-- upvalues: p2 (copy), LaunchContext (upval)
				return p2.dispatch(p2.launchApp(p2.networking, p2.omniRecommendationsRequest, p2.analytics, p2.appPolicy, LaunchContext.Login))
			end, function() --[[ Line: 95 ]]
				-- upvalues: p2 (copy)
				return p2.dispatch(p2.resetAppState())
			end)
		end
	})
end
if EnableAccountRecoveryPreAuthDeepLink2 then
	table.insert(PreAuthDeepLinkMapModule, {
		regexPattern = "roblox.*://navigation/account_recovery.*",
		preauthOnly = false,
		handler = function(p1, p2) --[[ Line: 114 ]]
			-- upvalues: GetFFlagEnableUnifiedWebViewsFunction (copy), WebViewService (copy), BrowserService (copy), WaitAfterCloseChallengeWebViewSeconds (copy), AppPage (copy), HttpService (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateSidewaysFunction (copy)
			local Origin = p1.origin
			local ExtraProps = {}
			
			if Origin == "login2SV" then
				ExtraProps = {
					continuingRecovery = false,
					recover2sv = true,
					recoverPassword = false,
					identifier = p1.username
				}
			elseif Origin == "passwordReset2SV" then
				ExtraProps = {
					continuingRecovery = true,
					recover2sv = true,
					recoverPassword = true,
					recoverySessionID = p1.recoverysessionid,
					identifier = p1.username
				}
			end
			if GetFFlagEnableUnifiedWebViewsFunction() then
				WebViewService:CloseWindow()
			else
				BrowserService:CloseBrowserWindow()
			end
			if Origin == "login2SV" then
				task.wait(WaitAfterCloseChallengeWebViewSeconds / 1000)
			end
			local config = {
				name = AppPage.AccountRecovery,
				detail = HttpService:GenerateGUID(false):lower(),
				extraProps = ExtraProps
			}
			
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.sideways(NavigationCommands.fromLegacyPage(config)) else p2.dispatch(NavigateSidewaysFunction(config))
		end
	})
end
return PreAuthDeepLinkMapModule