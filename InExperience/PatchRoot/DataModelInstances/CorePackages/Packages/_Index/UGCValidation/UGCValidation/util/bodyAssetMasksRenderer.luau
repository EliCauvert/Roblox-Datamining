local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local tryYieldModule = require(parent.util.tryYield)
local getEditableMeshFromContextModule = require(parent.util.getEditableMeshFromContext)
local getAssetMeshesValidationSpaceTransforms = require(parent.util.AssetCalculator).getAssetMeshesValidationSpaceTransforms
local assetService = game:GetService("AssetService")
local getFIntUGCValidationBodyAssetMaskHeightPixelsModule = require(parent.flags.getFIntUGCValidationBodyAssetMaskHeightPixels)
local getFFlagUGCValidateTinyTrianglesIntersectFixModule = require(parent.flags.getFFlagUGCValidateTinyTrianglesIntersectFix)
local t = {}
t.__index = t
t.viewIds = {
	Front = "Front",
	Back = "Back",
	Left = "Left",
	Right = "Right",
	Top = "Top",
	Bottom = "Bottom"
}

if getFFlagUGCValidateTinyTrianglesIntersectFixModule() then
	t.opposingViewIds = {
		Front = t.viewIds.Back,
		Back = t.viewIds.Front,
		Left = t.viewIds.Right,
		Right = t.viewIds.Left,
		Top = t.viewIds.Bottom,
		Bottom = t.viewIds.Top
	}
end
t.viewDirections = {
	[t.viewIds.Front] = Vector3.new(0, 0, 1),
	[t.viewIds.Back] = Vector3.new(0, 0, -1),
	[t.viewIds.Left] = Vector3.new(-1, 0, 0),
	[t.viewIds.Right] = Vector3.new(1, 0, 0),
	[t.viewIds.Top] = Vector3.new(0, -1, 0),
	[t.viewIds.Bottom] = Vector3.new(0, 1, 0)
}
t.views = nil

function t.getViewToWorldTransforms()
	-- upvalues: t (ref)
	if not t.views then
		t.views = {}
		
		for i, v in t.viewIds do
			local var13 = t.viewDirections[v]
			local var14 = Vector3.new(0, 1, 0)
			
			if math.abs(var13:Dot(var14)) > 0.99 then
				var14 = t.viewDirections[t.viewIds.Front]
			end
			t.views[v] = CFrame.lookAlong(Vector3.new(0, 0, 0), var13, var14)
		end
	end
	return t.views
end

function t.getViewSpacePositionFromNormalized(p0, p1)
	local var15 = (p0 - Vector2.new(0.5, 0.5)) * Vector2.new(2, -2)
	local var16 = (p1.max - p1.min) / 2
	
	return p1.min + var16 + var16 * Vector3.new(var15.X, var15.Y, 0)
end

local function populateViewsToRender(p2)
	-- upvalues: t (ref)
	local viewToWorldTransforms = t.getViewToWorldTransforms()
	local t_1 = {}
	
	if not p2 then
		return viewToWorldTransforms
	end
	for i, v in p2 do
		if v and viewToWorldTransforms[i] then
			t_1[i] = viewToWorldTransforms[i]
		end
	end
	return t_1
end

local function addTransformedTriangle(vectorA, vectorB, p3, p4)
	local var19 = vectorA:GetFaceVertices(vectorB)
	local t = {}
	
	for i = 1, 3 do
		table.insert(t, p3.CFrame * (vectorA:GetPosition(var19[i]) * p3.scale))
	end
	table.insert(p4, t)
end

local function pushTransformedMesh(p5, p6, p7, p8)
	-- upvalues: addTransformedTriangle (ref), tryYieldModule (ref)
	for i, v in p5:GetFaces() do
		addTransformedTriangle(p5, v, p6, p8)
		tryYieldModule(p7)
	end
end

local function getViewSpaceMesh(p9, p10)
	local var21 = p10:Inverse()
	local t = {
		min = Vector3.new(1e999, 1e999, 1e999),
		max = Vector3.new(-1e999, -1e999, -1e999)
	}
	local t_1 = {}
	
	for i, v in p9 do
		local t_2 = {}
		
		for i_1, v_1 in v do
			local var25 = var21 * v_1
			table.insert(t_2, var21 * v_1)
			t.min = t.min:Min(var25)
			t.max = t.max:Max(var25)
		end
		table.insert(t_1, t_2)
	end
	return t_1, t
