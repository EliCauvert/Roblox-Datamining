return function(p1, p2): boolean --[[ Line: 4 | Named "isTapRelease" ]]
	if p1 == nil or p2 == nil then
		return true
	else
		local PositionDelta = p2.Position - p1
		
		return Vector2.new(PositionDelta.X, PositionDelta.Y).Magnitude <= 10
	end
end