local enableVRUpdate3EngineFeature = game:GetEngineFeature("EnableVRUpdate3")
local VRService = require(script:FindFirstAncestor("VrCommon").Parent.MockableProxyServices).VRService

return {
	RayPlaneIntersection = function(p0, p1, p2)
		p1 = p1.unit
		p0 = p0.Unit
		local direction = p1:Dot(p0.Direction)
		
		if direction == 0 then
			return nil
		end
		local var2 = p1:Dot(p2 - p0.Origin) / direction
		
		return if var2 < 0 then nil else p0.Origin + p0.Direction * var2
	end,
	GetUserCFrameWorldSpace = function(p3)
		-- upvalues: VRService (ref)
		local var3 = VRService:GetUserCFrame(p3)
		
		if not workspace.CurrentCamera.HeadLocked then
			var3 = VRService:GetUserCFrame(Enum.UserCFrame.Head):Inverse() * var3
		end
		return workspace.CurrentCamera.CFrame * (CFrame.new(var3.p * workspace.CurrentCamera.HeadScale) * (var3 - var3.p))
	end,
	getCurrentControllerType = function()
		-- upvalues: enableVRUpdate3EngineFeature (ref), VRService (ref)
		local var4 = if enableVRUpdate3EngineFeature then VRService.VRDeviceName else nil
		
		return if var4:match("Vive") then "Vive" elseif var4:match("Rift") then "Rift" elseif var4:match("Index") then "Index" elseif var4:match("Oculus") or (var4:match("Meta") or (var4:match("OpenXr") or var4:match("OpenXR"))) then "Touch" else "Rift"
	end
}