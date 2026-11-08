local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FormFactor = require(Parent.FormFactor).Enums.FormFactor
local FillBehavior = require(Parent.Foundation).Enums.FillBehavior
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector

local function selectFormFactor(p1)
	return p1.FormFactor
end

return function()
	-- upvalues: UseSelectorFunction (copy), selectFormFactor (copy), FormFactor (copy), FillBehavior (copy)
	return if UseSelectorFunction(selectFormFactor) == FormFactor.COMPACT then FillBehavior.Fill else FillBehavior.Fit
end