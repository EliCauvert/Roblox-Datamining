local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Components.Types)
local useBindableModule = require(foundation.Utility.useBindable)

return function(value, p1)
	-- upvalues: useBindableModule (ref), reactModule (ref)
	return reactModule.joinBindings({ useBindableModule(value), useBindableModule(p1) }):map(function(p2)
		return {
			Transparency = 0,
			Color3 = p2[2].Color3:Lerp(p2[1].Color3, p2[2].Transparency)
		}
	end)
end