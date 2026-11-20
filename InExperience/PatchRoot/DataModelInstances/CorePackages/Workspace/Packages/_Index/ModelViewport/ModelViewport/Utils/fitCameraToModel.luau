local CameraMathModule = require(script:FindFirstAncestor("ModelViewport").CameraMath)

return function(Model: Model, p1)
	-- upvalues: CameraMathModule (copy)
	local BoundingCFrame, BoundingSize = Model:GetBoundingBox()
	
	return CameraMathModule.fitCameraToBounds(BoundingCFrame, BoundingSize, p1)
end