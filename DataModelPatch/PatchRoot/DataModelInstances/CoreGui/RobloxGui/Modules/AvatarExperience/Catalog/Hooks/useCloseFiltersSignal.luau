local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local NamedRefsContextModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Context.NamedRefsContext)
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal

return function()
	-- upvalues: ReactModule (copy), NamedRefsContextModule (copy), AvatarScreen (copy), Signal (copy)
	local UseContextResultEntry = ReactModule.useContext(NamedRefsContextModule)[AvatarScreen.SortAndFilters .. "-closeSignal"]
	
	if UseContextResultEntry.current == nil then
		UseContextResultEntry.current = Signal.new()
	end
	return UseContextResultEntry.current
end