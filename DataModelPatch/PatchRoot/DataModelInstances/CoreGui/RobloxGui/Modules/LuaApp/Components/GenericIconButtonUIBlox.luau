local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(Modules.Common.Roact)
local CryoModule = require(CorePackages.Packages.Cryo)
local ImageSetLabel = require(CorePackages.Packages.UIBlox).Core.ImageSet.ImageSetLabel
local GenericIconButtonModule = require(Modules.LuaApp.Components.GenericIconButton)
local GenericIconButtonUIBlox = RoactModule.PureComponent:extend("GenericIconButtonUIBlox")

function GenericIconButtonUIBlox.render(p1)
	-- upvalues: RoactModule (copy), GenericIconButtonModule (copy), CryoModule (copy), ImageSetLabel (copy)
	return RoactModule.createElement(GenericIconButtonModule, CryoModule.Dictionary.join(p1.props, { iconComponent = ImageSetLabel }))
end

return GenericIconButtonUIBlox