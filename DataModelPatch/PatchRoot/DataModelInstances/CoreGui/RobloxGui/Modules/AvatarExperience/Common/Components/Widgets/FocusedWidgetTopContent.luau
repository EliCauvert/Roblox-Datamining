local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local Modules = CoreGui.RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local Images = UIBloxModule.App.ImageSet.Images
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDefaultFocusBehaviorFunction = require(CorePackages.Packages.ReactFocusNavigation).useDefaultFocusBehavior
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local FFlagSignalsNavP3gAvatarExperience = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local TooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local WithTooltipFunction = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local UseIsSpatialFunction = require(CorePackages.Workspace.Packages.Responsive).useIsSpatial
local ClearResultsListFocusedWidgetModule = require(Modules.AvatarExperience.Catalog.Actions.ClearResultsListFocusedWidget)
local IconsNavigationPushBack = Images["icons/navigation/pushBack"]
local IconsNavigationClose = Images["icons/navigation/close"]
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals

local function mapTokens(p1)
	-- upvalues: FFlagRenameDeprecatedUIBloxTokens (copy)
	return {
		tooltipIconPadding = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_200 else p1.Global.Size_100,
		horizontalPadding = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_400 else p1.Global.Size_200,
		widgetCloseOrBackButtonSize = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_900 else p1.Global.Size_450,
		size250 = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_500 else p1.Global.Size_250,
		size1300 = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_2600 else p1.Global.Size_1300
	}
