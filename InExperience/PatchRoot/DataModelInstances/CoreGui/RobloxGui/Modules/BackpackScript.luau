local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local corePackagesService = game:GetService("CorePackages")
local modules = robloxGui.Modules
local signalsModule = require(corePackagesService.Packages.Signals)
local inExperienceTopBarModule = require(corePackagesService.Workspace.Packages.InExperienceTopBar)
local settingsShowSignal = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local inExperienceAppChatModalModule = require(corePackagesService.Workspace.Packages.AppChat.InExperienceAppChatModal)
local fFlagMountCoreGuiBackpackModule = require(modules.Flags.FFlagMountCoreGuiBackpack)
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local inExperienceUIVRIXP = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP
local fFlagTopBarSignalizeSetCores = inExperienceTopBarModule.Flags.FFlagTopBarSignalizeSetCores
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local responsiveModule = require(corePackagesService.Workspace.Packages.Responsive)
local fFlagBackpackResponsiveUnits = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagBackpackResponsiveUnits
local enableHotbarHide = game:DefineFastFlag("EnableHotbarHide", false)
local deprecateOldGuiObjectPropertiesEngineFeature = game:GetEngineFeature("DeprecateOldGuiObjectProperties")
local backpackRequestToolEquipEngineFeature = game:DefineFastFlag("BackpackRequestToolEquipLuauFlag", false) and game:GetEngineFeature("BackpackRequestToolEquipEngineFeature")
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
local var13 = 60
local size14 = Enum.FontSize.Size14
local var14 = 0.5 * userGameSettingsService.PreferredTransparency
local color3 = Color3.new(0.121568627451, 0.121568627451, 0.121568627451)
local color3_1 = Color3.new(0.192156862745, 0.192156862745, 0.192156862745)
local color3_2 = Color3.new(0.352941176471, 0.556862745098, 0.913725490196)
local var18 = 0.5 * userGameSettingsService.PreferredTransparency
local color3_3 = Color3.new(1, 1, 1)
local _ = UDim2.new(0, 14, 0, 9)
local value = Enum.KeyCode.Backquote.Value
local color3_4 = Color3.new(0, 0.635294117647, 1)
local var21 = "   Search"
local color3_5 = Color3.new(0.37, 0.37, 0.37)
local var23 = 0.15 * userGameSettingsService.PreferredTransparency
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
local var32 = require(modules.TenFootInterface):IsEnabled()
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local gameTranslatorModule = require(modules.GameTranslator)
pcall(function() --[[ line: 125 ]]
	-- upvalues: var21 (write), robloxTranslatorModule (ref)
	var21 = robloxTranslatorModule:FormatByKey("InGame.UnknownNamespace.BACKPACK_SEARCH")
end)
local var34 = true

if var32 then
	var13 = 100
	size14 = Enum.FontSize.Size24
end
local var35 = false
local _ = nil
local var36 = if fFlagBackpackResponsiveUnits then responsiveModule.GetInputModeStore().getPreferredInputType() == responsiveModule.Input.Touch and guiService:GetScreenResolution().X < 1024 else userInputService.TouchEnabled and guiService:GetScreenResolution().X < 1024
local localPlayer = playersService.LocalPlayer
local var37 = nil
local var38 = nil
local var39 = nil
local _ = nil
local var40 = nil
local var41 = nil
local var42 = nil
local var43 = nil
local _ = nil
local _ = nil
local _ = nil
local var44 = nil
local var45 = nil
local var46 = nil
local t_2 = {}
local var48 = nil
local t_3 = {}
local t_4 = {}
local t_5 = {}
local var52 = 0
local var53 = nil
local var54 = false
local var55 = false
local var56 = false
local var57 = false
local t_6 = {}
local t_7 = {}
local var60 = false
local var61 = 0
local var62 = if var36 then 3 else 10
local var63 = if var36 then 2 else 4
local var64 = nil
t.BackpackEmpty = create("BindableEvent")({ Name = "BackpackEmpty" })
t.BackpackItemAdded = create("BindableEvent")({ Name = "BackpackAdded" })
t.BackpackItemRemoved = create("BindableEvent")({ Name = "BackpackRemoved" })

local function NewGui(p0, p1) --[[ line: 198 ]]
	-- upvalues: size14 (write)
	local var105 = Instance.new(p0)
	var105.Name = p1
	var105.BackgroundColor3 = Color3.new(0, 0, 0)
	var105.BackgroundTransparency = 1
	var105.BorderColor3 = Color3.new(0, 0, 0)
	var105.BorderSizePixel = 0
	var105.Size = UDim2.new(1, 0, 1, 0)
	
	if p0:match("Text") then
		var105.TextColor3 = Color3.new(1, 1, 1)
		var105.Text = ""
		var105.Font = Enum.Font.SourceSans
		var105.FontSize = size14
		var105.TextWrapped = true
		
		if p0 == "TextButton" then
			var105.Font = Enum.Font.SourceSansBold
			var105.BorderSizePixel = 1
		end
	end
	return var105
end

local function _() --[[ line: 220 | named "FindLowestEmpty" ]]
	-- upvalues: var62 (write), t_2 (ref)
	for i = 1, var62 do
		local var106 = t_2[i]
		
		if var106.Tool then
			continue
		end
		return var106
	end
	return nil
end

function t.isInventoryEmpty() --[[ line: 230 ]]
	-- upvalues: var62 (write), t_2 (ref)
	for i = var62 + 1, #t_2 do
		local var107 = t_2[i]
		
		if not var107 or not var107.Tool then
			continue
		end
		return false
	end
	return true
end

local _ = function() --[[ line: 242 | named "UseGazeSelection" ]]
	return false
end

local function AdjustHotbarFrames(p2) --[[ line: 246 ]]
	-- upvalues: var40 (write), var62 (write), var52 (write), enableHotbarHide (ref), t_2 (ref), var39 (write), t (ref)
	local visible = var40.Visible
	local var108 = if visible then var62 else var52
	local var109 = 0
	local var110 = if enableHotbarHide then var108 >= 1 and not p2 else var108 >= 1
	
	for i = 1, var62 do
		local var111 = t_2[i]
		
		if (if enableHotbarHide then var111.Tool and not p2 else var111.Tool) or visible then
			var109 += 1
			var111:Readjust(var109, var108)
			var111.Frame.Visible = true
		else
			var111.Frame.Visible = false
		end
	end
	local var112 = not visible
	
	if var112 then
		var112 = var110
		
		if not var112 then
			local var114
			for i_1 = var62 + 1, #t_2 do
				local var113 = t_2[i_1]
				
				if not var113 or not var113.Tool then
					continue
				end
				var114 = false
				var112 = not var114
			end
			var114 = true
		end
	end
	var39.Visible = var112
	var39.Position = UDim2.new(0.5, -15, 1, if var110 then -110 else -50)
	t.IsHotbarVisible = var110
end

