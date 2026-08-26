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

local function _()
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
local var1 = 60
local size14 = Enum.FontSize.Size14
local var2 = 0.5 * userGameSettingsService.PreferredTransparency
local color3 = Color3.new(0.121568627451, 0.121568627451, 0.121568627451)
local color3_1 = Color3.new(0.192156862745, 0.192156862745, 0.192156862745)
local color3_2 = Color3.new(0.352941176471, 0.556862745098, 0.913725490196)
local var3 = 0.5 * userGameSettingsService.PreferredTransparency
local color3_3 = Color3.new(1, 1, 1)
local _ = UDim2.new(0, 14, 0, 9)
local value = Enum.KeyCode.Backquote.Value
local color3_4 = Color3.new(0, 0.635294117647, 1)
local var4 = "   Search"
local color3_5 = Color3.new(0.37, 0.37, 0.37)
local var5 = 0.15 * userGameSettingsService.PreferredTransparency
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
local var6 = require(modules.TenFootInterface):IsEnabled()
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local gameTranslatorModule = require(modules.GameTranslator)
pcall(function()
	-- upvalues: var4 (write), robloxTranslatorModule (ref)
	var4 = robloxTranslatorModule:FormatByKey("InGame.UnknownNamespace.BACKPACK_SEARCH")
end)
local var7 = true

if var6 then
	var1 = 100
	size14 = Enum.FontSize.Size24
end
local var8 = false
local _ = nil
local var9 = if fFlagBackpackResponsiveUnits then responsiveModule.GetInputModeStore().getPreferredInputType() == responsiveModule.Input.Touch and guiService:GetScreenResolution().X < 1024 else userInputService.TouchEnabled and guiService:GetScreenResolution().X < 1024
local localPlayer = playersService.LocalPlayer
local var10 = nil
local var11 = nil
local var12 = nil
local _ = nil
local var13 = nil
local var14 = nil
local var15 = nil
local var16 = nil
local _ = nil
local _ = nil
local _ = nil
local var17 = nil
local var18 = nil
local var19 = nil
local t_2 = {}
local var20 = nil
local t_3 = {}
local t_4 = {}
local t_5 = {}
local var21 = 0
local var22 = nil
local var23 = false
local var24 = false
local var25 = false
local var26 = false
local t_6 = {}
local t_7 = {}
local var27 = false
local var28 = 0
local var29 = if var9 then 3 else 10
local var30 = if var9 then 2 else 4
local var31 = nil
t.BackpackEmpty = create("BindableEvent")({ Name = "BackpackEmpty" })
t.BackpackItemAdded = create("BindableEvent")({ Name = "BackpackAdded" })
t.BackpackItemRemoved = create("BindableEvent")({ Name = "BackpackRemoved" })

local function NewGui(p1, p2)
	-- upvalues: size14 (write)
	local var32 = Instance.new(p1)
	var32.Name = p2
	var32.BackgroundColor3 = Color3.new(0, 0, 0)
	var32.BackgroundTransparency = 1
	var32.BorderColor3 = Color3.new(0, 0, 0)
	var32.BorderSizePixel = 0
	var32.Size = UDim2.new(1, 0, 1, 0)
	
	if p1:match("Text") then
		var32.TextColor3 = Color3.new(1, 1, 1)
		var32.Text = ""
		var32.Font = Enum.Font.SourceSans
		var32.FontSize = size14
		var32.TextWrapped = true
		
		if p1 == "TextButton" then
			var32.Font = Enum.Font.SourceSansBold
			var32.BorderSizePixel = 1
		end
	end
	return var32
end

local _ = function()
	-- upvalues: var29 (write), t_2 (ref)
	for i = 1, var29 do
		local var32 = t_2[i]
		
		if var32.Tool then
			continue
		end
		return var32
	end
	return nil
end

function t.isInventoryEmpty()
	-- upvalues: var29 (write), t_2 (ref)
	for i = var29 + 1, #t_2 do
		local var33 = t_2[i]
		
		if not var33 or not var33.Tool then
			continue
		end
		return false
	end
	return true
end

local _ = function()
	return false
end

local function AdjustHotbarFrames(p1)
	-- upvalues: var13 (write), var29 (write), var21 (write), enableHotbarHide (ref), t_2 (ref), var12 (write), t (ref)
	local visible = var13.Visible
	local var34 = if visible then var29 else var21
	local var35 = 0
	local var36 = if enableHotbarHide then var34 >= 1 and not p1 else var34 >= 1
	
	for i = 1, var29 do
		local var37 = t_2[i]
		
		if (if enableHotbarHide then var37.Tool and not p1 else var37.Tool) or visible then
			var35 += 1
			var37:Readjust(var35, var34)
			var37.Frame.Visible = true
		else
			var37.Frame.Visible = false
		end
	end
	local var38 = not visible
	
	if var38 then
		var38 = var36
		
		if not var38 then
			local var39
			for i_1 = var29 + 1, #t_2 do
				local var40 = t_2[i_1]
				
				if not var40 or not var40.Tool then
					continue
				end
				var39 = false
				var38 = not var39
			end
			var39 = true
		end
	end
	var12.Visible = var38
	var12.Position = UDim2.new(0.5, -15, 1, if var36 then -110 else -50)
	t.IsHotbarVisible = var36
end

