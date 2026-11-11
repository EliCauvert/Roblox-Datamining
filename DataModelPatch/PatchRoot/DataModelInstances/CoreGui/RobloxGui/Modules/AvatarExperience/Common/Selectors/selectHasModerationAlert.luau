local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local WidgetConstants = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).WidgetConstants
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)

return function(p1, p2): boolean
	-- upvalues: AvatarScreen (copy), WidgetConstants (copy), ConstantsModule (copy)
	local Context = p2 and p2.opaque and p2.opaque.name == AvatarScreen.MySharedAvatars and WidgetConstants.ContextWidgets.MySharedAvatars.Context or nil
	
	if not Context then
		return false
	end
	local ContextWidgetInfo = p1.AvatarExperience.Common.Widgets.ContextWidgetInfo
	local Details = ContextWidgetInfo and (ContextWidgetInfo[Context] and ContextWidgetInfo[Context].Details)
	local Content = Details and (Details[Context] and Details[Context].content)
	
	if not Content or type(Content) ~= "table" then
		return false
	end
	local HydratedWidget = p1.AvatarExperience.Common.Widgets.HydratedWidgetData[WidgetConstants.ContentType.Look]
	
	for _, value in Content do
		if value and value.id and HydratedWidget and type(HydratedWidget[value.id]) == "table" and HydratedWidget[value.id].moderationStatus == ConstantsModule.ModerationStatus.Moderated then
			return true
		end
	end
	return false
end