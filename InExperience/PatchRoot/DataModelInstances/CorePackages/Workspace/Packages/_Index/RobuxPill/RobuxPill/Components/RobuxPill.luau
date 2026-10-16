local RobuxPill = script:FindFirstAncestor("RobuxPill")
local Parent = RobuxPill.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local Button = FoundationModule.Button
local Skeleton = FoundationModule.Skeleton
local FillBehavior = FoundationModule.Enums.FillBehavior
local IconSize = FoundationModule.Enums.IconSize
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local Radius = FoundationModule.Enums.Radius
local FFlagRobuxPillSingleFocusTargetModule = require(RobuxPill.Flags.FFlagRobuxPillSingleFocusTarget)

local function _(p1) --[[ Line: 32 | Named "numWithCommas" ]]
	return tostring(p1):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
end

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 36 | Named "RobuxPill" ]]
	-- upvalues: UseTokensFunction (copy), FFlagRobuxPillSingleFocusTargetModule (copy), ReactModule (copy), FoundationModule (copy), Icon (copy), IconName (copy), IconSize (copy), Skeleton (copy), Radius (copy), Text (copy), Button (copy), InputSize (copy), FillBehavior (copy)
	local UseTokensResult = UseTokensFunction()
	local NoShowBorder = p1.showBorder == nil or p1.showBorder
	local Selectable = not FFlagRobuxPillSingleFocusTargetModule and nil
	
	return ReactModule.createElement(FoundationModule.View, {
		testId = "robux-pill",
		tag = {
			["size-full-1400 padding-medium"] = p1.isCompact == true,
			["size-full-0 auto-y"] = p1.isCompact ~= true,
			["padding-xlarge"] = not p1.isCompact and NoShowBorder,
			["padding-x-medium padding-y-xlarge"] = not p1.isCompact and not NoShowBorder
		},
		onActivated = p1.onBuyActivated,
		LayoutOrder = p1.layoutOrder,
		ref = Ref,
		stroke = if NoShowBorder then {
			Color = UseTokensResult.Color.Stroke.Default.Color3,
			Transparency = UseTokensResult.Color.Stroke.Default.Transparency,
			Thickness = UseTokensResult.Stroke.Standard
		} else nil,
		cornerRadius = if NoShowBorder then UDim.new(0, UseTokensResult.Radius.Medium) else nil
	}, {
		RobuxContainer = ReactModule.createElement(FoundationModule.View, {
			testId = "robux-container",
			tag = {
				["row align-y-center position-center-left anchor-center-left auto-xy"] = true,
				["gap-medium"] = p1.isCompact == true,
				["gap-small"] = p1.isCompact ~= true
			}
		}, {
			RobuxIcon = ReactModule.createElement(Icon, {
				LayoutOrder = 1,
				testId = "robux-icon",
				name = IconName.Robux,
				size = if p1.isCompact then IconSize.Large else IconSize.Medium
			}),
			RobuxAmount = if p1.robuxBalance == nil then ReactModule.createElement(FoundationModule.View, { tag = "size-2500-800", LayoutOrder = 2 }, {
				Skeleton = ReactModule.createElement(Skeleton, {
					testId = "robux-balance-skeleton",
					radius = Radius.Medium
				})
			}) else ReactModule.createElement(Text, {
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
		BuyRobuxButton = if p1.isCompact then ReactModule.createElement(FoundationModule.View, {
			tag = "anchor-center-right auto-xy",
			testId = "buy-robux-button-container",
			Position = UDim2.new(1, 0, 0.5, 0),
			sizeConstraint = { MinSize = Vector2.new(84, 0) }
		}, {
			Button = ReactModule.createElement(Button, {
				text = p1.buyButtonText,
				size = InputSize.Small,
				Selectable = Selectable,
				onActivated = p1.onBuyActivated,
				fillBehavior = FillBehavior.Fill
			})
		}) else ReactModule.createElement(Button, {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, 0, 0.5, 0),
			text = p1.buyButtonText,
			size = InputSize.Small,
			Selectable = Selectable,
			onActivated = p1.onBuyActivated
		})
	})
end))