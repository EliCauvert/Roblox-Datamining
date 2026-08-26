local parent = script.Parent.Parent
local boundsDataUtilsModule = require(parent.util.BoundsDataUtils)
local getAttachmentCFrameInPartSpaceModule = require(parent.util.getAttachmentCFrameInPartSpace)
local t = {
	clampAttachmentToBounds = function(value, minValue, maxValue, p1)
		-- upvalues: getAttachmentCFrameInPartSpaceModule (ref), boundsDataUtilsModule (ref)
		p1 = p1 or 0.001
		local var1 = minValue.cframe * getAttachmentCFrameInPartSpaceModule(value)
		local var2 = boundsDataUtilsModule.calculateBoundsCenters(minValue.boundsData)
		local var3 = boundsDataUtilsModule.calculateBoundsDimensions(minValue.boundsData)
		assert(var2, "meshCenterPos is nil")
		assert(var3, "meshDimensions is nil")
		local var4 = var1.Position - var2
		local var5 = maxValue.min * (var3 / 2)
		local var6 = maxValue.max * (var3 / 2)
		local t = {}
		
		for i, v in { "X", "Y", "Z" } do
			t[v] = {}
			local var7 = t[v]
			local var8 = t[v]
			local var9 = var6[v] - p1
			var7.min = var5[v] + p1
			var8.max = var9
			
			if t[v].max < t[v].min then
				local var10 = (var5[v] + var6[v]) * 0.5
				local var11 = t[v]
				t[v].min = var10
				var11.max = var10
			end
		end
		local var12 = var1.Rotation + (var2 + Vector3.new(math.clamp(var4.X, t.X.min, t.X.max), math.clamp(var4.Y, t.Y.min, t.Y.max), math.clamp(var4.Z, t.Z.min, t.Z.max)))
		local cframe = minValue.cframe
		
		return CFrame.new(cframe.Rotation:Inverse() * (var12.Position - cframe.Position)) * (cframe.Rotation:Inverse() * var12.Rotation)
	end,
	calculateAcceptableBoundsLocalSpace = function(p2, p3, p4, p5)
		local var13 = p2.min * (p4 / 2)
		local var14 = p2.max * (p4 / 2)
		local var15 = var14 - var13
		local var16 = (var13 + var14) * 0.5 + p5
		local cframe = p3.cframe
		local cFrame = CFrame.new(var16)
		
		return CFrame.new(cframe.Rotation:Inverse() * (cFrame.Position - cframe.Position)) * (cframe.Rotation:Inverse() * cFrame.Rotation), var15
	end
}

local function _(p2, p3)
	return p2 * (p3 / 2)
end

local _ = function(p2, p3)
	return CFrame.new(p2.Rotation:Inverse() * (p3.Position - p2.Position)) * (p2.Rotation:Inverse() * p3.Rotation)
end

local _ = function(p2, p3, p4)
	local var13 = p2.min * (p3 / 2)
	local var14 = p2.max * (p3 / 2)
	
	return (var13 + var14) * 0.5 + p4, var14 - var13
end

return t