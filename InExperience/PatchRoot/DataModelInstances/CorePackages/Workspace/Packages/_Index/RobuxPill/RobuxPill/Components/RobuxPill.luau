local robuxPill = script:FindFirstAncestor("RobuxPill")
local parent = robuxPill.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local text = foundationModule.Text
local icon = foundationModule.Icon
local button = foundationModule.Button
local skeleton = foundationModule.Skeleton
local fillBehavior = foundationModule.Enums.FillBehavior
local iconSize = foundationModule.Enums.IconSize
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local radius = foundationModule.Enums.Radius
local fFlagRobuxPillSingleFocusTargetModule = require(robuxPill.Flags.FFlagRobuxPillSingleFocusTarget)

local function _(p1)
	return tostring(p1):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
end

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokens (ref), fFlagRobuxPillSingleFocusTargetModule (ref), reactModule (ref), foundationModule (ref), icon (ref), iconName (ref), iconSize (ref), skeleton (ref), radius (ref), text (ref), button (ref), inputSize (ref), fillBehavior (ref)
	local var1 = useTokens()
	local var2 = p1.showBorder == nil or p1.showBorder
	local var3 = if fFlagRobuxPillSingleFocusTargetModule then false else nil
	
	return reactModule.createElement(foundationModule.View, {
		testId = "robux-pill",
		tag = {
			["size-full-1400 padding-medium"] = p1.isCompact == true,
			["size-full-0 auto-y"] = p1.isCompact ~= true,
			["padding-xlarge"] = not p1.isCompact and var2,
			["padding-x-medium padding-y-xlarge"] = not p1.isCompact and not var2
		},
		onActivated = p1.onBuyActivated,
		LayoutOrder = p1.layoutOrder,
		ref = p2,
		stroke = if var2 then {
			Color = var1.Color.Stroke.Default.Color3,
			Transparency = var1.Color.Stroke.Default.Transparency,
			Thickness = var1.Stroke.Standard
		} else nil,
		cornerRadius = if var2 then UDim.new(0, var1.Radius.Medium) else nil
	}, {
		RobuxContainer = reactModule.createElement(foundationModule.View, {
			testId = "robux-container",
			tag = {
				["row align-y-center position-center-left anchor-center-left auto-xy"] = true,
				["gap-medium"] = p1.isCompact == true,
				["gap-small"] = p1.isCompact ~= true
			}
		}, {
			RobuxIcon = reactModule.createElement(icon, {
				LayoutOrder = 1,
				testId = "robux-icon",
				name = iconName.Robux,
				size = if p1.isCompact then iconSize.Large else iconSize.Medium
			}),
			RobuxAmount = if p1.robuxBalance == nil then reactModule.createElement(foundationModule.View, { tag = "size-2500-800", LayoutOrder = 2 }, {
				Skeleton = reactModule.createElement(skeleton, {
					testId = "robux-balance-skeleton",
					radius = radius.Medium
				})
			}) else reactModule.createElement(text, {
				LayoutOrder = 2,
				Size = UDim2.new(0.5, 0, 0, 0),
				tag = {
					["auto-y text-align-x-left text-truncate-end content-emphasis"] = true,
					["text-heading-small"] = p1.isCompact == true,
					["text-title-large"] = p1.isCompact ~= true
				},
				Text = tostring(p1.robuxBalance):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
			})
		}),
		BuyRobuxButton = if p1.isCompact then reactModule.createElement(foundationModule.View, {
			tag = "anchor-center-right auto-xy",
			testId = "buy-robux-button-container",
			Position = UDim2.new(1, 0, 0.5, 0),
			sizeConstraint = { MinSize = Vector2.new(84, 0) }
		}, {
			Button = reactModule.createElement(button, {
				text = p1.buyButtonText,
				size = inputSize.Small,
				Selectable = var3,
				onActivated = p1.onBuyActivated,
				fillBehavior = fillBehavior.Fill
			})
		}) else reactModule.createElement(button, {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, 0, 0.5, 0),
			text = p1.buyButtonText,
			size = inputSize.Small,
			Selectable = var3,
			onActivated = p1.onBuyActivated
		})
	})
end))