local function UpdateScrollingFrameCanvasSize() --[[ line: 269 ]]
	-- upvalues: var42 (write), var13 (write), var43 (write)
	var42.CanvasSize = UDim2.new(0, 0, 0, math.ceil((#var43:GetChildren() - 1) / math.floor(var42.AbsoluteSize.X / (var13 + 5))) * (var13 + 5) + 5)
end

local function AdjustInventoryFrames() --[[ line: 276 ]]
	-- upvalues: var62 (write), t_2 (ref), UpdateScrollingFrameCanvasSize (ref)
	for i = var62 + 1, #t_2 do
		local var115 = t_2[i]
		var115.Frame.LayoutOrder = var115.Index
		var115.Frame.Visible = var115.Tool ~= nil
	end
	UpdateScrollingFrameCanvasSize()
end

local function UpdateBackpackLayout() --[[ line: 285 ]]
	-- upvalues: var38 (write), var62 (write), var13 (write), var40 (write), var63 (ref), var42 (write), AdjustHotbarFrames (ref), AdjustInventoryFrames (ref)
	var38.Size = UDim2.new(0, 5 + var62 * (var13 + 5), 0, var13 + 5 + 5)
	var38.Position = UDim2.new(0.5, -var38.Size.X.Offset / 2, 1, -var38.Size.Y.Offset)
	var40.Size = UDim2.new(0, var38.Size.X.Offset, 0, var38.Size.Y.Offset * var63 + 40)
	var40.Position = UDim2.new(0.5, -var40.Size.X.Offset / 2, 1, var38.Position.Y.Offset - var40.Size.Y.Offset)
	var42.Size = UDim2.new(1, var42.ScrollBarThickness + 1, 1, -40)
	var42.Position = UDim2.new(0, 0, 0, 40)
	AdjustHotbarFrames()
	AdjustInventoryFrames()
end

local _ = function(value, minValue, maxValue) --[[ line: 297 | named "Clamp" ]]
	return math.min(minValue, math.max(value, maxValue))
end

local _ = function(p3, p4, p5) --[[ line: 301 | named "CheckBounds" ]]
	local absolutePosition = p3.AbsolutePosition
	local absoluteSize = p3.AbsoluteSize
	
	return absolutePosition.X < p4 and (p4 <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y < p5 and p5 <= absolutePosition.Y + absoluteSize.Y))
end

local _ = function(value, p6) --[[ line: 307 | named "GetOffset" ]]
	return (value.AbsolutePosition + value.AbsoluteSize / 2 - p6).magnitude
end

local _ = function() --[[ line: 312 | named "DisableActiveHopper" ]]
	-- upvalues: var53 (write), t_3 (ref)
	var53:ToggleSelect()
	t_3[var53]:UpdateEquipView()
	var53 = nil
end

local _ = function() --[[ line: 318 | named "UnequipAllTools" ]]
	-- upvalues: var45 (write), var53 (write), t_3 (ref)
	if var45 then
		var45:UnequipTools()
		
		if var53 then
			var53:ToggleSelect()
			t_3[var53]:UpdateEquipView()
			var53 = nil
		end
	end
end

local function EquipNewTool(p7) --[[ line: 327 ]]
	-- upvalues: backpackRequestToolEquipEngineFeature (ref), localPlayer (write), var45 (write), var53 (write), t_3 (ref), var44 (write)
	if backpackRequestToolEquipEngineFeature and not p7:IsA("HopperBin") then
		localPlayer:RequestTool(p7)
		
		return
	elseif var45 then
		var45:UnequipTools()
		
		if var53 then
			var53:ToggleSelect()
			t_3[var53]:UpdateEquipView()
			var53 = nil
		end
	end
	if p7:IsA("HopperBin") then
		p7:ToggleSelect()
		t_3[p7]:UpdateEquipView()
		var53 = p7
		
		return
	end
	p7.Parent = var44
end

local _ = function(p8) --[[ line: 345 | named "IsEquipped" ]]
	-- upvalues: var44 (write)
	return p8 and (if p8:IsA("HopperBin") then p8.Active else p8.Parent == var44)
end

local function MakeSlot(p9, p10) --[[ line: 349 ]]
	-- upvalues: t_2 (ref), var18 (write), color3_1 (ref), color3 (ref), var38 (write), var13 (write), gameTranslatorModule (ref), var62 (write), var40 (write), var52 (write), var55 (write), var35 (write), contextActionService (ref), t_3 (ref), var48 (write), var44 (write), var64 (write), NewGui (ref), color3_2 (ref), t_5 (ref), UpdateScrollingFrameCanvasSize (ref), backpackRequestToolEquipEngineFeature (ref), localPlayer (write), var45 (write), var53 (write), var46 (write), EquipNewTool (ref), color3_3 (ref), MakeSlot (ref), var43 (write), var57 (write), t_4 (ref), value_1 (ref), var42 (write)
	p10 = p10 or #t_2 + 1
	p10 = { Tool = nil, Index = p10, Frame = nil }
	local var117 = nil
	local var118 = nil
	local var119 = nil
	local var120 = nil
	local var121 = nil
	local var122 = nil
	local _ = nil
	local var123 = nil
	local var124 = nil
	
	local function _() --[[ line: 374 | named "UpdateSlotFading" ]]
		-- upvalues: var117 (write), var18 (copy), color3_1 (copy), color3 (copy)
		var117.SelectionImageObject = nil
		var117.BackgroundTransparency = if var117.Draggable then 0 else var18
		var117.BackgroundColor3 = if var117.Draggable then color3_1 else color3
	end
	
	function p10.Readjust(_, p11, p12) --[[ line: 380 ]]
		-- upvalues: var38 (copy), var13 (copy), var117 (write)
		var117.Position = UDim2.new(0, var38.Size.X.Offset / 2 - var13 / 2 + (var13 + 5) * (p11 - (p12 / 2 + 0.5)), 0, 5)
	end
	
	function p10.Fill(p13, p14) --[[ line: 388 ]]
		-- upvalues: var119 (write), var120 (write), gameTranslatorModule (copy), var123 (write), var121 (write), var62 (copy), var40 (copy), var117 (write), var52 (copy), var55 (copy), var35 (copy), contextActionService (copy), t_3 (copy), var48 (copy), t_2 (copy)
		if not p14 then
			return p13:Clear()
		end
		p13.Tool = p14
		
		local function assignToolData() --[[ line: 395 ]]
			-- upvalues: p14 (ref), var119 (copy), var120 (copy), gameTranslatorModule (copy), var123 (copy)
			local textureId = p14.TextureId
			var119.Image = textureId
			
			if textureId == "" then
				var120.Visible = true
			else
				var120.Visible = false
			end
			gameTranslatorModule:TranslateAndRegister(var120, p14, p14.Name)
			
			if var123 and p14:IsA("Tool") then
				gameTranslatorModule:TranslateAndRegister(var123, p14, p14.ToolTip)
				local var134 = var123.TextBounds.X + 6
				var123.Size = UDim2.new(0, var134, 0, 16)
				var123.Position = UDim2.new(0.5, -var134 / 2, 0, -25)
			end
		end
		
		assignToolData()
		
		if var121 then
			var121:disconnect()
			var121 = nil
		end
		var121 = p14.Changed:connect(function(p15) --[[ line: 421 ]]
			-- upvalues: assignToolData (ref)
			if p15 == "TextureId" or p15 == "Name" or p15 == "ToolTip" then
				assignToolData()
			end
		end)
		local var131 = p13.Index <= var62
		
		if not var131 or var40.Visible then
			var117.Draggable = true
		end
		p13:UpdateEquipView()
		
		if var131 then
			var52 += 1
			
			if var55 and var52 >= 1 and not var35 then
				var35 = true
				contextActionService:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
			end
		end
		local var132, var133
		t_3[p14] = p13
		
		for i = 1, var62 do
			var132 = t_2[i]
			
			if var132.Tool then
				continue
			end
			var133 = var132
			var48 = var133
			
			return
		end
		var133 = nil
	end
	
	function p10.Clear(p16) --[[ line: 452 ]]
		-- upvalues: var121 (write), var119 (write), var120 (write), var123 (write), var117 (write), var62 (copy), var52 (copy), var35 (copy), contextActionService (copy), t_3 (copy), var48 (copy), t_2 (copy)
		if not p16.Tool then return end
		if var121 then
			var121:disconnect()
			var121 = nil
		end
		var119.Image = ""
		var120.Text = ""
		
		if var123 then
			var123.Text = ""
			var123.Visible = false
		end
		var117.Draggable = false
		p16:UpdateEquipView(true)
		
		if p16.Index <= var62 then
			var52 -= 1
			
			if var52 < 1 then
				var35 = false
				contextActionService:UnbindAction("RBXHotbarEquip")
			end
		end
		local var135, var136
		t_3[p16.Tool] = nil
		p16.Tool = nil
		
		for i = 1, var62 do
			var135 = t_2[i]
			
			if var135.Tool then
				continue
			end
			var136 = var135
			var48 = var136
			
			return
		end
		var136 = nil
	end
	
	function p10.UpdateEquipView(p17, p18) --[[ line: 483 ]]
		-- upvalues: var44 (copy), var64 (copy), p10 (ref), var122 (write), NewGui (copy), var117 (write), color3_2 (copy), var18 (copy), color3_1 (copy), color3 (copy)
		if not p18 then
			local tool = p17.Tool
			
			if tool and (if tool:IsA("HopperBin") then tool.Active else tool.Parent == var44) then
				var64 = p10
				
				if not var122 then
					var122 = NewGui("Frame", "Equipped")
					var122.ZIndex = var117.ZIndex
					
					for i, v in pairs({
						{ 0.1, 1, 0, 0 },
						{ 0.8, 0.1, 0.1, 0 },
						{ 0.1, 1, 0.9, 0 },
						{ 0.8, 0.1, 0.1, 0.9 }
					}) do
						local var137 = NewGui("Frame", "Edge")
						var137.BackgroundTransparency = 0
						var137.BackgroundColor3 = color3_2
						var137.Size = UDim2.new(v[1], 0, v[2], 0)
						var137.Position = UDim2.new(v[3], 0, v[4], 0)
						var137.ZIndex = var122.ZIndex
						var137.Parent = var122
					end
				end
				var122.Parent = var117
			elseif var122 then
				var122.Parent = nil
			end
			var117.SelectionImageObject = nil
			var117.BackgroundTransparency = if var117.Draggable then 0 else var18
			var117.BackgroundColor3 = if var117.Draggable then color3_1 else color3
		end
	end
	
	function p10.IsEquipped(p19) --[[ line: 515 ]]
		-- upvalues: var44 (copy)
		local tool = p19.Tool
		
		return tool and (if tool:IsA("HopperBin") then tool.Active else tool.Parent == var44)
	end
	
	function p10.Delete(p20) --[[ line: 519 ]]
		-- upvalues: t_5 (copy), var117 (write), t_2 (copy), UpdateScrollingFrameCanvasSize (copy)
		t_5[var117] = nil
		var117:Destroy()
		table.remove(t_2, p20.Index)
		
		for i = p20.Index, #t_2 do
			t_2[i]:SlideBack()
		end
		UpdateScrollingFrameCanvasSize()
	end
	
	function p10.Swap(p21, p22) --[[ line: 533 ]]
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
	
	function p10.SlideBack(p23) --[[ line: 547 ]]
		-- upvalues: var117 (write)
		p23.Index -= 1
		var117.Name = p23.Index
		var117.LayoutOrder = p23.Index
	end
	
	function p10.TurnNumber(_, p24) --[[ line: 553 ]]
		-- upvalues: var124 (write)
		if var124 then
			var124.Visible = p24
		end
	end
	
	function p10.SetClickability(value, p25) --[[ line: 559 ]]
		-- upvalues: var117 (write), var18 (copy), color3_1 (copy), color3 (copy)
		if value.Tool then
			var117.Draggable = not p25
			var117.SelectionImageObject = nil
			var117.BackgroundTransparency = if var117.Draggable then 0 else var18
			var117.BackgroundColor3 = if var117.Draggable then color3_1 else color3
		end
	end
	
	function p10.CheckTerms(p26, p27) --[[ line: 566 ]]
		-- upvalues: var120 (write), var123 (write)
		local var138 = 0
		
		local function _(p28, p29) --[[ line: 568 | named "checkEm" ]]
			-- upvalues: var138 (write)
			local _, var142 = p28:lower():gsub(p29, "")
			var138 += var142
		end
		
		local tool = p26.Tool
		
		if tool then
			for i in pairs(p27) do
				local var139, var140 = var120.Text:lower():gsub(i, "")
				var138 += var140
				
				if tool:IsA("Tool") then
					var139, var141 = (if var123 then var123.Text else ""):lower():gsub(i, "")
					var138 += var141
				end
			end
		end
		return var138
	end
	
	function p10.Select(_, p30) --[[ line: 586 ]]
		-- upvalues: p10 (ref), var44 (copy), backpackRequestToolEquipEngineFeature (copy), localPlayer (copy), var45 (copy), var53 (copy), t_3 (copy), var46 (copy), EquipNewTool (copy)
		if p30 then return end
		local tool = p10.Tool
		
		if tool then
			if tool and (if tool:IsA("HopperBin") then tool.Active else tool.Parent == var44) then
				if backpackRequestToolEquipEngineFeature and not tool:IsA("HopperBin") then
					localPlayer:RequestTool(nil)
					
					return
				elseif var45 then
					var45:UnequipTools()
					
					if var53 then
						var53:ToggleSelect()
						t_3[var53]:UpdateEquipView()
						var53 = nil
						
						return
					end
				end
			elseif tool.Parent == var46 then
				EquipNewTool(tool)
			end
		end
	end
	
	var117 = NewGui("TextButton", p10)
	var117.BackgroundColor3 = color3
	var117.BorderColor3 = color3_3
	var117.Text = ""
	var117.AutoButtonColor = false
	var117.BorderSizePixel = 0
	var117.Size = UDim2.new(0, var13, 0, var13)
	var117.Active = true
	var117.Draggable = false
	var117.BackgroundTransparency = var18
	var117.MouseButton1Click:connect(function() --[[ line: 617 ]]
		-- upvalues: p10 (ref)
		changeSlot(p10)
	end)
	p10.Frame = var117
	local var125 = NewGui("Frame", "SelectionObjectClipper")
	var125.Visible = false
	var125.Parent = var117
	local var126 = NewGui("ImageLabel", "Selector")
	var126.Size = UDim2.new(1, 0, 1, 0)
	var126.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png"
	var126.ScaleType = Enum.ScaleType.Slice
	var126.SliceCenter = Rect.new(12, 12, 52, 52)
	var126.Parent = var125
	var119 = NewGui("ImageLabel", "Icon")
	var119.Size = UDim2.new(0.8, 0, 0.8, 0)
	var119.Position = UDim2.new(0.1, 0, 0.1, 0)
	var119.Parent = var117
	var120 = NewGui("TextLabel", "ToolName")
	var120.Size = UDim2.new(1, -2, 1, -2)
	var120.Position = UDim2.new(0, 1, 0, 1)
	var120.Parent = var117
	p10.Frame.LayoutOrder = p10.Index
	
	if p10 <= var62 then
		var123 = NewGui("TextLabel", "ToolTip")
		var123.TextWrapped = false
		var123.TextYAlignment = Enum.TextYAlignment.Top
		var123.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
		var123.BackgroundTransparency = 0
		var123.Visible = false
		var123.Parent = var117
		var117.MouseEnter:connect(function() --[[ line: 655 ]]
			-- upvalues: var123 (write)
			if var123.Text ~= "" then
				var123.Visible = true
			end
		end)
		var117.MouseLeave:connect(function() --[[ line: 660 ]]
			-- upvalues: var123 (write)
			var123.Visible = false
		end)
		
		function p10.MoveToInventory(p31) --[[ line: 662 ]]
			-- upvalues: p10 (ref), var62 (copy), MakeSlot (copy), var43 (copy), var44 (copy), var45 (copy), var53 (copy), t_3 (copy), var57 (copy), var40 (copy)
			if p10.Index <= var62 then
				local tool = p10.Tool
				p31:Clear()
				local var143 = MakeSlot(var43)
				var143:Fill(tool)
				
				if tool and (if tool:IsA("HopperBin") then tool.Active else tool.Parent == var44) and var45 then
					var45:UnequipTools()
					
					if var53 then
						var53:ToggleSelect()
						t_3[var53]:UpdateEquipView()
						var53 = nil
					end
				end
				if var57 then
					var143.Frame.Visible = false
					var143.Parent = var40
				end
			end
		end
		
		if p10 < 10 or p10 == var62 then
			local var127 = if p10 < 10 then p10 else 0
			var124 = NewGui("TextLabel", "Number")
			var124.Text = var127
			var124.Size = UDim2.new(0.15, 0, 0.15, 0)
			var124.Visible = false
			var124.Parent = var117
			
			t_4[value_1 + var127] = function(p32) --[[ line: 688 ]]
				-- upvalues: p10 (ref)
				p10:Select(p32)
			end
		end
	end
	local position = var117.Position
	local var128 = 0
	local var129 = nil
	var117.DragBegin:connect(function(p33) --[[ line: 699 ]]
		-- upvalues: t_5 (copy), var117 (write), position (write), var119 (write), var120 (write), var124 (write), var122 (write), var129 (write), var43 (copy), var40 (copy), var118 (write), NewGui (copy)
		t_5[var117] = true
		position = p33
		var117.BorderSizePixel = 2
		var117.ZIndex = 2
		var119.ZIndex = 2
		var120.ZIndex = 2
		var117.Parent.ZIndex = 2
		
		if var124 then
			var124.ZIndex = 2
		end
		if var122 then
			var122.ZIndex = 2
			
			for i, v in pairs(var122:GetChildren()) do
				v.ZIndex = 2
			end
		end
		var129 = var117.Parent
		
		if var129 == var43 then
			local _ = var117.AbsolutePosition
			local uDim2 = UDim2.new(0, var117.AbsolutePosition.X - var40.AbsolutePosition.X, 0, var117.AbsolutePosition.Y - var40.AbsolutePosition.Y)
			var117.Parent = var40
			var117.Position = uDim2
			var118 = NewGui("Frame", "FakeSlot")
			var118.LayoutOrder = var117.LayoutOrder
			var118.Size = var117.Size
			var118.BackgroundTransparency = 1
			var118.Parent = var43
		end
	end)
	var117.DragStopped:connect(function(p34, p35) --[[ line: 737 ]]
		-- upvalues: var118 (write), var117 (write), position (write), var129 (write), var119 (write), var120 (write), var124 (write), var122 (write), t_5 (copy), p10 (ref), var40 (copy), var62 (copy), var128 (write), var48 (copy), var38 (copy), t_2 (copy), var44 (copy), var45 (copy), var53 (copy), t_3 (copy), var57 (copy)
		if var118 then
			var118:Destroy()
		end
		local currentTime = tick()
		var117.Position = position
		var117.Parent = var129
		var117.BorderSizePixel = 0
		var117.ZIndex = 1
		var119.ZIndex = 1
		var120.ZIndex = 1
		var129.ZIndex = 1
		
		if var124 then
			var124.ZIndex = 1
		end
		if var122 then
			var122.ZIndex = 1
			
			for i, v in pairs(var122:GetChildren()) do
				v.ZIndex = 1
			end
		end
		t_5[var117] = nil
		
		if not p10.Tool then return end
		local absolutePosition = var40.AbsolutePosition
		local absoluteSize = var40.AbsoluteSize
		
		if absolutePosition.X < p34 and (p34 <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y < p35 and p35 <= absolutePosition.Y + absoluteSize.Y)) then
			if p10.Index <= var62 then
				p10:MoveToInventory()
			end
			if var62 < p10.Index and currentTime - var128 < 0.5 then
				if var48 then
					local tool = p10.Tool
					p10:Clear()
					var48:Fill(tool)
					p10:Delete()
				end
				currentTime = 0
			end
		else
			absolutePosition = var38.AbsolutePosition
			absoluteSize = var38.AbsoluteSize
			
			if absolutePosition.X < p34 and (p34 <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y < p35 and p35 <= absolutePosition.Y + absoluteSize.Y)) then
				local list = { 1e999, nil }
				
				for absoluteSize = 1, var62 do
					local var147 = t_2[absoluteSize]
					local frame = var147.Frame
					local magnitude = (frame.AbsolutePosition + frame.AbsoluteSize / 2 - Vector2.new(p34, p35)).magnitude
					
					if magnitude < list[1] then
						list = { magnitude, var147 }
					end
				end
				local var148 = list[2]
				
				if var148 ~= p10 then
					p10:Swap(var148)
					
					if var62 < p10.Index then
						absolutePosition = p10.Tool
						
						if absolutePosition then
							if absolutePosition and (if absolutePosition:IsA("HopperBin") then absolutePosition.Active else absolutePosition.Parent == var44) and var45 then
								var45:UnequipTools()
								
								if var53 then
									var53:ToggleSelect()
									t_3[var53]:UpdateEquipView()
									var53 = nil
								end
							end
							if var57 then
								p10.Frame.Visible = false
								p10.Frame.Parent = var40
							end
						else
							p10:Delete()
						end
					end
				end
			elseif p10.Index <= var62 then
				p10:MoveToInventory()
			end
		end
		var128 = currentTime
	end)
	var117.Parent = p9
	t_2[p10] = p10
	
	if var62 < p10 then
		UpdateScrollingFrameCanvasSize()
		
		if var40.Visible and not var57 then
			var42.CanvasPosition = Vector2.new(0, math.max(0, var42.CanvasSize.Y.Offset - var42.AbsoluteSize.Y))
		end
	end
	return p10
