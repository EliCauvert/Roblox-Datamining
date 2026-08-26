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
local create = require(parent.AppCommonLib).Create
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
local var13 = nil
local var14 = nil
local var15 = nil
local var16 = nil
local var17 = nil
local var18 = nil
local var19 = nil
local var20 = nil
local var21 = nil
local var22 = nil
local var23 = nil
local t_2 = {}
local var24 = nil
local t_3 = {}
local t_4 = {}
local t_5 = {}
local var25 = 0
local var26 = nil
local var27 = false
local var28 = false
local var29 = false
local var30 = false
local t_6 = {}
local t_7 = {}
local t_8 = {}
local var31 = false
local var32 = 0
local var33 = if var9 then 3 else 10
local var34 = if var9 then 2 else 4
local var35 = nil
local var36 = nil
t.BackpackEmpty = create("BindableEvent")({ Name = "BackpackEmpty" })
t.BackpackItemAdded = create("BindableEvent")({ Name = "BackpackAdded" })
t.BackpackItemRemoved = create("BindableEvent")({ Name = "BackpackRemoved" })

local function NewGui(p1, p2)
	-- upvalues: size14 (write)
	local var37 = Instance.new(p1)
	var37.Name = p2
	var37.BackgroundColor3 = Color3.new(0, 0, 0)
	var37.BackgroundTransparency = 1
	var37.BorderColor3 = Color3.new(0, 0, 0)
	var37.BorderSizePixel = 0
	var37.Size = UDim2.new(1, 0, 1, 0)
	
	if p1:match("Text") then
		var37.TextColor3 = Color3.new(1, 1, 1)
		var37.Text = ""
		var37.Font = Enum.Font.SourceSans
		var37.FontSize = size14
		var37.TextWrapped = true
		
		if p1 == "TextButton" then
			var37.Font = Enum.Font.SourceSansBold
			var37.BorderSizePixel = 1
		end
	end
	return var37
end

local function _()
	-- upvalues: var33 (write), t_2 (ref)
	for i = 1, var33 do
		local var37 = t_2[i]
		
		if var37.Tool then
			continue
		end
		return var37
	end
	return nil
end

function t.isInventoryEmpty()
	-- upvalues: var33 (write), t_2 (ref)
	for i = var33 + 1, #t_2 do
		local var38 = t_2[i]
		
		if not var38 or not var38.Tool then
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
	-- upvalues: var14 (write), var33 (write), var25 (write), enableHotbarHide (ref), t_2 (ref), var12 (write), t (ref)
	if not var14 then return end
	local visible = var14.Visible
	local var39 = if visible then var33 else var25
	local var40 = 0
	local var41 = if enableHotbarHide then var39 >= 1 and not p1 else var39 >= 1
	
	for i = 1, var33 do
		local var42 = t_2[i]
		
		if (if enableHotbarHide then var42.Tool and not p1 else var42.Tool) or visible then
			var40 += 1
			var42:Readjust(var40, var39)
			var42.Frame.Visible = true
		else
			var42.Frame.Visible = false
		end
	end
	if var12 then
		local var43 = not visible
		
		if var43 then
			var43 = var41
			
			if not var43 then
				local var44
				for i_1 = var33 + 1, #t_2 do
					local var45 = t_2[i_1]
					
					if not var45 or not var45.Tool then
						continue
					end
					var44 = false
					var43 = not var44
				end
				var44 = true
			end
		end
		var12.Visible = var43
		var12.Position = UDim2.new(0.5, -15, 1, if var41 then -110 else -50)
	end
	t.IsHotbarVisible = var41
end

