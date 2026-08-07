local parent = script.Parent.Parent.Parent
local roactModule = require(parent.Roact)
local tModule = require(parent.t)
local localeRoactContextModule = require(script.Parent.LocaleRoactContext)
local var3 = tModule.strictInterface({ keys = tModule.table, render = tModule.callback })
local var4 = tModule.strictInterface({
	key = tModule.string,
	params = tModule.optional(tModule.table)
})

return function(p0) --[[ line: 19 | named "MultiTextLocalizer" ]]
	-- upvalues: var3 (ref), var4 (ref), roactModule (ref), localeRoactContextModule (ref)
	assert(var3(p0))
	
	for i, v in pairs(p0.keys) do
		assert(var4(v))
	end
	local render = p0.render
	
	return roactModule.createElement(localeRoactContextModule.Consumer, {
		render = function(p1) --[[ line: 28 ]]
			-- upvalues: p0 (ref), render (ref)
			local t = {}
			
			for i, v in pairs(p0.keys) do
				t[i] = p1:Format(v.key, v.params)
			end
			return render(t)
		end
	})
end