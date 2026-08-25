local t = {}
local observable = require(script.Parent.Parent.Parent.utilities).Observable

function t.fromError(p0)
	-- upvalues: observable (ref)
	return observable.new(function(p1)
		-- upvalues: p0 (ref)
		p1:error(p0)
	end)
end

return t