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
local var11 = 60
local size14 = Enum.FontSize.Size14
local var12 = 0.5 * userGameSettingsService.PreferredTransparency
local color3 = Color3.new(0.121568627451, 0.121568627451, 0.121568627451)
local color3_1 = Color3.new(0.192156862745, 0.192156862745, 0.192156862745)
local color3_2 = Color3.new(0.352941176471, 0.556862745098, 0.913725490196)
local var16 = 0.5 * userGameSettingsService.PreferredTransparency
local color3_3 = Color3.new(1, 1, 1)
local _ = UDim2.new(0, 14, 0, 9)
local value = Enum.KeyCode.Backquote.Value
local color3_4 = Color3.new(0, 0.635294117647, 1)
local var19 = "   Search"
local color3_5 = Color3.new(0.37, 0.37, 0.37)
local var21 = 0.15 * userGameSettingsService.PreferredTransparency
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
local var30 = require(modules.TenFootInterface):IsEnabled()
local create = require(parent.AppCommonLib).Create
local gameTranslatorModule = require(modules.GameTranslator)
pcall(function()
	-- upvalues: var19 (write), robloxTranslatorModule (ref)
	var19 = robloxTranslatorModule:FormatByKey("InGame.UnknownNamespace.BACKPACK_SEARCH")
end)
local var32 = true

if var30 then
	var11 = 100
	size14 = Enum.FontSize.Size24
end
local var33 = false
local _ = nil
local var34 = if fFlagBackpackResponsiveUnits then responsiveModule.GetInputModeStore().getPreferredInputType() == responsiveModule.Input.Touch and guiService:GetScreenResolution().X < 1024 else userInputService.TouchEnabled and guiService:GetScreenResolution().X < 1024
local localPlayer = playersService.LocalPlayer
local var35 = nil
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
local t_2 = {}
local var50 = nil
local t_3 = {}
local t_4 = {}
local t_5 = {}
local var54 = 0
local var55 = nil
local var56 = false
local var57 = false
local var58 = false
local var59 = false
local t_6 = {}
local t_7 = {}
local t_8 = {}
local var63 = false
local var64 = 0
local var65 = if var34 then 3 else 10
local var66 = if var34 then 2 else 4
local var67 = nil
local var68 = nil
t.BackpackEmpty = create("BindableEvent")({ Name = "BackpackEmpty" })
t.BackpackItemAdded = create("BindableEvent")({ Name = "BackpackAdded" })
t.BackpackItemRemoved = create("BindableEvent")({ Name = "BackpackRemoved" })

local function NewGui(p0, p1)
	-- upvalues: size14 (write)
	local var87 = Instance.new(p0)
	var87.Name = p1
	var87.BackgroundColor3 = Color3.new(0, 0, 0)
	var87.BackgroundTransparency = 1
	var87.BorderColor3 = Color3.new(0, 0, 0)
	var87.BorderSizePixel = 0
	var87.Size = UDim2.new(1, 0, 1, 0)
	
	if p0:match("Text") then
		var87.TextColor3 = Color3.new(1, 1, 1)
		var87.Text = ""
		var87.Font = Enum.Font.SourceSans
		var87.FontSize = size14
		var87.TextWrapped = true
		
		if p0 == "TextButton" then
			var87.Font = Enum.Font.SourceSansBold
			var87.BorderSizePixel = 1
		end
	end
	return var87
end

local function _()
	-- upvalues: var65 (write), t_2 (ref)
	for i = 1, var65 do
		local var88 = t_2[i]
		
		if var88.Tool then
			continue
		end
		return var88
	end
	return nil
end

function t.isInventoryEmpty()
	-- upvalues: var65 (write), t_2 (ref)
	for i = var65 + 1, #t_2 do
		local var89 = t_2[i]
		
		if not var89 or not var89.Tool then
			continue
		end
		return false
	end
	return true
end

local _ = function()
	return false
end

local function AdjustHotbarFrames(p2)
	-- upvalues: var39 (write), var65 (write), var54 (write), enableHotbarHide (ref), t_2 (ref), var37 (write), t (ref)
	if not var39 then return end
	local visible = var39.Visible
	local var90 = if visible then var65 else var54
	local var91 = 0
	local var92 = if enableHotbarHide then var90 >= 1 and not p2 else var90 >= 1
	
	for i = 1, var65 do
		local var93 = t_2[i]
		
		if (if enableHotbarHide then var93.Tool and not p2 else var93.Tool) or visible then
			var91 += 1
			var93:Readjust(var91, var90)
			var93.Frame.Visible = true
		else
			var93.Frame.Visible = false
		end
	end
	if var37 then
		local var94 = not visible
		
		if var94 then
			var94 = var92
			
			if not var94 then
				local var96
				for i_1 = var65 + 1, #t_2 do
					local var95 = t_2[i_1]
					
					if not var95 or not var95.Tool then
						continue
					end
					var96 = false
					var94 = not var96
				end
				var96 = true
			end
		end
		var37.Visible = var94
		var37.Position = UDim2.new(0.5, -15, 1, if var92 then -110 else -50)
	end
	t.IsHotbarVisible = var92
end