local function UpdateScrollingFrameCanvasSize()
	-- upvalues: var15 (write), var1 (write), var16 (write)
	var15.CanvasSize = UDim2.new(0, 0, 0, math.ceil((#var16:GetChildren() - 1) / math.floor(var15.AbsoluteSize.X / (var1 + 5))) * (var1 + 5) + 5)
end

local function AdjustInventoryFrames()
	-- upvalues: var29 (write), t_2 (ref), UpdateScrollingFrameCanvasSize (ref)
	for i = var29 + 1, #t_2 do
		local var41 = t_2[i]
		var41.Frame.LayoutOrder = var41.Index
		var41.Frame.Visible = var41.Tool ~= nil
	end
	UpdateScrollingFrameCanvasSize()
end

local function UpdateBackpackLayout()
	-- upvalues: var11 (write), var29 (write), var1 (write), var13 (write), var30 (ref), var15 (write), AdjustHotbarFrames (ref), AdjustInventoryFrames (ref)
	var11.Size = UDim2.new(0, 5 + var29 * (var1 + 5), 0, var1 + 5 + 5)
	var11.Position = UDim2.new(0.5, -var11.Size.X.Offset / 2, 1, -var11.Size.Y.Offset)
	var13.Size = UDim2.new(0, var11.Size.X.Offset, 0, var11.Size.Y.Offset * var30 + 40)
	var13.Position = UDim2.new(0.5, -var13.Size.X.Offset / 2, 1, var11.Position.Y.Offset - var13.Size.Y.Offset)
	var15.Size = UDim2.new(1, var15.ScrollBarThickness + 1, 1, -40)
	var15.Position = UDim2.new(0, 0, 0, 40)
	AdjustHotbarFrames()
	AdjustInventoryFrames()
end

local _ = function(value, minValue, maxValue)
	return math.min(minValue, math.max(value, maxValue))
end

local _ = function(p2, p3, p4)
	local absolutePosition = p2.AbsolutePosition
	local absoluteSize = p2.AbsoluteSize
	
	return absolutePosition.X < p3 and (p3 <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y < p4 and p4 <= absolutePosition.Y + absoluteSize.Y))
end

local _ = function(value, p2)
	return (value.AbsolutePosition + value.AbsoluteSize / 2 - p2).magnitude
end

local _ = function()
	-- upvalues: var22 (write), t_3 (ref)
	var22:ToggleSelect()
	t_3[var22]:UpdateEquipView()
	var22 = nil
end

local _ = function()
	-- upvalues: var18 (write), var22 (write), t_3 (ref)
	if var18 then
		var18:UnequipTools()
		
		if var22 then
			var22:ToggleSelect()
			t_3[var22]:UpdateEquipView()
			var22 = nil
		end
	end
end

local function EquipNewTool(p2)
	-- upvalues: var18 (write), var22 (write), t_3 (ref), SAToolEquipLuauFlag (ref), localPlayer (write), var17 (write)
	if var18 then
		local var42
		var18:UnequipTools()
		
		if var22 then
			var22:ToggleSelect()
			t_3[var22]:UpdateEquipView()
			var22 = nil
		end
	end
	if p2:IsA("HopperBin") then
		p2:ToggleSelect()
		t_3[p2]:UpdateEquipView()
		var22 = p2
		
		return
	elseif SAToolEquipLuauFlag and game:GetEngineFeature("SAToolEquipEngineFeature") then
		var42 = workspace.AuthorityMode == Enum.AuthorityMode.Server
		var42 = nil
	else
		var42 = false
	end
	if var42 then
		localPlayer:RequestTool(p2)
	end
	p2.Parent = var17
end

local _ = function(p2)
	-- upvalues: var17 (write)
	return p2 and (if p2:IsA("HopperBin") then p2.Active else p2.Parent == var17)
end

local function MakeSlot(p2, p3)
	-- upvalues: t_2 (ref), var3 (write), color3_1 (ref), color3 (ref), var11 (write), var1 (write), gameTranslatorModule (ref), var29 (write), var13 (write), var21 (write), var24 (write), var8 (write), contextActionService (ref), t_3 (ref), var20 (write), var17 (write), var31 (write), NewGui (ref), color3_2 (ref), t_5 (ref), UpdateScrollingFrameCanvasSize (ref), SAToolEquipLuauFlag (ref), localPlayer (write), var18 (write), var22 (write), var19 (write), EquipNewTool (ref), color3_3 (ref), MakeSlot (ref), var16 (write), var26 (write), t_4 (ref), value_1 (ref), var15 (write)
	p3 = p3 or #t_2 + 1
	p3 = { Tool = nil, Index = p3, Frame = nil }
	local var42 = nil
	local var43 = nil
	local var44 = nil
	local var45 = nil
	local var46 = nil
	local var47 = nil
	local _ = nil
	local var48 = nil
	local var49 = nil
	
	local function _()
		-- upvalues: var42 (write), var3 (copy), color3_1 (copy), color3 (copy)
		var42.SelectionImageObject = nil
		var42.BackgroundTransparency = if var42.Draggable then 0 else var3
		var42.BackgroundColor3 = if var42.Draggable then color3_1 else color3
	end
	
	function p10.Readjust(_, p4, p5)
		-- upvalues: var11 (copy), var1 (copy), var42 (write)
		var42.Position = UDim2.new(0, var11.Size.X.Offset / 2 - var1 / 2 + (var1 + 5) * (p4 - (p5 / 2 + 0.5)), 0, 5)
	end
	
	function p10.Fill(p4, p5)
		-- upvalues: var44 (write), var45 (write), gameTranslatorModule (copy), var48 (write), var46 (write), var29 (copy), var13 (copy), var42 (write), var21 (copy), var24 (copy), var8 (copy), contextActionService (copy), t_3 (copy), var20 (copy), t_2 (copy)
		if not p5 then
			return p4:Clear()
		end
		p4.Tool = p5
		
		local function assignToolData()
			-- upvalues: p5 (ref), var44 (copy), var45 (copy), gameTranslatorModule (copy), var48 (copy)
			local textureId = p5.TextureId
			var44.Image = textureId
			
			if textureId == "" then
				var45.Visible = true
			else
				var45.Visible = false
			end
			gameTranslatorModule:TranslateAndRegister(var45, p5, p5.Name)
			
			if var48 and p5:IsA("Tool") then
				gameTranslatorModule:TranslateAndRegister(var48, p5, p5.ToolTip)
				local var50 = var48.TextBounds.X + 6
				var48.Size = UDim2.new(0, var50, 0, 16)
				var48.Position = UDim2.new(0.5, -var50 / 2, 0, -25)
			end
		end
		
		assignToolData()
		
		if var46 then
			var46:disconnect()
			var46 = nil
		end
		var46 = p5.Changed:connect(function(p6)
			-- upvalues: assignToolData (ref)
			if p6 == "TextureId" or p6 == "Name" or p6 == "ToolTip" then
				assignToolData()
			end
		end)
		local var50 = p4.Index <= var29
		
		if not var50 or var13.Visible then
			var42.Draggable = true
		end
		p4:UpdateEquipView()
		
		if var50 then
			var21 += 1
			
			if var24 and var21 >= 1 and not var8 then
				var8 = true
				contextActionService:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
			end
		end
		local var51, var52
		t_3[p5] = p4
		
		for i = 1, var29 do
			var51 = t_2[i]
			
			if var51.Tool then
				continue
			end
			var52 = var51
			var20 = var52
			
			return
		end
		var52 = nil
	end
	
	function p10.Clear(p6)
		-- upvalues: var46 (write), var44 (write), var45 (write), var48 (write), var42 (write), var29 (copy), var21 (copy), var8 (copy), contextActionService (copy), t_3 (copy), var20 (copy), t_2 (copy)
		if not p6.Tool then return end
		if var46 then
			var46:disconnect()
			var46 = nil
		end
		var44.Image = ""
		var45.Text = ""
		
		if var48 then
			var48.Text = ""
			var48.Visible = false
		end
		var42.Draggable = false
		p6:UpdateEquipView(true)
		
		if p6.Index <= var29 then
			var21 -= 1
			
			if var21 < 1 then
				var8 = false
				contextActionService:UnbindAction("RBXHotbarEquip")
			end
		end
		local var53, var54
		t_3[p6.Tool] = nil
		p6.Tool = nil
		
		for i = 1, var29 do
			var53 = t_2[i]
			
			if var53.Tool then
				continue
			end
			var54 = var53
			var20 = var54
			
			return
		end
		var54 = nil
	end
	
	function p10.UpdateEquipView(p7, p8)
		-- upvalues: var17 (copy), var31 (copy), p3 (ref), var47 (write), NewGui (copy), var42 (write), color3_2 (copy), var3 (copy), color3_1 (copy), color3 (copy)
		if not p8 then
			local tool = p7.Tool
			
			if tool and (if tool:IsA("HopperBin") then tool.Active else tool.Parent == var17) then
				var31 = p3
				
				if not var47 then
					var47 = NewGui("Frame", "Equipped")
					var47.ZIndex = var42.ZIndex
					
					for i, v in pairs({
						{ 0.1, 1, 0, 0 },
						{ 0.8, 0.1, 0.1, 0 },
						{ 0.1, 1, 0.9, 0 },
						{ 0.8, 0.1, 0.1, 0.9 }
					}) do
						local var55 = NewGui("Frame", "Edge")
						var55.BackgroundTransparency = 0
						var55.BackgroundColor3 = color3_2
						var55.Size = UDim2.new(v[1], 0, v[2], 0)
						var55.Position = UDim2.new(v[3], 0, v[4], 0)
						var55.ZIndex = var47.ZIndex
						var55.Parent = var47
					end
				end
				var47.Parent = var42
			elseif var47 then
				var47.Parent = nil
			end
			var42.SelectionImageObject = nil
			var42.BackgroundTransparency = if var42.Draggable then 0 else var3
			var42.BackgroundColor3 = if var42.Draggable then color3_1 else color3
		end
	end
	
	function p10.IsEquipped(p9)
		-- upvalues: var17 (copy)
		local tool = p9.Tool
		
		return tool and (if tool:IsA("HopperBin") then tool.Active else tool.Parent == var17)
	end
	
	function p10.Delete(p9)
		-- upvalues: t_5 (copy), var42 (write), t_2 (copy), UpdateScrollingFrameCanvasSize (copy)
		t_5[var42] = nil
		var42:Destroy()
		table.remove(t_2, p9.Index)
		
		for i = p9.Index, #t_2 do
			t_2[i]:SlideBack()
		end
		UpdateScrollingFrameCanvasSize()
	end
	
	function p10.Swap(p10, p11)
		local tool = p10.Tool
		local tool_1 = p11.Tool
		p10:Clear()
		
		if tool_1 then
			p11:Clear()
			p10:Fill(tool_1)
		end
		if tool then
			p11:Fill(tool)
			
			return
		end
		p11:Clear()
	end
	
	function p10.SlideBack(p10)
		-- upvalues: var42 (write)
		p10.Index -= 1
		var42.Name = p10.Index
		var42.LayoutOrder = p10.Index
	end
	
	function p10.TurnNumber(_, p10)
		-- upvalues: var49 (write)
		if var49 then
			var49.Visible = p10
		end
	end
	
	function p10.SetClickability(value, p10)
		-- upvalues: var42 (write), var3 (copy), color3_1 (copy), color3 (copy)
		if value.Tool then
			var42.Draggable = not p10
			var42.SelectionImageObject = nil
			var42.BackgroundTransparency = if var42.Draggable then 0 else var3
			var42.BackgroundColor3 = if var42.Draggable then color3_1 else color3
		end
	end
	
	function p10.CheckTerms(p10, p11)
		-- upvalues: var45 (write), var48 (write)
		local var56 = 0
		
		local function _(p12, p13)
			-- upvalues: var56 (write)
			local _, var57 = p12:lower():gsub(p13, "")
			var56 += var57
		end
		
		local tool = p10.Tool
		
		if tool then
			for i in pairs(p11) do
				local var57, var58 = var45.Text:lower():gsub(i, "")
				var56 += var58
				
				if tool:IsA("Tool") then
					var57, var141 = (if var48 then var48.Text else ""):lower():gsub(i, "")
					var56 += var141
				end
			end
		end
		return var56
	end
	
	function p10.Select(_, p12)
		-- upvalues: p3 (ref), var17 (copy), SAToolEquipLuauFlag (copy), localPlayer (copy), var18 (copy), var22 (copy), t_3 (copy), var19 (copy), EquipNewTool (copy)
		if p12 then return end
		local tool = p3.Tool
		
		if tool then
			if tool and (if tool:IsA("HopperBin") then tool.Active else tool.Parent == var17) then
				local var59
				if SAToolEquipLuauFlag and game:GetEngineFeature("SAToolEquipEngineFeature") then
					var59 = workspace.AuthorityMode == Enum.AuthorityMode.Server
					var59 = nil
				else
					var59 = false
				end
				if var59 and not tool:IsA("HopperBin") then
					localPlayer:RequestTool(nil)
				end
				if var18 then
					var18:UnequipTools()
					
					if var22 then
						var22:ToggleSelect()
						t_3[var22]:UpdateEquipView()
						var22 = nil
						
						return
					end
				end
			elseif tool.Parent == var19 then
				EquipNewTool(tool)
			end
		end
	end
	
	var42 = NewGui("TextButton", p3)
	var42.BackgroundColor3 = color3
	var42.BorderColor3 = color3_3
	var42.Text = ""
	var42.AutoButtonColor = false
	var42.BorderSizePixel = 0
	var42.Size = UDim2.new(0, var1, 0, var1)
	var42.Active = true
	var42.Draggable = false
	var42.BackgroundTransparency = var3
	var42.MouseButton1Click:connect(function()
		-- upvalues: p3 (ref)
		changeSlot(p3)
	end)
	p3.Frame = var42
	local var59 = NewGui("Frame", "SelectionObjectClipper")
	var59.Visible = false
	var59.Parent = var42
	local var60 = NewGui("ImageLabel", "Selector")
	var60.Size = UDim2.new(1, 0, 1, 0)
	var60.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png"
	var60.ScaleType = Enum.ScaleType.Slice
	var60.SliceCenter = Rect.new(12, 12, 52, 52)
	var60.Parent = var59
	var44 = NewGui("ImageLabel", "Icon")
	var44.Size = UDim2.new(0.8, 0, 0.8, 0)
	var44.Position = UDim2.new(0.1, 0, 0.1, 0)
	var44.Parent = var42
	var45 = NewGui("TextLabel", "ToolName")
	var45.Size = UDim2.new(1, -2, 1, -2)
	var45.Position = UDim2.new(0, 1, 0, 1)
	var45.Parent = var42
	p3.Frame.LayoutOrder = p3.Index
	
	if p3 <= var29 then
		var48 = NewGui("TextLabel", "ToolTip")
		var48.TextWrapped = false
		var48.TextYAlignment = Enum.TextYAlignment.Top
		var48.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
		var48.BackgroundTransparency = 0
		var48.Visible = false
		var48.Parent = var42
		var42.MouseEnter:connect(function()
			-- upvalues: var48 (write)
			if var48.Text ~= "" then
				var48.Visible = true
			end
		end)
		var42.MouseLeave:connect(function()
			-- upvalues: var48 (write)
			var48.Visible = false
		end)
		
		function p10.MoveToInventory(p12)
			-- upvalues: p3 (ref), var29 (copy), MakeSlot (copy), var16 (copy), var17 (copy), var18 (copy), var22 (copy), t_3 (copy), var26 (copy), var13 (copy)
			if p3.Index <= var29 then
				local tool = p3.Tool
				p12:Clear()
				local var61 = MakeSlot(var16)
				var61:Fill(tool)
				
				if tool and (if tool:IsA("HopperBin") then tool.Active else tool.Parent == var17) and var18 then
					var18:UnequipTools()
					
					if var22 then
						var22:ToggleSelect()
						t_3[var22]:UpdateEquipView()
						var22 = nil
					end
				end
				if var26 then
					var61.Frame.Visible = false
					var61.Parent = var13
				end
			end
		end
		
		if p3 < 10 or p3 == var29 then
			local var61 = if p3 < 10 then p3 else 0
			var49 = NewGui("TextLabel", "Number")
			var49.Text = var61
			var49.Size = UDim2.new(0.15, 0, 0.15, 0)
			var49.Visible = false
			var49.Parent = var42
			
			t_4[value_1 + var61] = function(p12)
				-- upvalues: p3 (ref)
				p3:Select(p12)
			end
		end
	end
	local position = var42.Position
	local var62 = 0
	local var63 = nil
	var42.DragBegin:connect(function(p12)
		-- upvalues: t_5 (copy), var42 (write), position (write), var44 (write), var45 (write), var49 (write), var47 (write), var63 (write), var16 (copy), var13 (copy), var43 (write), NewGui (copy)
		t_5[var42] = true
		position = p12
		var42.BorderSizePixel = 2
		var42.ZIndex = 2
		var44.ZIndex = 2
		var45.ZIndex = 2
		var42.Parent.ZIndex = 2
		
		if var49 then
			var49.ZIndex = 2
		end
		if var47 then
			var47.ZIndex = 2
			
			for i, v in pairs(var47:GetChildren()) do
				v.ZIndex = 2
			end
		end
		var63 = var42.Parent
		
		if var63 == var16 then
			local _ = var42.AbsolutePosition
			local uDim2 = UDim2.new(0, var42.AbsolutePosition.X - var13.AbsolutePosition.X, 0, var42.AbsolutePosition.Y - var13.AbsolutePosition.Y)
			var42.Parent = var13
			var42.Position = uDim2
			var43 = NewGui("Frame", "FakeSlot")
			var43.LayoutOrder = var42.LayoutOrder
			var43.Size = var42.Size
			var43.BackgroundTransparency = 1
			var43.Parent = var16
		end
	end)
	var42.DragStopped:connect(function(p13, p14)
		-- upvalues: var43 (write), var42 (write), position (write), var63 (write), var44 (write), var45 (write), var49 (write), var47 (write), t_5 (copy), p3 (ref), var13 (copy), var29 (copy), var62 (write), var20 (copy), var11 (copy), t_2 (copy), var17 (copy), var18 (copy), var22 (copy), t_3 (copy), var26 (copy)
		if var43 then
			var43:Destroy()
		end
		local currentTime = tick()
		var42.Position = position
		var42.Parent = var63
		var42.BorderSizePixel = 0
		var42.ZIndex = 1
		var44.ZIndex = 1
		var45.ZIndex = 1
		var63.ZIndex = 1
		
		if var49 then
			var49.ZIndex = 1
		end
		if var47 then
			var47.ZIndex = 1
			
			for i, v in pairs(var47:GetChildren()) do
				v.ZIndex = 1
			end
		end
		t_5[var42] = nil
		
		if not p3.Tool then return end
		local absolutePosition = var13.AbsolutePosition
		local absoluteSize = var13.AbsoluteSize
		
		if absolutePosition.X < p13 and (p13 <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y < p14 and p14 <= absolutePosition.Y + absoluteSize.Y)) then
			if p3.Index <= var29 then
				p3:MoveToInventory()
			end
			if var29 < p3.Index and currentTime - var62 < 0.5 then
				if var20 then
					local tool = p3.Tool
					p3:Clear()
					var20:Fill(tool)
					p3:Delete()
				end
				currentTime = 0
			end
		else
			absolutePosition = var11.AbsolutePosition
			absoluteSize = var11.AbsoluteSize
			
			if absolutePosition.X < p13 and (p13 <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y < p14 and p14 <= absolutePosition.Y + absoluteSize.Y)) then
				local list = { 1e999, nil }
				
				for absoluteSize = 1, var29 do
					local var64 = t_2[absoluteSize]
					local frame = var64.Frame
					local magnitude = (frame.AbsolutePosition + frame.AbsoluteSize / 2 - Vector2.new(p13, p14)).magnitude
					
					if magnitude < list[1] then
						list = { magnitude, var64 }
					end
				end
				local var65 = list[2]
				
				if var65 ~= p3 then
					p3:Swap(var65)
					
					if var29 < p3.Index then
						absolutePosition = p3.Tool
						
						if absolutePosition then
							if absolutePosition and (if absolutePosition:IsA("HopperBin") then absolutePosition.Active else absolutePosition.Parent == var17) and var18 then
								var18:UnequipTools()
								
								if var22 then
									var22:ToggleSelect()
									t_3[var22]:UpdateEquipView()
									var22 = nil
								end
							end
							if var26 then
								p3.Frame.Visible = false
								p3.Frame.Parent = var13
							end
						else
							p3:Delete()
						end
					end
				end
			elseif p3.Index <= var29 then
				p3:MoveToInventory()
			end
		end
		var62 = currentTime
	end)
	var42.Parent = p2
	t_2[p3] = p3
	
	if var29 < p3 then
		UpdateScrollingFrameCanvasSize()
		
		if var13.Visible and not var26 then
			var15.CanvasPosition = Vector2.new(0, math.max(0, var15.CanvasSize.Y.Offset - var15.AbsoluteSize.Y))
		end
	end
	return p3
