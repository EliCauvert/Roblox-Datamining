-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:01 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent.Parent
local reactModule = require(parent.Parent.Parent.React)
local buttonModule = require(parent.Button.Button)
local buttonTypeModule = require(parent.Button.Enum.ButtonType)
local comboButtonModule = require(parent.Button.ComboButton)
local imagesModule = require(parent.ImageSet.Images)

local var5 = function() --[[ line: 21 ]] end

return function(p0) --[[ line: 52 | named "ExperienceActionRow" ]]
	-- upvalues: reactModule (ref), comboButtonModule (ref), var5 (ref), imagesModule (ref), buttonModule (ref), buttonTypeModule (ref)
	local isActionable = p0.isActionable
	local horizontalPadding = p0.horizontalPadding or 6
	local verticalPadding = p0.verticalPadding or 6
	local height = p0.height or 48
	local text = p0.text
	local icon = p0.icon
	
	return if p0.onOverflowPressed then reactModule.createElement(comboButtonModule, {
		position = UDim2.new(0, horizontalPadding, 1, (-verticalPadding) - 36),
		size = UDim2.new(1, -2 * horizontalPadding, 0, height - 2 * verticalPadding),
		button = {
			text = text,
			icon = icon,
			onActivated = p0.onPlayPressed or var5,
			isDisabled = not isActionable
		},
		overflow = {
			icon = imagesModule["icons/actions/truncationCollapse"],
			onActivated = p0.onOverflowPressed,
			isDisabled = not isActionable
		}
	}) else reactModule.createElement(buttonModule, {
		buttonType = if p0.buttonType then p0.buttonType else buttonTypeModule.PrimaryContextual,
		text = text,
		icon = icon,
		size = UDim2.new(1, -2 * horizontalPadding, 0, height - 2 * verticalPadding),
		position = UDim2.new(0, horizontalPadding, 1, (-verticalPadding) - 36),
		userInteractionEnabled = isActionable,
		onActivated = p0.onPlayPressed or var5,
		isDisabled = not isActionable,
		isLoading = p0.buttonLoading,
		feedbackType = p0.feedbackType,
		DO_NOT_USE_useUIBloxButton = p0.DO_NOT_USE_useUIBloxButton
	})
end