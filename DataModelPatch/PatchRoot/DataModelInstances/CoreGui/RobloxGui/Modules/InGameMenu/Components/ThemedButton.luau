local CorePackages = game:GetService("CorePackages")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local UIBlox = InGameMenuDependenciesModule.UIBlox
local T = InGameMenuDependenciesModule.t
local Parent = script.Parent.Parent
local AssetsModule = require(Parent.Resources.Assets)
local DivideTransparencyModule = require(Parent.Utility.divideTransparency)
local ImageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local WithSelectionCursorProviderFunction = UIBlox.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBlox.App.SelectionImage.CursorKind
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local ThemedButton = Roact.PureComponent:extend("ThemedButton")
ThemedButton.validateProps = T.strictInterface({
	normalThemeKey = T.string,
	hoverThemeKey = T.string,
	imageProps = T.strictInterface({
		Image = T.union(T.string, T.table),
		ScaleType = T.enum(Enum.ScaleType),
		SliceCenter = T.Rect
	}),
	enabled = T.optional(T.boolean),
	renderChildren = T.callback,
	onActivated = T.callback,
	AnchorPoint = T.optional(T.Vector2),
	LayoutOrder = T.optional(T.integer),
	Position = T.optional(T.UDim2),
	Size = T.optional(T.UDim2),
	Visible = T.optional(T.boolean),
	ButtonRef = T.optional(T.union(T.callback, T.table))
})
ThemedButton.defaultProps = {
	enabled = true,
	imageProps = AssetsModule.Images.RoundedRect
}

function ThemedButton.init(p1)
	p1:setState({ hover = false, press = false })
end

