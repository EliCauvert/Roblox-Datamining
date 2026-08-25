local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local t = inGameMenuDependenciesModule.t
local parent = script.Parent.Parent
local assetsModule = require(parent.Resources.Assets)
local divideTransparencyModule = require(parent.Utility.divideTransparency)
local imageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local foundationModule = require(corePackagesService.Packages.Foundation)
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local var5 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var6 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local themedButton = roact.PureComponent:extend("ThemedButton")
themedButton.validateProps = t.strictInterface({
	normalThemeKey = t.string,
	hoverThemeKey = t.string,
	imageProps = t.strictInterface({
		Image = t.union(t.string, t.table),
		ScaleType = t.enum(Enum.ScaleType),
		SliceCenter = t.Rect
	}),
	enabled = t.optional(t.boolean),
	renderChildren = t.callback,
	onActivated = t.callback,
	AnchorPoint = t.optional(t.Vector2),
	LayoutOrder = t.optional(t.integer),
	Position = t.optional(t.UDim2),
	Size = t.optional(t.UDim2),
	Visible = t.optional(t.boolean),
	ButtonRef = t.optional(t.union(t.callback, t.table))
})
themedButton.defaultProps = {
	enabled = true,
	imageProps = assetsModule.Images.RoundedRect
}

function themedButton.init(p0)
	p0:setState({ hover = false, press = false })
end