end

local _ = function(value) --[[ line: 846 | named "SetNumberOfHotbarSlots" ]]
	-- upvalues: var62 (write), t_2 (ref), MakeSlot (ref), var38 (write), var48 (write), var52 (write), UpdateBackpackLayout (ref)
	if var62 ~= value then
		local var149 = var62
		
		if value < var149 then
			for i = var149, value + 1, -1 do
				local var150 = t_2[i]
				
				if var150 then
					var150:MoveToInventory()
					var150:Delete()
				end
			end
			for i_1 = var149, value + 1, -1 do
				local var151 = t_2[i_1]
				
				if not var151.Tool then
					var151:Delete()
				end
			end
		else
			for i_2 = var149, value do
				var62 = i_2
				
				if not t_2[i_2] then
					local var153 = MakeSlot(var38, i_2)
					var153.Frame.Visible = false
					
					if not var48 then
						var48 = var153
					end
				end
				local _ = t_2[i_2]
				local tool = t_2[i_2].Tool
				local var152 = MakeSlot(var38, i_2)
				
				if tool then
					var152:Fill(tool)
				elseif not var48 then
					var48 = var152
				end
			end
		end
		var62 = value
		var52 = 0
		
		for i_2 = 1, var62 do
			if t_2[i_2] and t_2[i_2].Tool then
				var52 += 1
			end
		end
		UpdateBackpackLayout()
	end
