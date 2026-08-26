local signalModule = require(script:FindFirstAncestor("MomentsCommon").Utils.Signal)
local localPlayer = game:GetService("Players").LocalPlayer
local var1 = false
local var2 = signalModule.new()
local var3 = nil
local var4 = nil
local t = { left = 0, top = 0, right = 0, bottom = 0 }

function diffInsets(value, p1)
	return if value.top == p1.top then if value.bottom == p1.bottom then if value.left == p1.left then value.right ~= p1.right else true else true else true
end

function getHardwareSafeAreaInsets()
	-- upvalues: var3 (write), var4 (write)
	local absolutePosition = var3.AbsolutePosition
	local absolutePosition_1 = var4.AbsolutePosition
	local var5 = absolutePosition_1 - absolutePosition
	local var6 = absolutePosition + var3.AbsoluteSize - (absolutePosition_1 + var4.AbsoluteSize)
	
	return {
		left = math.round(var5.X),
		top = math.round(var5.Y),
		right = math.round(var6.X),
		bottom = math.round(var6.Y)
	}
end

local var5 = nil

function handleSizeChange()
	-- upvalues: t (write), var5 (write), var2 (ref)
	local var6 = getHardwareSafeAreaInsets()
	
	if diffInsets(var6, t) then
		t = var6
		
		if var5 then
			task.cancel(var5)
		end
		var5 = task.defer(function()
			-- upvalues: var5 (copy), var2 (copy), var6 (ref)
			var5 = nil
			var2:fire(var6)
		end)
	end
end

function init()
	-- upvalues: var1 (write), var3 (write), localPlayer (ref), var4 (write)
	if var1 then return end
	if not var3 then
		var3 = Instance.new("ScreenGui")
		var3.Name = "_FullscreenTestGui"
		var3.Parent = localPlayer.PlayerGui
		var3.ScreenInsets = Enum.ScreenInsets.None
		var3:GetPropertyChangedSignal("AbsoluteSize"):Connect(handleSizeChange)
		var3:GetPropertyChangedSignal("AbsolutePosition"):Connect(handleSizeChange)
	end
	if not var4 then
		var4 = Instance.new("ScreenGui")
		var4.Name = "_DeviceTestGui"
		var4.Parent = localPlayer.PlayerGui
		var4.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
		var4:GetPropertyChangedSignal("AbsoluteSize"):Connect(handleSizeChange)
		var4:GetPropertyChangedSignal("AbsolutePosition"):Connect(handleSizeChange)
	end
	handleSizeChange()
	var1 = true
end

return {
	connect = function(_, p1)
		-- upvalues: var2 (ref)
		init()
		
		return var2:connect(p1)
	end,
	deviceInsets = function()
		-- upvalues: t (write)
		init()
		
		return t
	end,
	diffInsets = diffInsets,
	fullscreenGui = function()
		-- upvalues: var3 (write)
		init()
		
		return var3
	end
}