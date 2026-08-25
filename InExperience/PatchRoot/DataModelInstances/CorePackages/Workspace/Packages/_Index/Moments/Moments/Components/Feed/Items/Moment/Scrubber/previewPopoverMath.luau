return {
	getCenterOffsetX = function(value)
		local var0 = value.containerPosition + value.ratio * value.containerWidth
		local var1 = value.insetLeft + value.margin
		local var2 = value.screenWidth - value.insetRight - value.margin
		local var3 = var2 - var1
		
		if var3 <= 0 or value.popoverWidth <= 0 then
			return var0 - value.containerPosition
		end
		local var4 = var1 + value.popoverWidth / 2
		local var5 = var2 - value.popoverWidth / 2
		
		return (if var5 < var4 then var1 + var3 / 2 else math.clamp(var0, var4, var5)) - value.containerPosition
	end
}