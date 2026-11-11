local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local TModule = require(CorePackages.Packages.t)
local DashModule = require(CorePackages.Packages.Dash)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local ActionBar = UIBloxModule.App.Button.ActionBar
local ButtonStack = UIBloxModule.App.Button.ButtonStack
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local ProfilePictureEditorBottomBar = RoactModule.PureComponent:extend("ProfilePictureEditorBottomBar")
ProfilePictureEditorBottomBar.validateProps = TModule.strictInterface({
	button1 = TModule.strictInterface({
		textKey = TModule.string,
		onActivated = TModule.callback,
		isDisabled = TModule.optional(TModule.boolean)
	}),
	button2 = TModule.strictInterface({
		textKey = TModule.string,
		onActivated = TModule.callback,
		isDisabled = TModule.optional(TModule.boolean)
	}),
	designTokens = TModule.table,
	localized = TModule.table,
	onAbsoluteSizeChanged = TModule.optional(TModule.callback),
	NextSelectionUp = TModule.table,
	baseRef = TModule.table
})

function ProfilePictureEditorBottomBar.init(p1)
	-- upvalues: RoactModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy)
	local DesignTokens = p1.props.designTokens
	p1.bottomBarSize, p1.updateBottomBarSize = RoactModule.createBinding(UDim2.new(1, 0, 0, 100 + (if FFlagRenameDeprecatedUIBloxTokens then DesignTokens.Size.Size_100 else DesignTokens.Global.Space_50)))
	
	function p1.onAbsoluteSizeChanged(p2)
		-- upvalues: p1 (copy), FFlagRenameDeprecatedUIBloxTokens (upval), DesignTokens (copy)
		p1.updateBottomBarSize(UDim2.new(1, 0, 0, p2.Y + (if FFlagRenameDeprecatedUIBloxTokens then DesignTokens.Size.Size_100 else DesignTokens.Global.Space_50)))
		
		if p1.props.onAbsoluteSizeChanged then
			p1.props.onAbsoluteSizeChanged(p2)
		end
	end
end

function ProfilePictureEditorBottomBar.render(p1)
	-- upvalues: RoactModule (copy), Focusable (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ActionBar (copy), ButtonStack (copy), ButtonType (copy)
	local Button1 = p1.props.button1
	local Button2 = p1.props.button2
	local DesignTokens = p1.props.designTokens
	local Localized = p1.props.localized
	
	return RoactModule.createElement(Focusable.Frame, {
		Size = p1.bottomBarSize,
		Position = UDim2.fromScale(0, 1),
		AnchorPoint = Vector2.new(0, 1),
		ZIndex = 2,
		BorderSizePixel = 0,
		BackgroundColor3 = (if FFlagRenameDeprecatedUIBloxTokens then DesignTokens.Color.Surface.Surface_0 else DesignTokens.Semantic.Color.Background.Default).Color3,
		NextSelectionUp = p1.props.NextSelectionUp,
		[RoactModule.Ref] = p1.props.baseRef
	}, {
		GradientFrame = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 20),
			Position = UDim2.new(0, 0, 0, -20),
			BackgroundColor3 = (if FFlagRenameDeprecatedUIBloxTokens then DesignTokens.Color.Surface.Surface_0 else DesignTokens.Semantic.Color.Background.Default).Color3
		}, {
			Gradient = RoactModule.createElement("UIGradient", {
				Rotation = -90,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 0),
					NumberSequenceKeypoint.new(1, 1)
				})
			})
		}),
		Padding = RoactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then DesignTokens.Size.Size_100 else DesignTokens.Global.Space_50)
		}),
		ActionBar = RoactModule.createElement(ActionBar, { onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged }, {
			ButtonStack = RoactModule.createElement(ButtonStack, {
				buttons = {
					{
						props = {
							onActivated = Button1.onActivated,
							text = Localized.button1Text,
							isDisabled = Button1.isDisabled
						}
					},
					{
						isDefaultChild = true,
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = Button2.onActivated,
							text = Localized.button2Text,
							isDisabled = Button2.isDisabled
						}
					}
				}
			})
		})
	})
end

function ProfilePictureEditorBottomBarHOC(p1)
	-- upvalues: UseDesignTokensFunction (copy), UseLocalizationFunction (copy), RoactModule (copy), ProfilePictureEditorBottomBar (copy), DashModule (copy)
	return RoactModule.createElement(ProfilePictureEditorBottomBar, DashModule.assign(p1, {
		designTokens = UseDesignTokensFunction(),
		localized = UseLocalizationFunction({
			button1Text = p1.button1.textKey,
			button2Text = p1.button2.textKey
		})
	}))
end

return ProfilePictureEditorBottomBarHOC