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
local SAToolEquipLuauFlag = game:DefineFastFlag("SAToolEquipLuauFlag", false)

local function _() --[[ line: 35 | named "featureSAToolEquipEnabled" ]]
	-- upvalues: SAToolEquipLuauFlag (ref)
	return if SAToolEquipLuauFlag and game:GetEngineFeature("SAToolEquipEngineFeature") then workspace.AuthorityMode == Enum.AuthorityMode.Server else false
end

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
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local gameTranslatorModule = require(modules.GameTranslator)
pcall(function() --[[ line: 133 ]]
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
local _ = nil
local var39 = nil
local var40 = nil
local var41 = nil
local var42 = nil
local _ = nil
local _ = nil
local _ = nil
local var43 = nil
local var44 = nil
local var45 = nil
local t_2 = {}
local var47 = nil
local t_3 = {}
local t_4 = {}
local t_5 = {}
local var51 = 0
local var52 = nil
local var53 = false
local var54 = false
local var55 = false
local var56 = false
local t_6 = {}
local t_7 = {}
local var59 = false
local var60 = 0
local var61 = if var35 then 3 else 10
local var62 = if var35 then 2 else 4
local var63 = nil
t.BackpackEmpty = create("BindableEvent")({ Name = "BackpackEmpty" })
t.BackpackItemAdded = create("BindableEvent")({ Name = "BackpackAdded" })
t.BackpackItemRemoved = create("BindableEvent")({ Name = "BackpackRemoved" })

local function NewGui(p0, p1) --[[ line: 206 ]]
	-- upvalues: size14 (write)
	local var104 = Instance.new(p0)
	var104.Name = p1
	var104.BackgroundColor3 = Color3.new(0, 0, 0)
	var104.BackgroundTransparency = 1
	var104.BorderColor3 = Color3.new(0, 0, 0)
	var104.BorderSizePixel = 0
	var104.Size = UDim2.new(1, 0, 1, 0)
	
	if p0:match("Text") then
		var104.TextColor3 = Color3.new(1, 1, 1)
		var104.Text = ""
		var104.Font = Enum.Font.SourceSans
		var104.FontSize = size14
		var104.TextWrapped = true
		
		if p0 == "TextButton" then
			var104.Font = Enum.Font.SourceSansBold
			var104.BorderSizePixel = 1
		end
	end
	return var104
end

local _ = function() --[[ line: 228 | named "FindLowestEmpty" ]]
	-- upvalues: var61 (write), t_2 (ref)
	for i = 1, var61 do
		local var105 = t_2[i]
		
		if var105.Tool then
			continue
		end
		return var105
	end
	return nil
end

function t.isInventoryEmpty() --[[ line: 238 ]]
	-- upvalues: var61 (write), t_2 (ref)
	for i = var61 + 1, #t_2 do
		local var106 = t_2[i]
		
		if not var106 or not var106.Tool then
			continue
		end
		return false
	end
	return true
end

local _ = function() --[[ line: 250 | named "UseGazeSelection" ]]
	return false
end

local function AdjustHotbarFrames(p2) --[[ line: 254 ]]
	-- upvalues: var39 (write), var61 (write), var51 (write), enableHotbarHide (ref), t_2 (ref), var38 (write), t (ref)
	local visible = var39.Visible
	local var107 = if visible then var61 else var51
	local var108 = 0
	local var109 = if enableHotbarHide then var107 >= 1 and not p2 else var107 >= 1
	
	for i = 1, var61 do
		local var110 = t_2[i]
		
		if (if enableHotbarHide then var110.Tool and not p2 else var110.Tool) or visible then
			var108 += 1
			var110:Readjust(var108, var107)
			var110.Frame.Visible = true
		else
			var110.Frame.Visible = false
		end
	end
	local var111 = not visible
	
	if var111 then
		var111 = var109
		
		if not var111 then
			local var113
			for i_1 = var61 + 1, #t_2 do
				local var112 = t_2[i_1]
				
				if not var112 or not var112.Tool then
					continue
				end
				var113 = false
				var111 = not var113
			end
			var113 = true
		end
	end
	var38.Visible = var111
	var38.Position = UDim2.new(0.5, -15, 1, if var109 then -110 else -50)
	t.IsHotbarVisible = var109
end

local function UpdateScrollingFrameCanvasSize() --[[ line: 277 ]]
	-- upvalues: var41 (write), var12 (write), var42 (write)
	var41.CanvasSize = UDim2.new(0, 0, 0, math.ceil((#var42:GetChildren() - 1) / math.floor(var41.AbsoluteSize.X / (var12 + 5))) * (var12 + 5) + 5)
end

local function AdjustInventoryFrames() --[[ line: 284 ]]
	-- upvalues: var61 (write), t_2 (ref), UpdateScrollingFrameCanvasSize (ref)
	for i = var61 + 1, #t_2 do
		local var114 = t_2[i]
		var114.Frame.LayoutOrder = var114.Index
		var114.Frame.Visible = var114.Tool ~= nil
	end
	UpdateScrollingFrameCanvasSize()
end

local function UpdateBackpackLayout() --[[ line: 293 ]]
	-- upvalues: var37 (write), var61 (write), var12 (write), var39 (write), var62 (ref), var41 (write), AdjustHotbarFrames (ref), AdjustInventoryFrames (ref)
	var37.Size = UDim2.new(0, 5 + var61 * (var12 + 5), 0, var12 + 5 + 5)
	var37.Position = UDim2.new(0.5, -var37.Size.X.Offset / 2, 1, -var37.Size.Y.Offset)
	var39.Size = UDim2.new(0, var37.Size.X.Offset, 0, var37.Size.Y.Offset * var62 + 40)
	var39.Position = UDim2.new(0.5, -var39.Size.X.Offset / 2, 1, var37.Position.Y.Offset - var39.Size.Y.Offset)
	var41.Size = UDim2.new(1, var41.ScrollBarThickness + 1, 1, -40)
	var41.Position = UDim2.new(0, 0, 0, 40)
	AdjustHotbarFrames()
	AdjustInventoryFrames()
end

local _ = function(value, minValue, maxValue) --[[ line: 305 | named "Clamp" ]]
	return math.min(minValue, math.max(value, maxValue))
end

local _ = function(p3, p4, p5) --[[ line: 309 | named "CheckBounds" ]]
	local absolutePosition = p3.AbsolutePosition
	local absoluteSize = p3.AbsoluteSize
	
	return absolutePosition.X < p4 and (p4 <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y < p5 and p5 <= absolutePosition.Y + absoluteSize.Y))
end

local _ = function(value, p6) --[[ line: 315 | named "GetOffset" ]]
	return (value.AbsolutePosition + value.AbsoluteSize / 2 - p6).magnitude
end

local _ = function() --[[ line: 320 | named "DisableActiveHopper" ]]
	-- upvalues: var52 (write), t_3 (ref)
	var52:ToggleSelect()
	t_3[var52]:UpdateEquipView()
	var52 = nil
end

local _ = function() --[[ line: 326 | named "UnequipAllTools" ]]
	-- upvalues: var44 (write), var52 (write), t_3 (ref)
	if var44 then
		var44:UnequipTools()
		
		if var52 then
			var52:ToggleSelect()
			t_3[var52]:UpdateEquipView()
			var52 = nil
		end
	end
end

local function EquipNewTool(p7) --[[ line: 335 ]]
	-- upvalues: var44 (write), var52 (write), t_3 (ref), SAToolEquipLuauFlag (ref), localPlayer (write), var43 (write)
	if var44 then
		local var115
		var44:UnequipTools()
		
		if var52 then
			var52:ToggleSelect()
			t_3[var52]:UpdateEquipView()
			var52 = nil
		end
	end
	if p7:IsA("HopperBin") then
		p7:ToggleSelect()
		t_3[p7]:UpdateEquipView()
		var52 = p7
		
		return
	elseif SAToolEquipLuauFlag and game:GetEngineFeature("SAToolEquipEngineFeature") then
		var115 = workspace.AuthorityMode == Enum.AuthorityMode.Server
		var115 = nil
	else
		var115 = false
	end
	if var115 then
		localPlayer:RequestTool(p7)
	end
	p7.Parent = var43
end

local _ = function(p8) --[[ line: 351 | named "IsEquipped" ]]
	-- upvalues: var43 (write)
	return p8 and (if p8:IsA("HopperBin") then p8.Active else p8.Parent == var43)
end

local function MakeSlot(p9, p10) --[[ line: 355 ]]
	-- upvalues: t_2 (ref), var17 (write), color3_1 (ref), color3 (ref), var37 (write), var12 (write), gameTranslatorModule (ref), var61 (write), var39 (write), var51 (write), var54 (write), var34 (write), contextActionService (ref), t_3 (ref), var47 (write), var43 (write), var63 (write), NewGui (ref), color3_2 (ref), t_5 (ref), UpdateScrollingFrameCanvasSize (ref), SAToolEquipLuauFlag (ref), localPlayer (write), var44 (write), var52 (write), var45 (write), EquipNewTool (ref), color3_3 (ref), MakeSlot (ref), var42 (write), var56 (write), t_4 (ref), value_1 (ref), var41 (write)
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
	
	local function _() --[[ line: 380 | named "UpdateSlotFading" ]]
		-- upvalues: var117 (write), var17 (copy), color3_1 (copy), color3 (copy)
		var117.SelectionImageObject = nil
		var117.BackgroundTransparency = if var117.Draggable then 0 else var17
		var117.BackgroundColor3 = if var117.Draggable then color3_1 else color3
	end
	
	function p10.Readjust(_, p11, p12) --[[ line: 386 ]]
		-- upvalues: var37 (copy), var12 (copy), var117 (write)
		var117.Position = UDim2.new(0, var37.Size.X.Offset / 2 - var12 / 2 + (var12 + 5) * (p11 - (p12 / 2 + 0.5)), 0, 5)
	end
	
	function p10.Fill(p13, p14) --[[ line: 394 ]]
		-- upvalues: var119 (write), var120 (write), gameTranslatorModule (copy), var123 (write), var121 (write), var61 (copy), var39 (copy), var117 (write), var51 (copy), var54 (copy), var34 (copy), contextActionService (copy), t_3 (copy), var47 (copy), t_2 (copy)
		if not p14 then
			return p13:Clear()
		end
		p13.Tool = p14
		
		local function assignToolData() --[[ line: 401 ]]
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
		var121 = p14.Changed:connect(function(p15) --[[ line: 427 ]]
			-- upvalues: assignToolData (ref)
			if p15 == "TextureId" or p15 == "Name" or p15 == "ToolTip" then
				assignToolData()
			end
		end)
		local var131 = p13.Index <= var61
		
		if not var131 or var39.Visible then
			var117.Draggable = true
		end
		p13:UpdateEquipView()
		
		if var131 then
			var51 += 1
			
			if var54 and var51 >= 1 and not var34 then
				var34 = true
				contextActionService:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
			end
		end
		local var132, var133
		t_3[p14] = p13
		
		for i = 1, var61 do
			var132 = t_2[i]
			
			if var132.Tool then
				continue
			end
			var133 = var132
			var47 = var133
			
			return
		end
		var133 = nil
	end
	
	function p10.Clear(p16) --[[ line: 458 ]]
		-- upvalues: var121 (write), var119 (write), var120 (write), var123 (write), var117 (write), var61 (copy), var51 (copy), var34 (copy), contextActionService (copy), t_3 (copy), var47 (copy), t_2 (copy)
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
		
		if p16.Index <= var61 then
			var51 -= 1
			
			if var51 < 1 then
				var34 = false
				contextActionService:UnbindAction("RBXHotbarEquip")
			end
		end
		local var135, var136
		t_3[p16.Tool] = nil
		p16.Tool = nil
		
		for i = 1, var61 do
			var135 = t_2[i]
			
			if var135.Tool then
				continue
			end
			var136 = var135
			var47 = var136
			
			return
		end
		var136 = nil
	end
	
	function p10.UpdateEquipView(p17, p18) --[[ line: 489 ]]
		-- upvalues: var43 (copy), var63 (copy), p10 (ref), var122 (write), NewGui (copy), var117 (write), color3_2 (copy), var17 (copy), color3_1 (copy), color3 (copy)
		if not p18 then
			local tool = p17.Tool
			
			if tool and (if tool:IsA("HopperBin") then tool.Active else tool.Parent == var43) then
				var63 = p10
				
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
			var117.BackgroundTransparency = if var117.Draggable then 0 else var17
			var117.BackgroundColor3 = if var117.Draggable then color3_1 else color3
		end
	end
	
	function p10.IsEquipped(p19) --[[ line: 521 ]]
		-- upvalues: var43 (copy)
		local tool = p19.Tool
		
		return tool and (if tool:IsA("HopperBin") then tool.Active else tool.Parent == var43)
	end
	
	function p10.Delete(p20) --[[ line: 525 ]]
		-- upvalues: t_5 (copy), var117 (write), t_2 (copy), UpdateScrollingFrameCanvasSize (copy)
		t_5[var117] = nil
		var117:Destroy()
		table.remove(t_2, p20.Index)
		
		for i = p20.Index, #t_2 do
			t_2[i]:SlideBack()
		end
		UpdateScrollingFrameCanvasSize()
	end
	
	function p10.Swap(p21, p22) --[[ line: 539 ]]
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
	
	function p10.SlideBack(p23) --[[ line: 553 ]]
		-- upvalues: var117 (write)
		p23.Index -= 1
		var117.Name = p23.Index
		var117.LayoutOrder = p23.Index
	end
	
	function p10.TurnNumber(_, p24) --[[ line: 559 ]]
		-- upvalues: var124 (write)
		if var124 then
			var124.Visible = p24
		end
	end
	
	function p10.SetClickability(value, p25) --[[ line: 565 ]]
		-- upvalues: var117 (write), var17 (copy), color3_1 (copy), color3 (copy)
		if value.Tool then
			var117.Draggable = not p25
			var117.SelectionImageObject = nil
			var117.BackgroundTransparency = if var117.Draggable then 0 else var17
			var117.BackgroundColor3 = if var117.Draggable then color3_1 else color3
		end
	end
	
	function p10.CheckTerms(p26, p27) --[[ line: 572 ]]
		-- upvalues: var120 (write), var123 (write)
		local var138 = 0
		
		local function _(p28, p29) --[[ line: 574 | named "checkEm" ]]
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
	
	function p10.Select(_, p30) --[[ line: 592 ]]
		-- upvalues: p10 (ref), var43 (copy), SAToolEquipLuauFlag (copy), localPlayer (copy), var44 (copy), var52 (copy), t_3 (copy), var45 (copy), EquipNewTool (copy)
		if p30 then return end
		local tool = p10.Tool
		
		if tool then
			if tool and (if tool:IsA("HopperBin") then tool.Active else tool.Parent == var43) then
				local var143
				if SAToolEquipLuauFlag and game:GetEngineFeature("SAToolEquipEngineFeature") then
					var143 = workspace.AuthorityMode == Enum.AuthorityMode.Server
					var143 = nil
				else
					var143 = false
				end
				if var143 and not tool:IsA("HopperBin") then
					localPlayer:RequestTool(nil)
				end
				if var44 then
					var44:UnequipTools()
					
					if var52 then
						var52:ToggleSelect()
						t_3[var52]:UpdateEquipView()
						var52 = nil
						
						return
					end
				end
			elseif tool.Parent == var45 then
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
	var117.Size = UDim2.new(0, var12, 0, var12)
	var117.Active = true
	var117.Draggable = false
	var117.BackgroundTransparency = var17
	var117.MouseButton1Click:connect(function() --[[ line: 622 ]]
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
	
	if p10 <= var61 then
		var123 = NewGui("TextLabel", "ToolTip")
		var123.TextWrapped = false
		var123.TextYAlignment = Enum.TextYAlignment.Top
		var123.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
		var123.BackgroundTransparency = 0
		var123.Visible = false
		var123.Parent = var117
		var117.MouseEnter:connect(function() --[[ line: 660 ]]
			-- upvalues: var123 (write)
			if var123.Text ~= "" then
				var123.Visible = true
			end
		end)
		var117.MouseLeave:connect(function() --[[ line: 665 ]]
			-- upvalues: var123 (write)
			var123.Visible = false
		end)
		
		function p10.MoveToInventory(p31) --[[ line: 667 ]]
			-- upvalues: p10 (ref), var61 (copy), MakeSlot (copy), var42 (copy), var43 (copy), var44 (copy), var52 (copy), t_3 (copy), var56 (copy), var39 (copy)
			if p10.Index <= var61 then
				local tool = p10.Tool
				p31:Clear()
				local var144 = MakeSlot(var42)
				var144:Fill(tool)
				
				if tool and (if tool:IsA("HopperBin") then tool.Active else tool.Parent == var43) and var44 then
					var44:UnequipTools()
					
					if var52 then
						var52:ToggleSelect()
						t_3[var52]:UpdateEquipView()
						var52 = nil
					end
				end
				if var56 then
					var144.Frame.Visible = false
					var144.Parent = var39
				end
			end
		end
		
		if p10 < 10 or p10 == var61 then
			local var127 = if p10 < 10 then p10 else 0
			var124 = NewGui("TextLabel", "Number")
			var124.Text = var127
			var124.Size = UDim2.new(0.15, 0, 0.15, 0)
			var124.Visible = false
			var124.Parent = var117
			
			t_4[value_1 + var127] = function(p32) --[[ line: 693 ]]
				-- upvalues: p10 (ref)
				p10:Select(p32)
			end
		end
	end
	local position = var117.Position
	local var128 = 0
	local var129 = nil
	var117.DragBegin:connect(function(p33) --[[ line: 704 ]]
		-- upvalues: t_5 (copy), var117 (write), position (write), var119 (write), var120 (write), var124 (write), var122 (write), var129 (write), var42 (copy), var39 (copy), var118 (write), NewGui (copy)
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
		
		if var129 == var42 then
			local _ = var117.AbsolutePosition
			local uDim2 = UDim2.new(0, var117.AbsolutePosition.X - var39.AbsolutePosition.X, 0, var117.AbsolutePosition.Y - var39.AbsolutePosition.Y)
			var117.Parent = var39
			var117.Position = uDim2
			var118 = NewGui("Frame", "FakeSlot")
			var118.LayoutOrder = var117.LayoutOrder
			var118.Size = var117.Size
			var118.BackgroundTransparency = 1
			var118.Parent = var42
		end
	end)
	var117.DragStopped:connect(function(p34, p35) --[[ line: 742 ]]
		-- upvalues: var118 (write), var117 (write), position (write), var129 (write), var119 (write), var120 (write), var124 (write), var122 (write), t_5 (copy), p10 (ref), var39 (copy), var61 (copy), var128 (write), var47 (copy), var37 (copy), t_2 (copy), var43 (copy), var44 (copy), var52 (copy), t_3 (copy), var56 (copy)
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
		local absolutePosition = var39.AbsolutePosition
		local absoluteSize = var39.AbsoluteSize
		
		if absolutePosition.X < p34 and (p34 <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y < p35 and p35 <= absolutePosition.Y + absoluteSize.Y)) then
			if p10.Index <= var61 then
				p10:MoveToInventory()
			end
			if var61 < p10.Index and currentTime - var128 < 0.5 then
				if var47 then
					local tool = p10.Tool
					p10:Clear()
					var47:Fill(tool)
					p10:Delete()
				end
				currentTime = 0
			end
		else
			absolutePosition = var37.AbsolutePosition
			absoluteSize = var37.AbsoluteSize
			
			if absolutePosition.X < p34 and (p34 <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y < p35 and p35 <= absolutePosition.Y + absoluteSize.Y)) then
				local list = { 1e999, nil }
				
				for absoluteSize = 1, var61 do
					local var148 = t_2[absoluteSize]
					local frame = var148.Frame
					local magnitude = (frame.AbsolutePosition + frame.AbsoluteSize / 2 - Vector2.new(p34, p35)).magnitude
					
					if magnitude < list[1] then
						list = { magnitude, var148 }
					end
				end
				local var149 = list[2]
				
				if var149 ~= p10 then
					p10:Swap(var149)
					
					if var61 < p10.Index then
						absolutePosition = p10.Tool
						
						if absolutePosition then
							if absolutePosition and (if absolutePosition:IsA("HopperBin") then absolutePosition.Active else absolutePosition.Parent == var43) and var44 then
								var44:UnequipTools()
								
								if var52 then
									var52:ToggleSelect()
									t_3[var52]:UpdateEquipView()
									var52 = nil
								end
							end
							if var56 then
								p10.Frame.Visible = false
								p10.Frame.Parent = var39
							end
						else
							p10:Delete()
						end
					end
				end
			elseif p10.Index <= var61 then
				p10:MoveToInventory()
			end
		end
		var128 = currentTime
	end)
	var117.Parent = p9
	t_2[p10] = p10
	
	if var61 < p10 then
		UpdateScrollingFrameCanvasSize()
		
		if var39.Visible and not var56 then
			var41.CanvasPosition = Vector2.new(0, math.max(0, var41.CanvasSize.Y.Offset - var41.AbsoluteSize.Y))
		end
	end
	return p10
end

local _ = function(value) --[[ line: 851 | named "SetNumberOfHotbarSlots" ]]
	-- upvalues: var61 (write), t_2 (ref), MakeSlot (ref), var37 (write), var47 (write), var51 (write), UpdateBackpackLayout (ref)
	if var61 ~= value then
		local var150 = var61
		
		if value < var150 then
			for i = var150, value + 1, -1 do
				local var151 = t_2[i]
				
				if var151 then
					var151:MoveToInventory()
					var151:Delete()
				end
			end
			for i_1 = var150, value + 1, -1 do
				local var152 = t_2[i_1]
				
				if not var152.Tool then
					var152:Delete()
				end
			end
		else
			for i_2 = var150, value do
				var61 = i_2
				
				if not t_2[i_2] then
					local var154 = MakeSlot(var37, i_2)
					var154.Frame.Visible = false
					
					if not var47 then
						var47 = var154
					end
				end
				local _ = t_2[i_2]
				local tool = t_2[i_2].Tool
				local var153 = MakeSlot(var37, i_2)
				
				if tool then
					var153:Fill(tool)
				elseif not var47 then
					var47 = var153
				end
			end
		end
		var61 = value
		var51 = 0
		
		for i_2 = 1, var61 do
			if t_2[i_2] and t_2[i_2].Tool then
				var51 += 1
			end
		end
		UpdateBackpackLayout()
	end
end

local function OnChildAdded(p36) --[[ line: 913 ]]
	-- upvalues: var43 (write), var44 (write), var60 (write), var52 (write), t_3 (ref), var53 (write), localPlayer (write), var47 (write), MakeSlot (ref), var42 (write), t_2 (ref), var45 (write), AdjustHotbarFrames (ref), var61 (write), var39 (write), t (ref)
	if p36:IsA("Tool") or p36:IsA("HopperBin") then
		if p36.Parent == var43 then
			var60 = tick()
		end
		if var52 and p36.Parent == var43 then
			var52:ToggleSelect()
			t_3[var52]:UpdateEquipView()
			var52 = nil
		end
		if not var53 and p36.Parent == var43 and not t_3[p36] then
			local starterGear = localPlayer:FindFirstChild("StarterGear")
			
			if starterGear and starterGear:FindFirstChild(p36.Name) then
				var53 = true
				
				for i = (var47 or MakeSlot(var42)).Index, 1, -1 do
					local var156 = t_2[i]
					local var157 = i - 1
					
					if var157 > 0 then
						t_2[var157]:Swap(var156)
					else
						var156:Fill(p36)
					end
				end
				for i_1, v in pairs(var43:GetChildren()) do
					if v:IsA("Tool") and v ~= p36 then
						v.Parent = var45
					end
				end
				AdjustHotbarFrames()
				
				return
			else
				local var158 = t_3[p36]
				
				if var158 then
					var158:UpdateEquipView()
				else
					var158 = var47 or MakeSlot(var42)
					var158:Fill(p36)
					
					if var158.Index <= var61 and not var39.Visible then
						AdjustHotbarFrames()
					end
					if p36:IsA("HopperBin") and p36.Active then
						if var44 then
							var44:UnequipTools()
							
							if var52 then
								var52:ToggleSelect()
								t_3[var52]:UpdateEquipView()
								var52 = nil
							end
						end
						var52 = p36
					end
				end
				t.BackpackItemAdded:Fire()
				
				return
			end
		end
	elseif p36:IsA("Humanoid") and p36.Parent == var43 then
		var44 = p36
	end
end

local function OnChildRemoved(p37) --[[ line: 980 ]]
	-- upvalues: var60 (write), var43 (write), var45 (write), t_3 (ref), var61 (write), var39 (write), AdjustHotbarFrames (ref), var52 (write), t (ref), t_2 (ref)
	if not p37:IsA("Tool") and not p37:IsA("HopperBin") then return end
	var60 = tick()
	local parent = p37.Parent
	
	if parent == var43 or parent == var45 then return end
	local var159 = t_3[p37]
	
	if var159 then
		var159:Clear()
		
		if var61 < var159.Index then
			var159:Delete()
		elseif not var39.Visible then
			AdjustHotbarFrames()
		end
	end
	if p37 == var52 then
		var52 = nil
	end
	local var161
	t.BackpackItemRemoved:Fire()
	
	for i = var61 + 1, #t_2 do
		local var160 = t_2[i]
		
		if not var160 or not var160.Tool then
			continue
		end
		var161 = false
		if var161 then
			t.BackpackEmpty:Fire()
		end
		return
	end
	var161 = true
end

local function OnCharacterAdded(p38) --[[ line: 1014 ]]
	-- upvalues: t_2 (ref), var61 (write), var52 (write), t_7 (write), var43 (write), OnChildRemoved (ref), OnChildAdded (ref), var45 (write), localPlayer (write), AdjustHotbarFrames (ref)
	for i = #t_2, 1, -1 do
		local var162 = t_2[i]
		
		if var162.Tool then
			var162:Clear()
		end
		if var61 < i then
			var162:Delete()
		end
	end
	var52 = nil
	
	for i_1, v in pairs(t_7) do
		v:disconnect()
	end
	t_7 = {}
	var43 = p38
	table.insert(t_7, p38.ChildRemoved:connect(OnChildRemoved))
	table.insert(t_7, p38.ChildAdded:connect(OnChildAdded))
	
	for i_2, v_1 in pairs(p38:GetChildren()) do
		OnChildAdded(v_1)
	end
	var45 = localPlayer:WaitForChild("Backpack")
	table.insert(t_7, var45.ChildRemoved:connect(OnChildRemoved))
	table.insert(t_7, var45.ChildAdded:connect(OnChildAdded))
	
	for i_3, v_2 in pairs(var45:GetChildren()) do
		OnChildAdded(v_2)
	end
	AdjustHotbarFrames()
end

local function OnInputBegan(p39, p40) --[[ line: 1053 ]]
	-- upvalues: var55 (write), var54 (write), value_2 (ref), t_4 (ref), var39 (write), t (ref)
	if p39.UserInputType == Enum.UserInputType.Keyboard and not var55 and (var54 or p39.KeyCode.Value == value_2) then
		local value = t_4[p39.KeyCode.Value]
		
		if value then
			value(p40)
		end
	end
	local userInputType = p39.UserInputType
	
	if not p40 and (userInputType == Enum.UserInputType.MouseButton1 or userInputType == Enum.UserInputType.Touch) and var39.Visible then
		t.OpenClose()
	end
end

local function OnUISChanged(p41) --[[ line: 1072 ]]
	-- upvalues: userInputService (ref), VRService (ref), var61 (write), t_2 (ref)
	if p41 == "KeyboardEnabled" or p41 == "VREnabled" then
		local var163 = userInputService.KeyboardEnabled and not VRService.VREnabled
		
		for i = 1, var61 do
			t_2[i]:TurnNumber(var163)
		end
	end
end

local var76 = nil
local var77 = nil

local var78 = function() --[[ line: 1084 ]] end

local vector2 = Vector2.new(0, 0)

function unbindAllGamepadEquipActions() --[[ line: 1088 ]]
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindAction("RBXBackpackHasGamepadFocus")
	contextActionService:UnbindAction("RBXCloseInventory")
end

local _ = function(value, p42) --[[ line: 1093 | named "setHotbarVisibility" ]]
	-- upvalues: var61 (write), t_2 (ref)
	for i = 1, var61 do
		local var164 = t_2[i]
		
		if var164 and var164.Frame and (p42 or var164.Tool) then
			var164.Frame.Visible = value
		end
	end
end

local function getInputDirection(p43) --[[ line: 1102 ]]
	-- upvalues: vector2 (write)
	local var165 = if p43.UserInputState == Enum.UserInputState.End then -1 else 1
	
	if p43.KeyCode == Enum.KeyCode.Thumbstick1 then
		local magnitude = p43.Position.magnitude
		vector2 = if magnitude > 0.98 then Vector2.new(p43.Position.x / magnitude, -p43.Position.y / magnitude) else Vector2.new(0, 0)
	else
		vector2 = if p43.KeyCode == Enum.KeyCode.DPadLeft then Vector2.new(vector2.x - var165 * 1, vector2.y) elseif p43.KeyCode == Enum.KeyCode.DPadRight then Vector2.new(vector2.x + var165 * 1, vector2.y) elseif p43.KeyCode == Enum.KeyCode.DPadUp then Vector2.new(vector2.x, vector2.y - var165 * 1) elseif p43.KeyCode == Enum.KeyCode.DPadDown then Vector2.new(vector2.x, vector2.y + var165 * 1) else Vector2.new(0, 0)
	end
	return vector2
end

local _ = function(_, _, p44) --[[ line: 1133 ]]
	-- upvalues: getInputDirection (ref), var61 (write), t_2 (ref), var44 (write), var52 (write), t_3 (ref)
	local var166 = getInputDirection(p44)
	
	if var166 == Vector2.new(0, 0) then return end
	local var167 = math.atan2(var166.y, var166.x) - -1.570796326795
	
	if var167 < 0 then
		var167 += 6.28318530718
	end
	local floored = math.floor(var167 / 0.785398163397 + 1 + 0.5)
	
	if var61 < floored then
		floored = 1
	end
	if floored > 0 then
		local var169 = t_2[floored]
		
		if var169 and var169.Tool and not var169:IsEquipped() then
			var169:Select()
			
			return
		end
	elseif var44 then
		var44:UnequipTools()
		
		if var52 then
			var52:ToggleSelect()
			t_3[var52]:UpdateEquipView()
			var52 = nil
		end
	end
end

function changeToolFunc(_, p45, p46) --[[ line: 1163 ]]
	-- upvalues: var76 (write), var77 (write), var44 (write), var52 (write), t_3 (ref), var61 (write), t_2 (ref), var63 (write)
	if p45 ~= Enum.UserInputState.Begin then return end
	if not var76 or (var76.KeyCode ~= Enum.KeyCode.ButtonR1 or p46.KeyCode ~= Enum.KeyCode.ButtonL1) and (var76.KeyCode ~= Enum.KeyCode.ButtonL1 or p46.KeyCode ~= Enum.KeyCode.ButtonR1) or tick() - var77 > 0.06 then
		var76 = p46
		var77 = tick()
		delay(0.06, function() --[[ line: 1183 ]]
			-- upvalues: var76 (copy), p46 (ref), var61 (copy), t_2 (copy), var44 (copy), var52 (copy), t_3 (copy), var63 (copy)
			if var76 ~= p46 then return end
			local var171
			local var170 = if p46.KeyCode == Enum.KeyCode.ButtonL1 then -1 else 1
			
			for i = 1, var61 do
				if not t_2[i]:IsEquipped() then
					continue
				end
				var171 = var170 + i
				local var172 = false
				
				if var61 < var171 then
					var171 = 1
					var172 = true
				elseif var171 < 1 then
					var171 = var61
					var172 = true
				end
				local var173 = var171
				while not t_2[var171].Tool do
					var171 += var170
					
					if var171 ~= var173 then
						if var61 < var171 then
							var171 = 1
							var172 = true
						elseif var171 < 1 then
							var171 = var61
							var172 = true
						end
					end
					return
				end
				if var172 then
					if var44 then
						var44:UnequipTools()
						
						if var52 then
							var52:ToggleSelect()
							t_3[var52]:UpdateEquipView()
							var52 = nil
						end
					end
					var63 = nil
					
					return
				else
					t_2[var171]:Select()
					
					return
				end
			end
			if var63 and var63.Tool then
				var63:Select()
				
				return
			end
			for var171 = if var170 == -1 then var61 else 1, if var170 == -1 then 1 else var61, var170 do
				if not t_2[var171].Tool then
					continue
				end
				t_2[var171]:Select()
				
				return
			end
		end)
		
		return
	elseif var44 then
		var44:UnequipTools()
		
		if var52 then
			var52:ToggleSelect()
			t_3[var52]:UpdateEquipView()
			var52 = nil
		end
	end
	var76 = p46
	var77 = tick()
end

function getGamepadSwapSlot() --[[ line: 1247 ]]
	-- upvalues: t_2 (ref)
	for i = 1, #t_2 do
		if t_2[i].Frame.BorderSizePixel <= 0 then
			continue
		end
		return t_2[i]
	end
end

function changeSlot(p47) --[[ line: 1255 ]]
	-- upvalues: gamepadService (ref), guiService (ref), var40 (write), var61 (write)
	if p47.Frame == guiService.SelectedCoreObject and not gamepadService.GamepadCursorEnabled then
		local var174 = getGamepadSwapSlot()
		
		if not var174 then
			local size = p47.Frame.Size
			local position = p47.Frame.Position
			p47.Frame:TweenSizeAndPositionInternal(size + UDim2.new(0, 10, 0, 10), position - UDim2.new(0, 5, 0, 5), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, function() --[[ line: 1284 ]]
				-- upvalues: p47 (ref), size (ref), position (ref)
				p47.Frame:TweenSizeAndPositionInternal(size, position, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true)
			end)
			p47.Frame.BorderSizePixel = 3
			var40.SelectionImageObject.Visible = true
			
			return
		end
		var174.Frame.BorderSizePixel = 0
		
		if var174 ~= p47 then
			p47:Swap(var174)
			var40.SelectionImageObject.Visible = false
			
			if var61 < p47.Index and not p47.Tool then
				if guiService.SelectedCoreObject == p47.Frame then
					guiService.SelectedCoreObject = var174.Frame
				end
				p47:Delete()
			end
			if var61 >= var174.Index or var174.Tool then return end
			if guiService.SelectedCoreObject == var174.Frame then
				guiService.SelectedCoreObject = p47.Frame
			end
			var174:Delete()
			
			return
		end
	else
		p47:Select()
		var40.SelectionImageObject.Visible = false
	end
end

function enableGamepadInventoryControl() --[[ line: 1294 ]]
	-- upvalues: var39 (write), t (ref), contextActionService (ref), var78 (ref), guiService (ref), var37 (write)
	local var175 = function(_, p48, _) --[[ line: 1295 ]]
		-- upvalues: var39 (copy), t (copy)
		if p48 ~= Enum.UserInputState.Begin then return end
		if getGamepadSwapSlot() then
			local var176 = getGamepadSwapSlot()
			
			if var176 then
				var176.Frame.BorderSizePixel = 0
				
				return
			end
		elseif var39.Visible then
			t.OpenClose()
		end
	end
	
	contextActionService:BindAction("RBXBackpackHasGamepadFocus", var78, false, Enum.UserInputType.Gamepad1)
	contextActionService:BindAction("RBXCloseInventory", var175, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart)
	local _ = false
	guiService.SelectedCoreObject = var37:FindFirstChild("1")
end

function disableGamepadInventoryControl() --[[ line: 1320 ]]
	-- upvalues: var61 (write), t_2 (ref), guiService (ref), var36 (write)
	unbindAllGamepadEquipActions()
	
	for i = 1, var61 do
		local var177 = t_2[i]
		
		if var177 and var177.Frame then
			var177.Frame.BorderSizePixel = 0
		end
	end
	if guiService.SelectedCoreObject and guiService.SelectedCoreObject:IsDescendantOf(var36) then
		guiService.SelectedCoreObject = nil
	end
end

local _ = function() --[[ line: 1336 | named "bindBackpackHotbarAction" ]]
	-- upvalues: var54 (write), var34 (write), contextActionService (ref)
	if var54 and not var34 then
		var34 = true
		contextActionService:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
	end
end

local _ = function() --[[ line: 1343 | named "unbindBackpackHotbarAction" ]]
	-- upvalues: var34 (write), contextActionService (ref)
	disableGamepadInventoryControl()
	var34 = false
	contextActionService:UnbindAction("RBXHotbarEquip")
end

function gamepadDisconnected() --[[ line: 1349 ]]
	-- upvalues: VRService (ref), var59 (write)
	if not VRService.VREnabled then
		var59 = false
		disableGamepadInventoryControl()
	end
end

function gamepadConnected() --[[ line: 1356 ]]
	-- upvalues: VRService (ref), var59 (write), guiService (ref), var36 (write), var51 (write), var54 (write), var34 (write), contextActionService (ref), var39 (write)
	if not VRService.VREnabled then
		var59 = true
		guiService:AddSelectionParent("RBXBackpackSelection", var36)
		
		if var51 >= 1 and var54 and not var34 then
			var34 = true
			contextActionService:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
		end
		if var39.Visible then
			enableGamepadInventoryControl()
		end
	end
end

local function OnCoreGuiChanged(p49, p50) --[[ line: 1371 ]]
	-- upvalues: var33 (write), var54 (write), fFlagMountCoreGuiBackpackModule (ref), var36 (write), robloxGui (ref), t_6 (ref), guiService (ref), var51 (write), var34 (write), contextActionService (ref)
	if p49 == Enum.CoreGuiType.Backpack or p49 == Enum.CoreGuiType.All then
		p50 = p50 and var33
		var54 = p50
		
		if not fFlagMountCoreGuiBackpackModule then
			var36.Visible = p50
		elseif p50 then
			var36.Parent = robloxGui
		else
			var36.Parent = nil
		end
		for i, v in pairs(t_6) do
			if p50 then
				guiService:AddKey(v)
			else
				guiService:RemoveKey(v)
			end
		end
		if p50 then
			if var51 >= 1 and var54 and not var34 then
				var34 = true
				contextActionService:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
				
				return
			end
		else
			disableGamepadInventoryControl()
			var34 = false
			contextActionService:UnbindAction("RBXHotbarEquip")
		end
	end
end

local function MakeVRRoundButton(value, p51) --[[ line: 1406 ]]
	-- upvalues: NewGui (ref)
	local var178 = NewGui("ImageButton", value)
	var178.Size = UDim2.new(0, 40, 0, 40)
	var178.Image = "rbxasset://textures/ui/Keyboard/close_button_background.png"
	local var179 = NewGui("ImageLabel", "Icon")
	var179.Size = UDim2.new(0.5, 0, 0.5, 0)
	var179.Position = UDim2.new(0.25, 0, 0.25, 0)
	var179.Image = p51
	var179.Parent = var178
	local var180 = NewGui("ImageLabel", "Selection")
	var180.Size = UDim2.new(0.9, 0, 0.9, 0)
	var180.Position = UDim2.new(0.05, 0, 0.05, 0)
	var180.Image = "rbxasset://textures/ui/Keyboard/close_button_selection.png"
	var178.SelectionImageObject = var180
	
	return var178, var179, var180
end

var36 = NewGui("Frame", "Backpack")

if not fFlagMountCoreGuiBackpackModule then
	var36.Visible = false
	var36.Parent = robloxGui
elseif starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack) then
	var36.Parent = robloxGui
end
var37 = NewGui("Frame", "Hotbar")
var37.Parent = var36

for i = 1, var61 do
	local var83 = MakeSlot(var37, i)
	var83.Frame.Visible = false
	
	if not var47 then
		var47 = var83
	end
end
var38 = NewGui("ImageButton", "OpenInventory")
var38.Size = UDim2.new(0, 30, 0, 30)
var38.Image = "rbxasset://textures/ui/Backpack/ScrollUpArrow.png"
var38.MouseButton1Click:connect(function() --[[ line: 1458 ]]
	-- upvalues: t (ref)
	t.OpenClose()
end)
var38.SelectionGained:connect(function() --[[ line: 1461 ]]
	-- upvalues: var38 (write), color3_4 (ref)
	var38.ImageColor3 = color3_4
end)
var38.SelectionLost:connect(function() --[[ line: 1464 ]]
	-- upvalues: var38 (write)
	var38.ImageColor3 = Color3.new(1, 1, 1)
end)
local var84 = NewGui("Frame", "Selection")
var84.Visible = false
var38.SelectionImageObject = var84
local var85 = MakeVRRoundButton("CloseInventory", "rbxasset://textures/ui/Keyboard/close_button_icon.png")
var85.Position = UDim2.new(0, 0, 0, -50)
var85.MouseButton1Click:connect(function() --[[ line: 1474 ]]
	-- upvalues: var39 (write), t (ref)
	if var39.Visible then
		t.OpenClose()
	end
end)
LeftBumperButton = NewGui("ImageLabel", "LeftBumper")
LeftBumperButton.Size = UDim2.new(0, 40, 0, 40)
LeftBumperButton.Position = UDim2.new(0, -LeftBumperButton.Size.X.Offset, 0.5, -LeftBumperButton.Size.Y.Offset / 2)
RightBumperButton = NewGui("ImageLabel", "RightBumper")
RightBumperButton.Size = UDim2.new(0, 40, 0, 40)
RightBumperButton.Position = UDim2.new(1, 0, 0.5, -RightBumperButton.Size.Y.Offset / 2)
var39 = NewGui("Frame", "Inventory")
var39.BackgroundTransparency = var13
var39.BackgroundColor3 = color3
var39.Active = true
var39.Visible = false
var39.Parent = var36
var40 = NewGui("TextButton", "VRInventorySelector")
var40.Position = UDim2.new(0, 0, 0, 0)
var40.Size = UDim2.new(1, 0, 1, 0)
var40.BackgroundTransparency = 1
var40.Text = ""
var40.Parent = var39
local var86 = NewGui("ImageLabel", "Selector")
var86.Size = UDim2.new(1, 0, 1, 0)
var86.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png"
var86.ScaleType = Enum.ScaleType.Slice
var86.SliceCenter = Rect.new(12, 12, 52, 52)
var86.Visible = false
var40.SelectionImageObject = var86
var41 = NewGui("ScrollingFrame", "ScrollingFrame")
var41.Selectable = false
var41.CanvasSize = UDim2.new(0, 0, 0, 0)
var41.Parent = var39
var42 = NewGui("Frame", "UIGridFrame")
var42.Selectable = false
var42.Size = UDim2.new(1, -10, 1, 0)
var42.Position = UDim2.new(0, 5, 0, 0)
var42.Parent = var41
local UIGridLayout = Instance.new("UIGridLayout")
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellSize = UDim2.new(0, var12, 0, var12)
UIGridLayout.CellPadding = UDim2.new(0, 5, 0, 5)
UIGridLayout.Parent = var42
local var88 = MakeVRRoundButton("ScrollUpButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png")
var88.Size = UDim2.new(0, 34, 0, 34)
var88.Position = UDim2.new(0.5, -var88.Size.X.Offset / 2, 0, 43)
var88.Icon.Position -= UDim2.new(0, 0, 0, 2)
var88.MouseButton1Click:connect(function() --[[ line: 1533 ]]
	-- upvalues: var41 (write), var12 (write)
	var41.CanvasPosition = Vector2.new(var41.CanvasPosition.X, math.min(var41.CanvasSize.Y.Offset - var41.AbsoluteWindowSize.Y, math.max(0, var41.CanvasPosition.Y - (var12 + 5))))
end)
local var89 = MakeVRRoundButton("ScrollDownButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png")
var89.Rotation = 180
var89.Icon.Position -= UDim2.new(0, 0, 0, 2)
var89.Size = UDim2.new(0, 34, 0, 34)
var89.Position = UDim2.new(0.5, -var89.Size.X.Offset / 2, 1, (-var89.Size.Y.Offset) - 3)
var89.MouseButton1Click:connect(function() --[[ line: 1544 ]]
	-- upvalues: var41 (write), var12 (write)
	var41.CanvasPosition = Vector2.new(var41.CanvasPosition.X, math.min(var41.CanvasSize.Y.Offset - var41.AbsoluteWindowSize.Y, math.max(0, var41.CanvasPosition.Y + (var12 + 5))))
end)
var41.Changed:connect(function(p52) --[[ line: 1550 ]]
	-- upvalues: var41 (write), var88 (write), var89 (write)
	if p52 == "AbsoluteWindowSize" or p52 == "CanvasPosition" or p52 == "CanvasSize" then
		local var181 = var41.CanvasPosition.Y < var41.CanvasSize.Y.Offset - var41.AbsoluteWindowSize.Y
		var88.Visible = var41.CanvasPosition.Y ~= 0
		var89.Visible = var181
	end
end)
UpdateBackpackLayout()
local var90 = create("Frame")({
	Name = "GamepadHintsFrame",
	BackgroundTransparency = 1,
	Visible = false,
	Size = UDim2.new(0, var37.Size.X.Offset, 0, if var31 then 95 else 60),
	Parent = var36
})

local function addGamepadHint(p53, p54, p55) --[[ line: 1573 ]]
	-- upvalues: create (ref), var90 (ref), var31 (ref)
	local var182 = create("Frame")({
		Name = "HintFrame",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, -5),
		Position = UDim2.new(0, 0, 0, 0),
		Parent = var90
	})
	local _ = create("ImageLabel")({
		Name = "HintImage",
		BackgroundTransparency = 1,
		Size = var31 and UDim2.new(0, 90, 0, 90) or UDim2.new(0, 60, 0, 60),
		Image = if var31 then p54 else p53,
		Parent = var182
	})
	local var183 = create("TextLabel")({
		Name = "HintText",
		BackgroundTransparency = 1,
		TextWrapped = true,
		Position = UDim2.new(0, if var31 then 100 else 70, 0, 0),
		Size = UDim2.new(1, -(if var31 then 100 else 70), 1, 0),
		Font = Enum.Font.SourceSansBold,
		FontSize = if var31 then Enum.FontSize.Size36 else Enum.FontSize.Size24,
		Text = p55,
		TextColor3 = Color3.new(1, 1, 1),
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = var182
	})
	Instance.new("UITextSizeConstraint", var183).MaxTextSize = var183.TextSize
