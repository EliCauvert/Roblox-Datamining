local Modules = game:GetService("CoreGui").RobloxGui.Modules
local TModule = require(game:GetService("CorePackages").Packages.t)
local PromiseModule = require(Modules.LuaApp.Promise)
local SignUpRequestModule = require(Modules.Luobu.Http.Requests.SignUpRequest)
local LaunchLuobuAppModule = require(Modules.Luobu.Thunks.LaunchLuobuApp)
local SetNetworkingErrorToastModule = require(Modules.LuaApp.Thunks.SetNetworkingErrorToast)
local AppSignupCounterNamesModule = require(Modules.Luobu.Analytics.Events.AppSignupCounterNames)
local InterfaceResult = TModule.interface({
	birthday = TModule.string,
	displayName = TModule.string,
	gender = TModule.number,
	voucher = TModule.string,
	channelId = TModule.number,
	agreementIds = TModule.table
})

return function(p1, p2, p3, p4, p5)
	-- upvalues: InterfaceResult (copy), SignUpRequestModule (copy), AppSignupCounterNamesModule (copy), LaunchLuobuAppModule (copy), PromiseModule (copy), SetNetworkingErrorToastModule (copy)
	return function(p6)
		-- upvalues: InterfaceResult (upval), p5 (copy), SignUpRequestModule (upval), p1 (copy), p4 (copy), p2 (copy), AppSignupCounterNamesModule (upval), LaunchLuobuAppModule (upval), p3 (copy), PromiseModule (upval), SetNetworkingErrorToastModule (upval)
		assert(InterfaceResult(p5))
		
		return SignUpRequestModule(p1, p4, p5):andThen(function(_)
			-- upvalues: p2 (upval), AppSignupCounterNamesModule (upval), p6 (copy), LaunchLuobuAppModule (upval), p1 (upval), p3 (upval), PromiseModule (upval)
			p2.Diag:reportCounter(AppSignupCounterNamesModule.Success, 1)
			p6:dispatch(LaunchLuobuAppModule(p1, p2, p3))
			
			return PromiseModule.resolve()
		end, function(_)
			-- upvalues: p2 (upval), AppSignupCounterNamesModule (upval), p6 (copy), SetNetworkingErrorToastModule (upval), PromiseModule (upval)
			p2.Diag:reportCounter(AppSignupCounterNamesModule.Failure, 1)
			p6:dispatch(SetNetworkingErrorToastModule({ HttpError = Enum.HttpError.OK }))
			
			return PromiseModule.reject()
		end)
	end
end