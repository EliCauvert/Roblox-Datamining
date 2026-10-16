local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.SduiCompat)
local View = FoundationModule.View
local Text = FoundationModule.Text
local AvatarGroup = FoundationModule.AvatarGroup
local Icon = FoundationModule.Icon
local UseTokensFunction = FoundationModule.Hooks.useTokens
local MemoResult = ReactModule.memo(function(Frame) --[[ Line: 65 | Named "AccessoryComponent" ]]
	-- upvalues: ReactModule (copy), AvatarGroup (copy), Icon (copy)
	local LayoutOrder = Frame.LayoutOrder
	
	if Frame.accessory.type == "AvatarGroup" then
		local Accessory = Frame.accessory
		
		return ReactModule.createElement(AvatarGroup, {
			LayoutOrder = LayoutOrder,
			avatars = Accessory.avatars,
			type = Accessory.groupType,
			max = Accessory.max,
			backplateStyle = Frame.accessory.backplateStyle,
			size = Accessory.size,
			testId = `{Frame.testIdPrefix}--{Frame.position}-avatar-group`
		})
	elseif Frame.accessory.type == "Icon" then
		local Accessory = Frame.accessory
		
		return ReactModule.createElement(Icon, {
			LayoutOrder = LayoutOrder,
			name = Accessory.name,
			variant = Accessory.variant,
			size = Accessory.size,
			style = Accessory.style,
			testId = `{Frame.testIdPrefix}--{Frame.position}-icon`
		})
	else
		return nil
	end
end)

return ReactModule.memo(function(p1) --[[ Line: 96 | Named "SduiTextAccessoryRow" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), FoundationModule (copy), MemoResult (copy), Text (copy)
	local LayoutOrder = p1.layoutOrder
	local AnchorPoint = p1.anchorPoint
	local Size = p1.size
	local Position = p1.position
	local UseTokensResult = UseTokensFunction()
	local TextStyle = p1.textStyle or UseTokensResult.Color.Content.Emphasis
	local TextCaptionLarge = if p1.fontStyle then nil else "text-caption-large"
	local LayoutOrder1: number = if p1.leading then 2 else 1
	local LayoutOrder2: number = if p1.leading then 3 else 2
	local TestId = p1.testId or "--sdui-text-accessory-row"
	
	return ReactModule.createElement(View, {
		tag = ReactModule.useMemo(function() --[[ Line: 114 ]]
			-- upvalues: p1 (copy)
			return {
				["row align-y-center auto-xy"] = true,
				["gap-small"] = not p1.gap
			}
		end, { p1.gap }),
		LayoutOrder = LayoutOrder,
		AnchorPoint = AnchorPoint,
		Size = Size,
		Position = Position,
		onActivated = p1.onActivated,
		testId = TestId,
		stateLayer = {
			affordance = FoundationModule.Enums.StateLayerAffordance.None
		}
	}, {
		ListLayout = if p1.gap then ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, p1.gap)
		}) else nil,
		LeadingAccessory = if p1.leading then ReactModule.createElement(MemoResult, {
			LayoutOrder = 1,
			position = "leading",
			accessory = p1.leading,
			testIdPrefix = TestId
		}) else nil,
		TextElement = if p1.text then ReactModule.createElement(Text, {
			RichText = true,
			Text = p1.text,
			textStyle = TextStyle,
			fontStyle = p1.fontStyle,
			tag = `auto-xy {TextCaptionLarge or ""}`,
			LayoutOrder = LayoutOrder1,
			testId = `{TestId}--text`
		}) else nil,
		TrailingAccessory = if p1.trailing then ReactModule.createElement(MemoResult, {
			position = "trailing",
			accessory = p1.trailing,
			LayoutOrder = LayoutOrder2,
			testIdPrefix = TestId
		}) else nil
	})
end)