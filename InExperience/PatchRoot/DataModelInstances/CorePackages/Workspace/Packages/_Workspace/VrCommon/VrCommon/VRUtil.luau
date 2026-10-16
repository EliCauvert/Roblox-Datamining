local EnableVRUpdate3EngineFeature = game:GetEngineFeature("EnableVRUpdate3")
local VRService = require(script:FindFirstAncestor("VrCommon").Parent.MockableProxyServices).VRService

return {
	RayPlaneIntersection = function(Direction, p1, p2) --[[ Line: 17 ]]
		local Unit = p1.unit
		local Direction1 = Direction.Unit
		local DotProduct = Unit:Dot(Direction1.Direction)
		
		if DotProduct == 0 then
			return nil
		else
			local DotProductRatio = Unit:Dot(p2 - Direction1.Origin) / DotProduct
			
			return if DotProductRatio < 0 then nil else Direction1.Origin + Direction1.Direction * DotProductRatio
		end
	end,
	GetUserCFrameWorldSpace = function(p1): CFrame --[[ Line: 35 ]]
		-- upvalues: VRService (copy)
		local UserCFrame = VRService:GetUserCFrame(p1)
		
		if not workspace.CurrentCamera.HeadLocked then
			UserCFrame = VRService:GetUserCFrame(Enum.UserCFrame.Head):Inverse() * UserCFrame
		end
		return workspace.CurrentCamera.CFrame * (CFrame.new(UserCFrame.p * workspace.CurrentCamera.HeadScale) * (UserCFrame - UserCFrame.p))
	end,
	getCurrentControllerType = function(): string --[[ Line: 47 ]]
		-- upvalues: EnableVRUpdate3EngineFeature (copy), VRService (copy)
		local VRDeviceName = EnableVRUpdate3EngineFeature and VRService.VRDeviceName or nil
		local Oculus = VRDeviceName:match("Oculus") or (VRDeviceName:match("Meta") or (VRDeviceName:match("OpenXr") or VRDeviceName:match("OpenXR")))
		
		return if VRDeviceName:match("Vive") then "Vive" elseif VRDeviceName:match("Rift") then "Rift" elseif VRDeviceName:match("Index") then "Index" elseif Oculus then "Touch" else "Rift"
	end
}