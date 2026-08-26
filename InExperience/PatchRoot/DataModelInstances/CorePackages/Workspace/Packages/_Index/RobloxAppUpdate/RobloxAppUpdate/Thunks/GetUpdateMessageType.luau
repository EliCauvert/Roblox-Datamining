local robloxAppUpdate = script:FindFirstAncestor("RobloxAppUpdate")
local parent = robloxAppUpdate.Parent
local _ = require(robloxAppUpdate.Types)
local joinGamePlayButton = require(parent.DiscoveryAnalytics).Points.joinGamePlayButton
local updateMessageTypeModule = require(robloxAppUpdate.UpdateMessageType)
local promiseModule = require(parent.Promise)
local t = {
	[Enum.AppUpdateStatus.Available] = updateMessageTypeModule.Default,
	[Enum.AppUpdateStatus.AvailableBoundChannel] = updateMessageTypeModule.InternalChannel,
	[Enum.AppUpdateStatus.AvailableBetaProgram] = updateMessageTypeModule.BetaProgram
}

return function(p1, p2, p3, p4)
	-- upvalues: promiseModule (ref), joinGamePlayButton (ref), t (ref)
	return function(_)
		-- upvalues: p2 (ref), p1 (ref), promiseModule (copy), joinGamePlayButton (copy), p3 (ref), p4 (ref), t (copy)
		return if p2 and not p1:canPerformBinaryUpdate() then promiseModule.resolve(nil) else p1:checkForUpdate():andThen(function(p5)
			-- upvalues: joinGamePlayButton (copy), p3 (copy), p4 (copy), promiseModule (copy), t (copy)
			local appUpdateStatus = p5.appUpdateStatus
			joinGamePlayButton(p3.InfluxDb, "checkForUpdate", { ctx = p4, appUpdateStatus = appUpdateStatus })
			
			return if p5.errorMessage then promiseModule.reject(p5.errorMessage) else promiseModule.resolve(t[appUpdateStatus])
		end)
	end
end