end

local function OnChildAdded(p36) --[[ line: 908 ]]
	-- upvalues: var44 (write), var45 (write), var61 (write), var53 (write), t_3 (ref), var54 (write), localPlayer (write), var48 (write), MakeSlot (ref), var43 (write), t_2 (ref), var46 (write), AdjustHotbarFrames (ref), var62 (write), var40 (write), t (ref)
	if p36:IsA("Tool") or p36:IsA("HopperBin") then
		if p36.Parent == var44 then
			var61 = tick()
		end
		if var53 and p36.Parent == var44 then
			var53:ToggleSelect()
			t_3[var53]:UpdateEquipView()
			var53 = nil
		end
		if not var54 and p36.Parent == var44 and not t_3[p36] then
			local starterGear = localPlayer:FindFirstChild("StarterGear")
			
			if starterGear and starterGear:FindFirstChild(p36.Name) then
				var54 = true
				
				for i = (var48 or MakeSlot(var43)).Index, 1, -1 do
					local var155 = t_2[i]
					local var156 = i - 1
					
					if var156 > 0 then
						t_2[var156]:Swap(var155)
					else
						var155:Fill(p36)
					end
				end
				for i_1, v in pairs(var44:GetChildren()) do
					if v:IsA("Tool") and v ~= p36 then
						v.Parent = var46
					end
				end
				AdjustHotbarFrames()
				
				return
			else
				local var157 = t_3[p36]
				
				if var157 then
					var157:UpdateEquipView()
				else
					var157 = var48 or MakeSlot(var43)
					var157:Fill(p36)
					
					if var157.Index <= var62 and not var40.Visible then
						AdjustHotbarFrames()
					end
					if p36:IsA("HopperBin") and p36.Active then
						if var45 then
							var45:UnequipTools()
							
							if var53 then
								var53:ToggleSelect()
								t_3[var53]:UpdateEquipView()
								var53 = nil
							end
						end
						var53 = p36
					end
				end
				t.BackpackItemAdded:Fire()
				
				return
			end
		end
	elseif p36:IsA("Humanoid") and p36.Parent == var44 then
		var45 = p36
	end
end

local function OnChildRemoved(p37) --[[ line: 975 ]]
	-- upvalues: var61 (write), var44 (write), var46 (write), t_3 (ref), var62 (write), var40 (write), AdjustHotbarFrames (ref), var53 (write), t (ref), t_2 (ref)
	if not p37:IsA("Tool") and not p37:IsA("HopperBin") then return end
	var61 = tick()
	local parent = p37.Parent
	
	if parent == var44 or parent == var46 then return end
	local var158 = t_3[p37]
	
	if var158 then
		var158:Clear()
		
		if var62 < var158.Index then
			var158:Delete()
		elseif not var40.Visible then
			AdjustHotbarFrames()
		end
	end
	if p37 == var53 then
		var53 = nil
	end
	local var160
	t.BackpackItemRemoved:Fire()
	
	for i = var62 + 1, #t_2 do
		local var159 = t_2[i]
		
		if not var159 or not var159.Tool then
			continue
		end
		var160 = false
		if var160 then
			t.BackpackEmpty:Fire()
		end
		return
	end
	var160 = true
end

local function OnCharacterAdded(p38) --[[ line: 1009 ]]
	-- upvalues: t_2 (ref), var62 (write), var53 (write), t_7 (write), var44 (write), OnChildRemoved (ref), OnChildAdded (ref), var46 (write), localPlayer (write), AdjustHotbarFrames (ref)
	for i = #t_2, 1, -1 do
		local var161 = t_2[i]
		
		if var161.Tool then
			var161:Clear()
		end
		if var62 < i then
			var161:Delete()
		end
	end
	var53 = nil
	
	for i_1, v in pairs(t_7) do
		v:disconnect()
	end
	t_7 = {}
	var44 = p38
	table.insert(t_7, p38.ChildRemoved:connect(OnChildRemoved))
	table.insert(t_7, p38.ChildAdded:connect(OnChildAdded))
	
	for i_2, v_1 in pairs(p38:GetChildren()) do
		OnChildAdded(v_1)
	end
	var46 = localPlayer:WaitForChild("Backpack")
	table.insert(t_7, var46.ChildRemoved:connect(OnChildRemoved))
	table.insert(t_7, var46.ChildAdded:connect(OnChildAdded))
	
	for i_3, v_2 in pairs(var46:GetChildren()) do
		OnChildAdded(v_2)
	end
	AdjustHotbarFrames()