end

local _ = function(value)
	-- upvalues: var29 (write), t_2 (ref), MakeSlot (ref), var11 (write), var20 (write), var21 (write), UpdateBackpackLayout (ref)
	if var29 ~= value then
		local var66 = var29
		
		if value < var66 then
			for i = var66, value + 1, -1 do
				local var67 = t_2[i]
				
				if var67 then
					var67:MoveToInventory()
					var67:Delete()
				end
			end
			for i_1 = var66, value + 1, -1 do
				local var68 = t_2[i_1]
				
				if not var68.Tool then
					var68:Delete()
				end
			end
		else
			for i_2 = var66, value do
				var29 = i_2
				
				if not t_2[i_2] then
					local var69 = MakeSlot(var11, i_2)
					var69.Frame.Visible = false
					
					if not var20 then
						var20 = var69
					end
				end
				local _ = t_2[i_2]
				local tool = t_2[i_2].Tool
				local var70 = MakeSlot(var11, i_2)
				
				if tool then
					var70:Fill(tool)
				elseif not var20 then
					var20 = var70
				end
			end
		end
		var29 = value
		var21 = 0
		
		for i_2 = 1, var29 do
			if t_2[i_2] and t_2[i_2].Tool then
				var21 += 1
			end
		end
		UpdateBackpackLayout()
	end
