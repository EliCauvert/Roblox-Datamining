local Observable = require(script.Parent.Parent.Parent.utilities).Observable

return {
	fromError = function(p1) --[[ Line: 17 ]]
		-- upvalues: Observable (copy)
		return Observable.new(function(p2) --[[ Line: 18 ]]
			-- upvalues: p1 (copy)
			p2:error(p1)
		end)
	end
}