end

local function OnInputBegan(p39, p40) --[[ line: 1048 ]]
	-- upvalues: var56 (write), var55 (write), value_2 (ref), t_4 (ref), var40 (write), t (ref)
	if p39.UserInputType == Enum.UserInputType.Keyboard and not var56 and (var55 or p39.KeyCode.Value == value_2) then
		local value = t_4[p39.KeyCode.Value]
		
		if value then
			value(p40)
		end
	end
	local userInputType = p39.UserInputType
	
	if not p40 and (userInputType == Enum.UserInputType.MouseButton1 or userInputType == Enum.UserInputType.Touch) and var40.Visible then
		t.OpenClose()
	end
end

local function OnUISChanged(p41) --[[ line: 1067 ]]
	-- upvalues: userInputService (ref), VRService (ref), var62 (write), t_2 (ref)
	if p41 == "KeyboardEnabled" or p41 == "VREnabled" then
		local var162 = userInputService.KeyboardEnabled and not VRService.VREnabled
		
		for i = 1, var62 do
			t_2[i]:TurnNumber(var162)
		end
	end
end

local var77 = nil
local var78 = nil

local var79 = function() --[[ line: 1079 ]] end

local vector2 = Vector2.new(0, 0)

function unbindAllGamepadEquipActions() --[[ line: 1083 ]]
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindAction("RBXBackpackHasGamepadFocus")
	contextActionService:UnbindAction("RBXCloseInventory")
end

local _ = function(value, p42) --[[ line: 1088 | named "setHotbarVisibility" ]]
	-- upvalues: var62 (write), t_2 (ref)
	for i = 1, var62 do
		local var163 = t_2[i]
		
		if var163 and var163.Frame and (p42 or var163.Tool) then
			var163.Frame.Visible = value
		end
	end
end

local function getInputDirection(p43) --[[ line: 1097 ]]
	-- upvalues: vector2 (write)
	local var164 = if p43.UserInputState == Enum.UserInputState.End then -1 else 1
	
	if p43.KeyCode == Enum.KeyCode.Thumbstick1 then
		local magnitude = p43.Position.magnitude
		vector2 = if magnitude > 0.98 then Vector2.new(p43.Position.x / magnitude, -p43.Position.y / magnitude) else Vector2.new(0, 0)
	else
		vector2 = if p43.KeyCode == Enum.KeyCode.DPadLeft then Vector2.new(vector2.x - var164 * 1, vector2.y) elseif p43.KeyCode == Enum.KeyCode.DPadRight then Vector2.new(vector2.x + var164 * 1, vector2.y) elseif p43.KeyCode == Enum.KeyCode.DPadUp then Vector2.new(vector2.x, vector2.y - var164 * 1) elseif p43.KeyCode == Enum.KeyCode.DPadDown then Vector2.new(vector2.x, vector2.y + var164 * 1) else Vector2.new(0, 0)
	end
	return vector2
end

local _ = function(_, _, p44) --[[ line: 1128 ]]
	-- upvalues: getInputDirection (ref), var62 (write), t_2 (ref), var45 (write), var53 (write), t_3 (ref)
	local var165 = getInputDirection(p44)
	
	if var165 == Vector2.new(0, 0) then return end
	local var166 = math.atan2(var165.y, var165.x) - -1.570796326795
	
	if var166 < 0 then
		var166 += 6.28318530718
	end
	local floored = math.floor(var166 / 0.785398163397 + 1 + 0.5)
	
	if var62 < floored then
		floored = 1
	end
	if floored > 0 then
		local var168 = t_2[floored]
		
		if var168 and var168.Tool and not var168:IsEquipped() then
			var168:Select()
			
			return
		end
	elseif var45 then
		var45:UnequipTools()
		
		if var53 then
			var53:ToggleSelect()
			t_3[var53]:UpdateEquipView()
			var53 = nil
		end
	end
end

function changeToolFunc(_, p45, p46) --[[ line: 1158 ]]
	-- upvalues: var77 (write), var78 (write), var45 (write), var53 (write), t_3 (ref), var62 (write), t_2 (ref), var64 (write)
	if p45 ~= Enum.UserInputState.Begin then return end
	if not var77 or (var77.KeyCode ~= Enum.KeyCode.ButtonR1 or p46.KeyCode ~= Enum.KeyCode.ButtonL1) and (var77.KeyCode ~= Enum.KeyCode.ButtonL1 or p46.KeyCode ~= Enum.KeyCode.ButtonR1) or tick() - var78 > 0.06 then
		var77 = p46
		var78 = tick()
		delay(0.06, function() --[[ line: 1178 ]]
			-- upvalues: var77 (copy), p46 (ref), var62 (copy), t_2 (copy), var45 (copy), var53 (copy), t_3 (copy), var64 (copy)
			if var77 ~= p46 then return end
			local var170
			local var169 = if p46.KeyCode == Enum.KeyCode.ButtonL1 then -1 else 1
			
			for i = 1, var62 do
				if not t_2[i]:IsEquipped() then
					continue
				end
				var170 = var169 + i
				local var171 = false
				
				if var62 < var170 then
					var170 = 1
					var171 = true
				elseif var170 < 1 then
					var170 = var62
					var171 = true
				end
				local var172 = var170
				while not t_2[var170].Tool do
					var170 += var169
					
					if var170 ~= var172 then
						if var62 < var170 then
							var170 = 1
							var171 = true
						elseif var170 < 1 then
							var170 = var62
							var171 = true
						end
					end
					return
				end
				if var171 then
					if var45 then
						var45:UnequipTools()
						
						if var53 then
							var53:ToggleSelect()
							t_3[var53]:UpdateEquipView()
							var53 = nil
						end
					end
					var64 = nil
					
					return
				else
					t_2[var170]:Select()
					
					return
				end
			end
			if var64 and var64.Tool then
				var64:Select()
				
				return
			end
			for var170 = if var169 == -1 then var62 else 1, if var169 == -1 then 1 else var62, var169 do
				if not t_2[var170].Tool then
					continue
				end
				t_2[var170]:Select()
				
				return
			end
		end)
		
		return
	elseif var45 then
		var45:UnequipTools()
		
		if var53 then
			var53:ToggleSelect()
			t_3[var53]:UpdateEquipView()
			var53 = nil
		end
	end
	var77 = p46
	var78 = tick()
end

function getGamepadSwapSlot() --[[ line: 1242 ]]
	-- upvalues: t_2 (ref)
	for i = 1, #t_2 do
		if t_2[i].Frame.BorderSizePixel <= 0 then
			continue
		end
		return t_2[i]
	end
end

function changeSlot(p47) --[[ line: 1250 ]]
	-- upvalues: gamepadService (ref), guiService (ref), var41 (write), var62 (write), deprecateOldGuiObjectPropertiesEngineFeature (ref)
	if p47.Frame == guiService.SelectedCoreObject and not gamepadService.GamepadCursorEnabled then
		local var173 = getGamepadSwapSlot()
		
		if var173 then
			var173.Frame.BorderSizePixel = 0
			
			if var173 ~= p47 then
				p47:Swap(var173)
				var41.SelectionImageObject.Visible = false
				
				if var62 < p47.Index and not p47.Tool then
					if guiService.SelectedCoreObject == p47.Frame then
						guiService.SelectedCoreObject = var173.Frame
					end
					p47:Delete()
				end
				if var62 >= var173.Index or var173.Tool then return end
				if guiService.SelectedCoreObject == var173.Frame then
					guiService.SelectedCoreObject = p47.Frame
				end
				var173:Delete()
				
				return
			end
		else
			local size = p47.Frame.Size
			local position = p47.Frame.Position
			
			if deprecateOldGuiObjectPropertiesEngineFeature then
				p47.Frame:TweenSizeAndPositionInternal(size + UDim2.new(0, 10, 0, 10), position - UDim2.new(0, 5, 0, 5), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, function() --[[ line: 1280 ]]
					-- upvalues: p47 (ref), size (ref), position (ref)
					p47.Frame:TweenSizeAndPositionInternal(size, position, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true)
				end)
			else
				p47.Frame:TweenSizeAndPosition(size + UDim2.new(0, 10, 0, 10), position - UDim2.new(0, 5, 0, 5), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, function() --[[ line: 1282 ]]
					-- upvalues: p47 (ref), size (ref), position (ref)
					p47.Frame:TweenSizeAndPosition(size, position, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true)
				end)
			end
			p47.Frame.BorderSizePixel = 3
			var41.SelectionImageObject.Visible = true
			
			return
		end
	else
		p47:Select()
		var41.SelectionImageObject.Visible = false
	end
