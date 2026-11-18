local HardBreakModule = require(script:FindFirstAncestor("RecycledInlineLayout").Definitions.HardBreak)

return function(HardBreakModule1): boolean
	-- upvalues: HardBreakModule (copy)
	return HardBreakModule1 == HardBreakModule or (if typeof(HardBreakModule1) == "table" and table.isfrozen(HardBreakModule1) then if HardBreakModule1.type == "Leaf" then typeof(HardBreakModule1.definition) == "table" else HardBreakModule1.type == "Span" and typeof(HardBreakModule1.definition) == "table" else false)
end