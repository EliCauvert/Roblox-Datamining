local TweenService = game:GetService("TweenService")

local function _(p1, p2, p3)
	return p1 + (p2 - p1) * p3
end

return function(p1, p2, p3, EasingStyle, EasingDirection)
	-- upvalues: TweenService (copy)
	local List = {}
	
	for i = 0, p3 do
		local IRatio = i / p3
		table.insert(List, (NumberSequenceKeypoint.new(IRatio, p1 + (p2 - p1) * TweenService:GetValue(IRatio, EasingStyle, EasingDirection))))
	end
	return List
end