local function _(p1, p2)
	return if p2 and typeof(p2) == "number" then p2 + p1 - 1 else -1
end

return function(p1, p2, p3)
	if not p1 or typeof(p1) ~= "number" or (p1 <= 0 or not p2) or (typeof(p2) ~= "number" or p2 <= 0) then
		return { positionInRow = -1, rowInSort = -1, rowOnPage = -1 }
	end
	local ceiled = math.ceil(p1 / p2)
	
	return {
		positionInRow = (p1 - 1) % p2 + 1,
		rowInSort = ceiled,
		rowOnPage = if p3 and typeof(p3) == "number" then p3 + ceiled - 1 else -1
	}
end