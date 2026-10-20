local CorePackages = game:GetService("CorePackages")
local DashModule = require(CorePackages.Packages.Dash)
local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.AvatarExperienceState)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local WidgetConstants = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).WidgetConstants

return function(p1, p2): boolean
	-- upvalues: AvatarScreen (copy), WidgetConstants (copy), DashModule (copy)
	local Context = p2 and p2.opaque and p2.opaque.name == AvatarScreen.MySharedAvatars and WidgetConstants.ContextWidgets.MySharedAvatars.Context or nil
	
	if not Context then
		return false
	end
	local ContextWidgetInfo = p1.AvatarExperience.Common.Widgets.ContextWidgetInfo
	local Details = ContextWidgetInfo and (ContextWidgetInfo[Context] and ContextWidgetInfo[Context].Details)
	
	if Details and type(Details) == "table" then
		local Content = Details[Context] and Details[Context].content
		
		return not Content or type(Content) ~= "table" or #DashModule.keys(Content) == 0
	else
		return false
	end
end