return function(Camera: Camera, World, Vector)
	local v1 = Camera:ScreenPointToRay(Vector.X, Vector.Y)
	local List = {}
	local Terrain = World:FindFirstChildWhichIsA("Terrain")
	
	if Terrain ~= nil then
		table.insert(List, Terrain)
	end
	local RaycastParams1 = RaycastParams.new()
	RaycastParams1.FilterType = Enum.RaycastFilterType.Exclude
	RaycastParams1.BruteForceAllSlow = true
	local RaycastResult = nil
	
	for _ = 1, 50 do
		RaycastParams1.FilterDescendantsInstances = List
		RaycastResult = World:Raycast(v1.Origin, v1.Direction * 1000, RaycastParams1)
		
		if RaycastResult == nil then
			return nil
		end
		local Hit = RaycastResult.Instance
		
		if Hit:IsA("BasePart") and Hit.Transparency < 1 then
			return RaycastResult
		end
		table.insert(List, Hit)
	end
	return nil
end