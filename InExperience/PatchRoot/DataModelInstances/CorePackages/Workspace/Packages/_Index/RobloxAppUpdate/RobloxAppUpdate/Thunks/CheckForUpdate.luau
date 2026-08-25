local robloxAppUpdate = script:FindFirstAncestor("RobloxAppUpdate")
local parent = robloxAppUpdate.Parent
local dashModule = require(parent.Dash)
local joinGamePlayButton = require(parent.DiscoveryAnalytics).Points.joinGamePlayButton
local setNetworkingErrorToast = require(parent.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast
local openCentralOverlayForUpdateRequiredPromptModule = require(robloxAppUpdate.Thunks.OpenCentralOverlayForUpdateRequiredPrompt)
local updateMessageTypeModule = require(robloxAppUpdate.UpdateMessageType)

return function(p0, p1, p2, p3, p4)
	-- upvalues: dashModule (ref), joinGamePlayButton (ref), setNetworkingErrorToast (ref), openCentralOverlayForUpdateRequiredPromptModule (ref), updateMessageTypeModule (ref)
	return function(p5)
		-- upvalues: p0 (ref), p3 (ref), p1 (ref), p4 (ref), dashModule (copy), joinGamePlayButton (copy), p2 (ref), setNetworkingErrorToast (copy), openCentralOverlayForUpdateRequiredPromptModule (copy), updateMessageTypeModule (copy)
		if p0 == nil then
			warn("appUpdateImpl is nil")
			
			if p3 then
				p3()
			end
			return
		elseif not p1 or p0:canPerformBinaryUpdate() then
			p0:checkForUpdate():andThen(function(p6)
				-- upvalues: p4 (copy), dashModule (copy), joinGamePlayButton (copy), p2 (copy), p5 (ref), setNetworkingErrorToast (copy), openCentralOverlayForUpdateRequiredPromptModule (copy), p0 (copy), updateMessageTypeModule (copy), p3 (copy)
				local appUpdateStatus = p6.appUpdateStatus
				local t = { appUpdateStatus = appUpdateStatus }
				
				if p4 then
					t = dashModule.join(t, p4)
				end
				joinGamePlayButton(p2.InfluxDb, "checkForUpdate", t)
				
				if p6.errorMessage then
					warn(p6.errorMessage)
					p5:dispatch(setNetworkingErrorToast({ HttpError = Enum.HttpError.OK }))
					
					return
				elseif appUpdateStatus == Enum.AppUpdateStatus.Available then
					p5:dispatch(openCentralOverlayForUpdateRequiredPromptModule(p0:canPerformBinaryUpdate(), false, updateMessageTypeModule.Default))
					
					return
				elseif appUpdateStatus == Enum.AppUpdateStatus.AvailableBoundChannel then
					p5:dispatch(openCentralOverlayForUpdateRequiredPromptModule(p0:canPerformBinaryUpdate(), false, updateMessageTypeModule.InternalChannel))
					
					return
				elseif appUpdateStatus == Enum.AppUpdateStatus.AvailableBetaProgram then
					p5:dispatch(openCentralOverlayForUpdateRequiredPromptModule(p0:canPerformBinaryUpdate(), false, updateMessageTypeModule.BetaProgram))
					
					return
				elseif p3 then
					p3()
				end
			end)
			
			return
		elseif p3 then
			p3()
		end
	end
end