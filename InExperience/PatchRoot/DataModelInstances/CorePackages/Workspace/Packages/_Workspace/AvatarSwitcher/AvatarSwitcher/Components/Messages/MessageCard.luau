local Parent = script:FindFirstAncestor("AvatarSwitcher").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FFlagAvatarSwitcherUiFixes = require(Parent.AvatarExperienceFlags).FFlagAvatarSwitcherUiFixes

return function(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FoundationModule (copy), FFlagAvatarSwitcherUiFixes (copy)
	local Size800 = UseTokensFunction().Size.Size_800
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "col gap-medium stroke-default bg-shift-100 radius-medium padding-large",
		Size = Frame.Size,
		AutomaticSize = Frame.AutomaticSize
	}, {
		Header = ReactModule.createElement(FoundationModule.View, { tag = "size-full-0 auto-y row align-y-center gap-small" }, {
			Image = ReactModule.createElement(FoundationModule.Image, {
				LayoutOrder = 1,
				tag = if Frame.icon == "Info" then "" else "content-system-warning",
				Image = if Frame.icon == "Info" then "icons/actions/info" else "icons/status/alert",
				Size = UDim2.fromOffset(Size800, Size800)
			}),
			HeaderText = ReactModule.createElement(FoundationModule.Text, {
				tag = "auto-y text-align-x-left anchor-center-right text-title-medium text-wrap grow",
				LayoutOrder = 2,
				Text = Frame.headerText
			}),
			CloseButton = Frame.onClose and ReactModule.createElement(FoundationModule.Image, {
				tag = "size-600 radius-small",
				Image = "icons/navigation/close",
				LayoutOrder = 3,
				onActivated = Frame.onClose
			})
		}),
		ContentText = if FFlagAvatarSwitcherUiFixes then Frame.contentText and ReactModule.createElement(FoundationModule.Text, {
			tag = " size-full-0 auto-y text-align-x-left text-body-medium text-wrap",
			Text = Frame.contentText
		}) else ReactModule.createElement(FoundationModule.Text, {
			tag = " size-full-0 auto-y text-align-x-left text-body-medium text-wrap",
			Text = Frame.contentText
		})
	})
end