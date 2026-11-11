return function(p1)
	local Parent = p1.Parent
	while Parent and Parent ~= game do
		if Parent:IsA("ScrollingFrame") then
			return Parent
		end
		Parent = Parent.Parent
	end
	return nil
end