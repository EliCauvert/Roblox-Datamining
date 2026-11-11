local Modules = game:GetService("CoreGui").RobloxGui.Modules
local GetPasswordValidModule = require(Modules.LuaApp.Http.Requests.GetPasswordValid)
local PromiseModule = require(Modules.LuaApp.Promise)
local SetNetworkingErrorToastModule = require(Modules.LuaApp.Thunks.SetNetworkingErrorToast)
local SetSignUpPasswordModule = require(Modules.LuaApp.Actions.Authentication.SetSignUpPassword)
local FFlagRemoveUnusedSignUpInfoRoduxSlice = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).FFlagRemoveUnusedSignUpInfoRoduxSlice

return function(p1, p2, p3)
	-- upvalues: GetPasswordValidModule (copy), FFlagRemoveUnusedSignUpInfoRoduxSlice (copy), SetSignUpPasswordModule (copy), PromiseModule (copy), SetNetworkingErrorToastModule (copy)
	return function(p4)
		-- upvalues: GetPasswordValidModule (upval), p1 (copy), p2 (copy), p3 (copy), FFlagRemoveUnusedSignUpInfoRoduxSlice (upval), SetSignUpPasswordModule (upval), PromiseModule (upval), SetNetworkingErrorToastModule (upval)
		return GetPasswordValidModule(p1, p2, p3):andThen(function(Result)
			-- upvalues: FFlagRemoveUnusedSignUpInfoRoduxSlice (upval), p4 (copy), SetSignUpPasswordModule (upval), p3 (upval), PromiseModule (upval)
			if not Result or not Result.responseBody or Result.responseBody.code ~= 0 then
				return PromiseModule.reject()
			end
			if not FFlagRemoveUnusedSignUpInfoRoduxSlice then
				p4:dispatch(SetSignUpPasswordModule(p3))
			end
			return PromiseModule.resolve()
		end, function(p5)
			-- upvalues: p4 (copy), SetNetworkingErrorToastModule (upval), PromiseModule (upval)
			p4:dispatch(SetNetworkingErrorToastModule(p5))
			
			return PromiseModule.reject(p5)
		end)
	end
end