local foundation = script:FindFirstAncestor("Foundation")
local popoverAlignModule = require(foundation.Enums.PopoverAlign)
local popoverSideModule = require(foundation.Enums.PopoverSide)
local _ = require(foundation.Providers.StudioPanels.Types)

return function(p1, p2, p3, p4, p5)
	-- upvalues: popoverAlignModule (ref), popoverSideModule (ref)
	local var1 = 0
	local var2 = 0
	local var3 = p1
	local var4 = p2
	
	if type(p1) == "table" then
		var1 = p1.offset
		var3 = p1.position
	end
	if type(p2) == "table" then
		var2 = p2.offset
		var4 = p2.position
	end
	local var5 = var1 + (p5 or 0)
	local var6 = 0
	
	if var4 == popoverAlignModule.Center then
		var6 = 0.5
		var2 = 0
	elseif var4 == popoverAlignModule.End then
		var6 = 1
		var2 = -var2
	end
	local var7 = nil
	local zero = nil
	local vector2 = nil
	
	if var3 == popoverSideModule.Top then
		var7 = Vector2.new(var2, -var5)
		zero = Vector2.new(var6, 0)
		vector2 = Vector2.new(var6, 1)
	elseif var3 == popoverSideModule.Bottom then
		var7 = Vector2.new(var2, var5)
		zero = Vector2.new(var6, 1)
		vector2 = Vector2.new(var6, 0)
	elseif var3 == popoverSideModule.Left then
		var7 = Vector2.new(-var5, var2)
		zero = Vector2.new(0, var6)
		vector2 = Vector2.new(1, var6)
	elseif var3 == popoverSideModule.Right then
		var7 = Vector2.new(var5, var2)
		zero = Vector2.new(1, var6)
		vector2 = Vector2.new(0, var6)
	end
	p4 = p4 or 0
	
	if p4 > 0 then
		local var8 = if var3 ~= popoverSideModule.Top then var3 == popoverSideModule.Bottom else true
		local var9 = p4 * 2
		local var10 = p4 * 2
		
		if var8 then
			var9 += var2
			var10 += var5
		else
			var9 += var5
			var10 += var2
		end
		var7 += Vector2.new(vector2.X * var9 - p4, vector2.Y * var10 - p4)
	end
	if p3 then
		var7 = p3
		zero = Vector2.zero
	end
	return {
		targetAnchorPoint = zero,
		subjectAnchorPoint = vector2,
		offset = var7
	}
end