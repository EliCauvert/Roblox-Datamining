local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local CryoModule = require(CorePackages.Packages.Cryo)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseSelectedThemeFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.useSelectedTheme
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local IconWithTooltip = require(CorePackages.Workspace.Packages.AppBlox).IconWithTooltip
local TooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local Grid = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit).GridComponents.Grid
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local SponsoredItemsImpressionsTrackerModule = require(Modules.AvatarExperience.Catalog.Components.Search.SponsoredItemsImpressionsTracker)
local SelectSponsoredItemsModule = require(Modules.AvatarExperience.Catalog.Selectors.selectSponsoredItems)
local WidgetListHorizontalMargin = ConstantsModule.WidgetListHorizontalMargin

return function(Frame)
	-- upvalues: UseStyleFunction (copy), UseSelectedThemeFunction (copy), UseLocalizationModule (copy), UseTokensFunction (copy), UseSelectorFunction (copy), SelectSponsoredItemsModule (copy), GetUseSelectorDeepEqualsFunction (copy), ConstantsModule (copy), ReactModule (copy), CryoModule (copy), RoactGamepadModule (copy), WidgetListHorizontalMargin (copy), SponsoredItemsImpressionsTrackerModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), IconWithTooltip (copy), TooltipOrientation (copy), Grid (copy)
	local LayoutOrder = Frame.LayoutOrder
	local NumItemsPerRow = Frame.numItemsPerRow
	local UseStyleResult = UseStyleFunction()
	local IsDark = UseSelectedThemeFunction() == "dark"
	local UseLocalizationModuleResult = UseLocalizationModule({
		sponsored = "Feature.GamePage.Label.Sponsored",
		sponsoredDisclosure = "Feature.GamePage.Label.SponsoredDisclosure"
	})
	local UseTokensResult = UseTokensFunction()
	local UseSelectorResult = UseSelectorFunction(SelectSponsoredItemsModule, GetUseSelectorDeepEqualsFunction())
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseSelectorResult (copy), NumItemsPerRow (copy), CryoModule (upval)
		return if UseSelectorResult and NumItemsPerRow > 0 then CryoModule.List.getRange(UseSelectorResult, 1, NumItemsPerRow) else nil
	end, { UseSelectorResult, NumItemsPerRow })
	local UseStyleResultFont = UseStyleResult.Font
	local Theme = UseStyleResult.Theme
	local BackgroundMuted = if IsDark then Theme.BackgroundMuted else Theme.BackgroundContrast
	
	return ReactModule.createElement(RoactGamepadModule.Focusable.Frame, {
		BorderSizePixel = 0,
		Size = UDim2.new(1, WidgetListHorizontalMargin * 2, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = BackgroundMuted.Transparency,
		BackgroundColor3 = BackgroundMuted.Color,
		LayoutOrder = LayoutOrder,
		onFocusGained = Frame.moveFocusToColumn
	}, {
		ImpressionsTracker = ReactModule.createElement(SponsoredItemsImpressionsTrackerModule, {
			visibleItems = UseMemoResult or {},
			scrollingFrameRef = Frame.scrollingFrameRef,
			sponsoredGridRef = Frame.sponsoredGridRef,
			requestImpressionsSignal = Frame.requestImpressionsSignal,
			indexOffset = NumItemsPerRow * (ConstantsModule.SponsoredItemsRow - 1)
		}),
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, WidgetListHorizontalMargin),
			PaddingRight = UDim.new(0, WidgetListHorizontalMargin),
			PaddingTop = UDim.new(0, 12),
			PaddingBottom = UDim.new(0, 12)
		}),
		UIListLayout = ReactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, 12),
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		}),
		SponsoredLabel = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			SponsoredUIListLayout = ReactModule.createElement("UIListLayout", {
				Padding = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseStyleResult.Tokens.Size.Size_100 else UseStyleResult.Tokens.Global.Size_50),
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			SponsoredTitle = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				LayoutOrder = 1,
				Font = UseStyleResultFont.Body.Font,
				Text = UseLocalizationModuleResult.sponsored,
				AutomaticSize = Enum.AutomaticSize.XY,
				TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Header2.RelativeSize,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextColor3 = Theme.TextMuted.Color
			}),
			SponsoredTooltip = ReactModule.createElement(IconWithTooltip, {
				layoutOrder = 2,
				triggerPointName = "SponsoredTooltip",
				supportTenFootUi = true,
				supportVR = true,
				tooltipOrientation = TooltipOrientation.Right,
				onActivateTooltip = Frame.onActivateTooltipCallback,
				anchorPoint = Vector2.new(1, 0),
				hoverText = UseLocalizationModuleResult.sponsoredDisclosure
			})
		}),
		GridView = ReactModule.createElement(RoactGamepadModule.Focusable.Frame, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			restorePreviousChildFocus = true,
			LayoutOrder = 2,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			NextSelectionRight = Frame.NextSelectionRight,
			NextSelectionUp = Frame.NextSelectionUp,
			NextSelectionDown = Frame.NextSelectionDown,
			ref = Frame.sponsoredGridRef,
			onFocusGained = Frame.onFocusGained
		}, ReactModule.createElement(Grid, {
			itemsPerRow = NumItemsPerRow,
			getItemId = function(p1)
				return p1.id
			end,
			gapHorizontal = UseTokensResult.Gap.Small,
			gapVertical = UseTokensResult.Gap.Large,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			items = UseMemoResult or {},
			renderItem = Frame.renderItem
		}))
	})
end