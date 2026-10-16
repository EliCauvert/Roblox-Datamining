local Parent = script:FindFirstAncestor("SocialCommon").Parent
local FormFactorModule = require(Parent.FormFactor)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function() --[[ Line: 7 ]]
	-- upvalues: UseSelectorFunction (copy), FormFactorModule (copy)
	return UseSelectorFunction(function(p1): boolean --[[ Line: 8 ]]
		-- upvalues: FormFactorModule (upval)
		return p1.FormFactor == FormFactorModule.Enums.FormFactor.WIDE
	end)
end