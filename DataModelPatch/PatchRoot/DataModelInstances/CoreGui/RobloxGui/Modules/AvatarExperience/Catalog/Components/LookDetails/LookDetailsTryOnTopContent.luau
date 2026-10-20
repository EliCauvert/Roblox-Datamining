local CorePackages = game:GetService("CorePackages")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local RoactModule = require(CorePackages.Packages.Roact)
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local FlexLayout = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.FlexLayout
local Images = UIBloxModule.App.ImageSet.Images
local IconsNavigationClose = Images["icons/navigation/close"]
local IconsActionsTruncationExpand = Images["icons/actions/truncationExpand"]
local RobuxBalanceModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.Components.RobuxBalance)

return function(p1)
	-- upvalues: FFlagRenameDeprecatedUIBloxTokens (copy), RoactModule (copy), FlexLayout (copy), ImageSetButton (copy), IconsNavigationClose (copy), IconsActionsTruncationExpand (copy), RobuxBalanceModule (copy)
	local StylePalette = p1.stylePalette
	local ShowDropDownButton = p1.showDropDownButton
	local NavigateBack = p1.navigateBack
	local OnCloseButtonPressed = p1.onCloseButtonPressed
	local Size800 = if FFlagRenameDeprecatedUIBloxTokens then StylePalette.Tokens.Size.Size_800 else StylePalette.Tokens.Global.Size_400
	local Size800_1 = if FFlagRenameDeprecatedUIBloxTokens then StylePalette.Tokens.Size.Size_800 else StylePalette.Tokens.Global.Size_400
	local Size400 = if FFlagRenameDeprecatedUIBloxTokens then StylePalette.Tokens.Size.Size_400 else StylePalette.Tokens.Global.Space_200
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.new(0, 0, 1, 0)
	}, {
		FlexLayout = RoactModule.createElement(FlexLayout, {
			flexSlot = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				UIListLayout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, Size400)
				}),
				UIPadding = RoactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, Size400) }),
				CloseButton = if ShowDropDownButton then nil else RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0, 0.5),
					Size = UDim2.new(0, Size800, 0, Size800_1)
				}, {
					CloseButtonIcon = RoactModule.createElement(ImageSetButton, {
						AnchorPoint = Vector2.new(0, 0.5),
						BackgroundTransparency = 1,
						Size = UDim2.new(0, Size800_1, 0, Size800_1),
						Image = IconsNavigationClose,
						ImageColor3 = StylePalette.Theme.SystemPrimaryDefault.Color,
						Position = UDim2.new(0, 0, 0.5, 0),
						[RoactModule.Event.Activated] = NavigateBack
					})
				}) or nil,
				DropDownButton = ShowDropDownButton and RoactModule.createElement(ImageSetButton, {
					AnchorPoint = Vector2.new(0, 1),
					BackgroundTransparency = 1,
					Size = UDim2.new(0, Size800, 0, Size800_1),
					Image = IconsActionsTruncationExpand,
					ImageColor3 = StylePalette.Theme.SystemPrimaryDefault.Color,
					[RoactModule.Event.Activated] = OnCloseButtonPressed
				}) or nil
			}),
			rigidSlot = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(0, 0, 1, 0),
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				UIPadding = RoactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, Size400) }),
				RobuxBalanceContainer = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					Position = UDim2.new(0, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0, 0.5),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					RobuxBalance = RoactModule.createElement(RobuxBalanceModule, { [RoactModule.Ref] = p1.robuxBalanceRef })
				})
			}) or nil
		})
	})
end