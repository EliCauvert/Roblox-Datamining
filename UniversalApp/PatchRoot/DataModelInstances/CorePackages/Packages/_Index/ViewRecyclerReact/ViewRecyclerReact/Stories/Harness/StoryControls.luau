return {
	AxisOptions = table.freeze({ "vertical", "horizontal" }),
	AlignmentOptions = table.freeze({ "center", "start", "end" }),
	PresentationModeOptions = table.freeze({ "untilCommit", "immediate" }),
	OverscanOptions = table.freeze({
		2,
		0,
		1,
		4,
		8
	}),
	options = function(p0, p1) --[[ line: 8 ]]
		local list = { p0 }
		
		for i, v in p1 do
			if v ~= p0 then
				table.insert(list, v)
			end
		end
		return list
	end,
	merge = function(p2, p3) --[[ line: 18 ]]
		local cloned = table.clone(p2)
		
		if p3 ~= nil then
			for i, v in p3 do
				cloned[i] = if type(v) == "table" then v[1] else v
			end
		end
		return cloned
	end,
	positiveInteger = function(p4, p5) --[[ line: 28 ]]
		return if type(p4) == "number" and p4 == p4 then math.max(1, math.round(p4)) else p5
	end,
	nonNegativeNumber = function(p6, p7) --[[ line: 35 ]]
		return if type(p6) == "number" and p6 == p6 then math.max(0, p6) else p7
	end,
	resolveAxis = function(p8, p9) --[[ line: 42 ]]
		return if p8 == "horizontal" then p9.Axis.X else p9.Axis.Y
	end,
	resolveAlignment = function(p10, p11) --[[ line: 46 ]]
		return if p10 == "start" then p11.ScrollAlignment.Start elseif p10 == "end" then p11.ScrollAlignment.End else p11.ScrollAlignment.Center
	end,
	resolvePresentationMode = function(p12, _) --[[ line: 55 ]]
		return if p12 == "immediate" then "ReadyOnAssignment" else "ReadyOnCommit"
	end
}