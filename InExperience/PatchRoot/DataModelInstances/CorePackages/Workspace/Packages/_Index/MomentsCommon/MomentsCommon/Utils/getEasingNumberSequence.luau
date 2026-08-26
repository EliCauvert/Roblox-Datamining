local tweenService = game:GetService("TweenService")

local function _(p1, p2, p3)
	return p1 + (p2 - p1) * p3
end

return function(p1, p2, p3, p4, p5)
	-- upvalues: tweenService (ref)
	local t = {}
	
	for i = 0, p3 do
		local var1 = i / p3
		table.insert(t, NumberSequenceKeypoint.new(var1, p1 + (p2 - p1) * tweenService:GetValue(var1, p4, p5)))
	end
	return t
end