local Parent = script:FindFirstAncestor("FriendsCalling").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local AvatarPlaceholderModule = require(script.Parent.AvatarPlaceholder)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local IconButton = FoundationModule.IconButton
local InputSize = FoundationModule.Enums.InputSize
local View = FoundationModule.View

local function noop() end

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), AvatarPlaceholderModule (copy), IconButton (copy), IconName (copy), noop (copy), InputSize (copy), ButtonVariant (copy)
	return ReactModule.createElement(View, {
		tag = "col align-x-center align-y-center gap-small size-full padding-medium stroke-standard stroke-default radius-large clip bg-surface-200"
	}, {
		Avatar = ReactModule.createElement("ImageButton", {
			[ReactModule.Tag] = "data-testid=friends-calling-pip-drag-target",
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			Image = "",
			LayoutOrder = 1,
			ref = p1.onDragInputTarget,
			Selectable = false,
			Size = UDim2.fromOffset(64, 64)
		}, {
			Content = ReactModule.createElement(AvatarPlaceholderModule, { size = 64 })
		}),
		Actions = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row align-x-center align-y-center gap-small auto-xy"
		}, {
			Speaker = ReactModule.createElement(IconButton, {
				LayoutOrder = 1,
				isCircular = true,
				testId = "friends-calling-pip-speaker",
				icon = IconName.Speaker,
				onActivated = noop,
				size = InputSize.Small,
				variant = ButtonVariant.Standard
			}),
			Microphone = ReactModule.createElement(IconButton, {
				LayoutOrder = 2,
				isCircular = true,
				testId = "friends-calling-pip-microphone",
				icon = IconName.Microphone,
				onActivated = noop,
				size = InputSize.Small,
				variant = ButtonVariant.Standard
			})
		})
	})
end