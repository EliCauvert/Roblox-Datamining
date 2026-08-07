local tnSAvatarIdentification = script:FindFirstAncestor("TnSAvatarIdentification")
local getFFlagReportAnythingFixConvexHullCalculationModule = require(tnSAvatarIdentification.Flags.GetFFlagReportAnythingFixConvexHullCalculation)
local getFFlagAvatarIdentificationSafeAreaFix = require(tnSAvatarIdentification.Parent.SharedFlags).GetFFlagAvatarIdentificationSafeAreaFix
local var2 = if getFFlagAvatarIdentificationSafeAreaFix() then game:GetService("CoreGui") else nil

local function getViewportInfo() --[[ line: 24 ]]
	-- upvalues: var2 (write)
	assert(var2, "getViewportInfo requires CoreGui to be available")
	local fullscreenTestGuiAvatarID_1 = var2:FindFirstChild("_FullscreenTestGui_AvatarID")
	
	if not fullscreenTestGuiAvatarID_1 then
		fullscreenTestGuiAvatarID_1 = Instance.new("ScreenGui")
		fullscreenTestGuiAvatarID_1.Name = "_FullscreenTestGui_AvatarID"
		fullscreenTestGuiAvatarID_1.Parent = var2
		fullscreenTestGuiAvatarID_1.ScreenInsets = Enum.ScreenInsets.None
	end
	local deviceTestGuiAvatarID_1 = var2:FindFirstChild("_DeviceTestGui_AvatarID")
	
	if not deviceTestGuiAvatarID_1 then
		deviceTestGuiAvatarID_1 = Instance.new("ScreenGui")
		deviceTestGuiAvatarID_1.Name = "_DeviceTestGui_AvatarID"
		deviceTestGuiAvatarID_1.Parent = var2
		deviceTestGuiAvatarID_1.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
	end
	local var8 = deviceTestGuiAvatarID_1.AbsolutePosition - fullscreenTestGuiAvatarID_1.AbsolutePosition
	local var9 = fullscreenTestGuiAvatarID_1.AbsolutePosition + fullscreenTestGuiAvatarID_1.AbsoluteSize - (deviceTestGuiAvatarID_1.AbsolutePosition + deviceTestGuiAvatarID_1.AbsoluteSize)
	
	return {
		width = fullscreenTestGuiAvatarID_1.AbsoluteSize.X,
		height = fullscreenTestGuiAvatarID_1.AbsoluteSize.Y,
		insets = {
			left = var8.X,
			top = var8.Y,
			right = var9.X,
			bottom = var9.Y
		}
	}
end

local vector2 = Vector2.new(0, 0)
local vector2_1 = Vector2.new(1e999, 1e999)

local _ = function(p0) --[[ line: 59 ]]
	return if p0.Y >= 0 then if p0.Y <= 1 then if p0.X >= 0 then p0.X > 1 else true else true else true
end

function worldToFullViewportPointNormalized(p1, p2, p3) --[[ line: 63 ]]
	local var10, _ = p2:WorldToViewportPoint(p1)
	local vector2 = Vector2.new((var10.X + p3.insets.left) / p3.width, (var10.Y + p3.insets.top) / p3.height)
	
	return vector2, var10.Z, not (if vector2.Y >= 0 then if vector2.Y <= 1 then if vector2.X >= 0 then vector2.X > 1 else true else true else true) and var10.Z > 0
end

function getViewportCorners(p4, p5, p6) --[[ line: 80 ]]
	-- upvalues: vector2_1 (ref), vector2 (ref), getFFlagAvatarIdentificationSafeAreaFix (ref), getFFlagReportAnythingFixConvexHullCalculationModule (ref)
	local var12 = vector2_1
	local var13 = vector2
	local viewportSize = p5.ViewportSize
	local var14 = 0
	
	for i, v in ipairs(p4) do
		local var18, var19
		local _ = nil
		local _ = nil
		local _ = nil
		
		if getFFlagAvatarIdentificationSafeAreaFix() then
			assert(p6, "getViewportCorners requires viewportInfo when FFlagAvatarIdentificationSafeAreaFix is enabled")
			local var15, var16, var17 = worldToFullViewportPointNormalized(v, p5, p6)
			var18 = var15
			i = var16
			var19 = var17
		else
			local var20, var21 = p5:WorldToViewportPoint(v)
			local var22 = var20
			var19 = var21
			var18 = Vector2.new(var22.X / viewportSize.X, var22.Y / viewportSize.Y)
		end
		if not var19 then
			var18 = Vector2.new(math.clamp(var18.X, 0, 1), math.clamp(var18.Y, 0, 1))
		end
		if not getFFlagReportAnythingFixConvexHullCalculationModule() then
			var14 += 1
		elseif var19 then
			var14 += 1
		end
		var12 = var12:Min(var18)
		var13 = var13:Max(var18)
	end
	if var14 <= 2 then
		return vector2_1, vector2
	end
	return var12, var13
end

function shouldIgnoreLocalCharacter(p7) --[[ line: 125 ]]
	local head = p7:FindFirstChild("Head")
	
	return if head and head:IsA("BasePart") then head.LocalTransparencyModifier >= 0.95 else false
end

function getLocalCharacterPosition(p8) --[[ line: 134 ]]
	local humanoidRootPart = p8:FindFirstChild("HumanoidRootPart")
	
	return if humanoidRootPart then humanoidRootPart.Position else nil
end

return {
	getViewportInfo = getViewportInfo,
	getViewportCorners = getViewportCorners,
	worldToFullViewportPointNormalized = worldToFullViewportPointNormalized,
	shouldIgnoreLocalCharacter = shouldIgnoreLocalCharacter,
	getLocalCharacterPosition = getLocalCharacterPosition,
	defaultMin = vector2_1
}