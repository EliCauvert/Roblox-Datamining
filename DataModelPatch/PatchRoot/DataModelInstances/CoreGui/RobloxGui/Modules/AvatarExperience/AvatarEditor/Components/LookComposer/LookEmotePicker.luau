local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local GridMetrics = UIBloxModule.App.Grid.GridMetrics
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local RefreshScrollingFrameWithLoadMoreModule = require(Modules.LuaApp.Components.RefreshScrollingFrameWithLoadMore)
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local RecommendedItemsModule = require(Modules.AvatarExperience.Common.Components.RecommendedItems)
local LoadableGridViewModule = require(Modules.AvatarExperience.Common.Components.LoadableGridView)
local GetAvatarEditorStructureModule = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorStructure)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local GetUserInventoryModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.GetUserInventory)
local GetEmotesCategoryModule = require(Modules.AvatarExperience.Common.getEmotesCategory)
local LookEmotePickerTileModule = require(script.Parent.LookEmotePickerTile)
local GetFFlagAXLookComposerRecommendedEmotesModule = require(Modules.AvatarExperience.Flags.GetFFlagAXLookComposerRecommendedEmotes)
local GetFFlagAXLooksTranslationAuditModule = require(Modules.AvatarExperience.Flags.GetFFlagAXLooksTranslationAudit)
local AvatarEditorCategoryInfo = nil

if require(Modules.AvatarExperience.Flags.GetFFlagAXExtractEmotesCategory)() then
	AvatarEditorCategoryInfo = GetEmotesCategoryModule()
else
	local AssetTypeToCategorySubcategoryEntry = GetAvatarEditorStructureModule().AssetTypeToCategorySubcategory[ConstantsModule.AssetTypeIdStrings.EmoteAnimation]
	
	if AssetTypeToCategorySubcategoryEntry then
		AvatarEditorCategoryInfo = UtilsModule.getAvatarEditorCategoryInfo(AssetTypeToCategorySubcategoryEntry.category, AssetTypeToCategorySubcategoryEntry.subcategory)
	end
end
return function()
	-- upvalues: ReactModule (copy), RoactGamepadModule (copy), UseStyleFunction (copy), UseDispatchFunction (copy), UseDesignTokensFunction (copy), GetFFlagAXLooksTranslationAuditModule (copy), UseLocalizationModule (copy), UseSelectorFunction (copy), AvatarEditorCategoryInfo (ref), UtilsModule (copy), ConstantsModule (copy), GetUserInventoryModule (copy), LookEmotePickerTileModule (copy), Focusable (copy), FFlagRenameDeprecatedUIBloxTokens (copy), RefreshScrollingFrameWithLoadMoreModule (copy), LoadableGridViewModule (copy), GridMetrics (copy), ConstantsModule1 (copy), GetFFlagAXLookComposerRecommendedEmotesModule (copy), RecommendedItemsModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefCacheResult = RoactGamepadModule.useRefCache()
	local UseStyleResult = UseStyleFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseLocalizationModuleResult = if GetFFlagAXLooksTranslationAuditModule() then UseLocalizationModule({
		avatarEmoteSelection = "Feature.Avatar.Message.SelectEmote"
	}) else nil
	local UseSelectorResult = UseSelectorFunction(function(p1): boolean
		-- upvalues: AvatarEditorCategoryInfo (upval)
		return not p1.AvatarExperience.AvatarEditor.PageFinished[AvatarEditorCategoryInfo.SearchUuid]
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p1)
		-- upvalues: AvatarEditorCategoryInfo (upval)
		return p1.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype[AvatarEditorCategoryInfo.SearchUuid] or {}
	end)
	local Initializing: boolean = UseSelectorResult and #UseSelectorResult1 == 0
	local GridItemHeightGetterWithOptionsResult = UtilsModule.GridItemHeightGetterWithOptions({
		itemTileType = ConstantsModule.ItemTileType.AvatarEditorTile,
		fontHeight = UseStyleResult.Font.Header2.RelativeSize * UseStyleResult.Font.BaseSize
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), GetUserInventoryModule (upval), AvatarEditorCategoryInfo (upval)
		return UseDispatchResult(GetUserInventoryModule(AvatarEditorCategoryInfo))
	end, { UseDispatchResult })
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), UseResult (copy)
		if UseSelectorResult then
			UseResult()
		end
	end, {})
	
	return ReactModule.createElement(Focusable.Frame, {
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
		ref = UseRefResult
	}, {
		Header = ReactModule.createElement("TextLabel", {
			BorderSizePixel = 0,
			TextWrapped = true,
			Size = UDim2.new(1, 0, 0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_1200 else UseDesignTokensResult.Global.Size_600),
			BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
			Text = if GetFFlagAXLooksTranslationAuditModule() then UseLocalizationModuleResult.avatarEmoteSelection else "Select an emote to pose your Avatar",
			Font = UseStyleResult.Font.Header2.Font,
			TextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.Header2.RelativeSize,
			TextColor3 = UseStyleResult.Theme.TextDefault.Color,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_300 else UseDesignTokensResult.Global.Space_150)
			})
		}),
		EmotesScrollingFrame = ReactModule.createElement(RefreshScrollingFrameWithLoadMoreModule, {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, -(if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_1200 else UseDesignTokensResult.Global.Size_600)),
			Position = UDim2.fromOffset(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_1200 else UseDesignTokensResult.Global.Size_600),
			CanvasSize = UDim2.fromScale(1, 1),
			onLoadMore = if UseSelectorResult then UseResult else nil,
			hasMoreRows = UseSelectorResult,
			initializing = Initializing
		}, {
			ListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			EmotesContainer = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Padding = ReactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, ConstantsModule.WidgetListHorizontalMargin),
					PaddingRight = UDim.new(0, ConstantsModule.WidgetListHorizontalMargin),
					PaddingBottom = UDim.new(0, ConstantsModule.WidgetListVerticalMargin)
				}),
				EmotesGridView = ReactModule.createElement(LoadableGridViewModule, {
					totalNumItems = 0,
					LayoutOrder = 1,
					getItemMetrics = GridMetrics.makeCustomMetricsGetter(ConstantsModule1.ItemsGridMetrics),
					items = UseSelectorResult1,
					renderItem = ReactModule.useCallback(function(ItemId)
						-- upvalues: ReactModule (upval), LookEmotePickerTileModule (upval)
						return ReactModule.createElement(LookEmotePickerTileModule, { itemId = ItemId })
					end, {}),
					getItemHeight = GridItemHeightGetterWithOptionsResult
				})
			}),
			RecommendedEmotes = GetFFlagAXLookComposerRecommendedEmotesModule() and ReactModule.createElement(RecommendedItemsModule, {
				LayoutOrder = 2,
				categoryInfo = AvatarEditorCategoryInfo,
				itemDetailsPeekViewRefs = UseRefCacheResult,
				baseRef = UseRefResult1,
				listFrameRef = UseRefResult,
				sendShopForMoreAnalytics = function() end
			})
		})
	})
end