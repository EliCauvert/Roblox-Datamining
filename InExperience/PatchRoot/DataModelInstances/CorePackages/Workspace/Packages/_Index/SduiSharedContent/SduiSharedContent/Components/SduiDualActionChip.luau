local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local cryoModule = require(parent.Cryo)
local _ = require(parent.SduiCompat)
local view = foundationModule.View
local text = foundationModule.Text
local icon = foundationModule.Icon
local useTokens = foundationModule.Hooks.useTokens
local useCursor = foundationModule.Hooks.useCursor
local withCommonProps = foundationModule.Utility.withCommonProps
local iconSize = foundationModule.Enums.IconSize
local stateLayerMode = foundationModule.Enums.StateLayerMode
local cursorType = foundationModule.Enums.CursorType

return reactModule.memo(function(p1)
	-- upvalues: useCursor (ref), cursorType (ref), useTokens (ref), reactModule (ref), withCommonProps (ref), stateLayerMode (ref), view (ref), cryoModule (ref), icon (ref), iconSize (ref), text (ref)
	local layoutOrder = p1.layoutOrder
	local anchorPoint = p1.anchorPoint
	local position = p1.position
	local var1 = useCursor(cursorType.SmallPill)
	local var2 = useTokens()
	
	if not p1.leadingIconName and not p1.trailingIconName then
		return reactModule.createElement(reactModule.Fragment, {}, {})
	end
	local var3
	local leadingOnActivated = p1.leadingOnActivated or function() end
	local trailingOnActivated = p1.trailingOnActivated or function() end
	local createElement = reactModule.createElement
	local var4 = cryoModule.Dictionary.join(withCommonProps(p1, {
		tag = "row size-0-800 auto-x radius-circle align-y-center",
		selection = { Selectable = true, SelectionImageObject = var1 },
		stateLayer = { mode = stateLayerMode.Inverse },
		backgroundStyle = var2.Color.ActionStandard.Background
	}), {
		LayoutOrder = layoutOrder,
		AnchorPoint = anchorPoint,
		Position = position,
		[reactModule.Tag] = if p1.testId then `data-testid={p1.testId}` else nil
	})
	local t = {}
	
	if p1.leadingIconName then
		var3 = reactModule.createElement
		var3 = var3(view, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			onActivated = leadingOnActivated
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var2.Radius.Large) }),
			Content = reactModule.createElement(view, {
				tag = "row fill auto-xy size-full-800 align-y-center padding-left-medium padding-right-small gap-small",
				[reactModule.Tag] = if p1.testId then `data-testid={p1.testId}-leading` else nil
			}, {
				Icon = reactModule.createElement(icon, {
					LayoutOrder = 1,
					name = p1.leadingIconName,
					variant = p1.leadingIconVariant,
					size = iconSize.Small
				}),
				Text = if p1.text and p1.text ~= "" then reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "auto-x size-0-full shrink text-label-medium text-truncate-end",
					Text = p1.text,
					textStyle = var2.Color.ActionStandard.Foreground
				}) else nil
			})
		})
	else
		var3 = nil
	end
	t.LeftActionButton = var3
	t.Divider = if p1.leadingIconName and p1.trailingIconName then reactModule.createElement(view, {
		LayoutOrder = 2,
		tag = "bg-shift-200",
		Size = UDim2.new(0, 1, 0, 16)
	}) else nil
	t.RightActionButton = if p1.trailingIconName then reactModule.createElement(view, {
		LayoutOrder = 4,
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		onActivated = trailingOnActivated
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var2.Radius.Circle) }),
		Content = reactModule.createElement(view, {
			tag = "row fill auto-xy align-y-center align-x-center size-full-800 padding-right-medium padding-left-small",
			[reactModule.Tag] = if p1.testId then `data-testid={p1.testId}-trailing` else nil
		}, {
			Icon = reactModule.createElement(icon, {
				LayoutOrder = 1,
				name = p1.trailingIconName,
				variant = p1.trailingIconVariant,
				size = iconSize.Small
			})
		})
	}) else nil
	
	return createElement(view, var4, t)
end)