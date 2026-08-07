local parent = script.Parent.Parent
local boundsDataUtilsModule = require(parent.util.BoundsDataUtils)
local getAttachmentCFrameInPartSpaceModule = require(parent.util.getAttachmentCFrameInPartSpace)
local t = {
	clampAttachmentToBounds = function(value, minValue, maxValue, p0) --[[ line: 47 ]]
		-- upvalues: getAttachmentCFrameInPartSpaceModule (ref), boundsDataUtilsModule (ref)
		p0 = p0 or 0.001
		local var3 = minValue.cframe * getAttachmentCFrameInPartSpaceModule(value)
		local var4 = boundsDataUtilsModule.calculateBoundsCenters(minValue.boundsData)
		local var5 = boundsDataUtilsModule.calculateBoundsDimensions(minValue.boundsData)
		assert(var4, "meshCenterPos is nil")
		assert(var5, "meshDimensions is nil")
		local var6 = var3.Position - var4
		local var7 = maxValue.min * (var5 / 2)
		local var8 = maxValue.max * (var5 / 2)
		local t = {}
		
		for i, v in { "X", "Y", "Z" } do
			t[v] = {}
			local var11 = t[v]
			local var12 = t[v]
			local var13 = var8[v] - p0
			var11.min = var7[v] + p0
			var12.max = var13
			
			if t[v].max < t[v].min then
				local var14 = (var7[v] + var8[v]) * 0.5
				local var15 = t[v]
				t[v].min = var14
				var15.max = var14
			end
		end
		local var10 = var3.Rotation + (var4 + Vector3.new(math.clamp(var6.X, t.X.min, t.X.max), math.clamp(var6.Y, t.Y.min, t.Y.max), math.clamp(var6.Z, t.Z.min, t.Z.max)))
		local cframe = minValue.cframe
		
		return CFrame.new(cframe.Rotation:Inverse() * (var10.Position - cframe.Position)) * (cframe.Rotation:Inverse() * var10.Rotation)
	end,
	calculateAcceptableBoundsLocalSpace = function(p1, p2, p3, p4) --[[ line: 92 ]]
		local var16 = p1.min * (p3 / 2)
		local var17 = p1.max * (p3 / 2)
		local var18 = var17 - var16
		local var19 = (var16 + var17) * 0.5 + p4
		local cframe = p2.cframe
		local cFrame = CFrame.new(var19)
		
		return CFrame.new(cframe.Rotation:Inverse() * (cFrame.Position - cframe.Position)) * (cframe.Rotation:Inverse() * cFrame.Rotation), var18
	end
}

local function _(p5, p6) --[[ line: 20 | named "toWorldSpace" ]]
	return p5 * (p6 / 2)
end

local _ = function(p7, p8) --[[ line: 26 | named "calculateLocalSpaceTransform" ]]
	return CFrame.new(p7.Rotation:Inverse() * (p8.Position - p7.Position)) * (p7.Rotation:Inverse() * p8.Rotation)
end

local _ = function(p9, p10, p11) --[[ line: 34 | named "calculateAcceptableBoundsWorldSpace" ]]
	local var21 = p9.min * (p10 / 2)
	local var22 = p9.max * (p10 / 2)
	
	return (var21 + var22) * 0.5 + p11, var22 - var21
end

return t