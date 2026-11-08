local ViewportProjectionModule = {
	worldToViewport = function(CF, Degrees: number, Vector, p1)
		local Vector1 = CF:PointToObjectSpace(p1)
		local Negated = -Vector1.Z
		
		if Negated <= 0.001 or Vector.X <= 0 or Vector.Y <= 0 then
			return Vector2.zero, (math.min(Negated, 0))
		else
			local Tangent = math.tan(math.rad(Degrees) / 2)
			
			return Vector2.new((Vector1.X / Negated / (Tangent * Vector.X / Vector.Y) + 1) * 0.5 * Vector.X, (1 - Vector1.Y / Negated / Tangent) * 0.5 * Vector.Y), Negated
		end
	end,
	viewportToRay = function(CF, Degrees: number, Vector, Vector1)
		if Vector.X <= 0 or Vector.Y <= 0 then
			return CF.LookVector
		else
			local Tangent = math.tan(math.rad(Degrees) / 2)
			
			return CF:VectorToWorldSpace((Vector3.new((Vector1.X / Vector.X * 2 - 1) * (Tangent * Vector.X / Vector.Y), (1 - Vector1.Y / Vector.Y * 2) * Tangent, -1))).Unit
		end
	end,
	isInsideViewport = function(Vector, Vector1, p1): boolean
		return -p1 <= Vector.X and (-p1 <= Vector.Y and Vector.X <= Vector1.X + p1) and Vector.Y <= Vector1.Y + p1
	end
}

function ViewportProjectionModule.projectBounds(Model: Model, p1)
	-- upvalues: ViewportProjectionModule (copy)
	local BoundingCFrame, BoundingSize = Model:GetBoundingBox()
	local Smallest = 1e999
	local Smallest1 = 1e999
	local Largest = -1e999
	local Largest1 = -1e999
	
	for _, value in { -0.5, 0.5 } do
		for _, value1 in { -0.5, 0.5 } do
			for _, value2 in { -0.5, 0.5 } do
				local WorldToViewportResult, WorldToViewportResult2 = ViewportProjectionModule.worldToViewport(p1.cameraCFrame, p1.fieldOfView, p1.viewportSize, (BoundingCFrame:PointToWorldSpace((Vector3.new(value * BoundingSize.X, value1 * BoundingSize.Y, value2 * BoundingSize.Z)))))
				
				if WorldToViewportResult2 > 0 then
					Smallest = math.min(Smallest, WorldToViewportResult.X)
					Smallest1 = math.min(Smallest1, WorldToViewportResult.Y)
					Largest = math.max(Largest, WorldToViewportResult.X)
					Largest1 = math.max(Largest1, WorldToViewportResult.Y)
				end
			end
		end
	end
	return if Smallest == 1e999 then nil else {
		x = Smallest,
		y = Smallest1,
		width = Largest - Smallest,
		height = Largest1 - Smallest1
	}
end

return ViewportProjectionModule