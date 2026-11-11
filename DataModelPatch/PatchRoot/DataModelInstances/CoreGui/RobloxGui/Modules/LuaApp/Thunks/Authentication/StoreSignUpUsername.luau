local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PostUsernameValidModule = require(Modules.LuaApp.Http.Requests.PostUsernameValid)
local PromiseModule = require(Modules.LuaApp.Promise)
local SetNetworkingErrorToastModule = require(Modules.LuaApp.Thunks.SetNetworkingErrorToast)
local SetSignUpUsernameModule = require(Modules.LuaApp.Actions.Authentication.SetSignUpUsername)
local FFlagRemoveUnusedSignUpInfoRoduxSlice = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).FFlagRemoveUnusedSignUpInfoRoduxSlice

return function(p1, p2, p3, p4)
	-- upvalues: PostUsernameValidModule (copy), FFlagRemoveUnusedSignUpInfoRoduxSlice (copy), SetSignUpUsernameModule (copy), PromiseModule (copy), SetNetworkingErrorToastModule (copy)
	return function(p5)
		-- upvalues: PostUsernameValidModule (upval), p1 (copy), p2 (copy), p3 (copy), p4 (copy), FFlagRemoveUnusedSignUpInfoRoduxSlice (upval), SetSignUpUsernameModule (upval), PromiseModule (upval), SetNetworkingErrorToastModule (upval)
		return PostUsernameValidModule(p1, p2, p3, p4):andThen(function(Result)
			-- upvalues: FFlagRemoveUnusedSignUpInfoRoduxSlice (upval), p5 (copy), SetSignUpUsernameModule (upval), p2 (upval), PromiseModule (upval)
			if (Result and (Result.responseBody and Result.responseBody.code)) ~= 0 then
				return PromiseModule.reject()
			end
			if not FFlagRemoveUnusedSignUpInfoRoduxSlice then
				p5:dispatch(SetSignUpUsernameModule(p2))
			end
			return PromiseModule.resolve()
		end, function(p6)
			-- upvalues: p5 (copy), SetNetworkingErrorToastModule (upval), PromiseModule (upval)
			p5:dispatch(SetNetworkingErrorToastModule(p6))
			
			return PromiseModule.reject(p6)
		end)
	end
end