local function UpdateScrollingFrameCanvasSize()
	-- upvalues: var41 (write), var42 (write), var11 (write)
	if var41 and var42 then
		var41.CanvasSize = UDim2.new(0, 0, 0, math.ceil((#var42:GetChildren() - 1) / math.floor(var41.AbsoluteSize.X / (var11 + 5))) * (var11 + 5) + 5)
		
		return
	end
end

local function AdjustInventoryFrames()
	-- upvalues: var65 (write), t_2 (ref), UpdateScrollingFrameCanvasSize (ref)
	for i = var65 + 1, #t_2 do
		local var97 = t_2[i]
		var97.Frame.LayoutOrder = var97.Index
		var97.Frame.Visible = var97.Tool ~= nil
	end
	UpdateScrollingFrameCanvasSize()
end

local function UpdateBackpackLayout()
	-- upvalues: var36 (write), var39 (write), var65 (write), var11 (write), var66 (ref), var41 (write), AdjustHotbarFrames (ref), AdjustInventoryFrames (ref)
	if not var36 or not var39 then return end
	var36.Size = UDim2.new(0, 5 + var65 * (var11 + 5), 0, var11 + 5 + 5)
	var36.Position = UDim2.new(0.5, -var36.Size.X.Offset / 2, 1, -var36.Size.Y.Offset)
	var39.Size = UDim2.new(0, var36.Size.X.Offset, 0, var36.Size.Y.Offset * var66 + 40)
	var39.Position = UDim2.new(0.5, -var39.Size.X.Offset / 2, 1, var36.Position.Y.Offset - var39.Size.Y.Offset)
	
	if var41 then
		var41.Size = UDim2.new(1, var41.ScrollBarThickness + 1, 1, -40)
		var41.Position = UDim2.new(0, 0, 0, 40)
	end
	AdjustHotbarFrames()
	AdjustInventoryFrames()
end

local _ = function(value, minValue, maxValue)
	return math.min(minValue, math.max(value, maxValue))
end

local _ = function(p3, p4, p5)
	local absolutePosition = p3.AbsolutePosition
	local absoluteSize = p3.AbsoluteSize
	
	return absolutePosition.X < p4 and (p4 <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y < p5 and p5 <= absolutePosition.Y + absoluteSize.Y))
end

local _ = function(value, p6)
	return (value.AbsolutePosition + value.AbsoluteSize / 2 - p6).magnitude
end

local _ = function()
	-- upvalues: var55 (write), t_3 (ref)
	var55:ToggleSelect()
	t_3[var55]:UpdateEquipView()
	var55 = nil
end

local _ = function()
	-- upvalues: var47 (write), var55 (write), t_3 (ref)
	if var47 then
		var47:UnequipTools()
		
		if var55 then
			var55:ToggleSelect()
			t_3[var55]:UpdateEquipView()
			var55 = nil
		end
	end
end

local _ = function(p7)
	-- upvalues: var47 (write), var55 (write), t_3 (ref), var46 (write)
	if var47 then
		var47:UnequipTools()
		
		if var55 then
			var55:ToggleSelect()
			t_3[var55]:UpdateEquipView()
			var55 = nil
		end
	end
	if p7:IsA("HopperBin") then
		p7:ToggleSelect()
		t_3[p7]:UpdateEquipView()
		var55 = p7
		
		return
	end
	p7.Parent = var46
end

local _ = function(p8)
	-- upvalues: var46 (write)
	return p8 and (if p8:IsA("HopperBin") then p8.Active else p8.Parent == var46)
end

local function MakeSlot(p9, p10)
	-- upvalues: t_2 (ref), var16 (write), color3_1 (ref), color3 (ref), var36 (write), var11 (write), gameTranslatorModule (ref), var65 (write), var39 (write), var54 (write), var57 (write), var33 (write), contextActionService (ref), var68 (write), t_3 (ref), var50 (write), var46 (write), var67 (write), NewGui (ref), color3_2 (ref), t_5 (ref), UpdateScrollingFrameCanvasSize (ref), var47 (write), var55 (write), var48 (write), color3_3 (ref), MakeSlot (ref), var42 (write), var59 (write), t_4 (ref), value_1 (ref), var41 (write)
	p10 = p10 or #t_2 + 1
	p10 = { Tool = nil, Index = p10, Frame = nil }
	local var99 = nil
	local var100 = nil
	local var101 = nil
	local var102 = nil
	local var103 = nil
	local var104 = nil
	local _ = nil
	local var105 = nil
	local var106 = nil
	
	local function _()
		-- upvalues: var99 (write), var16 (copy), color3_1 (copy), color3 (copy)
		var99.SelectionImageObject = nil
		var99.BackgroundTransparency = if var99.Draggable then 0 else var16
		var99.BackgroundColor3 = if var99.Draggable then color3_1 else color3
	end
	
	function p10.Readjust(_, p11, p12)
		-- upvalues: var36 (copy), var11 (copy), var99 (write)
		var99.Position = UDim2.new(0, var36.Size.X.Offset / 2 - var11 / 2 + (var11 + 5) * (p11 - (p12 / 2 + 0.5)), 0, 5)
	end
	
	function p10.Fill(p13, p14)
		-- upvalues: var101 (write), var102 (write), gameTranslatorModule (copy), var105 (write), var103 (write), var65 (copy), var39 (copy), var99 (write), var54 (copy), var57 (copy), var33 (copy), contextActionService (copy), var68 (copy), t_3 (copy), var50 (copy), t_2 (copy)
		if not p14 then
			return p13:Clear()
		end
		p13.Tool = p14
		
		local function assignToolData()
			-- upvalues: p14 (ref), var101 (copy), var102 (copy), gameTranslatorModule (copy), var105 (copy)
			local textureId = p14.TextureId
			var101.Image = textureId
			
			if textureId == "" then
				var102.Visible = true
			else
				var102.Visible = false
			end
			gameTranslatorModule:TranslateAndRegister(var102, p14, p14.Name)
			
			if var105 and p14:IsA("Tool") then
				gameTranslatorModule:TranslateAndRegister(var105, p14, p14.ToolTip)
				local var116 = var105.TextBounds.X + 6
				var105.Size = UDim2.new(0, var116, 0, 16)
				var105.Position = UDim2.new(0.5, -var116 / 2, 0, -25)
			end
		end
		
		assignToolData()
		
		if var103 then
			var103:disconnect()
			var103 = nil
		end
		var103 = p14.Changed:connect(function(p15)
			-- upvalues: assignToolData (ref)
			if p15 == "TextureId" or p15 == "Name" or p15 == "ToolTip" then
				assignToolData()
			end
		end)
		local var113 = p13.Index <= var65
		
		if not var113 or var39.Visible then
			var99.Draggable = true
		end
		p13:UpdateEquipView()
		
		if var113 then
			var54 += 1
			
			if var57 and var54 >= 1 and not var33 then
				var33 = true
				contextActionService:BindAction("RBXHotbarEquip", var68, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
			end
		end
		local var114, var115
		t_3[p14] = p13
		
		for i = 1, var65 do
			var114 = t_2[i]
			
			if var114.Tool then
				continue
			end
			var115 = var114
			var50 = var115
			
			return
		end
		var115 = nil
	end
	
	function p10.Clear(p16)
		-- upvalues: var103 (write), var101 (write), var102 (write), var105 (write), var99 (write), var65 (copy), var54 (copy), var33 (copy), contextActionService (copy), t_3 (copy), var50 (copy), t_2 (copy)
		if not p16.Tool then return end
		if var103 then
			var103:disconnect()
			var103 = nil
		end
		var101.Image = ""
		var102.Text = ""
		
		if var105 then
			var105.Text = ""
			var105.Visible = false
		end
		var99.Draggable = false
		p16:UpdateEquipView(true)
		
		if p16.Index <= var65 then
			var54 -= 1
			
			if var54 < 1 then
				var33 = false
				contextActionService:UnbindAction("RBXHotbarEquip")
			end
		end
		local var117, var118
		t_3[p16.Tool] = nil
		p16.Tool = nil
		
		for i = 1, var65 do
			var117 = t_2[i]
			
			if var117.Tool then
				continue
			end
			var118 = var117
			var50 = var118
			
			return
		end
		var118 = nil
	end
	
	function p10.UpdateEquipView(p17, p18)
		-- upvalues: var46 (copy), var67 (copy), p10 (ref), var104 (write), NewGui (copy), var99 (write), color3_2 (copy), var16 (copy), color3_1 (copy), color3 (copy)
		if not p18 then
			local tool = p17.Tool
			
			if tool and (if tool:IsA("HopperBin") then tool.Active else tool.Parent == var46) then
				var67 = p10
				
				if not var104 then
					var104 = NewGui("Frame", "Equipped")
					var104.ZIndex = var99.ZIndex
					
					for i, v in pairs({
						{ 0.1, 1, 0, 0 },
						{ 0.8, 0.1, 0.1, 0 },
						{ 0.1, 1, 0.9, 0 },
						{ 0.8, 0.1, 0.1, 0.9 }
					}) do
						local var119 = NewGui("Frame", "Edge")
						var119.BackgroundTransparency = 0
						var119.BackgroundColor3 = color3_2
						var119.Size = UDim2.new(v[1], 0, v[2], 0)
						var119.Position = UDim2.new(v[3], 0, v[4], 0)
						var119.ZIndex = var104.ZIndex
						var119.Parent = var104
					end
				end
				var104.Parent = var99
			elseif var104 then
				var104.Parent = nil
			end
			var99.SelectionImageObject = nil
			var99.BackgroundTransparency = if var99.Draggable then 0 else var16
			var99.BackgroundColor3 = if var99.Draggable then color3_1 else color3
		end
	end
	
	function p10.IsEquipped(p19)
		-- upvalues: var46 (copy)
		local tool = p19.Tool
		
		return tool and (if tool:IsA("HopperBin") then tool.Active else tool.Parent == var46)
	end
	
	function p10.Delete(p20)
		-- upvalues: t_5 (copy), var99 (write), t_2 (copy), UpdateScrollingFrameCanvasSize (copy)
		t_5[var99] = nil
		var99:Destroy()
		table.remove(t_2, p20.Index)
		
		for i = p20.Index, #t_2 do
			t_2[i]:SlideBack()
		end
		UpdateScrollingFrameCanvasSize()
	end
	
	function p10.Swap(p21, p22)
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
	
	function p10.SlideBack(p23)
		-- upvalues: var99 (write)
		p23.Index -= 1
		var99.Name = p23.Index
		var99.LayoutOrder = p23.Index
	end
	
	function p10.TurnNumber(_, p24)
		-- upvalues: var106 (write)
		if var106 then
			var106.Visible = p24
		end
	end
	
	function p10.SetClickability(value, p25)
		-- upvalues: var99 (write), var16 (copy), color3_1 (copy), color3 (copy)
		if value.Tool then
			var99.Draggable = not p25
			var99.SelectionImageObject = nil
			var99.BackgroundTransparency = if var99.Draggable then 0 else var16
			var99.BackgroundColor3 = if var99.Draggable then color3_1 else color3
		end
	end
	
	function p10.CheckTerms(p26, p27)
		-- upvalues: var102 (write), var105 (write)
		local var120 = 0
		
		local function _(p28, p29)
			-- upvalues: var120 (write)
			local _, var124 = p28:lower():gsub(p29, "")
			var120 += var124
		end
		
		local tool = p26.Tool
		
		if tool then
			for i in pairs(p27) do
				local var121, var122 = var102.Text:lower():gsub(i, "")
				var120 += var122
				
				if tool:IsA("Tool") then
					var121, var123 = (if var105 then var105.Text else ""):lower():gsub(i, "")
					var120 += var123
				end
			end
		end
		return var120
	end
	
	function p10.Select(_, p30)
		-- upvalues: p10 (ref), var46 (copy), var47 (copy), var55 (copy), t_3 (copy), var48 (copy)
		if p30 then return end
		local tool = p10.Tool
		
		if tool then
			if tool and (if tool:IsA("HopperBin") then tool.Active else tool.Parent == var46) then
				if var47 then
					var47:UnequipTools()
					
					if var55 then
						var55:ToggleSelect()
						t_3[var55]:UpdateEquipView()
						var55 = nil
						
						return
					end
				end
			elseif tool.Parent == var48 then
				if var47 then
					var47:UnequipTools()
					
					if var55 then
						var55:ToggleSelect()
						t_3[var55]:UpdateEquipView()
						var55 = nil
					end
				end
				if tool:IsA("HopperBin") then
					tool:ToggleSelect()
					t_3[tool]:UpdateEquipView()
					var55 = tool
					
					return
				end
				tool.Parent = var46
			end
		end
	end
	
	var99 = NewGui("TextButton", p10)
	var99.BackgroundColor3 = color3
	var99.BorderColor3 = color3_3
	var99.Text = ""
	var99.AutoButtonColor = false
	var99.BorderSizePixel = 0
	var99.Size = UDim2.new(0, var11, 0, var11)
	var99.Active = true
	var99.Draggable = false
	var99.BackgroundTransparency = var16
	var99.MouseButton1Click:connect(function()
		-- upvalues: p10 (ref)
		changeSlot(p10)
	end)
	p10.Frame = var99
	local var107 = NewGui("Frame", "SelectionObjectClipper")
	var107.Visible = false
	var107.Parent = var99
	local var108 = NewGui("ImageLabel", "Selector")
	var108.Size = UDim2.new(1, 0, 1, 0)
	var108.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png"
	var108.ScaleType = Enum.ScaleType.Slice
	var108.SliceCenter = Rect.new(12, 12, 52, 52)
	var108.Parent = var107
	var101 = NewGui("ImageLabel", "Icon")
	var101.Size = UDim2.new(0.8, 0, 0.8, 0)
	var101.Position = UDim2.new(0.1, 0, 0.1, 0)
	var101.Parent = var99
	var102 = NewGui("TextLabel", "ToolName")
	var102.Size = UDim2.new(1, -2, 1, -2)
	var102.Position = UDim2.new(0, 1, 0, 1)
	var102.Parent = var99
	p10.Frame.LayoutOrder = p10.Index
	
	if p10 <= var65 then
		var105 = NewGui("TextLabel", "ToolTip")
		var105.TextWrapped = false
		var105.TextYAlignment = Enum.TextYAlignment.Top
		var105.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
		var105.BackgroundTransparency = 0
		var105.Visible = false
		var105.Parent = var99
		var99.MouseEnter:connect(function()
			-- upvalues: var105 (write)
			if var105.Text ~= "" then
				var105.Visible = true
			end
		end)
		var99.MouseLeave:connect(function()
			-- upvalues: var105 (write)
			var105.Visible = false
		end)
		
		function p10.MoveToInventory(p31)
			-- upvalues: p10 (ref), var65 (copy), MakeSlot (copy), var42 (copy), var46 (copy), var47 (copy), var55 (copy), t_3 (copy), var59 (copy), var39 (copy)
			if p10.Index <= var65 then
				local tool = p10.Tool
				p31:Clear()
				local var125 = MakeSlot(var42)
				var125:Fill(tool)
				
				if tool and (if tool:IsA("HopperBin") then tool.Active else tool.Parent == var46) and var47 then
					var47:UnequipTools()
					
					if var55 then
						var55:ToggleSelect()
						t_3[var55]:UpdateEquipView()
						var55 = nil
					end
				end
				if var59 then
					var125.Frame.Visible = false
					var125.Parent = var39
				end
			end
		end
		
		if p10 < 10 or p10 == var65 then
			local var109 = if p10 < 10 then p10 else 0
			var106 = NewGui("TextLabel", "Number")
			var106.Text = var109
			var106.Size = UDim2.new(0.15, 0, 0.15, 0)
			var106.Visible = false
			var106.Parent = var99
			
			t_4[value_1 + var109] = function(p32)
				-- upvalues: p10 (ref)
				p10:Select(p32)
			end
		end
	end
	local position = var99.Position
	local var110 = 0
	local var111 = nil
	var99.DragBegin:connect(function(p33)
		-- upvalues: t_5 (copy), var99 (write), position (write), var101 (write), var102 (write), var106 (write), var104 (write), var111 (write), var42 (copy), var39 (copy), var100 (write), NewGui (copy)
		t_5[var99] = true
		position = p33
		var99.BorderSizePixel = 2
		var99.ZIndex = 2
		var101.ZIndex = 2
		var102.ZIndex = 2
		var99.Parent.ZIndex = 2
		
		if var106 then
			var106.ZIndex = 2
		end
		if var104 then
			var104.ZIndex = 2
			
			for i, v in pairs(var104:GetChildren()) do
				v.ZIndex = 2
			end
		end
		var111 = var99.Parent
		
		if var111 == var42 then
			local _ = var99.AbsolutePosition
			local uDim2 = UDim2.new(0, var99.AbsolutePosition.X - var39.AbsolutePosition.X, 0, var99.AbsolutePosition.Y - var39.AbsolutePosition.Y)
			var99.Parent = var39
			var99.Position = uDim2
			var100 = NewGui("Frame", "FakeSlot")
			var100.LayoutOrder = var99.LayoutOrder
			var100.Size = var99.Size
			var100.BackgroundTransparency = 1
			var100.Parent = var42
		end
	end)
	var99.DragStopped:connect(function(p34, p35)
		-- upvalues: var100 (write), var99 (write), position (write), var111 (write), var101 (write), var102 (write), var106 (write), var104 (write), t_5 (copy), p10 (ref), var39 (copy), var65 (copy), var110 (write), var50 (copy), var36 (copy), t_2 (copy), var46 (copy), var47 (copy), var55 (copy), t_3 (copy), var59 (copy)
		if var100 then
			var100:Destroy()
		end
		local currentTime = tick()
		var99.Position = position
		var99.Parent = var111
		var99.BorderSizePixel = 0
		var99.ZIndex = 1
		var101.ZIndex = 1
		var102.ZIndex = 1
		var111.ZIndex = 1
		
		if var106 then
			var106.ZIndex = 1
		end
		if var104 then
			var104.ZIndex = 1
			
			for i, v in pairs(var104:GetChildren()) do
				v.ZIndex = 1
			end
		end
		t_5[var99] = nil
		
		if not p10.Tool then return end
		local absolutePosition = var39.AbsolutePosition
		local absoluteSize = var39.AbsoluteSize
		
		if absolutePosition.X < p34 and (p34 <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y < p35 and p35 <= absolutePosition.Y + absoluteSize.Y)) then
			if p10.Index <= var65 then
				p10:MoveToInventory()
			end
			if var65 < p10.Index and currentTime - var110 < 0.5 then
				if var50 then
					local tool = p10.Tool
					p10:Clear()
					var50:Fill(tool)
					p10:Delete()
				end
				currentTime = 0
			end
		else
			absolutePosition = var36.AbsolutePosition
			absoluteSize = var36.AbsoluteSize
			
			if absolutePosition.X < p34 and (p34 <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y < p35 and p35 <= absolutePosition.Y + absoluteSize.Y)) then
				local list = { 1e999, nil }
				
				for absoluteSize = 1, var65 do
					local var129 = t_2[absoluteSize]
					local frame = var129.Frame
					local magnitude = (frame.AbsolutePosition + frame.AbsoluteSize / 2 - Vector2.new(p34, p35)).magnitude
					
					if magnitude < list[1] then
						list = { magnitude, var129 }
					end
				end
				local var130 = list[2]
				
				if var130 ~= p10 then
					p10:Swap(var130)
					
					if var65 < p10.Index then
						absolutePosition = p10.Tool
						
						if absolutePosition then
							if absolutePosition and (if absolutePosition:IsA("HopperBin") then absolutePosition.Active else absolutePosition.Parent == var46) and var47 then
								var47:UnequipTools()
								
								if var55 then
									var55:ToggleSelect()
									t_3[var55]:UpdateEquipView()
									var55 = nil
								end
							end
							if var59 then
								p10.Frame.Visible = false
								p10.Frame.Parent = var39
							end
						else
							p10:Delete()
						end
					end
				end
			elseif p10.Index <= var65 then
				p10:MoveToInventory()
			end
		end
		var110 = currentTime
	end)
	var99.Parent = p9
	t_2[p10] = p10
	
	if var65 < p10 then
		UpdateScrollingFrameCanvasSize()
		
		if var41 and var39.Visible and not var59 then
			var41.CanvasPosition = Vector2.new(0, math.max(0, var41.CanvasSize.Y.Offset - var41.AbsoluteSize.Y))
		end
	end
	return p10
end

local _ = function(value)
	-- upvalues: var65 (write), t_2 (ref), MakeSlot (ref), var36 (write), var50 (write), var54 (write), UpdateBackpackLayout (ref)
	if var65 ~= value then
		local var131 = var65
		
		if value < var131 then
			for i = var131, value + 1, -1 do
				local var132 = t_2[i]
				
				if var132 then
					var132:MoveToInventory()
					var132:Delete()
				end
			end
			for i_1 = var131, value + 1, -1 do
				local var133 = t_2[i_1]
				
				if not var133.Tool then
					var133:Delete()
				end
			end
		else
			for i_2 = var131, value do
				var65 = i_2
				
				if not t_2[i_2] then
					local var135 = MakeSlot(var36, i_2)
					var135.Frame.Visible = false
					
					if not var50 then
						var50 = var135
					end
				end
				local _ = t_2[i_2]
				local tool = t_2[i_2].Tool
				local var134 = MakeSlot(var36, i_2)
				
				if tool then
					var134:Fill(tool)
				elseif not var50 then
					var50 = var134
				end
			end
		end
		var65 = value
		var54 = 0
		
		for i_2 = 1, var65 do
			if t_2[i_2] and t_2[i_2].Tool then
				var54 += 1
			end
		end
		UpdateBackpackLayout()
	end
end

local function OnChildAdded(p36)
	-- upvalues: var35 (write), var46 (write), var47 (write), var64 (write), var55 (write), t_3 (ref), var56 (write), localPlayer (write), var50 (write), MakeSlot (ref), var42 (write), t_2 (ref), var48 (write), AdjustHotbarFrames (ref), var65 (write), var39 (write), t (ref)
	if not var35 then return end
	if p36:IsA("Tool") or p36:IsA("HopperBin") then
		if p36.Parent == var46 then
			var64 = tick()
		end
		if var55 and p36.Parent == var46 then
			var55:ToggleSelect()
			t_3[var55]:UpdateEquipView()
			var55 = nil
		end
		if not var56 and p36.Parent == var46 and not t_3[p36] then
			local starterGear = localPlayer:FindFirstChild("StarterGear")
			
			if starterGear and starterGear:FindFirstChild(p36.Name) then
				var56 = true
				
				for i = (var50 or MakeSlot(var42)).Index, 1, -1 do
					local var137 = t_2[i]
					local var138 = i - 1
					
					if var138 > 0 then
						t_2[var138]:Swap(var137)
					else
						var137:Fill(p36)
					end
				end
				for i_1, v in pairs(var46:GetChildren()) do
					if v:IsA("Tool") and v ~= p36 then
						v.Parent = var48
					end
				end
				AdjustHotbarFrames()
				
				return
			else
				local var139 = t_3[p36]
				
				if var139 then
					var139:UpdateEquipView()
				else
					var139 = var50 or MakeSlot(var42)
					var139:Fill(p36)
					
					if var139.Index <= var65 and not var39.Visible then
						AdjustHotbarFrames()
					end
					if p36:IsA("HopperBin") and p36.Active then
						if var47 then
							var47:UnequipTools()
							
							if var55 then
								var55:ToggleSelect()
								t_3[var55]:UpdateEquipView()
								var55 = nil
							end
						end
						var55 = p36
					end
				end
				t.BackpackItemAdded:Fire()
				
				return
			end
		end
	elseif p36:IsA("Humanoid") and p36.Parent == var46 then
		var47 = p36
	end
end

local function OnChildRemoved(p37)
	-- upvalues: var35 (write), var64 (write), var46 (write), var48 (write), t_3 (ref), var65 (write), var39 (write), AdjustHotbarFrames (ref), var55 (write), t (ref), t_2 (ref)
	if not var35 then return end
	if not p37:IsA("Tool") and not p37:IsA("HopperBin") then return end
	var64 = tick()
	local parent = p37.Parent
	
	if parent == var46 or parent == var48 then return end
	local var140 = t_3[p37]
	
	if var140 then
		var140:Clear()
		
		if var65 < var140.Index then
			var140:Delete()
		elseif not var39.Visible then
			AdjustHotbarFrames()
		end
	end
	if p37 == var55 then
		var55 = nil
	end
	local var142
	t.BackpackItemRemoved:Fire()
	
	for i = var65 + 1, #t_2 do
		local var141 = t_2[i]
		
		if not var141 or not var141.Tool then
			continue
		end
		var142 = false
		if var142 then
			t.BackpackEmpty:Fire()
		end
		return
	end
	var142 = true
end

local function OnCharacterAdded(p38)
	-- upvalues: t_2 (ref), var65 (write), var55 (write), t_7 (write), var46 (write), OnChildRemoved (ref), OnChildAdded (ref), var48 (write), localPlayer (write), AdjustHotbarFrames (ref)
	for i = #t_2, 1, -1 do
		local var143 = t_2[i]
		
		if var143.Tool then
			var143:Clear()
		end
		if var65 < i then
			var143:Delete()
		end
	end
	var55 = nil
	
	for i_1, v in pairs(t_7) do
		v:disconnect()
	end
	t_7 = {}
	var46 = p38
	table.insert(t_7, p38.ChildRemoved:connect(OnChildRemoved))
	table.insert(t_7, p38.ChildAdded:connect(OnChildAdded))
	
	for i_2, v_1 in pairs(p38:GetChildren()) do
		OnChildAdded(v_1)
	end
	var48 = localPlayer:WaitForChild("Backpack")
	table.insert(t_7, var48.ChildRemoved:connect(OnChildRemoved))
	table.insert(t_7, var48.ChildAdded:connect(OnChildAdded))
	
	for i_3, v_2 in pairs(var48:GetChildren()) do
		OnChildAdded(v_2)
	end
	AdjustHotbarFrames()
end

local function OnInputBegan(p39, p40)
	-- upvalues: var58 (write), var57 (write), value_2 (ref), t_4 (ref), var39 (write), t (ref)
	if p39.UserInputType == Enum.UserInputType.Keyboard and not var58 and (var57 or p39.KeyCode.Value == value_2) then
		local value = t_4[p39.KeyCode.Value]
		
		if value then
			value(p40)
		end
	end
	local userInputType = p39.UserInputType
	
	if not p40 and (userInputType == Enum.UserInputType.MouseButton1 or userInputType == Enum.UserInputType.Touch) and (var39 and var39.Visible) then
		t.OpenClose()
	end
end

local function OnUISChanged(p41)
	-- upvalues: userInputService (ref), VRService (ref), var65 (write), t_2 (ref)
	if p41 == "KeyboardEnabled" or p41 == "VREnabled" then
		local var144 = userInputService.KeyboardEnabled and not VRService.VREnabled
		
		for i = 1, var65 do
			t_2[i]:TurnNumber(var144)
		end
	end
end

local var80 = nil
local var81 = nil

local var82 = function() end

local vector2 = Vector2.new(0, 0)

function unbindAllGamepadEquipActions()
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindAction("RBXBackpackHasGamepadFocus")
	contextActionService:UnbindAction("RBXCloseInventory")
end

local _ = function(value, p42)
	-- upvalues: var65 (write), t_2 (ref)
	for i = 1, var65 do
		local var145 = t_2[i]
		
		if var145 and var145.Frame and (p42 or var145.Tool) then
			var145.Frame.Visible = value
		end
	end
end

local function getInputDirection(p43)
	-- upvalues: vector2 (write)
	local var146 = if p43.UserInputState == Enum.UserInputState.End then -1 else 1
	
	if p43.KeyCode == Enum.KeyCode.Thumbstick1 then
		local magnitude = p43.Position.magnitude
		vector2 = if magnitude > 0.98 then Vector2.new(p43.Position.x / magnitude, -p43.Position.y / magnitude) else Vector2.new(0, 0)
	else
		vector2 = if p43.KeyCode == Enum.KeyCode.DPadLeft then Vector2.new(vector2.x - var146 * 1, vector2.y) elseif p43.KeyCode == Enum.KeyCode.DPadRight then Vector2.new(vector2.x + var146 * 1, vector2.y) elseif p43.KeyCode == Enum.KeyCode.DPadUp then Vector2.new(vector2.x, vector2.y - var146 * 1) elseif p43.KeyCode == Enum.KeyCode.DPadDown then Vector2.new(vector2.x, vector2.y + var146 * 1) else Vector2.new(0, 0)
	end
	return vector2
end

local _ = function(_, _, p44)
	-- upvalues: getInputDirection (ref), var65 (write), t_2 (ref), var47 (write), var55 (write), t_3 (ref)
	local var147 = getInputDirection(p44)
	
	if var147 == Vector2.new(0, 0) then return end
	local var148 = math.atan2(var147.y, var147.x) - -1.570796326795
	
	if var148 < 0 then
		var148 += 6.28318530718
	end
	local floored = math.floor(var148 / 0.785398163397 + 1 + 0.5)
	
	if var65 < floored then
		floored = 1
	end
	if floored > 0 then
		local var150 = t_2[floored]
		
		if var150 and var150.Tool and not var150:IsEquipped() then
			var150:Select()
			
			return
		end
	elseif var47 then
		var47:UnequipTools()
		
		if var55 then
			var55:ToggleSelect()
			t_3[var55]:UpdateEquipView()
			var55 = nil
		end
	end
end

var68 = function(_, p45, p46)
	-- upvalues: var80 (write), var81 (write), var47 (write), var55 (write), t_3 (ref), var65 (write), t_2 (ref), var67 (write)
	if p45 ~= Enum.UserInputState.Begin then return end
	if not var80 or (var80.KeyCode ~= Enum.KeyCode.ButtonR1 or p46.KeyCode ~= Enum.KeyCode.ButtonL1) and (var80.KeyCode ~= Enum.KeyCode.ButtonL1 or p46.KeyCode ~= Enum.KeyCode.ButtonR1) or tick() - var81 > 0.06 then
		var80 = p46
		var81 = tick()
		delay(0.06, function()
			-- upvalues: var80 (copy), p46 (ref), var65 (copy), t_2 (copy), var47 (copy), var55 (copy), t_3 (copy), var67 (copy)
			if var80 ~= p46 then return end
			local var153
			local var151 = if p46.KeyCode == Enum.KeyCode.ButtonL1 then -1 else 1
			
			for i = 1, var65 do
				local var152 = t_2[i]
				
				if var152 then
					if not var152:IsEquipped() then
						continue
					end
					var153 = var151 + i
					local var154 = false
					
					if var65 < var153 then
						var153 = 1
						var154 = true
					elseif var153 < 1 then
						var153 = var65
						var154 = true
					end
					local var155 = var153
					while not t_2[var153].Tool do
						var153 += var151
						
						if var153 ~= var155 then
							if var65 < var153 then
								var153 = 1
								var154 = true
							elseif var153 < 1 then
								var153 = var65
								var154 = true
							end
						end
						return
					end
					if var154 then
						if var47 then
							var47:UnequipTools()
							
							if var55 then
								var55:ToggleSelect()
								t_3[var55]:UpdateEquipView()
								var55 = nil
							end
						end
						var67 = nil
						
						return
					else
						t_2[var153]:Select()
						
						return
					end
				end
				return
			end
			if var67 and var67.Tool then
				var67:Select()
				
				return
			end
			for var153 = if var151 == -1 then var65 else 1, if var151 == -1 then 1 else var65, var151 do
				if not t_2[var153].Tool then
					continue
				end
				t_2[var153]:Select()
				
				return
			end
		end)
		
		return
	elseif var47 then
		var47:UnequipTools()
		
		if var55 then
			var55:ToggleSelect()
			t_3[var55]:UpdateEquipView()
			var55 = nil
		end
	end
	var80 = p46
	var81 = tick()
end

function getGamepadSwapSlot()
	-- upvalues: t_2 (ref)
	for i = 1, #t_2 do
		if t_2[i].Frame.BorderSizePixel <= 0 then
			continue
		end
		return t_2[i]
	end
end

function changeSlot(p47)
	-- upvalues: gamepadService (ref), guiService (ref), var40 (write), var65 (write)
	if p47.Frame == guiService.SelectedCoreObject and not gamepadService.GamepadCursorEnabled then
		local var156 = getGamepadSwapSlot()
		
		if var156 then
			var156.Frame.BorderSizePixel = 0
			
			if var156 ~= p47 then
				p47:Swap(var156)
				
				if var40 and var40.SelectionImageObject then
					var40.SelectionImageObject.Visible = false
				end
				if var65 < p47.Index and not p47.Tool then
					if guiService.SelectedCoreObject == p47.Frame then
						guiService.SelectedCoreObject = var156.Frame
					end
					p47:Delete()
				end
				if var65 >= var156.Index or var156.Tool then return end
				if guiService.SelectedCoreObject == var156.Frame then
					guiService.SelectedCoreObject = p47.Frame
				end
				var156:Delete()
				
				return
			end
		else
			local size = p47.Frame.Size
			local position = p47.Frame.Position
			p47.Frame:TweenSizeAndPositionInternal(size + UDim2.new(0, 10, 0, 10), position - UDim2.new(0, 5, 0, 5), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, function()
				-- upvalues: p47 (ref), size (ref), position (ref)
				p47.Frame:TweenSizeAndPositionInternal(size, position, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true)
			end)
			p47.Frame.BorderSizePixel = 3
			
			if var40 and var40.SelectionImageObject then
				var40.SelectionImageObject.Visible = true
				
				return
			end
		end
	else
		p47:Select()
		
		if var40 and var40.SelectionImageObject then
			var40.SelectionImageObject.Visible = false
		end
	end
end

function enableGamepadInventoryControl()
	-- upvalues: var39 (write), t (ref), contextActionService (ref), var82 (ref), var36 (write), guiService (ref)
	local var157 = function(_, p48, _)
		-- upvalues: var39 (copy), t (copy)
		if p48 ~= Enum.UserInputState.Begin then return end
		if getGamepadSwapSlot() then
			local var158 = getGamepadSwapSlot()
			
			if var158 then
				var158.Frame.BorderSizePixel = 0
				
				return
			end
		elseif var39 and var39.Visible then
			t.OpenClose()
		end
	end
	
	contextActionService:BindAction("RBXBackpackHasGamepadFocus", var82, false, Enum.UserInputType.Gamepad1)
	contextActionService:BindAction("RBXCloseInventory", var157, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart)
	local _ = false
	
	if var36 then
		guiService.SelectedCoreObject = var36:FindFirstChild("1")
	end
end

function disableGamepadInventoryControl()
	-- upvalues: var65 (write), t_2 (ref), var35 (write), guiService (ref)
	unbindAllGamepadEquipActions()
	
	for i = 1, var65 do
		local var159 = t_2[i]
		
		if var159 and var159.Frame then
			var159.Frame.BorderSizePixel = 0
		end
	end
	if var35 and guiService.SelectedCoreObject and guiService.SelectedCoreObject:IsDescendantOf(var35) then
		guiService.SelectedCoreObject = nil
	end
end

local _ = function()
	-- upvalues: var57 (write), var33 (write), contextActionService (ref), var68 (write)
	if var57 and not var33 then
		var33 = true
		contextActionService:BindAction("RBXHotbarEquip", var68, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
	end
end

local _ = function()
	-- upvalues: var33 (write), contextActionService (ref)
	disableGamepadInventoryControl()
	var33 = false
	contextActionService:UnbindAction("RBXHotbarEquip")
end

function gamepadDisconnected()
	-- upvalues: VRService (ref), var63 (write)
	if not VRService.VREnabled then
		var63 = false
		disableGamepadInventoryControl()
	end
end

function gamepadConnected()
	-- upvalues: VRService (ref), var63 (write), var35 (write), guiService (ref), var54 (write), var57 (write), var33 (write), contextActionService (ref), var68 (write), var39 (write)
	if not VRService.VREnabled then
		var63 = true
		
		if var35 then
			guiService:AddSelectionParent("RBXBackpackSelection", var35)
		end
		if var54 >= 1 and var57 and not var33 then
			var33 = true
			contextActionService:BindAction("RBXHotbarEquip", var68, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
		end
		if var39 and var39.Visible then
			enableGamepadInventoryControl()
		end
	end
end

local function setBackpackEnabled(value)
	-- upvalues: var32 (write), var57 (write), var35 (write), fFlagMountCoreGuiBackpackModule (ref), robloxGui (ref), t_6 (ref), guiService (ref), var54 (write), var33 (write), contextActionService (ref), var68 (write)
	local var32_1 = value and var32
	var57 = var32_1
	
	if var35 then
		if not fFlagMountCoreGuiBackpackModule then
			var35.Visible = var32_1
		elseif var32_1 then
			var35.Parent = robloxGui
		else
			var35.Parent = nil
		end
	end
	for i, v in pairs(t_6) do
		if var32_1 then
			guiService:AddKey(v)
		else
			guiService:RemoveKey(v)
		end
	end
	if var32_1 then
		if var54 >= 1 and var57 and not var33 then
			var33 = true
			contextActionService:BindAction("RBXHotbarEquip", var68, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
			
			return
		end
	else
		disableGamepadInventoryControl()
		var33 = false
		contextActionService:UnbindAction("RBXHotbarEquip")
	end
end

local function MakeVRRoundButton(value, p49)
	-- upvalues: NewGui (ref)
	local var161 = NewGui("ImageButton", value)
	var161.Size = UDim2.new(0, 40, 0, 40)
	var161.Image = "rbxasset://textures/ui/Keyboard/close_button_background.png"
	local var162 = NewGui("ImageLabel", "Icon")
	var162.Size = UDim2.new(0.5, 0, 0.5, 0)
	var162.Position = UDim2.new(0.25, 0, 0.25, 0)
	var162.Image = p49
	var162.Parent = var161
	local var163 = NewGui("ImageLabel", "Selection")
	var163.Size = UDim2.new(0.9, 0, 0.9, 0)
	var163.Position = UDim2.new(0.05, 0, 0.05, 0)
	var163.Image = "rbxasset://textures/ui/Keyboard/close_button_selection.png"
	var161.SelectionImageObject = var163
	
	return var161, var162, var163
end

function t.createGui()
	-- upvalues: var35 (write), NewGui (ref), fFlagMountCoreGuiBackpackModule (ref), starterGuiService (ref), robloxGui (ref), var36 (write), var65 (write), MakeSlot (ref), var50 (write), var37 (write), t (ref), color3_4 (ref), var38 (write), MakeVRRoundButton (ref), var39 (write), var12 (write), color3 (ref), var40 (write), var41 (write), var42 (write), var43 (write), var11 (write), var44 (write), var45 (write), UpdateBackpackLayout (ref), create (ref), var30 (ref), color3_5 (ref), var21 (write), var19 (write), color3_2 (ref), t_2 (ref), var59 (write), UpdateScrollingFrameCanvasSize (ref), t_8 (ref), t_4 (ref), VRService (ref), userInputService (ref), guiService (ref), t_5 (ref), AdjustHotbarFrames (ref), var63 (write), t_1 (ref), contextActionService (ref), value (ref), localPlayer (write), playersService (ref), OnCharacterAdded (ref), t_6 (ref), OnInputBegan (ref), var58 (write), value_2 (ref), var55 (write), var47 (write), t_3 (ref), OnUISChanged (ref), enableHotbarHide (ref), settingsShowSignal (ref), isInExperienceUIVREnabled (ref), inExperienceUIVRIXP (ref), inExperienceAppChatModalModule (ref), userGameSettingsService (ref), var16 (write)
	var35 = NewGui("Frame", "Backpack")
	
	if not fFlagMountCoreGuiBackpackModule then
		var35.Visible = false
		var35.Parent = robloxGui
	elseif starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack) then
		var35.Parent = robloxGui
	end
	var36 = NewGui("Frame", "Hotbar")
	var36.Parent = var35
	
	for i = 1, var65 do
		local var164 = MakeSlot(var36, i)
		var164.Frame.Visible = false
		
		if not var50 then
			var50 = var164
		end
	end
	var37 = NewGui("ImageButton", "OpenInventory")
	var37.Size = UDim2.new(0, 30, 0, 30)
	var37.Image = "rbxasset://textures/ui/Backpack/ScrollUpArrow.png"
	var37.MouseButton1Click:connect(function()
		-- upvalues: t (copy)
		t.OpenClose()
	end)
	var37.SelectionGained:connect(function()
		-- upvalues: var37 (copy), color3_4 (copy)
		var37.ImageColor3 = color3_4
	end)
	var37.SelectionLost:connect(function()
		-- upvalues: var37 (copy)
		var37.ImageColor3 = Color3.new(1, 1, 1)
	end)
	local var165 = NewGui("Frame", "Selection")
	var165.Visible = false
	var37.SelectionImageObject = var165
	var38 = MakeVRRoundButton("CloseInventory", "rbxasset://textures/ui/Keyboard/close_button_icon.png")
	var38.Position = UDim2.new(0, 0, 0, -50)
	var38.MouseButton1Click:connect(function()
		-- upvalues: var39 (copy), t (copy)
		if var39.Visible then
			t.OpenClose()
		end
	end)
	local var166 = NewGui("ImageLabel", "LeftBumper")
	var166.Size = UDim2.new(0, 40, 0, 40)
	var166.Position = UDim2.new(0, -var166.Size.X.Offset, 0.5, -var166.Size.Y.Offset / 2)
	local var167 = NewGui("ImageLabel", "RightBumper")
	var167.Size = UDim2.new(0, 40, 0, 40)
	var167.Position = UDim2.new(1, 0, 0.5, -var167.Size.Y.Offset / 2)
	var39 = NewGui("Frame", "Inventory")
	var39.BackgroundTransparency = var12
	var39.BackgroundColor3 = color3
	var39.Active = true
	var39.Visible = false
	var39.Parent = var35
	var40 = NewGui("TextButton", "VRInventorySelector")
	var40.Position = UDim2.new(0, 0, 0, 0)
	var40.Size = UDim2.new(1, 0, 1, 0)
	var40.BackgroundTransparency = 1
	var40.Text = ""
	var40.Parent = var39
	local var168 = NewGui("ImageLabel", "Selector")
	var168.Size = UDim2.new(1, 0, 1, 0)
	var168.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png"
	var168.ScaleType = Enum.ScaleType.Slice
	var168.SliceCenter = Rect.new(12, 12, 52, 52)
	var168.Visible = false
	var40.SelectionImageObject = var168
	var41 = NewGui("ScrollingFrame", "ScrollingFrame")
	var41.Selectable = false
	var41.CanvasSize = UDim2.new(0, 0, 0, 0)
	var41.Parent = var39
	var42 = NewGui("Frame", "UIGridFrame")
	var42.Selectable = false
	var42.Size = UDim2.new(1, -10, 1, 0)
	var42.Position = UDim2.new(0, 5, 0, 0)
	var42.Parent = var41
	var43 = Instance.new("UIGridLayout")
	var43.SortOrder = Enum.SortOrder.LayoutOrder
	var43.CellSize = UDim2.new(0, var11, 0, var11)
	var43.CellPadding = UDim2.new(0, 5, 0, 5)
	var43.Parent = var42
	var44 = MakeVRRoundButton("ScrollUpButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png")
	var44.Size = UDim2.new(0, 34, 0, 34)
	var44.Position = UDim2.new(0.5, -var44.Size.X.Offset / 2, 0, 43)
	var44.Icon.Position -= UDim2.new(0, 0, 0, 2)
	var44.MouseButton1Click:connect(function()
		-- upvalues: var41 (copy), var11 (copy)
		if var41 then
			var41.CanvasPosition = Vector2.new(var41.CanvasPosition.X, math.min(var41.CanvasSize.Y.Offset - var41.AbsoluteWindowSize.Y, math.max(0, var41.CanvasPosition.Y - (var11 + 5))))
			
			return
		end
	end)
	var45 = MakeVRRoundButton("ScrollDownButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png")
	var45.Rotation = 180
	var45.Icon.Position -= UDim2.new(0, 0, 0, 2)
	var45.Size = UDim2.new(0, 34, 0, 34)
	var45.Position = UDim2.new(0.5, -var45.Size.X.Offset / 2, 1, (-var45.Size.Y.Offset) - 3)
	var45.MouseButton1Click:connect(function()
		-- upvalues: var41 (copy), var11 (copy)
		if var41 then
			var41.CanvasPosition = Vector2.new(var41.CanvasPosition.X, math.min(var41.CanvasSize.Y.Offset - var41.AbsoluteWindowSize.Y, math.max(0, var41.CanvasPosition.Y + (var11 + 5))))
			
			return
		end
	end)
	var41.Changed:connect(function(p50)
		-- upvalues: var41 (copy), var44 (copy), var45 (copy)
		if not var41 then return end
		if p50 == "AbsoluteWindowSize" or p50 == "CanvasPosition" or p50 == "CanvasSize" then
			local var183 = var41.CanvasPosition.Y < var41.CanvasSize.Y.Offset - var41.AbsoluteWindowSize.Y
			var44.Visible = var41.CanvasPosition.Y ~= 0
			var45.Visible = var183
		end
	end)
	UpdateBackpackLayout()
	local var169 = create("Frame")({
		Name = "GamepadHintsFrame",
		BackgroundTransparency = 1,
		Visible = false,
		Size = UDim2.new(0, var36.Size.X.Offset, 0, if var30 then 95 else 60),
		Parent = var35
	})
	
	local function addGamepadHint(p51, p52, p53)
		-- upvalues: create (copy), var169 (ref), var30 (copy)
		local var184 = create("Frame")({
			Name = "HintFrame",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, -5),
			Position = UDim2.new(0, 0, 0, 0),
			Parent = var169
		})
		local _ = create("ImageLabel")({
			Name = "HintImage",
			BackgroundTransparency = 1,
			Size = var30 and UDim2.new(0, 90, 0, 90) or UDim2.new(0, 60, 0, 60),
			Image = if var30 then p52 else p51,
			Parent = var184
		})
		local var185 = create("TextLabel")({
			Name = "HintText",
			BackgroundTransparency = 1,
			TextWrapped = true,
			Position = UDim2.new(0, if var30 then 100 else 70, 0, 0),
			Size = UDim2.new(1, -(if var30 then 100 else 70), 1, 0),
			Font = Enum.Font.SourceSansBold,
			FontSize = if var30 then Enum.FontSize.Size36 else Enum.FontSize.Size24,
			Text = p53,
			TextColor3 = Color3.new(1, 1, 1),
			TextXAlignment = Enum.TextXAlignment.Left,
			Parent = var184
		})
		local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
		UITextSizeConstraint.Parent = var185
		UITextSizeConstraint.MaxTextSize = var185.TextSize
	end
	
	local function resizeGamepadHintsFrame()
		-- upvalues: var36 (copy), var39 (copy), var169 (ref), var30 (copy)
		if not var36 or not var39 then return end
		var169.Size = UDim2.new(var36.Size.X.Scale, var36.Size.X.Offset, 0, if var30 then 95 else 60)
		var169.Position = UDim2.new(var36.Position.X.Scale, var36.Position.X.Offset, var39.Position.Y.Scale, var39.Position.Y.Offset - var169.Size.Y.Offset)
		local var187 = 0
		local children = var169:GetChildren()
		
		for i = 1, #children do
			children[i].Size = UDim2.new(1, 0, 1, -5)
			children[i].Position = UDim2.new(0, 0, 0, 0)
			var187 += children[i].HintText.Position.X.Offset + children[i].HintText.TextBounds.X
		end
		local var189 = (var169.AbsoluteSize.X - var187) / (#children - 1)
		
		for i_1 = 1, #children do
			children[i_1].Position = i_1 == 1 and UDim2.new(0, 0, 0, 0) or UDim2.new(0, children[i_1 - 1].Position.X.Offset + children[i_1 - 1].Size.X.Offset + var189, 0, 0)
			children[i_1].Size = UDim2.new(0, children[i_1].HintText.Position.X.Offset + children[i_1].HintText.TextBounds.X, 1, -5)
		end
	end
	
	addGamepadHint("rbxasset://textures/ui/Controls/DesignSystem/ButtonX.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonX@2x.png", "Remove From Hotbar")
	addGamepadHint("rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonA@2x.png", "Select/Swap")
	addGamepadHint("rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonB@2x.png", "Close Backpack")
	local var172 = NewGui("Frame", "Search")
	var172.BackgroundColor3 = color3_5
	var172.BackgroundTransparency = var21
	var172.Size = UDim2.new(0, 190, 0, 30)
	var172.Position = UDim2.new(1, (-var172.Size.X.Offset) - 5, 0, 5)
	var172.Parent = var39
	local var173 = NewGui("TextBox", "TextBox")
	var173.Text = var19
	var173.ClearTextOnFocus = false
	var173.FontSize = Enum.FontSize.Size24
	var173.TextXAlignment = Enum.TextXAlignment.Left
	var173.Size = var172.Size - UDim2.new(0, 0, 0, 0)
	var173.Position = UDim2.new(0, 0, 0, 0)
	var173.Parent = var172
	local var174 = NewGui("TextButton", "X")
	var174.Text = "x"
	var174.TextColor3 = color3_2
	var174.FontSize = Enum.FontSize.Size24
	var174.TextYAlignment = Enum.TextYAlignment.Bottom
	var174.BackgroundColor3 = color3_5
	var174.BackgroundTransparency = 0
	var174.Size = UDim2.new(0, var172.Size.Y.Offset - 10, 0, var172.Size.Y.Offset - 10)
	var174.Position = UDim2.new(1, (-var174.Size.X.Offset) - 10, 0.5, -var174.Size.Y.Offset / 2)
	var174.ZIndex = 0
	var174.Visible = false
	var174.BorderSizePixel = 0
	var174.Parent = var172
	
	local function search()
		-- upvalues: var173 (ref), var65 (copy), t_2 (copy), var39 (copy), var59 (copy), var42 (copy), var41 (copy), UpdateScrollingFrameCanvasSize (copy), var174 (ref)
		local t = {}
		
		for i in var173.Text:gmatch("%S+") do
			t[i:lower()] = true
		end
		local t_1 = {}
		
		for i_1 = var65 + 1, #t_2 do
			local var192 = t_2[i_1]
			table.insert(t_1, { var192, var192:CheckTerms(t) })
			var192.Frame.Visible = false
			var192.Frame.Parent = var39
		end
		table.sort(t_1, function(p54, p55)
			return p55[2] < p54[2]
		end)
		var59 = true
		local var193 = 0
		
		for i_2, v in ipairs(t_1) do
			local var194 = v[1]
			
			if v[2] > 0 then
				var194.Frame.Visible = true
				var194.Frame.Parent = var42
				var194.Frame.LayoutOrder = var65 + var193
				var193 += 1
			end
		end
		if var41 then
			var41.CanvasPosition = Vector2.new(0, 0)
		end
		UpdateScrollingFrameCanvasSize()
		var174.ZIndex = 3
	end
	
	local function clearResults()
		-- upvalues: var174 (ref), var59 (copy), var65 (copy), t_2 (copy), var42 (copy), UpdateScrollingFrameCanvasSize (copy)
		if var174.ZIndex > 0 then
			var59 = false
			
			for i = var65 + 1, #t_2 do
				local var195 = t_2[i]
				var195.Frame.LayoutOrder = var195.Index
				var195.Frame.Parent = var42
				var195.Frame.Visible = true
			end
			var174.ZIndex = 0
		end
		UpdateScrollingFrameCanvasSize()
	end
	
	local function reset()
		-- upvalues: clearResults (ref), var173 (ref), var19 (copy)
		clearResults()
		var173.Text = var19
	end
	
	local function onChanged(p56)
		-- upvalues: var173 (ref), clearResults (ref), var19 (copy), search (ref), var174 (ref)
		if p56 == "Text" then
			local text = var173.Text
			
			if text == "" then
				clearResults()
			elseif text ~= var19 then
				search()
			end
			var174.Visible = text ~= "" and text ~= var19
		end
	end
	
	local function focusLost(p57)
		-- upvalues: search (ref), var173 (ref), var19 (copy)
		if p57 then
			search()
			
			return
		elseif var173.Text == "" then
			var173.Text = var19
		end
	end
	
	var173.Focused:connect(function()
		-- upvalues: var173 (ref), var19 (copy)
		if var173.Text == var19 then
			var173.Text = ""
		end
	end)
	var174.MouseButton1Click:connect(reset)
	var173.Changed:connect(onChanged)
	var173.FocusLost:connect(focusLost)
	table.insert(t_8, t.StateChanged.Event:connect(function(p58)
		-- upvalues: var174 (ref), clearResults (ref), var173 (ref), var19 (copy)
		var174.Modal = p58
		
		if not p58 then
			clearResults()
			var173.Text = var19
		end
	end))
	
	t_4[Enum.KeyCode.Escape.Value] = function(p59)
		-- upvalues: clearResults (ref), var173 (ref), var19 (copy), var39 (copy), t (copy)
		if p59 then
			clearResults()
			var173.Text = var19
			
			return
		elseif var39 and var39.Visible then
			t.OpenClose()
		end
	end
	
	table.insert(t_8, userInputService.LastInputTypeChanged:connect(function(p60)
		-- upvalues: VRService (copy), var172 (ref)
		if p60 == Enum.UserInputType.Gamepad1 and not VRService.VREnabled then
			var172.Visible = false
			
			return
		end
		var172.Visible = true
	end))
	
	local var180 = function(_, p61, _)
		-- upvalues: guiService (copy), var65 (copy), t_2 (copy)
		if p61 ~= Enum.UserInputState.Begin then return end
		if not guiService.SelectedCoreObject then return end
		for i = 1, var65 do
			if t_2[i].Frame ~= guiService.SelectedCoreObject or not t_2[i].Tool then
				continue
			end
			t_2[i]:MoveToInventory()
			
			return
		end
	end
	
	local function openClose()
		-- upvalues: var39 (copy), t_5 (copy), AdjustHotbarFrames (copy), var36 (copy), var65 (copy), t_2 (copy), var63 (copy), t_1 (copy), userInputService (copy), resizeGamepadHintsFrame (ref), var169 (ref), contextActionService (copy), var180 (ref), t (copy)
		if not var39 then return end
		if not next(t_5) then
			var39.Visible = not var39.Visible
			local visible = var39.Visible
			AdjustHotbarFrames()
			var36.Active = not var36.Active
			
			for i = 1, var65 do
				t_2[i]:SetClickability(not visible)
			end
		end
		if not var39.Visible then
			if var63 then
				var169.Visible = false
			end
			disableGamepadInventoryControl()
		elseif var63 then
			if t_1[userInputService:GetLastInputType()] then
				resizeGamepadHintsFrame()
				var169.Visible = true
			end
			enableGamepadInventoryControl()
		end
		if var39.Visible then
			contextActionService:BindAction("RBXRemoveSlot", var180, false, Enum.KeyCode.ButtonX)
		else
			contextActionService:UnbindAction("RBXRemoveSlot")
		end
		t.IsOpen = var39.Visible
		t.StateChanged:Fire(var39.Visible)
	end
	
	t_4[value] = function()
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
	table.insert(t_8, userInputService.TextBoxFocused:connect(function()
		-- upvalues: var58 (copy)
		var58 = true
	end))
	table.insert(t_8, userInputService.TextBoxFocusReleased:connect(function()
		-- upvalues: var58 (copy)
		var58 = false
	end))
	
	t_4[value_2] = function()
		-- upvalues: var55 (copy), var47 (copy), t_3 (copy)
		if var55 and var47 then
			var47:UnequipTools()
			
			if var55 then
				var55:ToggleSelect()
				t_3[var55]:UpdateEquipView()
				var55 = nil
			end
		end
	end
	
	table.insert(t_8, userInputService.Changed:connect(OnUISChanged))
	local var182 = userInputService.KeyboardEnabled and not VRService.VREnabled
	
	for i_2 = 1, var65 do
		t_2[i_2]:TurnNumber(var182)
	end
	if userInputService:GetGamepadConnected(Enum.UserInputType.Gamepad1) then
		gamepadConnected()
	end
	table.insert(t_8, userInputService.GamepadConnected:connect(function(p62)
		if p62 == Enum.UserInputType.Gamepad1 then
			gamepadConnected()
		end
	end))
	table.insert(t_8, userInputService.GamepadDisconnected:connect(function(p63)
		if p63 == Enum.UserInputType.Gamepad1 then
			gamepadDisconnected()
		end
	end))
	
	if enableHotbarHide then
		table.insert(t_8, settingsShowSignal:connect(function(p64)
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
	table.insert(t_8, guiService.MenuOpened:Connect(function()
		-- upvalues: t (copy), isInExperienceUIVREnabled (copy), inExperienceUIVRIXP (copy), VRService (copy)
		if t.IsOpen then
			if if isInExperienceUIVREnabled and not inExperienceUIVRIXP:isMovePanelToCenter() then not VRService.VREnabled else true then
				t.OpenClose()
			end
		end
	end))
	table.insert(t_8, inExperienceAppChatModalModule.default.visibilitySignal.Event:Connect(function(p65)
		-- upvalues: t (copy)
		if p65 and t.IsOpen then
			t.OpenClose()
		end
	end))
	table.insert(t_8, userGameSettingsService:GetPropertyChangedSignal("PreferredTransparency"):connect(function()
		-- upvalues: userGameSettingsService (copy), var12 (copy), var39 (copy), var16 (copy), t_2 (copy), var21 (copy), var172 (ref)
		local preferredTransparency = userGameSettingsService.PreferredTransparency
		var12 = 0.5 * userGameSettingsService.PreferredTransparency
		
		if var39 then
			var39.BackgroundTransparency = var12
		end
		var16 = 0.5 * preferredTransparency
		
		for i, v in ipairs(t_2) do
			v.Frame.BackgroundTransparency = var16
		end
		var21 = 0.15 * userGameSettingsService.PreferredTransparency
		var172.BackgroundTransparency = var21
	end))
end

function t.destroyGui()
	-- upvalues: t_8 (ref), t_7 (write), contextActionService (ref), t_2 (ref), t_3 (ref), t_4 (ref), t_5 (ref), t_6 (ref), var35 (write), var36 (write), var37 (write), var38 (write), var39 (write), var40 (write), var41 (write), var42 (write), var43 (write), var44 (write), var45 (write), var46 (write), var47 (write), var48 (write), var50 (write), var54 (write), var55 (write), var56 (write), var57 (write), var58 (write), var59 (write), var63 (write), var33 (write), var64 (write), var67 (write), t (ref)
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
		local var196 = t_2[i_2]
		
		if var196.Tool then
			var196:Clear()
		end
	end
	table.clear(t_2)
	table.clear(t_3)
	table.clear(t_4)
	table.clear(t_5)
	table.clear(t_6)
	
	if var35 then
		var35:Destroy()
		var35 = nil
	end
	var36 = nil
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
	var50 = nil
	var54 = 0
	var55 = nil
	var56 = false
	var57 = false
	var58 = false
	var59 = false
	var63 = false
	var33 = false
	var64 = 0
	var67 = nil
	t.OpenClose = nil
	t.IsOpen = false
	t.IsHotbarVisible = false
end

function t.TopbarEnabledChanged(_, p66)
	-- upvalues: var32 (write), setBackpackEnabled (ref), starterGuiService (ref)
	var32 = p66
	setBackpackEnabled(starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack))
end

if fFlagTopBarSignalizeSetCores then
	t.disposeEffect = signalsModule.createEffect(function(p67)
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
lifecycle:onEnabledChanged(function(p68)
	-- upvalues: t (ref), setBackpackEnabled (ref)
	if p68 then
		t.createGui()
	else
		t.destroyGui()
	end
	setBackpackEnabled(p68)
end)
lifecycle:onVisibilityChanged(function(p69)
	-- upvalues: t (ref)
	if t.OpenClose and t.IsOpen ~= p69 then
		t.OpenClose()
	end
	return t.IsOpen
end)
t.StateChanged.Event:connect(function(p70)
	-- upvalues: lifecycle (ref)
	if lifecycle then
		lifecycle.setVisible(p70)
	end
end)

return t