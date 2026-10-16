local Parent = script.Parent.Parent
local CreateSignalModule = require(Parent.Misc.createSignal)
local StrictModule = require(Parent.strict)

local function _(Text, SliceCenter) --[[ Line: 7 | Named "makeImageData" ]]
	return {
		Path = "rbxasset://textures/" .. Text,
		SliceCenter = SliceCenter
	}
end

local LayoutValuesModule = {
	__tostring = function(): string --[[ Line: 15 ]]
		return "Service(LayoutValues)"
	end
}

function LayoutValuesModule.new(p1) --[[ Line: 19 ]]
	-- upvalues: LayoutValuesModule (copy), CreateSignalModule (copy)
	local t = {}
	setmetatable(t, { __index = LayoutValuesModule })
	t.signal = CreateSignalModule()
	t.layout = t:generate(p1)
	
	return t
end

function LayoutValuesModule.update(p1, p2) --[[ Line: 31 ]]
	p1.layout = p1:generate(p2)
	p1.signal:fire(p1.layout)
end

function LayoutValuesModule:generate(p1) --[[ Line: 36 ]]
	-- upvalues: StrictModule (copy)
	local v1: number = if p1 then 3 else 1
	local ButtonHeight = 44 * v1
	local YOffset1 = 30 * v1
	local v2 = 6 * v1
	local XOffset3 = 16 * v1
	local XOffset = 210 * v1
	local YOffset3 = 106 * v1
	local HorizontalPadding = 25 * v1
	local v3 = 2 * v1
	local XOffset1 = 64 * v1
	local YOffset2 = 64 * v1
	local NewXOffset = XOffset1 + 2 * v3
	local YOffset = YOffset2 + 2 * v3
	local XOffset2 = NewXOffset + 2 * HorizontalPadding
	local NewYOffset = YOffset + 2 * HorizontalPadding
	
	return (StrictModule({
		Size = StrictModule({
			AdditionalDetailsLabel = UDim2.new(1, 0, 0, YOffset1),
			ItemPreview = UDim2.new(0, XOffset1, 0, YOffset2),
			ItemPreviewWhiteFrame = UDim2.new(0, NewXOffset, 0, YOffset),
			ItemPreviewContainerFrame = UDim2.new(0, XOffset2, 0, NewYOffset),
			HorizontalPadding = HorizontalPadding,
			ProductDescription = UDim2.new(0, XOffset, 0, YOffset3),
			ProductDescriptionPaddingTop = 18 * v1,
			RobuxIconContainerFrame = UDim2.new(0, XOffset3 + v2, 0, XOffset3 + 2 * v2),
			RobuxIcon = UDim2.new(0, XOffset3, 0, XOffset3),
			PriceTextLabel = UDim2.new(0, XOffset - (XOffset3 + v2), 0, XOffset3),
			PurchasingAnimation = UDim2.new(0, 96 * v1, 0, 20 * v1),
			ButtonIconPadding = 3 * v1,
			ButtonIconYOffset = 2 * v1,
			ButtonHeight = ButtonHeight,
			Dialog = UDim2.new(0, XOffset2 + XOffset, 0, math.max(NewYOffset, YOffset3) + YOffset1 + ButtonHeight)
		}, "LayoutValues.Size"),
		TextSize = StrictModule({
			Default = 18 * v1,
			ProductDescription = 18 * v1,
			Button = 24 * v1,
			AdditionalDetails = 14 * v1,
			Purchasing = 36 * v1
		}, "LayoutValues.TextSize"),
		TextColor = StrictModule({ PriceLabel = Color3.new(1, 1, 1) }, "LayoutValues.TextColor"),
		Image = StrictModule({
			PromptBackground = p1 and {
				Path = "rbxasset://textures/ui/PurchasePrompt/PurchasePromptBG@2x.png",
				SliceCenter = Rect.new(17, 17, 19, 19)
			} or {
				Path = "rbxasset://textures/ui/PurchasePrompt/PurchasePromptBG.png",
				SliceCenter = Rect.new(8, 9, 10, 10)
			},
			InProgressBackground = p1 and {
				Path = "rbxasset://textures/ui/PurchasePrompt/LoadingBG@2x.png",
				SliceCenter = Rect.new(17, 17, 19, 19)
			} or {
				Path = "rbxasset://textures/ui/PurchasePrompt/LoadingBG.png",
				SliceCenter = Rect.new(9, 9, 11, 11)
			},
			ButtonUpLeft = p1 and {
				Path = "rbxasset://textures/ui/PurchasePrompt/LeftButton@2x.png",
				SliceCenter = Rect.new(18, 5, 20, 7)
			} or {
				Path = "rbxasset://textures/ui/PurchasePrompt/LeftButton.png",
				SliceCenter = Rect.new(8, 3, 10, 4)
			},
			ButtonDownLeft = p1 and {
				Path = "rbxasset://textures/ui/PurchasePrompt/LeftButtonDown@2x.png",
				SliceCenter = Rect.new(18, 5, 20, 7)
			} or {
				Path = "rbxasset://textures/ui/PurchasePrompt/LeftButtonDown.png",
				SliceCenter = Rect.new(8, 3, 10, 4)
			},
			ButtonUpRight = p1 and {
				Path = "rbxasset://textures/ui/PurchasePrompt/RightButton@2x.png",
				SliceCenter = Rect.new(3, 5, 5, 7)
			} or {
				Path = "rbxasset://textures/ui/PurchasePrompt/RightButton.png",
				SliceCenter = Rect.new(2, 3, 3, 4)
			},
			ButtonDownRight = p1 and {
				Path = "rbxasset://textures/ui/PurchasePrompt/RightButtonDown@2x.png",
				SliceCenter = Rect.new(3, 5, 5, 7)
			} or {
				Path = "rbxasset://textures/ui/PurchasePrompt/RightButtonDown.png",
				SliceCenter = Rect.new(2, 3, 3, 4)
			},
			ButtonUp = p1 and {
				Path = "rbxasset://textures/ui/PurchasePrompt/SingleButton@2x.png",
				SliceCenter = Rect.new(18, 5, 20, 7)
			} or {
				Path = "rbxasset://textures/ui/PurchasePrompt/SingleButton.png",
				SliceCenter = Rect.new(8, 3, 10, 4)
			},
			ButtonDown = p1 and {
				Path = "rbxasset://textures/ui/PurchasePrompt/SingleButtonDown@2x.png",
				SliceCenter = Rect.new(18, 5, 20, 7)
			} or {
				Path = "rbxasset://textures/ui/PurchasePrompt/SingleButtonDown.png",
				SliceCenter = Rect.new(8, 3, 10, 4)
			},
			PremiumIcon = {
				Path = "rbxasset://textures/ui/PurchasePrompt/Premium.png",
				SliceCenter = nil
			},
			RobuxIcon = p1 and {
				Path = "rbxasset://textures/ui/common/robux_small@2x.png",
				SliceCenter = nil
			} or {
				Path = "rbxasset://textures/ui/common/robux_small.png",
				SliceCenter = nil
			},
			ErrorIcon = p1 and {
				Path = "rbxasset://textures/ui/ErrorIcon.png",
				SliceCenter = nil
			} or {
				Path = "rbxasset://textures/ui/ErrorIcon.png",
				SliceCenter = nil
			},
			ButtonA = p1 and {
				Path = "rbxasset://textures/ui/Settings/Help/AButtonDark@2x.png",
				SliceCenter = nil
			} or {
				Path = "rbxasset://textures/ui/Settings/Help/AButtonDark.png",
				SliceCenter = nil
			},
			ButtonB = p1 and {
				Path = "rbxasset://textures/ui/Settings/Help/BButtonDark@2x.png",
				SliceCenter = nil
			} or {
				Path = "rbxasset://textures/ui/Settings/Help/BButtonDark.png",
				SliceCenter = nil
			}
		}, "LayoutValues.Image")
	}, "LayoutValues"))
end

return LayoutValuesModule