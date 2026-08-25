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

return function(p0, p1, p2, p3)
	-- upvalues: promiseModule (ref), joinGamePlayButton (ref), t (ref)
	return function(_)
		-- upvalues: p1 (ref), p0 (ref), promiseModule (copy), joinGamePlayButton (copy), p2 (ref), p3 (ref), t (copy)
		return if p1 and not p0:canPerformBinaryUpdate() then promiseModule.resolve(nil) else p0:checkForUpdate():andThen(function(p4)
			-- upvalues: joinGamePlayButton (copy), p2 (copy), p3 (copy), promiseModule (copy), t (copy)
			local appUpdateStatus = p4.appUpdateStatus
			joinGamePlayButton(p2.InfluxDb, "checkForUpdate", { ctx = p3, appUpdateStatus = appUpdateStatus })
			
			return if p4.errorMessage then promiseModule.reject(p4.errorMessage) else promiseModule.resolve(t[appUpdateStatus])
		end)
	end
end