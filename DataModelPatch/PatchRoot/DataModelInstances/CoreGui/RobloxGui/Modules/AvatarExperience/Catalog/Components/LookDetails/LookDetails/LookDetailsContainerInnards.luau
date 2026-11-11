local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local FFlagAXFavoritePillOnItemDetails = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXFavoritePillOnItemDetails
local ItemStatisticsModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.ItemStatistics)
local FavoritePillContainerModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.FavoritePill.FavoritePillContainer)
local AvatarExperience = Modules.AvatarExperience
local Common = AvatarExperience.Common
local _ = require(Common.Types)
local ConstantsModule = require(Common.Constants)
local LookDescriptionModule = require(AvatarExperience.Catalog.Components.LookDetails.LookDetails.LookDescription)
local LookInfoListModule = require(AvatarExperience.Catalog.Components.LookDetails.LookDetails.LookInfo.LookInfoList)
local LookDetailsImageAndNameModule = require(AvatarExperience.Catalog.Components.LookDetails.LookDetails.LookDetailsImageAndName)
local GetFFlagLooksAvatarPDPImageDimensionsModule = require(Modules.AvatarExperience.Flags.GetFFlagLooksAvatarPDPImageDimensions)
local GetFFlagEnableLookFavoritingModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableLookFavoriting)
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local RoactFitComponents = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents
local FitFrameVertical = RoactFitComponents.FitFrameVertical

return function(p1)
	-- upvalues: UseStyleFunction (copy), FFlagRenameDeprecatedUIBloxTokens (copy), RoactFitComponents (copy), ConstantsModule (copy), ReactModule (copy), FitFrameVertical (copy), GetFFlagLooksAvatarPDPImageDimensionsModule (copy), RoactModule (copy), LookDetailsImageAndNameModule (copy), LookDescriptionModule (copy), GetFFlagEnableLookFavoritingModule (copy), FFlagAXFavoritePillOnItemDetails (copy), FavoritePillContainerModule (copy), ItemStatisticsModule (copy), LookInfoListModule (copy)
	local UseStyleResult = UseStyleFunction()
	local Size600 = if FFlagRenameDeprecatedUIBloxTokens then UseStyleResult.Tokens.Size.Size_600 else UseStyleResult.Tokens.Global.Space_300
	local Size300 = if FFlagRenameDeprecatedUIBloxTokens then UseStyleResult.Tokens.Size.Size_300 else UseStyleResult.Tokens.Global.Space_150
	local Theme = UseStyleResult.Theme
	local LookDetails = p1.lookDetails
	local LookId = p1.lookId
	local Description = if LookDetails and LookDetails.description then LookDetails.description else nil
	local ListPadding = p1.listPadding or Size300
	local SquareResult = RoactFitComponents.Rect.square(Size600)
	SquareResult.top = 0
	local NoLookDetails: boolean = LookId ~= nil and LookDetails == nil
	local IsLookIdMatch = p1.lookId == ConstantsModule.DraftLookId
	local Width = if p1.width then p1.width elseif FFlagRenameDeprecatedUIBloxTokens then UseStyleResult.Tokens.Size.Size_600 else UseStyleResult.Tokens.Global.Space_300
	
	return ReactModule.createElement(FitFrameVertical, {
		BorderSizePixel = 0,
		width = UDim.new(1, 0),
		contentPadding = UDim.new(0, ListPadding),
		margin = if GetFFlagLooksAvatarPDPImageDimensionsModule() then nil else SquareResult,
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		BackgroundColor3 = Theme.BackgroundDefault.Color,
		BackgroundTransparency = Theme.BackgroundDefault.Transparency,
		Position = UDim2.new(0, 0, 0, 0)
	}, {
		LookDetailsImageAndName = RoactModule.createElement(LookDetailsImageAndNameModule, {
			name = if LookDetails and LookDetails.name then LookDetails.name else nil,
			lookId = p1.lookId,
			lookDetails = LookDetails,
			isLoading = NoLookDetails,
			width = if GetFFlagLooksAvatarPDPImageDimensionsModule() then nil else Width,
			innerPadding = if GetFFlagLooksAvatarPDPImageDimensionsModule() then Size600 else nil,
			renderViewport = IsLookIdMatch
		}),
		LookDescription = if NoLookDetails or Description and Description ~= "" then RoactModule.createElement(LookDescriptionModule, {
			compactNumberOfLines = 3,
			LayoutOrder = 4,
			isLoading = NoLookDetails,
			descriptionText = Description
		}) else nil,
		ItemStatistics = if GetFFlagEnableLookFavoritingModule() and not NoLookDetails then if FFlagAXFavoritePillOnItemDetails then ReactModule.createElement(FavoritePillContainerModule, {
			LayoutOrder = 5,
			kind = ConstantsModule.ItemType.Look,
			itemId = LookId,
			favoritesCount = if LookDetails then LookDetails.favoriteCount else 0,
			lookType = if LookDetails then LookDetails.lookType else nil
		}) else RoactModule.createElement(ItemStatisticsModule, {
			LayoutOrder = 5,
			favoritesCount = if LookDetails then LookDetails.favoriteCount else 0,
			listPadding = ListPadding,
			width = Width - Size600 * 2
		}) else nil,
		LookInfoList = if NoLookDetails then nil else RoactModule.createElement(LookInfoListModule, {
			lookId = p1.lookId,
			lookDetails = LookDetails,
			LayoutOrder = if GetFFlagEnableLookFavoritingModule() then 6 else 5,
			innerPadding = if GetFFlagLooksAvatarPDPImageDimensionsModule() then Size600 else nil,
			disableInteractions = IsLookIdMatch,
			isTryOn = p1.isTryOn
		})
	})
end