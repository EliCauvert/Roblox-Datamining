local RobloxAppUpdate = script:FindFirstAncestor("RobloxAppUpdate")
local Parent = RobloxAppUpdate.Parent
local _ = require(RobloxAppUpdate.Types)
local JoinGamePlayButtonFunction = require(Parent.DiscoveryAnalytics).Points.joinGamePlayButton
local UpdateMessageTypeModule = require(RobloxAppUpdate.UpdateMessageType)
local PromiseModule = require(Parent.Promise)
local config = {
	[Enum.AppUpdateStatus.Available] = UpdateMessageTypeModule.Default,
	[Enum.AppUpdateStatus.AvailableBoundChannel] = UpdateMessageTypeModule.InternalChannel,
	[Enum.AppUpdateStatus.AvailableBetaProgram] = UpdateMessageTypeModule.BetaProgram
}

return function(p1, p2, p3, Ctx)
	-- upvalues: PromiseModule (copy), JoinGamePlayButtonFunction (copy), config (copy)
	return function(_)
		-- upvalues: p2 (copy), p1 (copy), PromiseModule (upval), JoinGamePlayButtonFunction (upval), p3 (copy), Ctx (copy), config (upval)
		return if p2 and not p1:canPerformBinaryUpdate() then PromiseModule.resolve(nil) else p1:checkForUpdate():andThen(function(Result)
			-- upvalues: JoinGamePlayButtonFunction (upval), p3 (upval), Ctx (upval), PromiseModule (upval), config (upval)
			local AppUpdateStatus = Result.appUpdateStatus
			JoinGamePlayButtonFunction(p3.InfluxDb, "checkForUpdate", { ctx = Ctx, appUpdateStatus = AppUpdateStatus })
			
			return if Result.errorMessage then PromiseModule.reject(Result.errorMessage) else PromiseModule.resolve(config[AppUpdateStatus])
		end)
	end
end