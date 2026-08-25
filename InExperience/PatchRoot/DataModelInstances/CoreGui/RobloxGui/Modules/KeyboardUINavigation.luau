local playersService = game:GetService("Players")
local guiService = game:GetService("GuiService")
local contextActionService = game:GetService("ContextActionService")
local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local gameSettings = UserSettings().GameSettings
local sendNotificationInfo = coreGuiService:WaitForChild("RobloxGui"):WaitForChild("SendNotificationInfo")
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local var7 = nil

local function _(p0, p1)
	-- upvalues: robloxTranslatorModule (ref)
	pcall(function()
		-- upvalues: p1 (write), robloxTranslatorModule (copy), p0 (ref)
		p1 = robloxTranslatorModule:FormatByKey(p0)
	end)
	
	return p1
end

local function ScrollSelectedElement(_, p2, p3)
	-- upvalues: guiService (ref)
	if p2 ~= Enum.UserInputState.Begin then
		return Enum.ContextActionResult.Pass
	end
	local selectedObject = guiService.SelectedObject
	
	if selectedObject == nil then
		return Enum.ContextActionResult.Pass
	end
	local var11 = nil
	
	if selectedObject.ClassName == "ScrollingFrame" then
		var11 = selectedObject
	else
		local scrollingFrame = selectedObject:FindFirstAncestorOfClass("ScrollingFrame")
		
		if scrollingFrame ~= nil then
			var11 = scrollingFrame
		end
	end
	if var11 == nil then
		return Enum.ContextActionResult.Pass
	end
	local var13 = 0
	
	if p3.KeyCode == Enum.KeyCode.PageUp or p3.KeyCode == Enum.KeyCode.Home then
		var13 = -100
	elseif p3.KeyCode == Enum.KeyCode.PageDown or p3.KeyCode == Enum.KeyCode.End then
		var13 = 100
	end
	local x = var11.CanvasPosition.X
	local y = var11.CanvasPosition.Y
	
	if p3.KeyCode == Enum.KeyCode.PageUp or p3.KeyCode == Enum.KeyCode.PageDown then
		y = math.max(0, math.min(y + var13, var11.AbsoluteCanvasSize.Y))
	elseif p3.KeyCode == Enum.KeyCode.Home or p3.KeyCode == Enum.KeyCode.End then
		x = math.max(0, math.min(x + var13, var11.AbsoluteCanvasSize.X))
	end
	var11.CanvasPosition = Vector2.new(x, y)
	
	return Enum.ContextActionResult.Pass
end

local function EnableKeyboardNavigation(_, p4, _)
	-- upvalues: gameSettings (ref), guiService (ref), var7 (write), playersService (ref), robloxTranslatorModule (ref), sendNotificationInfo (ref)
	if not gameSettings.UiNavigationKeyBindEnabled then
		return Enum.ContextActionResult.Pass
	elseif p4 ~= Enum.UserInputState.Begin then
		return Enum.ContextActionResult.Pass
	elseif not guiService.AutoSelectGuiEnabled then
		return Enum.ContextActionResult.Pass
	elseif guiService.SelectedObject then
		guiService.SelectedObject = nil
		
		return Enum.ContextActionResult.Sink
	elseif var7 == nil then
		var7 = playersService.LocalPlayer:FindFirstChildOfClass("PlayerGui")
	end
	guiService:Select(var7)
	
	if guiService.SelectedObject then
		local var14 = nil
		local var15 = "InGame.NotificationScript2.UINavigation.Title"
		pcall(function()
			-- upvalues: var14 (write), robloxTranslatorModule (copy), var15 (ref)
			p1 = robloxTranslatorModule:FormatByKey(var15)
		end)
		local var16 = var14
		local var17 = nil
		local var18 = "InGame.NotificationScript2.UINavigation.Text"
		pcall(function()
			-- upvalues: var17 (write), robloxTranslatorModule (copy), var18 (ref)
			p1 = robloxTranslatorModule:FormatByKey(var18)
		end)
		sendNotificationInfo:Fire({ Duration = 3, Title = var16, Text = var17 })
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