function themedButton.renderWithSelectionCursor(p1, p2)
	-- upvalues: withFoundationOrUIBloxStyle (ref), divideTransparencyModule (ref), roact (ref), imageSetButton (ref), var6 (ref)
	local props = p1.props
	local var8 = if props.enabled and p1.state.hover then props.hoverThemeKey else props.normalThemeKey
	
	return withFoundationOrUIBloxStyle(function(p3)
		return {
			Theme = {
				BackgroundDefault = {
					Color = p3.Color.Surface.Surface_0.Color3,
					Transparency = p3.Color.Surface.Surface_0.Transparency
				},
				BackgroundContrast = {
					Color = p3.Color.Surface.Surface_100.Color3,
					Transparency = p3.Color.Surface.Surface_100.Transparency
				},
				BackgroundMuted = {
					Color = p3.Color.Surface.Surface_200.Color3,
					Transparency = p3.Color.Surface.Surface_200.Transparency
				},
				BackgroundUIDefault = {
					Color = p3.Color.Surface.Surface_300.Color3,
					Transparency = p3.Color.Surface.Surface_300.Transparency
				},
				BackgroundUIContrast = {
					Color = p3.Color.OverMedia.OverMedia_0.Color3,
					Transparency = p3.Color.OverMedia.OverMedia_0.Transparency
				},
				BackgroundOnHover = {
					Color = p3.Color.State.Hover.Color3,
					Transparency = p3.Color.State.Hover.Transparency
				},
				BackgroundOnPress = {
					Color = p3.Color.State.Press.Color3,
					Transparency = p3.Color.State.Press.Transparency
				},
				UIDefault = {
					Color = p3.Color.Shift.Shift_200.Color3,
					Transparency = p3.Color.Shift.Shift_200.Transparency
				},
				UIMuted = {
					Color = p3.Color.Shift.Shift_100.Color3,
					Transparency = p3.Color.Shift.Shift_100.Transparency
				},
				UIEmphasis = {
					Color = p3.Color.Shift.Shift_400.Color3,
					Transparency = p3.Color.Shift.Shift_400.Transparency
				},
				ContextualPrimaryDefault = {
					Color = p3.Color.ActionEmphasis.Background.Color3,
					Transparency = p3.Color.ActionEmphasis.Background.Transparency
				},
				ContextualPrimaryContent = {
					Color = p3.Color.ActionEmphasis.Foreground.Color3,
					Transparency = p3.Color.ActionEmphasis.Foreground.Transparency
				},
				SystemPrimaryDefault = {
					Color = p3.Color.ActionSubEmphasis.Background.Color3,
					Transparency = p3.Color.ActionSubEmphasis.Background.Transparency
				},
				SystemPrimaryContent = {
					Color = p3.Color.ActionSubEmphasis.Foreground.Color3,
					Transparency = p3.Color.ActionSubEmphasis.Foreground.Transparency
				},
				IconDefault = {
					Color = p3.Color.Content.Default.Color3,
					Transparency = p3.Color.Content.Default.Transparency
				},
				IconEmphasis = {
					Color = p3.Color.Content.Emphasis.Color3,
					Transparency = p3.Color.Content.Emphasis.Transparency
				},
				IconOnHover = {
					Color = p3.Color.Content.Emphasis.Color3,
					Transparency = p3.Color.Content.Emphasis.Transparency
				},
				TextEmphasis = {
					Color = p3.Color.Content.Emphasis.Color3,
					Transparency = p3.Color.Content.Emphasis.Transparency
				},
				TextDefault = {
					Color = p3.Color.Content.Default.Color3,
					Transparency = p3.Color.Content.Default.Transparency
				},
				TextMuted = {
					Color = p3.Color.Content.Muted.Color3,
					Transparency = p3.Color.Content.Muted.Transparency
				},
				TextLink = {
					Color = p3.Color.Content.Link.Color3,
					Transparency = p3.Color.Content.Link.Transparency
				},
				Divider = {
					Color = p3.Color.Stroke.Emphasis.Color3,
					Transparency = p3.Color.Stroke.Emphasis.Transparency
				},
				Overlay = {
					Color = p3.Color.Common.Scrim.Color3,
					Transparency = p3.Color.Common.Scrim.Transparency
				},
				DropShadow = {
					Color = p3.Color.Common.Shadow.Color3,
					Transparency = p3.Color.Common.Shadow.Transparency
				},
				NavigationBar = {
					Color = p3.Color.Common.NavigationBar.Color3,
					Transparency = p3.Color.Common.NavigationBar.Transparency
				},
				PlaceHolder = {
					Color = p3.Color.Common.Shimmer.Color3,
					Transparency = p3.Color.Common.Shimmer.Transparency
				},
				OnlineStatus = {
					Color = p3.Color.System.Success.Color3,
					Transparency = p3.Color.System.Success.Transparency
				},
				OfflineStatus = {
					Color = p3.Color.System.Neutral.Color3,
					Transparency = p3.Color.System.Neutral.Transparency
				},
				Success = {
					Color = p3.Color.System.Success.Color3,
					Transparency = p3.Color.System.Success.Transparency
				},
				Alert = {
					Color = p3.Color.System.Alert.Color3,
					Transparency = p3.Color.System.Alert.Transparency
				},
				Badge = {
					Color = p3.Color.System.Contrast.Color3,
					Transparency = p3.Color.System.Contrast.Transparency
				},
				BadgeContent = {
					Color = p3.Inverse.Content.Emphasis.Color3,
					Transparency = p3.Inverse.Content.Emphasis.Transparency
				},
				SecondaryDefault = {
					Color = p3.Color.Extended.White.White_70.Color3,
					Transparency = p3.Color.Extended.White.White_70.Transparency
				},
				SecondaryOnHover = {
					Color = p3.Color.Extended.White.White_100.Color3,
					Transparency = p3.Color.Extended.White.White_100.Transparency
				}
			}
		}
	end, function(p4)
		-- upvalues: var8 (write), divideTransparencyModule (copy), p1 (ref), props (ref), roact (copy), imageSetButton (copy), p2 (ref), var6 (copy)
		local var9 = p4.Theme[var8]
		assert(var9 ~= nil, "theme key " .. var8 .. " is nil")
		local var10 = if not props.enabled then 0.5 else divideTransparencyModule(var9.Transparency, if p1.state.press then 2 else 1)
		
		return roact.createElement(imageSetButton, {
			Visible = props.Visible,
			BackgroundTransparency = 1,
			ImageColor3 = var9.Color,
			Position = props.Position,
			Size = props.Size,
			AnchorPoint = props.AnchorPoint,
			ImageTransparency = var10,
			LayoutOrder = props.LayoutOrder,
			ScaleType = props.imageProps.ScaleType,
			SliceCenter = props.imageProps.SliceCenter,
			Image = props.imageProps.Image,
			SelectionImageObject = p2(var6.RoundedRectNoInset),
			[roact.Event.Activated] = function()
				-- upvalues: props (copy)
				if props.enabled then
					props.onActivated()
				end
			end,
			[roact.Event.MouseEnter] = function()
				-- upvalues: p1 (copy)
				p1:setState({ hover = true })
			end,
			[roact.Event.MouseLeave] = function()
				-- upvalues: p1 (copy)
				p1:setState({ hover = false, press = false })
			end,
			[roact.Event.InputBegan] = function(_, p5)
				-- upvalues: p1 (copy)
				if p5.UserInputType == Enum.UserInputType.MouseButton1 or p5.UserInputType == Enum.UserInputType.Touch then
					p1:setState({ press = true })
				end
			end,
			[roact.Event.InputEnded] = function(_, p6)
				-- upvalues: p1 (copy)
				if p6.UserInputType == Enum.UserInputType.MouseButton1 or p6.UserInputType == Enum.UserInputType.Touch then
					p1:setState({ press = false })
				end
			end,
			[roact.Ref] = p1.props.ButtonRef
		}, props.renderChildren(var10, props.enabled and p1.state.hover, props.enabled and p1.state.press))
	end)
end

function themedButton.render(p7)
	-- upvalues: var5 (ref)
	return var5(function(p8)
		-- upvalues: p7 (ref)
		return p7:renderWithSelectionCursor(p8)
	end)
end

return themedButton