local Parent = script.Parent.Parent.Parent
local RoactModule = require(Parent.Roact)
local TModule = require(Parent.t)
local LocaleRoactContextModule = require(script.Parent.LocaleRoactContext)
local StrictInterfaceResult = TModule.strictInterface({ keys = TModule.table, render = TModule.callback })
local StrictInterfaceResult1 = TModule.strictInterface({
	key = TModule.string,
	params = TModule.optional(TModule.table)
})

return function(p1) --[[ Line: 19 | Named "MultiTextLocalizer" ]]
	-- upvalues: StrictInterfaceResult (copy), StrictInterfaceResult1 (copy), RoactModule (copy), LocaleRoactContextModule (copy)
	assert(StrictInterfaceResult(p1))
	
	for _, key in pairs(p1.keys) do
		assert(StrictInterfaceResult1(key))
	end
	local RenderFunction = p1.render
	
	return RoactModule.createElement(LocaleRoactContextModule.Consumer, {
		render = function(p2) --[[ Line: 28 ]]
			-- upvalues: p1 (copy), RenderFunction (copy)
			local FormatResults = {}
			
			for i, key in pairs(p1.keys) do
				FormatResults[i] = p2:Format(key.key, key.params)
			end
			return RenderFunction(FormatResults)
		end
	})
end