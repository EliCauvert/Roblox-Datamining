local FormFactor = require(game:GetService("CorePackages").Workspace.Packages.FormFactor).Enums.FormFactor
local TopBarConstantsModule = require(script.Parent.Parent.TopBarConstants)
local config = {
	[FormFactor.COMPACT] = { IconButtonSize = 34 },
	[FormFactor.WIDE] = { IconButtonSize = 44 }
}

return function(p1)
	-- upvalues: config (copy), TopBarConstantsModule (copy)
	local Entry = config[p1]
	
	return Entry and Entry.IconButtonSize or TopBarConstantsModule.DEFAULT_ICON_BUTTON_SIZE
end