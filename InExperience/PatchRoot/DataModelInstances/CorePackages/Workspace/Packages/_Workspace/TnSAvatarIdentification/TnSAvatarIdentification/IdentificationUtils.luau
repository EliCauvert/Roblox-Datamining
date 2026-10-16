local GetFFlagReportAnythingFixConvexHullCalculationModule = require(script:FindFirstAncestor("TnSAvatarIdentification").Flags.GetFFlagReportAnythingFixConvexHullCalculation)
local CoreGui = game:GetService("CoreGui")

local function getViewportInfo() --[[ Line: 17 ]]
	-- upvalues: CoreGui (copy)
	assert(CoreGui, "getViewportInfo requires CoreGui to be available")
	local _FullscreenTestGui_AvatarID = CoreGui:FindFirstChild("_FullscreenTestGui_AvatarID")
	
	if not _FullscreenTestGui_AvatarID then
		_FullscreenTestGui_AvatarID = Instance.new("ScreenGui")
		_FullscreenTestGui_AvatarID.Name = "_FullscreenTestGui_AvatarID"
		_FullscreenTestGui_AvatarID.Parent = CoreGui
		_FullscreenTestGui_AvatarID.ScreenInsets = Enum.ScreenInsets.None
	end
	local _DeviceTestGui_AvatarID = CoreGui:FindFirstChild("_DeviceTestGui_AvatarID")
	
	if not _DeviceTestGui_AvatarID then
		_DeviceTestGui_AvatarID = Instance.new("ScreenGui")
		_DeviceTestGui_AvatarID.Name = "_DeviceTestGui_AvatarID"
		_DeviceTestGui_AvatarID.Parent = CoreGui
		_DeviceTestGui_AvatarID.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
	end
	local AbsolutePositionDelta = _DeviceTestGui_AvatarID.AbsolutePosition - _FullscreenTestGui_AvatarID.AbsolutePosition
	local AbsolutePositionDelta1 = _FullscreenTestGui_AvatarID.AbsolutePosition + _FullscreenTestGui_AvatarID.AbsoluteSize - (_DeviceTestGui_AvatarID.AbsolutePosition + _DeviceTestGui_AvatarID.AbsoluteSize)
	
	return {
		width = _FullscreenTestGui_AvatarID.AbsoluteSize.X,
		height = _FullscreenTestGui_AvatarID.AbsoluteSize.Y,
		insets = {
			left = AbsolutePositionDelta.X,
			top = AbsolutePositionDelta.Y,
			right = AbsolutePositionDelta1.X,
			bottom = AbsolutePositionDelta1.Y
		}
	}
end

local _Vector2 = Vector2.new(0, 0)
local _Vector2_1 = Vector2.new(1e999, 1e999)

local function _(Vector): boolean --[[ Line: 52 ]]
	return Vector.Y < 0 or (Vector.Y > 1 or (Vector.X < 0 or Vector.X > 1))
end

function worldToFullViewportPointNormalized(Position, Camera: Camera, ViewportInfo) --[[ Line: 56 ]]
	local ViewportPosition, _ = Camera:WorldToViewportPoint(Position)
	local _Vector2 = Vector2.new((ViewportPosition.X + ViewportInfo.insets.left) / ViewportInfo.width, (ViewportPosition.Y + ViewportInfo.insets.top) / ViewportInfo.height)
	
	return _Vector2, ViewportPosition.Z, not (_Vector2.Y < 0 or (_Vector2.Y > 1 or (_Vector2.X < 0 or _Vector2.X > 1))) and ViewportPosition.Z > 0
end

function getViewportCorners(List, p1, p2) --[[ Line: 73 ]]
	-- upvalues: _Vector2_1 (copy), _Vector2 (copy), GetFFlagReportAnythingFixConvexHullCalculationModule (copy)
	local MinResult = _Vector2_1
	local MaxResult = _Vector2
	local Count = 0
	
	for _, value in ipairs(List) do
		assert(p2, "getViewportCorners requires viewportInfo")
		local WorldToFullViewportPointNormalizedResult, _, WorldToFullViewportPointNormalizedResult3 = worldToFullViewportPointNormalized(value, p1, p2)
		
		if not WorldToFullViewportPointNormalizedResult3 then
			WorldToFullViewportPointNormalizedResult = Vector2.new(math.clamp(WorldToFullViewportPointNormalizedResult.X, 0, 1), (math.clamp(WorldToFullViewportPointNormalizedResult.Y, 0, 1)))
		end
		if GetFFlagReportAnythingFixConvexHullCalculationModule() then
			if WorldToFullViewportPointNormalizedResult3 then
				Count += 1
			end
		else
			Count += 1
		end
		MinResult = MinResult:Min(WorldToFullViewportPointNormalizedResult)
		MaxResult = MaxResult:Max(WorldToFullViewportPointNormalizedResult)
	end
	if Count <= 2 then
		return _Vector2_1, _Vector2
	else
		return MinResult, MaxResult
	end
end

function shouldIgnoreLocalCharacter(Object): boolean --[[ Line: 109 ]]
	local Head = Object:FindFirstChild("Head")
	
	return if Head and Head:IsA("BasePart") then Head.LocalTransparencyModifier >= 0.95 else false
end

function getLocalCharacterPosition(Object) --[[ Line: 118 ]]
	local HumanoidRootPart = Object:FindFirstChild("HumanoidRootPart")
	
	return if HumanoidRootPart then HumanoidRootPart.Position else nil
end

return {
	getViewportInfo = getViewportInfo,
	getViewportCorners = getViewportCorners,
	worldToFullViewportPointNormalized = worldToFullViewportPointNormalized,
	shouldIgnoreLocalCharacter = shouldIgnoreLocalCharacter,
	getLocalCharacterPosition = getLocalCharacterPosition,
	defaultMin = _Vector2_1
}