end

function enableGamepadInventoryControl() --[[ line: 1293 ]]
	-- upvalues: var40 (write), t (ref), contextActionService (ref), var79 (ref), guiService (ref), var38 (write)
	local var174 = function(_, p48, _) --[[ line: 1294 ]]
		-- upvalues: var40 (copy), t (copy)
		if p48 ~= Enum.UserInputState.Begin then return end
		if getGamepadSwapSlot() then
			local var175 = getGamepadSwapSlot()
			
			if var175 then
				var175.Frame.BorderSizePixel = 0
				
				return
			end
		elseif var40.Visible then
			t.OpenClose()
		end
	end
	
	contextActionService:BindAction("RBXBackpackHasGamepadFocus", var79, false, Enum.UserInputType.Gamepad1)
	contextActionService:BindAction("RBXCloseInventory", var174, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart)
	local _ = false
	guiService.SelectedCoreObject = var38:FindFirstChild("1")
end

function disableGamepadInventoryControl() --[[ line: 1319 ]]
	-- upvalues: var62 (write), t_2 (ref), guiService (ref), var37 (write)
	unbindAllGamepadEquipActions()
	
	for i = 1, var62 do
		local var176 = t_2[i]
		
		if var176 and var176.Frame then
			var176.Frame.BorderSizePixel = 0
		end
	end
	if guiService.SelectedCoreObject and guiService.SelectedCoreObject:IsDescendantOf(var37) then
		guiService.SelectedCoreObject = nil
	end
end

local _ = function() --[[ line: 1335 | named "bindBackpackHotbarAction" ]]
	-- upvalues: var55 (write), var35 (write), contextActionService (ref)
	if var55 and not var35 then
		var35 = true
		contextActionService:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
	end
end

local _ = function() --[[ line: 1342 | named "unbindBackpackHotbarAction" ]]
	-- upvalues: var35 (write), contextActionService (ref)
	disableGamepadInventoryControl()
	var35 = false
	contextActionService:UnbindAction("RBXHotbarEquip")
end

function gamepadDisconnected() --[[ line: 1348 ]]
	-- upvalues: VRService (ref), var60 (write)
	if not VRService.VREnabled then
		var60 = false
		disableGamepadInventoryControl()
	end
end

function gamepadConnected() --[[ line: 1355 ]]
	-- upvalues: VRService (ref), var60 (write), guiService (ref), var37 (write), var52 (write), var55 (write), var35 (write), contextActionService (ref), var40 (write)
	if not VRService.VREnabled then
		var60 = true
		guiService:AddSelectionParent("RBXBackpackSelection", var37)
		
		if var52 >= 1 and var55 and not var35 then
			var35 = true
			contextActionService:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
		end
		if var40.Visible then
			enableGamepadInventoryControl()
		end
	end
end

local function OnCoreGuiChanged(p49, p50) --[[ line: 1370 ]]
	-- upvalues: var34 (write), var55 (write), fFlagMountCoreGuiBackpackModule (ref), var37 (write), robloxGui (ref), t_6 (ref), guiService (ref), var52 (write), var35 (write), contextActionService (ref)
	if p49 == Enum.CoreGuiType.Backpack or p49 == Enum.CoreGuiType.All then
		p50 = p50 and var34
		var55 = p50
		
		if not fFlagMountCoreGuiBackpackModule then
			var37.Visible = p50
		elseif p50 then
			var37.Parent = robloxGui
		else
			var37.Parent = nil
		end
		for i, v in pairs(t_6) do
			if p50 then
				guiService:AddKey(v)
			else
				guiService:RemoveKey(v)
			end
		end
		if p50 then
			if var52 >= 1 and var55 and not var35 then
				var35 = true
				contextActionService:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
				
				return
			end
		else
			disableGamepadInventoryControl()
			var35 = false
			contextActionService:UnbindAction("RBXHotbarEquip")
		end
	end
end

local function MakeVRRoundButton(value, p51) --[[ line: 1405 ]]
	-- upvalues: NewGui (ref)
	local var177 = NewGui("ImageButton", value)
	var177.Size = UDim2.new(0, 40, 0, 40)
	var177.Image = "rbxasset://textures/ui/Keyboard/close_button_background.png"
	local var178 = NewGui("ImageLabel", "Icon")
	var178.Size = UDim2.new(0.5, 0, 0.5, 0)
	var178.Position = UDim2.new(0.25, 0, 0.25, 0)
	var178.Image = p51
	var178.Parent = var177
	local var179 = NewGui("ImageLabel", "Selection")
	var179.Size = UDim2.new(0.9, 0, 0.9, 0)
	var179.Position = UDim2.new(0.05, 0, 0.05, 0)
	var179.Image = "rbxasset://textures/ui/Keyboard/close_button_selection.png"
	var177.SelectionImageObject = var179
	
	return var177, var178, var179
end

var37 = NewGui("Frame", "Backpack")

if not fFlagMountCoreGuiBackpackModule then
	var37.Visible = false
	var37.Parent = robloxGui
elseif starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack) then
	var37.Parent = robloxGui
end
var38 = NewGui("Frame", "Hotbar")
var38.Parent = var37

for i = 1, var62 do
	local var84 = MakeSlot(var38, i)
	var84.Frame.Visible = false
	
	if not var48 then
		var48 = var84
	end
end
var39 = NewGui("ImageButton", "OpenInventory")
var39.Size = UDim2.new(0, 30, 0, 30)
var39.Image = "rbxasset://textures/ui/Backpack/ScrollUpArrow.png"
var39.MouseButton1Click:connect(function() --[[ line: 1457 ]]
	-- upvalues: t (ref)
	t.OpenClose()
end)
var39.SelectionGained:connect(function() --[[ line: 1460 ]]
	-- upvalues: var39 (write), color3_4 (ref)
	var39.ImageColor3 = color3_4
end)
var39.SelectionLost:connect(function() --[[ line: 1463 ]]
	-- upvalues: var39 (write)
	var39.ImageColor3 = Color3.new(1, 1, 1)
end)
local var85 = NewGui("Frame", "Selection")
var85.Visible = false
var39.SelectionImageObject = var85
local var86 = MakeVRRoundButton("CloseInventory", "rbxasset://textures/ui/Keyboard/close_button_icon.png")
var86.Position = UDim2.new(0, 0, 0, -50)
var86.MouseButton1Click:connect(function() --[[ line: 1473 ]]
	-- upvalues: var40 (write), t (ref)
	if var40.Visible then
		t.OpenClose()
	end
end)
LeftBumperButton = NewGui("ImageLabel", "LeftBumper")
LeftBumperButton.Size = UDim2.new(0, 40, 0, 40)
LeftBumperButton.Position = UDim2.new(0, -LeftBumperButton.Size.X.Offset, 0.5, -LeftBumperButton.Size.Y.Offset / 2)
RightBumperButton = NewGui("ImageLabel", "RightBumper")
RightBumperButton.Size = UDim2.new(0, 40, 0, 40)
RightBumperButton.Position = UDim2.new(1, 0, 0.5, -RightBumperButton.Size.Y.Offset / 2)
var40 = NewGui("Frame", "Inventory")
var40.BackgroundTransparency = var14
var40.BackgroundColor3 = color3
var40.Active = true
var40.Visible = false
var40.Parent = var37
var41 = NewGui("TextButton", "VRInventorySelector")
var41.Position = UDim2.new(0, 0, 0, 0)
var41.Size = UDim2.new(1, 0, 1, 0)
var41.BackgroundTransparency = 1
var41.Text = ""
var41.Parent = var40
local var87 = NewGui("ImageLabel", "Selector")
var87.Size = UDim2.new(1, 0, 1, 0)
var87.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png"
var87.ScaleType = Enum.ScaleType.Slice
var87.SliceCenter = Rect.new(12, 12, 52, 52)
var87.Visible = false
var41.SelectionImageObject = var87
var42 = NewGui("ScrollingFrame", "ScrollingFrame")
var42.Selectable = false
var42.CanvasSize = UDim2.new(0, 0, 0, 0)
var42.Parent = var40
var43 = NewGui("Frame", "UIGridFrame")
var43.Selectable = false
var43.Size = UDim2.new(1, -10, 1, 0)
var43.Position = UDim2.new(0, 5, 0, 0)
var43.Parent = var42
local UIGridLayout = Instance.new("UIGridLayout")
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellSize = UDim2.new(0, var13, 0, var13)
UIGridLayout.CellPadding = UDim2.new(0, 5, 0, 5)
UIGridLayout.Parent = var43
local var89 = MakeVRRoundButton("ScrollUpButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png")
var89.Size = UDim2.new(0, 34, 0, 34)
var89.Position = UDim2.new(0.5, -var89.Size.X.Offset / 2, 0, 43)
var89.Icon.Position -= UDim2.new(0, 0, 0, 2)
var89.MouseButton1Click:connect(function() --[[ line: 1532 ]]
	-- upvalues: var42 (write), var13 (write)
	var42.CanvasPosition = Vector2.new(var42.CanvasPosition.X, math.min(var42.CanvasSize.Y.Offset - var42.AbsoluteWindowSize.Y, math.max(0, var42.CanvasPosition.Y - (var13 + 5))))
end)
local var90 = MakeVRRoundButton("ScrollDownButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png")
var90.Rotation = 180
var90.Icon.Position -= UDim2.new(0, 0, 0, 2)
var90.Size = UDim2.new(0, 34, 0, 34)
var90.Position = UDim2.new(0.5, -var90.Size.X.Offset / 2, 1, (-var90.Size.Y.Offset) - 3)
var90.MouseButton1Click:connect(function() --[[ line: 1543 ]]
	-- upvalues: var42 (write), var13 (write)
	var42.CanvasPosition = Vector2.new(var42.CanvasPosition.X, math.min(var42.CanvasSize.Y.Offset - var42.AbsoluteWindowSize.Y, math.max(0, var42.CanvasPosition.Y + (var13 + 5))))
end)
var42.Changed:connect(function(p52) --[[ line: 1549 ]]
	-- upvalues: var42 (write), var89 (write), var90 (write)
	if p52 == "AbsoluteWindowSize" or p52 == "CanvasPosition" or p52 == "CanvasSize" then
		local var180 = var42.CanvasPosition.Y < var42.CanvasSize.Y.Offset - var42.AbsoluteWindowSize.Y
		var89.Visible = var42.CanvasPosition.Y ~= 0
		var90.Visible = var180
	end
end)
UpdateBackpackLayout()
local var91 = create("Frame")({
	Name = "GamepadHintsFrame",
	BackgroundTransparency = 1,
	Visible = false,
	Size = UDim2.new(0, var38.Size.X.Offset, 0, if var32 then 95 else 60),
	Parent = var37
})