end

local function resizeGamepadHintsFrame() --[[ line: 1610 ]]
	-- upvalues: var90 (ref), var37 (write), var31 (ref), var39 (write)
	var90.Size = UDim2.new(var37.Size.X.Scale, var37.Size.X.Offset, 0, if var31 then 95 else 60)
	var90.Position = UDim2.new(var37.Position.X.Scale, var37.Position.X.Offset, var39.Position.Y.Scale, var39.Position.Y.Offset - var90.Size.Y.Offset)
	local var184 = 0
	local children = var90:GetChildren()
	
	for i = 1, #children do
		children[i].Size = UDim2.new(1, 0, 1, -5)
		children[i].Position = UDim2.new(0, 0, 0, 0)
		var184 += children[i].HintText.Position.X.Offset + children[i].HintText.TextBounds.X
	end
	local var186 = (var90.AbsoluteSize.X - var184) / (#children - 1)
	
	for i_1 = 1, #children do
		children[i_1].Position = i_1 == 1 and UDim2.new(0, 0, 0, 0) or UDim2.new(0, children[i_1 - 1].Position.X.Offset + children[i_1 - 1].Size.X.Offset + var186, 0, 0)
		children[i_1].Size = UDim2.new(0, children[i_1].HintText.Position.X.Offset + children[i_1].HintText.TextBounds.X, 1, -5)
	end
end

addGamepadHint("rbxasset://textures/ui/Controls/DesignSystem/ButtonX.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonX@2x.png", "Remove From Hotbar")
addGamepadHint("rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonA@2x.png", "Select/Swap")
addGamepadHint("rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonB@2x.png", "Close Backpack")
local var93 = NewGui("Frame", "Search")
var93.BackgroundColor3 = color3_5
var93.BackgroundTransparency = var22
var93.Size = UDim2.new(0, 190, 0, 30)
var93.Position = UDim2.new(1, (-var93.Size.X.Offset) - 5, 0, 5)
var93.Parent = var39
local var94 = NewGui("TextBox", "TextBox")
var94.Text = var20
var94.ClearTextOnFocus = false
var94.FontSize = Enum.FontSize.Size24
var94.TextXAlignment = Enum.TextXAlignment.Left
var94.Size = var93.Size - UDim2.new(0, 0, 0, 0)
var94.Position = UDim2.new(0, 0, 0, 0)
var94.Parent = var93
local var95 = NewGui("TextButton", "X")
var95.Text = "x"
var95.TextColor3 = color3_2
var95.FontSize = Enum.FontSize.Size24
var95.TextYAlignment = Enum.TextYAlignment.Bottom
var95.BackgroundColor3 = color3_5
var95.BackgroundTransparency = 0
var95.Size = UDim2.new(0, var93.Size.Y.Offset - 10, 0, var93.Size.Y.Offset - 10)
var95.Position = UDim2.new(1, (-var95.Size.X.Offset) - 10, 0.5, -var95.Size.Y.Offset / 2)
var95.ZIndex = 0
var95.Visible = false
var95.BorderSizePixel = 0
var95.Parent = var93

local function search() --[[ line: 1667 ]]
	-- upvalues: var94 (ref), var61 (write), t_2 (ref), var39 (write), var56 (write), var42 (write), var41 (write), UpdateScrollingFrameCanvasSize (ref), var95 (ref)
	local t = {}
	
	for i in var94.Text:gmatch("%S+") do
		t[i:lower()] = true
	end
	local t_1 = {}
	
	for i_1 = var61 + 1, #t_2 do
		local var189 = t_2[i_1]
		table.insert(t_1, { var189, var189:CheckTerms(t) })
		var189.Frame.Visible = false
		var189.Frame.Parent = var39
	end
	table.sort(t_1, function(p56, p57) --[[ line: 1682 ]]
		return p57[2] < p56[2]
	end)
	var56 = true
	local var190 = 0
	
	for i_2, v in ipairs(t_1) do
		local var191 = v[1]
		
		if v[2] > 0 then
			var191.Frame.Visible = true
			var191.Frame.Parent = var42
			var191.Frame.LayoutOrder = var61 + var190
			var190 += 1
		end
	end
	var41.CanvasPosition = Vector2.new(0, 0)
	UpdateScrollingFrameCanvasSize()
	var95.ZIndex = 3
end

local function clearResults() --[[ line: 1704 ]]
	-- upvalues: var95 (ref), var56 (write), var61 (write), t_2 (ref), var42 (write), UpdateScrollingFrameCanvasSize (ref)
	if var95.ZIndex > 0 then
		var56 = false
		
		for i = var61 + 1, #t_2 do
			local var192 = t_2[i]
			var192.Frame.LayoutOrder = var192.Index
			var192.Frame.Parent = var42
			var192.Frame.Visible = true
		end
		var95.ZIndex = 0
	end
	UpdateScrollingFrameCanvasSize()
end

local function reset() --[[ line: 1718 ]]
	-- upvalues: clearResults (ref), var94 (ref), var20 (write)
	clearResults()
	var94.Text = var20
end

local function onChanged(p58) --[[ line: 1723 ]]
	-- upvalues: var94 (ref), clearResults (ref), var20 (write), search (ref), var95 (ref)
	if p58 == "Text" then
		local text = var94.Text
		
		if text == "" then
			clearResults()
		elseif text ~= var20 then
			search()
		end
		var95.Visible = text ~= "" and text ~= var20
	end
end

local function focusLost(p59) --[[ line: 1741 ]]
	-- upvalues: search (ref), var94 (ref), var20 (write)
	if p59 then
		search()
		
		return
	elseif var94.Text == "" then
		var94.Text = var20
	end
end

var94.Focused:connect(function() --[[ line: 1735 | named "onFocused" ]]
	-- upvalues: var94 (ref), var20 (write)
	if var94.Text == var20 then
		var94.Text = ""
	end
end)
var95.MouseButton1Click:connect(reset)
var94.Changed:connect(onChanged)
var94.FocusLost:connect(focusLost)
t.StateChanged.Event:connect(function(p60) --[[ line: 1755 ]]
	-- upvalues: var95 (ref), clearResults (ref), var94 (ref), var20 (write)
	var95.Modal = p60
	
	if not p60 then
		clearResults()
		var94.Text = var20
	end
end)

t_4[Enum.KeyCode.Escape.Value] = function(p61) --[[ line: 1762 ]]
	-- upvalues: clearResults (ref), var94 (ref), var20 (write), var39 (write), t (ref)
	if p61 then
		clearResults()
		var94.Text = var20
		
		return
	elseif var39.Visible then
		t.OpenClose()
	end
end

userInputService.LastInputTypeChanged:connect(function(p62) --[[ line: 1770 | named "detectGamepad" ]]
	-- upvalues: VRService (ref), var93 (ref)
	if p62 == Enum.UserInputType.Gamepad1 and not VRService.VREnabled then
		var93.Visible = false
		
		return
	end
	var93.Visible = true
end)

local var101 = function(_, p63, _) --[[ line: 1781 ]]
	-- upvalues: guiService (ref), var61 (write), t_2 (ref)
	if p63 ~= Enum.UserInputState.Begin then return end
	if not guiService.SelectedCoreObject then return end
	for i = 1, var61 do
		if t_2[i].Frame ~= guiService.SelectedCoreObject or not t_2[i].Tool then
			continue
		end
		t_2[i]:MoveToInventory()
		
		return
	end
end

local function openClose() --[[ line: 1793 ]]
	-- upvalues: t_5 (ref), var39 (write), AdjustHotbarFrames (ref), var37 (write), var61 (write), t_2 (ref), var59 (write), t_1 (ref), userInputService (ref), resizeGamepadHintsFrame (ref), var90 (ref), contextActionService (ref), var101 (ref), t (ref)
	if not next(t_5) then
		var39.Visible = not var39.Visible
		local visible = var39.Visible
		AdjustHotbarFrames()
		var37.Active = not var37.Active
		
		for i = 1, var61 do
			t_2[i]:SetClickability(not visible)
		end
	end
	if not var39.Visible then
		if var59 then
			var90.Visible = false
		end
		disableGamepadInventoryControl()
	elseif var59 then
		if t_1[userInputService:GetLastInputType()] then
			resizeGamepadHintsFrame()
			var90.Visible = true
		end
		enableGamepadInventoryControl()
	end
	if var39.Visible then
		contextActionService:BindAction("RBXRemoveSlot", var101, false, Enum.KeyCode.ButtonX)
	else
		contextActionService:UnbindAction("RBXRemoveSlot")
	end
	t.IsOpen = var39.Visible
	t.StateChanged:Fire(var39.Visible)
end

t_4[value] = function() --[[ line: 1829 ]]
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
userInputService.TextBoxFocused:connect(function() --[[ line: 1864 ]]
	-- upvalues: var55 (write)
	var55 = true
end)
userInputService.TextBoxFocusReleased:connect(function() --[[ line: 1865 ]]
	-- upvalues: var55 (write)
	var55 = false
end)

t_4[value_2] = function() --[[ line: 1868 ]]
	-- upvalues: var52 (write), var44 (write), t_3 (ref)
	if var52 and var44 then
		var44:UnequipTools()
		
		if var52 then
			var52:ToggleSelect()
			t_3[var52]:UpdateEquipView()
			var52 = nil
		end
	end
end

userInputService.Changed:connect(OnUISChanged)
local var103 = userInputService.KeyboardEnabled and not VRService.VREnabled

for i_2 = 1, var61 do
	t_2[i_2]:TurnNumber(var103)
end
if userInputService:GetGamepadConnected(Enum.UserInputType.Gamepad1) then
	gamepadConnected()
end
userInputService.GamepadConnected:connect(function(p64) --[[ line: 1882 ]]
	if p64 == Enum.UserInputType.Gamepad1 then
		gamepadConnected()
	end
end)
userInputService.GamepadDisconnected:connect(function(p65) --[[ line: 1887 ]]
	if p65 == Enum.UserInputType.Gamepad1 then
		gamepadDisconnected()
	end
end)

function t.TopbarEnabledChanged(_, p66) --[[ line: 1894 ]]
	-- upvalues: var33 (write), OnCoreGuiChanged (ref), starterGuiService (ref)
	var33 = p66
	OnCoreGuiChanged(Enum.CoreGuiType.Backpack, starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack))
