local t = {}
local observable = require(script.Parent.Parent.Parent.utilities).Observable

function t.fromError(p1)
	-- upvalues: observable (ref)
	return observable.new(function(p2)
		-- upvalues: p1 (ref)
		p2:error(p1)
	end)
end

return t