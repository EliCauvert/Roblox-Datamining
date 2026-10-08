local parent = script:FindFirstAncestor("UserSearch").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local imageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local useStyle = UIBloxModule.Core.Style.useStyle
local _ = require(script.Parent.Parent.UserSearchTile.useSearchTileButtons)

return function(p1)
	-- upvalues: useStyle (ref), reactModule (ref), imageSetButton (ref), imageSetLabel (ref)
	local var1 = useStyle()
	local searchTileButtonProps = p1.searchTileButtonProps
	
	return reactModule.createElement(imageSetButton, {
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = searchTileButtonProps.backgroundColor or var1.Theme.SystemPrimaryDefault.Color,
		BackgroundTransparency = if searchTileButtonProps.isDisabled then var1.Theme.Overlay.Transparency else var1.Theme.SystemPrimaryDefault.Transparency,
		[reactModule.Event.Activated] = searchTileButtonProps.onActivated
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
		Layout = reactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		Icon = reactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, var1.Tokens.Size.Size_350, 0, var1.Tokens.Size.Size_350),
			Image = searchTileButtonProps.icon,
			ImageColor3 = searchTileButtonProps.imageColor or var1.Theme.SystemPrimaryContent.Color,
			ImageTransparency = if searchTileButtonProps.isDisabled then var1.Theme.Overlay.Transparency else var1.Theme.SystemPrimaryContent.Transparency
		})
	})
end