local GuiService = game:GetService("GuiService")

local function getShopViewportBounds(Vector) --[[ Line: 8 ]]
	-- upvalues: GuiService (copy)
	local TopbarInset = GuiService.TopbarInset
	local _, GuiInset2 = GuiService:GetGuiInset()
	
	return {
		min = Vector2.new(0, TopbarInset.Max.Y),
		max = Vector2.new(Vector.X, Vector.Y - GuiInset2.Y)
	}
end

local function getScrollClipBounds(Frame) --[[ Line: 25 ]]
	local Frame1 = Frame
	while Frame1 do
		if Frame1:IsA("ScrollingFrame") then
			local AbsolutePosition = Frame1.AbsolutePosition
			
			return {
				min = AbsolutePosition,
				max = AbsolutePosition + Frame1.AbsoluteSize
			}
		end
		Frame1 = Frame1.Parent
	end
	return nil
end

return {
	getShopViewportBounds = getShopViewportBounds,
	getShopImpressionsViewportBounds = function(p1, p2) --[[ Line: 44 ]]
		-- upvalues: getShopViewportBounds (copy), getScrollClipBounds (copy)
		local ShopViewportBounds = getShopViewportBounds(p1)
		
		if p2 == nil then
			return ShopViewportBounds
		else
			local ScrollClipBounds = getScrollClipBounds(p2)
			
			return if ScrollClipBounds == nil then ShopViewportBounds else {
				min = ShopViewportBounds.min:Max(ScrollClipBounds.min),
				max = ShopViewportBounds.max:Min(ScrollClipBounds.max)
			}
		end
	end,
	intersectViewPortBounds = function(ShopViewportBounds, ShopViewportBounds1) --[[ Line: 18 ]]
		return {
			min = ShopViewportBounds.min:Max(ShopViewportBounds1.min),
			max = ShopViewportBounds.max:Min(ShopViewportBounds1.max)
		}
	end,
	getScrollClipBounds = getScrollClipBounds
}