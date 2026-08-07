local t = {}

function t.Expt(_, p0, p1, p2, p3) --[[ line: 5 ]]
	-- upvalues: t (ref)
	return if math.abs(p1 - p0) < 0.01 then p1 else p0 + (p1 - p0) * t:Expty(p0, p1, p2, p3)
end

function t.Expty(_, _, _, p4, p5) --[[ line: 17 ]]
	return 1 - math.exp(-(-math.log(1 - p4)) * p5)
end

function t.Sign(_, p6) --[[ line: 24 ]]
	return if p6 > 0 then 1 elseif p6 < 0 then -1 else 0
end

function t.BezierValForT(_, p7, p8, p9, p10, p11) --[[ line: 34 ]]
	return (1 - p11) * (1 - p11) * (1 - p11) * p7 + 3 * p11 * (1 - p11) * (1 - p11) * p8 + 3 * p11 * p11 * (1 - p11) * p9 + p11 * p11 * p11 * p10
end

t._BezierPt2ForT = { x = 0, y = 0 }

function t.BezierPt2ForT(_, p12, p13, p14, p15, p16, p17, p18, p19, p20) --[[ line: 43 ]]
	-- upvalues: t (ref)
	t._BezierPt2ForT.x = t:BezierValForT(p12, p14, p16, p18, p20)
	t._BezierPt2ForT.y = t:BezierValForT(p13, p15, p17, p19, p20)
	
	return t._BezierPt2ForT
end

function t.YForPointOf2PtLine(_, p21, p22, p23) --[[ line: 55 ]]
	local var1 = (p21.y - p22.y) / (p21.x - p22.x)
	
	return var1 * p23 + (p21.y - var1 * p21.x)
end

function t.DeltaTimeToTimescale(_, p24) --[[ line: 63 ]]
	return p24 / 0.016666666667
end

function t.SecondsToTick(_, p25) --[[ line: 67 ]]
	return 0.016666666667 / p25
end

function t.ExptValueInSeconds(_, p26, p27, p28) --[[ line: 71 ]]
	return 1 - math.pow(p26 / p27, 1 / (60 * p28))
end

function t.NormalizedDefaultExptValueInSeconds(p29, p30) --[[ line: 75 ]]
	return p29:ExptValueInSeconds(0.01, 1, p30)
end

return t