local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local createNextOrder = require(parent.ReactUtils).createNextOrder

return reactModule.memo(function(p1)
	-- upvalues: foundationModule (ref), reactModule (ref), createNextOrder (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local var2 = #p1.tabs > 1
	local t = {}
	
	for i, v in p1.tabs do
		local var3 = v.id == p1.activeTabId
		local var4 = var3 or not var2
		t["Tab_" .. v.id] = reactModule.createElement(foundationModule.View, {
			tag = "auto-xy padding-x-small",
			LayoutOrder = i,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			},
			onActivated = function()
				-- upvalues: p1 (ref), v (ref)
				p1.onTabActivated(v.id)
			end
		}, {
			Label = reactModule.createElement(foundationModule.Text, {
				Text = v.text,
				tag = {
					["auto-xy text-label-medium"] = true,
					["content-emphasis"] = var4,
					["content-muted"] = not var4
				}
			}),
			Indicator = if var3 and var2 then reactModule.createElement(foundationModule.View, {
				testId = "presetTabIndicator",
				tag = "anchor-bottom-center",
				Position = UDim2.new(0.5, 0, 1, 0),
				Size = UDim2.new(1, 0, 0, 2),
				backgroundStyle = {
					Transparency = 0,
					Color3 = var1.Color.Content.Emphasis.Color3
				}
			}) else nil
		})
	end
	local var5 = createNextOrder()
	
	return reactModule.createElement(foundationModule.View, {
		tag = "row align-y-center gap-small size-full-0 auto-y padding-small",
		LayoutOrder = p1.LayoutOrder
	}, {
		Tabs = reactModule.createElement(foundationModule.View, { tag = "row gap-medium auto-xy", LayoutOrder = var5() }, t),
		Spacer = reactModule.createElement(foundationModule.View, { tag = "grow auto-y", LayoutOrder = var5() }),
		Keyboard = if p1.showKeyboardButton ~= false then nil else reactModule.createElement(foundationModule.IconButton, {
			testId = "expressionTrayKeyboardButton",
			isCircular = true,
			isDisabled = false,
			LayoutOrder = var5(),
			icon = { name = "keyboard", variant = "Regular" },
			variant = foundationModule.Enums.ButtonVariant.Utility,
			size = foundationModule.Enums.InputSize.Small,
			onActivated = p1.onKeyboardActivated
		})
	})
end)