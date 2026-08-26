local parent = script.Parent.Parent
local createSignalModule = require(parent.Misc.createSignal)
local strictModule = require(parent.strict)

local function _(p1, p2)
	return { Path = "rbxasset://textures/" .. p0, SliceCenter = p2 }
end

local t = {
	__tostring = function()
		return "Service(LayoutValues)"
	end
}

function t.new(p1)
	-- upvalues: t (ref), createSignalModule (ref)
	local t_1 = {}
	setmetatable(t_1, { __index = t })
	t_1.signal = createSignalModule()
	t_1.layout = t_1:generate(p1)
	
	return t_1
end

function t.update(p1, p2)
	p1.layout = p1:generate(p2)
	p1.signal:fire(p1.layout)
end

function t.generate(_, p1)
	-- upvalues: strictModule (ref)
	local var1 = if p1 then 3 else 1
	local var2 = 44 * var1
	local var3 = 30 * var1
	local var4 = 6 * var1
	local var5 = 16 * var1
	local var6 = 18 * var1
	local var7 = 210 * var1
	local var8 = 106 * var1
	local var9 = 96 * var1
	local var10 = 20 * var1
	local var11 = 25 * var1
	local var12 = 2 * var1
	local var13 = 64 * var1
	local var14 = 64 * var1
	local var15 = 3 * var1
	local var16 = 2 * var1
	local var17 = var13 + 2 * var12
	local var18 = var14 + 2 * var12
	local var19 = var17 + 2 * var11
	local var20 = var18 + 2 * var11
	
	return strictModule({
		Size = strictModule({
			AdditionalDetailsLabel = UDim2.new(1, 0, 0, var3),
			ItemPreview = UDim2.new(0, var13, 0, var14),
			ItemPreviewWhiteFrame = UDim2.new(0, var17, 0, var18),
			ItemPreviewContainerFrame = UDim2.new(0, var19, 0, var20),
			HorizontalPadding = var11,
			ProductDescription = UDim2.new(0, var7, 0, var8),
			ProductDescriptionPaddingTop = var6,
			RobuxIconContainerFrame = UDim2.new(0, var5 + var4, 0, var5 + 2 * var4),
			RobuxIcon = UDim2.new(0, var5, 0, var5),
			PriceTextLabel = UDim2.new(0, var7 - (var5 + var4), 0, var5),
			PurchasingAnimation = UDim2.new(0, var9, 0, var10),
			ButtonIconPadding = var15,
			ButtonIconYOffset = var16,
			ButtonHeight = var2,
			Dialog = UDim2.new(0, var19 + var7, 0, math.max(var20, var8) + var3 + var2)
		}, "LayoutValues.Size"),
		TextSize = strictModule({
			Default = 18 * var1,
			ProductDescription = 18 * var1,
			Button = 24 * var1,
			AdditionalDetails = 14 * var1,
			Purchasing = 36 * var1
		}, "LayoutValues.TextSize"),
		TextColor = strictModule({ PriceLabel = Color3.new(1, 1, 1) }, "LayoutValues.TextColor"),
		Image = strictModule({
			PromptBackground = if p1 then {
				Path = "rbxasset://textures/ui/PurchasePrompt/PurchasePromptBG@2x.png",
				SliceCenter = Rect.new(17, 17, 19, 19)
			} else {
				Path = "rbxasset://textures/ui/PurchasePrompt/PurchasePromptBG.png",
				SliceCenter = Rect.new(8, 9, 10, 10)
			},
			InProgressBackground = if p1 then {
				Path = "rbxasset://textures/ui/PurchasePrompt/LoadingBG@2x.png",
				SliceCenter = Rect.new(17, 17, 19, 19)
			} else {
				Path = "rbxasset://textures/ui/PurchasePrompt/LoadingBG.png",
				SliceCenter = Rect.new(9, 9, 11, 11)
			},
			ButtonUpLeft = if p1 then {
				Path = "rbxasset://textures/ui/PurchasePrompt/LeftButton@2x.png",
				SliceCenter = Rect.new(18, 5, 20, 7)
			} else {
				Path = "rbxasset://textures/ui/PurchasePrompt/LeftButton.png",
				SliceCenter = Rect.new(8, 3, 10, 4)
			},
			ButtonDownLeft = if p1 then {
				Path = "rbxasset://textures/ui/PurchasePrompt/LeftButtonDown@2x.png",
				SliceCenter = Rect.new(18, 5, 20, 7)
			} else {
				Path = "rbxasset://textures/ui/PurchasePrompt/LeftButtonDown.png",
				SliceCenter = Rect.new(8, 3, 10, 4)
			},
			ButtonUpRight = if p1 then {
				Path = "rbxasset://textures/ui/PurchasePrompt/RightButton@2x.png",
				SliceCenter = Rect.new(3, 5, 5, 7)
			} else {
				Path = "rbxasset://textures/ui/PurchasePrompt/RightButton.png",
				SliceCenter = Rect.new(2, 3, 3, 4)
			},
			ButtonDownRight = if p1 then {
				Path = "rbxasset://textures/ui/PurchasePrompt/RightButtonDown@2x.png",
				SliceCenter = Rect.new(3, 5, 5, 7)
			} else {
				Path = "rbxasset://textures/ui/PurchasePrompt/RightButtonDown.png",
				SliceCenter = Rect.new(2, 3, 3, 4)
			},
			ButtonUp = if p1 then {
				Path = "rbxasset://textures/ui/PurchasePrompt/SingleButton@2x.png",
				SliceCenter = Rect.new(18, 5, 20, 7)
			} else {
				Path = "rbxasset://textures/ui/PurchasePrompt/SingleButton.png",
				SliceCenter = Rect.new(8, 3, 10, 4)
			},
			ButtonDown = if p1 then {
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
			RobuxIcon = if p1 then {
				Path = "rbxasset://textures/ui/common/robux_small@2x.png",
				SliceCenter = nil
			} else {
				Path = "rbxasset://textures/ui/common/robux_small.png",
				SliceCenter = nil
			},
			ErrorIcon = if p1 then {
				Path = "rbxasset://textures/ui/ErrorIcon.png",
				SliceCenter = nil
			} else {
				Path = "rbxasset://textures/ui/ErrorIcon.png",
				SliceCenter = nil
			},
			ButtonA = if p1 then {
				Path = "rbxasset://textures/ui/Settings/Help/AButtonDark@2x.png",
				SliceCenter = nil
			} else {
				Path = "rbxasset://textures/ui/Settings/Help/AButtonDark.png",
				SliceCenter = nil
			},
			ButtonB = if p1 then {
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