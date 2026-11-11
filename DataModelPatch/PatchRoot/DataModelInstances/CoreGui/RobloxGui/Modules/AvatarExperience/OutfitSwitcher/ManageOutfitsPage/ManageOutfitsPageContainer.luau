local ReactModule = require(game:GetService("CorePackages").Packages.React)
local ManageOutfitsPageModule = require(script.Parent.ManageOutfitsPage)
local UseManageOutfitsPagePropsModule = require(script.Parent.useManageOutfitsPageProps)

return function()
	-- upvalues: UseManageOutfitsPagePropsModule (copy), ReactModule (copy), ManageOutfitsPageModule (copy)
	return ReactModule.createElement(ManageOutfitsPageModule, (UseManageOutfitsPagePropsModule()))
end