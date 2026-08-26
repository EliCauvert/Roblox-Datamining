local parent = script.Parent.Parent.Parent.Parent
local reactModule = require(parent.Parent.Parent.React)
local buttonModule = require(parent.Button.Button)
local buttonTypeModule = require(parent.Button.Enum.ButtonType)
local comboButtonModule = require(parent.Button.ComboButton)
local imagesModule = require(parent.ImageSet.Images)

local var1 = function() end

return function(p1)
	-- upvalues: reactModule (ref), comboButtonModule (ref), var1 (ref), imagesModule (ref), buttonModule (ref), buttonTypeModule (ref)
	local isActionable = p1.isActionable
	local horizontalPadding = p1.horizontalPadding or 6
	local verticalPadding = p1.verticalPadding or 6
	local height = p1.height or 48
	local text = p1.text
	local icon = p1.icon
	
	return if p1.onOverflowPressed then reactModule.createElement(comboButtonModule, {
		position = UDim2.new(0, horizontalPadding, 1, (-verticalPadding) - 36),
		size = UDim2.new(1, -2 * horizontalPadding, 0, height - 2 * verticalPadding),
		button = {
			text = text,
			icon = icon,
			onActivated = p1.onPlayPressed or var1,
			isDisabled = not isActionable
		},
		overflow = {
			icon = imagesModule["icons/actions/truncationCollapse"],
			onActivated = p1.onOverflowPressed,
			isDisabled = not isActionable
		}
	}) else reactModule.createElement(buttonModule, {
		buttonType = if p1.buttonType then p1.buttonType else buttonTypeModule.PrimaryContextual,
		text = text,
		icon = icon,
		size = UDim2.new(1, -2 * horizontalPadding, 0, height - 2 * verticalPadding),
		position = UDim2.new(0, horizontalPadding, 1, (-verticalPadding) - 36),
		userInteractionEnabled = isActionable,
		onActivated = p1.onPlayPressed or var1,
		isDisabled = not isActionable,
		isLoading = p1.buttonLoading,
		feedbackType = p1.feedbackType,
		DO_NOT_USE_useUIBloxButton = p1.DO_NOT_USE_useUIBloxButton
	})
end