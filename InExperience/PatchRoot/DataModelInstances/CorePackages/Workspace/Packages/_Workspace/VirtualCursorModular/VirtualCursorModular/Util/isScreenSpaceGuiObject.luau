return function(p1)
	local LayerCollector = p1:FindFirstAncestorWhichIsA("LayerCollector")
	
	return LayerCollector ~= nil and LayerCollector:IsA("ScreenGui")
end