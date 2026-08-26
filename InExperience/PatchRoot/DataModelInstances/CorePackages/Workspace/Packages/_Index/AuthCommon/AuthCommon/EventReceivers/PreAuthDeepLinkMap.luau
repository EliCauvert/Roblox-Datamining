local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local getFFlagEnableUnifiedWebViews = require(parent.SharedFlags).GetFFlagEnableUnifiedWebViews
local httpService = game:GetService("HttpService")
local browserService = game:GetService("BrowserService")
local var1 = if getFFlagEnableUnifiedWebViews() then game:GetService("WebViewService") else nil
local navigateSideways = require(parent.NavigationRodux).Thunks.NavigateSideways
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var2 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local handleAuthTicketModule = require(authCommon.Thunks.HandleAuthTicket)
local launchContext = require(parent.AppStartup).Enums.LaunchContext
local appPage = require(parent.RobloxAppEnums).AppPage
local enableJoinV2PreAuthDeepLink = game:DefineFastFlag("EnableJoinV2PreAuthDeepLink", false)
local enableAccountRecoveryPreAuthDeepLink2 = game:DefineFastFlag("EnableAccountRecoveryPreAuthDeepLink2", true)
local waitAfterCloseChallengeWebViewSeconds = game:DefineFastInt("WaitAfterCloseChallengeWebViewSeconds", 500)
local list = {
	{
		regexPattern = "roblox.*//testing/preauth.*",
		preauthOnly = false,
		handler = function(p1, p2)
			print("preauth deeplink example called with query params:")
			
			for i, v in pairs(p1) do
				print(i, "=", v)
			end
			print("context:")
			
			for i_1, v_1 in pairs(p2) do
				print(i_1, "=", v_1)
			end
			return true
		end
	}
}

if enableJoinV2PreAuthDeepLink then
	table.insert(list, {
		regexPattern = "roblox.*://join_v2/join.*",
		preauthOnly = false,
		handler = function(p3, p4)
			-- upvalues: launchContext (ref), handleAuthTicketModule (ref)
			return handleAuthTicketModule(p4.networking, p3.ticket, p3.placelauncherurl, function()
				-- upvalues: p4 (ref), launchContext (copy)
				return p4.dispatch(p4.launchApp(p4.networking, p4.omniRecommendationsRequest, p4.analytics, p4.appPolicy, launchContext.Login))
			end, function()
				-- upvalues: p4 (ref)
				return p4.dispatch(p4.resetAppState())
			end)
		end
	})
end
if enableAccountRecoveryPreAuthDeepLink2 then
	table.insert(list, {
		regexPattern = "roblox.*://navigation/account_recovery.*",
		preauthOnly = false,
		handler = function(p3, p4)
			-- upvalues: getFFlagEnableUnifiedWebViews (ref), var1 (ref), browserService (ref), waitAfterCloseChallengeWebViewSeconds (ref), appPage (ref), httpService (ref), fFlagSignalsNavP3Dispatch (ref), var2 (ref), navigateSideways (ref)
			local origin = p3.origin
			local t = {}
			
			if origin == "login2SV" then
				t = {
					continuingRecovery = false,
					recover2sv = true,
					recoverPassword = false,
					identifier = p3.username
				}
			elseif origin == "passwordReset2SV" then
				t = {
					continuingRecovery = true,
					recover2sv = true,
					recoverPassword = true,
					recoverySessionID = p3.recoverysessionid,
					identifier = p3.username
				}
			end
			if getFFlagEnableUnifiedWebViews() then
				var1:CloseWindow()
			else
				browserService:CloseBrowserWindow()
			end
			if origin == "login2SV" then
				task.wait(waitAfterCloseChallengeWebViewSeconds / 1000)
			end
			local t_1 = {
				name = appPage.AccountRecovery,
				detail = httpService:GenerateGUID(false):lower(),
				extraProps = t
			}
			
			return if fFlagSignalsNavP3Dispatch then var2.sideways(var2.fromLegacyPage(t_1)) else p4.dispatch(navigateSideways(t_1))
		end
	})
end
return list