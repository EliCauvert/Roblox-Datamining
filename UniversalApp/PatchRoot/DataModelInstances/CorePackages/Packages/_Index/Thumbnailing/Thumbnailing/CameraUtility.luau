local t = {
	DefaultHeadMarginScale = 1.1,
	DefaultBodyMarginScale = 1.1,
	DefaultBodyPartMarginScale = 1.2,
	XRotForFullBody = 15,
	XRotForCloseup = 0,
	DistanceScaleForFullBody = 1,
	GetCameraCFrame = function(p1, p2)
		return CFrame.lookAt(p1 * p2, p1.Position)
	end,
	CreateThumbnailCamera = function()
		local thumbnailCamera = Instance.new("Camera")
		thumbnailCamera.Name = "ThumbnailCamera"
		thumbnailCamera.CameraType = Enum.CameraType.Scriptable
		thumbnailCamera.Parent = workspace:GetChildren()[1]
		
		return thumbnailCamera
	end,
	CalculateBaseDistanceToCamera = function(p1, p2, p3, p4)
		return math.max((p3.X - p2.X) / 2, (p3.Y - p2.Y) / 2) * p4 / math.tan(p1 / 2)
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

function t.SetupCamera(p1, p2)
	-- upvalues: t (ref), cFrameUtilityModule (ref), vectorUtilityModule (ref)
	if p2.optFieldOfView then
		p1.FieldOfView = p2.optFieldOfView
	end
	local var1 = t.CalculateBaseDistanceToCamera(math.rad(p2.optFieldOfViewForDistanceScale or p1.FieldOfView), p2.minExtent, p2.maxExtent, p2.extentScale)
	
	if p2.optCameraDistanceScale then
		var1 *= p2.optCameraDistanceScale
	end
	p1.CFrame = t.GetCameraCFrame(cFrameUtilityModule.AdjustTargetCFrameWithExtents(p2.targetCFrame, p2.minExtent, p2.maxExtent), vectorUtilityModule.Vector3FromXYRotPlusDistance(p2.optCameraXRot or 0, p2.optCameraYRot or 0, var1))
end

function t.SetupBodyPartCamera(p1, p2, p3, p4)
	-- upvalues: cFrame_1 (ref), cFrame (ref), characterUtilityModule (ref), t (ref)
	local t_1 = {}
	
	if #p3 > 0 then
		for i, v in pairs(p3) do
			local var1 = p1:FindFirstChild(v, true)
			
			if var1 then
				table.insert(t_1, var1)
			end
		end
	end
	local var2 = (if p2 then cFrame_1 else cFrame) * p1:FindFirstChild("HumanoidRootPart").CFrame
	local var3, var4 = characterUtilityModule.CalculateBodyPartsExtents(var2, t_1)
	t.SetupCamera(p4, {
		optFieldOfView = 30,
		targetCFrame = var2,
		minExtent = var3,
		maxExtent = var4,
		extentScale = t.DefaultBodyPartMarginScale
	})
end

function t.SetupHeadCamera(p5, p6)
	-- upvalues: cFrameUtilityModule (ref), characterUtilityModule (ref), t (ref)
	local var5 = CFrame.fromEulerAnglesYXZ(0.261799387799, 0.523598775598, 0) * cFrameUtilityModule.CalculateTargetCFrame(p5:FindFirstChild("Head").CFrame)
	local var6, var7 = characterUtilityModule.CalculateHeadExtents(p5, var5)
	t.SetupCamera(p6, {
		optFieldOfView = 30,
		extentScale = 1.1,
		targetCFrame = var5,
		minExtent = var6,
		maxExtent = var7
	})
end

local function _(p5)
	local meshPart = p5:FindFirstChildWhichIsA("MeshPart")
	
	if meshPart then
		assert(meshPart, "Assert handle is not nil to silence type checker")
		
		return meshPart:FindFirstChild("LeftFootAttachment") ~= nil
	end
	return false
end

local _ = function(p5)
	local meshPart = p5:FindFirstChildWhichIsA("MeshPart")
	
	if meshPart then
		assert(meshPart, "Assert handle is not nil to silence type checker")
		
		return meshPart:FindFirstChild("RightFootAttachment") ~= nil
	end
	return false
end

local _ = function(vectorA)
	-- upvalues: cframe_1 (ref), cframe_2 (ref), cframe (ref)
	local var5
	local meshPart = vectorA:FindFirstChildWhichIsA("MeshPart")
	
	if meshPart then
		assert(meshPart, "Assert handle is not nil to silence type checker")
		var5 = meshPart:FindFirstChild("LeftFootAttachment") ~= nil
	else
		var5 = false
	end
	if var5 then
		return cframe_1
	end
	local var6
	local meshPart_1 = vectorA:FindFirstChildWhichIsA("MeshPart")
	
	if meshPart_1 then
		assert(meshPart_1, "Assert handle is not nil to silence type checker")
		var6 = meshPart_1:FindFirstChild("RightFootAttachment") ~= nil
	else
		var6 = false
	end
	return if var6 then cframe_2 else cframe
end

function t.SetupAccessoryCamera(p5, p6)
	-- upvalues: cframe_1 (ref), cframe_2 (ref), cframe (ref), characterUtilityModule (ref), t (ref)
	local var5
	local children = p5:GetChildren()
	assert(#children == 1, "Assert SetupMeshPartAccessoryCamera accessoryModel only has accessory as a child.")
	local var6 = children[1]
	local handle = var6:FindFirstChild("Handle")
	assert(handle, "Assert Accessory has handle for camera setup.")
	handle.CFrame = CFrame.new()
	local cFrame = handle.CFrame
	local meshPart = var6:FindFirstChildWhichIsA("MeshPart")
	
	if meshPart then
		assert(meshPart, "Assert handle is not nil to silence type checker")
		var5 = meshPart:FindFirstChild("LeftFootAttachment") ~= nil
	else
		var5 = false
	end
	local var7
	if var5 then
		var7 = cframe_1
	else
		local meshPart_1 = var6:FindFirstChildWhichIsA("MeshPart")
		
		if meshPart_1 then
			assert(meshPart_1, "Assert handle is not nil to silence type checker")
			var5 = meshPart_1:FindFirstChild("RightFootAttachment") ~= nil
		else
			var5 = false
		end
		var7 = if var5 then cframe_2 else cframe
	end
	local var8 = cFrame * var7
	local var9, var10 = characterUtilityModule.CalculateModelExtents(p5, var8)
	t.SetupCamera(p6, {
		optFieldOfView = 20,
		extentScale = 1.1,
		targetCFrame = var8,
		minExtent = var9,
		maxExtent = var10
	})
end

return t