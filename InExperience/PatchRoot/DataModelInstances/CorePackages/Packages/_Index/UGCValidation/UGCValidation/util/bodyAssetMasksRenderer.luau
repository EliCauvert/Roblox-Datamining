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
			local var1 = t.viewDirections[v]
			local var2 = Vector3.new(0, 1, 0)
			
			if math.abs(var1:Dot(var2)) > 0.99 then
				var2 = t.viewDirections[t.viewIds.Front]
			end
			t.views[v] = CFrame.lookAlong(Vector3.new(0, 0, 0), var1, var2)
		end
	end
	return t.views
end

function t.getViewSpacePositionFromNormalized(p1, p2)
	local var3 = (p1 - Vector2.new(0.5, 0.5)) * Vector2.new(2, -2)
	local var4 = (p2.max - p2.min) / 2
	
	return p2.min + var4 + var4 * Vector3.new(var3.X, var3.Y, 0)
end

local function populateViewsToRender(p1)
	-- upvalues: t (ref)
	local viewToWorldTransforms = t.getViewToWorldTransforms()
	local t_1 = {}
	
	if not p1 then
		return viewToWorldTransforms
	end
	for i, v in p1 do
		if v and viewToWorldTransforms[i] then
			t_1[i] = viewToWorldTransforms[i]
		end
	end
	return t_1
end

local function addTransformedTriangle(vectorA, vectorB, p2, p3)
	local var3 = vectorA:GetFaceVertices(vectorB)
	local t = {}
	
	for i = 1, 3 do
		table.insert(t, p2.CFrame * (vectorA:GetPosition(var3[i]) * p2.scale))
	end
	table.insert(p3, t)
end

local function pushTransformedMesh(p4, p5, p6, p7)
	-- upvalues: addTransformedTriangle (ref), tryYieldModule (ref)
	for i, v in p4:GetFaces() do
		addTransformedTriangle(p4, v, p5, p7)
		tryYieldModule(p6)
	end
end

local function getViewSpaceMesh(p8, p9)
	local var4 = p9:Inverse()
	local t = {
		min = Vector3.new(1e999, 1e999, 1e999),
		max = Vector3.new(-1e999, -1e999, -1e999)
	}
	local t_1 = {}
	
	for i, v in p8 do
		local t_2 = {}
		
		for i_1, v_1 in v do
			local var5 = var4 * v_1
			table.insert(t_2, var4 * v_1)
			t.min = t.min:Min(var5)
			t.max = t.max:Max(var5)
		end
		table.insert(t_1, t_2)
	end
	return t_1, t
end

local function _(p10, p11, p12)
	local t = {}
	
	for i, v in p10 do
		table.insert(t, (v - p11) / p12)
	end
	return t
end

local _ = function(vectorA)
	return (vectorA[2] - vectorA[1]):Cross(vectorA[3] - vectorA[1]).Z > 0.001
end

local function normalizedSpaceToScreenSpace(p13, p14)
	return (Vector2.new(p13.X, p13.Y) * Vector2.new(0.5, -0.5) + Vector2.new(0.5, 0.5)) * (p14 - Vector2.new(1, 1))
end

local function rasterMesh(p13, p14, p15, p16)
	-- upvalues: assetService (ref), normalizedSpaceToScreenSpace (ref), tryYieldModule (ref)
	local var6 = p14.max - p14.min
	local var7 = var6 / 2
	local var8 = p14.min + var7
	local vector2 = Vector2.new(var6.X / var6.Y * p15, p15)
	local var9 = (vector2 * math.min(1024 / math.max(vector2.X, vector2.Y), 1) + Vector2.new(0.5)):Floor()
	var9 = assetService:CreateEditableImage({ Size = var9 })
	
	for i, v in p13 do
		local t = {}
		
		for i_1, v_1 in v do
			table.insert(t, (v_1 - var8) / var7)
		end
		local var10 = t
		
		if (var10[2] - var10[1]):Cross(var10[3] - var10[1]).Z > 0.001 then
			local t_1 = {}
			
			for i_1, v_1 in var10 do
				table.insert(t_1, normalizedSpaceToScreenSpace(v_1, var9))
			end
			var9:DrawTriangle(t_1[1], t_1[2], t_1[3], Color3.new(1, 1, 1), 0)
			tryYieldModule(p16)
		end
	end
	return var9
end

local function createBodyAssetMasks(value, p17, p18)
	-- upvalues: getAssetMeshesValidationSpaceTransforms (ref), getEditableMeshFromContextModule (ref), pushTransformedMesh (ref), getViewSpaceMesh (ref), getFIntUGCValidationBodyAssetMaskHeightPixelsModule (ref), rasterMesh (ref)
	local assetTypeEnum = p18.assetTypeEnum
	local t = {}
	
	if value:IsA("MeshPart") and p18.assetTypeEnum == Enum.AssetType.DynamicHead then
		table.insert(t, value)
	else
		for i, v in value:GetChildren() do
			if v:IsA("MeshPart") then
				table.insert(t, v)
			end
		end
	end
	local var11 = getAssetMeshesValidationSpaceTransforms(value, p18)
	local t_1 = {}
	
	for i, v in t do
		local var12, var13 = getEditableMeshFromContextModule(v, "MeshId", p18)
		
		if not var12 then
			local formattedText = string.format("Failed to load mesh for MeshPart '%s'. Make sure mesh exists and try again.", v.Name)
			
			if p18.isServer then
				error(formattedText)
			end
			return false, { formattedText }
		end
		var13:Triangulate()
		pushTransformedMesh(var13, var11[v.Name], p18, t_1)
	end
	if #t_1 == 0 then
		return false, {
			string.format("Mesh for %s has no triangles.", assetTypeEnum.Name)
		}
	end
	local t_2 = {}
	
	for i_1, v_1 in p17 do
		local var14, var15 = getViewSpaceMesh(t_1, v_1)
		t_2[i_1] = {
			viewId = i_1,
			mask = rasterMesh(var14, var15, getFIntUGCValidationBodyAssetMaskHeightPixelsModule(), p18),
			view = v_1,
			viewSpaceBounds = var15
		}
	end
	return true, t_2
end

function t.new(p19, p20, p21)
	-- upvalues: t (ref), populateViewsToRender (ref), createBodyAssetMasks (ref)
	local tbl = setmetatable({}, t)
	local var16, var17 = createBodyAssetMasks(p19, populateViewsToRender(p20), p21)
	
	if var16 then
		tbl.bodyAssetMasks = var17
		
		return true, tbl
	end
	return false, var17
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