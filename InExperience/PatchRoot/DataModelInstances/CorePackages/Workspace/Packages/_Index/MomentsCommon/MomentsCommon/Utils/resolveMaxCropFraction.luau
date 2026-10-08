local function _(p1)
	return p1.Y < p1.X
end

return function(a, b, p1, p2)
	if b == nil or a.X == 0 or a.Y == 0 then
		return 0
	end
	local var1 = b.Y < b.X
	
	return if var1 == (a.Y < a.X) then if var1 and not p2 then 0 else p1 else 0
end