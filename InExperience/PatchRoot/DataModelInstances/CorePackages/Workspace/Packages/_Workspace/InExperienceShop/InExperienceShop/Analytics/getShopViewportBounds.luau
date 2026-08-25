local guiService = game:GetService("GuiService")

local function getShopViewportBounds(p0)
	-- upvalues: guiService (ref)
	local topbarInset = guiService.TopbarInset
	local _, guiInset = guiService:GetGuiInset()
	
	return {
		min = Vector2.new(0, topbarInset.Max.Y),
		max = Vector2.new(p0.X, p0.Y - guiInset.Y)
	}
end

local function getScrollClipBounds(p1)
	local var4 = p1
	while var4 do
		if not var4:IsA("ScrollingFrame") then
			var4 = var4.Parent
			continue
		end
		local absolutePosition = var4.AbsolutePosition
		
		return {
			min = absolutePosition,
			max = absolutePosition + var4.AbsoluteSize
		}
	end
	return nil
end

return {
	getShopViewportBounds = getShopViewportBounds,
	getShopImpressionsViewportBounds = function(p2, p3)
		-- upvalues: getShopViewportBounds (ref), getScrollClipBounds (ref)
		local var5 = getShopViewportBounds(p2)
		
		if p3 == nil then
			return var5
		end
		local var6 = getScrollClipBounds(p3)
		
		return if var6 == nil then var5 else {
			min = var5.min:Max(var6.min),
			max = var5.max:Min(var6.max)
		}
	end,
	intersectViewPortBounds = function(p4, p5)
		return { min = p4.min:Max(p5.min), max = p4.max:Min(p5.max) }
	end,
	getScrollClipBounds = getScrollClipBounds
}