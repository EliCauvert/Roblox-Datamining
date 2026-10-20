local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local CreateNextOrderFunction = require(Parent.ReactUtils).createNextOrder

return ReactModule.memo(function(Frame)
	-- upvalues: FoundationModule (copy), ReactModule (copy), CreateNextOrderFunction (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local v1 = #Frame.tabs > 1
	local Elements = {}
	
	for LayoutOrder, tab in Frame.tabs do
		local IsIdMatch = tab.id == Frame.activeTabId
		local IsIdMatch1: boolean = IsIdMatch or not v1
		Elements["Tab_" .. tab.id] = ReactModule.createElement(FoundationModule.View, {
			tag = "auto-xy padding-x-small",
			LayoutOrder = LayoutOrder,
			testId = "expressionTab_" .. tab.id,
			stateLayer = {
				affordance = FoundationModule.Enums.StateLayerAffordance.None
			},
			onActivated = function()
				-- upvalues: Frame (copy), tab (copy)
				Frame.onTabActivated(tab.id)
			end,
			selection = if Frame.focusNavEnabled and not v1 then { Selectable = false } else nil
		}, {
			Label = ReactModule.createElement(FoundationModule.Text, {
				Text = tab.text,
				tag = {
					["auto-xy text-label-medium"] = true,
					["content-emphasis"] = IsIdMatch1,
					["content-muted"] = not IsIdMatch1
				}
			}),
			Indicator = if IsIdMatch and v1 then ReactModule.createElement(FoundationModule.View, {
				testId = "presetTabIndicator",
				tag = "anchor-bottom-center",
				Position = UDim2.new(0.5, 0, 1, 0),
				Size = UDim2.new(1, 0, 0, 2),
				backgroundStyle = {
					Transparency = 0,
					Color3 = UseTokensResult.Color.Content.Emphasis.Color3
				}
			}) else nil
		})
	end
	local NextOrder = CreateNextOrderFunction()
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "row align-y-center gap-small size-full-0 auto-y padding-small",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Tabs = ReactModule.createElement(FoundationModule.View, {
			tag = "row gap-medium auto-xy",
			LayoutOrder = NextOrder()
		}, Elements),
		Spacer = ReactModule.createElement(FoundationModule.View, { tag = "grow auto-y", LayoutOrder = NextOrder() }),
		Keyboard = if Frame.showKeyboardButton == false then nil else ReactModule.createElement(FoundationModule.IconButton, {
			testId = "expressionTrayKeyboardButton",
			isCircular = true,
			isDisabled = false,
			LayoutOrder = NextOrder(),
			icon = { name = "keyboard", variant = "Regular" },
			variant = FoundationModule.Enums.ButtonVariant.Utility,
			size = FoundationModule.Enums.InputSize.Small,
			onActivated = Frame.onKeyboardActivated
		})
	})
end)