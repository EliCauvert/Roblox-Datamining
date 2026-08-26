local t = {}

function t.Expt(_, p1, p2, p3, p4)
	-- upvalues: t (ref)
	return if math.abs(p2 - p1) < 0.01 then p2 else p1 + (p2 - p1) * t:Expty(p1, p2, p3, p4)
end

function t.Expty(_, _, _, p1, p2)
	return 1 - math.exp(-(-math.log(1 - p1)) * p2)
end

function t.Sign(_, p1)
	return if p1 > 0 then 1 elseif p1 < 0 then -1 else 0
end

function t.BezierValForT(_, p1, p2, p3, p4, p5)
	return (1 - p5) * (1 - p5) * (1 - p5) * p1 + 3 * p5 * (1 - p5) * (1 - p5) * p2 + 3 * p5 * p5 * (1 - p5) * p3 + p5 * p5 * p5 * p4
end

t._BezierPt2ForT = { x = 0, y = 0 }

function t.BezierPt2ForT(_, p1, p2, p3, p4, p5, p6, p7, p8, p9)
	-- upvalues: t (ref)
	t._BezierPt2ForT.x = t:BezierValForT(p1, p3, p5, p7, p9)
	t._BezierPt2ForT.y = t:BezierValForT(p2, p4, p6, p8, p9)
	
	return t._BezierPt2ForT
end

function t.YForPointOf2PtLine(_, p1, p2, p3)
	local var1 = (p1.y - p2.y) / (p1.x - p2.x)
	
	return var1 * p3 + (p1.y - var1 * p1.x)
end

function t.DeltaTimeToTimescale(_, p1)
	return p1 / 0.016666666667
end

function t.SecondsToTick(_, p1)
	return 0.016666666667 / p1
end

function t.ExptValueInSeconds(_, p1, p2, p3)
	return 1 - math.pow(p1 / p2, 1 / (60 * p3))
end

function t.NormalizedDefaultExptValueInSeconds(p1, p2)
	return p1:ExptValueInSeconds(0.01, 1, p2)
end

return t