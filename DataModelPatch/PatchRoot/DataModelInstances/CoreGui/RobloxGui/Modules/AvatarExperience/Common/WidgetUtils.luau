local CorePackages = game:GetService("CorePackages")
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local WidgetConstants = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).WidgetConstants

return {
	getEntryButtonWidgetActivationFunc = function(ProfilePictureEditorWidget, p1, PrevNavHistory)
		-- upvalues: WidgetConstants (copy), AvatarScreen (copy)
		return if ProfilePictureEditorWidget == WidgetConstants.Types.ProfilePictureEditorWidget then function()
			-- upvalues: p1 (copy), AvatarScreen (upval), PrevNavHistory (copy)
			p1.navigate(AvatarScreen.ProfilePictureEditorEmotes, {
				prevNavPage = AvatarScreen.Catalog,
				prevNavHistory = PrevNavHistory
			})
		end else nil
	end
}