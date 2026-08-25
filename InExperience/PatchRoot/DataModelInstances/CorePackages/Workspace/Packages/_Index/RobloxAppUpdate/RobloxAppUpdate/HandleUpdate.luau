local robloxAppUpdate = script:FindFirstAncestor("RobloxAppUpdate")
local parent = robloxAppUpdate.Parent
local _ = require(robloxAppUpdate.Types)
local thunksModule = require(robloxAppUpdate.Thunks)
local getUpdateMessageType = thunksModule.GetUpdateMessageType
local openCentralOverlayForUpdateRequiredPrompt = thunksModule.OpenCentralOverlayForUpdateRequiredPrompt
local setNetworkingErrorToast = require(parent.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast

return function(p0, p1, p2, p3, p4, p5)
	-- upvalues: getUpdateMessageType (ref), openCentralOverlayForUpdateRequiredPrompt (ref), setNetworkingErrorToast (ref)
	p0(getUpdateMessageType(p1, p2, p3, p4)):andThen(function(p7)
		-- upvalues: p0 (ref), openCentralOverlayForUpdateRequiredPrompt (copy), p1 (ref), p5 (ref)
		if p7 then
			p0(openCentralOverlayForUpdateRequiredPrompt(p1:canPerformBinaryUpdate(), false, p7))
			
			return
		end
		p5()
	end):catch(function(p6)
		-- upvalues: p0 (ref), setNetworkingErrorToast (copy)
		warn(p6)
		p0(setNetworkingErrorToast({ HttpError = Enum.HttpError.OK }))
	end)
end