local Parent = script:FindFirstAncestor("TenFootUiGlobalNav").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local Interactable = UIBloxModule.Core.Control.Interactable
local ControlState = UIBloxModule.Core.Control.Enum.ControlState
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local GetIconSizeFunction = UIBloxModule.App.ImageSet.getIconSize
local UseCursorFunction = UIBloxModule.App.SelectionCursor.useCursor

local function getContentStyle(Disabled, p1)
	-- upvalues: ControlState (copy)
	local config = {
		Color = p1.Theme.IconEmphasis.Color,
		Transparency = p1.Theme.IconEmphasis.Transparency
	}
	
	if Disabled == ControlState.Disabled or Disabled == ControlState.Pressed then
		config.Transparency = 0.5 * config.Transparency + 0.5
	end
	return config
end

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseCursorFunction (copy), ReactModule (copy), ControlState (copy), getContentStyle (copy), GetIconSizeFunction (copy), IconSize (copy), Interactable (copy), ImageSetLabel (copy)
	local UseStyleResult = UseStyleFunction()
	local UseCursorResult = UseCursorFunction(UDim.new(0.5, 0), 0)
	local UseStateResult, UseStateResult2 = ReactModule.useState(ControlState.Initialize)
	local ContentStyle = getContentStyle(UseStateResult, UseStyleResult)
	local IconSize1 = GetIconSizeFunction(IconSize.Medium, UseStyleResult)
	
	return ReactModule.createElement(Interactable, {
		AnchorPoint = Vector2.new(0, 0),
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.fromOffset(IconSize1 + 2 * UseStyleResult.Tokens.Size.Size_300, IconSize1 + 2 * UseStyleResult.Tokens.Size.Size_100),
		onStateChanged = UseStateResult2,
		BackgroundTransparency = 1,
		AutoButtonColor = false,
		[ReactModule.Event.Activated] = p1.onActivated,
		SelectionImageObject = UseCursorResult
	}, ReactModule.createElement(ImageSetLabel, {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(IconSize1, IconSize1),
		Image = p1.icon,
		ImageColor3 = ContentStyle.Color,
		ImageTransparency = ContentStyle.Transparency
	}))
end