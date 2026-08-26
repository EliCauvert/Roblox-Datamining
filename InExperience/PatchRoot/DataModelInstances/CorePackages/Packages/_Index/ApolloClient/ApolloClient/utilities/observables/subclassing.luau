local t = {}
local _ = require(script.Parent.Parent.Parent.Parent.LuauPolyfill)
local observable = require(script.Parent.Observable).Observable

function t.fixObservableSubclass(p1)
	-- upvalues: observable (ref)
	local function _(value)
		-- upvalues: p1 (ref), observable (copy)
		p1[value] = observable
	end
	
	p1["@@species"] = observable
	
	return p1
end

return t