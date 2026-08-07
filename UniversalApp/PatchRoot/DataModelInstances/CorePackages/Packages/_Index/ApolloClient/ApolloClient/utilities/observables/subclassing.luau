local t = {}
local _ = require(script.Parent.Parent.Parent.Parent.LuauPolyfill)
local observable = require(script.Parent.Observable).Observable

function t.fixObservableSubclass(p0) --[[ line: 30 ]]
	-- upvalues: observable (ref)
	local function _(value) --[[ line: 32 | named "set" ]]
		-- upvalues: p0 (ref), observable (copy)
		p0[value] = observable
	end
	
	p0["@@species"] = observable
	
	return p0
end

return t