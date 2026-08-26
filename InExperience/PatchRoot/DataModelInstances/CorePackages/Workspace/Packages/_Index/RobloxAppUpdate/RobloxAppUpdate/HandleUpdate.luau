local robloxAppUpdate = script:FindFirstAncestor("RobloxAppUpdate")
local parent = robloxAppUpdate.Parent
local _ = require(robloxAppUpdate.Types)
local thunksModule = require(robloxAppUpdate.Thunks)
local getUpdateMessageType = thunksModule.GetUpdateMessageType
local openCentralOverlayForUpdateRequiredPrompt = thunksModule.OpenCentralOverlayForUpdateRequiredPrompt
local setNetworkingErrorToast = require(parent.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: getUpdateMessageType (ref), openCentralOverlayForUpdateRequiredPrompt (ref), setNetworkingErrorToast (ref)
	p1(getUpdateMessageType(p2, p3, p4, p5)):andThen(function(p7)
		-- upvalues: p1 (ref), openCentralOverlayForUpdateRequiredPrompt (copy), p2 (ref), p6 (ref)
		if p7 then
			p1(openCentralOverlayForUpdateRequiredPrompt(p2:canPerformBinaryUpdate(), false, p7))
			
			return
		end
		p6()
	end):catch(function(p7)
		-- upvalues: p1 (ref), setNetworkingErrorToast (copy)
		warn(p7)
		p1(setNetworkingErrorToast({ HttpError = Enum.HttpError.OK }))
	end)
end