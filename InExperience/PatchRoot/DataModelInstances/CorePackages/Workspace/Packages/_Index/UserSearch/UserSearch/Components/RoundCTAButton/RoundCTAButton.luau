local Parent = script:FindFirstAncestor("UserSearch").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local _ = require(script.Parent.Parent.UserSearchTile.useSearchTileButtons)

return function(p1) --[[ Line: 22 ]]
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), ImageSetButton (copy), ImageSetLabel (copy)
	local UseStyleResult = UseStyleFunction()
	local SearchTileButtonProps = p1.searchTileButtonProps
	
	return ReactModule.createElement(ImageSetButton, {
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = SearchTileButtonProps.backgroundColor or UseStyleResult.Theme.SystemPrimaryDefault.Color,
		BackgroundTransparency = if SearchTileButtonProps.isDisabled then UseStyleResult.Theme.Overlay.Transparency else UseStyleResult.Theme.SystemPrimaryDefault.Transparency,
		[ReactModule.Event.Activated] = SearchTileButtonProps.onActivated
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
		Layout = ReactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		Icon = ReactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, UseStyleResult.Tokens.Size.Size_350, 0, UseStyleResult.Tokens.Size.Size_350),
			Image = SearchTileButtonProps.icon,
			ImageColor3 = SearchTileButtonProps.imageColor or UseStyleResult.Theme.SystemPrimaryContent.Color,
			ImageTransparency = if SearchTileButtonProps.isDisabled then UseStyleResult.Theme.Overlay.Transparency else UseStyleResult.Theme.SystemPrimaryContent.Transparency
		})
	})
end