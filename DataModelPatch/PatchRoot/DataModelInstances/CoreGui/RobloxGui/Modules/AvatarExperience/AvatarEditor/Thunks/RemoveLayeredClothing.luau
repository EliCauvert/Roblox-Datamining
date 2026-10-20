local Modules = game:GetService("CoreGui").RobloxGui.Modules
local HasLayeredHairModule = require(Modules.AvatarExperience.LayeredClothingSort.Selectors.hasLayeredHair)
local RemoveLayeredClothingModule = require(Modules.AvatarExperience.AvatarEditor.Actions.RemoveLayeredClothing)

return function()
	-- upvalues: HasLayeredHairModule (copy), RemoveLayeredClothingModule (copy)
	return function(p1)
		-- upvalues: HasLayeredHairModule (upval), RemoveLayeredClothingModule (upval)
		p1:dispatch(RemoveLayeredClothingModule((HasLayeredHairModule(p1:getState()))))
	end
end