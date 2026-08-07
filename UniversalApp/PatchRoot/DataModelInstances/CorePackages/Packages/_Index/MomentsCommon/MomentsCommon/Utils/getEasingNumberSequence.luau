local tweenService = game:GetService("TweenService")

local function _(p0, p1, p2) --[[ line: 3 | named "linearInterpolate" ]]
	return p0 + (p1 - p0) * p2
end

return function(p3, p4, p5, p6, p7) --[[ line: 7 | named "getEasingNumberSequence" ]]
	-- upvalues: tweenService (ref)
	local t = {}
	
	for i = 0, p5 do
		local var2 = i / p5
		table.insert(t, NumberSequenceKeypoint.new(var2, p3 + (p4 - p3) * tweenService:GetValue(var2, p6, p7)))
	end
	return t
end