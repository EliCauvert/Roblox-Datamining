local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactionsModule = require(Parent.Reactions)
local IconButton = FoundationModule.IconButton
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local PopoverAlign = FoundationModule.Enums.PopoverAlign

return function(p1)
	-- upvalues: ReactModule (copy), IconButton (copy), IconName (copy), ButtonVariant (copy), ReactionsModule (copy), PopoverAlign (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Button = ReactModule.createElement(IconButton, {
			isCircular = true,
			testId = "reaction-add",
			icon = IconName.SquareFaceEmoji,
			variant = ButtonVariant.Utility,
			onActivated = ReactModule.useCallback(function()
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(function(p2): boolean
					return not p2
				end)
			end, {}),
			LayoutOrder = p1.layoutOrder,
			ref = UseRefResult
		}),
		Picker = ReactModule.createElement(ReactionsModule.ReactionPickerPopover, {
			isOpen = UseStateResult,
			anchorRef = UseRefResult,
			align = PopoverAlign.Start,
			reactions = p1.reactions,
			selectedReactions = p1.selectedReactions,
			onReactionSelected = function(p2)
				-- upvalues: UseResult (copy), p1 (copy)
				UseResult()
				p1.onReactionSelected(p2)
			end,
			onDismiss = UseResult
		})
	})
end