local enableVRUpdate3EngineFeature = game:GetEngineFeature("EnableVRUpdate3")
local VRService = require(script:FindFirstAncestor("VrCommon").Parent.MockableProxyServices).VRService

return {
	RayPlaneIntersection = function(p1, p2, p3)
		p2 = p2.unit
		p1 = p1.Unit
		local direction = p2:Dot(p1.Direction)
		
		if direction == 0 then
			return nil
		end
		local var1 = p2:Dot(p3 - p1.Origin) / direction
		
		return if var1 < 0 then nil else p1.Origin + p1.Direction * var1
	end,
	GetUserCFrameWorldSpace = function(p1)
		-- upvalues: VRService (ref)
		local var1 = VRService:GetUserCFrame(p1)
		
		if not workspace.CurrentCamera.HeadLocked then
			var1 = VRService:GetUserCFrame(Enum.UserCFrame.Head):Inverse() * var1
		end
		return workspace.CurrentCamera.CFrame * (CFrame.new(var1.p * workspace.CurrentCamera.HeadScale) * (var1 - var1.p))
	end,
	getCurrentControllerType = function()
		-- upvalues: enableVRUpdate3EngineFeature (ref), VRService (ref)
		local var1 = if enableVRUpdate3EngineFeature then VRService.VRDeviceName else nil
		
		return if var1:match("Vive") then "Vive" elseif var1:match("Rift") then "Rift" elseif var1:match("Index") then "Index" elseif var1:match("Oculus") or (var1:match("Meta") or (var1:match("OpenXr") or var1:match("OpenXR"))) then "Touch" else "Rift"
	end
}