end

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseDesignTokensFunction (copy), mapTokens (copy), UseStyleFunction (copy), UseDefaultFocusBehaviorFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), FFlagSignalsNavP3gAvatarExperience (copy), UseSignalStateFunction (copy), UtilsModule (copy), UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy), ClearResultsListFocusedWidgetModule (copy), UseIsSpatialFunction (copy), ImageSetButton (copy), IconsNavigationClose (copy), IconsNavigationPushBack (copy), RoactModule (copy), WithTooltipFunction (copy), TooltipOrientation (copy), CoreGui (copy), IconSize (copy), IconButton (copy), Images (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseDesignTokensResult = UseDesignTokensFunction(mapTokens)
	local UseStyleResult = UseStyleFunction()
	local UseDefaultFocusBehaviorResult, UseDefaultFocusBehaviorResult2 = UseDefaultFocusBehaviorFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		title = if p1.focusedWidgetTitle and p1.focusedWidgetTitle ~= "" then p1.focusedWidgetTitle else nil,
		tooltip = if p1.focusedWidgetTooltip and p1.focusedWidgetTooltip ~= "" then p1.focusedWidgetTooltip else nil
	})
	local _ = UseLocalizationResult.title
	local FocusedWidgetLocalizedTitle = if p1.focusedWidgetLocalizedTitle and p1.focusedWidgetLocalizedTitle ~= "" then p1.focusedWidgetLocalizedTitle else UseLocalizationResult.title
	local FocusedWidgetLocalizedTooltip = if p1.focusedWidgetLocalizedTooltip and p1.focusedWidgetLocalizedTooltip ~= "" then p1.focusedWidgetLocalizedTooltip else UseLocalizationResult.tooltip
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseSignalStateResult = if FFlagSignalsNavP3gAvatarExperience then UseSignalStateFunction(UtilsModule.getIsAvatarExperienceRoute()) else UseSelectorFunction(UtilsModule.isAvatarExperienceRoute, GetUseSelectorDeepEqualsFunction())
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), UseStateResult2 (copy)
		if not UseSignalStateResult then
			UseStateResult2(false)
		end
	end, { UseSignalStateResult })
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local SizeRatio = UseDesignTokensResult.size250 / 2
	local ScaledBaseSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Header2.RelativeSize
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), ClearResultsListFocusedWidgetModule (upval), p1 (copy)
		UseDispatchResult(ClearResultsListFocusedWidgetModule(p1.searchUuid))
		
		if type(p1.onClose) == "function" then
			p1.onClose()
		end
	end, { p1.searchUuid, p1.onClose })
	
	if p1.active then
		local UseResult1 = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(function(p2): boolean
				return not p2
			end)
		end, {})
		local UseIsSpatialResult = UseIsSpatialFunction()
		local NoUseIsSpatialResult: boolean = FocusedWidgetLocalizedTooltip and not UseIsSpatialResult
		
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Selectable = true,
			Size = UDim2.new(1, 0, 0, UseDesignTokensResult.size1300 / 2),
			ref = UseDefaultFocusBehaviorResult2
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, UseDesignTokensResult.horizontalPadding),
				PaddingRight = UDim.new(0, UseDesignTokensResult.horizontalPadding)
			}),
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 8)
			}),
			BackButton = ReactModule.createElement(ImageSetButton, {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, UseDesignTokensResult.widgetCloseOrBackButtonSize, 0, UseDesignTokensResult.widgetCloseOrBackButtonSize),
				Image = if p1.showCloseIcon then IconsNavigationClose else IconsNavigationPushBack,
				ImageColor3 = Theme.SystemPrimaryDefault.Color,
				Visible = true,
				LayoutOrder = 1,
				[RoactModule.Event.Activated] = UseResult,
				ref = UseDefaultFocusBehaviorResult
			}),
			Divider = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 2,
				BackgroundColor3 = Theme.Divider.Color,
				BackgroundTransparency = Theme.Divider.Transparency,
				Size = UDim2.new(0, 1, 0, 16)
			}),
			TitleFrame = if FocusedWidgetLocalizedTitle then RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.fromScale(1, 1)
			}, {
				UIListLayout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, UseDesignTokensResult.tooltipIconPadding)
				}),
				Padding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, SizeRatio),
					PaddingLeft = UDim.new(0, UseDesignTokensResult.size250 / 4),
					PaddingRight = UDim.new(0, UseDesignTokensResult.horizontalPadding),
					PaddingBottom = UDim.new(0, SizeRatio)
				}),
				Title = if FocusedWidgetLocalizedTitle then ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 0,
					Text = FocusedWidgetLocalizedTitle,
					Font = UseStyleResultFont.Header2.Font,
					TextSize = ScaledBaseSize,
					TextColor3 = Theme.TextEmphasis.Color,
					TextTransparency = Theme.TextEmphasis.Transparency,
					Size = UDim2.fromScale(0, 0),
					AutomaticSize = Enum.AutomaticSize.XY,
					TextXAlignment = Enum.TextXAlignment.Left
				}) else nil,
				TitleTooltip = if NoUseIsSpatialResult then WithTooltipFunction({
					useLargeDropShadow = true,
					bodyText = FocusedWidgetLocalizedTooltip
				}, {
					DisplayOrder = 1,
					preferredOrientation = TooltipOrientation.Bottom,
					guiTarget = CoreGui,
					active = UseStateResult
				}, function(p2)
					-- upvalues: ReactModule (upval), IconSize (upval), IconButton (upval), Images (upval), Theme (copy), UseResult1 (copy)
					return ReactModule.createElement("Frame", {
						Size = UDim2.new(0, IconSize.Small, 0, IconSize.Small),
						AutomaticSize = Enum.AutomaticSize.XY,
						BackgroundTransparency = 1,
						[ReactModule.Change.AbsolutePosition] = p2,
						[ReactModule.Change.AbsoluteSize] = p2
					}, {
						ReactModule.createElement(IconButton, {
							icon = Images["icons/actions/info_small"],
							iconSize = IconSize.Small,
							iconColor3 = Theme.SystemPrimaryDefault.Color,
							iconTransparency = Theme.SystemPrimaryDefault.Transparency,
							onActivated = UseResult1
						})
					})
				end) else nil
			}) else nil
		})
	else
		return nil
	end
end