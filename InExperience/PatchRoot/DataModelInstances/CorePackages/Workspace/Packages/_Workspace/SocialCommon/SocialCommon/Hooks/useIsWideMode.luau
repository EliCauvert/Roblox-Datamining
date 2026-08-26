local parent = script:FindFirstAncestor("SocialCommon").Parent
local formFactorModule = require(parent.FormFactor)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector

return function()
	-- upvalues: useSelector (ref), formFactorModule (ref)
	return useSelector(function(p1)
		-- upvalues: formFactorModule (copy)
		return p1.FormFactor == formFactorModule.Enums.FormFactor.WIDE
	end)
end