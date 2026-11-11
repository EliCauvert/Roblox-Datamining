local function _(p1, p2): number
	return if p2 and typeof(p2) == "number" then p2 + p1 - 1 else -1
end

return function(p1: number, p2: number, p3: number)
	if p1 and typeof(p1) == "number" and p1 > 0 and p2 and typeof(p2) == "number" and p2 > 0 then
		local Ceiled = math.ceil(p1 / p2)
		
		return {
			positionInRow = (p1 - 1) % p2 + 1,
			rowInSort = Ceiled,
			rowOnPage = if p3 and typeof(p3) == "number" then p3 + Ceiled - 1 else -1
		}
	else
		return { positionInRow = -1, rowInSort = -1, rowOnPage = -1 }
	end
end