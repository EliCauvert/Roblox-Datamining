local CurveUtil = {}

function CurveUtil:Expt(p1, p2, p3, p4) --[[ Line: 5 ]]
	-- upvalues: CurveUtil (copy)
	return if math.abs(p2 - p1) < 0.01 then p2 else p1 + (p2 - p1) * CurveUtil:Expty(p1, p2, p3, p4)
end

function CurveUtil:Expty(_, _, p1: number, p2): number --[[ Line: 17 ]]
	return 1 - math.exp(-(-math.log(1 - p1)) * p2)
end

function CurveUtil:Sign(p1: number): number --[[ Line: 24 ]]
	return if p1 > 0 then 1 elseif p1 < 0 then -1 else 0
end

function CurveUtil:BezierValForT(p1, p2, p3, p4, p5: number) --[[ Line: 34 ]]
	return (1 - p5) * (1 - p5) * (1 - p5) * p1 + 3 * p5 * (1 - p5) * (1 - p5) * p2 + 3 * p5 * p5 * (1 - p5) * p3 + p5 * p5 * p5 * p4
end

CurveUtil._BezierPt2ForT = { x = 0, y = 0 }

function CurveUtil:BezierPt2ForT(p1, p2, p3, p4, p5, p6, p7, p8, p9) --[[ Line: 43 ]]
	-- upvalues: CurveUtil (copy)
	CurveUtil._BezierPt2ForT.x = CurveUtil:BezierValForT(p1, p3, p5, p7, p9)
	CurveUtil._BezierPt2ForT.y = CurveUtil:BezierValForT(p2, p4, p6, p8, p9)
	
	return CurveUtil._BezierPt2ForT
end

function CurveUtil:YForPointOf2PtLine(Vector, _BezierPt2ForT, p1) --[[ Line: 55 ]]
	local YRatio = (Vector.y - _BezierPt2ForT.y) / (Vector.x - _BezierPt2ForT.x)
	
	return YRatio * p1 + (Vector.y - YRatio * Vector.x)
end

function CurveUtil:DeltaTimeToTimescale(p1: number): number --[[ Line: 63 ]]
	return p1 / 0.016666666666666666
end

function CurveUtil:SecondsToTick(p1: number): number --[[ Line: 67 ]]
	return 0.016666666666666666 / p1
end

function CurveUtil:ExptValueInSeconds(p1, p2, p3: number): number --[[ Line: 71 ]]
	return 1 - math.pow(p1 / p2, 1 / (60 * p3))
end

function CurveUtil.NormalizedDefaultExptValueInSeconds(p1, p2) --[[ Line: 75 ]]
	return p1:ExptValueInSeconds(0.01, 1, p2)
end

return CurveUtil