end

local function OnChildAdded(p15)
	-- upvalues: var17 (write), var18 (write), var28 (write), var22 (write), t_3 (ref), var23 (write), localPlayer (write), var20 (write), MakeSlot (ref), var16 (write), t_2 (ref), var19 (write), AdjustHotbarFrames (ref), var29 (write), var13 (write), t (ref)
	if p15:IsA("Tool") or p15:IsA("HopperBin") then
		if p15.Parent == var17 then
			var28 = tick()
		end
		if var22 and p15.Parent == var17 then
			var22:ToggleSelect()
			t_3[var22]:UpdateEquipView()
			var22 = nil
		end
		if not var23 and p15.Parent == var17 and not t_3[p15] then
			local starterGear = localPlayer:FindFirstChild("StarterGear")
			
			if starterGear and starterGear:FindFirstChild(p15.Name) then
				var23 = true
				
				for i = (var20 or MakeSlot(var16)).Index, 1, -1 do
					local var71 = t_2[i]
					local var72 = i - 1
					
					if var72 > 0 then
						t_2[var72]:Swap(var71)
					else
						var71:Fill(p15)
					end
				end
				for i_1, v in pairs(var17:GetChildren()) do
					if v:IsA("Tool") and v ~= p15 then
						v.Parent = var19
					end
				end
				AdjustHotbarFrames()
				
				return
			else
				local var73 = t_3[p15]
				
				if var73 then
					var73:UpdateEquipView()
				else
					var73 = var20 or MakeSlot(var16)
					var73:Fill(p15)
					
					if var73.Index <= var29 and not var13.Visible then
						AdjustHotbarFrames()
					end
					if p15:IsA("HopperBin") and p15.Active then
						if var18 then
							var18:UnequipTools()
							
							if var22 then
								var22:ToggleSelect()
								t_3[var22]:UpdateEquipView()
								var22 = nil
							end
						end
						var22 = p15
					end
				end
				t.BackpackItemAdded:Fire()
				
				return
			end
		end
	elseif p15:IsA("Humanoid") and p15.Parent == var17 then
		var18 = p15
	end
end

local function OnChildRemoved(p16)
	-- upvalues: var28 (write), var17 (write), var19 (write), t_3 (ref), var29 (write), var13 (write), AdjustHotbarFrames (ref), var22 (write), t (ref), t_2 (ref)
	if not p16:IsA("Tool") and not p16:IsA("HopperBin") then return end
	var28 = tick()
	local parent = p16.Parent
	
	if parent == var17 or parent == var19 then return end
	local var74 = t_3[p16]
	
	if var74 then
		var74:Clear()
		
		if var29 < var74.Index then
			var74:Delete()
		elseif not var13.Visible then
			AdjustHotbarFrames()
		end
	end
	if p16 == var22 then
		var22 = nil
	end
	local var75
	t.BackpackItemRemoved:Fire()
	
	for i = var29 + 1, #t_2 do
		local var76 = t_2[i]
		
		if not var76 or not var76.Tool then
			continue
		end
		var75 = false
		if var75 then
			t.BackpackEmpty:Fire()
		end
		return
	end
	var75 = true
end

