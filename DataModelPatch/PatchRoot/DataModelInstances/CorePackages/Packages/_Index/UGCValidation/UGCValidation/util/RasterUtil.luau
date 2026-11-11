local AssetService = game:GetService("AssetService")
local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local TryYieldModule = require(Parent.util.tryYield)

local function _(Vector, Vector1, p1): Vector2
	return Vector2.new(Vector:Dot(p1), (Vector1:Dot(p1)))
end

local _ = function(Vector, p1): boolean
	return Vector:Dot(p1) < 0
end

local function getScreenCoordinatesForTriangle(Entry, Size, p1, X, p2: number)
	local v1 = p2 / 2
	local InvertedRatio = (CFrame.new(X):Inverse() * Entry[1] + v1) / p2
	local InvertedRatio1 = (CFrame.new(X):Inverse() * Entry[2] + v1) / p2
	local InvertedRatio2 = (CFrame.new(X):Inverse() * Entry[3] + v1) / p2
	
	return Vector2.new(p1.axis1:Dot(InvertedRatio), (p1.axis2:Dot(InvertedRatio))) * (Size - Vector2.new(1, 1)), Vector2.new(p1.axis1:Dot(InvertedRatio1), (p1.axis2:Dot(InvertedRatio1))) * (Size - Vector2.new(1, 1)), Vector2.new(p1.axis1:Dot(InvertedRatio2), (p1.axis2:Dot(InvertedRatio2))) * (Size - Vector2.new(1, 1))
end

return {
	shouldRenderTriangle_UNIT_TEST = function(Vector, p1): boolean
		return Vector:Dot(p1) < 0
	end,
	rasterMesh = function(List, Size, p1, X, p2, p3)
		-- upvalues: AssetService (copy), getScreenCoordinatesForTriangle (copy), TryYieldModule (copy)
		local EditableImage = AssetService:CreateEditableImage({ Size = Size })
		
		for _, value in List do
			if value.normal:Dot(p1.normal) < 0 then
				local ScreenCoordinatesForTriangle, ScreenCoordinatesForTriangle2, ScreenCoordinatesForTriangle3 = getScreenCoordinatesForTriangle(value.orderedVerts, EditableImage.Size, p1, X, p2)
				EditableImage:DrawTriangle(ScreenCoordinatesForTriangle, ScreenCoordinatesForTriangle2, ScreenCoordinatesForTriangle3, Color3.new(1, 1, 1), 0)
				TryYieldModule(p3)
			end
		end
		return EditableImage
	end
}