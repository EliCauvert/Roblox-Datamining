local parent = script.Parent.Parent.Parent
local roactModule = require(parent.Roact)
local tModule = require(parent.t)
local localeRoactContextModule = require(script.Parent.LocaleRoactContext)
local var1 = tModule.strictInterface({ keys = tModule.table, render = tModule.callback })
local var2 = tModule.strictInterface({
	key = tModule.string,
	params = tModule.optional(tModule.table)
})

return function(p1)
	-- upvalues: var1 (ref), var2 (ref), roactModule (ref), localeRoactContextModule (ref)
	assert(var1(p1))
	
	for i, v in pairs(p1.keys) do
		assert(var2(v))
	end
	local render = p1.render
	
	return roactModule.createElement(localeRoactContextModule.Consumer, {
		render = function(p2)
			-- upvalues: p1 (ref), render (ref)
			local t = {}
			
			for i, v in pairs(p1.keys) do
				t[i] = p2:Format(v.key, v.params)
			end
			return render(t)
		end
	})
end