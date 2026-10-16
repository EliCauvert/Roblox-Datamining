return function(p1, p2: number, p3: number): number --[[ Line: 7 | Named "resolveFeedRightChromeInset" ]]
	return if p2 == nil then math.max(p1.right, p3) else math.max(p1.right, p2)
end