local parent = script:FindFirstAncestor("Backpack").Parent
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local modules = robloxGui.Modules
local signalsModule = require(parent.Signals)
local inExperienceTopBarModule = require(parent.InExperienceTopBar)
local settingsShowSignal = require(parent.CoreScriptsCommon).SettingsShowSignal
local inExperienceAppChatModalModule = require(parent.AppChat.InExperienceAppChatModal)
local fFlagMountCoreGuiBackpackModule = require(modules.Flags.FFlagMountCoreGuiBackpack)
local isInExperienceUIVREnabled = require(parent.SharedExperimentDefinition).isInExperienceUIVREnabled
local inExperienceUIVRIXP = require(parent.SharedExperimentDefinition).InExperienceUIVRIXP
local fFlagTopBarSignalizeSetCores = inExperienceTopBarModule.Flags.FFlagTopBarSignalizeSetCores
local robloxTranslatorModule = require(parent.RobloxTranslator)
local responsiveModule = require(parent.Responsive)
local fFlagBackpackResponsiveUnits = require(parent.SharedFlags).FFlagBackpackResponsiveUnits
local systemModule = require(parent.System)
local enableHotbarHide = game:DefineFastFlag("EnableHotbarHide", false)
local deprecateOldGuiObjectPropertiesEngineFeature = game:GetEngineFeature("DeprecateOldGuiObjectProperties")
local t = {
	OpenClose = nil,
	IsHotbarVisible = false,
	IsOpen = false,
	StateChanged = Instance.new("BindableEvent"),
	ModuleName = "Backpack",
	KeepVRTopbarOpen = true,
	VRIsExclusive = true,
	VRClosesNonExclusive = true
}
local var12 = 60
local size14 = Enum.FontSize.Size14
local var13 = 0.5 * userGameSettingsService.PreferredTransparency
local color3 = Color3.new(0.121568627451, 0.121568627451, 0.121568627451)
local color3_1 = Color3.new(0.192156862745, 0.192156862745, 0.192156862745)
local color3_2 = Color3.new(0.352941176471, 0.556862745098, 0.913725490196)
local var17 = 0.5 * userGameSettingsService.PreferredTransparency
local color3_3 = Color3.new(1, 1, 1)
local _ = UDim2.new(0, 14, 0, 9)
local value = Enum.KeyCode.Backquote.Value
local color3_4 = Color3.new(0, 0.635294117647, 1)
local var20 = "   Search"
local color3_5 = Color3.new(0.37, 0.37, 0.37)
local var22 = 0.15 * userGameSettingsService.PreferredTransparency
local value_1 = Enum.KeyCode.Zero.Value
local value_2 = Enum.KeyCode.Backspace.Value
local t_1 = {
	[Enum.UserInputType.Gamepad1] = true,
	[Enum.UserInputType.Gamepad2] = true,
	[Enum.UserInputType.Gamepad3] = true,
	[Enum.UserInputType.Gamepad4] = true,
	[Enum.UserInputType.Gamepad5] = true,
	[Enum.UserInputType.Gamepad6] = true,
	[Enum.UserInputType.Gamepad7] = true,
	[Enum.UserInputType.Gamepad8] = true
}
local playersService = game:GetService("Players")
local userInputService = game:GetService("UserInputService")
local starterGuiService = game:GetService("StarterGui")
local guiService = game:GetService("GuiService")
local contextActionService = game:GetService("ContextActionService")
local VRService = game:GetService("VRService")
local gamepadService = game:GetService("GamepadService")
robloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local var31 = require(modules.TenFootInterface):IsEnabled()
local create = require(parent.AppCommonLib).Create
local gameTranslatorModule = require(modules.GameTranslator)
pcall(function() --[[ line: 124 ]]
	-- upvalues: var20 (write), robloxTranslatorModule (ref)
	var20 = robloxTranslatorModule:FormatByKey("InGame.UnknownNamespace.BACKPACK_SEARCH")
end)
local var33 = true

if var31 then
	var12 = 100
	size14 = Enum.FontSize.Size24
end
local var34 = false
local _ = nil
local var35 = if fFlagBackpackResponsiveUnits then responsiveModule.GetInputModeStore().getPreferredInputType() == responsiveModule.Input.Touch and guiService:GetScreenResolution().X < 1024 else userInputService.TouchEnabled and guiService:GetScreenResolution().X < 1024
local localPlayer = playersService.LocalPlayer
local var36 = nil
local var37 = nil
local var38 = nil
local var39 = nil
local var40 = nil
local var41 = nil
local var42 = nil
local var43 = nil
local var44 = nil
local var45 = nil
local var46 = nil
local var47 = nil
local var48 = nil
local var49 = nil
local t_2 = {}
local var51 = nil
local t_3 = {}
local t_4 = {}
local t_5 = {}
local var55 = 0
local var56 = nil
local var57 = false
local var58 = false
local var59 = false
local var60 = false
local t_6 = {}
local t_7 = {}
local t_8 = {}
local var64 = false
local var65 = 0
local var66 = if var35 then 3 else 10
local var67 = if var35 then 2 else 4
local var68 = nil
local var69 = nil
t.BackpackEmpty = create("BindableEvent")({ Name = "BackpackEmpty" })
t.BackpackItemAdded = create("BindableEvent")({ Name = "BackpackAdded" })
t.BackpackItemRemoved = create("BindableEvent")({ Name = "BackpackRemoved" })

local function NewGui(p0, p1) --[[ line: 200 ]]
	-- upvalues: size14 (write)
	local var88 = Instance.new(p0)
	var88.Name = p1
	var88.BackgroundColor3 = Color3.new(0, 0, 0)
	var88.BackgroundTransparency = 1
	var88.BorderColor3 = Color3.new(0, 0, 0)
	var88.BorderSizePixel = 0
	var88.Size = UDim2.new(1, 0, 1, 0)
	
	if p0:match("Text") then
		var88.TextColor3 = Color3.new(1, 1, 1)
		var88.Text = ""
		var88.Font = Enum.Font.SourceSans
		var88.FontSize = size14
		var88.TextWrapped = true
		
		if p0 == "TextButton" then
			var88.Font = Enum.Font.SourceSansBold
			var88.BorderSizePixel = 1
		end
	end
	return var88
end

local function _() --[[ line: 222 | named "FindLowestEmpty" ]]
	-- upvalues: var66 (write), t_2 (ref)
	for i = 1, var66 do
		local var89 = t_2[i]
		
		if var89.Tool then
			continue
		end
		return var89
	end
	return nil
end

function t.isInventoryEmpty() --[[ line: 232 ]]
	-- upvalues: var66 (write), t_2 (ref)
	for i = var66 + 1, #t_2 do
		local var90 = t_2[i]
		
		if not var90 or not var90.Tool then
			continue
		end
		return false
	end
	return true
end

local _ = function() --[[ line: 244 | named "UseGazeSelection" ]]
	return false
end

local function AdjustHotbarFrames(p2) --[[ line: 248 ]]
	-- upvalues: var40 (write), var66 (write), var55 (write), enableHotbarHide (ref), t_2 (ref), var38 (write), t (ref)
	if not var40 then return end
	local visible = var40.Visible
	local var91 = if visible then var66 else var55
	local var92 = 0
	local var93 = if enableHotbarHide then var91 >= 1 and not p2 else var91 >= 1
	
	for i = 1, var66 do
		local var94 = t_2[i]
		
		if (if enableHotbarHide then var94.Tool and not p2 else var94.Tool) or visible then
			var92 += 1
			var94:Readjust(var92, var91)
			var94.Frame.Visible = true
		else
			var94.Frame.Visible = false
		end
	end
	if var38 then
		local var95 = not visible
		
		if var95 then
			var95 = var93
			
			if not var95 then
				local var97
				for i_1 = var66 + 1, #t_2 do
					local var96 = t_2[i_1]
					
					if not var96 or not var96.Tool then
						continue
					end
					var97 = false
					var95 = not var97
				end
				var97 = true
			end
		end
		var38.Visible = var95
		var38.Position = UDim2.new(0.5, -15, 1, if var93 then -110 else -50)
	end
	t.IsHotbarVisible = var93
end

