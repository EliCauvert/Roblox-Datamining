local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local iconButton = foundationModule.IconButton
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local disabledPlaytestTooltipModule = require(script.Parent.DisabledPlaytestTooltip)
local fFlagBuildExperienceTooltipsLightDismissModule = require(buildExperience.Flags.FFlagBuildExperienceTooltipsLightDismiss)

return function(p1)
	-- upvalues: reactModule (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref), buttonVariant (ref), inputSize (ref), iconButton (ref), disabledPlaytestTooltipModule (ref), view (ref)
	local var1 = if p1.isActive then p1.activeIcon else p1.inActiveIcon
	local var2 = p1.isDisabled == true
	local var3, var4 = reactModule.useState(false)
	local var5 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), var4 (ref), p1 (ref)
		if var2 then
			var4(function(p2)
				return not p2
			end)
			
			return
		end
		p1.onActivated()
	end, { var2, p1.onActivated })
	local var6 = reactModule.createElement(iconButton, {
		isCircular = true,
		icon = var1,
		variant = p1.variant or buttonVariant.OverMedia,
		size = inputSize.Medium,
		isDisabled = var2,
		onActivated = var5,
		LayoutOrder = if var2 then nil else p1.LayoutOrder,
		testId = if var2 then nil else "build-header-play-button"
	})
	
	return if var2 then reactModule.createElement(disabledPlaytestTooltipModule, {
		LayoutOrder = p1.LayoutOrder,
		isOpen = var3,
		onPressedOutside = if fFlagBuildExperienceTooltipsLightDismissModule then reactModule.useCallback(function()
			-- upvalues: var4 (ref)
			var4(false)
		end, {}) else nil
	}, {
		PlayButtonAnchor = reactModule.createElement(view, {
			tag = "auto-xy",
			testId = "build-header-play-button",
			onActivated = var5,
			selection = { Selectable = true }
		}, { Button = var6 })
	}) else var6
end