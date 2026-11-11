local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local NotificationService = game:GetService("NotificationService")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local GridMetrics = require(CorePackages.Packages.UIBlox).App.Grid.GridMetrics
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit)
local CatalogItemCard = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.CatalogItemCard.CatalogItemCard
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXPhotoboothBugBashFixes = AvatarExperienceFlagsModule.FFlagAXPhotoboothBugBashFixes
local FFlagAXPhotoboothAnalytics = AvatarExperienceFlagsModule.FFlagAXPhotoboothAnalytics
local AddUnifiedEventLoggingFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging
local UnifiedEventLogEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums
local UnifiedEventLogConstants = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants
local UsePhotoboothContextFunction = require(CorePackages.Workspace.Packages.AvatarExperiencePhotobooth).Context.usePhotoboothContext
local PHOTOBOOTHSCENES = require(Modules.AvatarExperience.Photobooth.Components.Scenes.PhotoboothSceneData).PHOTOBOOTH_SCENES

return function(Position, Callback)
	-- upvalues: UseTokensFunction (copy), UseSelectorFunction (copy), SelectIsPortraitModule (copy), UsePhotoboothContextFunction (copy), ReactModule (copy), GridMetrics (copy), UseLocalizationFunction (copy), NotificationService (copy), FFlagAXPhotoboothAnalytics (copy), AddUnifiedEventLoggingFunction (copy), UnifiedEventLogEnums (copy), UnifiedEventLogConstants (copy), CatalogItemCard (copy), FFlagAXPhotoboothBugBashFixes (copy), FoundationModule (copy), PHOTOBOOTHSCENES (copy)
	local UseTokensResult = UseTokensFunction()
	local UseSelectorResult = UseSelectorFunction(SelectIsPortraitModule)
	local UsePhotoboothContextResult = UsePhotoboothContextFunction()
	
	if not UsePhotoboothContextResult then
		error("PhotoboothContext not found - make sure PhotoboothContextProvider is mounted")
	end
	local PhotoboothStore = UsePhotoboothContextResult.photoboothStore
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseTokensResult.Size.Size_3000)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(PhotoboothStore.getSelectedSceneId(false))
	ReactModule.useEffect(function()
		-- upvalues: PhotoboothStore (copy), UseStateResult1 (copy)
		PhotoboothStore.selectScene(UseStateResult1)
	end, { UseStateResult1 })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GridMetrics (upval), UseStateResult (copy), UseTokensResult (copy)
		return GridMetrics.getSmallMetrics(math.max(UseStateResult - UseTokensResult.Size.Size_400 * 2, 0), UseTokensResult.Size.Size_300)
	end, { UseStateResult, UseTokensResult })
	local UseMemoResult1 = ReactModule.useMemo(function(): number
		-- upvalues: UseMemoResult (copy), UseTokensResult (copy)
		return math.floor(UseMemoResult.itemWidth * 1.6) + UseTokensResult.Size.Size_1000
	end, { UseMemoResult.itemWidth, UseTokensResult })
	
	return {
		tokens = UseTokensResult,
		isPortrait = UseSelectorResult,
		gridMetrics = UseMemoResult,
		itemsPerRow = UseMemoResult.itemsPerRow,
		scenes = PHOTOBOOTHSCENES,
		renderSceneItem = ReactModule.useCallback(function(p1)
			-- upvalues: UseStateResult1 (copy), UseTokensResult (copy), UseLocalizationFunction (upval), NotificationService (upval), FFlagAXPhotoboothAnalytics (upval), ReactModule (upval), AddUnifiedEventLoggingFunction (upval), UnifiedEventLogEnums (upval), UnifiedEventLogConstants (upval), CatalogItemCard (upval), UseMemoResult (copy), UseMemoResult1 (copy), UseStateResult2_1 (copy), FFlagAXPhotoboothBugBashFixes (upval), Callback (copy), FoundationModule (upval)
			local Item = p1.item
			local IsUseStateResultMatch = UseStateResult1 == Item.id
			local Size50 = UseTokensResult.Size.Size_50
			local UseLocalizationResult = UseLocalizationFunction({ title = Item.name })
			local Thumbnail = if (NotificationService.SelectedTheme or "Light"):lower() == "dark" and Item.dark and Item.dark.thumbnail then Item.dark.thumbnail else Item.thumbnail
			local UseRefResult = nil
			
			if FFlagAXPhotoboothAnalytics then
				UseRefResult = ReactModule.useRef(nil)
				AddUnifiedEventLoggingFunction(UseRefResult, {
					action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
					elementName = if Item.id == "" then "Photobooth_Scene_Selected_Blocky" else "Photobooth_Scene_Selected_" .. Item.id
				}, {
					sessionTagName = UnifiedEventLogConstants.L2_SESSION_TAG_NAME
				})
			end
			return ReactModule.createElement(CatalogItemCard, {
				headerAspectRatio = 0.625,
				Size = UDim2.fromOffset(UseMemoResult.itemWidth, UseMemoResult1),
				isSelected = IsUseStateResultMatch,
				title = UseLocalizationResult.title,
				ref = if FFlagAXPhotoboothAnalytics then UseRefResult else nil,
				onActivated = function()
					-- upvalues: IsUseStateResultMatch (copy), UseStateResult2_1 (upval), Item (copy), FFlagAXPhotoboothBugBashFixes (upval), Callback (upval)
					if IsUseStateResultMatch then
						UseStateResult2_1("")
					else
						UseStateResult2_1(Item.id)
					end
					if FFlagAXPhotoboothBugBashFixes and Callback then
						Callback()
					end
				end,
				presentationSlot = ReactModule.createElement(FoundationModule.View, {
					Size = UDim2.fromScale(1, 1),
					backgroundStyle = { Transparency = 1 }
				}, {
					UIPadding = IsUseStateResultMatch and ReactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, Size50),
						PaddingBottom = UDim.new(0, Size50),
						PaddingLeft = UDim.new(0, Size50),
						PaddingRight = UDim.new(0, Size50)
					}) or nil,
					InnerContent = ReactModule.createElement(FoundationModule.View, {
						tag = "radius-medium",
						Size = UDim2.fromScale(1, 1),
						backgroundStyle = { Transparency = 0, Color3 = Item.color }
					}, {
						UIStroke = IsUseStateResultMatch and ReactModule.createElement("UIStroke", {
							Transparency = 0,
							Thickness = Size50,
							Color = UseTokensResult.Color.ActionSubEmphasis.Background.Color3
						}) or nil,
						Thumbnail = if Thumbnail and Thumbnail ~= "" then ReactModule.createElement(FoundationModule.Image, {
							tag = "size-full-full radius-medium",
							Image = Thumbnail,
							ScaleType = Enum.ScaleType.Crop
						}) else nil
					})
				})
			})
		end, {
			UseMemoResult,
			UseMemoResult1,
			UseStateResult1,
			PhotoboothStore
		}),
		getSceneId = ReactModule.useCallback(function(p1)
			return p1.id
		end, {}),
		onContainerSizeChanged = ReactModule.useCallback(function(Frame)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(Frame.AbsoluteSize.X)
		end, {}),
		selectedScene = UseStateResult1,
		position = Position
	}
end