local function addGamepadHint(p53, p54, p55) --[[ line: 1572 ]]
	-- upvalues: create (ref), var91 (ref), var32 (ref)
	local var181 = create("Frame")({
		Name = "HintFrame",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, -5),
		Position = UDim2.new(0, 0, 0, 0),
		Parent = var91
	})
	local _ = create("ImageLabel")({
		Name = "HintImage",
		BackgroundTransparency = 1,
		Size = var32 and UDim2.new(0, 90, 0, 90) or UDim2.new(0, 60, 0, 60),
		Image = if var32 then p54 else p53,
		Parent = var181
	})
	local var182 = create("TextLabel")({
		Name = "HintText",
		BackgroundTransparency = 1,
		TextWrapped = true,
		Position = UDim2.new(0, if var32 then 100 else 70, 0, 0),
		Size = UDim2.new(1, -(if var32 then 100 else 70), 1, 0),
		Font = Enum.Font.SourceSansBold,
		FontSize = if var32 then Enum.FontSize.Size36 else Enum.FontSize.Size24,
		Text = p55,
		TextColor3 = Color3.new(1, 1, 1),
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = var181
	})
	Instance.new("UITextSizeConstraint", var182).MaxTextSize = var182.TextSize
end

local function resizeGamepadHintsFrame() --[[ line: 1609 ]]
	-- upvalues: var91 (ref), var38 (write), var32 (ref), var40 (write)
	var91.Size = UDim2.new(var38.Size.X.Scale, var38.Size.X.Offset, 0, if var32 then 95 else 60)
	var91.Position = UDim2.new(var38.Position.X.Scale, var38.Position.X.Offset, var40.Position.Y.Scale, var40.Position.Y.Offset - var91.Size.Y.Offset)
	local var183 = 0
	local children = var91:GetChildren()
	
	for i = 1, #children do
		children[i].Size = UDim2.new(1, 0, 1, -5)
		children[i].Position = UDim2.new(0, 0, 0, 0)
		var183 += children[i].HintText.Position.X.Offset + children[i].HintText.TextBounds.X
	end
	local var185 = (var91.AbsoluteSize.X - var183) / (#children - 1)
	
	for i_1 = 1, #children do
		children[i_1].Position = i_1 == 1 and UDim2.new(0, 0, 0, 0) or UDim2.new(0, children[i_1 - 1].Position.X.Offset + children[i_1 - 1].Size.X.Offset + var185, 0, 0)
		children[i_1].Size = UDim2.new(0, children[i_1].HintText.Position.X.Offset + children[i_1].HintText.TextBounds.X, 1, -5)
	end
end

addGamepadHint("rbxasset://textures/ui/Controls/DesignSystem/ButtonX.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonX@2x.png", "Remove From Hotbar")
addGamepadHint("rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonA@2x.png", "Select/Swap")
addGamepadHint("rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonB@2x.png", "Close Backpack")
local var94 = NewGui("Frame", "Search")
var94.BackgroundColor3 = color3_5
var94.BackgroundTransparency = var23
var94.Size = UDim2.new(0, 190, 0, 30)
var94.Position = UDim2.new(1, (-var94.Size.X.Offset) - 5, 0, 5)
var94.Parent = var40
local var95 = NewGui("TextBox", "TextBox")
var95.Text = var21
var95.ClearTextOnFocus = false
var95.FontSize = Enum.FontSize.Size24
var95.TextXAlignment = Enum.TextXAlignment.Left
var95.Size = var94.Size - UDim2.new(0, 0, 0, 0)
var95.Position = UDim2.new(0, 0, 0, 0)
var95.Parent = var94
local var96 = NewGui("TextButton", "X")
var96.Text = "x"
var96.TextColor3 = color3_2
var96.FontSize = Enum.FontSize.Size24
var96.TextYAlignment = Enum.TextYAlignment.Bottom
var96.BackgroundColor3 = color3_5
var96.BackgroundTransparency = 0
var96.Size = UDim2.new(0, var94.Size.Y.Offset - 10, 0, var94.Size.Y.Offset - 10)
var96.Position = UDim2.new(1, (-var96.Size.X.Offset) - 10, 0.5, -var96.Size.Y.Offset / 2)
var96.ZIndex = 0
var96.Visible = false
var96.BorderSizePixel = 0
var96.Parent = var94

local function search() --[[ line: 1666 ]]
	-- upvalues: var95 (ref), var62 (write), t_2 (ref), var40 (write), var57 (write), var43 (write), var42 (write), UpdateScrollingFrameCanvasSize (ref), var96 (ref)
	local t = {}
	
	for i in var95.Text:gmatch("%S+") do
		t[i:lower()] = true
	end
	local t_1 = {}
	
	for i_1 = var62 + 1, #t_2 do
		local var188 = t_2[i_1]
		table.insert(t_1, { var188, var188:CheckTerms(t) })
		var188.Frame.Visible = false
		var188.Frame.Parent = var40
	end
	table.sort(t_1, function(p56, p57) --[[ line: 1681 ]]
		return p57[2] < p56[2]
	end)
	var57 = true
	local var189 = 0
	
	for i_2, v in ipairs(t_1) do
		local var190 = v[1]
		
		if v[2] > 0 then
			var190.Frame.Visible = true
			var190.Frame.Parent = var43
			var190.Frame.LayoutOrder = var62 + var189
			var189 += 1
		end
	end
	var42.CanvasPosition = Vector2.new(0, 0)
	UpdateScrollingFrameCanvasSize()
	var96.ZIndex = 3
end

local function clearResults() --[[ line: 1703 ]]
	-- upvalues: var96 (ref), var57 (write), var62 (write), t_2 (ref), var43 (write), UpdateScrollingFrameCanvasSize (ref)
	if var96.ZIndex > 0 then
		var57 = false
		
		for i = var62 + 1, #t_2 do
			local var191 = t_2[i]
			var191.Frame.LayoutOrder = var191.Index
			var191.Frame.Parent = var43
			var191.Frame.Visible = true
		end
		var96.ZIndex = 0
	end
	UpdateScrollingFrameCanvasSize()
end

local function reset() --[[ line: 1717 ]]
	-- upvalues: clearResults (ref), var95 (ref), var21 (write)
	clearResults()
	var95.Text = var21
end

local function onChanged(p58) --[[ line: 1722 ]]
	-- upvalues: var95 (ref), clearResults (ref), var21 (write), search (ref), var96 (ref)
	if p58 == "Text" then
		local text = var95.Text
		
		if text == "" then
			clearResults()
		elseif text ~= var21 then
			search()
		end
		var96.Visible = text ~= "" and text ~= var21
	end
end

local function focusLost(p59) --[[ line: 1740 ]]
	-- upvalues: search (ref), var95 (ref), var21 (write)
	if p59 then
		search()
		
		return
	elseif var95.Text == "" then
		var95.Text = var21
	end
end

var95.Focused:connect(function() --[[ line: 1734 | named "onFocused" ]]
	-- upvalues: var95 (ref), var21 (write)
	if var95.Text == var21 then
		var95.Text = ""
	end
end)
var96.MouseButton1Click:connect(reset)
var95.Changed:connect(onChanged)
var95.FocusLost:connect(focusLost)
t.StateChanged.Event:connect(function(p60) --[[ line: 1754 ]]
	-- upvalues: var96 (ref), clearResults (ref), var95 (ref), var21 (write)
	var96.Modal = p60
	
	if not p60 then
		clearResults()
		var95.Text = var21
	end
end)

t_4[Enum.KeyCode.Escape.Value] = function(p61) --[[ line: 1761 ]]
	-- upvalues: clearResults (ref), var95 (ref), var21 (write), var40 (write), t (ref)
	if p61 then
		clearResults()
		var95.Text = var21
		
		return
	elseif var40.Visible then
		t.OpenClose()
	end
end

userInputService.LastInputTypeChanged:connect(function(p62) --[[ line: 1769 | named "detectGamepad" ]]
	-- upvalues: VRService (ref), var94 (ref)
	if p62 == Enum.UserInputType.Gamepad1 and not VRService.VREnabled then
		var94.Visible = false
		
		return
	end
	var94.Visible = true
end)

local var102 = function(_, p63, _) --[[ line: 1780 ]]
	-- upvalues: guiService (ref), var62 (write), t_2 (ref)
	if p63 ~= Enum.UserInputState.Begin then return end
	if not guiService.SelectedCoreObject then return end
	for i = 1, var62 do
		if t_2[i].Frame ~= guiService.SelectedCoreObject or not t_2[i].Tool then
			continue
		end
		t_2[i]:MoveToInventory()
		
		return
	end
end

local function openClose() --[[ line: 1792 ]]
	-- upvalues: t_5 (ref), var40 (write), AdjustHotbarFrames (ref), var38 (write), var62 (write), t_2 (ref), var60 (write), t_1 (ref), userInputService (ref), resizeGamepadHintsFrame (ref), var91 (ref), contextActionService (ref), var102 (ref), t (ref)
	if not next(t_5) then
		var40.Visible = not var40.Visible
		local visible = var40.Visible
		AdjustHotbarFrames()
		var38.Active = not var38.Active
		
		for i = 1, var62 do
			t_2[i]:SetClickability(not visible)
		end
	end
	if not var40.Visible then
		if var60 then
			var91.Visible = false
		end
		disableGamepadInventoryControl()
	elseif var60 then
		if t_1[userInputService:GetLastInputType()] then
			resizeGamepadHintsFrame()
			var91.Visible = true
		end
		enableGamepadInventoryControl()
	end
	if var40.Visible then
		contextActionService:BindAction("RBXRemoveSlot", var102, false, Enum.KeyCode.ButtonX)
	else
		contextActionService:UnbindAction("RBXRemoveSlot")
	end
	t.IsOpen = var40.Visible
	t.StateChanged:Fire(var40.Visible)
end

t_4[value] = function() --[[ line: 1828 ]]
	-- upvalues: guiService (ref), openClose (ref)
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
localPlayer.CharacterAdded:connect(OnCharacterAdded)

if localPlayer.Character then
	OnCharacterAdded(localPlayer.Character)
end
for i_1 = 0, 9 do
	table.insert(t_6, tostring(i_1))
end
table.insert(t_6, "`")
userInputService.InputBegan:connect(OnInputBegan)
userInputService.TextBoxFocused:connect(function() --[[ line: 1863 ]]
	-- upvalues: var56 (write)
	var56 = true
end)
userInputService.TextBoxFocusReleased:connect(function() --[[ line: 1864 ]]
	-- upvalues: var56 (write)
	var56 = false
end)

t_4[value_2] = function() --[[ line: 1867 ]]
	-- upvalues: var53 (write), var45 (write), t_3 (ref)
	if var53 and var45 then
		var45:UnequipTools()
		
		if var53 then
			var53:ToggleSelect()
			t_3[var53]:UpdateEquipView()
			var53 = nil
		end
	end
end

userInputService.Changed:connect(OnUISChanged)
local var104 = userInputService.KeyboardEnabled and not VRService.VREnabled

for i_2 = 1, var62 do
	t_2[i_2]:TurnNumber(var104)
end
if userInputService:GetGamepadConnected(Enum.UserInputType.Gamepad1) then
	gamepadConnected()
end
userInputService.GamepadConnected:connect(function(p64) --[[ line: 1881 ]]
	if p64 == Enum.UserInputType.Gamepad1 then
		gamepadConnected()
	end
end)
userInputService.GamepadDisconnected:connect(function(p65) --[[ line: 1886 ]]
	if p65 == Enum.UserInputType.Gamepad1 then
		gamepadDisconnected()
	end
end)

function t.TopbarEnabledChanged(_, p66) --[[ line: 1893 ]]
	-- upvalues: var34 (write), OnCoreGuiChanged (ref), starterGuiService (ref)
	var34 = p66
	OnCoreGuiChanged(Enum.CoreGuiType.Backpack, starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack))
