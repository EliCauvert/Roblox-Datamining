local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Components.Types)
local UseBindableModule = require(Foundation.Utility.useBindable)

return function(p1, p2) --[[ Line: 11 | Named "useCumulativeBackground" ]]
	-- upvalues: UseBindableModule (copy), ReactModule (copy)
	return ReactModule.joinBindings({ UseBindableModule(p1), (UseBindableModule(p2)) }):map(function(Entry) --[[ Line: 18 ]]
		return {
			Transparency = 0,
			Color3 = Entry[2].Color3:Lerp(Entry[1].Color3, Entry[2].Transparency)
		}
	end)
end