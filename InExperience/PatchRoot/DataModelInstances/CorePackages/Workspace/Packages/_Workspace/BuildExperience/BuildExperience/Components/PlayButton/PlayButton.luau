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

return function(p0) --[[ line: 29 | named "PlayButton" ]]
	-- upvalues: reactModule (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref), buttonVariant (ref), inputSize (ref), iconButton (ref), disabledPlaytestTooltipModule (ref), view (ref)
	local var5 = if p0.isActive then p0.activeIcon else p0.inActiveIcon
	local var6 = p0.isDisabled == true
	local var7, var8 = reactModule.useState(false)
	local var9 = reactModule.useCallback(function() --[[ line: 34 ]]
		-- upvalues: var6 (ref), var8 (ref), p0 (ref)
		if var6 then
			var8(function(p1) --[[ line: 36 ]]
				return not p1
			end)
			
			return
		end
		p0.onActivated()
	end, { var6, p0.onActivated })
	local var10 = reactModule.createElement(iconButton, {
		isCircular = true,
		icon = var5,
		variant = p0.variant or buttonVariant.OverMedia,
		size = inputSize.Medium,
		isDisabled = var6,
		onActivated = var9,
		LayoutOrder = if var6 then nil else p0.LayoutOrder,
		testId = if var6 then nil else "build-header-play-button"
	})
	
	return if var6 then reactModule.createElement(disabledPlaytestTooltipModule, {
		LayoutOrder = p0.LayoutOrder,
		isOpen = var7,
		onPressedOutside = if fFlagBuildExperienceTooltipsLightDismissModule then reactModule.useCallback(function() --[[ line: 45 ]]
			-- upvalues: var8 (ref)
			var8(false)
		end, {}) else nil
	}, {
		PlayButtonAnchor = reactModule.createElement(view, {
			tag = "auto-xy",
			testId = "build-header-play-button",
			onActivated = var9,
			selection = { Selectable = true }
		}, { Button = var10 })
	}) else var10
end