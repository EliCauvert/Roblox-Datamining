local parent = script.Parent.Parent
local createSignalModule = require(parent.Misc.createSignal)
local strictModule = require(parent.strict)

local function _(p0, p1) --[[ line: 7 | named "makeImageData" ]]
	return { Path = "rbxasset://textures/" .. p0, SliceCenter = p1 }
end

local t = {
	__tostring = function() --[[ line: 15 ]]
		return "Service(LayoutValues)"
	end
}

function t.new(p2) --[[ line: 19 ]]
	-- upvalues: t (ref), createSignalModule (ref)
	local t_1 = {}
	setmetatable(t_1, { __index = t })
	t_1.signal = createSignalModule()
	t_1.layout = t_1:generate(p2)
	
	return t_1
end

function t.update(p3, p4) --[[ line: 31 ]]
	p3.layout = p3:generate(p4)
	p3.signal:fire(p3.layout)
end

function t.generate(_, p5) --[[ line: 36 ]]
	-- upvalues: strictModule (ref)
	local var4 = if p5 then 3 else 1
	local var5 = 44 * var4
	local var6 = 30 * var4
	local var7 = 6 * var4
	local var8 = 16 * var4
	local var9 = 18 * var4
	local var10 = 210 * var4
	local var11 = 106 * var4
	local var12 = 96 * var4
	local var13 = 20 * var4
	local var14 = 25 * var4
	local var15 = 2 * var4
	local var16 = 64 * var4
	local var17 = 64 * var4
	local var18 = 3 * var4
	local var19 = 2 * var4
	local var20 = var16 + 2 * var15
	local var21 = var17 + 2 * var15
	local var22 = var20 + 2 * var14
	local var23 = var21 + 2 * var14
	
	return strictModule({
		Size = strictModule({
			AdditionalDetailsLabel = UDim2.new(1, 0, 0, var6),
			ItemPreview = UDim2.new(0, var16, 0, var17),
			ItemPreviewWhiteFrame = UDim2.new(0, var20, 0, var21),
			ItemPreviewContainerFrame = UDim2.new(0, var22, 0, var23),
			HorizontalPadding = var14,
			ProductDescription = UDim2.new(0, var10, 0, var11),
			ProductDescriptionPaddingTop = var9,
			RobuxIconContainerFrame = UDim2.new(0, var8 + var7, 0, var8 + 2 * var7),
			RobuxIcon = UDim2.new(0, var8, 0, var8),
			PriceTextLabel = UDim2.new(0, var10 - (var8 + var7), 0, var8),
			PurchasingAnimation = UDim2.new(0, var12, 0, var13),
			ButtonIconPadding = var18,
			ButtonIconYOffset = var19,
			ButtonHeight = var5,
			Dialog = UDim2.new(0, var22 + var10, 0, math.max(var23, var11) + var6 + var5)
		}, "LayoutValues.Size"),
		TextSize = strictModule({
			Default = 18 * var4,
			ProductDescription = 18 * var4,
			Button = 24 * var4,
			AdditionalDetails = 14 * var4,
			Purchasing = 36 * var4
		}, "LayoutValues.TextSize"),
		TextColor = strictModule({ PriceLabel = Color3.new(1, 1, 1) }, "LayoutValues.TextColor"),
		Image = strictModule({
			PromptBackground = if p5 then {
				Path = "rbxasset://textures/ui/PurchasePrompt/PurchasePromptBG@2x.png",
				SliceCenter = Rect.new(17, 17, 19, 19)
			} else {
				Path = "rbxasset://textures/ui/PurchasePrompt/PurchasePromptBG.png",
				SliceCenter = Rect.new(8, 9, 10, 10)
			},
			InProgressBackground = if p5 then {
				Path = "rbxasset://textures/ui/PurchasePrompt/LoadingBG@2x.png",
				SliceCenter = Rect.new(17, 17, 19, 19)
			} else {
				Path = "rbxasset://textures/ui/PurchasePrompt/LoadingBG.png",
				SliceCenter = Rect.new(9, 9, 11, 11)
			},
			ButtonUpLeft = if p5 then {
				Path = "rbxasset://textures/ui/PurchasePrompt/LeftButton@2x.png",
				SliceCenter = Rect.new(18, 5, 20, 7)
			} else {
				Path = "rbxasset://textures/ui/PurchasePrompt/LeftButton.png",
				SliceCenter = Rect.new(8, 3, 10, 4)
			},
			ButtonDownLeft = if p5 then {
				Path = "rbxasset://textures/ui/PurchasePrompt/LeftButtonDown@2x.png",
				SliceCenter = Rect.new(18, 5, 20, 7)
			} else {
				Path = "rbxasset://textures/ui/PurchasePrompt/LeftButtonDown.png",
				SliceCenter = Rect.new(8, 3, 10, 4)
			},
			ButtonUpRight = if p5 then {
				Path = "rbxasset://textures/ui/PurchasePrompt/RightButton@2x.png",
				SliceCenter = Rect.new(3, 5, 5, 7)
			} else {
				Path = "rbxasset://textures/ui/PurchasePrompt/RightButton.png",
				SliceCenter = Rect.new(2, 3, 3, 4)
			},
			ButtonDownRight = if p5 then {
				Path = "rbxasset://textures/ui/PurchasePrompt/RightButtonDown@2x.png",
				SliceCenter = Rect.new(3, 5, 5, 7)
			} else {
				Path = "rbxasset://textures/ui/PurchasePrompt/RightButtonDown.png",
				SliceCenter = Rect.new(2, 3, 3, 4)
			},
			ButtonUp = if p5 then {
				Path = "rbxasset://textures/ui/PurchasePrompt/SingleButton@2x.png",
				SliceCenter = Rect.new(18, 5, 20, 7)
			} else {
				Path = "rbxasset://textures/ui/PurchasePrompt/SingleButton.png",
				SliceCenter = Rect.new(8, 3, 10, 4)
			},
			ButtonDown = if p5 then {
				Path = "rbxasset://textures/ui/PurchasePrompt/SingleButtonDown@2x.png",
				SliceCenter = Rect.new(18, 5, 20, 7)
			} else {
				Path = "rbxasset://textures/ui/PurchasePrompt/SingleButtonDown.png",
				SliceCenter = Rect.new(8, 3, 10, 4)
			},
			PremiumIcon = {
				Path = "rbxasset://textures/ui/PurchasePrompt/Premium.png",
				SliceCenter = nil
			},
			RobuxIcon = if p5 then {
				Path = "rbxasset://textures/ui/common/robux_small@2x.png",
				SliceCenter = nil
			} else {
				Path = "rbxasset://textures/ui/common/robux_small.png",
				SliceCenter = nil
			},
			ErrorIcon = if p5 then {
				Path = "rbxasset://textures/ui/ErrorIcon.png",
				SliceCenter = nil
			} else {
				Path = "rbxasset://textures/ui/ErrorIcon.png",
				SliceCenter = nil
			},
			ButtonA = if p5 then {
				Path = "rbxasset://textures/ui/Settings/Help/AButtonDark@2x.png",
				SliceCenter = nil
			} else {
				Path = "rbxasset://textures/ui/Settings/Help/AButtonDark.png",
				SliceCenter = nil
			},
			ButtonB = if p5 then {
				Path = "rbxasset://textures/ui/Settings/Help/BButtonDark@2x.png",
				SliceCenter = nil
			} else {
				Path = "rbxasset://textures/ui/Settings/Help/BButtonDark.png",
				SliceCenter = nil
			}
		}, "LayoutValues.Image")
	}, "LayoutValues")
end

return t