local function OnCharacterAdded(p17)
	-- upvalues: t_2 (ref), var29 (write), var22 (write), t_7 (write), var17 (write), OnChildRemoved (ref), OnChildAdded (ref), var19 (write), localPlayer (write), AdjustHotbarFrames (ref)
	for i = #t_2, 1, -1 do
		local var77 = t_2[i]
		
		if var77.Tool then
			var77:Clear()
		end
		if var29 < i then
			var77:Delete()
		end
	end
	var22 = nil
	
	for i_1, v in pairs(t_7) do
		v:disconnect()
	end
	t_7 = {}
	var17 = p17
	table.insert(t_7, p17.ChildRemoved:connect(OnChildRemoved))
	table.insert(t_7, p17.ChildAdded:connect(OnChildAdded))
	
	for i_2, v_1 in pairs(p17:GetChildren()) do
		OnChildAdded(v_1)
	end
	var19 = localPlayer:WaitForChild("Backpack")
	table.insert(t_7, var19.ChildRemoved:connect(OnChildRemoved))
	table.insert(t_7, var19.ChildAdded:connect(OnChildAdded))
	
	for i_3, v_2 in pairs(var19:GetChildren()) do
		OnChildAdded(v_2)
	end
	AdjustHotbarFrames()
end

local function OnInputBegan(p18, p19)
	-- upvalues: var25 (write), var24 (write), value_2 (ref), t_4 (ref), var13 (write), t (ref)
	if p18.UserInputType == Enum.UserInputType.Keyboard and not var25 and (var24 or p18.KeyCode.Value == value_2) then
		local value = t_4[p18.KeyCode.Value]
		
		if value then
			value(p19)
		end
	end
	local userInputType = p18.UserInputType
	
	if not p19 and (userInputType == Enum.UserInputType.MouseButton1 or userInputType == Enum.UserInputType.Touch) and var13.Visible then
		t.OpenClose()
	end
end

local function OnUISChanged(p18)
	-- upvalues: userInputService (ref), VRService (ref), var29 (write), t_2 (ref)
	if p18 == "KeyboardEnabled" or p18 == "VREnabled" then
		local var78 = userInputService.KeyboardEnabled and not VRService.VREnabled
		
		for i = 1, var29 do
			t_2[i]:TurnNumber(var78)
		end
	end
end

local var79 = nil
local var80 = nil

local var81 = function() end

local vector2 = Vector2.new(0, 0)

function unbindAllGamepadEquipActions()
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindAction("RBXBackpackHasGamepadFocus")
	contextActionService:UnbindAction("RBXCloseInventory")
end

local _ = function(value, p19)
	-- upvalues: var29 (write), t_2 (ref)
	for i = 1, var29 do
		local var82 = t_2[i]
		
		if var82 and var82.Frame and (p19 or var82.Tool) then
			var82.Frame.Visible = value
		end
	end
end

local function getInputDirection(p20)
	-- upvalues: vector2 (write)
	local var83 = if p20.UserInputState == Enum.UserInputState.End then -1 else 1
	
	if p20.KeyCode == Enum.KeyCode.Thumbstick1 then
		local magnitude = p20.Position.magnitude
		vector2 = if magnitude > 0.98 then Vector2.new(p20.Position.x / magnitude, -p20.Position.y / magnitude) else Vector2.new(0, 0)
	else
		vector2 = if p20.KeyCode == Enum.KeyCode.DPadLeft then Vector2.new(vector2.x - var83 * 1, vector2.y) elseif p20.KeyCode == Enum.KeyCode.DPadRight then Vector2.new(vector2.x + var83 * 1, vector2.y) elseif p20.KeyCode == Enum.KeyCode.DPadUp then Vector2.new(vector2.x, vector2.y - var83 * 1) elseif p20.KeyCode == Enum.KeyCode.DPadDown then Vector2.new(vector2.x, vector2.y + var83 * 1) else Vector2.new(0, 0)
	end
	return vector2
end

local _ = function(_, _, p20)
	-- upvalues: getInputDirection (ref), var29 (write), t_2 (ref), var18 (write), var22 (write), t_3 (ref)
	local var83 = getInputDirection(p20)
	
	if var83 == Vector2.new(0, 0) then return end
	local var84 = math.atan2(var83.y, var83.x) - -1.570796326795
	
	if var84 < 0 then
		var84 += 6.28318530718
	end
	local floored = math.floor(var84 / 0.785398163397 + 1 + 0.5)
	
	if var29 < floored then
		floored = 1
	end
	if floored > 0 then
		local var85 = t_2[floored]
		
		if var85 and var85.Tool and not var85:IsEquipped() then
			var85:Select()
			
			return
		end
	elseif var18 then
		var18:UnequipTools()
		
		if var22 then
			var22:ToggleSelect()
			t_3[var22]:UpdateEquipView()
			var22 = nil
		end
	end
end

function changeToolFunc(_, p20, p21)
	-- upvalues: var79 (write), var80 (write), var18 (write), var22 (write), t_3 (ref), var29 (write), t_2 (ref), var31 (write)
	if p20 ~= Enum.UserInputState.Begin then return end
	if not var79 or (var79.KeyCode ~= Enum.KeyCode.ButtonR1 or p21.KeyCode ~= Enum.KeyCode.ButtonL1) and (var79.KeyCode ~= Enum.KeyCode.ButtonL1 or p21.KeyCode ~= Enum.KeyCode.ButtonR1) or tick() - var80 > 0.06 then
		var79 = p21
		var80 = tick()
		delay(0.06, function()
			-- upvalues: var79 (copy), p21 (ref), var29 (copy), t_2 (copy), var18 (copy), var22 (copy), t_3 (copy), var31 (copy)
			if var79 ~= p21 then return end
			local var83
			local var84 = if p21.KeyCode == Enum.KeyCode.ButtonL1 then -1 else 1
			
			for i = 1, var29 do
				if not t_2[i]:IsEquipped() then
					continue
				end
				var83 = var84 + i
				local var85 = false
				
				if var29 < var83 then
					var83 = 1
					var85 = true
				elseif var83 < 1 then
					var83 = var29
					var85 = true
				end
				local var86 = var83
				while not t_2[var83].Tool do
					var83 += var84
					
					if var83 ~= var86 then
						if var29 < var83 then
							var83 = 1
							var85 = true
						elseif var83 < 1 then
							var83 = var29
							var85 = true
						end
					end
					return
				end
				if var85 then
					if var18 then
						var18:UnequipTools()
						
						if var22 then
							var22:ToggleSelect()
							t_3[var22]:UpdateEquipView()
							var22 = nil
						end
					end
					var31 = nil
					
					return
				else
					t_2[var83]:Select()
					
					return
				end
			end
			if var31 and var31.Tool then
				var31:Select()
				
				return
			end
			for var83 = if var84 == -1 then var29 else 1, if var84 == -1 then 1 else var29, var84 do
				if not t_2[var83].Tool then
					continue
				end
				t_2[var83]:Select()
				
				return
			end
		end)
		
		return
	elseif var18 then
		var18:UnequipTools()
		
		if var22 then
			var22:ToggleSelect()
			t_3[var22]:UpdateEquipView()
			var22 = nil
		end
	end
	var79 = p21
	var80 = tick()
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

function changeSlot(p22)
	-- upvalues: gamepadService (ref), guiService (ref), var14 (write), var29 (write)
	if p22.Frame == guiService.SelectedCoreObject and not gamepadService.GamepadCursorEnabled then
		local var87 = getGamepadSwapSlot()
		
		if not var87 then
			local size = p22.Frame.Size
			local position = p22.Frame.Position
			p22.Frame:TweenSizeAndPositionInternal(size + UDim2.new(0, 10, 0, 10), position - UDim2.new(0, 5, 0, 5), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, function()
				-- upvalues: p22 (ref), size (ref), position (ref)
				p22.Frame:TweenSizeAndPositionInternal(size, position, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true)
			end)
			p22.Frame.BorderSizePixel = 3
			var14.SelectionImageObject.Visible = true
			
			return
		end
		var87.Frame.BorderSizePixel = 0
		
		if var87 ~= p22 then
			p22:Swap(var87)
			var14.SelectionImageObject.Visible = false
			
			if var29 < p22.Index and not p22.Tool then
				if guiService.SelectedCoreObject == p22.Frame then
					guiService.SelectedCoreObject = var87.Frame
				end
				p22:Delete()
			end
			if var29 >= var87.Index or var87.Tool then return end
			if guiService.SelectedCoreObject == var87.Frame then
				guiService.SelectedCoreObject = p22.Frame
			end
			var87:Delete()
			
			return
		end
	else
		p22:Select()
		var14.SelectionImageObject.Visible = false
	end