local function UpdateScrollingFrameCanvasSize()
	-- upvalues: var16 (write), var17 (write), var1 (write)
	if var16 and var17 then
		var16.CanvasSize = UDim2.new(0, 0, 0, math.ceil((#var17:GetChildren() - 1) / math.floor(var16.AbsoluteSize.X / (var1 + 5))) * (var1 + 5) + 5)
		
		return
	end
end

local function AdjustInventoryFrames()
	-- upvalues: var33 (write), t_2 (ref), UpdateScrollingFrameCanvasSize (ref)
	for i = var33 + 1, #t_2 do
		local var46 = t_2[i]
		var46.Frame.LayoutOrder = var46.Index
		var46.Frame.Visible = var46.Tool ~= nil
	end
	UpdateScrollingFrameCanvasSize()
end

local function UpdateBackpackLayout()
	-- upvalues: var11 (write), var14 (write), var33 (write), var1 (write), var34 (ref), var16 (write), AdjustHotbarFrames (ref), AdjustInventoryFrames (ref)
	if not var11 or not var14 then return end
	var11.Size = UDim2.new(0, 5 + var33 * (var1 + 5), 0, var1 + 5 + 5)
	var11.Position = UDim2.new(0.5, -var11.Size.X.Offset / 2, 1, -var11.Size.Y.Offset)
	var14.Size = UDim2.new(0, var11.Size.X.Offset, 0, var11.Size.Y.Offset * var34 + 40)
	var14.Position = UDim2.new(0.5, -var14.Size.X.Offset / 2, 1, var11.Position.Y.Offset - var14.Size.Y.Offset)
	
	if var16 then
		var16.Size = UDim2.new(1, var16.ScrollBarThickness + 1, 1, -40)
		var16.Position = UDim2.new(0, 0, 0, 40)
	end
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
	-- upvalues: var26 (write), t_3 (ref)
	var26:ToggleSelect()
	t_3[var26]:UpdateEquipView()
	var26 = nil
end

local _ = function()
	-- upvalues: var22 (write), var26 (write), t_3 (ref)
	if var22 then
		var22:UnequipTools()
		
		if var26 then
			var26:ToggleSelect()
			t_3[var26]:UpdateEquipView()
			var26 = nil
		end
	end
end

local _ = function(p2)
	-- upvalues: var22 (write), var26 (write), t_3 (ref), var21 (write)
	if var22 then
		var22:UnequipTools()
		
		if var26 then
			var26:ToggleSelect()
			t_3[var26]:UpdateEquipView()
			var26 = nil
		end
	end
	if p2:IsA("HopperBin") then
		p2:ToggleSelect()
		t_3[p2]:UpdateEquipView()
		var26 = p2
		
		return
	end
	p2.Parent = var21
end

local _ = function(p2)
	-- upvalues: var21 (write)
	return p2 and (if p2:IsA("HopperBin") then p2.Active else p2.Parent == var21)
end

local function MakeSlot(p2, p3)
	-- upvalues: t_2 (ref), var3 (write), color3_1 (ref), color3 (ref), var11 (write), var1 (write), gameTranslatorModule (ref), var33 (write), var14 (write), var25 (write), var28 (write), var8 (write), contextActionService (ref), var36 (write), t_3 (ref), var24 (write), var21 (write), var35 (write), NewGui (ref), color3_2 (ref), t_5 (ref), UpdateScrollingFrameCanvasSize (ref), var22 (write), var26 (write), var23 (write), color3_3 (ref), MakeSlot (ref), var17 (write), var30 (write), t_4 (ref), value_1 (ref), var16 (write)
	p3 = p3 or #t_2 + 1
	p3 = { Tool = nil, Index = p3, Frame = nil }
	local var47 = nil
	local var48 = nil
	local var49 = nil
	local var50 = nil
	local var51 = nil
	local var52 = nil
	local _ = nil
	local var53 = nil
	local var54 = nil
	
	local function _()
		-- upvalues: var47 (write), var3 (copy), color3_1 (copy), color3 (copy)
		var47.SelectionImageObject = nil
		var47.BackgroundTransparency = if var47.Draggable then 0 else var3
		var47.BackgroundColor3 = if var47.Draggable then color3_1 else color3
	end
	
	function p10.Readjust(_, p4, p5)
		-- upvalues: var11 (copy), var1 (copy), var47 (write)
		var47.Position = UDim2.new(0, var11.Size.X.Offset / 2 - var1 / 2 + (var1 + 5) * (p4 - (p5 / 2 + 0.5)), 0, 5)
	end
	
	function p10.Fill(p4, p5)
		-- upvalues: var49 (write), var50 (write), gameTranslatorModule (copy), var53 (write), var51 (write), var33 (copy), var14 (copy), var47 (write), var25 (copy), var28 (copy), var8 (copy), contextActionService (copy), var36 (copy), t_3 (copy), var24 (copy), t_2 (copy)
		if not p5 then
			return p4:Clear()
		end
		p4.Tool = p5
		
		local function assignToolData()
			-- upvalues: p5 (ref), var49 (copy), var50 (copy), gameTranslatorModule (copy), var53 (copy)
			local textureId = p5.TextureId
			var49.Image = textureId
			
			if textureId == "" then
				var50.Visible = true
			else
				var50.Visible = false
			end
			gameTranslatorModule:TranslateAndRegister(var50, p5, p5.Name)
			
			if var53 and p5:IsA("Tool") then
				gameTranslatorModule:TranslateAndRegister(var53, p5, p5.ToolTip)
				local var55 = var53.TextBounds.X + 6
				var53.Size = UDim2.new(0, var55, 0, 16)
				var53.Position = UDim2.new(0.5, -var55 / 2, 0, -25)
			end
		end
		
		assignToolData()
		
		if var51 then
			var51:disconnect()
			var51 = nil
		end
		var51 = p5.Changed:connect(function(p6)
			-- upvalues: assignToolData (ref)
			if p6 == "TextureId" or p6 == "Name" or p6 == "ToolTip" then
				assignToolData()
			end
		end)
		local var55 = p4.Index <= var33
		
		if not var55 or var14.Visible then
			var47.Draggable = true
		end
		p4:UpdateEquipView()
		
		if var55 then
			var25 += 1
			
			if var28 and var25 >= 1 and not var8 then
				var8 = true
				contextActionService:BindAction("RBXHotbarEquip", var36, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
			end
		end
		local var56, var57
		t_3[p5] = p4
		
		for i = 1, var33 do
			var56 = t_2[i]
			
			if var56.Tool then
				continue
			end
			var57 = var56
			var24 = var57
			
			return
		end
		var57 = nil
	end
	
	function p10.Clear(p6)
		-- upvalues: var51 (write), var49 (write), var50 (write), var53 (write), var47 (write), var33 (copy), var25 (copy), var8 (copy), contextActionService (copy), t_3 (copy), var24 (copy), t_2 (copy)
		if not p6.Tool then return end
		if var51 then
			var51:disconnect()
			var51 = nil
		end
		var49.Image = ""
		var50.Text = ""
		
		if var53 then
			var53.Text = ""
			var53.Visible = false
		end
		var47.Draggable = false
		p6:UpdateEquipView(true)
		
		if p6.Index <= var33 then
			var25 -= 1
			
			if var25 < 1 then
				var8 = false
				contextActionService:UnbindAction("RBXHotbarEquip")
			end
		end
		local var58, var59
		t_3[p6.Tool] = nil
		p6.Tool = nil
		
		for i = 1, var33 do
			var58 = t_2[i]
			
			if var58.Tool then
				continue
			end
			var59 = var58
			var24 = var59
			
			return
		end
		var59 = nil
	end
	
	function p10.UpdateEquipView(p7, p8)
		-- upvalues: var21 (copy), var35 (copy), p3 (ref), var52 (write), NewGui (copy), var47 (write), color3_2 (copy), var3 (copy), color3_1 (copy), color3 (copy)
		if not p8 then
			local tool = p7.Tool
			
			if tool and (if tool:IsA("HopperBin") then tool.Active else tool.Parent == var21) then
				var35 = p3
				
				if not var52 then
					var52 = NewGui("Frame", "Equipped")
					var52.ZIndex = var47.ZIndex
					
					for i, v in pairs({
						{ 0.1, 1, 0, 0 },
						{ 0.8, 0.1, 0.1, 0 },
						{ 0.1, 1, 0.9, 0 },
						{ 0.8, 0.1, 0.1, 0.9 }
					}) do
						local var60 = NewGui("Frame", "Edge")
						var60.BackgroundTransparency = 0
						var60.BackgroundColor3 = color3_2
						var60.Size = UDim2.new(v[1], 0, v[2], 0)
						var60.Position = UDim2.new(v[3], 0, v[4], 0)
						var60.ZIndex = var52.ZIndex
						var60.Parent = var52
					end
				end
				var52.Parent = var47
			elseif var52 then
				var52.Parent = nil
			end
			var47.SelectionImageObject = nil
			var47.BackgroundTransparency = if var47.Draggable then 0 else var3
			var47.BackgroundColor3 = if var47.Draggable then color3_1 else color3
		end
	end
	
	function p10.IsEquipped(p9)
		-- upvalues: var21 (copy)
		local tool = p9.Tool
		
		return tool and (if tool:IsA("HopperBin") then tool.Active else tool.Parent == var21)
	end
	
	function p10.Delete(p9)
		-- upvalues: t_5 (copy), var47 (write), t_2 (copy), UpdateScrollingFrameCanvasSize (copy)
		t_5[var47] = nil
		var47:Destroy()
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
		-- upvalues: var47 (write)
		p10.Index -= 1
		var47.Name = p10.Index
		var47.LayoutOrder = p10.Index
	end
	
	function p10.TurnNumber(_, p10)
		-- upvalues: var54 (write)
		if var54 then
			var54.Visible = p10
		end
	end
	
	function p10.SetClickability(value, p10)
		-- upvalues: var47 (write), var3 (copy), color3_1 (copy), color3 (copy)
		if value.Tool then
			var47.Draggable = not p10
			var47.SelectionImageObject = nil
			var47.BackgroundTransparency = if var47.Draggable then 0 else var3
			var47.BackgroundColor3 = if var47.Draggable then color3_1 else color3
		end
	end
	
	function p10.CheckTerms(p10, p11)
		-- upvalues: var50 (write), var53 (write)
		local var61 = 0
		
		local function _(p12, p13)
			-- upvalues: var61 (write)
			local _, var62 = p12:lower():gsub(p13, "")
			var61 += var62
		end
		
		local tool = p10.Tool
		
		if tool then
			for i in pairs(p11) do
				local var62, var63 = var50.Text:lower():gsub(i, "")
				var61 += var63
				
				if tool:IsA("Tool") then
					var62, var123 = (if var53 then var53.Text else ""):lower():gsub(i, "")
					var61 += var123
				end
			end
		end
		return var61
	end
	
	function p10.Select(_, p12)
		-- upvalues: p3 (ref), var21 (copy), var22 (copy), var26 (copy), t_3 (copy), var23 (copy)
		if p12 then return end
		local tool = p3.Tool
		
		if tool then
			if tool and (if tool:IsA("HopperBin") then tool.Active else tool.Parent == var21) then
				if var22 then
					var22:UnequipTools()
					
					if var26 then
						var26:ToggleSelect()
						t_3[var26]:UpdateEquipView()
						var26 = nil
						
						return
					end
				end
			elseif tool.Parent == var23 then
				if var22 then
					var22:UnequipTools()
					
					if var26 then
						var26:ToggleSelect()
						t_3[var26]:UpdateEquipView()
						var26 = nil
					end
				end
				if tool:IsA("HopperBin") then
					tool:ToggleSelect()
					t_3[tool]:UpdateEquipView()
					var26 = tool
					
					return
				end
				tool.Parent = var21
			end
		end
	end
	
	var47 = NewGui("TextButton", p3)
	var47.BackgroundColor3 = color3
	var47.BorderColor3 = color3_3
	var47.Text = ""
	var47.AutoButtonColor = false
	var47.BorderSizePixel = 0
	var47.Size = UDim2.new(0, var1, 0, var1)
	var47.Active = true
	var47.Draggable = false
	var47.BackgroundTransparency = var3
	var47.MouseButton1Click:connect(function()
		-- upvalues: p3 (ref)
		changeSlot(p3)
	end)
	p3.Frame = var47
	local var64 = NewGui("Frame", "SelectionObjectClipper")
	var64.Visible = false
	var64.Parent = var47
	local var65 = NewGui("ImageLabel", "Selector")
	var65.Size = UDim2.new(1, 0, 1, 0)
	var65.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png"
	var65.ScaleType = Enum.ScaleType.Slice
	var65.SliceCenter = Rect.new(12, 12, 52, 52)
	var65.Parent = var64
	var49 = NewGui("ImageLabel", "Icon")
	var49.Size = UDim2.new(0.8, 0, 0.8, 0)
	var49.Position = UDim2.new(0.1, 0, 0.1, 0)
	var49.Parent = var47
	var50 = NewGui("TextLabel", "ToolName")
	var50.Size = UDim2.new(1, -2, 1, -2)
	var50.Position = UDim2.new(0, 1, 0, 1)
	var50.Parent = var47
	p3.Frame.LayoutOrder = p3.Index
	
	if p3 <= var33 then
		var53 = NewGui("TextLabel", "ToolTip")
		var53.TextWrapped = false
		var53.TextYAlignment = Enum.TextYAlignment.Top
		var53.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
		var53.BackgroundTransparency = 0
		var53.Visible = false
		var53.Parent = var47
		var47.MouseEnter:connect(function()
			-- upvalues: var53 (write)
			if var53.Text ~= "" then
				var53.Visible = true
			end
		end)
		var47.MouseLeave:connect(function()
			-- upvalues: var53 (write)
			var53.Visible = false
		end)
		
		function p10.MoveToInventory(p12)
			-- upvalues: p3 (ref), var33 (copy), MakeSlot (copy), var17 (copy), var21 (copy), var22 (copy), var26 (copy), t_3 (copy), var30 (copy), var14 (copy)
			if p3.Index <= var33 then
				local tool = p3.Tool
				p12:Clear()
				local var66 = MakeSlot(var17)
				var66:Fill(tool)
				
				if tool and (if tool:IsA("HopperBin") then tool.Active else tool.Parent == var21) and var22 then
					var22:UnequipTools()
					
					if var26 then
						var26:ToggleSelect()
						t_3[var26]:UpdateEquipView()
						var26 = nil
					end
				end
				if var30 then
					var66.Frame.Visible = false
					var66.Parent = var14
				end
			end
		end
		
		if p3 < 10 or p3 == var33 then
			local var66 = if p3 < 10 then p3 else 0
			var54 = NewGui("TextLabel", "Number")
			var54.Text = var66
			var54.Size = UDim2.new(0.15, 0, 0.15, 0)
			var54.Visible = false
			var54.Parent = var47
			
			t_4[value_1 + var66] = function(p12)
				-- upvalues: p3 (ref)
				p3:Select(p12)
			end
		end
	end
	local position = var47.Position
	local var67 = 0
	local var68 = nil
	var47.DragBegin:connect(function(p12)
		-- upvalues: t_5 (copy), var47 (write), position (write), var49 (write), var50 (write), var54 (write), var52 (write), var68 (write), var17 (copy), var14 (copy), var48 (write), NewGui (copy)
		t_5[var47] = true
		position = p12
		var47.BorderSizePixel = 2
		var47.ZIndex = 2
		var49.ZIndex = 2
		var50.ZIndex = 2
		var47.Parent.ZIndex = 2
		
		if var54 then
			var54.ZIndex = 2
		end
		if var52 then
			var52.ZIndex = 2
			
			for i, v in pairs(var52:GetChildren()) do
				v.ZIndex = 2
			end
		end
		var68 = var47.Parent
		
		if var68 == var17 then
			local _ = var47.AbsolutePosition
			local uDim2 = UDim2.new(0, var47.AbsolutePosition.X - var14.AbsolutePosition.X, 0, var47.AbsolutePosition.Y - var14.AbsolutePosition.Y)
			var47.Parent = var14
			var47.Position = uDim2
			var48 = NewGui("Frame", "FakeSlot")
			var48.LayoutOrder = var47.LayoutOrder
			var48.Size = var47.Size
			var48.BackgroundTransparency = 1
			var48.Parent = var17
		end
	end)
	var47.DragStopped:connect(function(p13, p14)
		-- upvalues: var48 (write), var47 (write), position (write), var68 (write), var49 (write), var50 (write), var54 (write), var52 (write), t_5 (copy), p3 (ref), var14 (copy), var33 (copy), var67 (write), var24 (copy), var11 (copy), t_2 (copy), var21 (copy), var22 (copy), var26 (copy), t_3 (copy), var30 (copy)
		if var48 then
			var48:Destroy()
		end
		local currentTime = tick()
		var47.Position = position
		var47.Parent = var68
		var47.BorderSizePixel = 0
		var47.ZIndex = 1
		var49.ZIndex = 1
		var50.ZIndex = 1
		var68.ZIndex = 1
		
		if var54 then
			var54.ZIndex = 1
		end
		if var52 then
			var52.ZIndex = 1
			
			for i, v in pairs(var52:GetChildren()) do
				v.ZIndex = 1
			end
		end
		t_5[var47] = nil
		
		if not p3.Tool then return end
		local absolutePosition = var14.AbsolutePosition
		local absoluteSize = var14.AbsoluteSize
		
		if absolutePosition.X < p13 and (p13 <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y < p14 and p14 <= absolutePosition.Y + absoluteSize.Y)) then
			if p3.Index <= var33 then
				p3:MoveToInventory()
			end
			if var33 < p3.Index and currentTime - var67 < 0.5 then
				if var24 then
					local tool = p3.Tool
					p3:Clear()
					var24:Fill(tool)
					p3:Delete()
				end
				currentTime = 0
			end
		else
			absolutePosition = var11.AbsolutePosition
			absoluteSize = var11.AbsoluteSize
			
			if absolutePosition.X < p13 and (p13 <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y < p14 and p14 <= absolutePosition.Y + absoluteSize.Y)) then
				local list = { 1e999, nil }
				
				for absoluteSize = 1, var33 do
					local var69 = t_2[absoluteSize]
					local frame = var69.Frame
					local magnitude = (frame.AbsolutePosition + frame.AbsoluteSize / 2 - Vector2.new(p13, p14)).magnitude
					
					if magnitude < list[1] then
						list = { magnitude, var69 }
					end
				end
				local var70 = list[2]
				
				if var70 ~= p3 then
					p3:Swap(var70)
					
					if var33 < p3.Index then
						absolutePosition = p3.Tool
						
						if absolutePosition then
							if absolutePosition and (if absolutePosition:IsA("HopperBin") then absolutePosition.Active else absolutePosition.Parent == var21) and var22 then
								var22:UnequipTools()
								
								if var26 then
									var26:ToggleSelect()
									t_3[var26]:UpdateEquipView()
									var26 = nil
								end
							end
							if var30 then
								p3.Frame.Visible = false
								p3.Frame.Parent = var14
							end
						else
							p3:Delete()
						end
					end
				end
			elseif p3.Index <= var33 then
				p3:MoveToInventory()
			end
		end
		var67 = currentTime
	end)
	var47.Parent = p2
	t_2[p3] = p3
	
	if var33 < p3 then
		UpdateScrollingFrameCanvasSize()
		
		if var16 and var14.Visible and not var30 then
			var16.CanvasPosition = Vector2.new(0, math.max(0, var16.CanvasSize.Y.Offset - var16.AbsoluteSize.Y))
		end
	end
	return p3
end

local _ = function(value)
	-- upvalues: var33 (write), t_2 (ref), MakeSlot (ref), var11 (write), var24 (write), var25 (write), UpdateBackpackLayout (ref)
	if var33 ~= value then
		local var71 = var33
		
		if value < var71 then
			for i = var71, value + 1, -1 do
				local var72 = t_2[i]
				
				if var72 then
					var72:MoveToInventory()
					var72:Delete()
				end
			end
			for i_1 = var71, value + 1, -1 do
				local var73 = t_2[i_1]
				
				if not var73.Tool then
					var73:Delete()
				end
			end
		else
			for i_2 = var71, value do
				var33 = i_2
				
				if not t_2[i_2] then
					local var74 = MakeSlot(var11, i_2)
					var74.Frame.Visible = false
					
					if not var24 then
						var24 = var74
					end
				end
				local _ = t_2[i_2]
				local tool = t_2[i_2].Tool
				local var75 = MakeSlot(var11, i_2)
				
				if tool then
					var75:Fill(tool)
				elseif not var24 then
					var24 = var75
				end
			end
		end
		var33 = value
		var25 = 0
		
		for i_2 = 1, var33 do
			if t_2[i_2] and t_2[i_2].Tool then
				var25 += 1
			end
		end
		UpdateBackpackLayout()
	end
end

local function OnChildAdded(p15)
	-- upvalues: var10 (write), var21 (write), var22 (write), var32 (write), var26 (write), t_3 (ref), var27 (write), localPlayer (write), var24 (write), MakeSlot (ref), var17 (write), t_2 (ref), var23 (write), AdjustHotbarFrames (ref), var33 (write), var14 (write), t (ref)
	if not var10 then return end
	if p15:IsA("Tool") or p15:IsA("HopperBin") then
		if p15.Parent == var21 then
			var32 = tick()
		end
		if var26 and p15.Parent == var21 then
			var26:ToggleSelect()
			t_3[var26]:UpdateEquipView()
			var26 = nil
		end
		if not var27 and p15.Parent == var21 and not t_3[p15] then
			local starterGear = localPlayer:FindFirstChild("StarterGear")
			
			if starterGear and starterGear:FindFirstChild(p15.Name) then
				var27 = true
				
				for i = (var24 or MakeSlot(var17)).Index, 1, -1 do
					local var76 = t_2[i]
					local var77 = i - 1
					
					if var77 > 0 then
						t_2[var77]:Swap(var76)
					else
						var76:Fill(p15)
					end
				end
				for i_1, v in pairs(var21:GetChildren()) do
					if v:IsA("Tool") and v ~= p15 then
						v.Parent = var23
					end
				end
				AdjustHotbarFrames()
				
				return
			else
				local var78 = t_3[p15]
				
				if var78 then
					var78:UpdateEquipView()
				else
					var78 = var24 or MakeSlot(var17)
					var78:Fill(p15)
					
					if var78.Index <= var33 and not var14.Visible then
						AdjustHotbarFrames()
					end
					if p15:IsA("HopperBin") and p15.Active then
						if var22 then
							var22:UnequipTools()
							
							if var26 then
								var26:ToggleSelect()
								t_3[var26]:UpdateEquipView()
								var26 = nil
							end
						end
						var26 = p15
					end
				end
				t.BackpackItemAdded:Fire()
				
				return
			end
		end
	elseif p15:IsA("Humanoid") and p15.Parent == var21 then
		var22 = p15
	end
end

local function OnChildRemoved(p16)
	-- upvalues: var10 (write), var32 (write), var21 (write), var23 (write), t_3 (ref), var33 (write), var14 (write), AdjustHotbarFrames (ref), var26 (write), t (ref), t_2 (ref)
	if not var10 then return end
	if not p16:IsA("Tool") and not p16:IsA("HopperBin") then return end
	var32 = tick()
	local parent = p16.Parent
	
	if parent == var21 or parent == var23 then return end
	local var79 = t_3[p16]
	
	if var79 then
		var79:Clear()
		
		if var33 < var79.Index then
			var79:Delete()
		elseif not var14.Visible then
			AdjustHotbarFrames()
		end
	end
	if p16 == var26 then
		var26 = nil
	end
	local var80
	t.BackpackItemRemoved:Fire()
	
	for i = var33 + 1, #t_2 do
		local var81 = t_2[i]
		
		if not var81 or not var81.Tool then
			continue
		end
		var80 = false
		if var80 then
			t.BackpackEmpty:Fire()
		end
		return
	end
	var80 = true
end

local function OnCharacterAdded(p17)
	-- upvalues: t_2 (ref), var33 (write), var26 (write), t_7 (write), var21 (write), OnChildRemoved (ref), OnChildAdded (ref), var23 (write), localPlayer (write), AdjustHotbarFrames (ref)
	for i = #t_2, 1, -1 do
		local var82 = t_2[i]
		
		if var82.Tool then
			var82:Clear()
		end
		if var33 < i then
			var82:Delete()
		end
	end
	var26 = nil
	
	for i_1, v in pairs(t_7) do
		v:disconnect()
	end
	t_7 = {}
	var21 = p17
	table.insert(t_7, p17.ChildRemoved:connect(OnChildRemoved))
	table.insert(t_7, p17.ChildAdded:connect(OnChildAdded))
	
	for i_2, v_1 in pairs(p17:GetChildren()) do
		OnChildAdded(v_1)
	end
	var23 = localPlayer:WaitForChild("Backpack")
	table.insert(t_7, var23.ChildRemoved:connect(OnChildRemoved))
	table.insert(t_7, var23.ChildAdded:connect(OnChildAdded))
	
	for i_3, v_2 in pairs(var23:GetChildren()) do
		OnChildAdded(v_2)
	end
	AdjustHotbarFrames()
end

local function OnInputBegan(p18, p19)
	-- upvalues: var29 (write), var28 (write), value_2 (ref), t_4 (ref), var14 (write), t (ref)
	if p18.UserInputType == Enum.UserInputType.Keyboard and not var29 and (var28 or p18.KeyCode.Value == value_2) then
		local value = t_4[p18.KeyCode.Value]
		
		if value then
			value(p19)
		end
	end
	local userInputType = p18.UserInputType
	
	if not p19 and (userInputType == Enum.UserInputType.MouseButton1 or userInputType == Enum.UserInputType.Touch) and (var14 and var14.Visible) then
		t.OpenClose()
	end
end

local function OnUISChanged(p18)
	-- upvalues: userInputService (ref), VRService (ref), var33 (write), t_2 (ref)
	if p18 == "KeyboardEnabled" or p18 == "VREnabled" then
		local var83 = userInputService.KeyboardEnabled and not VRService.VREnabled
		
		for i = 1, var33 do
			t_2[i]:TurnNumber(var83)
		end
	end
end

local var84 = nil
local var85 = nil

local var86 = function() end

local vector2 = Vector2.new(0, 0)

function unbindAllGamepadEquipActions()
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindAction("RBXBackpackHasGamepadFocus")
	contextActionService:UnbindAction("RBXCloseInventory")
end

local _ = function(value, p19)
	-- upvalues: var33 (write), t_2 (ref)
	for i = 1, var33 do
		local var87 = t_2[i]
		
		if var87 and var87.Frame and (p19 or var87.Tool) then
			var87.Frame.Visible = value
		end
	end
end

local function getInputDirection(p20)
	-- upvalues: vector2 (write)
	local var88 = if p20.UserInputState == Enum.UserInputState.End then -1 else 1
	
	if p20.KeyCode == Enum.KeyCode.Thumbstick1 then
		local magnitude = p20.Position.magnitude
		vector2 = if magnitude > 0.98 then Vector2.new(p20.Position.x / magnitude, -p20.Position.y / magnitude) else Vector2.new(0, 0)
	else
		vector2 = if p20.KeyCode == Enum.KeyCode.DPadLeft then Vector2.new(vector2.x - var88 * 1, vector2.y) elseif p20.KeyCode == Enum.KeyCode.DPadRight then Vector2.new(vector2.x + var88 * 1, vector2.y) elseif p20.KeyCode == Enum.KeyCode.DPadUp then Vector2.new(vector2.x, vector2.y - var88 * 1) elseif p20.KeyCode == Enum.KeyCode.DPadDown then Vector2.new(vector2.x, vector2.y + var88 * 1) else Vector2.new(0, 0)
	end
	return vector2
end

local _ = function(_, _, p20)
	-- upvalues: getInputDirection (ref), var33 (write), t_2 (ref), var22 (write), var26 (write), t_3 (ref)
	local var88 = getInputDirection(p20)
	
	if var88 == Vector2.new(0, 0) then return end
	local var89 = math.atan2(var88.y, var88.x) - -1.570796326795
	
	if var89 < 0 then
		var89 += 6.28318530718
	end
	local floored = math.floor(var89 / 0.785398163397 + 1 + 0.5)
	
	if var33 < floored then
		floored = 1
	end
	if floored > 0 then
		local var90 = t_2[floored]
		
		if var90 and var90.Tool and not var90:IsEquipped() then
			var90:Select()
			
			return
		end
	elseif var22 then
		var22:UnequipTools()
		
		if var26 then
			var26:ToggleSelect()
			t_3[var26]:UpdateEquipView()
			var26 = nil
		end
	end
end

var36 = function(_, p20, p21)
	-- upvalues: var84 (write), var85 (write), var22 (write), var26 (write), t_3 (ref), var33 (write), t_2 (ref), var35 (write)
	if p20 ~= Enum.UserInputState.Begin then return end
	if not var84 or (var84.KeyCode ~= Enum.KeyCode.ButtonR1 or p21.KeyCode ~= Enum.KeyCode.ButtonL1) and (var84.KeyCode ~= Enum.KeyCode.ButtonL1 or p21.KeyCode ~= Enum.KeyCode.ButtonR1) or tick() - var85 > 0.06 then
		var84 = p21
		var85 = tick()
		delay(0.06, function()
			-- upvalues: var84 (copy), p21 (ref), var33 (copy), t_2 (copy), var22 (copy), var26 (copy), t_3 (copy), var35 (copy)
			if var84 ~= p21 then return end
			local var88
			local var89 = if p21.KeyCode == Enum.KeyCode.ButtonL1 then -1 else 1
			
			for i = 1, var33 do
				local var90 = t_2[i]
				
				if var90 then
					if not var90:IsEquipped() then
						continue
					end
					var88 = var89 + i
					local var91 = false
					
					if var33 < var88 then
						var88 = 1
						var91 = true
					elseif var88 < 1 then
						var88 = var33
						var91 = true
					end
					local var92 = var88
					while not t_2[var88].Tool do
						var88 += var89
						
						if var88 ~= var92 then
							if var33 < var88 then
								var88 = 1
								var91 = true
							elseif var88 < 1 then
								var88 = var33
								var91 = true
							end
						end
						return
					end
					if var91 then
						if var22 then
							var22:UnequipTools()
							
							if var26 then
								var26:ToggleSelect()
								t_3[var26]:UpdateEquipView()
								var26 = nil
							end
						end
						var35 = nil
						
						return
					else
						t_2[var88]:Select()
						
						return
					end
				end
				return
			end
			if var35 and var35.Tool then
				var35:Select()
				
				return
			end
			for var88 = if var89 == -1 then var33 else 1, if var89 == -1 then 1 else var33, var89 do
				if not t_2[var88].Tool then
					continue
				end
				t_2[var88]:Select()
				
				return
			end
		end)
		
		return
	elseif var22 then
		var22:UnequipTools()
		
		if var26 then
			var26:ToggleSelect()
			t_3[var26]:UpdateEquipView()
			var26 = nil
		end
	end
	var84 = p21
	var85 = tick()
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
	-- upvalues: gamepadService (ref), guiService (ref), var15 (write), var33 (write)
	if p22.Frame == guiService.SelectedCoreObject and not gamepadService.GamepadCursorEnabled then
		local var93 = getGamepadSwapSlot()
		
		if var93 then
			var93.Frame.BorderSizePixel = 0
			
			if var93 ~= p22 then
				p22:Swap(var93)
				
				if var15 and var15.SelectionImageObject then
					var15.SelectionImageObject.Visible = false
				end
				if var33 < p22.Index and not p22.Tool then
					if guiService.SelectedCoreObject == p22.Frame then
						guiService.SelectedCoreObject = var93.Frame
					end
					p22:Delete()
				end
				if var33 >= var93.Index or var93.Tool then return end
				if guiService.SelectedCoreObject == var93.Frame then
					guiService.SelectedCoreObject = p22.Frame
				end
				var93:Delete()
				
				return
			end
		else
			local size = p22.Frame.Size
			local position = p22.Frame.Position
			p22.Frame:TweenSizeAndPositionInternal(size + UDim2.new(0, 10, 0, 10), position - UDim2.new(0, 5, 0, 5), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, function()
				-- upvalues: p22 (ref), size (ref), position (ref)
				p22.Frame:TweenSizeAndPositionInternal(size, position, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true)
			end)
			p22.Frame.BorderSizePixel = 3
			
			if var15 and var15.SelectionImageObject then
				var15.SelectionImageObject.Visible = true
				
				return
			end
		end
	else
		p22:Select()
		
		if var15 and var15.SelectionImageObject then
			var15.SelectionImageObject.Visible = false
		end
	end
end

function enableGamepadInventoryControl()
	-- upvalues: var14 (write), t (ref), contextActionService (ref), var86 (ref), var11 (write), guiService (ref)
	local var93 = function(_, p22, _)
		-- upvalues: var14 (copy), t (copy)
		if p22 ~= Enum.UserInputState.Begin then return end
		if getGamepadSwapSlot() then
			local var94 = getGamepadSwapSlot()
			
			if var94 then
				var94.Frame.BorderSizePixel = 0
				
				return
			end
		elseif var14 and var14.Visible then
			t.OpenClose()
		end
	end
	
	contextActionService:BindAction("RBXBackpackHasGamepadFocus", var86, false, Enum.UserInputType.Gamepad1)
	contextActionService:BindAction("RBXCloseInventory", var93, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart)
	local _ = false
	
	if var11 then
		guiService.SelectedCoreObject = var11:FindFirstChild("1")
	end
end

function disableGamepadInventoryControl()
	-- upvalues: var33 (write), t_2 (ref), var10 (write), guiService (ref)
	unbindAllGamepadEquipActions()
	
	for i = 1, var33 do
		local var93 = t_2[i]
		
		if var93 and var93.Frame then
			var93.Frame.BorderSizePixel = 0
		end
	end
	if var10 and guiService.SelectedCoreObject and guiService.SelectedCoreObject:IsDescendantOf(var10) then
		guiService.SelectedCoreObject = nil
	end
end

local _ = function()
	-- upvalues: var28 (write), var8 (write), contextActionService (ref), var36 (write)
	if var28 and not var8 then
		var8 = true
		contextActionService:BindAction("RBXHotbarEquip", var36, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
	end
end

local _ = function()
	-- upvalues: var8 (write), contextActionService (ref)
	disableGamepadInventoryControl()
	var8 = false
	contextActionService:UnbindAction("RBXHotbarEquip")
end

function gamepadDisconnected()
	-- upvalues: VRService (ref), var31 (write)
	if not VRService.VREnabled then
		var31 = false
		disableGamepadInventoryControl()
	end
end

function gamepadConnected()
	-- upvalues: VRService (ref), var31 (write), var10 (write), guiService (ref), var25 (write), var28 (write), var8 (write), contextActionService (ref), var36 (write), var14 (write)
	if not VRService.VREnabled then
		var31 = true
		
		if var10 then
			guiService:AddSelectionParent("RBXBackpackSelection", var10)
		end
		if var25 >= 1 and var28 and not var8 then
			var8 = true
			contextActionService:BindAction("RBXHotbarEquip", var36, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
		end
		if var14 and var14.Visible then
			enableGamepadInventoryControl()
		end
	end
end

local function setBackpackEnabled(value)
	-- upvalues: var7 (write), var28 (write), var10 (write), fFlagMountCoreGuiBackpackModule (ref), robloxGui (ref), t_6 (ref), guiService (ref), var25 (write), var8 (write), contextActionService (ref), var36 (write)
	local var94 = value and var7
	var28 = var94
	
	if var10 then
		if not fFlagMountCoreGuiBackpackModule then
			var10.Visible = var94
		elseif var94 then
			var10.Parent = robloxGui
		else
			var10.Parent = nil
		end
	end
	for i, v in pairs(t_6) do
		if var94 then
			guiService:AddKey(v)
		else
			guiService:RemoveKey(v)
		end
	end
	if var94 then
		if var25 >= 1 and var28 and not var8 then
			var8 = true
			contextActionService:BindAction("RBXHotbarEquip", var36, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
			
			return
		end
	else
		disableGamepadInventoryControl()
		var8 = false
		contextActionService:UnbindAction("RBXHotbarEquip")
	end
end

local function MakeVRRoundButton(value, p22)
	-- upvalues: NewGui (ref)
	local var95 = NewGui("ImageButton", value)
	var95.Size = UDim2.new(0, 40, 0, 40)
	var95.Image = "rbxasset://textures/ui/Keyboard/close_button_background.png"
	local var96 = NewGui("ImageLabel", "Icon")
	var96.Size = UDim2.new(0.5, 0, 0.5, 0)
	var96.Position = UDim2.new(0.25, 0, 0.25, 0)
	var96.Image = p22
	var96.Parent = var95
	local var97 = NewGui("ImageLabel", "Selection")
	var97.Size = UDim2.new(0.9, 0, 0.9, 0)
	var97.Position = UDim2.new(0.05, 0, 0.05, 0)
	var97.Image = "rbxasset://textures/ui/Keyboard/close_button_selection.png"
	var95.SelectionImageObject = var97
	
	return var95, var96, var97
end

function t.createGui()
	-- upvalues: var10 (write), NewGui (ref), fFlagMountCoreGuiBackpackModule (ref), starterGuiService (ref), robloxGui (ref), var11 (write), var33 (write), MakeSlot (ref), var24 (write), var12 (write), t (ref), color3_4 (ref), var13 (write), MakeVRRoundButton (ref), var14 (write), var2 (write), color3 (ref), var15 (write), var16 (write), var17 (write), var18 (write), var1 (write), var19 (write), var20 (write), UpdateBackpackLayout (ref), create (ref), var6 (ref), color3_5 (ref), var5 (write), var4 (write), color3_2 (ref), t_2 (ref), var30 (write), UpdateScrollingFrameCanvasSize (ref), t_8 (ref), t_4 (ref), VRService (ref), userInputService (ref), guiService (ref), t_5 (ref), AdjustHotbarFrames (ref), var31 (write), t_1 (ref), contextActionService (ref), value (ref), localPlayer (write), playersService (ref), OnCharacterAdded (ref), t_6 (ref), OnInputBegan (ref), var29 (write), value_2 (ref), var26 (write), var22 (write), t_3 (ref), OnUISChanged (ref), enableHotbarHide (ref), settingsShowSignal (ref), isInExperienceUIVREnabled (ref), inExperienceUIVRIXP (ref), inExperienceAppChatModalModule (ref), userGameSettingsService (ref), var3 (write)
	var10 = NewGui("Frame", "Backpack")
	
	if not fFlagMountCoreGuiBackpackModule then
		var10.Visible = false
		var10.Parent = robloxGui
	elseif starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack) then
		var10.Parent = robloxGui
	end
	var11 = NewGui("Frame", "Hotbar")
	var11.Parent = var10
	
	for i = 1, var33 do
		local var95 = MakeSlot(var11, i)
		var95.Frame.Visible = false
		
		if not var24 then
			var24 = var95
		end
	end
	var12 = NewGui("ImageButton", "OpenInventory")
	var12.Size = UDim2.new(0, 30, 0, 30)
	var12.Image = "rbxasset://textures/ui/Backpack/ScrollUpArrow.png"
	var12.MouseButton1Click:connect(function()
		-- upvalues: t (copy)
		t.OpenClose()
	end)
	var12.SelectionGained:connect(function()
		-- upvalues: var12 (copy), color3_4 (copy)
		var12.ImageColor3 = color3_4
	end)
	var12.SelectionLost:connect(function()
		-- upvalues: var12 (copy)
		var12.ImageColor3 = Color3.new(1, 1, 1)
	end)
	local var96 = NewGui("Frame", "Selection")
	var96.Visible = false
	var12.SelectionImageObject = var96
	var13 = MakeVRRoundButton("CloseInventory", "rbxasset://textures/ui/Keyboard/close_button_icon.png")
	var13.Position = UDim2.new(0, 0, 0, -50)
	var13.MouseButton1Click:connect(function()
		-- upvalues: var14 (copy), t (copy)
		if var14.Visible then
			t.OpenClose()
		end
	end)
	local var97 = NewGui("ImageLabel", "LeftBumper")
	var97.Size = UDim2.new(0, 40, 0, 40)
	var97.Position = UDim2.new(0, -var97.Size.X.Offset, 0.5, -var97.Size.Y.Offset / 2)
	local var98 = NewGui("ImageLabel", "RightBumper")
	var98.Size = UDim2.new(0, 40, 0, 40)
	var98.Position = UDim2.new(1, 0, 0.5, -var98.Size.Y.Offset / 2)
	var14 = NewGui("Frame", "Inventory")
	var14.BackgroundTransparency = var2
	var14.BackgroundColor3 = color3
	var14.Active = true
	var14.Visible = false
	var14.Parent = var10
	var15 = NewGui("TextButton", "VRInventorySelector")
	var15.Position = UDim2.new(0, 0, 0, 0)
	var15.Size = UDim2.new(1, 0, 1, 0)
	var15.BackgroundTransparency = 1
	var15.Text = ""
	var15.Parent = var14
	local var99 = NewGui("ImageLabel", "Selector")
	var99.Size = UDim2.new(1, 0, 1, 0)
	var99.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png"
	var99.ScaleType = Enum.ScaleType.Slice
	var99.SliceCenter = Rect.new(12, 12, 52, 52)
	var99.Visible = false
	var15.SelectionImageObject = var99
	var16 = NewGui("ScrollingFrame", "ScrollingFrame")
	var16.Selectable = false
	var16.CanvasSize = UDim2.new(0, 0, 0, 0)
	var16.Parent = var14
	var17 = NewGui("Frame", "UIGridFrame")
	var17.Selectable = false
	var17.Size = UDim2.new(1, -10, 1, 0)
	var17.Position = UDim2.new(0, 5, 0, 0)
	var17.Parent = var16
	var18 = Instance.new("UIGridLayout")
	var18.SortOrder = Enum.SortOrder.LayoutOrder
	var18.CellSize = UDim2.new(0, var1, 0, var1)
	var18.CellPadding = UDim2.new(0, 5, 0, 5)
	var18.Parent = var17
	var19 = MakeVRRoundButton("ScrollUpButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png")
	var19.Size = UDim2.new(0, 34, 0, 34)
	var19.Position = UDim2.new(0.5, -var19.Size.X.Offset / 2, 0, 43)
	var19.Icon.Position -= UDim2.new(0, 0, 0, 2)
	var19.MouseButton1Click:connect(function()
		-- upvalues: var16 (copy), var1 (copy)
		if var16 then
			var16.CanvasPosition = Vector2.new(var16.CanvasPosition.X, math.min(var16.CanvasSize.Y.Offset - var16.AbsoluteWindowSize.Y, math.max(0, var16.CanvasPosition.Y - (var1 + 5))))
			
			return
		end
	end)
	var20 = MakeVRRoundButton("ScrollDownButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png")
	var20.Rotation = 180
	var20.Icon.Position -= UDim2.new(0, 0, 0, 2)
	var20.Size = UDim2.new(0, 34, 0, 34)
	var20.Position = UDim2.new(0.5, -var20.Size.X.Offset / 2, 1, (-var20.Size.Y.Offset) - 3)
	var20.MouseButton1Click:connect(function()
		-- upvalues: var16 (copy), var1 (copy)
		if var16 then
			var16.CanvasPosition = Vector2.new(var16.CanvasPosition.X, math.min(var16.CanvasSize.Y.Offset - var16.AbsoluteWindowSize.Y, math.max(0, var16.CanvasPosition.Y + (var1 + 5))))
			
			return
		end
	end)
	var16.Changed:connect(function(p22)
		-- upvalues: var16 (copy), var19 (copy), var20 (copy)
		if not var16 then return end
		if p22 == "AbsoluteWindowSize" or p22 == "CanvasPosition" or p22 == "CanvasSize" then
			local var100 = var16.CanvasPosition.Y < var16.CanvasSize.Y.Offset - var16.AbsoluteWindowSize.Y
			var19.Visible = var16.CanvasPosition.Y ~= 0
			var20.Visible = var100
		end
	end)
	UpdateBackpackLayout()
	local var100 = create("Frame")({
		Name = "GamepadHintsFrame",
		BackgroundTransparency = 1,
		Visible = false,
		Size = UDim2.new(0, var11.Size.X.Offset, 0, if var6 then 95 else 60),
		Parent = var10
	})
	
	local function addGamepadHint(p22, p23, p24)
		-- upvalues: create (copy), var100 (ref), var6 (copy)
		local var101 = create("Frame")({
			Name = "HintFrame",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, -5),
			Position = UDim2.new(0, 0, 0, 0),
			Parent = var100
		})
		local _ = create("ImageLabel")({
			Name = "HintImage",
			BackgroundTransparency = 1,
			Size = var6 and UDim2.new(0, 90, 0, 90) or UDim2.new(0, 60, 0, 60),
			Image = if var6 then p23 else p22,
			Parent = var101
		})
		local var102 = create("TextLabel")({
			Name = "HintText",
			BackgroundTransparency = 1,
			TextWrapped = true,
			Position = UDim2.new(0, if var6 then 100 else 70, 0, 0),
			Size = UDim2.new(1, -(if var6 then 100 else 70), 1, 0),
			Font = Enum.Font.SourceSansBold,
			FontSize = if var6 then Enum.FontSize.Size36 else Enum.FontSize.Size24,
			Text = p24,
			TextColor3 = Color3.new(1, 1, 1),
			TextXAlignment = Enum.TextXAlignment.Left,
			Parent = var101
		})
		local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
		UITextSizeConstraint.Parent = var102
		UITextSizeConstraint.MaxTextSize = var102.TextSize
	end
	
	local function resizeGamepadHintsFrame()
		-- upvalues: var11 (copy), var14 (copy), var100 (ref), var6 (copy)
		if not var11 or not var14 then return end
		var100.Size = UDim2.new(var11.Size.X.Scale, var11.Size.X.Offset, 0, if var6 then 95 else 60)
		var100.Position = UDim2.new(var11.Position.X.Scale, var11.Position.X.Offset, var14.Position.Y.Scale, var14.Position.Y.Offset - var100.Size.Y.Offset)
		local var101 = 0
		local children = var100:GetChildren()
		
		for i = 1, #children do
			children[i].Size = UDim2.new(1, 0, 1, -5)
			children[i].Position = UDim2.new(0, 0, 0, 0)
			var101 += children[i].HintText.Position.X.Offset + children[i].HintText.TextBounds.X
		end
		local var102 = (var100.AbsoluteSize.X - var101) / (#children - 1)
		
		for i_1 = 1, #children do
			children[i_1].Position = i_1 == 1 and UDim2.new(0, 0, 0, 0) or UDim2.new(0, children[i_1 - 1].Position.X.Offset + children[i_1 - 1].Size.X.Offset + var102, 0, 0)
			children[i_1].Size = UDim2.new(0, children[i_1].HintText.Position.X.Offset + children[i_1].HintText.TextBounds.X, 1, -5)
		end
	end
	
	addGamepadHint("rbxasset://textures/ui/Controls/DesignSystem/ButtonX.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonX@2x.png", "Remove From Hotbar")
	addGamepadHint("rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonA@2x.png", "Select/Swap")
	addGamepadHint("rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonB@2x.png", "Close Backpack")
	local var103 = NewGui("Frame", "Search")
	var103.BackgroundColor3 = color3_5
	var103.BackgroundTransparency = var5
	var103.Size = UDim2.new(0, 190, 0, 30)
	var103.Position = UDim2.new(1, (-var103.Size.X.Offset) - 5, 0, 5)
	var103.Parent = var14
	local var104 = NewGui("TextBox", "TextBox")
	var104.Text = var4
	var104.ClearTextOnFocus = false
	var104.FontSize = Enum.FontSize.Size24
	var104.TextXAlignment = Enum.TextXAlignment.Left
	var104.Size = var103.Size - UDim2.new(0, 0, 0, 0)
	var104.Position = UDim2.new(0, 0, 0, 0)
	var104.Parent = var103
	local var105 = NewGui("TextButton", "X")
	var105.Text = "x"
	var105.TextColor3 = color3_2
	var105.FontSize = Enum.FontSize.Size24
	var105.TextYAlignment = Enum.TextYAlignment.Bottom
	var105.BackgroundColor3 = color3_5
	var105.BackgroundTransparency = 0
	var105.Size = UDim2.new(0, var103.Size.Y.Offset - 10, 0, var103.Size.Y.Offset - 10)
	var105.Position = UDim2.new(1, (-var105.Size.X.Offset) - 10, 0.5, -var105.Size.Y.Offset / 2)
	var105.ZIndex = 0
	var105.Visible = false
	var105.BorderSizePixel = 0
	var105.Parent = var103
	
	local function search()
		-- upvalues: var104 (ref), var33 (copy), t_2 (copy), var14 (copy), var30 (copy), var17 (copy), var16 (copy), UpdateScrollingFrameCanvasSize (copy), var105 (ref)
		local t = {}
		
		for i in var104.Text:gmatch("%S+") do
			t[i:lower()] = true
		end
		local t_1 = {}
		
		for i_1 = var33 + 1, #t_2 do
			local var106 = t_2[i_1]
			table.insert(t_1, { var106, var106:CheckTerms(t) })
			var106.Frame.Visible = false
			var106.Frame.Parent = var14
		end
		table.sort(t_1, function(p22, p23)
			return p23[2] < p22[2]
		end)
		var30 = true
		local var107 = 0
		
		for i_2, v in ipairs(t_1) do
			local var108 = v[1]
			
			if v[2] > 0 then
				var108.Frame.Visible = true
				var108.Frame.Parent = var17
				var108.Frame.LayoutOrder = var33 + var107
				var107 += 1
			end
		end
		if var16 then
			var16.CanvasPosition = Vector2.new(0, 0)
		end
		UpdateScrollingFrameCanvasSize()
		var105.ZIndex = 3
	end
	
	local function clearResults()
		-- upvalues: var105 (ref), var30 (copy), var33 (copy), t_2 (copy), var17 (copy), UpdateScrollingFrameCanvasSize (copy)
		if var105.ZIndex > 0 then
			var30 = false
			
			for i = var33 + 1, #t_2 do
				local var109 = t_2[i]
				var109.Frame.LayoutOrder = var109.Index
				var109.Frame.Parent = var17
				var109.Frame.Visible = true
			end
			var105.ZIndex = 0
		end
		UpdateScrollingFrameCanvasSize()
	end
	
	local function reset()
		-- upvalues: clearResults (ref), var104 (ref), var4 (copy)
		clearResults()
		var104.Text = var4
	end
	
	local function onChanged(p22)
		-- upvalues: var104 (ref), clearResults (ref), var4 (copy), search (ref), var105 (ref)
		if p22 == "Text" then
			local text = var104.Text
			
			if text == "" then
				clearResults()
			elseif text ~= var4 then
				search()
			end
			var105.Visible = text ~= "" and text ~= var4
		end
	end
	
	local function focusLost(p22)
		-- upvalues: search (ref), var104 (ref), var4 (copy)
		if p22 then
			search()
			
			return
		elseif var104.Text == "" then
			var104.Text = var4
		end
	end
	
	var104.Focused:connect(function()
		-- upvalues: var104 (ref), var4 (copy)
		if var104.Text == var4 then
			var104.Text = ""
		end
	end)
	var105.MouseButton1Click:connect(reset)
	var104.Changed:connect(onChanged)
	var104.FocusLost:connect(focusLost)
	table.insert(t_8, t.StateChanged.Event:connect(function(p22)
		-- upvalues: var105 (ref), clearResults (ref), var104 (ref), var4 (copy)
		var105.Modal = p22
		
		if not p22 then
			clearResults()
			var104.Text = var4
		end
	end))
	
	t_4[Enum.KeyCode.Escape.Value] = function(p22)
		-- upvalues: clearResults (ref), var104 (ref), var4 (copy), var14 (copy), t (copy)
		if p22 then
			clearResults()
			var104.Text = var4
			
			return
		elseif var14 and var14.Visible then
			t.OpenClose()
		end
	end
	
	table.insert(t_8, userInputService.LastInputTypeChanged:connect(function(p22)
		-- upvalues: VRService (copy), var103 (ref)
		if p22 == Enum.UserInputType.Gamepad1 and not VRService.VREnabled then
			var103.Visible = false
			
			return
		end
		var103.Visible = true
	end))
	
	local var110 = function(_, p22, _)
		-- upvalues: guiService (copy), var33 (copy), t_2 (copy)
		if p22 ~= Enum.UserInputState.Begin then return end
		if not guiService.SelectedCoreObject then return end
		for i = 1, var33 do
			if t_2[i].Frame ~= guiService.SelectedCoreObject or not t_2[i].Tool then
				continue
			end
			t_2[i]:MoveToInventory()
			
			return
		end
	end
	
	local function openClose()
		-- upvalues: var14 (copy), t_5 (copy), AdjustHotbarFrames (copy), var11 (copy), var33 (copy), t_2 (copy), var31 (copy), t_1 (copy), userInputService (copy), resizeGamepadHintsFrame (ref), var100 (ref), contextActionService (copy), var110 (ref), t (copy)
		if not var14 then return end
		if not next(t_5) then
			var14.Visible = not var14.Visible
			local visible = var14.Visible
			AdjustHotbarFrames()
			var11.Active = not var11.Active
			
			for i = 1, var33 do
				t_2[i]:SetClickability(not visible)
			end
		end
		if not var14.Visible then
			if var31 then
				var100.Visible = false
			end
			disableGamepadInventoryControl()
		elseif var31 then
			if t_1[userInputService:GetLastInputType()] then
				resizeGamepadHintsFrame()
				var100.Visible = true
			end
			enableGamepadInventoryControl()
		end
		if var14.Visible then
			contextActionService:BindAction("RBXRemoveSlot", var110, false, Enum.KeyCode.ButtonX)
		else
			contextActionService:UnbindAction("RBXRemoveSlot")
		end
		t.IsOpen = var14.Visible
		t.StateChanged:Fire(var14.Visible)
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
		-- upvalues: var29 (copy)
		var29 = true
	end))
	table.insert(t_8, userInputService.TextBoxFocusReleased:connect(function()
		-- upvalues: var29 (copy)
		var29 = false
	end))
	
	t_4[value_2] = function()
		-- upvalues: var26 (copy), var22 (copy), t_3 (copy)
		if var26 and var22 then
			var22:UnequipTools()
			
			if var26 then
				var26:ToggleSelect()
				t_3[var26]:UpdateEquipView()
				var26 = nil
			end
		end
	end
	
	table.insert(t_8, userInputService.Changed:connect(OnUISChanged))
	local var111 = userInputService.KeyboardEnabled and not VRService.VREnabled
	
	for i_2 = 1, var33 do
		t_2[i_2]:TurnNumber(var111)
	end
	if userInputService:GetGamepadConnected(Enum.UserInputType.Gamepad1) then
		gamepadConnected()
	end
	table.insert(t_8, userInputService.GamepadConnected:connect(function(p23)
		if p23 == Enum.UserInputType.Gamepad1 then
			gamepadConnected()
		end
	end))
	table.insert(t_8, userInputService.GamepadDisconnected:connect(function(p23)
		if p23 == Enum.UserInputType.Gamepad1 then
			gamepadDisconnected()
		end
	end))
	
	if enableHotbarHide then
		table.insert(t_8, settingsShowSignal:connect(function(p23)
			-- upvalues: t (copy), AdjustHotbarFrames (copy)
			if p23 then
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
	table.insert(t_8, inExperienceAppChatModalModule.default.visibilitySignal.Event:Connect(function(p23)
		-- upvalues: t (copy)
		if p23 and t.IsOpen then
			t.OpenClose()
		end
	end))
	table.insert(t_8, userGameSettingsService:GetPropertyChangedSignal("PreferredTransparency"):connect(function()
		-- upvalues: userGameSettingsService (copy), var2 (copy), var14 (copy), var3 (copy), t_2 (copy), var5 (copy), var103 (ref)
		local preferredTransparency = userGameSettingsService.PreferredTransparency
		var2 = 0.5 * userGameSettingsService.PreferredTransparency
		
		if var14 then
			var14.BackgroundTransparency = var2
		end
		var3 = 0.5 * preferredTransparency
		
		for i, v in ipairs(t_2) do
			v.Frame.BackgroundTransparency = var3
		end
		var5 = 0.15 * userGameSettingsService.PreferredTransparency
		var103.BackgroundTransparency = var5
	end))
end

function t.destroyGui()
	-- upvalues: t_8 (ref), t_7 (write), contextActionService (ref), t_2 (ref), t_3 (ref), t_4 (ref), t_5 (ref), t_6 (ref), var10 (write), var11 (write), var12 (write), var13 (write), var14 (write), var15 (write), var16 (write), var17 (write), var18 (write), var19 (write), var20 (write), var21 (write), var22 (write), var23 (write), var24 (write), var25 (write), var26 (write), var27 (write), var28 (write), var29 (write), var30 (write), var31 (write), var8 (write), var32 (write), var35 (write), t (ref)
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
		local var112 = t_2[i_2]
		
		if var112.Tool then
			var112:Clear()
		end
	end
	table.clear(t_2)
	table.clear(t_3)
	table.clear(t_4)
	table.clear(t_5)
	table.clear(t_6)
	
	if var10 then
		var10:Destroy()
		var10 = nil
	end
	var11 = nil
	var12 = nil
	var13 = nil
	var14 = nil
	var15 = nil
	var16 = nil
	var17 = nil
	var18 = nil
	var19 = nil
	var20 = nil
	var21 = nil
	var22 = nil
	var23 = nil
	var24 = nil
	var25 = 0
	var26 = nil
	var27 = false
	var28 = false
	var29 = false
	var30 = false
	var31 = false
	var8 = false
	var32 = 0
	var35 = nil
	t.OpenClose = nil
	t.IsOpen = false
	t.IsHotbarVisible = false
end

function t.TopbarEnabledChanged(_, p23)
	-- upvalues: var7 (write), setBackpackEnabled (ref), starterGuiService (ref)
	var7 = p23
	setBackpackEnabled(starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack))
end

if fFlagTopBarSignalizeSetCores then
	t.disposeEffect = signalsModule.createEffect(function(p23)
		-- upvalues: inExperienceTopBarModule (ref), t (ref)
		local getTopBarStore = inExperienceTopBarModule.Stores.GetTopBarStore
		
		if getTopBarStore then
			t:TopbarEnabledChanged(getTopBarStore(p23).getTopBarCoreGuiEnabled(p23))
		end
	end)
end
local features = systemModule.Features
local lifecycle = features.registerLifecycle(features.FeatureName.Backpack, {
	defaultVisible = false,
	coreGuiType = Enum.CoreGuiType.Backpack
}).lifecycle
lifecycle:onEnabledChanged(function(p23)
	-- upvalues: t (ref), setBackpackEnabled (ref)
	if p23 then
		t.createGui()
	else
		t.destroyGui()
	end
	setBackpackEnabled(p23)
end)
lifecycle:onVisibilityChanged(function(p23)
	-- upvalues: t (ref)
	if t.OpenClose and t.IsOpen ~= p23 then
		t.OpenClose()
	end
	return t.IsOpen
end)
t.StateChanged.Event:connect(function(p23)
	-- upvalues: lifecycle (ref)
	if lifecycle then
		lifecycle.setVisible(p23)
	end
end)

return t