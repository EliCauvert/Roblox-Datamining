local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local ContextualMenu = UIBloxModule.App.Menu.ContextualMenu
local MenuDirection = UIBloxModule.App.Menu.MenuDirection

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy), ImageSetButton (copy), Images (copy), ContextualMenu (copy), MenuDirection (copy)
	local Semantic = UseDesignTokensFunction().Semantic
	local Medium = Semantic.Icon.Size.Medium
	
	return ReactModule.createElement(ImageSetButton, {
		Size = UDim2.fromOffset(Medium, Medium),
		AnchorPoint = Vector2.new(0.25, 0.75),
		Position = UDim2.fromScale(1, 0),
		Image = Images["icons/common/overflow"],
		ImageColor3 = Semantic.Color.Icon.Emphasis.Color3,
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		[ReactModule.Event.Activated] = p1.onActivated
	}, {
		Menu = ReactModule.createElement("Frame", { BackgroundTransparency = 1 }, {
			ContextualMenu = ReactModule.createElement(ContextualMenu, {
				elementHeight = 38,
				closeBackgroundVisible = false,
				buttonProps = p1.buttonProps,
				screenSize = p1.screenSize,
				menuDirection = MenuDirection.Down,
				openPositionY = UDim.new(0, Medium),
				openPositionX = UDim.new(0, -100),
				open = p1.showMenu,
				onDismiss = p1.onDismiss,
				contextMenuWidthOverride = UDim.new(0, 155)
			})
		})
	})
end