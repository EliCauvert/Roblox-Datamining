local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local TryYieldModule = require(Parent.util.tryYield)
local GetEditableMeshFromContextModule = require(Parent.util.getEditableMeshFromContext)
local GetAssetMeshesValidationSpaceTransformsFunction = require(Parent.util.AssetCalculator).getAssetMeshesValidationSpaceTransforms
local AssetService = game:GetService("AssetService")
local GetFIntUGCValidationBodyAssetMaskHeightPixelsModule = require(Parent.flags.getFIntUGCValidationBodyAssetMaskHeightPixels)
local GetFFlagUGCValidateTinyTrianglesIntersectFixModule = require(Parent.flags.getFFlagUGCValidateTinyTrianglesIntersectFix)
local BodyAssetMasksRendererModule = {}
BodyAssetMasksRendererModule.__index = BodyAssetMasksRendererModule
BodyAssetMasksRendererModule.viewIds = {
	Front = "Front",
	Back = "Back",
	Left = "Left",
	Right = "Right",
	Top = "Top",
	Bottom = "Bottom"
}

if GetFFlagUGCValidateTinyTrianglesIntersectFixModule() then
	BodyAssetMasksRendererModule.opposingViewIds = {
		Front = BodyAssetMasksRendererModule.viewIds.Back,
		Back = BodyAssetMasksRendererModule.viewIds.Front,
		Left = BodyAssetMasksRendererModule.viewIds.Right,
		Right = BodyAssetMasksRendererModule.viewIds.Left,
		Top = BodyAssetMasksRendererModule.viewIds.Bottom,
		Bottom = BodyAssetMasksRendererModule.viewIds.Top
	}
end
BodyAssetMasksRendererModule.viewDirections = {
	[BodyAssetMasksRendererModule.viewIds.Front] = vector.create(0, 0, 1),
	[BodyAssetMasksRendererModule.viewIds.Back] = vector.create(0, 0, -1),
	[BodyAssetMasksRendererModule.viewIds.Left] = vector.create(-1, 0, 0),
	[BodyAssetMasksRendererModule.viewIds.Right] = vector.create(1, 0, 0),
	[BodyAssetMasksRendererModule.viewIds.Top] = vector.create(0, -1, 0),
	[BodyAssetMasksRendererModule.viewIds.Bottom] = vector.create(0, 1, 0)
}
BodyAssetMasksRendererModule.views = nil

function BodyAssetMasksRendererModule.getViewToWorldTransforms()
	-- upvalues: BodyAssetMasksRendererModule (copy)
	if not BodyAssetMasksRendererModule.views then
		BodyAssetMasksRendererModule.views = {}
		
		for _, viewId in BodyAssetMasksRendererModule.viewIds do
			local ViewDirection = BodyAssetMasksRendererModule.viewDirections[viewId]
			local ViewDirection1 = vector.create(0, 1, 0)
			
			if math.abs((ViewDirection:Dot(ViewDirection1))) > 0.99 then
				ViewDirection1 = BodyAssetMasksRendererModule.viewDirections[BodyAssetMasksRendererModule.viewIds.Front]
			end
			BodyAssetMasksRendererModule.views[viewId] = CFrame.lookAlong(vector.create(0, 0, 0), ViewDirection, ViewDirection1)
		end
	end
	return BodyAssetMasksRendererModule.views
end

function BodyAssetMasksRendererModule.getViewSpacePositionFromNormalized(p1, p2): Vector3
	local ScaledVector = (p1 - Vector2.new(0.5, 0.5)) * Vector2.new(2, -2)
	local MaxRatio = (p2.max - p2.min) / 2
	
	return p2.min + MaxRatio + MaxRatio * Vector3.new(ScaledVector.X, ScaledVector.Y, 0)
end

local function populateViewsToRender(List)
	-- upvalues: BodyAssetMasksRendererModule (copy)
	local ViewToWorldTransforms = BodyAssetMasksRendererModule.getViewToWorldTransforms()
	local t = {}
	
	if not List then
		return ViewToWorldTransforms
	end
	for i, value in List do
		if value and ViewToWorldTransforms[i] then
			t[i] = ViewToWorldTransforms[i]
		end
	end
	return t
end

local function addTransformedTriangle(EditableMesh, FaceId, p1, List)
	local FaceVertices = EditableMesh:GetFaceVertices(FaceId)
	local List1 = {}
	
	for i = 1, 3 do
		table.insert(List1, p1.CFrame * (EditableMesh:GetPosition(FaceVertices[i]) * p1.scale))
	end
	table.insert(List, List1)
end

local function pushTransformedMesh(EditableMesh, p2, p3, p4)
	-- upvalues: addTransformedTriangle (copy), TryYieldModule (copy)
	for _, face in EditableMesh:GetFaces() do
		addTransformedTriangle(EditableMesh, face, p2, p4)
		TryYieldModule(p3)
	end
end

local function getViewSpaceMesh(List, View)
	local Inverted = View:Inverse()
	local config = {
		min = vector.create(1e999, 1e999, 1e999),
		max = vector.create(-1e999, -1e999, -1e999)
	}
	local List1 = {}
	
	for _, value in List do
		local List2 = {}
		
		for _, value1 in value do
			local ScaledInverted = Inverted * value1
			table.insert(List2, Inverted * value1)
			config.min = config.min:Min(ScaledInverted)
			config.max = config.max:Max(ScaledInverted)
		end
		table.insert(List1, List2)
	end
	return List1, config
