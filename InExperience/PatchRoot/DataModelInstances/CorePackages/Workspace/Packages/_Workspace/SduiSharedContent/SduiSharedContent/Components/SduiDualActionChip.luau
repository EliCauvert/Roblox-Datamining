local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.SduiCompat)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseCursorFunction = FoundationModule.Hooks.useCursor
local WithCommonPropsFunction = FoundationModule.Utility.withCommonProps
local IconSize = FoundationModule.Enums.IconSize
local StateLayerMode = FoundationModule.Enums.StateLayerMode
local CursorType = FoundationModule.Enums.CursorType

return ReactModule.memo(function(p1)
	-- upvalues: UseCursorFunction (copy), CursorType (copy), UseTokensFunction (copy), ReactModule (copy), WithCommonPropsFunction (copy), StateLayerMode (copy), View (copy), CryoModule (copy), Icon (copy), IconSize (copy), Text (copy)
	local LayoutOrder = p1.layoutOrder
	local AnchorPoint = p1.anchorPoint
	local Position = p1.position
	local UseCursorResult = UseCursorFunction(CursorType.SmallPill)
	local UseTokensResult = UseTokensFunction()
	
	if p1.leadingIconName or p1.trailingIconName then
		local LeadingOnActivated = p1.leadingOnActivated or function() end
		local TrailingOnActivated = p1.trailingOnActivated or function() end
		
		return ReactModule.createElement(View, CryoModule.Dictionary.join(WithCommonPropsFunction(p1, {
			tag = "row size-0-800 auto-x radius-circle align-y-center",
			selection = {
				Selectable = true,
				SelectionImageObject = UseCursorResult
			},
			stateLayer = { mode = StateLayerMode.Inverse },
			backgroundStyle = UseTokensResult.Color.ActionStandard.Background
		}), {
			LayoutOrder = LayoutOrder,
			AnchorPoint = AnchorPoint,
			Position = Position,
			[ReactModule.Tag] = if p1.testId then `data-testid={p1.testId}` else nil
		}), {
			LeftActionButton = if p1.leadingIconName then ReactModule.createElement(View, {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				onActivated = LeadingOnActivated
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, UseTokensResult.Radius.Large) }),
				Content = ReactModule.createElement(View, {
					tag = "row fill auto-xy size-full-800 align-y-center padding-left-medium padding-right-small gap-small",
					[ReactModule.Tag] = if p1.testId then `data-testid={p1.testId}-leading` else nil
				}, {
					Icon = ReactModule.createElement(Icon, {
						LayoutOrder = 1,
						name = p1.leadingIconName,
						variant = p1.leadingIconVariant,
						size = IconSize.Small
					}),
					Text = if p1.text and p1.text ~= "" then ReactModule.createElement(Text, {
						LayoutOrder = 2,
						tag = "auto-x size-0-full shrink text-label-medium text-truncate-end",
						Text = p1.text,
						textStyle = UseTokensResult.Color.ActionStandard.Foreground
					}) else nil
				})
			}) else nil,
			Divider = if p1.leadingIconName and p1.trailingIconName then ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "bg-shift-200",
				Size = UDim2.new(0, 1, 0, 16)
			}) else nil,
			RightActionButton = if p1.trailingIconName then ReactModule.createElement(View, {
				LayoutOrder = 4,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				onActivated = TrailingOnActivated
			}, {
				UICorner = ReactModule.createElement("UICorner", {
					CornerRadius = UDim.new(0, UseTokensResult.Radius.Circle)
				}),
				Content = ReactModule.createElement(View, {
					tag = "row fill auto-xy align-y-center align-x-center size-full-800 padding-right-medium padding-left-small",
					[ReactModule.Tag] = if p1.testId then `data-testid={p1.testId}-trailing` else nil
				}, {
					Icon = ReactModule.createElement(Icon, {
						LayoutOrder = 1,
						name = p1.trailingIconName,
						variant = p1.trailingIconVariant,
						size = IconSize.Small
					})
				})
			}) else nil
		})
	else
		return ReactModule.createElement(ReactModule.Fragment, {}, {})
	end
end)