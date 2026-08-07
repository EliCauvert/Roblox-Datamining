local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Components.Types)
local useBindableModule = require(foundation.Utility.useBindable)

return function(value, p0) --[[ line: 11 | named "useCumulativeBackground" ]]
	-- upvalues: useBindableModule (ref), reactModule (ref)
	return reactModule.joinBindings({ useBindableModule(value), useBindableModule(p0) }):map(function(p1) --[[ line: 18 ]]
		return {
			Transparency = 0,
			Color3 = p1[2].Color3:Lerp(p1[1].Color3, p1[2].Transparency)
		}
	end)
end