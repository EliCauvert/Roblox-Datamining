local Parent = script:FindFirstAncestor("AvatarWorkshop").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FoundationModule (copy)
	local Surface200 = UseTokensFunction().Color.Surface.Surface_200
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "col gap-xsmall size-1500-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Card = ReactModule.createElement(FoundationModule.View, {
			LayoutOrder = 1,
			tag = {
				["size-1500-1500 stroke-default radius-medium"] = true,
				["stroke-contrast"] = Frame.selected
			},
			backgroundStyle = {
				Color3 = Surface200.Color3,
				Transparency = if Frame.transparent then 1 else Surface200.Transparency
			},
			onActivated = Frame.onActivated
		}, { Frame.children }),
		Title = ReactModule.createElement(FoundationModule.Text, {
			tag = "size-full-0 auto-y text-caption-small text-truncate-end content-muted",
			LayoutOrder = 2,
			Text = Frame.title
		})
	})
end