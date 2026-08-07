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

return reactModule.memo(function(p0) --[[ line: 36 | named "SduiDualActionChip" ]]
	-- upvalues: useCursor (ref), cursorType (ref), useTokens (ref), reactModule (ref), withCommonProps (ref), stateLayerMode (ref), view (ref), cryoModule (ref), icon (ref), iconSize (ref), text (ref)
	local layoutOrder = p0.layoutOrder
	local anchorPoint = p0.anchorPoint
	local position = p0.position
	local var3 = useCursor(cursorType.SmallPill)
	local var4 = useTokens()
	
	if not p0.leadingIconName and not p0.trailingIconName then
		return reactModule.createElement(reactModule.Fragment, {}, {})
	end
	local var9
	local leadingOnActivated = p0.leadingOnActivated or function() --[[ line: 50 ]] end
	local trailingOnActivated = p0.trailingOnActivated or function() --[[ line: 51 ]] end
	local createElement = reactModule.createElement
	local var7 = cryoModule.Dictionary.join(withCommonProps(p0, {
		tag = "row size-0-800 auto-x radius-circle align-y-center",
		selection = { Selectable = true, SelectionImageObject = var3 },
		stateLayer = { mode = stateLayerMode.Inverse },
		backgroundStyle = var4.Color.ActionStandard.Background
	}), {
		LayoutOrder = layoutOrder,
		AnchorPoint = anchorPoint,
		Position = position,
		[reactModule.Tag] = if p0.testId then `data-testid={p0.testId}` else nil
	})
	local t = {}
	
	if p0.leadingIconName then
		var9 = reactModule.createElement
		var9 = var9(view, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			onActivated = leadingOnActivated
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var4.Radius.Large) }),
			Content = reactModule.createElement(view, {
				tag = "row fill auto-xy size-full-800 align-y-center padding-left-medium padding-right-small gap-small",
				[reactModule.Tag] = if p0.testId then `data-testid={p0.testId}-leading` else nil
			}, {
				Icon = reactModule.createElement(icon, {
					LayoutOrder = 1,
					name = p0.leadingIconName,
					variant = p0.leadingIconVariant,
					size = iconSize.Small
				}),
				Text = if p0.text and p0.text ~= "" then reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "auto-x size-0-full shrink text-label-medium text-truncate-end",
					Text = p0.text,
					textStyle = var4.Color.ActionStandard.Foreground
				}) else nil
			})
		})
	else
		var9 = nil
	end
	t.LeftActionButton = var9
	t.Divider = if p0.leadingIconName and p0.trailingIconName then reactModule.createElement(view, {
		LayoutOrder = 2,
		tag = "bg-shift-200",
		Size = UDim2.new(0, 1, 0, 16)
	}) else nil
	t.RightActionButton = if p0.trailingIconName then reactModule.createElement(view, {
		LayoutOrder = 4,
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		onActivated = trailingOnActivated
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var4.Radius.Circle) }),
		Content = reactModule.createElement(view, {
			tag = "row fill auto-xy align-y-center align-x-center size-full-800 padding-right-medium padding-left-small",
			[reactModule.Tag] = if p0.testId then `data-testid={p0.testId}-trailing` else nil
		}, {
			Icon = reactModule.createElement(icon, {
				LayoutOrder = 1,
				name = p0.trailingIconName,
				variant = p0.trailingIconVariant,
				size = iconSize.Small
			})
		})
	}) else nil
	
	return createElement(view, var7, t)
end)