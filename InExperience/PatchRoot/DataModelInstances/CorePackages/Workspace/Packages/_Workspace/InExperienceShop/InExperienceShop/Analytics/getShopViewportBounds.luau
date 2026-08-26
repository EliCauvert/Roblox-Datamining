local guiService = game:GetService("GuiService")

local function getShopViewportBounds(p1)
	-- upvalues: guiService (ref)
	local topbarInset = guiService.TopbarInset
	local _, guiInset = guiService:GetGuiInset()
	
	return {
		min = Vector2.new(0, topbarInset.Max.Y),
		max = Vector2.new(p1.X, p1.Y - guiInset.Y)
	}
end

local function getScrollClipBounds(p1)
	local var1 = p1
	while var1 do
		if not var1:IsA("ScrollingFrame") then
			var1 = var1.Parent
			continue
		end
		local absolutePosition = var1.AbsolutePosition
		
		return {
			min = absolutePosition,
			max = absolutePosition + var1.AbsoluteSize
		}
	end
	return nil
end

return {
	getShopViewportBounds = getShopViewportBounds,
	getShopImpressionsViewportBounds = function(p2, p3)
		-- upvalues: getShopViewportBounds (ref), getScrollClipBounds (ref)
		local var2 = getShopViewportBounds(p2)
		
		if p3 == nil then
			return var2
		end
		local var3 = getScrollClipBounds(p3)
		
		return if var3 == nil then var2 else {
			min = var2.min:Max(var3.min),
			max = var2.max:Min(var3.max)
		}
	end,
	intersectViewPortBounds = function(p2, p3)
		return { min = p2.min:Max(p3.min), max = p2.max:Min(p3.max) }
	end,
	getScrollClipBounds = getScrollClipBounds
}