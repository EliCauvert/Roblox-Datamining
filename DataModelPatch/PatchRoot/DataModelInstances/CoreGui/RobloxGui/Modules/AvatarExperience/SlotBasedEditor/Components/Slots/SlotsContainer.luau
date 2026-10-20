local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseSlotPropsModule = require(script.Parent.useSlotProps)
local SlotsModule = require(script.Parent.Slots)
local CryoModule = require(CorePackages.Packages.Cryo)
local FFlagAXSlotsDisableScrollAwayOnLandscape = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsDisableScrollAwayOnLandscape

return function(p1)
	-- upvalues: UseSlotPropsModule (copy), ReactModule (copy), SlotsModule (copy), FFlagAXSlotsDisableScrollAwayOnLandscape (copy), CryoModule (copy)
	local UseSlotPropsModuleResult = UseSlotPropsModule(p1)
	
	return ReactModule.createElement(SlotsModule, if FFlagAXSlotsDisableScrollAwayOnLandscape then UseSlotPropsModuleResult else CryoModule.Dictionary.join(UseSlotPropsModuleResult, p1))
end