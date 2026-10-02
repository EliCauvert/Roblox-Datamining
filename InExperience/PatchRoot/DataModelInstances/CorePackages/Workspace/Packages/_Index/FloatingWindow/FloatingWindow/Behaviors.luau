local _ = require(script.Parent.Types)

return table.freeze({
	Contained = table.freeze({ kind = require(script.Parent.BehaviorKind).Contained })
})