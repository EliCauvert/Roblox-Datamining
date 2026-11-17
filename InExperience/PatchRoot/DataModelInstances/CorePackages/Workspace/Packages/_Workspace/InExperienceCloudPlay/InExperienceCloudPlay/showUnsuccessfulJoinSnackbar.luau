local InExperienceCloudPlay = script:FindFirstAncestor("InExperienceCloudPlay")
local Parent = InExperienceCloudPlay.Parent
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.InExperienceLocales)
local TransientUIOverlayModule = require(Parent.TransientUIOverlay)
local DefaultLoadingScreenModule = require(InExperienceCloudPlay.DefaultLoadingScreen)
local UnsuccessfulJoinModule = require(InExperienceCloudPlay.UnsuccessfulJoin)
local CloudPlayUnsuccessfulJoinSnackbarSeconds = game:DefineFastInt("CloudPlayUnsuccessfulJoinSnackbarSeconds", 7)

return function(p1)
	-- upvalues: UnsuccessfulJoinModule (copy), TransientUIOverlayModule (copy), FoundationModule (copy), CloudPlayUnsuccessfulJoinSnackbarSeconds (copy), DefaultLoadingScreenModule (copy)
	if not UnsuccessfulJoinModule.consumeUnsuccessfulJoin() then return end
	local function _()
		-- upvalues: TransientUIOverlayModule (upval), p1 (copy), FoundationModule (upval), CloudPlayUnsuccessfulJoinSnackbarSeconds (upval)
		TransientUIOverlayModule.displaySnackbar({
			kind = "snackbar",
			title = p1:Format("Feature.CloudClient.Label.CloudPlayJoinFailed"),
			icon = FoundationModule.Enums.IconName.TriangleExclamation
		}, CloudPlayUnsuccessfulJoinSnackbarSeconds)
	end
	
	if DefaultLoadingScreenModule.isRemoved() then
		TransientUIOverlayModule.displaySnackbar({
			kind = "snackbar",
			title = p1:Format("Feature.CloudClient.Label.CloudPlayJoinFailed"),
			icon = FoundationModule.Enums.IconName.TriangleExclamation
		}, CloudPlayUnsuccessfulJoinSnackbarSeconds)
		
		return
	else
		local Callback = nil
		Callback = DefaultLoadingScreenModule.subscribeRemoved(function()
			-- upvalues: Callback (ref), TransientUIOverlayModule (upval), p1 (copy), FoundationModule (upval), CloudPlayUnsuccessfulJoinSnackbarSeconds (upval)
			Callback()
			TransientUIOverlayModule.displaySnackbar({
				kind = "snackbar",
				title = p1:Format("Feature.CloudClient.Label.CloudPlayJoinFailed"),
				icon = FoundationModule.Enums.IconName.TriangleExclamation
			}, CloudPlayUnsuccessfulJoinSnackbarSeconds)
		end)
	end
end