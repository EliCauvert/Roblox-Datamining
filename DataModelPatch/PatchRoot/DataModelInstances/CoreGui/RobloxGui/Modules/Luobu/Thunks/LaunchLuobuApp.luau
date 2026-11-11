local LocalizationService = game:GetService("LocalizationService")
local MemStorageService = game:GetService("MemStorageService")
local GuiService = game:GetService("GuiService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local FetchLocaleModule = require(Modules.LuaApp.Thunks.FetchLocale)
local FetchThemeModule = require(Modules.LuaApp.Thunks.FetchTheme)
local ResetNavigationHistoryModule = require(Modules.LuaApp.Thunks.ResetNavigationHistory)
local GetLocalUserFunction = require(CorePackages.Workspace.Packages.UserLib).Thunks.GetLocalUser
local PreloadApplicationDataModule = require(Modules.LuaApp.Thunks.PreloadApplicationData)
local UserModule = require(Modules.LuaApp.Thunks.Authentication.User)
local ClearAppModule = require(Modules.LuaApp.Thunks.Authentication.ClearApp)
local AppStorageUtilitiesModule = require(Modules.LuaApp.Thunks.Authentication.AppStorageUtilities)
local LogoutModule = require(Modules.LuaApp.Thunks.Authentication.Logout)
local LuaLogoutReasonNamesModule = require(Modules.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames)
local _ = require(CorePackages.Workspace.Packages.Http)
local ReceivedUserCountryCodeFunction = require(CorePackages.Workspace.Packages.CountryCode).ReceivedUserCountryCode
local SetAuthenticationStatusFunction = require(CorePackages.Workspace.Packages.AuthenticationStatus).Actions.SetAuthenticationStatus
local GetAccountInfoModule = require(Modules.LuaApp.Http.Requests.GetAccountInfo)
local LoginStatusModule = require(Modules.LuaApp.Enum.LoginStatus)
local MemStorageKeysModule = require(Modules.LuaApp.Enum.MemStorageKeys)
local LaunchContextModule = require(Modules.LuaApp.Enum.LaunchContext)
local NotificationTypeModule = require(Modules.LuaApp.Enum.NotificationType)
local StatusCodes = require(CorePackages.Workspace.Packages.Http).StatusCodes
local AppSessionCheckCounterNamesModule = require(Modules.Luobu.Analytics.Events.AppSessionCheckCounterNames)
local AppPageModule = require(Modules.LuaApp.AppPage)
local Logger = require(CorePackages.Workspace.Packages.Loggers).Logger
local PromiseModule = require(Modules.LuaApp.Promise)
local PromiseUtilitiesModule = require(Modules.LuaApp.PromiseUtilities)
local AuthenticationProtocol = require(CorePackages.Workspace.Packages.AuthenticationProtocol).AuthenticationProtocol

local function _(p1)
	-- upvalues: RoactAppExperimentModule (copy)
	RoactAppExperimentModule.initializeUserLayers(p1)
end

local _ = function(p1, p2)
	-- upvalues: GuiService (copy), NotificationTypeModule (copy), SetAuthenticationStatusFunction (copy), LoginStatusModule (copy)
	GuiService:BroadcastNotification(p1:toJsonData(), NotificationTypeModule.DID_LOG_IN)
	p2:dispatch(SetAuthenticationStatusFunction(LoginStatusModule.LOGGED_IN))
end

local function resetOnNoAccountInfo(p1, p2, p3)
	-- upvalues: FetchLocaleModule (copy), PromiseUtilitiesModule (copy), AppStorageUtilitiesModule (copy), LocalizationService (copy), ClearAppModule (copy), SetAuthenticationStatusFunction (copy), LoginStatusModule (copy), ResetNavigationHistoryModule (copy), AppPageModule (copy)
	PromiseUtilitiesModule.Batch({ (FetchLocaleModule(p2)) }):andThen(function(Entry)
		-- upvalues: AppStorageUtilitiesModule (upval), LocalizationService (upval), p3 (copy), p1 (copy), ClearAppModule (upval), SetAuthenticationStatusFunction (upval), LoginStatusModule (upval), ResetNavigationHistoryModule (upval), AppPageModule (upval)
		Entry[1]:match(function(p4)
			-- upvalues: AppStorageUtilitiesModule (upval), LocalizationService (upval)
			AppStorageUtilitiesModule.setRobloxLocaleId(p4.signupAndLoginLocale)
			LocalizationService:SetRobloxLocaleId(p4.signupAndLoginLocale)
		end)
		
		if p3 then
			p1:dispatch(ClearAppModule())
		end
		p1:dispatch(SetAuthenticationStatusFunction(LoginStatusModule.LOGGED_OUT))
		p1:dispatch(ResetNavigationHistoryModule({ { name = AppPageModule.Landing } }))
	end)
end

local function getUserAccountInfo(p1, p2, p3, p4, FromLocalStorageResult)
	-- upvalues: GetAccountInfoModule (copy), AppSessionCheckCounterNamesModule (copy), UserModule (copy), ClearAppModule (copy), GetLocalUserFunction (copy), ReceivedUserCountryCodeFunction (copy), ResetNavigationHistoryModule (copy), AppPageModule (copy), RoactAppExperimentModule (copy), PreloadApplicationDataModule (copy), FetchLocaleModule (copy), AppStorageUtilitiesModule (copy), LocalizationService (copy), MemStorageService (copy), MemStorageKeysModule (copy), FetchThemeModule (copy), PromiseUtilitiesModule (copy), PromiseModule (copy), StatusCodes (copy)
	return GetAccountInfoModule(p2):andThen(function(Result)
		-- upvalues: p3 (copy), AppSessionCheckCounterNamesModule (upval), UserModule (upval), FromLocalStorageResult (copy), p4 (copy), p1 (copy), ClearAppModule (upval), GetLocalUserFunction (upval), ReceivedUserCountryCodeFunction (upval), ResetNavigationHistoryModule (upval), AppPageModule (upval), RoactAppExperimentModule (upval), PreloadApplicationDataModule (upval), p2 (copy), FetchLocaleModule (upval), AppStorageUtilitiesModule (upval), LocalizationService (upval), MemStorageService (upval), MemStorageKeysModule (upval), FetchThemeModule (upval), PromiseUtilitiesModule (upval), PromiseModule (upval)
		p3.Diag:reportCounter(AppSessionCheckCounterNamesModule.Success, 1)
		local FromRequestResult = UserModule.fromRequest(Result)
		
		if not FromRequestResult:isEqual(FromLocalStorageResult) or p4.useMSDKWebAuthentication() then
			FromRequestResult:setToLocalPlayer()
			FromRequestResult:setToLocalStorage()
			p1:dispatch(ClearAppModule())
			p1:dispatch(GetLocalUserFunction())
			p1:dispatch(ReceivedUserCountryCodeFunction(FromRequestResult.countryCode))
			p1:dispatch(ResetNavigationHistoryModule({ { name = AppPageModule.Home } }))
			RoactAppExperimentModule.initializeUserLayers(FromRequestResult.userId)
		end
		p1:dispatch(PreloadApplicationDataModule(p2, p3, p4))
		local List = {}
		table.insert(List, FetchLocaleModule(p2):andThen(function(Result)
			-- upvalues: AppStorageUtilitiesModule (upval), LocalizationService (upval)
			AppStorageUtilitiesModule.setRobloxLocaleId(Result.generalExperienceLocale)
			AppStorageUtilitiesModule.setGameLocaleId(Result.ugcLocale)
			LocalizationService:SetRobloxLocaleId(Result.generalExperienceLocale)
		end))
		MemStorageService:Fire(MemStorageKeysModule.ThemeUpdate, (AppStorageUtilitiesModule.getAuthenticatedTheme()))
		table.insert(List, FetchThemeModule(p2, FromRequestResult.userId):andThen(function(Result)
			-- upvalues: AppStorageUtilitiesModule (upval), MemStorageService (upval), MemStorageKeysModule (upval)
			AppStorageUtilitiesModule.setAuthenticatedTheme(Result)
			MemStorageService:Fire(MemStorageKeysModule.ThemeUpdate, Result)
		end))
		PromiseUtilitiesModule.Batch(List):andThen(function()
			-- upvalues: AppStorageUtilitiesModule (upval)
			AppStorageUtilitiesModule.flush()
		end)
		
		return PromiseModule.resolve(FromRequestResult)
	end, function(p5)
		-- upvalues: StatusCodes (upval), p3 (copy), AppSessionCheckCounterNamesModule (upval), PromiseModule (upval)
		if p5.StatusCodes == StatusCodes.UNAUTHORIZED then
			p3.Diag:reportCounter(AppSessionCheckCounterNamesModule.Failure401Unauthenticated, 1)
		end
		p3.Diag:reportCounter(AppSessionCheckCounterNamesModule.Failure, 1)
		
		return PromiseModule.reject()
	end)
end

local _ = function(p1, p2, p3, p4, p5)
	-- upvalues: RoactAppExperimentModule (copy), GetLocalUserFunction (copy), ReceivedUserCountryCodeFunction (copy), ResetNavigationHistoryModule (copy), AppPageModule (copy), getUserAccountInfo (copy), AuthenticationProtocol (copy), Logger (copy), resetOnNoAccountInfo (copy), LogoutModule (copy), GuiService (copy), LuaLogoutReasonNamesModule (copy), NotificationTypeModule (copy), SetAuthenticationStatusFunction (copy), LoginStatusModule (copy)
	p5:setToLocalPlayer()
	RoactAppExperimentModule.initializeUserLayers(p5.userId)
	spawn(function()
		-- upvalues: p1 (copy), GetLocalUserFunction (upval), ReceivedUserCountryCodeFunction (upval), p5 (copy), ResetNavigationHistoryModule (upval), AppPageModule (upval), getUserAccountInfo (upval), p2 (copy), p3 (copy), p4 (copy), AuthenticationProtocol (upval), Logger (upval), resetOnNoAccountInfo (upval), LogoutModule (upval), GuiService (upval), LuaLogoutReasonNamesModule (upval), NotificationTypeModule (upval), SetAuthenticationStatusFunction (upval), LoginStatusModule (upval)
		p1:dispatch(GetLocalUserFunction())
		p1:dispatch(ReceivedUserCountryCodeFunction(p5.countryCode))
		p1:dispatch(ResetNavigationHistoryModule({ { name = AppPageModule.Home } }))
		getUserAccountInfo(p1, p2, p3, p4, p5):andThen(function(Result)
			-- upvalues: AuthenticationProtocol (upval), Logger (upval), resetOnNoAccountInfo (upval), p1 (upval), p2 (upval), p3 (upval), LogoutModule (upval), GuiService (upval), LuaLogoutReasonNamesModule (upval), NotificationTypeModule (upval), SetAuthenticationStatusFunction (upval), LoginStatusModule (upval)
			local v1, v2 = AuthenticationProtocol.default:requestAuth(AuthenticationProtocol.AuthProviders.MSDK, AuthenticationProtocol.AuthMethods.NONE):await()
			
			if v1 and v2.statusCode == 0 then
				GuiService:BroadcastNotification(Result:toJsonData(), NotificationTypeModule.DID_LOG_IN)
				p1:dispatch(SetAuthenticationStatusFunction(LoginStatusModule.LOGGED_IN))
				
				return
			else
				Logger:info("MSDK Auto Login with ErrorCode: " .. v2.statusCode)
				resetOnNoAccountInfo(p1, p2, true)
				p3.Diag:reportCounter("MSDKAutoLoginErrorCode_" .. v2.statusCode, 1)
				p1:dispatch(LogoutModule(p2, GuiService, LuaLogoutReasonNamesModule.UnauthorizedAutoLogin))
			end
		end, function()
			-- upvalues: resetOnNoAccountInfo (upval), p1 (upval), p2 (upval)
			resetOnNoAccountInfo(p1, p2, true)
		end)
	end)
end

local _ = function(p1, p2, p3, p4, p5, p6)
	-- upvalues: resetOnNoAccountInfo (copy), getUserAccountInfo (copy), GuiService (copy), NotificationTypeModule (copy), SetAuthenticationStatusFunction (copy), LoginStatusModule (copy)
	if p6 then
		resetOnNoAccountInfo(p1, p2, false)
		
		return
	else
		spawn(function()
			-- upvalues: getUserAccountInfo (upval), p1 (copy), p2 (copy), p3 (copy), p4 (copy), p5 (copy), GuiService (upval), NotificationTypeModule (upval), SetAuthenticationStatusFunction (upval), LoginStatusModule (upval), resetOnNoAccountInfo (upval)
			getUserAccountInfo(p1, p2, p3, p4, p5):andThen(function(Result)
				-- upvalues: p1 (upval), GuiService (upval), NotificationTypeModule (upval), SetAuthenticationStatusFunction (upval), LoginStatusModule (upval)
				GuiService:BroadcastNotification(Result:toJsonData(), NotificationTypeModule.DID_LOG_IN)
				p1:dispatch(SetAuthenticationStatusFunction(LoginStatusModule.LOGGED_IN))
			end, function()
				-- upvalues: resetOnNoAccountInfo (upval), p1 (upval), p2 (upval)
				resetOnNoAccountInfo(p1, p2, false)
			end)
		end)
	end
end

return function(p1, p2, p3, Startup)
	-- upvalues: UserModule (copy), Logger (copy), LaunchContextModule (copy), resetOnNoAccountInfo (copy), getUserAccountInfo (copy), GuiService (copy), NotificationTypeModule (copy), SetAuthenticationStatusFunction (copy), LoginStatusModule (copy), RoactAppExperimentModule (copy), GetLocalUserFunction (copy), ReceivedUserCountryCodeFunction (copy), ResetNavigationHistoryModule (copy), AppPageModule (copy), AuthenticationProtocol (copy), LogoutModule (copy), LuaLogoutReasonNamesModule (copy)
	return function(p4)
		-- upvalues: UserModule (upval), p3 (copy), Logger (upval), p1 (copy), p2 (copy), Startup (copy), LaunchContextModule (upval), resetOnNoAccountInfo (upval), getUserAccountInfo (upval), GuiService (upval), NotificationTypeModule (upval), SetAuthenticationStatusFunction (upval), LoginStatusModule (upval), RoactAppExperimentModule (upval), GetLocalUserFunction (upval), ReceivedUserCountryCodeFunction (upval), ResetNavigationHistoryModule (upval), AppPageModule (upval), AuthenticationProtocol (upval), LogoutModule (upval), LuaLogoutReasonNamesModule (upval)
		local FromLocalStorageResult = UserModule.fromLocalStorage()
		
		if FromLocalStorageResult.userId ~= -1 and not p3.useMSDKWebAuthentication() then
			Logger:info(string.format("[%f] LaunchLuobuApp::handleCachedUser()", tick()))
			FromLocalStorageResult:setToLocalPlayer()
			RoactAppExperimentModule.initializeUserLayers(FromLocalStorageResult.userId)
			spawn(function()
				-- upvalues: p4 (copy), GetLocalUserFunction (upval), ReceivedUserCountryCodeFunction (upval), FromLocalStorageResult (copy), ResetNavigationHistoryModule (upval), AppPageModule (upval), getUserAccountInfo (upval), p1 (copy), p2 (copy), p3 (copy), AuthenticationProtocol (upval), Logger (upval), resetOnNoAccountInfo (upval), LogoutModule (upval), GuiService (upval), LuaLogoutReasonNamesModule (upval), NotificationTypeModule (upval), SetAuthenticationStatusFunction (upval), LoginStatusModule (upval)
				p4:dispatch(GetLocalUserFunction())
				p4:dispatch(ReceivedUserCountryCodeFunction(FromLocalStorageResult.countryCode))
				p4:dispatch(ResetNavigationHistoryModule({ { name = AppPageModule.Home } }))
				getUserAccountInfo(p4, p1, p2, p3, FromLocalStorageResult):andThen(function(Result)
					-- upvalues: AuthenticationProtocol (upval), Logger (upval), resetOnNoAccountInfo (upval), p4 (upval), p1 (upval), p2 (upval), LogoutModule (upval), GuiService (upval), LuaLogoutReasonNamesModule (upval), NotificationTypeModule (upval), SetAuthenticationStatusFunction (upval), LoginStatusModule (upval)
					local v1, v2 = AuthenticationProtocol.default:requestAuth(AuthenticationProtocol.AuthProviders.MSDK, AuthenticationProtocol.AuthMethods.NONE):await()
					
					if v1 and v2.statusCode == 0 then
						GuiService:BroadcastNotification(Result:toJsonData(), NotificationTypeModule.DID_LOG_IN)
						p4:dispatch(SetAuthenticationStatusFunction(LoginStatusModule.LOGGED_IN))
						
						return
					else
						Logger:info("MSDK Auto Login with ErrorCode: " .. v2.statusCode)
						resetOnNoAccountInfo(p4, p1, true)
						p2.Diag:reportCounter("MSDKAutoLoginErrorCode_" .. v2.statusCode, 1)
						p4:dispatch(LogoutModule(p1, GuiService, LuaLogoutReasonNamesModule.UnauthorizedAutoLogin))
					end
				end, function()
					-- upvalues: resetOnNoAccountInfo (upval), p4 (upval), p1 (upval)
					resetOnNoAccountInfo(p4, p1, true)
				end)
			end)
			
			return
		end
		Logger:info(string.format("[%f] LaunchLuobuApp::handleNoCachedUser()", tick()))
		
		if Startup == LaunchContextModule.Startup then
			resetOnNoAccountInfo(p4, p1, false)
			
			return
		else
			spawn(function()
				-- upvalues: getUserAccountInfo (upval), p4 (copy), p1 (copy), p2 (copy), p3 (copy), FromLocalStorageResult (copy), GuiService (upval), NotificationTypeModule (upval), SetAuthenticationStatusFunction (upval), LoginStatusModule (upval), resetOnNoAccountInfo (upval)
				getUserAccountInfo(p4, p1, p2, p3, FromLocalStorageResult):andThen(function(Result)
					-- upvalues: p4 (upval), GuiService (upval), NotificationTypeModule (upval), SetAuthenticationStatusFunction (upval), LoginStatusModule (upval)
					GuiService:BroadcastNotification(Result:toJsonData(), NotificationTypeModule.DID_LOG_IN)
					p4:dispatch(SetAuthenticationStatusFunction(LoginStatusModule.LOGGED_IN))
				end, function()
					-- upvalues: resetOnNoAccountInfo (upval), p4 (upval), p1 (upval)
					resetOnNoAccountInfo(p4, p1, false)
				end)
			end)
		end
	end
end