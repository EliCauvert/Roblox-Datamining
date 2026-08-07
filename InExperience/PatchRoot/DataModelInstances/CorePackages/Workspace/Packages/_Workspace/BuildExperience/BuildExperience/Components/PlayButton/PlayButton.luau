local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local iconButton = foundationModule.IconButton
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local disabledPlaytestTooltipModule = require(script.Parent.DisabledPlaytestTooltip)

return function(p0) --[[ line: 28 | named "PlayButton" ]]
	-- upvalues: reactModule (ref), buttonVariant (ref), inputSize (ref), iconButton (ref), disabledPlaytestTooltipModule (ref), view (ref)
	local var3 = if p0.isActive then p0.activeIcon else p0.inActiveIcon
	local var4 = p0.isDisabled == true
	local var5, var6 = reactModule.useState(false)
	local var7 = reactModule.useCallback(function() --[[ line: 33 ]]
		-- upvalues: var4 (ref), var6 (ref), p0 (ref)
		if var4 then
			var6(function(p1) --[[ line: 35 ]]
				return not p1
			end)
			
			return
		end
		p0.onActivated()
	end, { var4, p0.onActivated })
	local var8 = reactModule.createElement(iconButton, {
		isCircular = true,
		icon = var3,
		variant = p0.variant or buttonVariant.OverMedia,
		size = inputSize.Medium,
		isDisabled = var4,
		onActivated = var7,
		LayoutOrder = if var4 then nil else p0.LayoutOrder,
		testId = if var4 then nil else "build-header-play-button"
	})
	
	return if var4 then reactModule.createElement(disabledPlaytestTooltipModule, { LayoutOrder = p0.LayoutOrder, isOpen = var5 }, {
		PlayButtonAnchor = reactModule.createElement(view, {
			tag = "auto-xy",
			testId = "build-header-play-button",
			onActivated = var7,
			selection = { Selectable = true }
		}, { Button = var8 })
	}) else var8
end