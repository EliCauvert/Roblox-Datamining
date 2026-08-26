local parent = script:FindFirstAncestor("RobuxPill").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local text = foundationModule.Text
local icon = foundationModule.Icon
local button = foundationModule.Button
local iconSize = foundationModule.Enums.IconSize
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize

local function _(p1)
	return tostring(p1):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), foundationModule (ref), icon (ref), iconName (ref), iconSize (ref), text (ref), button (ref), inputSize (ref)
	local var1 = useTokens()
	local var2 = p1.showBorder == nil or p1.showBorder
	
	return reactModule.createElement(foundationModule.View, {
		tag = if var2 then "size-full-0 auto-y padding-xlarge" else "size-full-0 auto-y padding-x-medium padding-y-xlarge",
		onActivated = p1.onBuyActivated,
		LayoutOrder = p1.layoutOrder,
		stroke = if var2 then {
			Color = var1.Color.Stroke.Default.Color3,
			Transparency = var1.Color.Stroke.Default.Transparency,
			Thickness = var1.Stroke.Standard
		} else nil,
		cornerRadius = if var2 then UDim.new(0, var1.Radius.Medium) else nil
	}, {
		RobuxContainer = reactModule.createElement(foundationModule.View, {
			tag = "row align-y-center gap-small position-center-left anchor-center-left auto-xy"
		}, {
			RobuxIcon = reactModule.createElement(icon, {
				LayoutOrder = 1,
				name = iconName.Robux,
				size = iconSize.Medium
			}),
			RobuxAmount = reactModule.createElement(text, {
				tag = "auto-y text-title-large text-align-x-left text-truncate-end content-emphasis",
				LayoutOrder = 2,
				Size = UDim2.new(0.5, 0, 0, 0),
				Text = tostring(p1.robuxBalance):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
			})
		}),
		BuyRobuxButton = reactModule.createElement(button, {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, 0, 0.5, 0),
			text = p1.buyButtonText,
			size = inputSize.Small,
			onActivated = p1.onBuyActivated
		})
	})
end)