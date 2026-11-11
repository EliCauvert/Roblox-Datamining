local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local TextService = game:GetService("TextService")
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local AvatarExperience = Modules.AvatarExperience
local Common = AvatarExperience.Common
local Catalog = AvatarExperience.Catalog
local _ = require(Common.Types)
local ToggleTryOnThunkModule = require(Common.Thunks.ToggleTryOnThunk)
local NavigateDownToAvatarScreenModule = require(Common.Components.RoactNavigation.AppRouterWrapper.NavigateDownToAvatarScreen)
local CatalogUtilsModule = require(Catalog.CatalogUtils)
local AnalyticsModule = require(Catalog.Services.Analytics)
local FFlagAXThumbTypeNilCheck = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXThumbTypeNilCheck
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local GetRbxthumbWithTypeSizeAndOptionsFunction = require(CorePackages.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseLocalizationModule (copy), UseNavigationFunction (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), AnalyticsModule (copy), UseDispatchFunction (copy), UseAvatarRouteFunction (copy), ReactModule (copy), ToggleTryOnThunkModule (copy), NavigateDownToAvatarScreenModule (copy), AvatarScreen (copy), CatalogUtilsModule (copy), FFlagAXThumbTypeNilCheck (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), TextService (copy), RoactModule (copy), LoadableImage (copy), Button (copy), ButtonType (copy)
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local UseLocalizationModuleResult = UseLocalizationModule({ tryOn = "Feature.Avatar.Action.TryOn" })
	local UseNavigationResult = UseNavigationFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(AnalyticsModule)
	local UseDispatchResult = UseDispatchFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseDispatchResult (copy), ToggleTryOnThunkModule (upval), UseRoactServiceModuleResult (copy), UseRoactServiceModuleResult1 (copy), UseAvatarRouteResult (copy), UseNavigationResult (copy), NavigateDownToAvatarScreenModule (upval), AvatarScreen (upval)
		local config = {
			mountAsFullView = false,
			mountAnimation = false,
			itemId = p1.itemId,
			itemType = p1.itemType,
			itemDetailsPeekViewRefs = p1.itemDetailsPeekViewRefs,
			resultsListRef = p1.resultsListRef
		}
		local Text = p1.itemType .. p1.itemId
		UseDispatchResult(ToggleTryOnThunkModule(UseRoactServiceModuleResult, UseRoactServiceModuleResult1, p1.itemType, p1.itemSubType, p1.itemId, true, UseAvatarRouteResult, UseNavigationResult))
		UseDispatchResult(NavigateDownToAvatarScreenModule(AvatarScreen.TryOnItem, Text, config))
	end, {
		UseRoactServiceModuleResult,
		UseRoactServiceModuleResult1,
		UseAvatarRouteResult,
		UseNavigationResult,
		p1
	})
	local WidthRatio = p1.width * 9 / 16
	local ItemId = p1.itemId
	local RbxThumbType = CatalogUtilsModule.GetRbxThumbType(p1.itemType)
	local TryOn = UseLocalizationModuleResult.tryOn
	local NewX = 16 + TextService:GetTextSize(TryOn, UseStyleResultFont.BaseSize * UseStyleResultFont.Header2.RelativeSize, UseStyleResultFont.Header2.Font, Vector2.new(10000, 10000)).X
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		ZIndex = 0,
		Size = UDim2.new(1, 0, 0, WidthRatio)
	}, {
		ItemBackground = RoactModule.createElement("Frame", {
			ZIndex = 0,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.fromScale(0.5, 0),
			Size = UDim2.new(1, 48, 1, 0),
			BackgroundColor3 = Theme.BackgroundMuted.Color,
			BackgroundTransparency = Theme.BackgroundMuted.Transparency
		}, {
			UIGradient = RoactModule.createElement("UIGradient", {
				Rotation = -90,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(0.4, 0),
					NumberSequenceKeypoint.new(1, 1)
				})
			})
		}),
		Image = RoactModule.createElement(LoadableImage, {
			BackgroundTransparency = 1,
			useShimmerAnimationWhileLoading = true,
			Image = if FFlagAXThumbTypeNilCheck and RbxThumbType then GetRbxthumbWithTypeSizeAndOptionsFunction(ItemId, RbxThumbType, 420) else GetRbxthumbWithTypeSizeAndOptionsFunction(ItemId, RbxThumbType, 420),
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.fromScale(0.5, 0),
			Size = UDim2.fromOffset(WidthRatio, WidthRatio)
		}),
		TryOnButtonFrame = if UseNavigationResult.getParam("fromProfile") then RoactModule.createElement("Frame", {
			ZIndex = 2,
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1)
		}, {
			TryOnButton = RoactModule.createElement(Button, {
				buttonType = ButtonType.Secondary,
				position = UDim2.new(1, -NewX - 8, 1, -44),
				size = UDim2.fromOffset(NewX, 36),
				text = TryOn,
				onActivated = UseResult
			})
		}) else nil
	})
end