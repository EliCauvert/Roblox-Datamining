local chromeShared = script:FindFirstAncestor("ChromeShared")
local workspaceService = game:GetService("Workspace")
local userInputService = game:GetService("UserInputService")
local observableValue = require(chromeShared.Service.ChromeUtils).ObservableValue
local var3 = observableValue.new(Vector2.new(0, 0))
local var4 = observableValue.new(false)
local var5 = nil

function createViewportInfo(p0) --[[ line: 25 ]]
	-- upvalues: userInputService (ref)
	local var7 = p0.X < p0.Y
	local platform = userInputService:GetPlatform()
	local var9 = if platform ~= Enum.Platform.IOS then platform == Enum.Platform.Android else true
	
	return {
		size = p0,
		portraitOrientation = var7,
		tinyPortrait = var9 and (var7 and p0.X < 360),
		isMobileDevice = var9
	}
end

local var6 = observableValue.new(createViewportInfo(Vector2.zero))

function updateViewportSize(p1) --[[ line: 39 ]]
	-- upvalues: var3 (ref), var6 (ref)
	local vector2 = Vector2.new(p1.X, p1.Y)
	var3:set(vector2)
	var6:set(createViewportInfo(vector2))
end

function setCurrentCamera(value) --[[ line: 45 ]]
	-- upvalues: var5 (write), userInputService (ref), var4 (ref)
	if var5 then
		pcall(function() --[[ line: 47 ]]
			-- upvalues: var5 (copy)
			var5:Disconnect()
		end)
		var5 = nil
	end
	if value then
		local platform = userInputService:GetPlatform()
		var4:set(if platform ~= Enum.Platform.IOS then platform == Enum.Platform.Android else true)
		var5 = value:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ line: 56 ]]
			-- upvalues: value (ref)
			updateViewportSize(value.ViewportSize)
		end)
		updateViewportSize(value.ViewportSize)
	end
end

workspaceService:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ line: 63 ]]
	-- upvalues: workspaceService (ref)
	setCurrentCamera(workspaceService.CurrentCamera)
end)
setCurrentCamera(workspaceService.CurrentCamera)

return {
	screenSize = var3,
	mobileDevice = var4,
	viewport = var6,
	isSmallTouchScreen = function() --[[ line: 72 ]]
		-- upvalues: var3 (ref), userInputService (ref)
		local var12 = var3:get()
		
		return userInputService.TouchEnabled and (if var12.Y >= 500 then var12.X < 700 else true)
	end
}