end

function enableGamepadInventoryControl()
	-- upvalues: var13 (write), t (ref), contextActionService (ref), var81 (ref), guiService (ref), var11 (write)
	local var87 = function(_, p22, _)
		-- upvalues: var13 (copy), t (copy)
		if p22 ~= Enum.UserInputState.Begin then return end
		if getGamepadSwapSlot() then
			local var88 = getGamepadSwapSlot()
			
			if var88 then
				var88.Frame.BorderSizePixel = 0
				
				return
			end
		elseif var13.Visible then
			t.OpenClose()
		end
	end
	
	contextActionService:BindAction("RBXBackpackHasGamepadFocus", var81, false, Enum.UserInputType.Gamepad1)
	contextActionService:BindAction("RBXCloseInventory", var87, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart)
	local _ = false
	guiService.SelectedCoreObject = var11:FindFirstChild("1")
end

function disableGamepadInventoryControl()
	-- upvalues: var29 (write), t_2 (ref), guiService (ref), var10 (write)
	unbindAllGamepadEquipActions()
	
	for i = 1, var29 do
		local var87 = t_2[i]
		
		if var87 and var87.Frame then
			var87.Frame.BorderSizePixel = 0
		end
	end
	if guiService.SelectedCoreObject and guiService.SelectedCoreObject:IsDescendantOf(var10) then
		guiService.SelectedCoreObject = nil
	end
end

local _ = function()
	-- upvalues: var24 (write), var8 (write), contextActionService (ref)
	if var24 and not var8 then
		var8 = true
		contextActionService:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
	end
end

local _ = function()
	-- upvalues: var8 (write), contextActionService (ref)
	disableGamepadInventoryControl()
	var8 = false
	contextActionService:UnbindAction("RBXHotbarEquip")
end

function gamepadDisconnected()
	-- upvalues: VRService (ref), var27 (write)
	if not VRService.VREnabled then
		var27 = false
		disableGamepadInventoryControl()
	end
end

function gamepadConnected()
	-- upvalues: VRService (ref), var27 (write), guiService (ref), var10 (write), var21 (write), var24 (write), var8 (write), contextActionService (ref), var13 (write)
	if not VRService.VREnabled then
		var27 = true
		guiService:AddSelectionParent("RBXBackpackSelection", var10)
		
		if var21 >= 1 and var24 and not var8 then
			var8 = true
			contextActionService:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
		end
		if var13.Visible then
			enableGamepadInventoryControl()
		end
	end
end

local function OnCoreGuiChanged(p22, p23)
	-- upvalues: var7 (write), var24 (write), fFlagMountCoreGuiBackpackModule (ref), var10 (write), robloxGui (ref), t_6 (ref), guiService (ref), var21 (write), var8 (write), contextActionService (ref)
	if p22 == Enum.CoreGuiType.Backpack or p22 == Enum.CoreGuiType.All then
		p23 = p23 and var7
		var24 = p23
		
		if not fFlagMountCoreGuiBackpackModule then
			var10.Visible = p23
		elseif p23 then
			var10.Parent = robloxGui
		else
			var10.Parent = nil
		end
		for i, v in pairs(t_6) do
			if p23 then
				guiService:AddKey(v)
			else
				guiService:RemoveKey(v)
			end
		end
		if p23 then
			if var21 >= 1 and var24 and not var8 then
				var8 = true
				contextActionService:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
				
				return
			end
		else
			disableGamepadInventoryControl()
			var8 = false
			contextActionService:UnbindAction("RBXHotbarEquip")
		end
	end
end

local function MakeVRRoundButton(value, p24)
	-- upvalues: NewGui (ref)
	local var88 = NewGui("ImageButton", value)
	var88.Size = UDim2.new(0, 40, 0, 40)
	var88.Image = "rbxasset://textures/ui/Keyboard/close_button_background.png"
	local var89 = NewGui("ImageLabel", "Icon")
	var89.Size = UDim2.new(0.5, 0, 0.5, 0)
	var89.Position = UDim2.new(0.25, 0, 0.25, 0)
	var89.Image = p24
	var89.Parent = var88
	local var90 = NewGui("ImageLabel", "Selection")
	var90.Size = UDim2.new(0.9, 0, 0.9, 0)
	var90.Position = UDim2.new(0.05, 0, 0.05, 0)
	var90.Image = "rbxasset://textures/ui/Keyboard/close_button_selection.png"
	var88.SelectionImageObject = var90
	
	return var88, var89, var90
end

var10 = NewGui("Frame", "Backpack")

if not fFlagMountCoreGuiBackpackModule then
	var10.Visible = false
	var10.Parent = robloxGui
elseif starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack) then
	var10.Parent = robloxGui
end
var11 = NewGui("Frame", "Hotbar")
var11.Parent = var10

for i = 1, var29 do
	local var88 = MakeSlot(var11, i)
	var88.Frame.Visible = false
	
	if not var20 then
		var20 = var88
	end
end
var12 = NewGui("ImageButton", "OpenInventory")
var12.Size = UDim2.new(0, 30, 0, 30)
var12.Image = "rbxasset://textures/ui/Backpack/ScrollUpArrow.png"
var12.MouseButton1Click:connect(function()
	-- upvalues: t (ref)
	t.OpenClose()
end)
var12.SelectionGained:connect(function()
	-- upvalues: var12 (write), color3_4 (ref)
	var12.ImageColor3 = color3_4
end)
var12.SelectionLost:connect(function()
	-- upvalues: var12 (write)
	var12.ImageColor3 = Color3.new(1, 1, 1)
end)
local var89 = NewGui("Frame", "Selection")
var89.Visible = false
var12.SelectionImageObject = var89
local var90 = MakeVRRoundButton("CloseInventory", "rbxasset://textures/ui/Keyboard/close_button_icon.png")
var90.Position = UDim2.new(0, 0, 0, -50)
var90.MouseButton1Click:connect(function()
	-- upvalues: var13 (write), t (ref)
	if var13.Visible then
		t.OpenClose()
	end
end)
LeftBumperButton = NewGui("ImageLabel", "LeftBumper")
LeftBumperButton.Size = UDim2.new(0, 40, 0, 40)
LeftBumperButton.Position = UDim2.new(0, -LeftBumperButton.Size.X.Offset, 0.5, -LeftBumperButton.Size.Y.Offset / 2)
RightBumperButton = NewGui("ImageLabel", "RightBumper")
RightBumperButton.Size = UDim2.new(0, 40, 0, 40)
RightBumperButton.Position = UDim2.new(1, 0, 0.5, -RightBumperButton.Size.Y.Offset / 2)
var13 = NewGui("Frame", "Inventory")
var13.BackgroundTransparency = var2
var13.BackgroundColor3 = color3
var13.Active = true
var13.Visible = false
var13.Parent = var10
var14 = NewGui("TextButton", "VRInventorySelector")
var14.Position = UDim2.new(0, 0, 0, 0)
var14.Size = UDim2.new(1, 0, 1, 0)
var14.BackgroundTransparency = 1
var14.Text = ""
var14.Parent = var13
local var91 = NewGui("ImageLabel", "Selector")
var91.Size = UDim2.new(1, 0, 1, 0)
var91.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png"
var91.ScaleType = Enum.ScaleType.Slice
var91.SliceCenter = Rect.new(12, 12, 52, 52)
var91.Visible = false
var14.SelectionImageObject = var91
var15 = NewGui("ScrollingFrame", "ScrollingFrame")
var15.Selectable = false
var15.CanvasSize = UDim2.new(0, 0, 0, 0)
var15.Parent = var13
var16 = NewGui("Frame", "UIGridFrame")
var16.Selectable = false
var16.Size = UDim2.new(1, -10, 1, 0)
var16.Position = UDim2.new(0, 5, 0, 0)
var16.Parent = var15
local UIGridLayout = Instance.new("UIGridLayout")
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellSize = UDim2.new(0, var1, 0, var1)
UIGridLayout.CellPadding = UDim2.new(0, 5, 0, 5)
UIGridLayout.Parent = var16
local var92 = MakeVRRoundButton("ScrollUpButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png")
var92.Size = UDim2.new(0, 34, 0, 34)
var92.Position = UDim2.new(0.5, -var92.Size.X.Offset / 2, 0, 43)
var92.Icon.Position -= UDim2.new(0, 0, 0, 2)
var92.MouseButton1Click:connect(function()
	-- upvalues: var15 (write), var1 (write)
	var15.CanvasPosition = Vector2.new(var15.CanvasPosition.X, math.min(var15.CanvasSize.Y.Offset - var15.AbsoluteWindowSize.Y, math.max(0, var15.CanvasPosition.Y - (var1 + 5))))
end)
local var93 = MakeVRRoundButton("ScrollDownButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png")
var93.Rotation = 180
var93.Icon.Position -= UDim2.new(0, 0, 0, 2)
var93.Size = UDim2.new(0, 34, 0, 34)
var93.Position = UDim2.new(0.5, -var93.Size.X.Offset / 2, 1, (-var93.Size.Y.Offset) - 3)
var93.MouseButton1Click:connect(function()
	-- upvalues: var15 (write), var1 (write)
	var15.CanvasPosition = Vector2.new(var15.CanvasPosition.X, math.min(var15.CanvasSize.Y.Offset - var15.AbsoluteWindowSize.Y, math.max(0, var15.CanvasPosition.Y + (var1 + 5))))
end)
var15.Changed:connect(function(p24)
	-- upvalues: var15 (write), var92 (write), var93 (write)
	if p24 == "AbsoluteWindowSize" or p24 == "CanvasPosition" or p24 == "CanvasSize" then
		local var94 = var15.CanvasPosition.Y < var15.CanvasSize.Y.Offset - var15.AbsoluteWindowSize.Y
		var92.Visible = var15.CanvasPosition.Y ~= 0
		var93.Visible = var94
	end
end)
UpdateBackpackLayout()
local var94 = create("Frame")({
	Name = "GamepadHintsFrame",
	BackgroundTransparency = 1,
	Visible = false,
	Size = UDim2.new(0, var11.Size.X.Offset, 0, if var6 then 95 else 60),
	Parent = var10
})

