local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local getFFlagEnableUnifiedWebViews = require(parent.SharedFlags).GetFFlagEnableUnifiedWebViews
local httpService = game:GetService("HttpService")
local browserService = game:GetService("BrowserService")
local var3 = if getFFlagEnableUnifiedWebViews() then game:GetService("WebViewService") else nil
local navigateSideways = require(parent.NavigationRodux).Thunks.NavigateSideways
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var4 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
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
		handler = function(p0, p1)
			print("preauth deeplink example called with query params:")
			
			for i, v in pairs(p0) do
				print(i, "=", v)
			end
			print("context:")
			
			for i_1, v_1 in pairs(p1) do
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
		handler = function(p2, p3)
			-- upvalues: launchContext (ref), handleAuthTicketModule (ref)
			return handleAuthTicketModule(p3.networking, p2.ticket, p2.placelauncherurl, function()
				-- upvalues: p3 (ref), launchContext (copy)
				return p3.dispatch(p3.launchApp(p3.networking, p3.omniRecommendationsRequest, p3.analytics, p3.appPolicy, launchContext.Login))
			end, function()
				-- upvalues: p3 (ref)
				return p3.dispatch(p3.resetAppState())
			end)
		end
	})
end
if enableAccountRecoveryPreAuthDeepLink2 then
	table.insert(list, {
		regexPattern = "roblox.*://navigation/account_recovery.*",
		preauthOnly = false,
		handler = function(p4, p5)
			-- upvalues: getFFlagEnableUnifiedWebViews (ref), var3 (ref), browserService (ref), waitAfterCloseChallengeWebViewSeconds (ref), appPage (ref), httpService (ref), fFlagSignalsNavP3Dispatch (ref), var4 (ref), navigateSideways (ref)
			local origin = p4.origin
			local t = {}
			
			if origin == "login2SV" then
				t = {
					continuingRecovery = false,
					recover2sv = true,
					recoverPassword = false,
					identifier = p4.username
				}
			elseif origin == "passwordReset2SV" then
				t = {
					continuingRecovery = true,
					recover2sv = true,
					recoverPassword = true,
					recoverySessionID = p4.recoverysessionid,
					identifier = p4.username
				}
			end
			if getFFlagEnableUnifiedWebViews() then
				var3:CloseWindow()
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
			
			return if fFlagSignalsNavP3Dispatch then var4.sideways(var4.fromLegacyPage(t_1)) else p5.dispatch(navigateSideways(t_1))
		end
	})
end
return list