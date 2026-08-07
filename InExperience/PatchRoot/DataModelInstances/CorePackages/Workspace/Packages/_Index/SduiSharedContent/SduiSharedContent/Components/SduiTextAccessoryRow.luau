local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(parent.SduiCompat)
local view = foundationModule.View
local text = foundationModule.Text
local avatarGroup = foundationModule.AvatarGroup
local icon = foundationModule.Icon
local useTokens = foundationModule.Hooks.useTokens
local var2 = reactModule.memo(function(p0) --[[ line: 65 | named "AccessoryComponent" ]]
	-- upvalues: reactModule (ref), avatarGroup (ref), icon (ref)
	local layoutOrder = p0.LayoutOrder
	
	if p0.accessory.type == "AvatarGroup" then
		local accessory = p0.accessory
		
		return reactModule.createElement(avatarGroup, {
			LayoutOrder = layoutOrder,
			avatars = accessory.avatars,
			type = accessory.groupType,
			max = accessory.max,
			backplateStyle = p0.accessory.backplateStyle,
			size = accessory.size,
			testId = `{p0.testIdPrefix}--{p0.position}-avatar-group`
		})
	elseif p0.accessory.type == "Icon" then
		local accessory = p0.accessory
		
		return reactModule.createElement(icon, {
			LayoutOrder = layoutOrder,
			name = accessory.name,
			variant = accessory.variant,
			size = accessory.size,
			style = accessory.style,
			testId = `{p0.testIdPrefix}--{p0.position}-icon`
		})
	end
	return nil
end)

return reactModule.memo(function(p1) --[[ line: 96 | named "SduiTextAccessoryRow" ]]
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), foundationModule (ref), var2 (ref), text (ref)
	local testId = p1.testId or "--sdui-text-accessory-row"
	
	return reactModule.createElement(view, {
		tag = reactModule.useMemo(function() --[[ line: 114 ]]
			-- upvalues: p1 (ref)
			return {
				["row align-y-center auto-xy"] = true,
				["gap-small"] = not p1.gap
			}
		end, { p1.gap }),
		LayoutOrder = p1.layoutOrder,
		AnchorPoint = p1.anchorPoint,
		Size = p1.size,
		Position = p1.position,
		onActivated = p1.onActivated,
		testId = testId,
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		}
	}, {
		ListLayout = if p1.gap then reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, p1.gap)
		}) else nil,
		LeadingAccessory = if p1.leading then reactModule.createElement(var2, {
			LayoutOrder = 1,
			position = "leading",
			accessory = p1.leading,
			testIdPrefix = testId
		}) else nil,
		TextElement = if p1.text then reactModule.createElement(text, {
			RichText = true,
			Text = p1.text,
			textStyle = p1.textStyle or useTokens().Color.Content.Emphasis,
			fontStyle = p1.fontStyle,
			tag = `auto-xy {(if p1.fontStyle then nil else "text-caption-large") or ""}`,
			LayoutOrder = if p1.leading then 2 else 1,
			testId = `{testId}--text`
		}) else nil,
		TrailingAccessory = if p1.trailing then reactModule.createElement(var2, {
			position = "trailing",
			accessory = p1.trailing,
			LayoutOrder = if p1.leading then 3 else 2,
			testIdPrefix = testId
		}) else nil
	})
end)