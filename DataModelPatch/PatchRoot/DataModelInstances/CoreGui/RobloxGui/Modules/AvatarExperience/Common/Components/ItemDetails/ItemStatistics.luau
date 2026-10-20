local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local TModule = require(CorePackages.Packages.t)
local FitFrameVertical = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents.FitFrameVertical
local NumberLocalization = require(CorePackages.Workspace.Packages.Localization).NumberLocalization
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Skeleton = require(CorePackages.Packages.Foundation).Skeleton
local StatWidget = UIBloxModule.App.Indicator.StatWidget
local IconsActionsFavoriteOn = UIBloxModule.App.ImageSet.Images["icons/actions/favoriteOn"]
local WrapResult = require(CorePackages.Workspace.Packages.ArgCheck).wrap(TModule.strictInterface({
	favoritesCount = TModule.optional(TModule.integer),
	listPadding = TModule.optional(TModule.integer),
	width = TModule.optional(TModule.number),
	Position = TModule.optional(TModule.UDim2),
	LayoutOrder = TModule.optional(TModule.integer)
}))

return function(Frame)
	-- upvalues: WrapResult (copy), UseRoactServiceModule (copy), RoactLocalizationModule (copy), ReactModule (copy), Skeleton (copy), NumberLocalization (copy), FitFrameVertical (copy), StatWidget (copy), IconsActionsFavoriteOn (copy)
	assert(WrapResult(Frame))
	local LayoutOrder = Frame.LayoutOrder or 0
	local Position = Frame.Position or UDim2.new(0, 0, 0, 0)
	local Width = Frame.width or 0
	local ListPadding = Frame.listPadding or 10
	local FavoritesCount = Frame.favoritesCount
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactLocalizationModule)
	
	return if FavoritesCount then ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(0, Width, 0, 70),
		Position = Position,
		LayoutOrder = LayoutOrder
	}, {
		ItemStatisticsSection = ReactModule.createElement(FitFrameVertical, {
			BackgroundTransparency = 1,
			LayoutOrder = 0,
			width = UDim.new(0, Width),
			contentPadding = UDim.new(0, ListPadding),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 0, 0.5, 0)
		}, {
			FavoritesSection = ReactModule.createElement(StatWidget, {
				layoutOrder = 0,
				icon = IconsActionsFavoriteOn,
				countText = NumberLocalization.abbreviate(FavoritesCount, UseRoactServiceModuleResult:GetLocale()),
				labelText = UseRoactServiceModuleResult:Format("Feature.Catalog.Label.Favorites"),
				size = UDim2.new(0, Width - ListPadding * 2, 1, 0)
			})
		})
	}) else ReactModule.createElement(Skeleton, {
		Position = Position,
		Size = UDim2.new(0, Width, 0, 70),
		LayoutOrder = LayoutOrder
	})
end