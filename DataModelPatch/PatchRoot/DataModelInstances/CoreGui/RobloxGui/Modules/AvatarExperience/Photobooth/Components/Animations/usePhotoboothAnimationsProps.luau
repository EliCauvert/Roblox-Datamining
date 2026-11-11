local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local PhotoboothCategories = require(CorePackages.Workspace.Packages.AvatarExperiencePhotobooth).Enums.PhotoboothCategories
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local _ = require(Modules.AvatarExperience.Photobooth.Components.Scenes.PhotoboothSceneData)
local FFlagAXPhotoboothBugBashFixes = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXPhotoboothBugBashFixes

return function(Position, p1)
	-- upvalues: UseTokensFunction (copy), UseSelectorFunction (copy), SelectIsPortraitModule (copy), ReactModule (copy), PhotoboothCategories (copy), FFlagAXPhotoboothBugBashFixes (copy)
	local UseTokensResult = UseTokensFunction()
	local UseSelectorResult = UseSelectorFunction(SelectIsPortraitModule)
	local UseStateResult, UseStateResult2 = ReactModule.useState(PhotoboothCategories.All)
	
	return {
		tokens = UseTokensResult,
		isPortrait = UseSelectorResult,
		position = Position,
		animationFilter = UseStateResult,
		onAnimationFilterChanged = ReactModule.useCallback(function(AnimationFilter)
			-- upvalues: UseStateResult (copy), UseStateResult2 (copy), PhotoboothCategories (upval)
			if UseStateResult == AnimationFilter then
				UseStateResult2(PhotoboothCategories.All)
				
				return
			else
				UseStateResult2(AnimationFilter)
			end
		end, { UseStateResult }),
		onTileClicked = if FFlagAXPhotoboothBugBashFixes then p1 else nil
	}
end