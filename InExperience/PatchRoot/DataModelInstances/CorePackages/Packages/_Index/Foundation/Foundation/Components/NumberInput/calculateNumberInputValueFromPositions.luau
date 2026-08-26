local flagsModule = require(script:FindFirstAncestor("Foundation").Utility.Flags)

return function(p1, p2, p3, p4, p5)
	-- upvalues: flagsModule (ref)
	return p1 + (if flagsModule.FoundationNumberInputBeta then math.floor((p3 - p2) * (p5 or 1)) else p3 - p2) * p4
end