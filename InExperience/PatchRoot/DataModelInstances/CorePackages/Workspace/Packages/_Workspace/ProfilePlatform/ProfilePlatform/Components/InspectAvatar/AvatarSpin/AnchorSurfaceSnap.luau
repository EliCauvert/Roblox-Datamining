local _ = require(script.Parent.ItemAnchors)

local function _(Vector)
	local Direction = Vector:Cross(if math.abs(Vector.Y) < 0.9 then vector.create(0, 1, 0) else vector.create(1, 0, 0)).Unit
	
	return Direction, Vector:Cross(Direction).Unit
end

local function medoid(Entry)
	local Entry1 = Entry[1]
	local v1 = 1e999
	
	for _, value in Entry do
		local NewMagnitude = 0
		
		for _, value1 in Entry do
			NewMagnitude += (value - value1).Magnitude
		end
		if NewMagnitude < v1 then
			Entry1 = value
			v1 = NewMagnitude
		end
	end
	return Entry1
end

local _ = function(p1): boolean
	local Part = p1.part
	
	return Part:IsDescendantOf(p1.target) and Part:FindFirstChildWhichIsA("SpecialMesh") == nil
end

local AnchorSurfaceSnapModule = {
	snapAnchor = function(World, Tbl, CF, p1)
		-- upvalues: medoid (copy)
		local Part = Tbl.part
		
		if not Part:IsDescendantOf(Tbl.target) or Part:FindFirstChildWhichIsA("SpecialMesh") ~= nil then
			return Tbl
		end
		local Part1 = Tbl.part
		local v2 = Part1.CFrame:PointToWorldSpace(Tbl.offset)
		local Normal = Tbl.normal
		local Direction = if Normal then CF:VectorToWorldSpace(Normal) else p1 - v2
		
		if Direction.Magnitude < 0.000001 then
			return Tbl
		end
		local Direction1: number = Direction.Unit
		local Direction2 = Direction1:Cross(if math.abs(Direction1.Y) < 0.9 then vector.create(0, 1, 0) else vector.create(1, 0, 0)).Unit
		local Direction21 = Direction1:Cross(Direction2).Unit
		local MagnitudeRatio = Part1.Size.Magnitude / 2
		local RaycastParams1 = RaycastParams.new()
		RaycastParams1.FilterType = Enum.RaycastFilterType.Include
		RaycastParams1.FilterDescendantsInstances = { Tbl.target }
		local List = {}
		
		for i = 0, 6 do
			for i1 = 0, 6 do
				local RaycastResult = World:Raycast(v2 + Direction1 * (MagnitudeRatio * 2) + Direction2 * ((i / 6 * 2 - 1) * MagnitudeRatio) + Direction21 * ((i1 / 6 * 2 - 1) * MagnitudeRatio), -Direction1 * (MagnitudeRatio * 4), RaycastParams1)
				
				if RaycastResult then
					table.insert(List, RaycastResult.Position)
				end
			end
		end
		if #List == 0 then
			return Tbl
		else
			local Copy = table.clone(Tbl)
			Copy.offset = Part1.CFrame:PointToObjectSpace(medoid(List) + Direction1 * 0.02)
			
			return Copy
		end
	end
}

function AnchorSurfaceSnapModule.snap(World, List, CF, p2)
	-- upvalues: AnchorSurfaceSnapModule (copy)
	local List1 = {}
	
	for _, value in List do
		local Anchors = {}
		
		for _, anchor in value.anchors do
			table.insert(Anchors, AnchorSurfaceSnapModule.snapAnchor(World, anchor, CF, p2))
		end
		table.insert(List1, { itemId = value.itemId, anchors = Anchors })
	end
	return List1
end

return AnchorSurfaceSnapModule