local function UpdateScrollingFrameCanvasSize() --[[ line: 276 ]]
	-- upvalues: var42 (write), var43 (write), var12 (write)
	if var42 and var43 then
		var42.CanvasSize = UDim2.new(0, 0, 0, math.ceil((#var43:GetChildren() - 1) / math.floor(var42.AbsoluteSize.X / (var12 + 5))) * (var12 + 5) + 5)
		
		return
	end
end

local function AdjustInventoryFrames() --[[ line: 286 ]]
	-- upvalues: var66 (write), t_2 (ref), UpdateScrollingFrameCanvasSize (ref)
	for i = var66 + 1, #t_2 do
		local var98 = t_2[i]
		var98.Frame.LayoutOrder = var98.Index
		var98.Frame.Visible = var98.Tool ~= nil
	end
	UpdateScrollingFrameCanvasSize()
end

local function UpdateBackpackLayout() --[[ line: 295 ]]
	-- upvalues: var37 (write), var40 (write), var66 (write), var12 (write), var67 (ref), var42 (write), AdjustHotbarFrames (ref), AdjustInventoryFrames (ref)
	if not var37 or not var40 then return end
	var37.Size = UDim2.new(0, 5 + var66 * (var12 + 5), 0, var12 + 5 + 5)
	var37.Position = UDim2.new(0.5, -var37.Size.X.Offset / 2, 1, -var37.Size.Y.Offset)
	var40.Size = UDim2.new(0, var37.Size.X.Offset, 0, var37.Size.Y.Offset * var67 + 40)
	var40.Position = UDim2.new(0.5, -var40.Size.X.Offset / 2, 1, var37.Position.Y.Offset - var40.Size.Y.Offset)
	
	if var42 then
		var42.Size = UDim2.new(1, var42.ScrollBarThickness + 1, 1, -40)
		var42.Position = UDim2.new(0, 0, 0, 40)
	end
	AdjustHotbarFrames()
	AdjustInventoryFrames()
end

local _ = function(value, minValue, maxValue) --[[ line: 327 | named "Clamp" ]]
	return math.min(minValue, math.max(value, maxValue))
end

local _ = function(p3, p4, p5) --[[ line: 331 | named "CheckBounds" ]]
	local absolutePosition = p3.AbsolutePosition
	local absoluteSize = p3.AbsoluteSize
	
	return absolutePosition.X < p4 and (p4 <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y < p5 and p5 <= absolutePosition.Y + absoluteSize.Y))
end

local _ = function(value, p6) --[[ line: 337 | named "GetOffset" ]]
	return (value.AbsolutePosition + value.AbsoluteSize / 2 - p6).magnitude
end

local _ = function() --[[ line: 342 | named "DisableActiveHopper" ]]
	-- upvalues: var56 (write), t_3 (ref)
	var56:ToggleSelect()
	t_3[var56]:UpdateEquipView()
	var56 = nil
end

local _ = function() --[[ line: 348 | named "UnequipAllTools" ]]
	-- upvalues: var48 (write), var56 (write), t_3 (ref)
	if var48 then
		var48:UnequipTools()
		
		if var56 then
			var56:ToggleSelect()
			t_3[var56]:UpdateEquipView()
			var56 = nil
		end
	end
end

local _ = function(p7) --[[ line: 357 | named "EquipNewTool" ]]
	-- upvalues: var48 (write), var56 (write), t_3 (ref), var47 (write)
	if var48 then
		var48:UnequipTools()
		
		if var56 then
			var56:ToggleSelect()
			t_3[var56]:UpdateEquipView()
			var56 = nil
		end
	end
	if p7:IsA("HopperBin") then
		p7:ToggleSelect()
		t_3[p7]:UpdateEquipView()
		var56 = p7
		
		return
	end
	p7.Parent = var47
end

local _ = function(p8) --[[ line: 369 | named "IsEquipped" ]]
	-- upvalues: var47 (write)
	return p8 and (if p8:IsA("HopperBin") then p8.Active else p8.Parent == var47)
end

local function MakeSlot(p9, p10) --[[ line: 373 ]]
	-- upvalues: t_2 (ref), var17 (write), color3_1 (ref), color3 (ref), var37 (write), var12 (write), gameTranslatorModule (ref), var66 (write), var40 (write), var55 (write), var58 (write), var34 (write), contextActionService (ref), var69 (write), t_3 (ref), var51 (write), var47 (write), var68 (write), NewGui (ref), color3_2 (ref), t_5 (ref), UpdateScrollingFrameCanvasSize (ref), var48 (write), var56 (write), var49 (write), color3_3 (ref), MakeSlot (ref), var43 (write), var60 (write), t_4 (ref), value_1 (ref), var42 (write)
	p10 = p10 or #t_2 + 1
	p10 = { Tool = nil, Index = p10, Frame = nil }
	local var100 = nil
	local var101 = nil
	local var102 = nil
	local var103 = nil
	local var104 = nil
	local var105 = nil
	local _ = nil
	local var106 = nil
	local var107 = nil
	
	local function _() --[[ line: 398 | named "UpdateSlotFading" ]]
		-- upvalues: var100 (write), var17 (copy), color3_1 (copy), color3 (copy)
		var100.SelectionImageObject = nil
		var100.BackgroundTransparency = if var100.Draggable then 0 else var17
		var100.BackgroundColor3 = if var100.Draggable then color3_1 else color3
	end
	
	function p10.Readjust(_, p11, p12) --[[ line: 404 ]]
		-- upvalues: var37 (copy), var12 (copy), var100 (write)
		var100.Position = UDim2.new(0, var37.Size.X.Offset / 2 - var12 / 2 + (var12 + 5) * (p11 - (p12 / 2 + 0.5)), 0, 5)
	end
	
	function p10.Fill(p13, p14) --[[ line: 412 ]]
		-- upvalues: var102 (write), var103 (write), gameTranslatorModule (copy), var106 (write), var104 (write), var66 (copy), var40 (copy), var100 (write), var55 (copy), var58 (copy), var34 (copy), contextActionService (copy), var69 (copy), t_3 (copy), var51 (copy), t_2 (copy)
		if not p14 then
			return p13:Clear()
		end
		p13.Tool = p14
		
		local function assignToolData() --[[ line: 419 ]]
			-- upvalues: p14 (ref), var102 (copy), var103 (copy), gameTranslatorModule (copy), var106 (copy)
			local textureId = p14.TextureId
			var102.Image = textureId
			
			if textureId == "" then
				var103.Visible = true
			else
				var103.Visible = false
			end
			gameTranslatorModule:TranslateAndRegister(var103, p14, p14.Name)
			
			if var106 and p14:IsA("Tool") then
				gameTranslatorModule:TranslateAndRegister(var106, p14, p14.ToolTip)
				local var117 = var106.TextBounds.X + 6
				var106.Size = UDim2.new(0, var117, 0, 16)
				var106.Position = UDim2.new(0.5, -var117 / 2, 0, -25)
			end
		end
		
		assignToolData()
		
		if var104 then
			var104:disconnect()
			var104 = nil
		end
		var104 = p14.Changed:connect(function(p15) --[[ line: 445 ]]
			-- upvalues: assignToolData (ref)
			if p15 == "TextureId" or p15 == "Name" or p15 == "ToolTip" then
				assignToolData()
			end
		end)
		local var114 = p13.Index <= var66
		
		if not var114 or var40.Visible then
			var100.Draggable = true
		end
		p13:UpdateEquipView()
		
		if var114 then
			var55 += 1
			
			if var58 and var55 >= 1 and not var34 then
				var34 = true
				contextActionService:BindAction("RBXHotbarEquip", var69, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
			end
		end
		local var115, var116
		t_3[p14] = p13
		
		for i = 1, var66 do
			var115 = t_2[i]
			
			if var115.Tool then
				continue
			end
			var116 = var115
			var51 = var116
			
			return
		end
		var116 = nil
	end
	
	function p10.Clear(p16) --[[ line: 482 ]]
		-- upvalues: var104 (write), var102 (write), var103 (write), var106 (write), var100 (write), var66 (copy), var55 (copy), var34 (copy), contextActionService (copy), t_3 (copy), var51 (copy), t_2 (copy)
		if not p16.Tool then return end
		if var104 then
			var104:disconnect()
			var104 = nil
		end
		var102.Image = ""
		var103.Text = ""
		
		if var106 then
			var106.Text = ""
			var106.Visible = false
		end
		var100.Draggable = false
		p16:UpdateEquipView(true)
		
		if p16.Index <= var66 then
			var55 -= 1
			
			if var55 < 1 then
				var34 = false
				contextActionService:UnbindAction("RBXHotbarEquip")
			end
		end
		local var118, var119
		t_3[p16.Tool] = nil
		p16.Tool = nil
		
		for i = 1, var66 do
			var118 = t_2[i]
			
			if var118.Tool then
				continue
			end
			var119 = var118
			var51 = var119
			
			return
		end
		var119 = nil
	end
	
	function p10.UpdateEquipView(p17, p18) --[[ line: 515 ]]
		-- upvalues: var47 (copy), var68 (copy), p10 (ref), var105 (write), NewGui (copy), var100 (write), color3_2 (copy), var17 (copy), color3_1 (copy), color3 (copy)
		if not p18 then
			local tool = p17.Tool
			
			if tool and (if tool:IsA("HopperBin") then tool.Active else tool.Parent == var47) then
				var68 = p10
				
				if not var105 then
					var105 = NewGui("Frame", "Equipped")
					var105.ZIndex = var100.ZIndex
					
					for i, v in pairs({
						{ 0.1, 1, 0, 0 },
						{ 0.8, 0.1, 0.1, 0 },
						{ 0.1, 1, 0.9, 0 },
						{ 0.8, 0.1, 0.1, 0.9 }
					}) do
						local var120 = NewGui("Frame", "Edge")
						var120.BackgroundTransparency = 0
						var120.BackgroundColor3 = color3_2
						var120.Size = UDim2.new(v[1], 0, v[2], 0)
						var120.Position = UDim2.new(v[3], 0, v[4], 0)
						var120.ZIndex = var105.ZIndex
						var120.Parent = var105
					end
				end
				var105.Parent = var100
			elseif var105 then
				var105.Parent = nil
			end
			var100.SelectionImageObject = nil
			var100.BackgroundTransparency = if var100.Draggable then 0 else var17
			var100.BackgroundColor3 = if var100.Draggable then color3_1 else color3
		end
	end
	
	function p10.IsEquipped(p19) --[[ line: 547 ]]
		-- upvalues: var47 (copy)
		local tool = p19.Tool
		
		return tool and (if tool:IsA("HopperBin") then tool.Active else tool.Parent == var47)
	end
	
	function p10.Delete(p20) --[[ line: 551 ]]
		-- upvalues: t_5 (copy), var100 (write), t_2 (copy), UpdateScrollingFrameCanvasSize (copy)
		t_5[var100] = nil
		var100:Destroy()
		table.remove(t_2, p20.Index)
		
		for i = p20.Index, #t_2 do
			t_2[i]:SlideBack()
		end
		UpdateScrollingFrameCanvasSize()
	end
	
	function p10.Swap(p21, p22) --[[ line: 565 ]]
		local tool = p21.Tool
		local tool_1 = p22.Tool
		p21:Clear()
		
		if tool_1 then
			p22:Clear()
			p21:Fill(tool_1)
		end
		if tool then
			p22:Fill(tool)
			
			return
		end
		p22:Clear()
	end
	
	function p10.SlideBack(p23) --[[ line: 579 ]]
		-- upvalues: var100 (write)
		p23.Index -= 1
		var100.Name = p23.Index
		var100.LayoutOrder = p23.Index
	end
	
	function p10.TurnNumber(_, p24) --[[ line: 585 ]]
		-- upvalues: var107 (write)
		if var107 then
			var107.Visible = p24
		end
	end
	
	function p10.SetClickability(value, p25) --[[ line: 591 ]]
		-- upvalues: var100 (write), var17 (copy), color3_1 (copy), color3 (copy)
		if value.Tool then
			var100.Draggable = not p25
			var100.SelectionImageObject = nil
			var100.BackgroundTransparency = if var100.Draggable then 0 else var17
			var100.BackgroundColor3 = if var100.Draggable then color3_1 else color3
		end
	end
	
	function p10.CheckTerms(p26, p27) --[[ line: 598 ]]
		-- upvalues: var103 (write), var106 (write)
		local var121 = 0
		
		local function _(p28, p29) --[[ line: 600 | named "checkEm" ]]
			-- upvalues: var121 (write)
			local _, var125 = p28:lower():gsub(p29, "")
			var121 += var125
		end
		
		local tool = p26.Tool
		
		if tool then
			for i in pairs(p27) do
				local var122, var123 = var103.Text:lower():gsub(i, "")
				var121 += var123
				
				if tool:IsA("Tool") then
					var122, var124 = (if var106 then var106.Text else ""):lower():gsub(i, "")
					var121 += var124
				end
			end
		end
		return var121
	end
	
	function p10.Select(_, p30) --[[ line: 618 ]]
		-- upvalues: p10 (ref), var47 (copy), var48 (copy), var56 (copy), t_3 (copy), var49 (copy)
		if p30 then return end
		local tool = p10.Tool
		
		if tool then
			if tool and (if tool:IsA("HopperBin") then tool.Active else tool.Parent == var47) then
				if var48 then
					var48:UnequipTools()
					
					if var56 then
						var56:ToggleSelect()
						t_3[var56]:UpdateEquipView()
						var56 = nil
						
						return
					end
				end
			elseif tool.Parent == var49 then
				if var48 then
					var48:UnequipTools()
					
					if var56 then
						var56:ToggleSelect()
						t_3[var56]:UpdateEquipView()
						var56 = nil
					end
				end
				if tool:IsA("HopperBin") then
					tool:ToggleSelect()
					t_3[tool]:UpdateEquipView()
					var56 = tool
					
					return
				end
				tool.Parent = var47
			end
		end
	end
	
	var100 = NewGui("TextButton", p10)
	var100.BackgroundColor3 = color3
	var100.BorderColor3 = color3_3
	var100.Text = ""
	var100.AutoButtonColor = false
	var100.BorderSizePixel = 0
	var100.Size = UDim2.new(0, var12, 0, var12)
	var100.Active = true
	var100.Draggable = false
	var100.BackgroundTransparency = var17
	var100.MouseButton1Click:connect(function() --[[ line: 645 ]]
		-- upvalues: p10 (ref)
		changeSlot(p10)
	end)
	p10.Frame = var100
	local var108 = NewGui("Frame", "SelectionObjectClipper")
	var108.Visible = false
	var108.Parent = var100
	local var109 = NewGui("ImageLabel", "Selector")
	var109.Size = UDim2.new(1, 0, 1, 0)
	var109.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png"
	var109.ScaleType = Enum.ScaleType.Slice
	var109.SliceCenter = Rect.new(12, 12, 52, 52)
	var109.Parent = var108
	var102 = NewGui("ImageLabel", "Icon")
	var102.Size = UDim2.new(0.8, 0, 0.8, 0)
	var102.Position = UDim2.new(0.1, 0, 0.1, 0)
	var102.Parent = var100
	var103 = NewGui("TextLabel", "ToolName")
	var103.Size = UDim2.new(1, -2, 1, -2)
	var103.Position = UDim2.new(0, 1, 0, 1)
	var103.Parent = var100
	p10.Frame.LayoutOrder = p10.Index
	
	if p10 <= var66 then
		var106 = NewGui("TextLabel", "ToolTip")
		var106.TextWrapped = false
		var106.TextYAlignment = Enum.TextYAlignment.Top
		var106.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
		var106.BackgroundTransparency = 0
		var106.Visible = false
		var106.Parent = var100
		var100.MouseEnter:connect(function() --[[ line: 684 ]]
			-- upvalues: var106 (write)
			if var106.Text ~= "" then
				var106.Visible = true
			end
		end)
		var100.MouseLeave:connect(function() --[[ line: 689 ]]
			-- upvalues: var106 (write)
			var106.Visible = false
		end)
		
		function p10.MoveToInventory(p31) --[[ line: 693 ]]
			-- upvalues: p10 (ref), var66 (copy), MakeSlot (copy), var43 (copy), var47 (copy), var48 (copy), var56 (copy), t_3 (copy), var60 (copy), var40 (copy)
			if p10.Index <= var66 then
				local tool = p10.Tool
				p31:Clear()
				local var126 = MakeSlot(var43)
				var126:Fill(tool)
				
				if tool and (if tool:IsA("HopperBin") then tool.Active else tool.Parent == var47) and var48 then
					var48:UnequipTools()
					
					if var56 then
						var56:ToggleSelect()
						t_3[var56]:UpdateEquipView()
						var56 = nil
					end
				end
				if var60 then
					var126.Frame.Visible = false
					var126.Parent = var40
				end
			end
		end
		
		if p10 < 10 or p10 == var66 then
			local var110 = if p10 < 10 then p10 else 0
			var107 = NewGui("TextLabel", "Number")
			var107.Text = var110
			var107.Size = UDim2.new(0.15, 0, 0.15, 0)
			var107.Visible = false
			var107.Parent = var100
			
			t_4[value_1 + var110] = function(p32) --[[ line: 719 ]]
				-- upvalues: p10 (ref)
				p10:Select(p32)
			end
		end
	end
	local position = var100.Position
	local var111 = 0
	local var112 = nil
	var100.DragBegin:connect(function(p33) --[[ line: 730 ]]
		-- upvalues: t_5 (copy), var100 (write), position (write), var102 (write), var103 (write), var107 (write), var105 (write), var112 (write), var43 (copy), var40 (copy), var101 (write), NewGui (copy)
		t_5[var100] = true
		position = p33
		var100.BorderSizePixel = 2
		var100.ZIndex = 2
		var102.ZIndex = 2
		var103.ZIndex = 2
		var100.Parent.ZIndex = 2
		
		if var107 then
			var107.ZIndex = 2
		end
		if var105 then
			var105.ZIndex = 2
			
			for i, v in pairs(var105:GetChildren()) do
				v.ZIndex = 2
			end
		end
		var112 = var100.Parent
		
		if var112 == var43 then
			local _ = var100.AbsolutePosition
			local uDim2 = UDim2.new(0, var100.AbsolutePosition.X - var40.AbsolutePosition.X, 0, var100.AbsolutePosition.Y - var40.AbsolutePosition.Y)
			var100.Parent = var40
			var100.Position = uDim2
			var101 = NewGui("Frame", "FakeSlot")
			var101.LayoutOrder = var100.LayoutOrder
			var101.Size = var100.Size
			var101.BackgroundTransparency = 1
			var101.Parent = var43
		end
	end)
	var100.DragStopped:connect(function(p34, p35) --[[ line: 772 ]]
		-- upvalues: var101 (write), var100 (write), position (write), var112 (write), var102 (write), var103 (write), var107 (write), var105 (write), t_5 (copy), p10 (ref), var40 (copy), var66 (copy), var111 (write), var51 (copy), var37 (copy), t_2 (copy), var47 (copy), var48 (copy), var56 (copy), t_3 (copy), var60 (copy)
		if var101 then
			var101:Destroy()
		end
		local currentTime = tick()
		var100.Position = position
		var100.Parent = var112
		var100.BorderSizePixel = 0
		var100.ZIndex = 1
		var102.ZIndex = 1
		var103.ZIndex = 1
		var112.ZIndex = 1
		
		if var107 then
			var107.ZIndex = 1
		end
		if var105 then
			var105.ZIndex = 1
			
			for i, v in pairs(var105:GetChildren()) do
				v.ZIndex = 1
			end
		end
		t_5[var100] = nil
		
		if not p10.Tool then return end
		local absolutePosition = var40.AbsolutePosition
		local absoluteSize = var40.AbsoluteSize
		
		if absolutePosition.X < p34 and (p34 <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y < p35 and p35 <= absolutePosition.Y + absoluteSize.Y)) then
			if p10.Index <= var66 then
				p10:MoveToInventory()
			end
			if var66 < p10.Index and currentTime - var111 < 0.5 then
				if var51 then
					local tool = p10.Tool
					p10:Clear()
					var51:Fill(tool)
					p10:Delete()
				end
				currentTime = 0
			end
		else
			absolutePosition = var37.AbsolutePosition
			absoluteSize = var37.AbsoluteSize
			
			if absolutePosition.X < p34 and (p34 <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y < p35 and p35 <= absolutePosition.Y + absoluteSize.Y)) then
				local list = { 1e999, nil }
				
				for absoluteSize = 1, var66 do
					local var130 = t_2[absoluteSize]
					local frame = var130.Frame
					local magnitude = (frame.AbsolutePosition + frame.AbsoluteSize / 2 - Vector2.new(p34, p35)).magnitude
					
					if magnitude < list[1] then
						list = { magnitude, var130 }
					end
				end
				local var131 = list[2]
				
				if var131 ~= p10 then
					p10:Swap(var131)
					
					if var66 < p10.Index then
						absolutePosition = p10.Tool
						
						if absolutePosition then
							if absolutePosition and (if absolutePosition:IsA("HopperBin") then absolutePosition.Active else absolutePosition.Parent == var47) and var48 then
								var48:UnequipTools()
								
								if var56 then
									var56:ToggleSelect()
									t_3[var56]:UpdateEquipView()
									var56 = nil
								end
							end
							if var60 then
								p10.Frame.Visible = false
								p10.Frame.Parent = var40
							end
						else
							p10:Delete()
						end
					end
				end
			elseif p10.Index <= var66 then
				p10:MoveToInventory()
			end
		end
		var111 = currentTime
	end)
	var100.Parent = p9
	t_2[p10] = p10
	
	if var66 < p10 then
		UpdateScrollingFrameCanvasSize()
		
		if var42 and var40.Visible and not var60 then
			var42.CanvasPosition = Vector2.new(0, math.max(0, var42.CanvasSize.Y.Offset - var42.AbsoluteSize.Y))
		end
	end
	return p10
end

local _ = function(value) --[[ line: 881 | named "SetNumberOfHotbarSlots" ]]
	-- upvalues: var66 (write), t_2 (ref), MakeSlot (ref), var37 (write), var51 (write), var55 (write), UpdateBackpackLayout (ref)
	if var66 ~= value then
		local var132 = var66
		
		if value < var132 then
			for i = var132, value + 1, -1 do
				local var133 = t_2[i]
				
				if var133 then
					var133:MoveToInventory()
					var133:Delete()
				end
			end
			for i_1 = var132, value + 1, -1 do
				local var134 = t_2[i_1]
				
				if not var134.Tool then
					var134:Delete()
				end
			end
		else
			for i_2 = var132, value do
				var66 = i_2
				
				if not t_2[i_2] then
					local var136 = MakeSlot(var37, i_2)
					var136.Frame.Visible = false
					
					if not var51 then
						var51 = var136
					end
				end
				local _ = t_2[i_2]
				local tool = t_2[i_2].Tool
				local var135 = MakeSlot(var37, i_2)
				
				if tool then
					var135:Fill(tool)
				elseif not var51 then
					var51 = var135
				end
			end
		end
		var66 = value
		var55 = 0
		
		for i_2 = 1, var66 do
			if t_2[i_2] and t_2[i_2].Tool then
				var55 += 1
			end
		end
		UpdateBackpackLayout()
	end
end

local function OnChildAdded(p36) --[[ line: 943 ]]
	-- upvalues: var36 (write), var47 (write), var48 (write), var65 (write), var56 (write), t_3 (ref), var57 (write), localPlayer (write), var51 (write), MakeSlot (ref), var43 (write), t_2 (ref), var49 (write), AdjustHotbarFrames (ref), var66 (write), var40 (write), t (ref)
	if not var36 then return end
	if p36:IsA("Tool") or p36:IsA("HopperBin") then
		if p36.Parent == var47 then
			var65 = tick()
		end
		if var56 and p36.Parent == var47 then
			var56:ToggleSelect()
			t_3[var56]:UpdateEquipView()
			var56 = nil
		end
		if not var57 and p36.Parent == var47 and not t_3[p36] then
			local starterGear = localPlayer:FindFirstChild("StarterGear")
			
			if starterGear and starterGear:FindFirstChild(p36.Name) then
				var57 = true
				
				for i = (var51 or MakeSlot(var43)).Index, 1, -1 do
					local var138 = t_2[i]
					local var139 = i - 1
					
					if var139 > 0 then
						t_2[var139]:Swap(var138)
					else
						var138:Fill(p36)
					end
				end
				for i_1, v in pairs(var47:GetChildren()) do
					if v:IsA("Tool") and v ~= p36 then
						v.Parent = var49
					end
				end
				AdjustHotbarFrames()
				
				return
			else
				local var140 = t_3[p36]
				
				if var140 then
					var140:UpdateEquipView()
				else
					var140 = var51 or MakeSlot(var43)
					var140:Fill(p36)
					
					if var140.Index <= var66 and not var40.Visible then
						AdjustHotbarFrames()
					end
					if p36:IsA("HopperBin") and p36.Active then
						if var48 then
							var48:UnequipTools()
							
							if var56 then
								var56:ToggleSelect()
								t_3[var56]:UpdateEquipView()
								var56 = nil
							end
						end
						var56 = p36
					end
				end
				t.BackpackItemAdded:Fire()
				
				return
			end
		end
	elseif p36:IsA("Humanoid") and p36.Parent == var47 then
		var48 = p36
	end
end

local function OnChildRemoved(p37) --[[ line: 1013 ]]
	-- upvalues: var36 (write), var65 (write), var47 (write), var49 (write), t_3 (ref), var66 (write), var40 (write), AdjustHotbarFrames (ref), var56 (write), t (ref), t_2 (ref)
	if not var36 then return end
	if not p37:IsA("Tool") and not p37:IsA("HopperBin") then return end
	var65 = tick()
	local parent = p37.Parent
	
	if parent == var47 or parent == var49 then return end
	local var141 = t_3[p37]
	
	if var141 then
		var141:Clear()
		
		if var66 < var141.Index then
			var141:Delete()
		elseif not var40.Visible then
			AdjustHotbarFrames()
		end
	end
	if p37 == var56 then
		var56 = nil
	end
	local var143
	t.BackpackItemRemoved:Fire()
	
	for i = var66 + 1, #t_2 do
		local var142 = t_2[i]
		
		if not var142 or not var142.Tool then
			continue
		end
		var143 = false
		if var143 then
			t.BackpackEmpty:Fire()
		end
		return
	end
	var143 = true
end

local function OnCharacterAdded(p38) --[[ line: 1050 ]]
	-- upvalues: t_2 (ref), var66 (write), var56 (write), t_7 (write), var47 (write), OnChildRemoved (ref), OnChildAdded (ref), var49 (write), localPlayer (write), AdjustHotbarFrames (ref)
	for i = #t_2, 1, -1 do
		local var144 = t_2[i]
		
		if var144.Tool then
			var144:Clear()
		end
		if var66 < i then
			var144:Delete()
		end
	end
	var56 = nil
	
	for i_1, v in pairs(t_7) do
		v:disconnect()
	end
	t_7 = {}
	var47 = p38
	table.insert(t_7, p38.ChildRemoved:connect(OnChildRemoved))
	table.insert(t_7, p38.ChildAdded:connect(OnChildAdded))
	
	for i_2, v_1 in pairs(p38:GetChildren()) do
		OnChildAdded(v_1)
	end
	var49 = localPlayer:WaitForChild("Backpack")
	table.insert(t_7, var49.ChildRemoved:connect(OnChildRemoved))
	table.insert(t_7, var49.ChildAdded:connect(OnChildAdded))
	
	for i_3, v_2 in pairs(var49:GetChildren()) do
		OnChildAdded(v_2)
	end
	AdjustHotbarFrames()
end

local function OnInputBegan(p39, p40) --[[ line: 1089 ]]
	-- upvalues: var59 (write), var58 (write), value_2 (ref), t_4 (ref), var40 (write), t (ref)
	if p39.UserInputType == Enum.UserInputType.Keyboard and not var59 and (var58 or p39.KeyCode.Value == value_2) then
		local value = t_4[p39.KeyCode.Value]
		
		if value then
			value(p40)
		end
	end
	local userInputType = p39.UserInputType
	
	if not p40 and (userInputType == Enum.UserInputType.MouseButton1 or userInputType == Enum.UserInputType.Touch) and (var40 and var40.Visible) then
		t.OpenClose()
	end
end

local function OnUISChanged(p41) --[[ line: 1112 ]]
	-- upvalues: userInputService (ref), VRService (ref), var66 (write), t_2 (ref)
	if p41 == "KeyboardEnabled" or p41 == "VREnabled" then
		local var145 = userInputService.KeyboardEnabled and not VRService.VREnabled
		
		for i = 1, var66 do
			t_2[i]:TurnNumber(var145)
		end
	end
end

local var81 = nil
local var82 = nil

local var83 = function() --[[ line: 1124 ]] end

local vector2 = Vector2.new(0, 0)

function unbindAllGamepadEquipActions() --[[ line: 1128 ]]
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindAction("RBXBackpackHasGamepadFocus")
	contextActionService:UnbindAction("RBXCloseInventory")
end

local _ = function(value, p42) --[[ line: 1133 | named "setHotbarVisibility" ]]
	-- upvalues: var66 (write), t_2 (ref)
	for i = 1, var66 do
		local var146 = t_2[i]
		
		if var146 and var146.Frame and (p42 or var146.Tool) then
			var146.Frame.Visible = value
		end
	end
end

local function getInputDirection(p43) --[[ line: 1142 ]]
	-- upvalues: vector2 (write)
	local var147 = if p43.UserInputState == Enum.UserInputState.End then -1 else 1
	
	if p43.KeyCode == Enum.KeyCode.Thumbstick1 then
		local magnitude = p43.Position.magnitude
		vector2 = if magnitude > 0.98 then Vector2.new(p43.Position.x / magnitude, -p43.Position.y / magnitude) else Vector2.new(0, 0)
	else
		vector2 = if p43.KeyCode == Enum.KeyCode.DPadLeft then Vector2.new(vector2.x - var147 * 1, vector2.y) elseif p43.KeyCode == Enum.KeyCode.DPadRight then Vector2.new(vector2.x + var147 * 1, vector2.y) elseif p43.KeyCode == Enum.KeyCode.DPadUp then Vector2.new(vector2.x, vector2.y - var147 * 1) elseif p43.KeyCode == Enum.KeyCode.DPadDown then Vector2.new(vector2.x, vector2.y + var147 * 1) else Vector2.new(0, 0)
	end
	return vector2
end

local _ = function(_, _, p44) --[[ line: 1173 ]]
	-- upvalues: getInputDirection (ref), var66 (write), t_2 (ref), var48 (write), var56 (write), t_3 (ref)
	local var148 = getInputDirection(p44)
	
	if var148 == Vector2.new(0, 0) then return end
	local var149 = math.atan2(var148.y, var148.x) - -1.570796326795
	
	if var149 < 0 then
		var149 += 6.28318530718
	end
	local floored = math.floor(var149 / 0.785398163397 + 1 + 0.5)
	
	if var66 < floored then
		floored = 1
	end
	if floored > 0 then
		local var151 = t_2[floored]
		
		if var151 and var151.Tool and not var151:IsEquipped() then
			var151:Select()
			
			return
		end
	elseif var48 then
		var48:UnequipTools()
		
		if var56 then
			var56:ToggleSelect()
			t_3[var56]:UpdateEquipView()
			var56 = nil
		end
	end
end

var69 = function(_, p45, p46) --[[ line: 1203 ]]
	-- upvalues: var81 (write), var82 (write), var48 (write), var56 (write), t_3 (ref), var66 (write), t_2 (ref), var68 (write)
	if p45 ~= Enum.UserInputState.Begin then return end
	if not var81 or (var81.KeyCode ~= Enum.KeyCode.ButtonR1 or p46.KeyCode ~= Enum.KeyCode.ButtonL1) and (var81.KeyCode ~= Enum.KeyCode.ButtonL1 or p46.KeyCode ~= Enum.KeyCode.ButtonR1) or tick() - var82 > 0.06 then
		var81 = p46
		var82 = tick()
		delay(0.06, function() --[[ line: 1231 ]]
			-- upvalues: var81 (copy), p46 (ref), var66 (copy), t_2 (copy), var48 (copy), var56 (copy), t_3 (copy), var68 (copy)
			if var81 ~= p46 then return end
			local var154
			local var152 = if p46.KeyCode == Enum.KeyCode.ButtonL1 then -1 else 1
			
			for i = 1, var66 do
				local var153 = t_2[i]
				
				if var153 then
					if not var153:IsEquipped() then
						continue
					end
					var154 = var152 + i
					local var155 = false
					
					if var66 < var154 then
						var154 = 1
						var155 = true
					elseif var154 < 1 then
						var154 = var66
						var155 = true
					end
					local var156 = var154
					while not t_2[var154].Tool do
						var154 += var152
						
						if var154 ~= var156 then
							if var66 < var154 then
								var154 = 1
								var155 = true
							elseif var154 < 1 then
								var154 = var66
								var155 = true
							end
						end
						return
					end
					if var155 then
						if var48 then
							var48:UnequipTools()
							
							if var56 then
								var56:ToggleSelect()
								t_3[var56]:UpdateEquipView()
								var56 = nil
							end
						end
						var68 = nil
						
						return
					else
						t_2[var154]:Select()
						
						return
					end
				end
				return
			end
			if var68 and var68.Tool then
				var68:Select()
				
				return
			end
			for var154 = if var152 == -1 then var66 else 1, if var152 == -1 then 1 else var66, var152 do
				if not t_2[var154].Tool then
					continue
				end
				t_2[var154]:Select()
				
				return
			end
		end)
		
		return
	elseif var48 then
		var48:UnequipTools()
		
		if var56 then
			var56:ToggleSelect()
			t_3[var56]:UpdateEquipView()
			var56 = nil
		end
	end
	var81 = p46
	var82 = tick()
end

function getGamepadSwapSlot() --[[ line: 1301 ]]
	-- upvalues: t_2 (ref)
	for i = 1, #t_2 do
		if t_2[i].Frame.BorderSizePixel <= 0 then
			continue
		end
		return t_2[i]
	end
end

function changeSlot(p47) --[[ line: 1309 ]]
	-- upvalues: gamepadService (ref), guiService (ref), var41 (write), var66 (write), deprecateOldGuiObjectPropertiesEngineFeature (ref)
	if p47.Frame == guiService.SelectedCoreObject and not gamepadService.GamepadCursorEnabled then
		local var157 = getGamepadSwapSlot()
		
		if var157 then
			var157.Frame.BorderSizePixel = 0
			
			if var157 ~= p47 then
				p47:Swap(var157)
				
				if var41 and var41.SelectionImageObject then
					var41.SelectionImageObject.Visible = false
				end
				if var66 < p47.Index and not p47.Tool then
					if guiService.SelectedCoreObject == p47.Frame then
						guiService.SelectedCoreObject = var157.Frame
					end
					p47:Delete()
				end
				if var66 >= var157.Index or var157.Tool then return end
				if guiService.SelectedCoreObject == var157.Frame then
					guiService.SelectedCoreObject = p47.Frame
				end
				var157:Delete()
				
				return
			end
		else
			local size = p47.Frame.Size
			local position = p47.Frame.Position
			
			if deprecateOldGuiObjectPropertiesEngineFeature then
				p47.Frame:TweenSizeAndPositionInternal(size + UDim2.new(0, 10, 0, 10), position - UDim2.new(0, 5, 0, 5), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, function() --[[ line: 1348 ]]
					-- upvalues: p47 (ref), size (ref), position (ref)
					p47.Frame:TweenSizeAndPositionInternal(size, position, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true)
				end)
			else
				p47.Frame:TweenSizeAndPosition(size + UDim2.new(0, 10, 0, 10), position - UDim2.new(0, 5, 0, 5), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, function() --[[ line: 1367 ]]
					-- upvalues: p47 (ref), size (ref), position (ref)
					p47.Frame:TweenSizeAndPosition(size, position, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true)
				end)
			end
			p47.Frame.BorderSizePixel = 3
			
			if var41 and var41.SelectionImageObject then
				var41.SelectionImageObject.Visible = true
				
				return
			end
		end
	else
		p47:Select()
		
		if var41 and var41.SelectionImageObject then
			var41.SelectionImageObject.Visible = false
		end
	end
end

function enableGamepadInventoryControl() --[[ line: 1392 ]]
	-- upvalues: var40 (write), t (ref), contextActionService (ref), var83 (ref), var37 (write), guiService (ref)
	local var158 = function(_, p48, _) --[[ line: 1393 ]]
		-- upvalues: var40 (copy), t (copy)
		if p48 ~= Enum.UserInputState.Begin then return end
		if getGamepadSwapSlot() then
			local var159 = getGamepadSwapSlot()
			
			if var159 then
				var159.Frame.BorderSizePixel = 0
				
				return
			end
		elseif var40 and var40.Visible then
			t.OpenClose()
		end
	end
	
	contextActionService:BindAction("RBXBackpackHasGamepadFocus", var83, false, Enum.UserInputType.Gamepad1)
	contextActionService:BindAction("RBXCloseInventory", var158, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart)
	local _ = false
	
	if var37 then
		guiService.SelectedCoreObject = var37:FindFirstChild("1")
	end
end

function disableGamepadInventoryControl() --[[ line: 1425 ]]
	-- upvalues: var66 (write), t_2 (ref), var36 (write), guiService (ref)
	unbindAllGamepadEquipActions()
	
	for i = 1, var66 do
		local var160 = t_2[i]
		
		if var160 and var160.Frame then
			var160.Frame.BorderSizePixel = 0
		end
	end
	if var36 and guiService.SelectedCoreObject and guiService.SelectedCoreObject:IsDescendantOf(var36) then
		guiService.SelectedCoreObject = nil
	end
end

local _ = function() --[[ line: 1440 | named "bindBackpackHotbarAction" ]]
	-- upvalues: var58 (write), var34 (write), contextActionService (ref), var69 (write)
	if var58 and not var34 then
		var34 = true
		contextActionService:BindAction("RBXHotbarEquip", var69, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
	end
end

local _ = function() --[[ line: 1453 | named "unbindBackpackHotbarAction" ]]
	-- upvalues: var34 (write), contextActionService (ref)
	disableGamepadInventoryControl()
	var34 = false
	contextActionService:UnbindAction("RBXHotbarEquip")
end

function gamepadDisconnected() --[[ line: 1459 ]]
	-- upvalues: VRService (ref), var64 (write)
	if not VRService.VREnabled then
		var64 = false
		disableGamepadInventoryControl()
	end
end

function gamepadConnected() --[[ line: 1466 ]]
	-- upvalues: VRService (ref), var64 (write), var36 (write), guiService (ref), var55 (write), var58 (write), var34 (write), contextActionService (ref), var69 (write), var40 (write)
	if not VRService.VREnabled then
		var64 = true
		
		if var36 then
			guiService:AddSelectionParent("RBXBackpackSelection", var36)
		end
		if var55 >= 1 and var58 and not var34 then
			var34 = true
			contextActionService:BindAction("RBXHotbarEquip", var69, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
		end
		if var40 and var40.Visible then
			enableGamepadInventoryControl()
		end
	end
end

local function setBackpackEnabled(value) --[[ line: 1483 ]]
	-- upvalues: var33 (write), var58 (write), var36 (write), fFlagMountCoreGuiBackpackModule (ref), robloxGui (ref), t_6 (ref), guiService (ref), var55 (write), var34 (write), contextActionService (ref), var69 (write)
	local var33_1 = value and var33
	var58 = var33_1
	
	if var36 then
		if not fFlagMountCoreGuiBackpackModule then
			var36.Visible = var33_1
		elseif var33_1 then
			var36.Parent = robloxGui
		else
			var36.Parent = nil
		end
	end
	for i, v in pairs(t_6) do
		if var33_1 then
			guiService:AddKey(v)
		else
			guiService:RemoveKey(v)
		end
	end
	if var33_1 then
		if var55 >= 1 and var58 and not var34 then
			var34 = true
			contextActionService:BindAction("RBXHotbarEquip", var69, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
			
			return
		end
	else
		disableGamepadInventoryControl()
		var34 = false
		contextActionService:UnbindAction("RBXHotbarEquip")
	end
end

local function MakeVRRoundButton(value, p49) --[[ line: 1516 ]]
	-- upvalues: NewGui (ref)
	local var162 = NewGui("ImageButton", value)
	var162.Size = UDim2.new(0, 40, 0, 40)
	var162.Image = "rbxasset://textures/ui/Keyboard/close_button_background.png"
	local var163 = NewGui("ImageLabel", "Icon")
	var163.Size = UDim2.new(0.5, 0, 0.5, 0)
	var163.Position = UDim2.new(0.25, 0, 0.25, 0)
	var163.Image = p49
	var163.Parent = var162
	local var164 = NewGui("ImageLabel", "Selection")
	var164.Size = UDim2.new(0.9, 0, 0.9, 0)
	var164.Position = UDim2.new(0.05, 0, 0.05, 0)
	var164.Image = "rbxasset://textures/ui/Keyboard/close_button_selection.png"
	var162.SelectionImageObject = var164
	
	return var162, var163, var164
end

function t.createGui() --[[ line: 1536 ]]
	-- upvalues: var36 (write), NewGui (ref), fFlagMountCoreGuiBackpackModule (ref), starterGuiService (ref), robloxGui (ref), var37 (write), var66 (write), MakeSlot (ref), var51 (write), var38 (write), t (ref), color3_4 (ref), var39 (write), MakeVRRoundButton (ref), var40 (write), var13 (write), color3 (ref), var41 (write), var42 (write), var43 (write), var44 (write), var12 (write), var45 (write), var46 (write), UpdateBackpackLayout (ref), create (ref), var31 (ref), color3_5 (ref), var22 (write), var20 (write), color3_2 (ref), t_2 (ref), var60 (write), UpdateScrollingFrameCanvasSize (ref), t_8 (ref), t_4 (ref), VRService (ref), userInputService (ref), guiService (ref), t_5 (ref), AdjustHotbarFrames (ref), var64 (write), t_1 (ref), contextActionService (ref), value (ref), localPlayer (write), playersService (ref), OnCharacterAdded (ref), t_6 (ref), OnInputBegan (ref), var59 (write), value_2 (ref), var56 (write), var48 (write), t_3 (ref), OnUISChanged (ref), enableHotbarHide (ref), settingsShowSignal (ref), isInExperienceUIVREnabled (ref), inExperienceUIVRIXP (ref), inExperienceAppChatModalModule (ref), userGameSettingsService (ref), var17 (write)
	var36 = NewGui("Frame", "Backpack")
	
	if not fFlagMountCoreGuiBackpackModule then
		var36.Visible = false
		var36.Parent = robloxGui
	elseif starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack) then
		var36.Parent = robloxGui
	end
	var37 = NewGui("Frame", "Hotbar")
	var37.Parent = var36
	
	for i = 1, var66 do
		local var165 = MakeSlot(var37, i)
		var165.Frame.Visible = false
		
		if not var51 then
			var51 = var165
		end
	end
	var38 = NewGui("ImageButton", "OpenInventory")
	var38.Size = UDim2.new(0, 30, 0, 30)
	var38.Image = "rbxasset://textures/ui/Backpack/ScrollUpArrow.png"
	var38.MouseButton1Click:connect(function() --[[ line: 1567 ]]
		-- upvalues: t (copy)
		t.OpenClose()
	end)
	var38.SelectionGained:connect(function() --[[ line: 1570 ]]
		-- upvalues: var38 (copy), color3_4 (copy)
		var38.ImageColor3 = color3_4
	end)
	var38.SelectionLost:connect(function() --[[ line: 1573 ]]
		-- upvalues: var38 (copy)
		var38.ImageColor3 = Color3.new(1, 1, 1)
	end)
	local var166 = NewGui("Frame", "Selection")
	var166.Visible = false
	var38.SelectionImageObject = var166
	var39 = MakeVRRoundButton("CloseInventory", "rbxasset://textures/ui/Keyboard/close_button_icon.png")
	var39.Position = UDim2.new(0, 0, 0, -50)
	var39.MouseButton1Click:connect(function() --[[ line: 1583 ]]
		-- upvalues: var40 (copy), t (copy)
		if var40.Visible then
			t.OpenClose()
		end
	end)
	local var167 = NewGui("ImageLabel", "LeftBumper")
	var167.Size = UDim2.new(0, 40, 0, 40)
	var167.Position = UDim2.new(0, -var167.Size.X.Offset, 0.5, -var167.Size.Y.Offset / 2)
	local var168 = NewGui("ImageLabel", "RightBumper")
	var168.Size = UDim2.new(0, 40, 0, 40)
	var168.Position = UDim2.new(1, 0, 0.5, -var168.Size.Y.Offset / 2)
	var40 = NewGui("Frame", "Inventory")
	var40.BackgroundTransparency = var13
	var40.BackgroundColor3 = color3
	var40.Active = true
	var40.Visible = false
	var40.Parent = var36
	var41 = NewGui("TextButton", "VRInventorySelector")
	var41.Position = UDim2.new(0, 0, 0, 0)
	var41.Size = UDim2.new(1, 0, 1, 0)
	var41.BackgroundTransparency = 1
	var41.Text = ""
	var41.Parent = var40
	local var169 = NewGui("ImageLabel", "Selector")
	var169.Size = UDim2.new(1, 0, 1, 0)
	var169.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png"
	var169.ScaleType = Enum.ScaleType.Slice
	var169.SliceCenter = Rect.new(12, 12, 52, 52)
	var169.Visible = false
	var41.SelectionImageObject = var169
	var42 = NewGui("ScrollingFrame", "ScrollingFrame")
	var42.Selectable = false
	var42.CanvasSize = UDim2.new(0, 0, 0, 0)
	var42.Parent = var40
	var43 = NewGui("Frame", "UIGridFrame")
	var43.Selectable = false
	var43.Size = UDim2.new(1, -10, 1, 0)
	var43.Position = UDim2.new(0, 5, 0, 0)
	var43.Parent = var42
	var44 = Instance.new("UIGridLayout")
	var44.SortOrder = Enum.SortOrder.LayoutOrder
	var44.CellSize = UDim2.new(0, var12, 0, var12)
	var44.CellPadding = UDim2.new(0, 5, 0, 5)
	var44.Parent = var43
	var45 = MakeVRRoundButton("ScrollUpButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png")
	var45.Size = UDim2.new(0, 34, 0, 34)
	var45.Position = UDim2.new(0.5, -var45.Size.X.Offset / 2, 0, 43)
	var45.Icon.Position -= UDim2.new(0, 0, 0, 2)
	var45.MouseButton1Click:connect(function() --[[ line: 1643 ]]
		-- upvalues: var42 (copy), var12 (copy)
		if var42 then
			var42.CanvasPosition = Vector2.new(var42.CanvasPosition.X, math.min(var42.CanvasSize.Y.Offset - var42.AbsoluteWindowSize.Y, math.max(0, var42.CanvasPosition.Y - (var12 + 5))))
			
			return
		end
	end)
	var46 = MakeVRRoundButton("ScrollDownButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png")
	var46.Rotation = 180
	var46.Icon.Position -= UDim2.new(0, 0, 0, 2)
	var46.Size = UDim2.new(0, 34, 0, 34)
	var46.Position = UDim2.new(0.5, -var46.Size.X.Offset / 2, 1, (-var46.Size.Y.Offset) - 3)
	var46.MouseButton1Click:connect(function() --[[ line: 1664 ]]
		-- upvalues: var42 (copy), var12 (copy)
		if var42 then
			var42.CanvasPosition = Vector2.new(var42.CanvasPosition.X, math.min(var42.CanvasSize.Y.Offset - var42.AbsoluteWindowSize.Y, math.max(0, var42.CanvasPosition.Y + (var12 + 5))))
			
			return
		end
	end)
	var42.Changed:connect(function(p50) --[[ line: 1678 ]]
		-- upvalues: var42 (copy), var45 (copy), var46 (copy)
		if not var42 then return end
		if p50 == "AbsoluteWindowSize" or p50 == "CanvasPosition" or p50 == "CanvasSize" then
			local var184 = var42.CanvasPosition.Y < var42.CanvasSize.Y.Offset - var42.AbsoluteWindowSize.Y
			var45.Visible = var42.CanvasPosition.Y ~= 0
			var46.Visible = var184
		end
	end)
	UpdateBackpackLayout()
	local var170 = create("Frame")({
		Name = "GamepadHintsFrame",
		BackgroundTransparency = 1,
		Visible = false,
		Size = UDim2.new(0, var37.Size.X.Offset, 0, if var31 then 95 else 60),
		Parent = var36
	})
	
	local function addGamepadHint(p51, p52, p53) --[[ line: 1704 ]]
		-- upvalues: create (copy), var170 (ref), var31 (copy)
		local var185 = create("Frame")({
			Name = "HintFrame",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, -5),
			Position = UDim2.new(0, 0, 0, 0),
			Parent = var170
		})
		local _ = create("ImageLabel")({
			Name = "HintImage",
			BackgroundTransparency = 1,
			Size = var31 and UDim2.new(0, 90, 0, 90) or UDim2.new(0, 60, 0, 60),
			Image = if var31 then p52 else p51,
			Parent = var185
		})
		local var186 = create("TextLabel")({
			Name = "HintText",
			BackgroundTransparency = 1,
			TextWrapped = true,
			Position = UDim2.new(0, if var31 then 100 else 70, 0, 0),
			Size = UDim2.new(1, -(if var31 then 100 else 70), 1, 0),
			Font = Enum.Font.SourceSansBold,
			FontSize = if var31 then Enum.FontSize.Size36 else Enum.FontSize.Size24,
			Text = p53,
			TextColor3 = Color3.new(1, 1, 1),
			TextXAlignment = Enum.TextXAlignment.Left,
			Parent = var185
		})
		local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
		UITextSizeConstraint.Parent = var186
		UITextSizeConstraint.MaxTextSize = var186.TextSize
	end
	
	local function resizeGamepadHintsFrame() --[[ line: 1739 ]]
		-- upvalues: var37 (copy), var40 (copy), var170 (ref), var31 (copy)
		if not var37 or not var40 then return end
		var170.Size = UDim2.new(var37.Size.X.Scale, var37.Size.X.Offset, 0, if var31 then 95 else 60)
		var170.Position = UDim2.new(var37.Position.X.Scale, var37.Position.X.Offset, var40.Position.Y.Scale, var40.Position.Y.Offset - var170.Size.Y.Offset)
		local var188 = 0
		local children = var170:GetChildren()
		
		for i = 1, #children do
			children[i].Size = UDim2.new(1, 0, 1, -5)
			children[i].Position = UDim2.new(0, 0, 0, 0)
			var188 += children[i].HintText.Position.X.Offset + children[i].HintText.TextBounds.X
		end
		local var190 = (var170.AbsoluteSize.X - var188) / (#children - 1)
		
		for i_1 = 1, #children do
			children[i_1].Position = i_1 == 1 and UDim2.new(0, 0, 0, 0) or UDim2.new(0, children[i_1 - 1].Position.X.Offset + children[i_1 - 1].Size.X.Offset + var190, 0, 0)
			children[i_1].Size = UDim2.new(0, children[i_1].HintText.Position.X.Offset + children[i_1].HintText.TextBounds.X, 1, -5)
		end
	end
	
	addGamepadHint("rbxasset://textures/ui/Controls/DesignSystem/ButtonX.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonX@2x.png", "Remove From Hotbar")
	addGamepadHint("rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonA@2x.png", "Select/Swap")
	addGamepadHint("rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonB@2x.png", "Close Backpack")
	local var173 = NewGui("Frame", "Search")
	var173.BackgroundColor3 = color3_5
	var173.BackgroundTransparency = var22
	var173.Size = UDim2.new(0, 190, 0, 30)
	var173.Position = UDim2.new(1, (-var173.Size.X.Offset) - 5, 0, 5)
	var173.Parent = var40
	local var174 = NewGui("TextBox", "TextBox")
	var174.Text = var20
	var174.ClearTextOnFocus = false
	var174.FontSize = Enum.FontSize.Size24
	var174.TextXAlignment = Enum.TextXAlignment.Left
	var174.Size = var173.Size - UDim2.new(0, 0, 0, 0)
	var174.Position = UDim2.new(0, 0, 0, 0)
	var174.Parent = var173
	local var175 = NewGui("TextButton", "X")
	var175.Text = "x"
	var175.TextColor3 = color3_2
	var175.FontSize = Enum.FontSize.Size24
	var175.TextYAlignment = Enum.TextYAlignment.Bottom
	var175.BackgroundColor3 = color3_5
	var175.BackgroundTransparency = 0
	var175.Size = UDim2.new(0, var173.Size.Y.Offset - 10, 0, var173.Size.Y.Offset - 10)
	var175.Position = UDim2.new(1, (-var175.Size.X.Offset) - 10, 0.5, -var175.Size.Y.Offset / 2)
	var175.ZIndex = 0
	var175.Visible = false
	var175.BorderSizePixel = 0
	var175.Parent = var173
	
	local function search() --[[ line: 1837 ]]
		-- upvalues: var174 (ref), var66 (copy), t_2 (copy), var40 (copy), var60 (copy), var43 (copy), var42 (copy), UpdateScrollingFrameCanvasSize (copy), var175 (ref)
		local t = {}
		
		for i in var174.Text:gmatch("%S+") do
			t[i:lower()] = true
		end
		local t_1 = {}
		
		for i_1 = var66 + 1, #t_2 do
			local var193 = t_2[i_1]
			table.insert(t_1, { var193, var193:CheckTerms(t) })
			var193.Frame.Visible = false
			var193.Frame.Parent = var40
		end
		table.sort(t_1, function(p54, p55) --[[ line: 1852 ]]
			return p55[2] < p54[2]
		end)
		var60 = true
		local var194 = 0
		
		for i_2, v in ipairs(t_1) do
			local var195 = v[1]
			
			if v[2] > 0 then
				var195.Frame.Visible = true
				var195.Frame.Parent = var43
				var195.Frame.LayoutOrder = var66 + var194
				var194 += 1
			end
		end
		if var42 then
			var42.CanvasPosition = Vector2.new(0, 0)
		end
		UpdateScrollingFrameCanvasSize()
		var175.ZIndex = 3
	end
	
	local function clearResults() --[[ line: 1876 ]]
		-- upvalues: var175 (ref), var60 (copy), var66 (copy), t_2 (copy), var43 (copy), UpdateScrollingFrameCanvasSize (copy)
		if var175.ZIndex > 0 then
			var60 = false
			
			for i = var66 + 1, #t_2 do
				local var196 = t_2[i]
				var196.Frame.LayoutOrder = var196.Index
				var196.Frame.Parent = var43
				var196.Frame.Visible = true
			end
			var175.ZIndex = 0
		end
		UpdateScrollingFrameCanvasSize()
	end
	
	local function reset() --[[ line: 1890 ]]
		-- upvalues: clearResults (ref), var174 (ref), var20 (copy)
		clearResults()
		var174.Text = var20
	end
	
	local function onChanged(p56) --[[ line: 1895 ]]
		-- upvalues: var174 (ref), clearResults (ref), var20 (copy), search (ref), var175 (ref)
		if p56 == "Text" then
			local text = var174.Text
			
			if text == "" then
				clearResults()
			elseif text ~= var20 then
				search()
			end
			var175.Visible = text ~= "" and text ~= var20
		end
	end
	
	local function focusLost(p57) --[[ line: 1913 ]]
		-- upvalues: search (ref), var174 (ref), var20 (copy)
		if p57 then
			search()
			
			return
		elseif var174.Text == "" then
			var174.Text = var20
		end
	end
	
	var174.Focused:connect(function() --[[ line: 1907 | named "onFocused" ]]
		-- upvalues: var174 (ref), var20 (copy)
		if var174.Text == var20 then
			var174.Text = ""
		end
	end)
	var175.MouseButton1Click:connect(reset)
	var174.Changed:connect(onChanged)
	var174.FocusLost:connect(focusLost)
	table.insert(t_8, t.StateChanged.Event:connect(function(p58) --[[ line: 1929 ]]
		-- upvalues: var175 (ref), clearResults (ref), var174 (ref), var20 (copy)
		var175.Modal = p58
		
		if not p58 then
			clearResults()
			var174.Text = var20
		end
	end))
	
	t_4[Enum.KeyCode.Escape.Value] = function(p59) --[[ line: 1937 ]]
		-- upvalues: clearResults (ref), var174 (ref), var20 (copy), var40 (copy), t (copy)
		if p59 then
			clearResults()
			var174.Text = var20
			
			return
		elseif var40 and var40.Visible then
			t.OpenClose()
		end
	end
	
	table.insert(t_8, userInputService.LastInputTypeChanged:connect(function(p60) --[[ line: 1945 | named "detectGamepad" ]]
		-- upvalues: VRService (copy), var173 (ref)
		if p60 == Enum.UserInputType.Gamepad1 and not VRService.VREnabled then
			var173.Visible = false
			
			return
		end
		var173.Visible = true
	end))
	
	local var181 = function(_, p61, _) --[[ line: 1956 ]]
		-- upvalues: guiService (copy), var66 (copy), t_2 (copy)
		if p61 ~= Enum.UserInputState.Begin then return end
		if not guiService.SelectedCoreObject then return end
		for i = 1, var66 do
			if t_2[i].Frame ~= guiService.SelectedCoreObject or not t_2[i].Tool then
				continue
			end
			t_2[i]:MoveToInventory()
			
			return
		end
	end
	
	local function openClose() --[[ line: 1972 ]]
		-- upvalues: var40 (copy), t_5 (copy), AdjustHotbarFrames (copy), var37 (copy), var66 (copy), t_2 (copy), var64 (copy), t_1 (copy), userInputService (copy), resizeGamepadHintsFrame (ref), var170 (ref), contextActionService (copy), var181 (ref), t (copy)
		if not var40 then return end
		if not next(t_5) then
			var40.Visible = not var40.Visible
			local visible = var40.Visible
			AdjustHotbarFrames()
			var37.Active = not var37.Active
			
			for i = 1, var66 do
				t_2[i]:SetClickability(not visible)
			end
		end
		if not var40.Visible then
			if var64 then
				var170.Visible = false
			end
			disableGamepadInventoryControl()
		elseif var64 then
			if t_1[userInputService:GetLastInputType()] then
				resizeGamepadHintsFrame()
				var170.Visible = true
			end
			enableGamepadInventoryControl()
		end
		if var40.Visible then
			contextActionService:BindAction("RBXRemoveSlot", var181, false, Enum.KeyCode.ButtonX)
		else
			contextActionService:UnbindAction("RBXRemoveSlot")
		end
		t.IsOpen = var40.Visible
		t.StateChanged:Fire(var40.Visible)
	end
	
	t_4[value] = function() --[[ line: 2011 ]]
		-- upvalues: guiService (copy), openClose (ref)
		if guiService.MenuIsOpen then
			return
		end
		openClose()
	end
	
	t.OpenClose = openClose
	while not localPlayer do
		wait()
		localPlayer = playersService.LocalPlayer
	end
	table.insert(t_8, localPlayer.CharacterAdded:connect(OnCharacterAdded))
	
	if localPlayer.Character then
		OnCharacterAdded(localPlayer.Character)
	end
	for i_1 = 0, 9 do
		table.insert(t_6, tostring(i_1))
	end
	table.insert(t_6, "`")
	table.insert(t_8, userInputService.InputBegan:connect(OnInputBegan))
	table.insert(t_8, userInputService.TextBoxFocused:connect(function() --[[ line: 2048 ]]
		-- upvalues: var59 (copy)
		var59 = true
	end))
	table.insert(t_8, userInputService.TextBoxFocusReleased:connect(function() --[[ line: 2054 ]]
		-- upvalues: var59 (copy)
		var59 = false
	end))
	
	t_4[value_2] = function() --[[ line: 2060 ]]
		-- upvalues: var56 (copy), var48 (copy), t_3 (copy)
		if var56 and var48 then
			var48:UnequipTools()
			
			if var56 then
				var56:ToggleSelect()
				t_3[var56]:UpdateEquipView()
				var56 = nil
			end
		end
	end
	
	table.insert(t_8, userInputService.Changed:connect(OnUISChanged))
	local var183 = userInputService.KeyboardEnabled and not VRService.VREnabled
	
	for i_2 = 1, var66 do
		t_2[i_2]:TurnNumber(var183)
	end
	if userInputService:GetGamepadConnected(Enum.UserInputType.Gamepad1) then
		gamepadConnected()
	end
	table.insert(t_8, userInputService.GamepadConnected:connect(function(p62) --[[ line: 2076 ]]
		if p62 == Enum.UserInputType.Gamepad1 then
			gamepadConnected()
		end
	end))
	table.insert(t_8, userInputService.GamepadDisconnected:connect(function(p63) --[[ line: 2084 ]]
		if p63 == Enum.UserInputType.Gamepad1 then
			gamepadDisconnected()
		end
	end))
	
	if enableHotbarHide then
		table.insert(t_8, settingsShowSignal:connect(function(p64) --[[ line: 2095 ]]
			-- upvalues: t (copy), AdjustHotbarFrames (copy)
			if p64 then
				if t.IsHotbarVisible then
					AdjustHotbarFrames(true)
					
					return
				end
			else
				AdjustHotbarFrames(false)
			end
		end))
	end
	table.insert(t_8, guiService.MenuOpened:Connect(function() --[[ line: 2109 ]]
		-- upvalues: t (copy), isInExperienceUIVREnabled (copy), inExperienceUIVRIXP (copy), VRService (copy)
		if t.IsOpen then
			if if isInExperienceUIVREnabled and not inExperienceUIVRIXP:isMovePanelToCenter() then not VRService.VREnabled else true then
				t.OpenClose()
			end
		end
	end))
	table.insert(t_8, inExperienceAppChatModalModule.default.visibilitySignal.Event:Connect(function(p65) --[[ line: 2125 ]]
		-- upvalues: t (copy)
		if p65 and t.IsOpen then
			t.OpenClose()
		end
	end))
	table.insert(t_8, userGameSettingsService:GetPropertyChangedSignal("PreferredTransparency"):connect(function() --[[ line: 2132 | named "OnPreferredTransparencyChanged" ]]
		-- upvalues: userGameSettingsService (copy), var13 (copy), var40 (copy), var17 (copy), t_2 (copy), var22 (copy), var173 (ref)
		local preferredTransparency = userGameSettingsService.PreferredTransparency
		var13 = 0.5 * userGameSettingsService.PreferredTransparency
		
		if var40 then
			var40.BackgroundTransparency = var13
		end
		var17 = 0.5 * preferredTransparency
		
		for i, v in ipairs(t_2) do
			v.Frame.BackgroundTransparency = var17
		end
		var22 = 0.15 * userGameSettingsService.PreferredTransparency
		var173.BackgroundTransparency = var22
	end))
end

function t.destroyGui() --[[ line: 2154 ]]
	-- upvalues: t_8 (ref), t_7 (write), contextActionService (ref), t_2 (ref), t_3 (ref), t_4 (ref), t_5 (ref), t_6 (ref), var36 (write), var37 (write), var38 (write), var39 (write), var40 (write), var41 (write), var42 (write), var43 (write), var44 (write), var45 (write), var46 (write), var47 (write), var48 (write), var49 (write), var51 (write), var55 (write), var56 (write), var57 (write), var58 (write), var59 (write), var60 (write), var64 (write), var34 (write), var65 (write), var68 (write), t (ref)
	for i, v in pairs(t_8) do
		v:disconnect()
	end
	table.clear(t_8)
	
	for i_1, v_1 in pairs(t_7) do
		v_1:disconnect()
	end
	table.clear(t_7)
	contextActionService:UnbindAction("RBXHotbarEquip")
	contextActionService:UnbindAction("RBXRemoveSlot")
	unbindAllGamepadEquipActions()
	
	for i_2 = #t_2, 1, -1 do
		local var197 = t_2[i_2]
		
		if var197.Tool then
			var197:Clear()
		end
	end
	table.clear(t_2)
	table.clear(t_3)
	table.clear(t_4)
	table.clear(t_5)
	table.clear(t_6)
	
	if var36 then
		var36:Destroy()
		var36 = nil
	end
	var37 = nil
	var38 = nil
	var39 = nil
	var40 = nil
	var41 = nil
	var42 = nil
	var43 = nil
	var44 = nil
	var45 = nil
	var46 = nil
	var47 = nil
	var48 = nil
	var49 = nil
	var51 = nil
	var55 = 0
	var56 = nil
	var57 = false
	var58 = false
	var59 = false
	var60 = false
	var64 = false
	var34 = false
	var65 = 0
	var68 = nil
	t.OpenClose = nil
	t.IsOpen = false
	t.IsHotbarVisible = false
end

function t.TopbarEnabledChanged(_, p66) --[[ line: 2216 ]]
	-- upvalues: var33 (write), setBackpackEnabled (ref), starterGuiService (ref)
	var33 = p66
	setBackpackEnabled(starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack))
end

if fFlagTopBarSignalizeSetCores then
	t.disposeEffect = signalsModule.createEffect(function(p67) --[[ line: 2222 ]]
		-- upvalues: inExperienceTopBarModule (ref), t (ref)
		local getTopBarStore = inExperienceTopBarModule.Stores.GetTopBarStore
		
		if getTopBarStore then
			t:TopbarEnabledChanged(getTopBarStore(p67).getTopBarCoreGuiEnabled(p67))
		end
	end)
end
local features = systemModule.Features
local lifecycle = features.registerLifecycle(features.FeatureName.Backpack, {
	defaultVisible = false,
	coreGuiType = Enum.CoreGuiType.Backpack
}).lifecycle
lifecycle:onEnabledChanged(function(p68) --[[ line: 2237 ]]
	-- upvalues: t (ref), setBackpackEnabled (ref)
	if p68 then
		t.createGui()
	else
		t.destroyGui()
	end
	setBackpackEnabled(p68)
end)
lifecycle:onVisibilityChanged(function(p69) --[[ line: 2247 ]]
	-- upvalues: t (ref)
	if t.OpenClose and t.IsOpen ~= p69 then
		t.OpenClose()
	end
	return t.IsOpen
end)
t.StateChanged.Event:connect(function(p70) --[[ line: 2255 ]]
	-- upvalues: lifecycle (ref)
	if lifecycle then
		lifecycle.setVisible(p70)
	end
end)

return t