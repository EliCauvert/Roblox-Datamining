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
local var3 = false
local var4 = signal.new()
local var5 = nil
local var6 = nil
local t_1 = { left = 0, top = 0, right = 0, bottom = 0 }

function diffInsets(value, p0) --[[ line: 43 ]]
	return if value.top == p0.top then if value.bottom == p0.bottom then if value.left == p0.left then value.right ~= p0.right else true else true else true
end

local var8 = nil

function handleSizeChange() --[[ line: 48 ]]
	-- upvalues: t_1 (write), var8 (write), var4 (ref)
	local var9 = getHardwareSafeAreaInsets()
	
	if diffInsets(var9, t_1) then
		t_1 = var9
		
		if var8 then
			task.cancel(var8)
		end
		var8 = task.defer(function() --[[ line: 55 ]]
			-- upvalues: var8 (copy), var4 (copy), var9 (ref)
			var8 = nil
			var4:fire(var9)
		end)
	end
end

function init() --[[ line: 62 ]]
	-- upvalues: var3 (write), var5 (write), coreGuiService (ref), var6 (write)
	if var3 then return end
	if not var5 then
		var5 = Instance.new("ScreenGui")
		var5.Name = "_FullscreenTestGui"
		var5.Parent = coreGuiService
		var5.ScreenInsets = Enum.ScreenInsets.None
		var5:GetPropertyChangedSignal("AbsoluteSize"):Connect(handleSizeChange)
		var5:GetPropertyChangedSignal("AbsolutePosition"):Connect(handleSizeChange)
	end
	if not var6 then
		var6 = Instance.new("ScreenGui")
		var6.Name = "_DeviceTestGui"
		var6.Parent = coreGuiService
		var6.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
		var6:GetPropertyChangedSignal("AbsoluteSize"):Connect(handleSizeChange)
		var6:GetPropertyChangedSignal("AbsolutePosition"):Connect(handleSizeChange)
	end
	handleSizeChange()
	var3 = true
end

function getHardwareSafeAreaInsets() --[[ line: 89 ]]
	-- upvalues: var5 (write), var6 (write), t (ref), userInputService (ref)
	local absolutePosition = var5.AbsolutePosition
	local absoluteSize = var5.AbsoluteSize
	local absolutePosition_1 = var6.AbsolutePosition
	local var10 = absolutePosition_1 - absolutePosition
	local var11 = absolutePosition + var5.AbsoluteSize - (absolutePosition_1 + var6.AbsoluteSize)
	
	if t[userInputService:GetPlatform()] then
		local var12 = absoluteSize * 0.05
		var10 += var12
		var11 += var12
	end
	return {
		left = math.round(var10.X),
		top = math.round(var10.Y),
		right = math.round(var11.X),
		bottom = math.round(var11.Y)
	}
end

return {
	connect = function(_, p1) --[[ line: 113 ]]
		-- upvalues: var4 (ref)
		init()
		
		return var4:connect(p1)
	end,
	deviceInsets = function() --[[ line: 117 ]]
		-- upvalues: t_1 (write)
		init()
		
		return t_1
	end,
	diffInsets = diffInsets,
	hasExtraPlatformInset = function() --[[ line: 122 ]]
		-- upvalues: fFlagEnableLeftNavOnConsole (ref), t (ref), userInputService (ref)
		return if fFlagEnableLeftNavOnConsole then false else t[userInputService:GetPlatform()]
	end,
	fullscreenGui = function() --[[ line: 128 ]]
		-- upvalues: var5 (write)
		init()
		
		return var5
	end
}