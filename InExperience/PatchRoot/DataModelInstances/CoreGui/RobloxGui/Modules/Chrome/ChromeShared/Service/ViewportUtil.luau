local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local ObservableValue = require(script:FindFirstAncestor("ChromeShared").Service.ChromeUtils).ObservableValue
local NewObservableValue = ObservableValue.new(Vector2.new(0, 0))
local NewObservableValue1 = ObservableValue.new(false)
local Connection = nil

function createViewportInfo(Size) --[[ Line: 25 ]]
	-- upvalues: UserInputService (copy)
	local IsXBelow = Size.X < Size.Y
	local Platform = UserInputService:GetPlatform()
	local IsPlatformMatch: boolean = Platform == Enum.Platform.IOS or Platform == Enum.Platform.Android
	
	return {
		size = Size,
		portraitOrientation = IsXBelow,
		tinyPortrait = IsPlatformMatch and (IsXBelow and Size.X < 360),
		isMobileDevice = IsPlatformMatch
	}
end

local NewObservableValue2 = ObservableValue.new(createViewportInfo(Vector2.zero))

function updateViewportSize(Vector) --[[ Line: 39 ]]
	-- upvalues: NewObservableValue (copy), NewObservableValue2 (copy)
	local _Vector2 = Vector2.new(Vector.X, Vector.Y)
	NewObservableValue:set(_Vector2)
	NewObservableValue2:set(createViewportInfo(_Vector2))
end

function setCurrentCamera(Camera: Camera) --[[ Line: 45 ]]
	-- upvalues: Connection (ref), UserInputService (copy), NewObservableValue1 (copy)
	if Connection then
		pcall(function() --[[ Line: 47 ]]
			-- upvalues: Connection (upval)
			Connection:Disconnect()
		end)
		Connection = nil
	end
	if Camera then
		local Platform = UserInputService:GetPlatform()
		NewObservableValue1:set(Platform == Enum.Platform.IOS or Platform == Enum.Platform.Android)
		Connection = Camera:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 56 ]]
			-- upvalues: Camera (copy)
			updateViewportSize(Camera.ViewportSize)
		end)
		updateViewportSize(Camera.ViewportSize)
	end
end

Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 63 ]]
	-- upvalues: Workspace (copy)
	setCurrentCamera(Workspace.CurrentCamera)
end)
setCurrentCamera(Workspace.CurrentCamera)

return {
	screenSize = NewObservableValue,
	mobileDevice = NewObservableValue1,
	viewport = NewObservableValue2,
	isSmallTouchScreen = function(): boolean --[[ Line: 72 ]]
		-- upvalues: NewObservableValue (copy), UserInputService (copy)
		local GetResult = NewObservableValue:get()
		
		return UserInputService.TouchEnabled and (GetResult.Y < 500 or GetResult.X < 700)
	end
}