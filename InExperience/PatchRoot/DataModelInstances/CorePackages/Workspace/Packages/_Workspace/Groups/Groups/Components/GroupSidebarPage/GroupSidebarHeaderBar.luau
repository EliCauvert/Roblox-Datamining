local Parent = script:FindFirstAncestor("Groups").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local IconName = FoundationModule.Enums.IconName

local function backButton(Frame, LayoutOrder)
	-- upvalues: ReactModule (copy), FoundationModule (copy), IconName (copy)
	return ReactModule.createElement(FoundationModule.IconButton, {
		isCircular = true,
		testId = "GroupSidebar.Back",
		icon = IconName.ChevronLargeLeft,
		size = FoundationModule.Enums.InputSize.Medium,
		variant = FoundationModule.Enums.ButtonVariant.Utility,
		onActivated = Frame.onBack,
		LayoutOrder = LayoutOrder
	})
end

local function createAction(Frame, Element)
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	return ReactModule.createElement(FoundationModule.View, { tag = "row align-y-center auto-xy", LayoutOrder = 3 }, {
		Tooltip = ReactModule.createElement(FoundationModule.Tooltip, { title = Frame.createLabel or "" }, { Create = Element })
	})
end

local function CompactHeaderBar(Frame)
	-- upvalues: ReactModule (copy), FoundationModule (copy), backButton (copy), createAction (copy), IconName (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "row align-y-center gap-small size-full-1400 padding-x-medium",
		testId = "GroupSidebar.Header",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Back = backButton(Frame, 1),
		Label = ReactModule.createElement(FoundationModule.View, {
			tag = "row align-y-center fill size-0-full",
			LayoutOrder = 2
		}, {
			Title = ReactModule.createElement(FoundationModule.Text, {
				tag = "size-full-0 auto-y text-heading-medium text-align-x-left text-truncate-end content-emphasis",
				testId = "GroupSidebar.Title",
				Text = Frame.title
			})
		}),
		Actions = createAction(Frame, ReactModule.createElement(FoundationModule.IconButton, {
			isCircular = true,
			testId = "GroupSidebar.Create",
			icon = IconName.PlusSmall,
			size = FoundationModule.Enums.InputSize.Medium,
			variant = FoundationModule.Enums.ButtonVariant.Utility,
			onActivated = Frame.onCreate,
			isDisabled = not Frame.canCreate
		}))
	})
end

return function(Frame)
	-- upvalues: FoundationModule (copy), ReactModule (copy), CompactHeaderBar (copy), backButton (copy), createAction (copy), IconName (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	
	if Frame.isCompactTouch then
		return ReactModule.createElement(CompactHeaderBar, Frame)
	else
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
				Back = ReactModule.createElement(FoundationModule.View, { tag = "size-1000-1000", LayoutOrder = 1 }, { Button = backButton(Frame) }),
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
				Actions = createAction(Frame, ReactModule.createElement(FoundationModule.View, {
					tag = "col align-x-center align-y-center size-600-600 radius-small",
					testId = "GroupSidebar.Create",
					onActivated = if Frame.canCreate then Frame.onCreate else nil,
					isDisabled = not Frame.canCreate,
					GroupTransparency = if Frame.canCreate then nil else 0.5
				}, {
					Icon = ReactModule.createElement(FoundationModule.Icon, {
						name = IconName.PlusSmall,
						size = FoundationModule.Enums.IconSize.Large
					})
				}))
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
end