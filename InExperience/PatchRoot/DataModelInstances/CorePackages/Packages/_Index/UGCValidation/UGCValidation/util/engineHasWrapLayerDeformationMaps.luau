return function()
	local WrapLayer = Instance.new("WrapLayer")
	local Success = pcall(function()
		-- upvalues: WrapLayer (copy)
		return WrapLayer.RotateScaleDeformationMap
	end)
	WrapLayer:Destroy()
	
	return Success
end