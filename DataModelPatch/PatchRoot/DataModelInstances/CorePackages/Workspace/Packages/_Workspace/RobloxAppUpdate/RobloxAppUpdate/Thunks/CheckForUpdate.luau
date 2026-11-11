local RobloxAppUpdate = script:FindFirstAncestor("RobloxAppUpdate")
local Parent = RobloxAppUpdate.Parent
local DashModule = require(Parent.Dash)
local JoinGamePlayButtonFunction = require(Parent.DiscoveryAnalytics).Points.joinGamePlayButton
local SetNetworkingErrorToastFunction = require(Parent.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast
local OpenCentralOverlayForUpdateRequiredPromptModule = require(RobloxAppUpdate.Thunks.OpenCentralOverlayForUpdateRequiredPrompt)
local UpdateMessageTypeModule = require(RobloxAppUpdate.UpdateMessageType)

return function(p1, p2, p3, Callback, p4)
	-- upvalues: DashModule (copy), JoinGamePlayButtonFunction (copy), SetNetworkingErrorToastFunction (copy), OpenCentralOverlayForUpdateRequiredPromptModule (copy), UpdateMessageTypeModule (copy)
	return function(p5)
		-- upvalues: p1 (copy), Callback (copy), p2 (copy), p4 (copy), DashModule (upval), JoinGamePlayButtonFunction (upval), p3 (copy), SetNetworkingErrorToastFunction (upval), OpenCentralOverlayForUpdateRequiredPromptModule (upval), UpdateMessageTypeModule (upval)
		if p1 == nil then
			warn("appUpdateImpl is nil")
			
			if Callback then
				Callback()
			end
			return
		elseif not p2 or p1:canPerformBinaryUpdate() then
			p1:checkForUpdate():andThen(function(Result)
				-- upvalues: p4 (upval), DashModule (upval), JoinGamePlayButtonFunction (upval), p3 (upval), p5 (copy), SetNetworkingErrorToastFunction (upval), OpenCentralOverlayForUpdateRequiredPromptModule (upval), p1 (upval), UpdateMessageTypeModule (upval), Callback (upval)
				local AppUpdateStatus = Result.appUpdateStatus
				local JoinResult = { appUpdateStatus = AppUpdateStatus }
				
				if p4 then
					JoinResult = DashModule.join(JoinResult, p4)
				end
				JoinGamePlayButtonFunction(p3.InfluxDb, "checkForUpdate", JoinResult)
				
				if Result.errorMessage then
					warn(Result.errorMessage)
					p5:dispatch(SetNetworkingErrorToastFunction({ HttpError = Enum.HttpError.OK }))
					
					return
				end
				if AppUpdateStatus == Enum.AppUpdateStatus.Available then
					p5:dispatch(OpenCentralOverlayForUpdateRequiredPromptModule(p1:canPerformBinaryUpdate(), false, UpdateMessageTypeModule.Default))
					
					return
				end
				if AppUpdateStatus == Enum.AppUpdateStatus.AvailableBoundChannel then
					p5:dispatch(OpenCentralOverlayForUpdateRequiredPromptModule(p1:canPerformBinaryUpdate(), false, UpdateMessageTypeModule.InternalChannel))
					
					return
				end
				if AppUpdateStatus == Enum.AppUpdateStatus.AvailableBetaProgram then
					p5:dispatch(OpenCentralOverlayForUpdateRequiredPromptModule(p1:canPerformBinaryUpdate(), false, UpdateMessageTypeModule.BetaProgram))
					
					return
				end
				if Callback then
					Callback()
				end
			end)
			
			return
		else
			if Callback then
				Callback()
			end
		end
	end
end