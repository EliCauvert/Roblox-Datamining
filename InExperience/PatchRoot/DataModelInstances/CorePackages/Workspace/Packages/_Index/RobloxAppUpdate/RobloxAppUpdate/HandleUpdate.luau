local RobloxAppUpdate = script:FindFirstAncestor("RobloxAppUpdate")
local _ = require(RobloxAppUpdate.Types)
local ThunksModule = require(RobloxAppUpdate.Thunks)
local GetUpdateMessageTypeFunction = ThunksModule.GetUpdateMessageType
local OpenCentralOverlayForUpdateRequiredPromptFunction = ThunksModule.OpenCentralOverlayForUpdateRequiredPrompt
local SetNetworkingErrorToastFunction = require(RobloxAppUpdate.Parent.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast

return function(Callback, p1, p2, p3, p4, Callback1)
	-- upvalues: GetUpdateMessageTypeFunction (copy), OpenCentralOverlayForUpdateRequiredPromptFunction (copy), SetNetworkingErrorToastFunction (copy)
	Callback(GetUpdateMessageTypeFunction(p1, p2, p3, p4)):andThen(function(Result)
		-- upvalues: Callback (copy), OpenCentralOverlayForUpdateRequiredPromptFunction (upval), p1 (copy), Callback1 (copy)
		if Result then
			Callback(OpenCentralOverlayForUpdateRequiredPromptFunction(p1:canPerformBinaryUpdate(), false, Result))
			
			return
		else
			Callback1()
		end
	end):catch(function(Err)
		-- upvalues: Callback (copy), SetNetworkingErrorToastFunction (upval)
		warn(Err)
		Callback(SetNetworkingErrorToastFunction({ HttpError = Enum.HttpError.OK }))
	end)
end