function ThemedButton.renderWithSelectionCursor(p1, Callback)
	-- upvalues: WithFoundationOrUIBloxStyleFunction (copy), DivideTransparencyModule (copy), Roact (copy), ImageSetButton (copy), CursorKind (copy)
	local Props = p1.props
	local HoverThemeKey = if Props.enabled and p1.state.hover then Props.hoverThemeKey else Props.normalThemeKey
	
	return WithFoundationOrUIBloxStyleFunction(function(p2)
		return {
			Theme = {
				BackgroundDefault = {
					Color = p2.Color.Surface.Surface_0.Color3,
					Transparency = p2.Color.Surface.Surface_0.Transparency
				},
				BackgroundContrast = {
					Color = p2.Color.Surface.Surface_100.Color3,
					Transparency = p2.Color.Surface.Surface_100.Transparency
				},
				BackgroundMuted = {
					Color = p2.Color.Surface.Surface_200.Color3,
					Transparency = p2.Color.Surface.Surface_200.Transparency
				},
				BackgroundUIDefault = {
					Color = p2.Color.Surface.Surface_300.Color3,
					Transparency = p2.Color.Surface.Surface_300.Transparency
				},
				BackgroundUIContrast = {
					Color = p2.Color.OverMedia.OverMedia_0.Color3,
					Transparency = p2.Color.OverMedia.OverMedia_0.Transparency
				},
				BackgroundOnHover = {
					Color = p2.Color.State.Hover.Color3,
					Transparency = p2.Color.State.Hover.Transparency
				},
				BackgroundOnPress = {
					Color = p2.Color.State.Press.Color3,
					Transparency = p2.Color.State.Press.Transparency
				},
				UIDefault = {
					Color = p2.Color.Shift.Shift_200.Color3,
					Transparency = p2.Color.Shift.Shift_200.Transparency
				},
				UIMuted = {
					Color = p2.Color.Shift.Shift_100.Color3,
					Transparency = p2.Color.Shift.Shift_100.Transparency
				},
				UIEmphasis = {
					Color = p2.Color.Shift.Shift_400.Color3,
					Transparency = p2.Color.Shift.Shift_400.Transparency
				},
				ContextualPrimaryDefault = {
					Color = p2.Color.ActionEmphasis.Background.Color3,
					Transparency = p2.Color.ActionEmphasis.Background.Transparency
				},
				ContextualPrimaryContent = {
					Color = p2.Color.ActionEmphasis.Foreground.Color3,
					Transparency = p2.Color.ActionEmphasis.Foreground.Transparency
				},
				SystemPrimaryDefault = {
					Color = p2.Color.ActionSubEmphasis.Background.Color3,
					Transparency = p2.Color.ActionSubEmphasis.Background.Transparency
				},
				SystemPrimaryContent = {
					Color = p2.Color.ActionSubEmphasis.Foreground.Color3,
					Transparency = p2.Color.ActionSubEmphasis.Foreground.Transparency
				},
				IconDefault = {
					Color = p2.Color.Content.Default.Color3,
					Transparency = p2.Color.Content.Default.Transparency
				},
				IconEmphasis = {
					Color = p2.Color.Content.Emphasis.Color3,
					Transparency = p2.Color.Content.Emphasis.Transparency
				},
				IconOnHover = {
					Color = p2.Color.Content.Emphasis.Color3,
					Transparency = p2.Color.Content.Emphasis.Transparency
				},
				TextEmphasis = {
					Color = p2.Color.Content.Emphasis.Color3,
					Transparency = p2.Color.Content.Emphasis.Transparency
				},
				TextDefault = {
					Color = p2.Color.Content.Default.Color3,
					Transparency = p2.Color.Content.Default.Transparency
				},
				TextMuted = {
					Color = p2.Color.Content.Muted.Color3,
					Transparency = p2.Color.Content.Muted.Transparency
				},
				TextLink = {
					Color = p2.Color.Content.Link.Color3,
					Transparency = p2.Color.Content.Link.Transparency
				},
				Divider = {
					Color = p2.Color.Stroke.Emphasis.Color3,
					Transparency = p2.Color.Stroke.Emphasis.Transparency
				},
				Overlay = {
					Color = p2.Color.Common.Scrim.Color3,
					Transparency = p2.Color.Common.Scrim.Transparency
				},
				DropShadow = {
					Color = p2.Color.Common.Shadow.Color3,
					Transparency = p2.Color.Common.Shadow.Transparency
				},
				NavigationBar = {
					Color = p2.Color.Common.NavigationBar.Color3,
					Transparency = p2.Color.Common.NavigationBar.Transparency
				},
				PlaceHolder = {
					Color = p2.Color.Common.Shimmer.Color3,
					Transparency = p2.Color.Common.Shimmer.Transparency
				},
				OnlineStatus = {
					Color = p2.Color.System.Success.Color3,
					Transparency = p2.Color.System.Success.Transparency
				},
				OfflineStatus = {
					Color = p2.Color.System.Neutral.Color3,
					Transparency = p2.Color.System.Neutral.Transparency
				},
				Success = {
					Color = p2.Color.System.Success.Color3,
					Transparency = p2.Color.System.Success.Transparency
				},
				Alert = {
					Color = p2.Color.System.Alert.Color3,
					Transparency = p2.Color.System.Alert.Transparency
				},
				Badge = {
					Color = p2.Color.System.Contrast.Color3,
					Transparency = p2.Color.System.Contrast.Transparency
				},
				BadgeContent = {
					Color = p2.Inverse.Content.Emphasis.Color3,
					Transparency = p2.Inverse.Content.Emphasis.Transparency
				},
				SecondaryDefault = {
					Color = p2.Color.Extended.White.White_70.Color3,
					Transparency = p2.Color.Extended.White.White_70.Transparency
				},
				SecondaryOnHover = {
					Color = p2.Color.Extended.White.White_100.Color3,
					Transparency = p2.Color.Extended.White.White_100.Transparency
				}
			}
		}
	end, function(p2)
		-- upvalues: HoverThemeKey (ref), DivideTransparencyModule (upval), p1 (copy), Props (copy), Roact (upval), ImageSetButton (upval), Callback (copy), CursorKind (upval)
		local ThemeEntry = p2.Theme[HoverThemeKey]
		assert(ThemeEntry ~= nil, "theme key " .. HoverThemeKey .. " is nil")
		local DivideTransparencyModuleResult = if Props.enabled then DivideTransparencyModule(ThemeEntry.Transparency, if p1.state.press then 2 else 1) else 0.5
		
		return Roact.createElement(ImageSetButton, {
			Visible = Props.Visible,
			BackgroundTransparency = 1,
			ImageColor3 = ThemeEntry.Color,
			Position = Props.Position,
			Size = Props.Size,
			AnchorPoint = Props.AnchorPoint,
			ImageTransparency = DivideTransparencyModuleResult,
			LayoutOrder = Props.LayoutOrder,
			ScaleType = Props.imageProps.ScaleType,
			SliceCenter = Props.imageProps.SliceCenter,
			Image = Props.imageProps.Image,
			SelectionImageObject = Callback(CursorKind.RoundedRectNoInset),
			[Roact.Event.Activated] = function()
				-- upvalues: Props (upval)
				if Props.enabled then
					Props.onActivated()
				end
			end,
			[Roact.Event.MouseEnter] = function()
				-- upvalues: p1 (upval)
				p1:setState({ hover = true })
			end,
			[Roact.Event.MouseLeave] = function()
				-- upvalues: p1 (upval)
				p1:setState({ hover = false, press = false })
			end,
			[Roact.Event.InputBegan] = function(_, Input)
				-- upvalues: p1 (upval)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					p1:setState({ press = true })
				end
			end,
			[Roact.Event.InputEnded] = function(_, Input)
				-- upvalues: p1 (upval)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					p1:setState({ press = false })
				end
			end,
			[Roact.Ref] = p1.props.ButtonRef
		}, Props.renderChildren(DivideTransparencyModuleResult, Props.enabled and p1.state.hover, Props.enabled and p1.state.press))
	end)
end

function ThemedButton.render(p1)
	-- upvalues: WithSelectionCursorProviderFunction (copy)
	return WithSelectionCursorProviderFunction(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithSelectionCursor(p2)
	end)
end

return ThemedButton