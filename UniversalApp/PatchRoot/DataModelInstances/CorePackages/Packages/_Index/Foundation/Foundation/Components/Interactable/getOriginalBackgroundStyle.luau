local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local _ = require(Foundation.Components.Types)

return function(p1, Transparency) --[[ Line: 11 | Named "getOriginalBackgroundStyle" ]]
	-- upvalues: ReactIsModule (copy), ReactModule (copy)
	return if ReactIsModule.isBinding(p1) and ReactIsModule.isBinding(Transparency) then ReactModule.joinBindings({ Color3 = p1, Transparency = Transparency }) elseif ReactIsModule.isBinding(p1) then p1:map(function(p2) --[[ Line: 21 ]]
		-- upvalues: Transparency (copy)
		return { Color3 = p2, Transparency = Transparency }
	end) elseif ReactIsModule.isBinding(Transparency) then Transparency:map(function(Transparency) --[[ Line: 25 ]]
		-- upvalues: p1 (copy)
		return { Color3 = p1, Transparency = Transparency }
	end) else { Color3 = p1, Transparency = Transparency }
end