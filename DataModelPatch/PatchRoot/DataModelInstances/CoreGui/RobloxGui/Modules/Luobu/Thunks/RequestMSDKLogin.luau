local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(Modules.LuaApp.Promise)
local AuthenticationProtocol = require(CorePackages.Workspace.Packages.AuthenticationProtocol).AuthenticationProtocol
local SetMSDKLoginErrMessageKeyModule = require(Modules.Luobu.Actions.SetMSDKLoginErrMessageKey)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local NavigateBackModule = require(Modules.LuaApp.Thunks.NavigateBack)
local AppPageModule = require(Modules.LuaApp.AppPage)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local RequestAuthMetaDataModule = require(Modules.Luobu.Thunks.RequestAuthMetaData)
local SetMSDKLoginInProgressModule = require(Modules.Luobu.Actions.SetMSDKLoginInProgress)

return function(p1, p2, p3, p4)
	-- upvalues: AuthenticationProtocol (copy), RequestAuthMetaDataModule (copy), SetMSDKLoginInProgressModule (copy), AppPageModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), PromiseModule (copy), NavigateBackModule (copy), SetMSDKLoginErrMessageKeyModule (copy)
	return function(p5)
		-- upvalues: AuthenticationProtocol (upval), p4 (copy), RequestAuthMetaDataModule (upval), p3 (copy), p1 (copy), p2 (copy), SetMSDKLoginInProgressModule (upval), AppPageModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownModule (upval), PromiseModule (upval), NavigateBackModule (upval), SetMSDKLoginErrMessageKeyModule (upval)
		local Default = AuthenticationProtocol.default
		local v1 = nil
		local v2 = nil
		
		if p4.useMSDKWebAuthentication() then
			local v3, v4 = p5:dispatch(RequestAuthMetaDataModule(p3, p1, p2)):await()
			
			if not v3 then
				p5:dispatch(SetMSDKLoginInProgressModule(false))
				
				return
			end
			local config = {
				name = AppPageModule.GenericWebPage,
				detail = v4.loginPage,
				extraProps = {
					titleKey = "Authentication.Login.QrCodeLoginTitle",
					onClose = function()
						-- upvalues: p5 (copy), SetMSDKLoginInProgressModule (upval)
						p5:dispatch(SetMSDKLoginInProgressModule(false))
					end
				}
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			else
				p5:dispatch(NavigateDownModule(config))
			end
			v1, v16 = Default:listenWebAuthResponset(AuthenticationProtocol.AuthProviders.MSDK):await()
		else
			v1, v16 = Default:requestAuth(AuthenticationProtocol.AuthProviders.MSDK, p2):await()
		end
		if v1 then
			if v2.statusCode == 0 then
				return PromiseModule.resolve(v2.tokenAuthBody)
			end
			p1.Diag:reportCounter("RequestMSDKLoginReturnErrorCode_" .. v2.statusCode, 1)
		end
		if p4.useMSDKWebAuthentication() then
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.back()
			else
				p5:dispatch(NavigateBackModule())
			end
		end
		p5:dispatch(SetMSDKLoginErrMessageKeyModule(v2.errMessageKey))
		p1.Diag:reportCounter("RequestMSDKLoginAuthenticationProtocolFailure", 1)
		
		return PromiseModule.reject()
	end
end