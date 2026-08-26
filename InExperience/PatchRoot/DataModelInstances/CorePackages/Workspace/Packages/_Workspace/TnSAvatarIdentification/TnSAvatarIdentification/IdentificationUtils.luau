local getFFlagReportAnythingFixConvexHullCalculationModule = require(script:FindFirstAncestor("TnSAvatarIdentification").Flags.GetFFlagReportAnythingFixConvexHullCalculation)
local coreGuiService = game:GetService("CoreGui")

local function getViewportInfo()
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
	local var1 = deviceTestGuiAvatarID_1.AbsolutePosition - fullscreenTestGuiAvatarID_1.AbsolutePosition
	local var2 = fullscreenTestGuiAvatarID_1.AbsolutePosition + fullscreenTestGuiAvatarID_1.AbsoluteSize - (deviceTestGuiAvatarID_1.AbsolutePosition + deviceTestGuiAvatarID_1.AbsoluteSize)
	
	return {
		width = fullscreenTestGuiAvatarID_1.AbsoluteSize.X,
		height = fullscreenTestGuiAvatarID_1.AbsoluteSize.Y,
		insets = {
			left = var1.X,
			top = var1.Y,
			right = var2.X,
			bottom = var2.Y
		}
	}
end

local vector2 = Vector2.new(0, 0)
local vector2_1 = Vector2.new(1e999, 1e999)

local _ = function(p1)
	return if p1.Y >= 0 then if p1.Y <= 1 then if p1.X >= 0 then p1.X > 1 else true else true else true
end

function worldToFullViewportPointNormalized(p1, p2, p3)
	local var1, _ = p2:WorldToViewportPoint(p1)
	local vector2 = Vector2.new((var1.X + p3.insets.left) / p3.width, (var1.Y + p3.insets.top) / p3.height)
	
	return vector2, var1.Z, not (if vector2.Y >= 0 then if vector2.Y <= 1 then if vector2.X >= 0 then vector2.X > 1 else true else true else true) and var1.Z > 0
end

function getViewportCorners(p1, p2, p3)
	-- upvalues: vector2_1 (ref), vector2 (ref), getFFlagReportAnythingFixConvexHullCalculationModule (ref)
	local var1 = vector2_1
	local var2 = vector2
	local var3 = 0
	
	for i, v in ipairs(p1) do
		local _ = nil
		local _ = nil
		assert(p3, "getViewportCorners requires viewportInfo")
		local var4, var5, var6 = worldToFullViewportPointNormalized(v, p2, p3)
		local var7 = var4
		i = var5
		local var8 = var6
		
		if not var8 then
			var7 = Vector2.new(math.clamp(var7.X, 0, 1), math.clamp(var7.Y, 0, 1))
		end
		if not getFFlagReportAnythingFixConvexHullCalculationModule() then
			var3 += 1
		elseif var8 then
			var3 += 1
		end
		var1 = var1:Min(var7)
		var2 = var2:Max(var7)
	end
	if var3 <= 2 then
		return vector2_1, vector2
	end
	return var1, var2
end

function shouldIgnoreLocalCharacter(p4)
	local head = p4:FindFirstChild("Head")
	
	return if head and head:IsA("BasePart") then head.LocalTransparencyModifier >= 0.95 else false
end

function getLocalCharacterPosition(p4)
	local humanoidRootPart = p4:FindFirstChild("HumanoidRootPart")
	
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