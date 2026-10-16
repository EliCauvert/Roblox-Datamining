local Parent = script.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.Parent.Parent.React)
local ButtonModule = require(Parent.Button.Button)
local ButtonTypeModule = require(Parent.Button.Enum.ButtonType)
local ComboButtonModule = require(Parent.Button.ComboButton)
local ImagesModule = require(Parent.ImageSet.Images)

local function v6() --[[ Line: 21 ]] end

return function(p1) --[[ Line: 52 | Named "ExperienceActionRow" ]]
	-- upvalues: ReactModule (copy), ComboButtonModule (copy), v6 (copy), ImagesModule (copy), ButtonModule (copy), ButtonTypeModule (copy)
	local IsActionable = p1.isActionable
	local HorizontalPadding = p1.horizontalPadding or 6
	local VerticalPadding = p1.verticalPadding or 6
	local Height = p1.height or 48
	local Text = p1.text
	local Icon = p1.icon
	
	return if p1.onOverflowPressed then ReactModule.createElement(ComboButtonModule, {
		position = UDim2.new(0, HorizontalPadding, 1, -VerticalPadding - 36),
		size = UDim2.new(1, -2 * HorizontalPadding, 0, Height - 2 * VerticalPadding),
		button = {
			text = Text,
			icon = Icon,
			onActivated = p1.onPlayPressed or v6,
			isDisabled = not IsActionable
		},
		overflow = {
			icon = ImagesModule["icons/actions/truncationCollapse"],
			onActivated = p1.onOverflowPressed,
			isDisabled = not IsActionable
		}
	}) else ReactModule.createElement(ButtonModule, {
		buttonType = if p1.buttonType then p1.buttonType else ButtonTypeModule.PrimaryContextual,
		text = Text,
		icon = Icon,
		size = UDim2.new(1, -2 * HorizontalPadding, 0, Height - 2 * VerticalPadding),
		position = UDim2.new(0, HorizontalPadding, 1, -VerticalPadding - 36),
		userInteractionEnabled = IsActionable,
		onActivated = p1.onPlayPressed or v6,
		isDisabled = not IsActionable,
		isLoading = p1.buttonLoading,
		feedbackType = p1.feedbackType,
		DO_NOT_USE_useUIBloxButton = p1.DO_NOT_USE_useUIBloxButton
	})
end