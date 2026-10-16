local LocalPlayer = game:GetService("Players").LocalPlayer
local Flag = false
local NewResult = require(script:FindFirstAncestor("MomentsCommon").Utils.Signal).new()
local ScreenGui = nil
local ScreenGui1 = nil
local config = { left = 0, top = 0, right = 0, bottom = 0 }

function diffInsets(p1, p2): boolean --[[ Line: 27 ]]
	return p1.top ~= p2.top or (p1.bottom ~= p2.bottom or p1.left ~= p2.left) or p1.right ~= p2.right
end

function getHardwareSafeAreaInsets() --[[ Line: 31 ]]
	-- upvalues: ScreenGui (ref), ScreenGui1 (ref)
	local AbsolutePosition = ScreenGui.AbsolutePosition
	local AbsolutePosition1 = ScreenGui1.AbsolutePosition
	local AbsolutePositionDelta = AbsolutePosition1 - AbsolutePosition
	local AbsolutePositionDelta1 = AbsolutePosition + ScreenGui.AbsoluteSize - (AbsolutePosition1 + ScreenGui1.AbsoluteSize)
	
	return {
		left = math.round(AbsolutePositionDelta.X),
		top = math.round(AbsolutePositionDelta.Y),
		right = math.round(AbsolutePositionDelta1.X),
		bottom = math.round(AbsolutePositionDelta1.Y)
	}
end

local DeferredThread = nil

function handleSizeChange() --[[ Line: 48 ]]
	-- upvalues: config (ref), DeferredThread (ref), NewResult (copy)
	local HardwareSafeAreaInsets = getHardwareSafeAreaInsets()
	
	if diffInsets(HardwareSafeAreaInsets, config) then
		config = HardwareSafeAreaInsets
		
		if DeferredThread then
			task.cancel(DeferredThread)
		end
		DeferredThread = task.defer(function() --[[ Line: 55 ]]
			-- upvalues: DeferredThread (upval), NewResult (upval), HardwareSafeAreaInsets (copy)
			DeferredThread = nil
			NewResult:fire(HardwareSafeAreaInsets)
		end)
	end
end

function init() --[[ Line: 62 ]]
	-- upvalues: Flag (ref), ScreenGui (ref), LocalPlayer (copy), ScreenGui1 (ref)
	if Flag then return end
	if not ScreenGui then
		ScreenGui = Instance.new("ScreenGui")
		ScreenGui.Name = "_FullscreenTestGui"
		ScreenGui.Parent = LocalPlayer.PlayerGui
		ScreenGui.ScreenInsets = Enum.ScreenInsets.None
		ScreenGui:GetPropertyChangedSignal("AbsoluteSize"):Connect(handleSizeChange)
		ScreenGui:GetPropertyChangedSignal("AbsolutePosition"):Connect(handleSizeChange)
	end
	if not ScreenGui1 then
		ScreenGui1 = Instance.new("ScreenGui")
		ScreenGui1.Name = "_DeviceTestGui"
		ScreenGui1.Parent = LocalPlayer.PlayerGui
		ScreenGui1.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
		ScreenGui1:GetPropertyChangedSignal("AbsoluteSize"):Connect(handleSizeChange)
		ScreenGui1:GetPropertyChangedSignal("AbsolutePosition"):Connect(handleSizeChange)
	end
	handleSizeChange()
	Flag = true
end

return {
	connect = function(_, p1) --[[ Line: 90 ]]
		-- upvalues: NewResult (copy)
		init()
		
		return NewResult:connect(p1)
	end,
	deviceInsets = function() --[[ Line: 94 ]]
		-- upvalues: config (ref)
		init()
		
		return config
	end,
	diffInsets = diffInsets,
	fullscreenGui = function() --[[ Line: 99 ]]
		-- upvalues: ScreenGui (ref)
		init()
		
		return ScreenGui
	end
}