local chromeShared = script:FindFirstAncestor("ChromeShared")
local workspaceService = game:GetService("Workspace")
local userInputService = game:GetService("UserInputService")
local observableValue = require(chromeShared.Service.ChromeUtils).ObservableValue
local var1 = observableValue.new(Vector2.new(0, 0))
local var2 = observableValue.new(false)
local var3 = nil

function createViewportInfo(p1)
	-- upvalues: userInputService (ref)
	local var4 = p1.X < p1.Y
	local platform = userInputService:GetPlatform()
	local var5 = if platform ~= Enum.Platform.IOS then platform == Enum.Platform.Android else true
	
	return {
		size = p1,
		portraitOrientation = var4,
		tinyPortrait = var5 and (var4 and p1.X < 360),
		isMobileDevice = var5
	}
end

local var4 = observableValue.new(createViewportInfo(Vector2.zero))

function updateViewportSize(p1)
	-- upvalues: var1 (ref), var4 (ref)
	local vector2 = Vector2.new(p1.X, p1.Y)
	var1:set(vector2)
	var4:set(createViewportInfo(vector2))
end

function setCurrentCamera(value)
	-- upvalues: var3 (write), userInputService (ref), var2 (ref)
	if var3 then
		pcall(function()
			-- upvalues: var3 (copy)
			var3:Disconnect()
		end)
		var3 = nil
	end
	if value then
		local platform = userInputService:GetPlatform()
		var2:set(if platform ~= Enum.Platform.IOS then platform == Enum.Platform.Android else true)
		var3 = value:GetPropertyChangedSignal("ViewportSize"):Connect(function()
			-- upvalues: value (ref)
			updateViewportSize(value.ViewportSize)
		end)
		updateViewportSize(value.ViewportSize)
	end
end

workspaceService:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	-- upvalues: workspaceService (ref)
	setCurrentCamera(workspaceService.CurrentCamera)
end)
setCurrentCamera(workspaceService.CurrentCamera)

return {
	screenSize = var1,
	mobileDevice = var2,
	viewport = var4,
	isSmallTouchScreen = function()
		-- upvalues: var1 (ref), userInputService (ref)
		local var5 = var1:get()
		
		return userInputService.TouchEnabled and (if var5.Y >= 500 then var5.X < 700 else true)
	end
}