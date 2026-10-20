local CoreGui = game:GetService("CoreGui")
local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local FIntAXGuiObjectIsObscuredPaddingModule = require(BulkPurchaseApp.Flags.FIntAXGuiObjectIsObscuredPadding)
local FFlagFixBulkPurchaseTopBarObfuscation = require(BulkPurchaseApp.Parent.SharedFlags).FFlagFixBulkPurchaseTopBarObfuscation

local function _(Image): boolean
	-- upvalues: FFlagFixBulkPurchaseTopBarObfuscation (copy)
	return FFlagFixBulkPurchaseTopBarObfuscation and (Image:IsA("ImageLabel") and Image.ImageTransparency == 1)
end

local _ = function(Frame): boolean
	-- upvalues: FFlagFixBulkPurchaseTopBarObfuscation (copy)
	return FFlagFixBulkPurchaseTopBarObfuscation and (Frame.BackgroundTransparency == 0 and (Frame:HasTag("gui-object-defaults") and not Frame:HasTag("x-default-transparency")))
end

local function getGuiObjectIsObscuredAtPosition(Frame, XDelta, YDelta): boolean
	-- upvalues: CoreGui (copy), FFlagFixBulkPurchaseTopBarObfuscation (copy)
	for _, Frame1 in CoreGui:GetGuiObjectsAtPosition(XDelta, YDelta) do
		if (not Frame1:IsA("Frame") and (not FFlagFixBulkPurchaseTopBarObfuscation or (not Frame1:IsA("ImageLabel") or Frame1.ImageTransparency ~= 1)) or Frame1.Active ~= false or Frame1.BackgroundTransparency ~= 1 and (not FFlagFixBulkPurchaseTopBarObfuscation or (Frame1.BackgroundTransparency ~= 0 or (not Frame1:HasTag("gui-object-defaults") or Frame1:HasTag("x-default-transparency"))))) and not Frame1:IsDescendantOf(Frame) then
			return Frame1 ~= Frame
		end
	end
	return false
end

return function(Frame: Frame)
	-- upvalues: getGuiObjectIsObscuredAtPosition (copy), FIntAXGuiObjectIsObscuredPaddingModule (copy)
	local AbsolutePosition: number = Frame.AbsolutePosition
	local AbsoluteSize: number = Frame.AbsoluteSize
	local NewAbsolutePosition = AbsolutePosition + AbsoluteSize * 0.5
	local NewAbsolutePosition1 = AbsolutePosition + AbsoluteSize
	local NewAbsolutePosition2 = AbsolutePosition + Vector2.new(AbsoluteSize.X, 0)
	local NewAbsolutePosition3 = AbsolutePosition + Vector2.new(0, AbsoluteSize.Y)
	local NewAbsolutePosition4 = AbsolutePosition + AbsoluteSize * Vector2.new(math.random(1, 9) / 10, math.random(1, 9) / 10)
	
	return getGuiObjectIsObscuredAtPosition(Frame, NewAbsolutePosition.X, NewAbsolutePosition.Y) or (getGuiObjectIsObscuredAtPosition(Frame, AbsolutePosition.X + FIntAXGuiObjectIsObscuredPaddingModule, AbsolutePosition.Y + FIntAXGuiObjectIsObscuredPaddingModule) or (getGuiObjectIsObscuredAtPosition(Frame, NewAbsolutePosition3.X + FIntAXGuiObjectIsObscuredPaddingModule, NewAbsolutePosition3.Y - FIntAXGuiObjectIsObscuredPaddingModule) or (getGuiObjectIsObscuredAtPosition(Frame, NewAbsolutePosition2.X - FIntAXGuiObjectIsObscuredPaddingModule, NewAbsolutePosition2.Y + FIntAXGuiObjectIsObscuredPaddingModule) or (getGuiObjectIsObscuredAtPosition(Frame, NewAbsolutePosition1.X - FIntAXGuiObjectIsObscuredPaddingModule, NewAbsolutePosition1.Y - FIntAXGuiObjectIsObscuredPaddingModule) or getGuiObjectIsObscuredAtPosition(Frame, math.floor(NewAbsolutePosition4.X), (math.floor(NewAbsolutePosition4.Y)))))))
end