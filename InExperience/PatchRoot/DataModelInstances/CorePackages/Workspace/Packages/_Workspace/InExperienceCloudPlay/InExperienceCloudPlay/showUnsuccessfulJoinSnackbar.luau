local InExperienceCloudPlay = script:FindFirstAncestor("InExperienceCloudPlay")
local Parent = InExperienceCloudPlay.Parent
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.InExperienceLocales)
local TransientUIOverlayModule = require(Parent.TransientUIOverlay)
local CloudPlayTelemetryModule = require(InExperienceCloudPlay.CloudPlayTelemetry)
local DefaultLoadingScreenModule = require(InExperienceCloudPlay.DefaultLoadingScreen)
local UnsuccessfulJoinModule = require(InExperienceCloudPlay.UnsuccessfulJoin)
local CloudPlayUnsuccessfulJoinSnackbarSeconds = game:DefineFastInt("CloudPlayUnsuccessfulJoinSnackbarSeconds", 7)

return function(p1)
	-- upvalues: UnsuccessfulJoinModule (copy), TransientUIOverlayModule (copy), FoundationModule (copy), CloudPlayUnsuccessfulJoinSnackbarSeconds (copy), CloudPlayTelemetryModule (copy), DefaultLoadingScreenModule (copy)
	local ConsumeUnsuccessfulJoinResult, ConsumeUnsuccessfulJoinResult2 = UnsuccessfulJoinModule.consumeUnsuccessfulJoin()
	
	if not ConsumeUnsuccessfulJoinResult then return end
	local function show()
		-- upvalues: TransientUIOverlayModule (upval), p1 (copy), FoundationModule (upval), CloudPlayUnsuccessfulJoinSnackbarSeconds (upval), CloudPlayTelemetryModule (upval), ConsumeUnsuccessfulJoinResult2 (copy)
		TransientUIOverlayModule.displaySnackbar({
			kind = "snackbar",
			title = p1:Format("Feature.CloudClient.Label.CloudPlayJoinFailed"),
			icon = FoundationModule.Enums.IconName.TriangleExclamation
		}, CloudPlayUnsuccessfulJoinSnackbarSeconds)
		CloudPlayTelemetryModule.logUnsuccessfulJoinSnackbarShown(ConsumeUnsuccessfulJoinResult2, "connection_failure")
	end
	
	if DefaultLoadingScreenModule.isRemoved() then
		show()
		
		return
	else
		local Callback = nil
		Callback = DefaultLoadingScreenModule.subscribeRemoved(function()
			-- upvalues: Callback (ref), show (copy)
			Callback()
			show()
		end)
	end
end