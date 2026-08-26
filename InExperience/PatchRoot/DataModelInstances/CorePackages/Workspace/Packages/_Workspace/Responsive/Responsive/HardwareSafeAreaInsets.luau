local coreGuiService = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local parent = script.Parent.Parent
local signal = require(parent.AppCommonLib).Signal
local fFlagEnableLeftNavOnConsole = require(parent.SharedFlags).FFlagEnableLeftNavOnConsole
local t = {
	[Enum.Platform.XBoxOne] = true,
	[Enum.Platform.XBox360] = true,
	[Enum.Platform.WiiU] = true,
	[Enum.Platform.PS3] = true,
	[Enum.Platform.PS4] = true,
	[Enum.Platform.PS5] = true,
	[Enum.Platform.Ouya] = true,
	[Enum.Platform.AndroidTV] = true
}
local var1 = false
local var2 = signal.new()
local var3 = nil
local var4 = nil
local t_1 = { left = 0, top = 0, right = 0, bottom = 0 }

function diffInsets(value, p1)
	return if value.top == p1.top then if value.bottom == p1.bottom then if value.left == p1.left then value.right ~= p1.right else true else true else true
end

local var5 = nil

function handleSizeChange()
	-- upvalues: t_1 (write), var5 (write), var2 (ref)
	local var6 = getHardwareSafeAreaInsets()
	
	if diffInsets(var6, t_1) then
		t_1 = var6
		
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
	-- upvalues: var1 (write), var3 (write), coreGuiService (ref), var4 (write)
	if var1 then return end
	if not var3 then
		var3 = Instance.new("ScreenGui")
		var3.Name = "_FullscreenTestGui"
		var3.Parent = coreGuiService
		var3.ScreenInsets = Enum.ScreenInsets.None
		var3:GetPropertyChangedSignal("AbsoluteSize"):Connect(handleSizeChange)
		var3:GetPropertyChangedSignal("AbsolutePosition"):Connect(handleSizeChange)
	end
	if not var4 then
		var4 = Instance.new("ScreenGui")
		var4.Name = "_DeviceTestGui"
		var4.Parent = coreGuiService
		var4.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
		var4:GetPropertyChangedSignal("AbsoluteSize"):Connect(handleSizeChange)
		var4:GetPropertyChangedSignal("AbsolutePosition"):Connect(handleSizeChange)
	end
	handleSizeChange()
	var1 = true
end

function getHardwareSafeAreaInsets()
	-- upvalues: var3 (write), var4 (write), t (ref), userInputService (ref)
	local absolutePosition = var3.AbsolutePosition
	local absoluteSize = var3.AbsoluteSize
	local absolutePosition_1 = var4.AbsolutePosition
	local var6 = absolutePosition_1 - absolutePosition
	local var7 = absolutePosition + var3.AbsoluteSize - (absolutePosition_1 + var4.AbsoluteSize)
	
	if t[userInputService:GetPlatform()] then
		local var8 = absoluteSize * 0.05
		var6 += var8
		var7 += var8
	end
	return {
		left = math.round(var6.X),
		top = math.round(var6.Y),
		right = math.round(var7.X),
		bottom = math.round(var7.Y)
	}
end

return {
	connect = function(_, p1)
		-- upvalues: var2 (ref)
		init()
		
		return var2:connect(p1)
	end,
	deviceInsets = function()
		-- upvalues: t_1 (write)
		init()
		
		return t_1
	end,
	diffInsets = diffInsets,
	hasExtraPlatformInset = function()
		-- upvalues: fFlagEnableLeftNavOnConsole (ref), t (ref), userInputService (ref)
		return if fFlagEnableLeftNavOnConsole then false else t[userInputService:GetPlatform()]
	end,
	fullscreenGui = function()
		-- upvalues: var3 (write)
		init()
		
		return var3
	end
}