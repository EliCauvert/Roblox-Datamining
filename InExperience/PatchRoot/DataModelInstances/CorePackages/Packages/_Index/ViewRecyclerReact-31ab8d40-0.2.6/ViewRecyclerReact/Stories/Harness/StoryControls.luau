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
	options = function(p1, List) --[[ Line: 8 ]]
		local List1 = { p1 }
		
		for _, value in List do
			if value ~= p1 then
				table.insert(List1, value)
			end
		end
		return List1
	end,
	merge = function(Tbl, List) --[[ Line: 18 ]]
		local Copy = table.clone(Tbl)
		
		if List ~= nil then
			for i, value in List do
				Copy[i] = if type(value) == "table" then value[1] else value
			end
		end
		return Copy
	end,
	positiveInteger = function(Value: number, p2) --[[ Line: 28 ]]
		return if type(Value) == "number" and Value == Value then math.max(1, (math.round(Value))) else p2
	end,
	nonNegativeNumber = function(p2: number, p3) --[[ Line: 35 ]]
		return if type(p2) == "number" and p2 == p2 then math.max(0, p2) else p3
	end,
	resolveAxis = function(p2, p3) --[[ Line: 42 ]]
		return if p2 == "horizontal" then p3.Axis.X else p3.Axis.Y
	end,
	resolveAlignment = function(p2, p3) --[[ Line: 46 ]]
		return if p2 == "start" then p3.ScrollAlignment.Start elseif p2 == "end" then p3.ScrollAlignment.End else p3.ScrollAlignment.Center
	end,
	resolvePresentationMode = function(p2, p3) --[[ Line: 55 ]]
		return if p2 == "untilCommit" then p3.RecyclableViewReadiness.ReadyOnCommit else p3.RecyclableViewReadiness.ReadyOnAssignment
	end
}