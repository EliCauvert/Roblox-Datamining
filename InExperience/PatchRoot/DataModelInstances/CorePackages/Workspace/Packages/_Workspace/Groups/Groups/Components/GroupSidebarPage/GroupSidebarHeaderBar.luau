local Parent = script:FindFirstAncestor("Groups").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)

return function(Frame)
	-- upvalues: FoundationModule (copy), ReactModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local _UDim = UDim.new(0, UseTokensResult.Padding.Medium)
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "col size-full-0 auto-y",
		testId = "GroupSidebar.Header",
		padding = { top = _UDim, left = _UDim, right = _UDim },
		LayoutOrder = Frame.LayoutOrder
	}, {
		Bar = ReactModule.createElement(FoundationModule.View, {
			tag = "row align-y-center size-full-1000 padding-left-xsmall padding-right-small",
			LayoutOrder = 1
		}, {
			Back = ReactModule.createElement(FoundationModule.View, { tag = "size-1000-1000", LayoutOrder = 1 }, {
				Button = ReactModule.createElement(FoundationModule.IconButton, {
					isCircular = true,
					testId = "GroupSidebar.Back",
					icon = FoundationModule.Enums.IconName.ChevronLargeLeft,
					size = FoundationModule.Enums.InputSize.Medium,
					variant = FoundationModule.Enums.ButtonVariant.Utility,
					onActivated = Frame.onBack
				})
			}),
			Label = ReactModule.createElement(FoundationModule.View, {
				tag = "fill size-0-full padding-x-small",
				LayoutOrder = 2
			}, {
				Title = ReactModule.createElement(FoundationModule.Text, {
					tag = "size-full text-title-large text-align-x-left text-truncate-end content-emphasis",
					testId = "GroupSidebar.Title",
					Text = Frame.title
				})
			}),
			Actions = ReactModule.createElement(FoundationModule.View, { tag = "row align-y-center auto-xy", LayoutOrder = 3 }, {
				Tooltip = ReactModule.createElement(FoundationModule.Tooltip, { title = Frame.createLabel or "" }, {
					Create = ReactModule.createElement(FoundationModule.View, {
						tag = "col align-x-center align-y-center size-600-600 radius-small",
						testId = "GroupSidebar.Create",
						onActivated = if Frame.canCreate then Frame.onCreate else nil,
						isDisabled = not Frame.canCreate,
						GroupTransparency = if Frame.canCreate then nil else 0.5
					}, {
						Icon = ReactModule.createElement(FoundationModule.Icon, {
							name = FoundationModule.Enums.IconName.PlusSmall,
							size = FoundationModule.Enums.IconSize.Large
						})
					})
				})
			})
		}),
		Divider = ReactModule.createElement(FoundationModule.View, {
			tag = "size-full-0 auto-y",
			LayoutOrder = 2,
			padding = {
				top = _UDim,
				left = UDim.new(0, UseTokensResult.Padding.XSmall),
				right = UDim.new(0, UseTokensResult.Padding.XSmall)
			}
		}, {
			Line = ReactModule.createElement(FoundationModule.Divider, {})
		})
	})
end