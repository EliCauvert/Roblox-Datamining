local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local IconButton = FoundationModule.IconButton
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local DisabledPlaytestTooltipModule = require(script.Parent.DisabledPlaytestTooltip)

return function(Frame: Frame) --[[ Line: 28 | Named "PlayButton" ]]
	-- upvalues: ReactModule (copy), ButtonVariant (copy), InputSize (copy), IconButton (copy), DisabledPlaytestTooltipModule (copy), View (copy)
	local ActiveIcon = if Frame.isActive then Frame.activeIcon else Frame.inActiveIcon
	local IsIsDisabled = Frame.isDisabled == true
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 33 ]]
		-- upvalues: IsIsDisabled (copy), UseStateResult2 (copy), Frame (copy)
		if IsIsDisabled then
			UseStateResult2(function(p1): boolean --[[ Line: 35 ]]
				return not p1
			end)
			
			return
		else
			Frame.onActivated()
		end
	end, { IsIsDisabled, Frame.onActivated })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 43 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local Element = ReactModule.createElement(IconButton, {
		isCircular = true,
		icon = ActiveIcon,
		variant = Frame.variant or ButtonVariant.OverMedia,
		size = InputSize.Medium,
		isDisabled = IsIsDisabled,
		onActivated = UseResult,
		LayoutOrder = if IsIsDisabled then nil else Frame.LayoutOrder,
		testId = if IsIsDisabled then nil else "build-header-play-button"
	})
	
	return if IsIsDisabled then ReactModule.createElement(DisabledPlaytestTooltipModule, {
		LayoutOrder = Frame.LayoutOrder,
		isOpen = UseStateResult,
		onPressedOutside = UseResult1
	}, {
		PlayButtonAnchor = ReactModule.createElement(View, {
			tag = "auto-xy",
			testId = "build-header-play-button",
			onActivated = UseResult,
			selection = { Selectable = true }
		}, { Button = Element })
	}) else Element
end