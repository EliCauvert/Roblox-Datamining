local _ = require("./types")
local _ = require("./focus-scope")
local DiagnosticsModule = require("./diagnostics")

return function(Vector, List, p1)
	-- upvalues: DiagnosticsModule (copy)
	if p1 ~= "left" and p1 ~= "right" and p1 ~= "up" and p1 ~= "down" then
		return DiagnosticsModule.raise("focus-neighbor/unknown-direction", "focusNeighbor needs a known direction", { expected = "\"left\", \"right\", \"up\", or \"down\"" })
	end
	local IsUp: boolean = p1 == "up" or p1 == "down"
	local IsDown: boolean = p1 == "down" or p1 == "right"
	local v1 = 1e999
	local YDelta = 1e999
	local v2 = 1e999
	local v3 = nil
	
	for i, Vector1 in List do
		local YDelta2 = nil
		local IsXBelow = nil
		local Magnitude = nil
		local Height = nil
		local YDelta1 = nil
		local ScaledY = nil
		if IsUp then
			local NewY = if IsDown then Vector.y + Vector.height else Vector.y
			Height = Vector.height
			YDelta1 = if IsDown then Vector1.y + Vector1.height - NewY else NewY - Vector1.y
			YDelta2 = if IsDown then Vector1.y - NewY else NewY - (Vector1.y + Vector1.height)
			ScaledY = (Vector1.y + Vector1.height / 2 - NewY) * (if IsDown then 1 else -1)
			Magnitude = math.abs(Vector1.x + Vector1.width / 2 - (Vector.x + Vector.width / 2))
			IsXBelow = Vector1.x < Vector.x + Vector.width and Vector.x < Vector1.x + Vector1.width
		else
			local NewX = if IsDown then Vector.x + Vector.width else Vector.x
			Height = Vector.width
			YDelta1 = if IsDown then Vector1.x + Vector1.width - NewX else NewX - Vector1.x
			YDelta2 = if IsDown then Vector1.x - NewX else NewX - (Vector1.x + Vector1.width)
			ScaledY = (Vector1.x + Vector1.width / 2 - NewX) * (if IsDown then 1 else -1)
			Magnitude = math.abs(Vector1.y + Vector1.height / 2 - (Vector.y + Vector.height / 2))
			IsXBelow = Vector1.y < Vector.y + Vector.height and Vector.y < Vector1.y + Vector1.height
		end
		if -Height / 2 < YDelta2 and (IsXBelow or YDelta1 > 0) then
			local v4 = nil
			local YDelta3 = nil
			if IsXBelow then
				v4 = 0
				YDelta3 = YDelta2
			elseif Magnitude < ScaledY then
				v4 = 1
				YDelta3 = Magnitude + ScaledY * 0.028
			else
				v4 = 2
				YDelta3 = Magnitude / math.max(ScaledY, 1) ^ 0.15
			end
			if v4 < v1 or v4 == v1 and (YDelta3 < YDelta or YDelta3 == YDelta and Magnitude < v2) then
				v1 = v4
				YDelta = YDelta3
				v2 = Magnitude
				v3 = i
			end
		end
	end
	return v3
end