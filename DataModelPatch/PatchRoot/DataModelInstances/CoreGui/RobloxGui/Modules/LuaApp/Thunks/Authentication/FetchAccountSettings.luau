local Players = game:GetService("Players")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(Modules.LuaApp.Promise)
local AppPageModule = require(Modules.LuaApp.AppPage)
local GetAccountInfoModule = require(Modules.LuaApp.Http.Requests.GetAccountInfo)
local SetAuthenticationStatusFunction = require(game:GetService("CorePackages").Workspace.Packages.AuthenticationStatus).Actions.SetAuthenticationStatus
local LoginStatusModule = require(Modules.LuaApp.Enum.LoginStatus)
local ResetNavigationHistoryModule = require(Modules.LuaApp.Thunks.ResetNavigationHistory)
local PreloadApplicationDataModule = require(Modules.LuaApp.Thunks.PreloadApplicationData)

return function(p1, p2, p3)
	-- upvalues: GetAccountInfoModule (copy), Players (copy), SetAuthenticationStatusFunction (copy), LoginStatusModule (copy), ResetNavigationHistoryModule (copy), AppPageModule (copy), PreloadApplicationDataModule (copy), PromiseModule (copy)
	return function(p4)
		-- upvalues: GetAccountInfoModule (upval), p1 (copy), Players (upval), SetAuthenticationStatusFunction (upval), LoginStatusModule (upval), ResetNavigationHistoryModule (upval), AppPageModule (upval), PreloadApplicationDataModule (upval), p2 (copy), p3 (copy), PromiseModule (upval)
		return GetAccountInfoModule(p1):andThen(function(Result)
			-- upvalues: Players (upval), p4 (copy), SetAuthenticationStatusFunction (upval), LoginStatusModule (upval), ResetNavigationHistoryModule (upval), AppPageModule (upval), PreloadApplicationDataModule (upval), p1 (upval), p2 (upval), p3 (upval), PromiseModule (upval)
			Players:SetLocalPlayerInfo(Result.responseBody.UserId, Result.responseBody.Username, Result.responseBody.DisplayName, tonumber(Result.responseBody.MembershipType), Result.responseBody.AgeBracket == 1)
			p4:dispatch(SetAuthenticationStatusFunction(LoginStatusModule.LOGGED_IN))
			p4:dispatch(ResetNavigationHistoryModule({ { name = AppPageModule.Home } }))
			p4:dispatch(PreloadApplicationDataModule(p1, p2, p3))
			
			return PromiseModule.resolve()
		end, function(p5)
			-- upvalues: p4 (copy), SetAuthenticationStatusFunction (upval), LoginStatusModule (upval), ResetNavigationHistoryModule (upval), AppPageModule (upval), PromiseModule (upval)
			p4:dispatch(SetAuthenticationStatusFunction(LoginStatusModule.LOGGED_OUT))
			p4:dispatch(ResetNavigationHistoryModule({ { name = AppPageModule.WeChatLoginWrapper } }))
			
			return PromiseModule.reject(p5)
		end)
	end
end