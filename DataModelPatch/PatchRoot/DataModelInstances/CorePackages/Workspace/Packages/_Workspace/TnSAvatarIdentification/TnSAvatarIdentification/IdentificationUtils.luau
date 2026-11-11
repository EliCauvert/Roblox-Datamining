local TnSAvatarIdentification = script:FindFirstAncestor("TnSAvatarIdentification")
local GetFFlagReportAnythingFixConvexHullCalculationModule = require(TnSAvatarIdentification.Flags.GetFFlagReportAnythingFixConvexHullCalculation)
local GetFFlagAvatarIdentificationSafeAreaFixFunction = require(TnSAvatarIdentification.Parent.SharedFlags).GetFFlagAvatarIdentificationSafeAreaFix
local CoreGui = if GetFFlagAvatarIdentificationSafeAreaFixFunction() then game:GetService("CoreGui") else nil

local function getViewportInfo()
	-- upvalues: CoreGui (ref)
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

local function _(Vector): boolean
	return Vector.Y < 0 or (Vector.Y > 1 or (Vector.X < 0 or Vector.X > 1))
end

function worldToFullViewportPointNormalized(Position, Camera: Camera, ViewportInfo)
	local ViewportPosition, _ = Camera:WorldToViewportPoint(Position)
	local _Vector2 = Vector2.new((ViewportPosition.X + ViewportInfo.insets.left) / ViewportInfo.width, (ViewportPosition.Y + ViewportInfo.insets.top) / ViewportInfo.height)
	
	return _Vector2, ViewportPosition.Z, not (_Vector2.Y < 0 or (_Vector2.Y > 1 or (_Vector2.X < 0 or _Vector2.X > 1))) and ViewportPosition.Z > 0
end

function getViewportCorners(List, Camera: Camera, p1)
	-- upvalues: _Vector2_1 (copy), _Vector2 (copy), GetFFlagAvatarIdentificationSafeAreaFixFunction (copy), GetFFlagReportAnythingFixConvexHullCalculationModule (copy)
	local MinResult = _Vector2_1
	local MaxResult = _Vector2
	local ViewportSize = Camera.ViewportSize
	local Count = 0
	
	for _, Position in ipairs(List) do
		local WorldToFullViewportPointNormalizedResult3 = nil
		local WorldToFullViewportPointNormalizedResult = nil
		if GetFFlagAvatarIdentificationSafeAreaFixFunction() then
			assert(p1, "getViewportCorners requires viewportInfo when FFlagAvatarIdentificationSafeAreaFix is enabled")
			local _
			WorldToFullViewportPointNormalizedResult, _, WorldToFullViewportPointNormalizedResult3 = worldToFullViewportPointNormalized(Position, Camera, p1)
		else
			local ViewportPosition
			ViewportPosition, WorldToFullViewportPointNormalizedResult3 = Camera:WorldToViewportPoint(Position)
			WorldToFullViewportPointNormalizedResult = Vector2.new(ViewportPosition.X / ViewportSize.X, ViewportPosition.Y / ViewportSize.Y)
		end
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

function shouldIgnoreLocalCharacter(Object): boolean
	local Head = Object:FindFirstChild("Head")
	
	return if Head and Head:IsA("BasePart") then Head.LocalTransparencyModifier >= 0.95 else false
end

function getLocalCharacterPosition(Object)
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