local t = {
	DefaultHeadMarginScale = 1.1,
	DefaultBodyMarginScale = 1.1,
	DefaultBodyPartMarginScale = 1.2,
	XRotForFullBody = 15,
	XRotForCloseup = 0,
	DistanceScaleForFullBody = 1,
	GetCameraCFrame = function(p0, p1)
		return CFrame.lookAt(p0 * p1, p0.Position)
	end,
	CreateThumbnailCamera = function()
		local thumbnailCamera = Instance.new("Camera")
		thumbnailCamera.Name = "ThumbnailCamera"
		thumbnailCamera.CameraType = Enum.CameraType.Scriptable
		thumbnailCamera.Parent = workspace:GetChildren()[1]
		
		return thumbnailCamera
	end,
	CalculateBaseDistanceToCamera = function(p2, p3, p4, p5)
		return math.max((p4.X - p3.X) / 2, (p4.Y - p3.Y) / 2) * p5 / math.tan(p2 / 2)
	end
}
local cFrameUtilityModule = require(script.Parent.CFrameUtility)
local vectorUtilityModule = require(script.Parent.VectorUtility)
local characterUtilityModule = require(script.Parent.CharacterUtility)
local cFrame = CFrame.fromEulerAnglesYXZ(-0.349065850399, 0.349065850399, 0)
local cFrame_1 = CFrame.fromEulerAnglesYXZ(-0.349065850399, -0.349065850399, 0)
local cframe = CFrame.Angles(0.436332312999, 0.436332312999, 0)
local cframe_1 = CFrame.Angles(0, 1.570796326795, 0)
local cframe_2 = CFrame.Angles(0, -1.570796326795, 0)

function t.SetupCamera(p6, p7)
	-- upvalues: t (ref), cFrameUtilityModule (ref), vectorUtilityModule (ref)
	if p7.optFieldOfView then
		p6.FieldOfView = p7.optFieldOfView
	end
	local var10 = t.CalculateBaseDistanceToCamera(math.rad(p7.optFieldOfViewForDistanceScale or p6.FieldOfView), p7.minExtent, p7.maxExtent, p7.extentScale)
	
	if p7.optCameraDistanceScale then
		var10 *= p7.optCameraDistanceScale
	end
	p6.CFrame = t.GetCameraCFrame(cFrameUtilityModule.AdjustTargetCFrameWithExtents(p7.targetCFrame, p7.minExtent, p7.maxExtent), vectorUtilityModule.Vector3FromXYRotPlusDistance(p7.optCameraXRot or 0, p7.optCameraYRot or 0, var10))
end

function t.SetupBodyPartCamera(p8, p9, p10, p11)
	-- upvalues: cFrame_1 (ref), cFrame (ref), characterUtilityModule (ref), t (ref)
	local t_1 = {}
	
	if #p10 > 0 then
		for i, v in pairs(p10) do
			local var12 = p8:FindFirstChild(v, true)
			
			if var12 then
				table.insert(t_1, var12)
			end
		end
	end
	local var13 = (if p9 then cFrame_1 else cFrame) * p8:FindFirstChild("HumanoidRootPart").CFrame
	local var14, var15 = characterUtilityModule.CalculateBodyPartsExtents(var13, t_1)
	t.SetupCamera(p11, {
		optFieldOfView = 30,
		targetCFrame = var13,
		minExtent = var14,
		maxExtent = var15,
		extentScale = t.DefaultBodyPartMarginScale
	})
end

function t.SetupHeadCamera(p12, p13)
	-- upvalues: cFrameUtilityModule (ref), characterUtilityModule (ref), t (ref)
	local var16 = CFrame.fromEulerAnglesYXZ(0.261799387799, 0.523598775598, 0) * cFrameUtilityModule.CalculateTargetCFrame(p12:FindFirstChild("Head").CFrame)
	local var17, var18 = characterUtilityModule.CalculateHeadExtents(p12, var16)
	t.SetupCamera(p13, {
		optFieldOfView = 30,
		extentScale = 1.1,
		targetCFrame = var16,
		minExtent = var17,
		maxExtent = var18
	})
end

local function _(p14)
	local meshPart = p14:FindFirstChildWhichIsA("MeshPart")
	
	if meshPart then
		assert(meshPart, "Assert handle is not nil to silence type checker")
		
		return meshPart:FindFirstChild("LeftFootAttachment") ~= nil
	end
	return false
end

local _ = function(p15)
	local meshPart = p15:FindFirstChildWhichIsA("MeshPart")
	
	if meshPart then
		assert(meshPart, "Assert handle is not nil to silence type checker")
		
		return meshPart:FindFirstChild("RightFootAttachment") ~= nil
	end
	return false
end

local _ = function(vectorA)
	-- upvalues: cframe_1 (ref), cframe_2 (ref), cframe (ref)
	local var22
	local meshPart = vectorA:FindFirstChildWhichIsA("MeshPart")
	
	if meshPart then
		assert(meshPart, "Assert handle is not nil to silence type checker")
		var22 = meshPart:FindFirstChild("LeftFootAttachment") ~= nil
	else
		var22 = false
	end
	if var22 then
		return cframe_1
	end
	local var24
	local meshPart_1 = vectorA:FindFirstChildWhichIsA("MeshPart")
	
	if meshPart_1 then
		assert(meshPart_1, "Assert handle is not nil to silence type checker")
		var24 = meshPart_1:FindFirstChild("RightFootAttachment") ~= nil
	else
		var24 = false
	end
	return if var24 then cframe_2 else cframe
end

function t.SetupAccessoryCamera(p16, p17)
	-- upvalues: cframe_1 (ref), cframe_2 (ref), cframe (ref), characterUtilityModule (ref), t (ref)
	local var29
	local children = p16:GetChildren()
	assert(#children == 1, "Assert SetupMeshPartAccessoryCamera accessoryModel only has accessory as a child.")
	local var26 = children[1]
	local handle = var26:FindFirstChild("Handle")
	assert(handle, "Assert Accessory has handle for camera setup.")
	handle.CFrame = CFrame.new()
	local cFrame = handle.CFrame
	local meshPart = var26:FindFirstChildWhichIsA("MeshPart")
	
	if meshPart then
		assert(meshPart, "Assert handle is not nil to silence type checker")
		var29 = meshPart:FindFirstChild("LeftFootAttachment") ~= nil
	else
		var29 = false
	end
	local var30
	if var29 then
		var30 = cframe_1
	else
		local meshPart_1 = var26:FindFirstChildWhichIsA("MeshPart")
		
		if meshPart_1 then
			assert(meshPart_1, "Assert handle is not nil to silence type checker")
			var29 = meshPart_1:FindFirstChild("RightFootAttachment") ~= nil
		else
			var29 = false
		end
		var30 = if var29 then cframe_2 else cframe
	end
	local var32 = cFrame * var30
	local var33, var34 = characterUtilityModule.CalculateModelExtents(p16, var32)
	t.SetupCamera(p17, {
		optFieldOfView = 20,
		extentScale = 1.1,
		targetCFrame = var32,
		minExtent = var33,
		maxExtent = var34
	})
end

return t