local getFFlagReportAnythingFixConvexHullCalculationModule = require(script:FindFirstAncestor("TnSAvatarIdentification").Flags.GetFFlagReportAnythingFixConvexHullCalculation)
local coreGuiService = game:GetService("CoreGui")

local function getViewportInfo() --[[ line: 17 ]]
	-- upvalues: coreGuiService (ref)
	assert(coreGuiService, "getViewportInfo requires CoreGui to be available")
	local fullscreenTestGuiAvatarID_1 = coreGuiService:FindFirstChild("_FullscreenTestGui_AvatarID")
	
	if not fullscreenTestGuiAvatarID_1 then
		fullscreenTestGuiAvatarID_1 = Instance.new("ScreenGui")
		fullscreenTestGuiAvatarID_1.Name = "_FullscreenTestGui_AvatarID"
		fullscreenTestGuiAvatarID_1.Parent = coreGuiService
		fullscreenTestGuiAvatarID_1.ScreenInsets = Enum.ScreenInsets.None
	end
	local deviceTestGuiAvatarID_1 = coreGuiService:FindFirstChild("_DeviceTestGui_AvatarID")
	
	if not deviceTestGuiAvatarID_1 then
		deviceTestGuiAvatarID_1 = Instance.new("ScreenGui")
		deviceTestGuiAvatarID_1.Name = "_DeviceTestGui_AvatarID"
		deviceTestGuiAvatarID_1.Parent = coreGuiService
		deviceTestGuiAvatarID_1.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
	end
	local var7 = deviceTestGuiAvatarID_1.AbsolutePosition - fullscreenTestGuiAvatarID_1.AbsolutePosition
	local var8 = fullscreenTestGuiAvatarID_1.AbsolutePosition + fullscreenTestGuiAvatarID_1.AbsoluteSize - (deviceTestGuiAvatarID_1.AbsolutePosition + deviceTestGuiAvatarID_1.AbsoluteSize)
	
	return {
		width = fullscreenTestGuiAvatarID_1.AbsoluteSize.X,
		height = fullscreenTestGuiAvatarID_1.AbsoluteSize.Y,
		insets = {
			left = var7.X,
			top = var7.Y,
			right = var8.X,
			bottom = var8.Y
		}
	}
end

local vector2 = Vector2.new(0, 0)
local vector2_1 = Vector2.new(1e999, 1e999)

local _ = function(p0) --[[ line: 52 ]]
	return if p0.Y >= 0 then if p0.Y <= 1 then if p0.X >= 0 then p0.X > 1 else true else true else true
end

function worldToFullViewportPointNormalized(p1, p2, p3) --[[ line: 56 ]]
	local var9, _ = p2:WorldToViewportPoint(p1)
	local vector2 = Vector2.new((var9.X + p3.insets.left) / p3.width, (var9.Y + p3.insets.top) / p3.height)
	
	return vector2, var9.Z, not (if vector2.Y >= 0 then if vector2.Y <= 1 then if vector2.X >= 0 then vector2.X > 1 else true else true else true) and var9.Z > 0
end

function getViewportCorners(p4, p5, p6) --[[ line: 73 ]]
	-- upvalues: vector2_1 (ref), vector2 (ref), getFFlagReportAnythingFixConvexHullCalculationModule (ref)
	local var11 = vector2_1
	local var12 = vector2
	local var13 = 0
	
	for i, v in ipairs(p4) do
		local _ = nil
		local _ = nil
		assert(p6, "getViewportCorners requires viewportInfo")
		local var14, var15, var16 = worldToFullViewportPointNormalized(v, p5, p6)
		local var17 = var14
		i = var15
		local var18 = var16
		
		if not var18 then
			var17 = Vector2.new(math.clamp(var17.X, 0, 1), math.clamp(var17.Y, 0, 1))
		end
		if not getFFlagReportAnythingFixConvexHullCalculationModule() then
			var13 += 1
		elseif var18 then
			var13 += 1
		end
		var11 = var11:Min(var17)
		var12 = var12:Max(var17)
	end
	if var13 <= 2 then
		return vector2_1, vector2
	end
	return var11, var12
end

function shouldIgnoreLocalCharacter(p7) --[[ line: 109 ]]
	local head = p7:FindFirstChild("Head")
	
	return if head and head:IsA("BasePart") then head.LocalTransparencyModifier >= 0.95 else false
end

function getLocalCharacterPosition(p8) --[[ line: 118 ]]
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