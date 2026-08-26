return {
	getCenterOffsetX = function(value)
		local var1 = value.containerPosition + value.ratio * value.containerWidth
		local var2 = value.insetLeft + value.margin
		local var3 = value.screenWidth - value.insetRight - value.margin
		local var4 = var3 - var2
		
		if var4 <= 0 or value.popoverWidth <= 0 then
			return var1 - value.containerPosition
		end
		local var5 = var2 + value.popoverWidth / 2
		local var6 = var3 - value.popoverWidth / 2
		
		return (if var6 < var5 then var2 + var4 / 2 else math.clamp(var1, var5, var6)) - value.containerPosition
	end
}