local function addGamepadHint(p24, p25, p26)
	-- upvalues: create (ref), var94 (ref), var6 (ref)
	local var95 = create("Frame")({
		Name = "HintFrame",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, -5),
		Position = UDim2.new(0, 0, 0, 0),
		Parent = var94
	})
	local _ = create("ImageLabel")({
		Name = "HintImage",
		BackgroundTransparency = 1,
		Size = var6 and UDim2.new(0, 90, 0, 90) or UDim2.new(0, 60, 0, 60),
		Image = if var6 then p25 else p24,
		Parent = var95
	})
	local var96 = create("TextLabel")({
		Name = "HintText",
		BackgroundTransparency = 1,
		TextWrapped = true,
		Position = UDim2.new(0, if var6 then 100 else 70, 0, 0),
		Size = UDim2.new(1, -(if var6 then 100 else 70), 1, 0),
		Font = Enum.Font.SourceSansBold,
		FontSize = if var6 then Enum.FontSize.Size36 else Enum.FontSize.Size24,
		Text = p26,
		TextColor3 = Color3.new(1, 1, 1),
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = var95
	})
	Instance.new("UITextSizeConstraint", var96).MaxTextSize = var96.TextSize
end

local function resizeGamepadHintsFrame()
	-- upvalues: var94 (ref), var11 (write), var6 (ref), var13 (write)
	var94.Size = UDim2.new(var11.Size.X.Scale, var11.Size.X.Offset, 0, if var6 then 95 else 60)
	var94.Position = UDim2.new(var11.Position.X.Scale, var11.Position.X.Offset, var13.Position.Y.Scale, var13.Position.Y.Offset - var94.Size.Y.Offset)
	local var95 = 0
	local children = var94:GetChildren()
	
	for i = 1, #children do
		children[i].Size = UDim2.new(1, 0, 1, -5)
		children[i].Position = UDim2.new(0, 0, 0, 0)
		var95 += children[i].HintText.Position.X.Offset + children[i].HintText.TextBounds.X
	end
	local var96 = (var94.AbsoluteSize.X - var95) / (#children - 1)
	
	for i_1 = 1, #children do
		children[i_1].Position = i_1 == 1 and UDim2.new(0, 0, 0, 0) or UDim2.new(0, children[i_1 - 1].Position.X.Offset + children[i_1 - 1].Size.X.Offset + var96, 0, 0)
		children[i_1].Size = UDim2.new(0, children[i_1].HintText.Position.X.Offset + children[i_1].HintText.TextBounds.X, 1, -5)
	end
end

addGamepadHint("rbxasset://textures/ui/Controls/DesignSystem/ButtonX.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonX@2x.png", "Remove From Hotbar")
addGamepadHint("rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonA@2x.png", "Select/Swap")
addGamepadHint("rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonB@2x.png", "Close Backpack")
local var97 = NewGui("Frame", "Search")
var97.BackgroundColor3 = color3_5
var97.BackgroundTransparency = var5
var97.Size = UDim2.new(0, 190, 0, 30)
var97.Position = UDim2.new(1, (-var97.Size.X.Offset) - 5, 0, 5)
var97.Parent = var13
local var98 = NewGui("TextBox", "TextBox")
var98.Text = var4
var98.ClearTextOnFocus = false
var98.FontSize = Enum.FontSize.Size24
var98.TextXAlignment = Enum.TextXAlignment.Left
var98.Size = var97.Size - UDim2.new(0, 0, 0, 0)
var98.Position = UDim2.new(0, 0, 0, 0)
var98.Parent = var97
local var99 = NewGui("TextButton", "X")
var99.Text = "x"
var99.TextColor3 = color3_2
var99.FontSize = Enum.FontSize.Size24
var99.TextYAlignment = Enum.TextYAlignment.Bottom
var99.BackgroundColor3 = color3_5
var99.BackgroundTransparency = 0
var99.Size = UDim2.new(0, var97.Size.Y.Offset - 10, 0, var97.Size.Y.Offset - 10)
var99.Position = UDim2.new(1, (-var99.Size.X.Offset) - 10, 0.5, -var99.Size.Y.Offset / 2)
var99.ZIndex = 0
var99.Visible = false
var99.BorderSizePixel = 0
var99.Parent = var97

local function search()
	-- upvalues: var98 (ref), var29 (write), t_2 (ref), var13 (write), var26 (write), var16 (write), var15 (write), UpdateScrollingFrameCanvasSize (ref), var99 (ref)
	local t = {}
	
	for i in var98.Text:gmatch("%S+") do
		t[i:lower()] = true
	end
	local t_1 = {}
	
	for i_1 = var29 + 1, #t_2 do
		local var100 = t_2[i_1]
		table.insert(t_1, { var100, var100:CheckTerms(t) })
		var100.Frame.Visible = false
		var100.Frame.Parent = var13
	end
	table.sort(t_1, function(p24, p25)
		return p25[2] < p24[2]
	end)
	var26 = true
	local var101 = 0
	
	for i_2, v in ipairs(t_1) do
		local var102 = v[1]
		
		if v[2] > 0 then
			var102.Frame.Visible = true
			var102.Frame.Parent = var16
			var102.Frame.LayoutOrder = var29 + var101
			var101 += 1
		end
	end
	var15.CanvasPosition = Vector2.new(0, 0)
	UpdateScrollingFrameCanvasSize()
	var99.ZIndex = 3
end

local function clearResults()
	-- upvalues: var99 (ref), var26 (write), var29 (write), t_2 (ref), var16 (write), UpdateScrollingFrameCanvasSize (ref)
	if var99.ZIndex > 0 then
		var26 = false
		
		for i = var29 + 1, #t_2 do
			local var103 = t_2[i]
			var103.Frame.LayoutOrder = var103.Index
			var103.Frame.Parent = var16
			var103.Frame.Visible = true
		end
		var99.ZIndex = 0
	end
	UpdateScrollingFrameCanvasSize()
end

local function reset()
	-- upvalues: clearResults (ref), var98 (ref), var4 (write)
	clearResults()
	var98.Text = var4
end

local function onChanged(p24)
	-- upvalues: var98 (ref), clearResults (ref), var4 (write), search (ref), var99 (ref)
	if p24 == "Text" then
		local text = var98.Text
		
		if text == "" then
			clearResults()
		elseif text ~= var4 then
			search()
		end
		var99.Visible = text ~= "" and text ~= var4
	end
end

local function focusLost(p24)
	-- upvalues: search (ref), var98 (ref), var4 (write)
	if p24 then
		search()
		
		return
	elseif var98.Text == "" then
		var98.Text = var4
	end
end

var98.Focused:connect(function()
	-- upvalues: var98 (ref), var4 (write)
	if var98.Text == var4 then
		var98.Text = ""
	end
end)
var99.MouseButton1Click:connect(reset)
var98.Changed:connect(onChanged)
var98.FocusLost:connect(focusLost)
t.StateChanged.Event:connect(function(p24)
	-- upvalues: var99 (ref), clearResults (ref), var98 (ref), var4 (write)
	var99.Modal = p24
	
	if not p24 then
		clearResults()
		var98.Text = var4
	end
end)

t_4[Enum.KeyCode.Escape.Value] = function(p24)
	-- upvalues: clearResults (ref), var98 (ref), var4 (write), var13 (write), t (ref)
	if p24 then
		clearResults()
		var98.Text = var4
		
		return
	elseif var13.Visible then
		t.OpenClose()
	end
end

userInputService.LastInputTypeChanged:connect(function(p24)
	-- upvalues: VRService (ref), var97 (ref)
	if p24 == Enum.UserInputType.Gamepad1 and not VRService.VREnabled then
		var97.Visible = false
		
		return
	end
	var97.Visible = true
end)

local var104 = function(_, p24, _)
	-- upvalues: guiService (ref), var29 (write), t_2 (ref)
	if p24 ~= Enum.UserInputState.Begin then return end
	if not guiService.SelectedCoreObject then return end
	for i = 1, var29 do
		if t_2[i].Frame ~= guiService.SelectedCoreObject or not t_2[i].Tool then
			continue
		end
		t_2[i]:MoveToInventory()
		
		return
	end
end

local function openClose()
	-- upvalues: t_5 (ref), var13 (write), AdjustHotbarFrames (ref), var11 (write), var29 (write), t_2 (ref), var27 (write), t_1 (ref), userInputService (ref), resizeGamepadHintsFrame (ref), var94 (ref), contextActionService (ref), var104 (ref), t (ref)
	if not next(t_5) then
		var13.Visible = not var13.Visible
		local visible = var13.Visible
		AdjustHotbarFrames()
		var11.Active = not var11.Active
		
		for i = 1, var29 do
			t_2[i]:SetClickability(not visible)
		end
	end
	if not var13.Visible then
		if var27 then
			var94.Visible = false
		end
		disableGamepadInventoryControl()
	elseif var27 then
		if t_1[userInputService:GetLastInputType()] then
			resizeGamepadHintsFrame()
			var94.Visible = true
		end
		enableGamepadInventoryControl()
	end
	if var13.Visible then
		contextActionService:BindAction("RBXRemoveSlot", var104, false, Enum.KeyCode.ButtonX)
	else
		contextActionService:UnbindAction("RBXRemoveSlot")
	end
	t.IsOpen = var13.Visible
	t.StateChanged:Fire(var13.Visible)
end

t_4[value] = function()
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
userInputService.TextBoxFocused:connect(function()
	-- upvalues: var25 (write)
	var25 = true
end)
userInputService.TextBoxFocusReleased:connect(function()
	-- upvalues: var25 (write)
	var25 = false
end)

t_4[value_2] = function()
	-- upvalues: var22 (write), var18 (write), t_3 (ref)
	if var22 and var18 then
		var18:UnequipTools()
		
		if var22 then
			var22:ToggleSelect()
			t_3[var22]:UpdateEquipView()
			var22 = nil
		end
	end
end

userInputService.Changed:connect(OnUISChanged)
local var105 = userInputService.KeyboardEnabled and not VRService.VREnabled

for i_2 = 1, var29 do
	t_2[i_2]:TurnNumber(var105)
end
if userInputService:GetGamepadConnected(Enum.UserInputType.Gamepad1) then
	gamepadConnected()
end
userInputService.GamepadConnected:connect(function(p25)
	if p25 == Enum.UserInputType.Gamepad1 then
		gamepadConnected()
	end
end)
userInputService.GamepadDisconnected:connect(function(p25)
	if p25 == Enum.UserInputType.Gamepad1 then
		gamepadDisconnected()
	end
end)

function t.TopbarEnabledChanged(_, p25)
	-- upvalues: var7 (write), OnCoreGuiChanged (ref), starterGuiService (ref)
	var7 = p25
	OnCoreGuiChanged(Enum.CoreGuiType.Backpack, starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack))
