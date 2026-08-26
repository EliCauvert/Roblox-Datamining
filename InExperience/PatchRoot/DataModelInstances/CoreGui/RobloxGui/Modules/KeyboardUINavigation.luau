local playersService = game:GetService("Players")
local guiService = game:GetService("GuiService")
local contextActionService = game:GetService("ContextActionService")
local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local gameSettings = UserSettings().GameSettings
local sendNotificationInfo = coreGuiService:WaitForChild("RobloxGui"):WaitForChild("SendNotificationInfo")
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local var1 = nil

local function _(p1, p2)
	-- upvalues: robloxTranslatorModule (ref)
	pcall(function()
		-- upvalues: p2 (write), robloxTranslatorModule (copy), p1 (ref)
		p2 = robloxTranslatorModule:FormatByKey(p1)
	end)
	
	return p2
end

local function ScrollSelectedElement(_, p1, p2)
	-- upvalues: guiService (ref)
	if p1 ~= Enum.UserInputState.Begin then
		return Enum.ContextActionResult.Pass
	end
	local selectedObject = guiService.SelectedObject
	
	if selectedObject == nil then
		return Enum.ContextActionResult.Pass
	end
	local var2 = nil
	
	if selectedObject.ClassName == "ScrollingFrame" then
		var2 = selectedObject
	else
		local scrollingFrame = selectedObject:FindFirstAncestorOfClass("ScrollingFrame")
		
		if scrollingFrame ~= nil then
			var2 = scrollingFrame
		end
	end
	if var2 == nil then
		return Enum.ContextActionResult.Pass
	end
	local var3 = 0
	
	if p2.KeyCode == Enum.KeyCode.PageUp or p2.KeyCode == Enum.KeyCode.Home then
		var3 = -100
	elseif p2.KeyCode == Enum.KeyCode.PageDown or p2.KeyCode == Enum.KeyCode.End then
		var3 = 100
	end
	local x = var2.CanvasPosition.X
	local y = var2.CanvasPosition.Y
	
	if p2.KeyCode == Enum.KeyCode.PageUp or p2.KeyCode == Enum.KeyCode.PageDown then
		y = math.max(0, math.min(y + var3, var2.AbsoluteCanvasSize.Y))
	elseif p2.KeyCode == Enum.KeyCode.Home or p2.KeyCode == Enum.KeyCode.End then
		x = math.max(0, math.min(x + var3, var2.AbsoluteCanvasSize.X))
	end
	var2.CanvasPosition = Vector2.new(x, y)
	
	return Enum.ContextActionResult.Pass
end

local function EnableKeyboardNavigation(_, p1, _)
	-- upvalues: gameSettings (ref), guiService (ref), var1 (write), playersService (ref), robloxTranslatorModule (ref), sendNotificationInfo (ref)
	if not gameSettings.UiNavigationKeyBindEnabled then
		return Enum.ContextActionResult.Pass
	elseif p1 ~= Enum.UserInputState.Begin then
		return Enum.ContextActionResult.Pass
	elseif not guiService.AutoSelectGuiEnabled then
		return Enum.ContextActionResult.Pass
	elseif guiService.SelectedObject then
		guiService.SelectedObject = nil
		
		return Enum.ContextActionResult.Sink
	elseif var1 == nil then
		var1 = playersService.LocalPlayer:FindFirstChildOfClass("PlayerGui")
	end
	guiService:Select(var1)
	
	if guiService.SelectedObject then
		local var2 = nil
		local var3 = "InGame.NotificationScript2.UINavigation.Title"
		pcall(function()
			-- upvalues: var2 (write), robloxTranslatorModule (copy), var3 (ref)
			p1 = robloxTranslatorModule:FormatByKey(var3)
		end)
		local var4 = var2
		local var5 = nil
		local var6 = "InGame.NotificationScript2.UINavigation.Text"
		pcall(function()
			-- upvalues: var5 (write), robloxTranslatorModule (copy), var6 (ref)
			p1 = robloxTranslatorModule:FormatByKey(var6)
		end)
		sendNotificationInfo:Fire({ Duration = 3, Title = var4, Text = var5 })
	end
	return Enum.ContextActionResult.Sink
end

local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref), contextActionService (ref), EnableKeyboardNavigation (ref), ScrollSelectedElement (ref), gameSettings (ref), guiService (ref)
	local tbl = setmetatable({}, t)
	contextActionService:BindAction("EnableKeyboardUINavigation", EnableKeyboardNavigation, false, Enum.KeyCode.BackSlash)
	contextActionService:BindAction("ScrollSelectedElement", ScrollSelectedElement, false, Enum.KeyCode.PageUp, Enum.KeyCode.PageDown, Enum.KeyCode.Home, Enum.KeyCode.End)
	gameSettings:GetPropertyChangedSignal("UiNavigationKeyBindEnabled"):Connect(function()
		-- upvalues: gameSettings (copy), guiService (copy)
		if not gameSettings.UiNavigationKeyBindEnabled then
			guiService.SelectedObject = nil
		end
	end)
	
	return tbl
end

return t.new()