end

local function _(List, p5, p6)
	local List1 = {}
	
	for _, value in List do
		table.insert(List1, (value - p5) / p6)
	end
	return List1
end

local _ = function(Entry): boolean
	return (Entry[2] - Entry[1]):Cross(Entry[3] - Entry[1]).Z > 0.001
end

local function normalizedSpaceToScreenSpace(Vector, FloorResult): Vector2
	return (Vector2.new(Vector.X, Vector.Y) * Vector2.new(0.5, -0.5) + Vector2.new(0.5, 0.5)) * (FloorResult - Vector2.new(1, 1))
end

local function rasterMesh(List, ViewSpaceBounds, Y, p7)
	-- upvalues: AssetService (copy), normalizedSpaceToScreenSpace (copy), TryYieldModule (copy)
	local MaxDelta = ViewSpaceBounds.max - ViewSpaceBounds.min
	local MaxDeltaRatio = MaxDelta / 2
	local NewMin = ViewSpaceBounds.min + MaxDeltaRatio
	local _Vector2 = Vector2.new(MaxDelta.X / MaxDelta.Y * Y, Y)
	local FloorResult = (_Vector2 * math.min(1024 / math.max(_Vector2.X, _Vector2.Y), 1) + Vector2.new(0.5)):Floor()
	local EditableImage = AssetService:CreateEditableImage({ Size = FloorResult })
	
	for _, value in List do
		local List1 = {}
		
		for _, value1 in value do
			table.insert(List1, (value1 - NewMin) / MaxDeltaRatio)
		end
		if (List1[2] - List1[1]):Cross(List1[3] - List1[1]).Z > 0.001 then
			local List2 = {}
			
			for _, value2 in List1 do
				table.insert(List2, (normalizedSpaceToScreenSpace(value2, FloorResult)))
			end
			EditableImage:DrawTriangle(List2[1], List2[2], List2[3], Color3.new(1, 1, 1), 0)
			TryYieldModule(p7)
		end
	end
	return EditableImage
end

local function createBodyAssetMasks(Part: Part, List, p8)
	-- upvalues: GetAssetMeshesValidationSpaceTransformsFunction (copy), GetEditableMeshFromContextModule (copy), pushTransformedMesh (copy), getViewSpaceMesh (copy), GetFIntUGCValidationBodyAssetMaskHeightPixelsModule (copy), rasterMesh (copy)
	local AssetTypeEnum = p8.assetTypeEnum
	local List1 = {}
	
	if Part:IsA("MeshPart") and p8.assetTypeEnum == Enum.AssetType.DynamicHead then
		table.insert(List1, Part)
	else
		for _, Part1 in Part:GetChildren() do
			if Part1:IsA("MeshPart") then
				table.insert(List1, Part1)
			end
		end
	end
	local AssetMeshesValidationSpaceTransforms = GetAssetMeshesValidationSpaceTransformsFunction(Part, p8)
	local t = {}
	local Formatted = nil
	
	for _, value in List1 do
		local MeshId, MeshId2 = GetEditableMeshFromContextModule(value, "MeshId", p8)
		
		if not MeshId then
			Formatted = string.format("Failed to load mesh for MeshPart '%s'. Make sure mesh exists and try again.", value.Name)
			
			if not p8.isServer then
				return false, { Formatted }
			end
			error(Formatted)
		end
		MeshId2:Triangulate()
		pushTransformedMesh(MeshId2, AssetMeshesValidationSpaceTransforms[value.Name], p8, t)
	end
	if #t == 0 then
		return false, {
			string.format("Mesh for %s has no triangles.", AssetTypeEnum.Name)
		}
	end
	local t1 = {}
	
	for ViewId, View in List do
		local ViewSpaceMesh, ViewSpaceMesh2 = getViewSpaceMesh(t, View)
		t1[ViewId] = {
			viewId = ViewId,
			mask = rasterMesh(ViewSpaceMesh, ViewSpaceMesh2, GetFIntUGCValidationBodyAssetMaskHeightPixelsModule(), p8),
			view = View,
			viewSpaceBounds = ViewSpaceMesh2
		}
	end
	return true, t1
end

function BodyAssetMasksRendererModule.new(Part, p9, p10)
	-- upvalues: BodyAssetMasksRendererModule (copy), populateViewsToRender (copy), createBodyAssetMasks (copy)
	local self = setmetatable({}, BodyAssetMasksRendererModule)
	local BodyAssetMasks, BodyAssetMasks2 = createBodyAssetMasks(Part, populateViewsToRender(p9), p10)
	
	if BodyAssetMasks then
		self.bodyAssetMasks = BodyAssetMasks2
		
		return true, self
	else
		return false, BodyAssetMasks2
	end
end

function BodyAssetMasksRendererModule.destroyBodyAssetMasks(p9)
	for _, bodyAssetMask in p9.bodyAssetMasks do
		if bodyAssetMask.mask then
			bodyAssetMask.mask:Destroy()
			bodyAssetMask.mask = nil
		end
	end
end

return BodyAssetMasksRendererModule