return function(Parent): number
	local ScaledScale = 1
	local Parent1 = Parent
	while Parent1 ~= nil and not Parent1:IsA("LayerCollector") do
		local UIScale = Parent1:FindFirstChildWhichIsA("UIScale")
		
		if UIScale ~= nil then
			ScaledScale *= UIScale.Scale
		end
		Parent1 = Parent1.Parent
	end
	return ScaledScale
end