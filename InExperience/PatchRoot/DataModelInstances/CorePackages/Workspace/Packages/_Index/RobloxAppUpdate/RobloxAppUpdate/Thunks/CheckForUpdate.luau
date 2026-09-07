local robloxAppUpdate = script:FindFirstAncestor("RobloxAppUpdate")
local parent = robloxAppUpdate.Parent
local dashModule = require(parent.Dash)
local joinGamePlayButton = require(parent.DiscoveryAnalytics).Points.joinGamePlayButton
local setNetworkingErrorToast = require(parent.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast
local openCentralOverlayForUpdateRequiredPromptModule = require(robloxAppUpdate.Thunks.OpenCentralOverlayForUpdateRequiredPrompt)
local updateMessageTypeModule = require(robloxAppUpdate.UpdateMessageType)

return function(p1, p2, p3, p4, p5)
	-- upvalues: dashModule (ref), joinGamePlayButton (ref), setNetworkingErrorToast (ref), openCentralOverlayForUpdateRequiredPromptModule (ref), updateMessageTypeModule (ref)
	return function(p6)
		-- upvalues: p1 (ref), p4 (ref), p2 (ref), p5 (ref), dashModule (copy), joinGamePlayButton (copy), p3 (ref), setNetworkingErrorToast (copy), openCentralOverlayForUpdateRequiredPromptModule (copy), updateMessageTypeModule (copy)
		if p1 == nil then
			warn("appUpdateImpl is nil")
			
			if p4 then
				p4()
			end
			return
		elseif not p2 or p1:canPerformBinaryUpdate() then
			p1:checkForUpdate():andThen(function(p7)
				-- upvalues: p5 (copy), dashModule (copy), joinGamePlayButton (copy), p3 (copy), p6 (ref), setNetworkingErrorToast (copy), openCentralOverlayForUpdateRequiredPromptModule (copy), p1 (copy), updateMessageTypeModule (copy), p4 (copy)
				local appUpdateStatus = p7.appUpdateStatus
				local t = { appUpdateStatus = appUpdateStatus }
				
				if p5 then
					t = dashModule.join(t, p5)
				end
				joinGamePlayButton(p3.InfluxDb, "checkForUpdate", t)
				
				if p7.errorMessage then
					warn(p7.errorMessage)
					p6:dispatch(setNetworkingErrorToast({ HttpError = Enum.HttpError.OK }))
					
					return
				elseif appUpdateStatus == Enum.AppUpdateStatus.Available then
					p6:dispatch(openCentralOverlayForUpdateRequiredPromptModule(p1:canPerformBinaryUpdate(), false, updateMessageTypeModule.Default))
					
					return
				elseif appUpdateStatus == Enum.AppUpdateStatus.AvailableBoundChannel then
					p6:dispatch(openCentralOverlayForUpdateRequiredPromptModule(p1:canPerformBinaryUpdate(), false, updateMessageTypeModule.InternalChannel))
					
					return
				elseif appUpdateStatus == Enum.AppUpdateStatus.AvailableBetaProgram then
					p6:dispatch(openCentralOverlayForUpdateRequiredPromptModule(p1:canPerformBinaryUpdate(), false, updateMessageTypeModule.BetaProgram))
					
					return
				elseif p4 then
					p4()
				end
			end)
			
			return
		elseif p4 then
			p4()
		end
	end
end