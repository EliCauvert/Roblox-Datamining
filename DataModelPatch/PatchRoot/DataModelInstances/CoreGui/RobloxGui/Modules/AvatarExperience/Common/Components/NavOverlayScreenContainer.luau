local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local NavOverlayContainerModule = require(Modules.AvatarExperience.Common.Components.NavOverlayContainer)
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector

local function selectGlobalGuiInset(p1)
	return p1.GlobalGuiInset
end

local function selectStatusBarHeight(p1)
	return p1.TopBar.statusBarHeight
end

return (require(Modules.AvatarExperience.Common.Components.with10ftUIPadding)(function(p1)
	-- upvalues: UseStyleFunction (copy), UseSelectorFunction (copy), selectGlobalGuiInset (copy), SelectIsPortraitModule (copy), selectStatusBarHeight (copy), ReactModule (copy), FoundationModule (copy), FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation (copy), NavOverlayContainerModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy)
	local Theme = UseStyleFunction().Theme
	local UseSelectorResult = UseSelectorFunction(selectGlobalGuiInset)
	local UseSelectorResult1 = UseSelectorFunction(SelectIsPortraitModule)
	local UseSelectorResult2: number = UseSelectorFunction(selectStatusBarHeight)
	local BackgroundDefault = Theme.BackgroundDefault
	local DesignTokens = p1.designTokens
	local HeaderBarProps = p1.headerBarProps
	
	return ReactModule.createElement("TextButton", {
		BackgroundColor3 = Theme.Overlay.Color,
		BackgroundTransparency = Theme.Overlay.Transparency,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1),
		Text = "",
		AutoButtonColor = false,
		ref = if FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then p1.forwardRef else nil,
		[ReactModule.Event.Activated] = p1.onDismiss,
		Selectable = if p1.onDismiss then nil else false
	}, {
		NavOverlayContainer = ReactModule.createElement(NavOverlayContainerModule, { ZIndex = p1.ZIndex }, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical
			}),
			StatusBarBackground = ReactModule.createElement("TextButton", {
				LayoutOrder = 1,
				Text = "",
				BorderSizePixel = 0,
				AutoButtonColor = false,
				BackgroundColor3 = BackgroundDefault.Color,
				BackgroundTransparency = if UseSelectorResult1 then BackgroundDefault.Transparency else 1,
				Size = UDim2.new(1, 0, 0, UseSelectorResult2),
				Selectable = not FFlagAXMigrateAXToGlobalAutofocus and nil
			}),
			HeaderBarBackground = ReactModule.createElement("TextButton", {
				BorderSizePixel = 0,
				Text = "",
				AutoButtonColor = false,
				LayoutOrder = 2,
				BackgroundColor3 = BackgroundDefault.Color,
				BackgroundTransparency = BackgroundDefault.Transparency,
				Size = UDim2.new(1, 0, 0, 44),
				Selectable = not FFlagAXMigrateAXToGlobalAutofocus and nil
			}, {
				ManualHeader = ReactModule.createElement(FoundationModule.View, {
					tag = "row align-y-center size-full padding-x-small",
					BackgroundTransparency = 1
				}, {
					Left = if HeaderBarProps.renderLeft then ReactModule.createElement(FoundationModule.View, {
						tag = "auto-xy",
						LayoutOrder = 1,
						flexItem = { FlexMode = Enum.UIFlexMode.None }
					}, { Content = HeaderBarProps.renderLeft() }) else nil,
					TitleRegion = ReactModule.createElement(FoundationModule.View, {
						tag = "fill size-full-0 auto-xy clip",
						LayoutOrder = 2,
						flexItem = { FlexMode = Enum.UIFlexMode.Fill }
					}, {
						Title = ReactModule.createElement(FoundationModule.Text, {
							tag = "size-full-0 auto-y text-heading-small content-emphasis",
							Text = HeaderBarProps.title,
							TextTruncate = Enum.TextTruncate.AtEnd,
							TextXAlignment = if UseSelectorResult1 then Enum.TextXAlignment.Center else Enum.TextXAlignment.Left
						})
					}),
					Right = if HeaderBarProps.renderRight then ReactModule.createElement(FoundationModule.View, {
						tag = "auto-xy",
						LayoutOrder = 3,
						flexItem = { FlexMode = Enum.UIFlexMode.None }
					}, { Content = HeaderBarProps.renderRight() }) else nil
				})
			}),
			ContentsFrame = ReactModule.createElement("ImageButton", {
				BorderSizePixel = 0,
				ClipsDescendants = true,
				AutoButtonColor = false,
				LayoutOrder = 3,
				BackgroundColor3 = Theme.BackgroundDefault.Color,
				BackgroundTransparency = Theme.BackgroundDefault.Transparency,
				Position = UDim2.fromOffset(0, 44),
				Size = UDim2.new(1, 0, 1, -(44 + UseSelectorResult2) + (if DesignTokens then DesignTokens.bottomPadding else 0))
			}, p1.children),
			BottomInsetBackground = if UseSelectorResult.bottom > 0 then ReactModule.createElement("TextButton", {
				BorderSizePixel = 0,
				Text = "",
				ZIndex = 3,
				AutoButtonColor = false,
				LayoutOrder = 4,
				BackgroundColor3 = Theme.BackgroundDefault.Color,
				BackgroundTransparency = Theme.BackgroundDefault.Transparency,
				Position = UDim2.new(0, 0, 1, 0),
				Size = UDim2.new(1, 0, 0, UseSelectorResult.bottom),
				Selectable = not FFlagAXMigrateAXToGlobalAutofocus and nil
			}) else nil
		})
	})
end))