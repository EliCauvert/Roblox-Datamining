local parent = script:FindFirstAncestor("SocialCommon").Parent
local formFactorModule = require(parent.FormFactor)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector

return function() --[[ line: 7 ]]
	-- upvalues: useSelector (ref), formFactorModule (ref)
	return useSelector(function(p0) --[[ line: 8 ]]
		-- upvalues: formFactorModule (copy)
		return p0.FormFactor == formFactorModule.Enums.FormFactor.WIDE
	end)
end