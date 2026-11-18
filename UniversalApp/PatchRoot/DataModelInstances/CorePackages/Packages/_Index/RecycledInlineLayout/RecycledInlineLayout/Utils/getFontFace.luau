local FoundationModule = require(script:FindFirstAncestor("RecycledInlineLayout").Parent.Foundation)

return function(p1)
	-- upvalues: FoundationModule (copy)
	return (FoundationModule.Utility.normalizeFontFace(p1 and p1.Font))
end