local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation
local NavOverlayContainerModule = require(Modules.AvatarExperience.Common.Components.NavOverlayContainer)
local GamepadFocusHandlerForPageModule = require(Modules.AvatarExperience.Common.Components.GamepadFocusHandlerForPage)
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local With10ftUIPaddingModule = require(Modules.AvatarExperience.Common.Components.with10ftUIPadding)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local HeaderBar = UIBloxModule.App.Bar.HeaderBar
local WithStyleFunction = UIBloxModule.Style.withStyle
local Images = UIBloxModule.App.ImageSet.Images
local ComponentAssetsCircle17 = Images["component_assets/circle_17"]
local NavOverlayPageContainer = RoactModule.PureComponent:extend("NavOverlayPageContainer")
NavOverlayPageContainer.validateProps = TModule.strictInterface({
	headerBarProps = TModule.strictInterface({
		title = TModule.string,
		renderLeft = TModule.optional(TModule.callback),
		renderRight = TModule.optional(TModule.callback)
	}),
	onDismiss = if require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixGamepadNavigationOnOutfitManagement then TModule.optional(TModule.callback) else TModule.callback,
	ZIndex = TModule.optional(TModule.integer),
	focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else TModule.table,
	[RoactModule.Children] = TModule.table,
	globalGuiInset = TModule.strictInterface({
		left = TModule.integer,
		top = TModule.integer,
		right = TModule.integer,
		bottom = TModule.integer
	}),
	isPortrait = TModule.boolean,
	statusBarHeight = TModule.number,
	designTokens = TModule.any,
	forwardRef = if FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then TModule.optional(TModule.union(TModule.callback, TModule.table)) else nil
})

function NavOverlayPageContainer.renderWithProviders(p1, p2)
	-- upvalues: ComponentAssetsCircle17 (copy), Images (copy), RoactModule (copy), FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), GamepadFocusHandlerForPageModule (copy), NavOverlayContainerModule (copy), HeaderBar (copy), CryoModule (copy)
	local Theme = p2.Theme
	local GlobalGuiInset = p1.props.globalGuiInset
	local BackgroundDefault = Theme.BackgroundDefault
	local t = {}
	
	if not p1.props.isPortrait then
		BackgroundDefault = Theme.BackgroundMuted
		local X: number = ComponentAssetsCircle17.ImageRectSize.X
		local Y = X / 2
		t = {
			BackgroundTransparency = 1,
			Image = ComponentAssetsCircle17.Image,
			ScaleType = Enum.ScaleType.Slice,
			SliceScale = 1 / Images.ImagesResolutionScale,
			SliceCenter = Rect.new(Y - 1, Y - 1, Y + 1, Y),
			ImageRectSize = Vector2.new(X, Y),
			ImageRectOffset = ComponentAssetsCircle17.ImageRectOffset,
			ImageTransparency = Theme.BackgroundDefault.Transparency,
			ImageColor3 = Theme.BackgroundDefault.Color
		}
	end
	local StatusBarHeight: number = p1.props.statusBarHeight
	local DesignTokens = p1.props.designTokens
	
	return RoactModule.createElement("TextButton", {
		BackgroundColor3 = Theme.Overlay.Color,
		BackgroundTransparency = Theme.Overlay.Transparency,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1),
		Text = "",
		AutoButtonColor = false,
		[RoactModule.Ref] = if FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then p1.props.forwardRef else nil,
		[RoactModule.Event.Activated] = p1.props.onDismiss,
		Selectable = (not FFlagAXMigrateAXToGlobalAutofocus or p1.props.onDismiss) and nil
	}, {
		GamepadFocusHandlerForPage = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactModule.createElement(GamepadFocusHandlerForPageModule, {
			captureFocusOnMount = true,
			focusController = p1.props.focusController
		}),
		NavOverlayContainer = RoactModule.createElement(NavOverlayContainerModule, {}, {
			UIListLayout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical
			}),
			StatusBarBackground = RoactModule.createElement("TextButton", {
				LayoutOrder = 1,
				Text = "",
				BorderSizePixel = 0,
				AutoButtonColor = false,
				BackgroundColor3 = BackgroundDefault.Color,
				BackgroundTransparency = p1.props.isPortrait and BackgroundDefault.Transparency or 1,
				Size = UDim2.new(1, 0, 0, StatusBarHeight),
				Selectable = not FFlagAXMigrateAXToGlobalAutofocus and nil
			}),
			HeaderBarBackground = RoactModule.createElement("TextButton", {
				BorderSizePixel = 0,
				Text = "",
				AutoButtonColor = false,
				LayoutOrder = 2,
				BackgroundColor3 = BackgroundDefault.Color,
				BackgroundTransparency = BackgroundDefault.Transparency,
				Size = UDim2.new(1, 0, 0, 44),
				Selectable = not FFlagAXMigrateAXToGlobalAutofocus and nil
			}, {
				HeaderBar = RoactModule.createElement(HeaderBar, CryoModule.Dictionary.join(p1.props.headerBarProps, { backgroundTransparency = 1, barHeight = 44 }))
			}),
			ContentsFrame = RoactModule.createElement("ImageButton", CryoModule.Dictionary.join({
				BorderSizePixel = 0,
				ClipsDescendants = true,
				AutoButtonColor = false,
				LayoutOrder = 3,
				BackgroundColor3 = Theme.BackgroundDefault.Color,
				BackgroundTransparency = Theme.BackgroundDefault.Transparency,
				Position = UDim2.fromOffset(0, 44),
				Size = UDim2.new(1, 0, 1, -(44 + StatusBarHeight) + (if DesignTokens then DesignTokens.bottomPadding else 0))
			}, t), p1.props[RoactModule.Children]),
			BottomInsetBackground = GlobalGuiInset.bottom > 0 and RoactModule.createElement("TextButton", {
				BorderSizePixel = 0,
				Text = "",
				ZIndex = 3,
				AutoButtonColor = false,
				LayoutOrder = 4,
				BackgroundColor3 = Theme.BackgroundDefault.Color,
				BackgroundTransparency = Theme.BackgroundDefault.Transparency,
				Position = UDim2.new(0, 0, 1, 0),
				Size = UDim2.new(1, 0, 0, GlobalGuiInset.bottom),
				Selectable = not FFlagAXMigrateAXToGlobalAutofocus and nil
			})
		})
	})
end

function NavOverlayPageContainer.render(p1)
	-- upvalues: WithStyleFunction (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithProviders(p2)
	end)
end

return RoactRoduxModule.connect(function(p1, _)
	-- upvalues: SelectIsPortraitModule (copy)
	return {
		globalGuiInset = p1.GlobalGuiInset,
		isPortrait = SelectIsPortraitModule(p1),
		statusBarHeight = p1.TopBar.statusBarHeight
	}
end, nil)((With10ftUIPaddingModule(NavOverlayPageContainer)))