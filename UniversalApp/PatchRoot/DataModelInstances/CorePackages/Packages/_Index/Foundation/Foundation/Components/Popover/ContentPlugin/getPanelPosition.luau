local foundation = script:FindFirstAncestor("Foundation")
local popoverAlignModule = require(foundation.Enums.PopoverAlign)
local popoverSideModule = require(foundation.Enums.PopoverSide)
local _ = require(foundation.Providers.StudioPanels.Types)

return function(p0, p1, p2, p3, p4)
	-- upvalues: popoverAlignModule (ref), popoverSideModule (ref)
	local var3 = 0
	local var4 = 0
	local var5 = p0
	local var6 = p1
	
	if type(p0) == "table" then
		var3 = p0.offset
		var5 = p0.position
	end
	if type(p1) == "table" then
		var4 = p1.offset
		var6 = p1.position
	end
	local var7 = var3 + (p4 or 0)
	local var8 = 0
	
	if var6 == popoverAlignModule.Center then
		var8 = 0.5
		var4 = 0
	elseif var6 == popoverAlignModule.End then
		var8 = 1
		var4 = -var4
	end
	local var9 = nil
	local zero = nil
	local vector2 = nil
	
	if var5 == popoverSideModule.Top then
		var9 = Vector2.new(var4, -var7)
		zero = Vector2.new(var8, 0)
		vector2 = Vector2.new(var8, 1)
	elseif var5 == popoverSideModule.Bottom then
		var9 = Vector2.new(var4, var7)
		zero = Vector2.new(var8, 1)
		vector2 = Vector2.new(var8, 0)
	elseif var5 == popoverSideModule.Left then
		var9 = Vector2.new(-var7, var4)
		zero = Vector2.new(0, var8)
		vector2 = Vector2.new(1, var8)
	elseif var5 == popoverSideModule.Right then
		var9 = Vector2.new(var7, var4)
		zero = Vector2.new(1, var8)
		vector2 = Vector2.new(0, var8)
	end
	p3 = p3 or 0
	
	if p3 > 0 then
		local var13 = if var5 ~= popoverSideModule.Top then var5 == popoverSideModule.Bottom else true
		local var14 = p3 * 2
		local var15 = p3 * 2
		
		if var13 then
			var14 += var4
			var15 += var7
		else
			var14 += var7
			var15 += var4
		end
		var9 += Vector2.new(vector2.X * var14 - p3, vector2.Y * var15 - p3)
	end
	if p2 then
		var9 = p2
		zero = Vector2.zero
	end
	return {
		targetAnchorPoint = zero,
		subjectAnchorPoint = vector2,
		offset = var9
	}
end