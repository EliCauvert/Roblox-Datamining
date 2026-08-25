local function _(p0, p1)
	return if p1 and typeof(p1) == "number" then p1 + p0 - 1 else -1
end

return function(p2, p3, p4)
	if not p2 or typeof(p2) ~= "number" or (p2 <= 0 or not p3) or (typeof(p3) ~= "number" or p3 <= 0) then
		return { positionInRow = -1, rowInSort = -1, rowOnPage = -1 }
	end
	local ceiled = math.ceil(p2 / p3)
	
	return {
		positionInRow = (p2 - 1) % p3 + 1,
		rowInSort = ceiled,
		rowOnPage = if p4 and typeof(p4) == "number" then p4 + ceiled - 1 else -1
	}
end