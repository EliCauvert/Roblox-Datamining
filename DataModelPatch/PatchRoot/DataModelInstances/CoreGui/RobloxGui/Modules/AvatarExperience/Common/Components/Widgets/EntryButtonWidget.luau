local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseSelectedThemeFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.useSelectedTheme
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local WidgetUtilsModule = require(Modules.AvatarExperience.Common.WidgetUtils)
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local WidgetConstants = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).WidgetConstants
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local FFlagSignalsNavP3gAvatarExperience = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3gAvatarExperience then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil

return function(Frame)
	-- upvalues: UseNavigationFunction (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy), FFlagSignalsNavP3gAvatarExperience (copy), GetLegacyNavigationStore (copy), UseSignalStateFunction (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), UseSelectedThemeFunction (copy), UseStyleFunction (copy), WidgetConstants (copy), WidgetUtilsModule (copy), UseLocalizationFunction (copy), UseSelectionCursorFunction (copy), CursorKind (copy), ReactModule (copy), Focusable (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseSelectorResult = UseSelectorFunction(function(p1)
		return p1.AvatarExperience.Common.Widgets.WidgetInfo.RequestId
	end, GetUseSelectorDeepEqualsFunction())
	local UseSignalStateResult = nil
	UseSignalStateResult = if FFlagSignalsNavP3gAvatarExperience then UseSignalStateFunction(GetLegacyNavigationStore(false).getHistory) else UseSelectorFunction(function(p1)
		-- upvalues: FFlagUseNavigationSelectors (upval), Selectors (upval)
		return if FFlagUseNavigationSelectors then Selectors.selectLegacyHistory(p1) else p1.Navigation.history
	end, GetUseSelectorDeepEqualsFunction())
	local IsDark = UseSelectedThemeFunction() == "dark"
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local WidgetInfo = Frame.widgetInfo
	local Type = WidgetInfo.type
	local TypeToImage = if Type then WidgetConstants.TypeToImageInfo[Type] else nil
	
	local function v26()
		-- upvalues: UseRoactServiceModuleResult (copy), UseSelectorResult (copy), WidgetConstants (upval), Frame (copy), WidgetInfo (copy), WidgetUtilsModule (upval), Type (copy), UseNavigationResult (copy), UseSignalStateResult (ref)
		UseRoactServiceModuleResult.widgetInteraction(UseSelectorResult, WidgetConstants.ActionType.WIDGET_CLICK, nil, Frame.widgetRow, nil, nil, WidgetInfo.id)
		WidgetUtilsModule.getEntryButtonWidgetActivationFunc(Type, UseNavigationResult, UseSignalStateResult)()
	end
	
	local BackgroundImageDark = nil
	local ContentImageDark = nil
	local RowHeight = Frame.rowHeight
	
	if TypeToImage then
		RowHeight *= TypeToImage.rowScale
		BackgroundImageDark = if IsDark then TypeToImage.backgroundImageDark else TypeToImage.backgroundImageLight
		ContentImageDark = if IsDark then TypeToImage.contentImageDark else TypeToImage.contentImageLight
	end
	local UseLocalizationResult = UseLocalizationFunction({
		titleText = if WidgetInfo and WidgetInfo.template then WidgetInfo.template.title else nil,
		descText = if WidgetInfo and WidgetInfo.template then WidgetInfo.template.description else nil
	})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, RowHeight),
		LayoutOrder = Frame.LayoutOrder
	}, {
		EntryButton = ReactModule.createElement(Focusable.ImageButton, {
			Size = UDim2.new(1, -3, 1, 0),
			Position = UDim2.fromOffset(1, 0),
			BackgroundTransparency = 1,
			Image = BackgroundImageDark,
			ScaleType = Enum.ScaleType.Crop,
			[ReactModule.Event.Activated] = v26,
			ClipsDescendants = true,
			SelectionImageObject = UseSelectionCursorFunction(CursorKind.RoundedRect)
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			UIStroke = ReactModule.createElement("UIStroke", {
				Thickness = 1,
				Color = Theme.Divider.Color,
				Transparency = Theme.Divider.Transparency
			}),
			TextFrame = ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 8)
				}),
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24)
				}),
				Title = if UseLocalizationResult.titleText then ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextWrapped = false,
					LayoutOrder = 1,
					AutomaticSize = Enum.AutomaticSize.XY,
					Font = UseStyleResultFont.Header1.Font,
					Text = UseLocalizationResult.titleText,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Header1.RelativeSize,
					TextXAlignment = Enum.TextXAlignment.Left
				}) else nil,
				Description = if UseLocalizationResult.descText then ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextWrapped = false,
					LayoutOrder = 2,
					AutomaticSize = Enum.AutomaticSize.XY,
					Font = UseStyleResultFont.SubHeader1.Font,
					Text = UseLocalizationResult.descText,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.SubHeader1.RelativeSize,
					TextXAlignment = Enum.TextXAlignment.Left
				}) else nil
			}),
			ContentImageLabel = ReactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.fromScale(1, 0.5),
				Image = ContentImageDark,
				Size = UDim2.fromOffset(RowHeight * (if TypeToImage then TypeToImage.widthHeightRatio else 1.5), RowHeight)
			})
		})
	})
end