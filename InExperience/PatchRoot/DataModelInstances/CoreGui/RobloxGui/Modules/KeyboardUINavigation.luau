local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local ContextActionService = game:GetService("ContextActionService")
local GameSettings = UserSettings().GameSettings
local SendNotificationInfo = game:GetService("CoreGui"):WaitForChild("RobloxGui"):WaitForChild("SendNotificationInfo")
local RobloxTranslatorModule = require(game:GetService("CorePackages").Workspace.Packages.RobloxTranslator)
local PlayerGui = nil

local function _(p1, Text) --[[ Line: 18 | Named "LocalizedGetString" ]]
	-- upvalues: RobloxTranslatorModule (copy)
	pcall(function() --[[ Line: 19 ]]
		-- upvalues: Text (ref), RobloxTranslatorModule (upval), p1 (copy)
		Text = RobloxTranslatorModule:FormatByKey(p1)
	end)
	
	return Text
end

local function ScrollSelectedElement(_, InputState, InputObject) --[[ Line: 25 ]]
	-- upvalues: GuiService (copy)
	if InputState ~= Enum.UserInputState.Begin then
		return Enum.ContextActionResult.Pass
	end
	local SelectedObject = GuiService.SelectedObject
	
	if SelectedObject == nil then
		return Enum.ContextActionResult.Pass
	end
	local ScrollFrame = nil
	
	if SelectedObject.ClassName == "ScrollingFrame" then
		ScrollFrame = SelectedObject
	else
		local ScrollingFrame = SelectedObject:FindFirstAncestorOfClass("ScrollingFrame")
		
		if ScrollingFrame ~= nil then
			ScrollFrame = ScrollingFrame
		end
	end
	if ScrollFrame == nil then
		return Enum.ContextActionResult.Pass
	end
	local v1: number = if InputObject.KeyCode == Enum.KeyCode.PageUp or InputObject.KeyCode == Enum.KeyCode.Home then -100 elseif InputObject.KeyCode == Enum.KeyCode.PageDown or InputObject.KeyCode == Enum.KeyCode.End then 100 else 0
	local X = ScrollFrame.CanvasPosition.X
	local Y = ScrollFrame.CanvasPosition.Y
	
	if InputObject.KeyCode == Enum.KeyCode.PageUp or InputObject.KeyCode == Enum.KeyCode.PageDown then
		Y = math.max(0, (math.min(Y + v1, ScrollFrame.AbsoluteCanvasSize.Y)))
	elseif InputObject.KeyCode == Enum.KeyCode.Home or InputObject.KeyCode == Enum.KeyCode.End then
		X = math.max(0, (math.min(X + v1, ScrollFrame.AbsoluteCanvasSize.X)))
	end
	ScrollFrame.CanvasPosition = Vector2.new(X, Y)
	
	return Enum.ContextActionResult.Pass
end

local function EnableKeyboardNavigation(_, InputState, _) --[[ Line: 73 ]]
	-- upvalues: GameSettings (copy), GuiService (copy), PlayerGui (ref), Players (copy), RobloxTranslatorModule (copy), SendNotificationInfo (copy)
	if not GameSettings.UiNavigationKeyBindEnabled then
		return Enum.ContextActionResult.Pass
	end
	if InputState ~= Enum.UserInputState.Begin then
		return Enum.ContextActionResult.Pass
	end
	if not GuiService.AutoSelectGuiEnabled then
		return Enum.ContextActionResult.Pass
	end
	if GuiService.SelectedObject then
		GuiService.SelectedObject = nil
		
		return Enum.ContextActionResult.Sink
	end
	if PlayerGui == nil then
		PlayerGui = Players.LocalPlayer:FindFirstChildOfClass("PlayerGui")
	end
	GuiService:Select(PlayerGui)
	
	if GuiService.SelectedObject then
		local FormatByKeyResult = nil
		local v1 = "InGame.NotificationScript2.UINavigation.Title"
		pcall(function() --[[ Line: 19 ]]
			-- upvalues: FormatByKeyResult (ref), RobloxTranslatorModule (upval), v1 (copy)
			FormatByKeyResult = RobloxTranslatorModule:FormatByKey(v1)
		end)
		local Title = FormatByKeyResult
		local FormatByKeyResult1 = nil
		local v2 = "InGame.NotificationScript2.UINavigation.Text"
		pcall(function() --[[ Line: 19 ]]
			-- upvalues: FormatByKeyResult1 (ref), RobloxTranslatorModule (upval), v2 (copy)
			FormatByKeyResult1 = RobloxTranslatorModule:FormatByKey(v2)
		end)
		SendNotificationInfo:Fire({ Duration = 3, Title = Title, Text = FormatByKeyResult1 })
	end
	return Enum.ContextActionResult.Sink
end

local Module = {}
Module.__index = Module

function Module.new() --[[ Line: 116 ]]
	-- upvalues: Module (copy), ContextActionService (copy), EnableKeyboardNavigation (copy), ScrollSelectedElement (copy), GameSettings (copy), GuiService (copy)
	local self = setmetatable({}, Module)
	ContextActionService:BindAction("EnableKeyboardUINavigation", EnableKeyboardNavigation, false, Enum.KeyCode.BackSlash)
	ContextActionService:BindAction("ScrollSelectedElement", ScrollSelectedElement, false, Enum.KeyCode.PageUp, Enum.KeyCode.PageDown, Enum.KeyCode.Home, Enum.KeyCode.End)
	GameSettings:GetPropertyChangedSignal("UiNavigationKeyBindEnabled"):Connect(function() --[[ Line: 121 ]]
		-- upvalues: GameSettings (upval), GuiService (upval)
		if not GameSettings.UiNavigationKeyBindEnabled then
			GuiService.SelectedObject = nil
		end
	end)
	
	return self
end

return Module.new()