end

if fFlagTopBarSignalizeSetCores then
	t.disposeEffect = signalsModule.createEffect(function(p25)
		-- upvalues: inExperienceTopBarModule (ref), t (ref)
		local getTopBarStore = inExperienceTopBarModule.Stores.GetTopBarStore
		
		if getTopBarStore then
			t:TopbarEnabledChanged(getTopBarStore(p25).getTopBarCoreGuiEnabled(p25))
		end
	end)
end
starterGuiService.CoreGuiChangedSignal:connect(OnCoreGuiChanged)
local backpack = Enum.CoreGuiType.Backpack
local health = Enum.CoreGuiType.Health
OnCoreGuiChanged(backpack, starterGuiService:GetCoreGuiEnabled(backpack))
OnCoreGuiChanged(health, starterGuiService:GetCoreGuiEnabled(health))

if enableHotbarHide then
	settingsShowSignal:connect(function(p25)
		-- upvalues: t (ref), AdjustHotbarFrames (ref)
		if p25 then
			if t.IsHotbarVisible then
				AdjustHotbarFrames(true)
				
				return
			end
		else
			AdjustHotbarFrames(false)
		end
	end)
end
guiService.MenuOpened:Connect(function()
	-- upvalues: t (ref), isInExperienceUIVREnabled (ref), inExperienceUIVRIXP (ref), VRService (ref)
	if t.IsOpen then
		if if isInExperienceUIVREnabled and not inExperienceUIVRIXP:isMovePanelToCenter() then not VRService.VREnabled else true then
			t.OpenClose()
		end
	end
end)
inExperienceAppChatModalModule.default.visibilitySignal.Event:Connect(function(p25)
	-- upvalues: t (ref)
	if p25 and t.IsOpen then
		t.OpenClose()
	end
end)
userGameSettingsService:GetPropertyChangedSignal("PreferredTransparency"):connect(function()
	-- upvalues: userGameSettingsService (ref), var2 (write), var13 (write), var3 (write), t_2 (ref), var5 (write), var97 (ref)
	local preferredTransparency = userGameSettingsService.PreferredTransparency
	var2 = 0.5 * userGameSettingsService.PreferredTransparency
	var13.BackgroundTransparency = var2
	var3 = 0.5 * preferredTransparency
	
	for i, v in ipairs(t_2) do
		v.Frame.BackgroundTransparency = var3
	end
	var5 = 0.15 * userGameSettingsService.PreferredTransparency
	var97.BackgroundTransparency = var5
end)

return t