end

local function _(p11, p12, p13)
	local t = {}
	
	for i, v in p11 do
		table.insert(t, (v - p12) / p13)
	end
	return t
end

local _ = function(vectorA)
	return (vectorA[2] - vectorA[1]):Cross(vectorA[3] - vectorA[1]).Z > 0.001
end

local function normalizedSpaceToScreenSpace(p14, p15)
	return (Vector2.new(p14.X, p14.Y) * Vector2.new(0.5, -0.5) + Vector2.new(0.5, 0.5)) * (p15 - Vector2.new(1, 1))
end

local function rasterMesh(p16, p17, p18, p19)
	-- upvalues: assetService (ref), normalizedSpaceToScreenSpace (ref), tryYieldModule (ref)
	local var27 = p17.max - p17.min
	local var28 = var27 / 2
	local var29 = p17.min + var28
	local vector2 = Vector2.new(var27.X / var27.Y * p18, p18)
	local var31 = (vector2 * math.min(1024 / math.max(vector2.X, vector2.Y), 1) + Vector2.new(0.5)):Floor()
	var31 = assetService:CreateEditableImage({ Size = var31 })
	
	for i, v in p16 do
		local t = {}
		
		for i_1, v_1 in v do
			table.insert(t, (v_1 - var29) / var28)
		end
		local var33 = t
		
		if (var33[2] - var33[1]):Cross(var33[3] - var33[1]).Z > 0.001 then
			local t_1 = {}
			
			for i_1, v_1 in var33 do
				table.insert(t_1, normalizedSpaceToScreenSpace(v_1, var31))
			end
			var31:DrawTriangle(t_1[1], t_1[2], t_1[3], Color3.new(1, 1, 1), 0)
			tryYieldModule(p19)
		end
	end
	return var31
end

local function createBodyAssetMasks(value, p20, p21)
	-- upvalues: getAssetMeshesValidationSpaceTransforms (ref), getEditableMeshFromContextModule (ref), pushTransformedMesh (ref), getViewSpaceMesh (ref), getFIntUGCValidationBodyAssetMaskHeightPixelsModule (ref), rasterMesh (ref)
	local assetTypeEnum = p21.assetTypeEnum
	local t = {}
	
	if value:IsA("MeshPart") and p21.assetTypeEnum == Enum.AssetType.DynamicHead then
		table.insert(t, value)
	else
		for i, v in value:GetChildren() do
			if v:IsA("MeshPart") then
				table.insert(t, v)
			end
		end
	end
	local var36 = getAssetMeshesValidationSpaceTransforms(value, p21)
	local t_1 = {}
	
	for i, v in t do
		local var41, var42 = getEditableMeshFromContextModule(v, "MeshId", p21)
		
		if not var41 then
			local formattedText = string.format("Failed to load mesh for MeshPart '%s'. Make sure mesh exists and try again.", v.Name)
			
			if p21.isServer then
				error(formattedText)
			end
			return false, { formattedText }
		end
		var42:Triangulate()
		pushTransformedMesh(var42, var36[v.Name], p21, t_1)
	end
	if #t_1 == 0 then
		return false, {
			string.format("Mesh for %s has no triangles.", assetTypeEnum.Name)
		}
	end
	local t_2 = {}
	
	for i_1, v_1 in p20 do
		local var39, var40 = getViewSpaceMesh(t_1, v_1)
		t_2[i_1] = {
			viewId = i_1,
			mask = rasterMesh(var39, var40, getFIntUGCValidationBodyAssetMaskHeightPixelsModule(), p21),
			view = v_1,
			viewSpaceBounds = var40
		}
	end
	return true, t_2
end

function t.new(p22, p23, p24)
	-- upvalues: t (ref), populateViewsToRender (ref), createBodyAssetMasks (ref)
	local tbl = setmetatable({}, t)
	local var45, var46 = createBodyAssetMasks(p22, populateViewsToRender(p23), p24)
	
	if var45 then
		tbl.bodyAssetMasks = var46
		
		return true, tbl
	end
	return false, var46
end

function t:destroyBodyAssetMasks()
	for i, v in self.bodyAssetMasks do
		if v.mask then
			v.mask:Destroy()
			v.mask = nil
		end
	end
end

return t