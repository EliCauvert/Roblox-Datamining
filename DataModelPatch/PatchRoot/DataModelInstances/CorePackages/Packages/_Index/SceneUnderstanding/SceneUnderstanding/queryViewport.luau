local ViewportQueryOptionsModule = require(script:FindFirstAncestor("SceneUnderstanding").options.ViewportQueryOptions)

return function(Camera: Camera, Callback, p1)
	-- upvalues: ViewportQueryOptionsModule (copy)
	local NewViewportQueryOptions = ViewportQueryOptionsModule.new(p1)
	local Total = 0
	local Amount = 1
	local Total1 = 0
	local Amount1 = 0
	local Count = 1
	local Count1 = 0
	local MaxScreenDivisions: number = NewViewportQueryOptions.maxScreenDivisions
	local CeiledDelta = math.ceil(MaxScreenDivisions / 2) - 1
	local List = {}
	
	for _ = 1, MaxScreenDivisions * MaxScreenDivisions do
		local _Vector2 = Vector2.new((Total + 0.5 + CeiledDelta) * (Camera.ViewportSize.X / MaxScreenDivisions), (Total1 + 0.5 + CeiledDelta) * (Camera.ViewportSize.Y / MaxScreenDivisions))
		local v1 = Camera:ScreenPointToRay(_Vector2.X, _Vector2.Y)
		local RaycastResult = workspace:Raycast(v1.Origin, v1.Direction * NewViewportQueryOptions.maxDistance, NewViewportQueryOptions.raycastParams)
		
		if RaycastResult and RaycastResult.Instance and not table.find(List, RaycastResult.Instance) and Callback(RaycastResult.Instance) then
			table.insert(List, RaycastResult.Instance)
			
			if NewViewportQueryOptions.limit <= #List then
				return List
			end
		end
		Total += Amount
		Total1 += Amount1
		Count1 += 1
		
		if Count1 == Count then
			Count1 = 0
			local Amount2: number = Amount
			Amount = -Amount1
			Amount1 = Amount2
			
			if Amount1 == 0 then
				Count += 1
			end
		end
	end
	return List
end