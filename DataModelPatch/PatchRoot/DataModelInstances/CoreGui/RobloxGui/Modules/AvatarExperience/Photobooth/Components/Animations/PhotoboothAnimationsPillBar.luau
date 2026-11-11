local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local PhotoboothCategoriesModule = require(Modules.AvatarExperience.Photobooth.photoboothCategories)
local PhotoboothCategories = require(CorePackages.Workspace.Packages.AvatarExperiencePhotobooth).Enums.PhotoboothCategories
local CustomPillModule = require(Modules.AvatarExperience.Photobooth.Components.Animations.CustomPill)
local list = {
	PhotoboothCategories.All, PhotoboothCategories.Emotes,
	PhotoboothCategories.Idle, PhotoboothCategories.Walk, PhotoboothCategories.Run,
	PhotoboothCategories.Jump, PhotoboothCategories.Fall,
	PhotoboothCategories.Climb, PhotoboothCategories.Swim
}

return function(p1)
	-- upvalues: list (copy), PhotoboothCategoriesModule (copy), UseLocalizationFunction (copy), ReactModule (copy), CustomPillModule (copy)
	local AnimationFilter = p1.animationFilter
	local OnAnimationFilterChangedFunction = p1.onAnimationFilterChanged
	local Titles = {}
	
	for _, value in list do
		local PhotoboothCategoriesModuleEntry = PhotoboothCategoriesModule[value]
		
		if PhotoboothCategoriesModuleEntry then
			Titles[PhotoboothCategoriesModuleEntry.NavigationKey] = PhotoboothCategoriesModuleEntry.Title
		end
	end
	local UseLocalizationResult = UseLocalizationFunction(Titles)
	
	return ReactModule.createElement("ScrollingFrame", {
		ScrollBarThickness = 0,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		ScrollingDirection = Enum.ScrollingDirection.X,
		AutomaticCanvasSize = Enum.AutomaticSize.X,
		VerticalScrollBarInset = Enum.ScrollBarInset.None
	}, (ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), p1 (copy), list (upval), PhotoboothCategoriesModule (upval), CustomPillModule (upval), UseLocalizationResult (copy), AnimationFilter (copy), OnAnimationFilterChangedFunction (copy)
		local config = {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, p1.tokens.Padding.Small)
			})
		}
		
		for LayoutOrder, value in list do
			local PhotoboothCategoriesModuleEntry = PhotoboothCategoriesModule[value]
			
			if PhotoboothCategoriesModuleEntry then
				config[`Chip{value}`] = ReactModule.createElement(CustomPillModule, {
					text = UseLocalizationResult[PhotoboothCategoriesModuleEntry.NavigationKey],
					isChecked = AnimationFilter == PhotoboothCategoriesModuleEntry.NavigationKey,
					onActivated = function()
						-- upvalues: OnAnimationFilterChangedFunction (upval), PhotoboothCategoriesModuleEntry (copy)
						OnAnimationFilterChangedFunction(PhotoboothCategoriesModuleEntry.NavigationKey)
					end,
					LayoutOrder = LayoutOrder
				})
			end
		end
		return config
	end, { AnimationFilter, UseLocalizationResult, p1.tokens })))
end