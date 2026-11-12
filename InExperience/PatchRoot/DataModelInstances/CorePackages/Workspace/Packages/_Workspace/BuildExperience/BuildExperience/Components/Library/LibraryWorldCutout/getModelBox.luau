return function(Model: Model)
	local BoundingCFrame, BoundingSize = Model:GetBoundingBox()
	
	if BoundingSize == vector.create(0, 0, 0) then
		return nil
	end
	local MinResult = nil
	local MaxResult = nil
	
	for X = -1, 1, 2 do
		for Y = -1, 1, 2 do
			for Z = -1, 1, 2 do
				local v1 = BoundingCFrame:PointToWorldSpace(BoundingSize * Vector3.new(X, Y, Z) / 2)
				
				if MinResult == nil then
					MinResult = v1
				else
					MinResult = MinResult:Min(v1)
				end
				if MaxResult == nil then
					MaxResult = v1
				else
					MaxResult = MaxResult:Max(v1)
				end
			end
		end
	end
	return {
		center = BoundingCFrame.Position,
		minimum = MinResult,
		maximum = MaxResult
	}
end