end

if fFlagTopBarSignalizeSetCores then
	t.disposeEffect = signalsModule.createEffect(function(p67) --[[ line: 1900 ]]
		-- upvalues: inExperienceTopBarModule (ref), t (ref)
		local getTopBarStore = inExperienceTopBarModule.Stores.GetTopBarStore
		
		if getTopBarStore then
			t:TopbarEnabledChanged(getTopBarStore(p67).getTopBarCoreGuiEnabled(p67))
		end
	end)
end
starterGuiService.CoreGuiChangedSignal:connect(OnCoreGuiChanged)
local backpack = Enum.CoreGuiType.Backpack
local health = Enum.CoreGuiType.Health
OnCoreGuiChanged(backpack, starterGuiService:GetCoreGuiEnabled(backpack))
OnCoreGuiChanged(health, starterGuiService:GetCoreGuiEnabled(health))

if enableHotbarHide then
	settingsShowSignal:connect(function(p68) --[[ line: 1915 ]]
		-- upvalues: t (ref), AdjustHotbarFrames (ref)
		if p68 then
			if t.IsHotbarVisible then
				AdjustHotbarFrames(true)
				
				return
			end
		else
			AdjustHotbarFrames(false)
		end
	end)
end
guiService.MenuOpened:Connect(function() --[[ line: 1926 ]]
	-- upvalues: t (ref), isInExperienceUIVREnabled (ref), inExperienceUIVRIXP (ref), VRService (ref)
	if t.IsOpen then
		if if isInExperienceUIVREnabled and not inExperienceUIVRIXP:isMovePanelToCenter() then not VRService.VREnabled else true then
			t.OpenClose()
		end
	end
end)
inExperienceAppChatModalModule.default.visibilitySignal.Event:Connect(function(p69) --[[ line: 1935 ]]
	-- upvalues: t (ref)
	if p69 and t.IsOpen then
		t.OpenClose()
	end
end)
userGameSettingsService:GetPropertyChangedSignal("PreferredTransparency"):connect(function() --[[ line: 1941 | named "OnPreferredTransparencyChanged" ]]
	-- upvalues: userGameSettingsService (ref), var14 (write), var40 (write), var18 (write), t_2 (ref), var23 (write), var94 (ref)
	local preferredTransparency = userGameSettingsService.PreferredTransparency
	var14 = 0.5 * userGameSettingsService.PreferredTransparency
	var40.BackgroundTransparency = var14
	var18 = 0.5 * preferredTransparency
	
	for i, v in ipairs(t_2) do
		v.Frame.BackgroundTransparency = var18
	end
	var23 = 0.15 * userGameSettingsService.PreferredTransparency
	var94.BackgroundTransparency = var23
end)

return t