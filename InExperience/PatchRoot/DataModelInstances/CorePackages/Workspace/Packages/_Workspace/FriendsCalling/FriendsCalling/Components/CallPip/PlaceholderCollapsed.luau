local parent = script:FindFirstAncestor("FriendsCalling").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local avatarPlaceholderModule = require(script.Parent.AvatarPlaceholder)
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local iconButton = foundationModule.IconButton
local inputSize = foundationModule.Enums.InputSize
local view = foundationModule.View

local function noop() end

return function(p1)
	-- upvalues: reactModule (ref), view (ref), avatarPlaceholderModule (ref), iconButton (ref), iconName (ref), noop (ref), inputSize (ref), buttonVariant (ref)
	return reactModule.createElement(view, {
		tag = "col align-x-center align-y-center gap-small size-full padding-medium stroke-standard stroke-default radius-large clip bg-surface-200"
	}, {
		Avatar = reactModule.createElement("ImageButton", {
			[reactModule.Tag] = "data-testid=friends-calling-pip-drag-target",
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			Image = "",
			LayoutOrder = 1,
			ref = p1.onDragInputTarget,
			Selectable = false,
			Size = UDim2.fromOffset(64, 64)
		}, {
			Content = reactModule.createElement(avatarPlaceholderModule, { size = 64 })
		}),
		Actions = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row align-x-center align-y-center gap-small auto-xy"
		}, {
			Speaker = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				isCircular = true,
				testId = "friends-calling-pip-speaker",
				icon = iconName.Speaker,
				onActivated = noop,
				size = inputSize.Small,
				variant = buttonVariant.Standard
			}),
			Microphone = reactModule.createElement(iconButton, {
				LayoutOrder = 2,
				isCircular = true,
				testId = "friends-calling-pip-microphone",
				icon = iconName.Microphone,
				onActivated = noop,
				size = inputSize.Small,
				variant = buttonVariant.Standard
			})
		})
	})
end