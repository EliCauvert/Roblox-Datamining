local Parent = script.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local TouchControlIconModule = require(script.Parent.TouchControlIcon)
local _ = require(script.Parent.TouchControlList)

return ReactModule.memo(function(p1)
	-- upvalues: FoundationModule (copy), ReactModule (copy), TouchControlIconModule (copy)
	local Layout = p1.layout
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local XXSmallRatio = UseTokensResult.Gap.XXSmall / (if p1.scale > 0 then p1.scale else 1)
	local Elements = {}
	
	for i, slot in ipairs(p1.slots) do
		local NewJumpPosition = Layout.jumpPosition + Layout.slotOffsets[i]
		Elements[slot.id] = ReactModule.createElement(TouchControlIconModule, {
			name = slot.icon,
			diameter = Layout.smallButtonSize,
			disabled = slot.disabled,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromOffset(NewJumpPosition.X, NewJumpPosition.Y),
			testId = "TouchMockIcon-" .. slot.id
		})
	end
	for i1 = 1, 3 do
		Elements["TopAction" .. i1] = ReactModule.createElement(TouchControlIconModule, {
			name = FoundationModule.Enums.IconName.DiamondSimplified,
			diameter = Layout.smallButtonSize,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, -Layout.sidePadding - (i1 - 1) * (Layout.smallButtonSize + Layout.topGap), 0, Layout.topPadding),
			testId = "TouchMockTopAction-" .. i1
		})
	end
	Elements.Jump = ReactModule.createElement(TouchControlIconModule, {
		testId = "TouchMockJump",
		name = FoundationModule.Enums.IconName.KeyShift,
		diameter = Layout.jumpSize,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromOffset(Layout.jumpPosition.X, Layout.jumpPosition.Y)
	})
	Elements.Roblox = ReactModule.createElement(TouchControlIconModule, {
		inverted = true,
		testId = "TouchMockRoblox",
		name = FoundationModule.Enums.IconName.Tilt,
		diameter = Layout.smallButtonSize,
		Position = UDim2.fromOffset(Layout.sidePadding, Layout.topPadding)
	})
	Elements.InnerOutline = ReactModule.createElement(FoundationModule.View, {
		testId = "TouchMockInnerOutline",
		Position = UDim2.fromOffset(XXSmallRatio, XXSmallRatio),
		Size = UDim2.new(1, -2 * XXSmallRatio, 1, -2 * XXSmallRatio),
		cornerRadius = UDim.new(0, (math.max(0, Layout.cornerRadius - Layout.inset + XXSmallRatio))),
		stroke = {
			Thickness = 0.33,
			Color = UseTokensResult.Color.Extended.White.White_100.Color3,
			Transparency = UseTokensResult.Color.Extended.White.White_100.Transparency
		}
	})
	
	return ReactModule.createElement("CanvasGroup", {
		Name = "TouchDeviceMock",
		Size = UDim2.fromOffset(Layout.size.X, Layout.size.Y),
		BackgroundTransparency = 1,
		GroupTransparency = 0,
		[ReactModule.Tag] = "data-testid=TouchDeviceMock"
	}, {
		Scale = ReactModule.createElement("UIScale", {
			Scale = p1.scale,
			[ReactModule.Tag] = "data-testid=TouchDeviceMockScale"
		}),
		Phone = ReactModule.createElement(FoundationModule.View, {
			testId = "TouchMockOuterOutline",
			Position = UDim2.fromOffset(Layout.inset / 2, Layout.inset / 2),
			Size = UDim2.new(1, -Layout.inset, 1, -Layout.inset),
			cornerRadius = UDim.new(0, Layout.cornerRadius),
			stroke = {
				Thickness = 0.75,
				Color = UseTokensResult.Color.Extended.White.White_100.Color3,
				Transparency = UseTokensResult.Color.Extended.White.White_100.Transparency
			}
		}, Elements)
	})
end)