end

if fFlagTopBarSignalizeSetCores then
	t.disposeEffect = signalsModule.createEffect(function(p67) --[[ line: 1901 ]]
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
	settingsShowSignal:connect(function(p68) --[[ line: 1916 ]]
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
guiService.MenuOpened:Connect(function() --[[ line: 1927 ]]
	-- upvalues: t (ref), isInExperienceUIVREnabled (ref), inExperienceUIVRIXP (ref), VRService (ref)
	if t.IsOpen then
		if if isInExperienceUIVREnabled and not inExperienceUIVRIXP:isMovePanelToCenter() then not VRService.VREnabled else true then
			t.OpenClose()
		end
	end
end)
inExperienceAppChatModalModule.default.visibilitySignal.Event:Connect(function(p69) --[[ line: 1936 ]]
	-- upvalues: t (ref)
	if p69 and t.IsOpen then
		t.OpenClose()
	end
end)
userGameSettingsService:GetPropertyChangedSignal("PreferredTransparency"):connect(function() --[[ line: 1942 | named "OnPreferredTransparencyChanged" ]]
	-- upvalues: userGameSettingsService (ref), var13 (write), var39 (write), var17 (write), t_2 (ref), var22 (write), var93 (ref)
	local preferredTransparency = userGameSettingsService.PreferredTransparency
	var13 = 0.5 * userGameSettingsService.PreferredTransparency
	var39.BackgroundTransparency = var13
	var17 = 0.5 * preferredTransparency
	
	for i, v in ipairs(t_2) do
		v.Frame.BackgroundTransparency = var17
	end
	var22 = 0.15 * userGameSettingsService.PreferredTransparency
	var93.BackgroundTransparency = var22
end)

return t