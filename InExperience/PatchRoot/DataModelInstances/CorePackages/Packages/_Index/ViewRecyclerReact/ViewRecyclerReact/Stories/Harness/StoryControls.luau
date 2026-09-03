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
	options = function(p1, p2)
		local list = { p1 }
		
		for i, v in p2 do
			if v ~= p1 then
				table.insert(list, v)
			end
		end
		return list
	end,
	merge = function(p3, p4)
		local cloned = table.clone(p3)
		
		if p4 ~= nil then
			for i, v in p4 do
				cloned[i] = if type(v) == "table" then v[1] else v
			end
		end
		return cloned
	end,
	positiveInteger = function(p5, p6)
		return if type(p5) == "number" and p5 == p5 then math.max(1, math.round(p5)) else p6
	end,
	nonNegativeNumber = function(p5, p6)
		return if type(p5) == "number" and p5 == p5 then math.max(0, p5) else p6
	end,
	resolveAxis = function(p5, p6)
		return if p5 == "horizontal" then p6.Axis.X else p6.Axis.Y
	end,
	resolveAlignment = function(p5, p6)
		return if p5 == "start" then p6.ScrollAlignment.Start elseif p5 == "end" then p6.ScrollAlignment.End else p6.ScrollAlignment.Center
	end,
	resolvePresentationMode = function(p5, p6)
		return if p5 == "untilCommit" then p6.RecyclableViewReadiness.ReadyOnCommit else p6.RecyclableViewReadiness.ReadyOnAssignment
	end
}