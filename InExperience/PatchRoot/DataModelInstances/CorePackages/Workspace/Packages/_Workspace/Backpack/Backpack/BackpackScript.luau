local Parent = script:FindFirstAncestor("Backpack").Parent
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local Modules = RobloxGui.Modules
local SignalsModule = require(Parent.Signals)
local InExperienceTopBarModule = require(Parent.InExperienceTopBar)
local SettingsShowSignal = require(Parent.CoreScriptsCommon).SettingsShowSignal
local InExperienceAppChatModalModule = require(Parent.AppChat.InExperienceAppChatModal)
local FFlagMountCoreGuiBackpackModule = require(Modules.Flags.FFlagMountCoreGuiBackpack)
local IsInExperienceUIVREnabled = require(Parent.SharedExperimentDefinition).isInExperienceUIVREnabled
local InExperienceUIVRIXP = require(Parent.SharedExperimentDefinition).InExperienceUIVRIXP
local FFlagTopBarSignalizeSetCores = InExperienceTopBarModule.Flags.FFlagTopBarSignalizeSetCores
local RobloxTranslatorModule = require(Parent.RobloxTranslator)
local ResponsiveModule = require(Parent.Responsive)
local FFlagBackpackResponsiveUnits = require(Parent.SharedFlags).FFlagBackpackResponsiveUnits
local SystemModule = require(Parent.System)
local EnableHotbarHide = game:DefineFastFlag("EnableHotbarHide", false)
local FFlagStudioDeviceSimVRSwitchFixes = require(Parent.SharedFlags).FFlagStudioDeviceSimVRSwitchFixes
local Humanoid = {
	OpenClose = nil,
	IsHotbarVisible = false,
	IsOpen = false,
	StateChanged = Instance.new("BindableEvent"),
	ModuleName = "Backpack",
	KeepVRTopbarOpen = true,
	VRIsExclusive = true,
	VRClosesNonExclusive = true
}
local XOffset = 60
local Size14 = Enum.FontSize.Size14
local ScaledPreferredTransparency = 0.5 * UserGameSettings.PreferredTransparency
local _Color3 = Color3.new(0.12156862745098039, 0.12156862745098039, 0.12156862745098039)
local _Color3_1 = Color3.new(0.19215686274509805, 0.19215686274509805, 0.19215686274509805)
local _Color3_2 = Color3.new(0.35294117647058826, 0.5568627450980392, 0.9137254901960784)
local ScaledPreferredTransparency1 = 0.5 * UserGameSettings.PreferredTransparency
local _Color3_3 = Color3.new(1, 1, 1)
local _ = UDim2.new(0, 14, 0, 9)
local Value = Enum.KeyCode.Backquote.Value
local _Color3_4 = Color3.new(0, 0.6352941176470588, 1)
local InGameUnknownNamespaceBACKPACKSEARCH = "   Search"
local _Color3_5 = Color3.new(0.37, 0.37, 0.37)
local ScaledPreferredTransparency2 = 0.15 * UserGameSettings.PreferredTransparency
local Value1 = Enum.KeyCode.Zero.Value
local Value2 = Enum.KeyCode.Backspace.Value
local config = {
	[Enum.UserInputType.Gamepad1] = true,
	[Enum.UserInputType.Gamepad2] = true,
	[Enum.UserInputType.Gamepad3] = true,
	[Enum.UserInputType.Gamepad4] = true,
	[Enum.UserInputType.Gamepad5] = true,
	[Enum.UserInputType.Gamepad6] = true,
	[Enum.UserInputType.Gamepad7] = true,
	[Enum.UserInputType.Gamepad8] = true
}
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local GuiService = game:GetService("GuiService")
local ContextActionService = game:GetService("ContextActionService")
local VRService = game:GetService("VRService")
local GamepadService = game:GetService("GamepadService")
RobloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local IsEnabled = require(Modules.TenFootInterface):IsEnabled()
local CreateFunction = require(Parent.AppCommonLib).Create
local GameTranslatorModule = require(Modules.GameTranslator)
pcall(function()
	-- upvalues: InGameUnknownNamespaceBACKPACKSEARCH (ref), RobloxTranslatorModule (copy)
	InGameUnknownNamespaceBACKPACKSEARCH = RobloxTranslatorModule:FormatByKey("InGame.UnknownNamespace.BACKPACK_SEARCH")
end)
local v1 = true

if IsEnabled then
	XOffset = 100
	Size14 = Enum.FontSize.Size24
end
local Flag = false
local IsXBelow: boolean = if FFlagBackpackResponsiveUnits then ResponsiveModule.GetInputModeStore().getPreferredInputType() == ResponsiveModule.Input.Touch and GuiService:GetScreenResolution().X < 1024 else UserInputService.TouchEnabled and GuiService:GetScreenResolution().X < 1024
local LocalPlayer = Players.LocalPlayer
local Frame = nil
local Frame1 = nil
local ImageButton = nil
local CloseInventory = nil
local Frame2 = nil
local TextButton = nil
local ScrollingFrame = nil
local Frame3 = nil
local GridLayout = nil
local ScrollUpButton = nil
local ScrollDownButton = nil
local Parent1 = nil
local Humanoid1 = nil
local Backpack = nil
local List = {}
local v2 = nil
local Tbl = {}
local Tbl1 = {}
local Tbl2 = {}
local Count = 0
local HopperBin = nil
local Flag1 = false
local Flag2 = false
local Flag3 = false
local Flag4 = false
local List1 = {}
local List2 = {}
local List3 = {}
local Flag5 = false
local CurrentTime = 0
local NumberOfHotbarSlots: number = if IsXBelow then 3 else 10
local v3: number = if IsXBelow then 2 else 4
local v4 = nil
local v5 = nil
Humanoid.BackpackEmpty = CreateFunction("BindableEvent")({ Name = "BackpackEmpty" })
Humanoid.BackpackItemAdded = CreateFunction("BindableEvent")({ Name = "BackpackAdded" })
Humanoid.BackpackItemRemoved = CreateFunction("BindableEvent")({ Name = "BackpackRemoved" })

local function NewGui(p1, Name)
	-- upvalues: Size14 (ref)
	local NewInstance = Instance.new(p1)
	NewInstance.Name = Name
	NewInstance.BackgroundColor3 = Color3.new(0, 0, 0)
	NewInstance.BackgroundTransparency = 1
	NewInstance.BorderColor3 = Color3.new(0, 0, 0)
	NewInstance.BorderSizePixel = 0
	NewInstance.Size = UDim2.new(1, 0, 1, 0)
	
	if p1:match("Text") then
		NewInstance.TextColor3 = Color3.new(1, 1, 1)
		NewInstance.Text = ""
		NewInstance.Font = Enum.Font.SourceSans
		NewInstance.FontSize = Size14
		NewInstance.TextWrapped = true
		
		if p1 == "TextButton" then
			NewInstance.Font = Enum.Font.SourceSansBold
			NewInstance.BorderSizePixel = 1
		end
	end
	return NewInstance
end

local function _()
	-- upvalues: NumberOfHotbarSlots (ref), List (copy)
	local Entry = nil
	for i = 1, NumberOfHotbarSlots do
		Entry = List[i]
		
		if not Entry.Tool then
			return Entry
		end
	end
	return nil
end

function Humanoid.IsInventoryEmpty(): boolean
	-- upvalues: NumberOfHotbarSlots (ref), List (copy)
	for i = NumberOfHotbarSlots + 1, #List do
		local Entry = List[i]
		
		if Entry and Entry.Tool then
			return false
		end
	end
	return true
end

local _ = function(): boolean
	return false
end

local function AdjustHotbarFrames(p1)
	-- upvalues: Frame2 (ref), NumberOfHotbarSlots (ref), Count (ref), EnableHotbarHide (copy), List (copy), ImageButton (ref), Humanoid (copy)
	if not Frame2 then return end
	local Visible = Frame2.Visible
	local NumberOfHotbarSlots1 = Visible and NumberOfHotbarSlots or Count
	local Count1 = 0
	local NoP2: boolean = if EnableHotbarHide then NumberOfHotbarSlots1 >= 1 and not p1 else NumberOfHotbarSlots1 >= 1
	for i = 1, NumberOfHotbarSlots do
		local Entry = List[i]
		
		if (if EnableHotbarHide then Entry.Tool and not p1 else Entry.Tool) or Visible then
			Count1 += 1
			Entry:Readjust(Count1, NumberOfHotbarSlots1)
			Entry.Frame.Visible = true
		else
			Entry.Frame.Visible = false
		end
	end
	if ImageButton then
		local Image = ImageButton
		local NoVisible = not Visible
		
		if NoVisible then
			NoVisible = NoP2
			
			if not NoVisible then
				local Flag = true
				
				for i1 = NumberOfHotbarSlots + 1, #List do
					local Entry = List[i1]
					
					if not Entry or not Entry.Tool then
						continue
					end
					Flag = false
					break
				end
				NoVisible = not Flag
			end
		end
		Image.Visible = NoVisible
		ImageButton.Position = UDim2.new(0.5, -15, 1, if NoP2 then -110 else -50)
	end
	Humanoid.IsHotbarVisible = NoP2
end

local function UpdateScrollingFrameCanvasSize()
	-- upvalues: ScrollingFrame (ref), Frame3 (ref), XOffset (ref)
	if ScrollingFrame and Frame3 then
		ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, math.ceil((#Frame3:GetChildren() - 1) / math.floor(ScrollingFrame.AbsoluteSize.X / (XOffset + 5))) * (XOffset + 5) + 5)
		
		return
	end
end

local function AdjustInventoryFrames()
	-- upvalues: NumberOfHotbarSlots (ref), List (copy), UpdateScrollingFrameCanvasSize (copy)
	for i = NumberOfHotbarSlots + 1, #List do
		local Entry = List[i]
		Entry.Frame.LayoutOrder = Entry.Index
		Entry.Frame.Visible = Entry.Tool ~= nil
	end
	UpdateScrollingFrameCanvasSize()
end

local function UpdateBackpackLayout()
	-- upvalues: Frame1 (ref), Frame2 (ref), NumberOfHotbarSlots (ref), XOffset (ref), v3 (copy), ScrollingFrame (ref), AdjustHotbarFrames (copy), AdjustInventoryFrames (copy)
	if not Frame1 or not Frame2 then return end
	Frame1.Size = UDim2.new(0, 5 + NumberOfHotbarSlots * (XOffset + 5), 0, XOffset + 5 + 5)
	Frame1.Position = UDim2.new(0.5, -Frame1.Size.X.Offset / 2, 1, -Frame1.Size.Y.Offset)
	Frame2.Size = UDim2.new(0, Frame1.Size.X.Offset, 0, Frame1.Size.Y.Offset * v3 + 40)
	Frame2.Position = UDim2.new(0.5, -Frame2.Size.X.Offset / 2, 1, Frame1.Position.Y.Offset - Frame2.Size.Y.Offset)
	
	if ScrollingFrame then
		ScrollingFrame.Size = UDim2.new(1, ScrollingFrame.ScrollBarThickness + 1, 1, -40)
		ScrollingFrame.Position = UDim2.new(0, 0, 0, 40)
	end
	AdjustHotbarFrames()
	AdjustInventoryFrames()
end

local _ = function(p2: number, p3: number, p4: number): number
	return (math.min(p3, (math.max(p2, p4))))
end

local _ = function(Frame: Frame, p2, p3): boolean
	local AbsolutePosition = Frame.AbsolutePosition
	local AbsoluteSize = Frame.AbsoluteSize
	
	return AbsolutePosition.X < p2 and (p2 <= AbsolutePosition.X + AbsoluteSize.X and AbsolutePosition.Y < p3) and p3 <= AbsolutePosition.Y + AbsoluteSize.Y
end

local _ = function(Frame: Frame, p2)
	return (Frame.AbsolutePosition + Frame.AbsoluteSize / 2 - p2).magnitude
end

local _ = function()
	-- upvalues: HopperBin (ref), Tbl (copy)
	HopperBin:ToggleSelect()
	Tbl[HopperBin]:UpdateEquipView()
	HopperBin = nil
end

local _ = function()
	-- upvalues: Humanoid1 (ref), HopperBin (ref), Tbl (copy)
	if Humanoid1 then
		Humanoid1:UnequipTools()
		
		if HopperBin then
			HopperBin:ToggleSelect()
			Tbl[HopperBin]:UpdateEquipView()
			HopperBin = nil
		end
	end
end

local _ = function(HopperBin1)
	-- upvalues: Humanoid1 (ref), HopperBin (ref), Tbl (copy), Parent1 (ref)
	if Humanoid1 then
		Humanoid1:UnequipTools()
		
		if HopperBin then
			HopperBin:ToggleSelect()
			Tbl[HopperBin]:UpdateEquipView()
			HopperBin = nil
		end
	end
	if HopperBin1:IsA("HopperBin") then
		HopperBin1:ToggleSelect()
		Tbl[HopperBin1]:UpdateEquipView()
		HopperBin = HopperBin1
		
		return
	else
		HopperBin1.Parent = Parent1
	end
end

local _ = function(HopperBin)
	-- upvalues: Parent1 (ref)
	return HopperBin and (HopperBin:IsA("HopperBin") and HopperBin.Active or HopperBin.Parent == Parent1)
end

local function MakeSlot(Parent1, p2)
	-- upvalues: List (copy), ScaledPreferredTransparency1 (ref), _Color3_1 (copy), _Color3 (copy), Frame1 (ref), XOffset (ref), GameTranslatorModule (copy), NumberOfHotbarSlots (ref), Frame2 (ref), Count (ref), Flag2 (ref), Flag (ref), ContextActionService (copy), v5 (ref), Tbl (copy), v2 (ref), Parent1 (ref), v4 (ref), NewGui (copy), _Color3_2 (copy), Tbl2 (copy), UpdateScrollingFrameCanvasSize (copy), Humanoid1 (ref), HopperBin (ref), Backpack (ref), _Color3_3 (copy), MakeSlot (copy), Frame3 (ref), Flag4 (ref), Tbl1 (copy), Value1 (copy), ScrollingFrame (ref)
	local P14 = p2 or #List + 1
	local Frame = nil
	local Frame4 = nil
	local ImageLabel = nil
	local TextLabel = nil
	local ChangedConnection = nil
	local Frame5 = nil
	local Label = nil
	local TextLabel1 = nil
	
	local function _()
		-- upvalues: Frame (ref), ScaledPreferredTransparency1 (upval), _Color3_1 (upval), _Color3 (upval)
		Frame.SelectionImageObject = nil
		Frame.BackgroundTransparency = if Frame.Draggable then 0 else ScaledPreferredTransparency1
		Frame.BackgroundColor3 = Frame.Draggable and _Color3_1 or _Color3
	end
	
	local config = {
		Tool = nil,
		Index = P14,
		Frame = nil,
		Readjust = function(_, Count, p3: number)
			-- upvalues: Frame1 (upval), XOffset (upval), Frame (ref)
			Frame.Position = UDim2.new(0, Frame1.Size.X.Offset / 2 - XOffset / 2 + (XOffset + 5) * (Count - (p3 / 2 + 0.5)), 0, 5)
		end,
		Fill = function(p3, Tool: Tool)
			-- upvalues: ImageLabel (ref), TextLabel (ref), GameTranslatorModule (upval), Label (ref), ChangedConnection (ref), NumberOfHotbarSlots (upval), Frame2 (upval), Frame (ref), Count (upval), Flag2 (upval), Flag (upval), ContextActionService (upval), v5 (upval), Tbl (upval), v2 (upval), List (upval)
			if not Tool then
				return p3:Clear()
			end
			p3.Tool = Tool
			
			local function assignToolData()
				-- upvalues: Tool (copy), ImageLabel (upval), TextLabel (upval), GameTranslatorModule (upval), Label (upval)
				local TextureId = Tool.TextureId
				ImageLabel.Image = TextureId
				
				if TextureId == "" then
					TextLabel.Visible = true
				else
					TextLabel.Visible = false
				end
				GameTranslatorModule:TranslateAndRegister(TextLabel, Tool, Tool.Name)
				
				if Label and Tool:IsA("Tool") then
					GameTranslatorModule:TranslateAndRegister(Label, Tool, Tool.ToolTip)
					local NewX = Label.TextBounds.X + 6
					Label.Size = UDim2.new(0, NewX, 0, 16)
					Label.Position = UDim2.new(0.5, -NewX / 2, 0, -25)
				end
			end
			
			assignToolData()
			
			if ChangedConnection then
				ChangedConnection:disconnect()
				ChangedConnection = nil
			end
			ChangedConnection = Tool.Changed:connect(function(p4)
				-- upvalues: assignToolData (copy)
				if p4 == "TextureId" or p4 == "Name" or p4 == "ToolTip" then
					assignToolData()
				end
			end)
			local IsIndexBelow = p3.Index <= NumberOfHotbarSlots
			local Visible = Frame2.Visible
			
			if not IsIndexBelow or Visible then
				Frame.Draggable = true
			end
			p3:UpdateEquipView()
			
			if IsIndexBelow then
				Count += 1
				
				if Flag2 and Count >= 1 and not Flag then
					Flag = true
					ContextActionService:BindAction("RBXHotbarEquip", v5, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
				end
			end
			Tbl[Tool] = p3
			local v6 = nil
			local Entry = nil
			
			for i = 1, NumberOfHotbarSlots do
				Entry = List[i]
				
				if Entry.Tool then
					continue
				end
				v6 = Entry
				break
			end
			v2 = v6
		end,
		Clear = function(p4)
			-- upvalues: ChangedConnection (ref), ImageLabel (ref), TextLabel (ref), Label (ref), Frame (ref), NumberOfHotbarSlots (upval), Count (upval), Flag (upval), ContextActionService (upval), Tbl (upval), v2 (upval), List (upval)
			if not p4.Tool then return end
			if ChangedConnection then
				ChangedConnection:disconnect()
				ChangedConnection = nil
			end
			ImageLabel.Image = ""
			TextLabel.Text = ""
			
			if Label then
				Label.Text = ""
				Label.Visible = false
			end
			Frame.Draggable = false
			p4:UpdateEquipView(true)
			
			if p4.Index <= NumberOfHotbarSlots then
				Count -= 1
				
				if Count < 1 then
					Flag = false
					ContextActionService:UnbindAction("RBXHotbarEquip")
				end
			end
			Tbl[p4.Tool] = nil
			p4.Tool = nil
			local v7 = nil
			local Entry = nil
			
			for i = 1, NumberOfHotbarSlots do
				Entry = List[i]
				
				if Entry.Tool then
					continue
				end
				v7 = Entry
				break
			end
			v2 = v7
		end
	}
	
	function config.UpdateEquipView(p5, p6)
		-- upvalues: Parent1 (upval), v4 (upval), config (copy), Frame5 (ref), NewGui (upval), Frame (ref), _Color3_2 (upval), ScaledPreferredTransparency1 (upval), _Color3_1 (upval), _Color3 (upval)
		repeat
			if not p6 then
				local Tool = p5.Tool
				
				if Tool and (Tool:IsA("HopperBin") and Tool.Active or Tool.Parent == Parent1) then
					v4 = config
					
					if not Frame5 then
						Frame5 = NewGui("Frame", "Equipped")
						Frame5.ZIndex = Frame.ZIndex
						
						for _, value in pairs({
							{ 0.1, 1, 0, 0 },
							{ 0.8, 0.1, 0.1, 0 },
							{ 0.1, 1, 0.9, 0 },
							{ 0.8, 0.1, 0.1, 0.9 }
						}) do
							local Frame1 = NewGui("Frame", "Edge")
							Frame1.BackgroundTransparency = 0
							Frame1.BackgroundColor3 = _Color3_2
							Frame1.Size = UDim2.new(value[1], 0, value[2], 0)
							Frame1.Position = UDim2.new(value[3], 0, value[4], 0)
							Frame1.ZIndex = Frame5.ZIndex
							Frame1.Parent = Frame5
						end
					end
					Frame5.Parent = Frame
					break
				end
			end
			if not Frame5 then break end
			Frame5.Parent = nil
		until true
		Frame.SelectionImageObject = nil
		Frame.BackgroundTransparency = if Frame.Draggable then 0 else ScaledPreferredTransparency1
		Frame.BackgroundColor3 = Frame.Draggable and _Color3_1 or _Color3
	end
	
	function config.IsEquipped(p5)
		-- upvalues: Parent1 (upval)
		local Tool = p5.Tool
		
		return Tool and (Tool:IsA("HopperBin") and Tool.Active or Tool.Parent == Parent1)
	end
	
	function config.Delete(p5)
		-- upvalues: Tbl2 (upval), Frame (ref), List (upval), UpdateScrollingFrameCanvasSize (upval)
		Tbl2[Frame] = nil
		Frame:Destroy()
		table.remove(List, p5.Index)
		
		for i = p5.Index, #List do
			List[i]:SlideBack()
		end
		UpdateScrollingFrameCanvasSize()
	end
	
	function config.Swap(p6, GamepadSwapSlot)
		local Tool = p6.Tool
		local Tool1 = GamepadSwapSlot.Tool
		p6:Clear()
		
		if Tool1 then
			GamepadSwapSlot:Clear()
			p6:Fill(Tool1)
		end
		if Tool then
			GamepadSwapSlot:Fill(Tool)
			
			return
		else
			GamepadSwapSlot:Clear()
		end
	end
	
	function config.SlideBack(p6)
		-- upvalues: Frame (ref)
		p6.Index -= 1
		Frame.Name = p6.Index
		Frame.LayoutOrder = p6.Index
	end
	
	function config:TurnNumber(Visible)
		-- upvalues: TextLabel1 (ref)
		if TextLabel1 then
			TextLabel1.Visible = Visible
		end
	end
	
	function config.SetClickability(p6, p7)
		-- upvalues: Frame (ref), ScaledPreferredTransparency1 (upval), _Color3_1 (upval), _Color3 (upval)
		if p6.Tool then
			Frame.Draggable = not p7
			Frame.SelectionImageObject = nil
			Frame.BackgroundTransparency = if Frame.Draggable then 0 else ScaledPreferredTransparency1
			Frame.BackgroundColor3 = Frame.Draggable and _Color3_1 or _Color3
		end
	end
	
	function config.CheckTerms(p6, List): number
		-- upvalues: TextLabel (ref), Label (ref)
		local Total = 0
		
		local function _(Text: string, p7)
			-- upvalues: Total (ref)
			local _, Replaced2 = Text:lower():gsub(p7, "")
			Total += Replaced2
		end
		
		local Tool = p6.Tool
		
		if Tool then
			for i in pairs(List) do
				local _, Replaced2 = TextLabel.Text:lower():gsub(i, "")
				Total += Replaced2
				
				if Tool:IsA("Tool") then
					local _, Replaced2_1 = (Label and Label.Text or ""):lower():gsub(i, "")
					Total += Replaced2_1
				end
			end
		end
		return Total
	end
	
	function config:Select(p7)
		-- upvalues: config (copy), Parent1 (upval), Humanoid1 (upval), HopperBin (upval), Tbl (upval), Backpack (upval)
		if p7 then return end
		local Tool = config.Tool
		
		if Tool then
			if not Tool or (not Tool:IsA("HopperBin") or not Tool.Active) and Tool.Parent ~= Parent1 then
				if Tool.Parent == Backpack then
					if Humanoid1 then
						Humanoid1:UnequipTools()
						
						if HopperBin then
							HopperBin:ToggleSelect()
							Tbl[HopperBin]:UpdateEquipView()
							HopperBin = nil
						end
					end
					if Tool:IsA("HopperBin") then
						Tool:ToggleSelect()
						Tbl[Tool]:UpdateEquipView()
						HopperBin = Tool
						
						return
					else
						Tool.Parent = Parent1
					end
				end
			elseif Humanoid1 then
				Humanoid1:UnequipTools()
				
				if HopperBin then
					HopperBin:ToggleSelect()
					Tbl[HopperBin]:UpdateEquipView()
					HopperBin = nil
					
					return
				end
			end
		end
	end
	
	Frame = NewGui("TextButton", P14)
	Frame.BackgroundColor3 = _Color3
	Frame.BorderColor3 = _Color3_3
	Frame.Text = ""
	Frame.AutoButtonColor = false
	Frame.BorderSizePixel = 0
	Frame.Size = UDim2.new(0, XOffset, 0, XOffset)
	Frame.Active = true
	Frame.Draggable = false
	Frame.BackgroundTransparency = ScaledPreferredTransparency1
	Frame.MouseButton1Click:connect(function()
		-- upvalues: config (copy)
		changeSlot(config)
	end)
	config.Frame = Frame
	local Frame6 = NewGui("Frame", "SelectionObjectClipper")
	Frame6.Visible = false
	Frame6.Parent = Frame
	local ImageLabel1 = NewGui("ImageLabel", "Selector")
	ImageLabel1.Size = UDim2.new(1, 0, 1, 0)
	ImageLabel1.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png"
	ImageLabel1.ScaleType = Enum.ScaleType.Slice
	ImageLabel1.SliceCenter = Rect.new(12, 12, 52, 52)
	ImageLabel1.Parent = Frame6
	ImageLabel = NewGui("ImageLabel", "Icon")
	ImageLabel.Size = UDim2.new(0.8, 0, 0.8, 0)
	ImageLabel.Position = UDim2.new(0.1, 0, 0.1, 0)
	ImageLabel.Parent = Frame
	TextLabel = NewGui("TextLabel", "ToolName")
	TextLabel.Size = UDim2.new(1, -2, 1, -2)
	TextLabel.Position = UDim2.new(0, 1, 0, 1)
	TextLabel.Parent = Frame
	config.Frame.LayoutOrder = config.Index
	
	if P14 <= NumberOfHotbarSlots then
		Label = NewGui("TextLabel", "ToolTip")
		Label.TextWrapped = false
		Label.TextYAlignment = Enum.TextYAlignment.Top
		Label.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
		Label.BackgroundTransparency = 0
		Label.Visible = false
		Label.Parent = Frame
		Frame.MouseEnter:connect(function()
			-- upvalues: Label (ref)
			if Label.Text ~= "" then
				Label.Visible = true
			end
		end)
		Frame.MouseLeave:connect(function()
			-- upvalues: Label (ref)
			Label.Visible = false
		end)
		
		function config.MoveToInventory(p7)
			-- upvalues: config (copy), NumberOfHotbarSlots (upval), MakeSlot (upval), Frame3 (upval), Parent1 (upval), Humanoid1 (upval), HopperBin (upval), Tbl (upval), Flag4 (upval), Frame2 (upval)
			if config.Index <= NumberOfHotbarSlots then
				local Tool = config.Tool
				p7:Clear()
				local Slot = MakeSlot(Frame3)
				Slot:Fill(Tool)
				
				if Tool and (Tool:IsA("HopperBin") and Tool.Active or Tool.Parent == Parent1) and Humanoid1 then
					Humanoid1:UnequipTools()
					
					if HopperBin then
						HopperBin:ToggleSelect()
						Tbl[HopperBin]:UpdateEquipView()
						HopperBin = nil
					end
				end
				if Flag4 then
					Slot.Frame.Visible = false
					Slot.Parent = Frame2
				end
			end
		end
		
		if P14 < 10 or P14 == NumberOfHotbarSlots then
			local P14_1 = P14 < 10 and P14 or 0
			TextLabel1 = NewGui("TextLabel", "Number")
			TextLabel1.Text = P14_1
			TextLabel1.Size = UDim2.new(0.15, 0, 0.15, 0)
			TextLabel1.Visible = false
			TextLabel1.Parent = Frame
			
			Tbl1[Value1 + P14_1] = function(p7)
				-- upvalues: config (copy)
				config:Select(p7)
			end
		end
	end
	local Position = Frame.Position
	local v8 = 0
	local Parent2 = nil
	Frame.DragBegin:connect(function(InitialPosition)
		-- upvalues: Tbl2 (upval), Frame (ref), Position (ref), ImageLabel (ref), TextLabel (ref), TextLabel1 (ref), Frame5 (ref), Parent2 (ref), Frame3 (upval), Frame2 (upval), Frame4 (ref), NewGui (upval)
		Tbl2[Frame] = true
		Position = InitialPosition
		Frame.BorderSizePixel = 2
		Frame.ZIndex = 2
		ImageLabel.ZIndex = 2
		TextLabel.ZIndex = 2
		Frame.Parent.ZIndex = 2
		
		if TextLabel1 then
			TextLabel1.ZIndex = 2
		end
		if Frame5 then
			Frame5.ZIndex = 2
			
			for _, child in pairs(Frame5:GetChildren()) do
				child.ZIndex = 2
			end
		end
		Parent2 = Frame.Parent
		
		if Parent2 == Frame3 then
			local _ = Frame.AbsolutePosition
			Frame.Parent = Frame2
			Frame.Position = UDim2.new(0, Frame.AbsolutePosition.X - Frame2.AbsolutePosition.X, 0, Frame.AbsolutePosition.Y - Frame2.AbsolutePosition.Y)
			Frame4 = NewGui("Frame", "FakeSlot")
			Frame4.LayoutOrder = Frame.LayoutOrder
			Frame4.Size = Frame.Size
			Frame4.BackgroundTransparency = 1
			Frame4.Parent = Frame3
		end
	end)
	Frame.DragStopped:connect(function(X, Y)
		-- upvalues: Frame4 (ref), Frame (ref), Position (ref), Parent2 (ref), ImageLabel (ref), TextLabel (ref), TextLabel1 (ref), Frame5 (ref), Tbl2 (upval), config (copy), Frame2 (upval), NumberOfHotbarSlots (upval), v8 (ref), v2 (upval), Frame1 (upval), List (upval), Parent1 (upval), Humanoid1 (upval), HopperBin (upval), Tbl (upval), Flag4 (upval)
		if Frame4 then
			Frame4:Destroy()
		end
		local CurrentTime = tick()
		Frame.Position = Position
		Frame.Parent = Parent2
		Frame.BorderSizePixel = 0
		Frame.ZIndex = 1
		ImageLabel.ZIndex = 1
		TextLabel.ZIndex = 1
		Parent2.ZIndex = 1
		
		if TextLabel1 then
			TextLabel1.ZIndex = 1
		end
		if Frame5 then
			Frame5.ZIndex = 1
			
			for _, child in pairs(Frame5:GetChildren()) do
				child.ZIndex = 1
			end
		end
		Tbl2[Frame] = nil
		
		if not config.Tool then return end
		local Frame3 = Frame2
		local AbsolutePosition = Frame3.AbsolutePosition
		local AbsoluteSize = Frame3.AbsoluteSize
		
		if AbsolutePosition.X < X and (X <= AbsolutePosition.X + AbsoluteSize.X and (AbsolutePosition.Y < Y and Y <= AbsolutePosition.Y + AbsoluteSize.Y)) then
			if config.Index <= NumberOfHotbarSlots then
				config:MoveToInventory()
			end
			if NumberOfHotbarSlots < config.Index and CurrentTime - v8 < 0.5 then
				if v2 then
					local Tool = config.Tool
					config:Clear()
					v2:Fill(Tool)
					config:Delete()
				end
				CurrentTime = 0
			end
		else
			local Frame6 = Frame1
			local AbsolutePosition1 = Frame6.AbsolutePosition
			local AbsoluteSize1 = Frame6.AbsoluteSize
			
			if AbsolutePosition1.X < X and (X <= AbsolutePosition1.X + AbsoluteSize1.X and (AbsolutePosition1.Y < Y and Y <= AbsolutePosition1.Y + AbsoluteSize1.Y)) then
				local list = { 1e999, nil }
				
				for i = 1, NumberOfHotbarSlots do
					local Entry = List[i]
					local Frame7 = Entry.Frame
					local Magnitude = (Frame7.AbsolutePosition + Frame7.AbsoluteSize / 2 - Vector2.new(X, Y)).magnitude
					
					if Magnitude < list[1] then
						list = { Magnitude, Entry }
					end
				end
				local Entry1 = list[2]
				
				if Entry1 ~= config then
					config:Swap(Entry1)
					
					if NumberOfHotbarSlots < config.Index then
						local Tool = config.Tool
						
						if Tool then
							if Tool and (Tool:IsA("HopperBin") and Tool.Active or Tool.Parent == Parent1) and Humanoid1 then
								Humanoid1:UnequipTools()
								
								if HopperBin then
									HopperBin:ToggleSelect()
									Tbl[HopperBin]:UpdateEquipView()
									HopperBin = nil
								end
							end
							if Flag4 then
								config.Frame.Visible = false
								config.Frame.Parent = Frame2
							end
						else
							config:Delete()
						end
					end
				end
			elseif config.Index <= NumberOfHotbarSlots then
				config:MoveToInventory()
			end
		end
		v8 = CurrentTime
	end)
	Frame.Parent = Parent1
	List[P14] = config
	
	if NumberOfHotbarSlots < P14 then
		UpdateScrollingFrameCanvasSize()
		
		if ScrollingFrame and (Frame2.Visible and not Flag4) then
			ScrollingFrame.CanvasPosition = Vector2.new(0, (math.max(0, ScrollingFrame.CanvasSize.Y.Offset - ScrollingFrame.AbsoluteSize.Y)))
		end
	end
	return config
end

local _ = function(Value: number)
	-- upvalues: NumberOfHotbarSlots (ref), List (copy), MakeSlot (copy), Frame1 (ref), v2 (ref), Count (ref), UpdateBackpackLayout (copy)
	if NumberOfHotbarSlots ~= Value then
		local NumberOfHotbarSlots1: number = NumberOfHotbarSlots
		
		if Value < NumberOfHotbarSlots1 then
			for i = NumberOfHotbarSlots1, Value + 1, -1 do
				local Entry = List[i]
				
				if Entry then
					Entry:MoveToInventory()
					Entry:Delete()
				end
			end
			for i2 = NumberOfHotbarSlots1, Value + 1, -1 do
				local Entry = List[i2]
				
				if not Entry.Tool then
					Entry:Delete()
				end
			end
		else
			for i1 = NumberOfHotbarSlots1, Value do
				NumberOfHotbarSlots = i1
				
				if List[i1] then
					local _ = List[i1]
					local Tool = List[i1].Tool
					local Slot = MakeSlot(Frame1, i1)
					
					if Tool then
						Slot:Fill(Tool)
					elseif not v2 then
						v2 = Slot
					end
				else
					local Slot1 = MakeSlot(Frame1, i1)
					Slot1.Frame.Visible = false
					
					if not v2 then
						v2 = Slot1
					end
				end
			end
		end
		NumberOfHotbarSlots = Value
		Count = 0
		
		for i3 = 1, NumberOfHotbarSlots do
			if List[i3] and List[i3].Tool then
				Count += 1
			end
		end
		UpdateBackpackLayout()
	end
end

local function OnChildAdded(Child: Tool)
	-- upvalues: Frame (ref), Parent1 (ref), Humanoid1 (ref), CurrentTime (ref), HopperBin (ref), Tbl (copy), Flag1 (ref), LocalPlayer (ref), v2 (ref), MakeSlot (copy), Frame3 (ref), List (copy), Backpack (ref), AdjustHotbarFrames (copy), NumberOfHotbarSlots (ref), Frame2 (ref), Humanoid (copy)
	if not Frame then return end
	if Child:IsA("Tool") or Child:IsA("HopperBin") then
		if Child.Parent == Parent1 then
			CurrentTime = tick()
		end
		if HopperBin and Child.Parent == Parent1 then
			HopperBin:ToggleSelect()
			Tbl[HopperBin]:UpdateEquipView()
			HopperBin = nil
		end
		if not Flag1 and Child.Parent == Parent1 and not Tbl[Child] then
			local StarterGear = LocalPlayer:FindFirstChild("StarterGear")
			
			if StarterGear and StarterGear:FindFirstChild(Child.Name) then
				Flag1 = true
				local V65 = v2 or MakeSlot(Frame3)
				for i = V65.Index, 1, -1 do
					local Entry1 = List[i]
					local IDelta = i - 1
					
					if IDelta > 0 then
						List[IDelta]:Swap(Entry1)
					else
						Entry1:Fill(Child)
					end
				end
				for _, Tool in pairs(Parent1:GetChildren()) do
					if Tool:IsA("Tool") and Tool ~= Child then
						Tool.Parent = Backpack
					end
				end
				AdjustHotbarFrames()
				
				return
			end
		end
		local Entry = Tbl[Child]
		
		if Entry then
			Entry:UpdateEquipView()
		else
			local V65 = v2 or MakeSlot(Frame3)
			V65:Fill(Child)
			
			if V65.Index <= NumberOfHotbarSlots and not Frame2.Visible then
				AdjustHotbarFrames()
			end
			if Child:IsA("HopperBin") and Child.Active then
				if Humanoid1 then
					Humanoid1:UnequipTools()
					
					if HopperBin then
						HopperBin:ToggleSelect()
						Tbl[HopperBin]:UpdateEquipView()
						HopperBin = nil
					end
				end
				HopperBin = Child
			end
		end
		Humanoid.BackpackItemAdded:Fire()
		
		return
	elseif Child:IsA("Humanoid") and Child.Parent == Parent1 then
		Humanoid1 = Child
	end
end

local function OnChildRemoved(Child)
	-- upvalues: Frame (ref), CurrentTime (ref), Parent1 (ref), Backpack (ref), Tbl (copy), NumberOfHotbarSlots (ref), Frame2 (ref), AdjustHotbarFrames (copy), HopperBin (ref), Humanoid (copy), List (copy)
	if not Frame then return end
	if not Child:IsA("Tool") and not Child:IsA("HopperBin") then return end
	CurrentTime = tick()
	local Parent1 = Child.Parent
	
	if Parent1 == Parent1 or Parent1 == Backpack then return end
	local Entry = Tbl[Child]
	
	if Entry then
		Entry:Clear()
		
		if NumberOfHotbarSlots < Entry.Index then
			Entry:Delete()
		elseif not Frame2.Visible then
			AdjustHotbarFrames()
		end
	end
	if Child == HopperBin then
		HopperBin = nil
	end
	Humanoid.BackpackItemRemoved:Fire()
	local Flag = true
	
	for i = NumberOfHotbarSlots + 1, #List do
		local Entry1 = List[i]
		
		if not Entry1 or not Entry1.Tool then
			continue
		end
		Flag = false
		break
	end
	if Flag then
		Humanoid.BackpackEmpty:Fire()
	end
end

local function OnCharacterAdded(Character)
	-- upvalues: List (copy), NumberOfHotbarSlots (ref), HopperBin (ref), List2 (ref), Parent1 (ref), OnChildRemoved (copy), OnChildAdded (copy), Backpack (ref), LocalPlayer (ref), AdjustHotbarFrames (copy)
	for i = #List, 1, -1 do
		local Entry = List[i]
		
		if Entry.Tool then
			Entry:Clear()
		end
		if NumberOfHotbarSlots < i then
			Entry:Delete()
		end
	end
	HopperBin = nil
	
	for _, value in pairs(List2) do
		value:disconnect()
	end
	List2 = {}
	Parent1 = Character
	table.insert(List2, Character.ChildRemoved:connect(OnChildRemoved))
	table.insert(List2, Character.ChildAdded:connect(OnChildAdded))
	
	for _, child in pairs(Character:GetChildren()) do
		OnChildAdded(child)
	end
	Backpack = LocalPlayer:WaitForChild("Backpack")
	table.insert(List2, Backpack.ChildRemoved:connect(OnChildRemoved))
	table.insert(List2, Backpack.ChildAdded:connect(OnChildAdded))
	
	for _, child1 in pairs(Backpack:GetChildren()) do
		OnChildAdded(child1)
	end
	AdjustHotbarFrames()
end

local function OnInputBegan(Input, GameProcessed)
	-- upvalues: Flag3 (ref), Flag2 (ref), Value2 (copy), Tbl1 (copy), Frame2 (ref), Humanoid (copy)
	if Input.UserInputType == Enum.UserInputType.Keyboard and not Flag3 and (Flag2 or Input.KeyCode.Value == Value2) then
		local Entry: (any) -> () = Tbl1[Input.KeyCode.Value]
		
		if Entry then
			Entry(GameProcessed)
		end
	end
	local UserInputType = Input.UserInputType
	
	if not GameProcessed and (UserInputType == Enum.UserInputType.MouseButton1 or UserInputType == Enum.UserInputType.Touch) and Frame2 and Frame2.Visible then
		Humanoid.OpenClose()
	end
end

local function OnUISChanged(p7)
	-- upvalues: UserInputService (copy), VRService (copy), NumberOfHotbarSlots (ref), List (copy)
	if p7 == "KeyboardEnabled" or p7 == "VREnabled" then
		local NoVREnabled: boolean = UserInputService.KeyboardEnabled and not VRService.VREnabled
		for i = 1, NumberOfHotbarSlots do
			List[i]:TurnNumber(NoVREnabled)
		end
	end
end

local Input = nil
local CurrentTime1 = nil

local function v107() end

local _Vector2 = Vector2.new(0, 0)

function unbindAllGamepadEquipActions()
	-- upvalues: ContextActionService (copy)
	ContextActionService:UnbindAction("RBXBackpackHasGamepadFocus")
	ContextActionService:UnbindAction("RBXCloseInventory")
end

local _ = function(Visible, p8)
	-- upvalues: NumberOfHotbarSlots (ref), List (copy)
	for i = 1, NumberOfHotbarSlots do
		local Entry = List[i]
		
		if Entry and Entry.Frame and (p8 or Entry.Tool) then
			Entry.Frame.Visible = Visible
		end
	end
end

local function getInputDirection(Input): Vector2
	-- upvalues: _Vector2 (ref)
	local v9: number = if Input.UserInputState == Enum.UserInputState.End then -1 else 1
	
	if Input.KeyCode == Enum.KeyCode.Thumbstick1 then
		local Magnitude: number = Input.Position.magnitude
		_Vector2 = if Magnitude > 0.98 then Vector2.new(Input.Position.x / Magnitude, -Input.Position.y / Magnitude) else Vector2.new(0, 0)
	elseif Input.KeyCode == Enum.KeyCode.DPadLeft then
		_Vector2 = Vector2.new(_Vector2.x - v9 * 1, _Vector2.y)
	elseif Input.KeyCode == Enum.KeyCode.DPadRight then
		_Vector2 = Vector2.new(_Vector2.x + v9 * 1, _Vector2.y)
	elseif Input.KeyCode == Enum.KeyCode.DPadUp then
		_Vector2 = Vector2.new(_Vector2.x, _Vector2.y - v9 * 1)
	elseif Input.KeyCode == Enum.KeyCode.DPadDown then
		_Vector2 = Vector2.new(_Vector2.x, _Vector2.y + v9 * 1)
	else
		_Vector2 = Vector2.new(0, 0)
	end
	return _Vector2
end

local _ = function(_, _, Input)
	-- upvalues: getInputDirection (copy), NumberOfHotbarSlots (ref), List (copy), Humanoid1 (ref), HopperBin (ref), Tbl (copy)
	local InputDirection = getInputDirection(Input)
	
	if InputDirection == Vector2.new(0, 0) then return end
	local AngleDelta = math.atan2(InputDirection.y, InputDirection.x) - -1.5707963267948966
	
	if AngleDelta < 0 then
		AngleDelta += 6.283185307179586
	end
	local Floored = math.floor(AngleDelta / 0.7853981633974483 + 1 + 0.5)
	
	if NumberOfHotbarSlots < Floored then
		Floored = 1
	end
	if Floored > 0 then
		local Entry = List[Floored]
		
		if Entry and Entry.Tool and not Entry:IsEquipped() then
			Entry:Select()
			
			return
		end
	elseif Humanoid1 then
		Humanoid1:UnequipTools()
		
		if HopperBin then
			HopperBin:ToggleSelect()
			Tbl[HopperBin]:UpdateEquipView()
			HopperBin = nil
		end
	end
end

v5 = function(_, InputState, InputObject)
	-- upvalues: Input (ref), CurrentTime1 (ref), Humanoid1 (ref), HopperBin (ref), Tbl (copy), NumberOfHotbarSlots (ref), List (copy), v4 (ref)
	if InputState ~= Enum.UserInputState.Begin then return end
	if not Input or (Input.KeyCode ~= Enum.KeyCode.ButtonR1 or InputObject.KeyCode ~= Enum.KeyCode.ButtonL1) and (Input.KeyCode ~= Enum.KeyCode.ButtonL1 or InputObject.KeyCode ~= Enum.KeyCode.ButtonR1) or tick() - CurrentTime1 > 0.06 then
		Input = InputObject
		CurrentTime1 = tick()
		delay(0.06, function()
			-- upvalues: Input (upval), InputObject (copy), NumberOfHotbarSlots (upval), List (upval), Humanoid1 (upval), HopperBin (upval), Tbl (upval), v4 (upval)
			if Input ~= InputObject then return end
			local Amount: number = if InputObject.KeyCode == Enum.KeyCode.ButtonL1 then -1 else 1
			for i = 1, NumberOfHotbarSlots do
				local Entry = List[i]
				
				if not Entry then return end
				if not Entry:IsEquipped() then
					continue
				end
				local NewAmount = Amount + i
				local Flag = false
				
				if NumberOfHotbarSlots < NewAmount then
					NewAmount = 1
					Flag = true
				elseif NewAmount < 1 then
					NewAmount = NumberOfHotbarSlots
					Flag = true
				end
				local Total: number = NewAmount
				while not List[NewAmount].Tool do
					NewAmount += Amount
					
					if NewAmount == Total then return end
					if NumberOfHotbarSlots < NewAmount then
						NewAmount = 1
						Flag = true
					elseif NewAmount < 1 then
						NewAmount = NumberOfHotbarSlots
						Flag = true
					end
				end
				if not Flag then
					List[NewAmount]:Select()
					
					return
				end
				if Humanoid1 then
					Humanoid1:UnequipTools()
					
					if HopperBin then
						HopperBin:ToggleSelect()
						Tbl[HopperBin]:UpdateEquipView()
						HopperBin = nil
					end
				end
				v4 = nil
				
				return
			end
			if v4 and v4.Tool then
				v4:Select()
				
				return
			end
			local NumberOfHotbarSlots1 = Amount == -1 and NumberOfHotbarSlots or 1
			local NumberOfHotbarSlots2 = if Amount == -1 then 1 else NumberOfHotbarSlots
			for i1 = NumberOfHotbarSlots1, NumberOfHotbarSlots2, Amount do
				if List[i1].Tool then
					List[i1]:Select()
					break
				end
			end
		end)
		
		return
	end
	if Humanoid1 then
		Humanoid1:UnequipTools()
		
		if HopperBin then
			HopperBin:ToggleSelect()
			Tbl[HopperBin]:UpdateEquipView()
			HopperBin = nil
		end
	end
	Input = InputObject
	CurrentTime1 = tick()
end

function getGamepadSwapSlot()
	-- upvalues: List (copy)
	for i = 1, #List do
		if List[i].Frame.BorderSizePixel > 0 then
			return List[i]
		end
	end
end

function changeSlot(GamepadSwapSlot)
	-- upvalues: GamepadService (copy), GuiService (copy), TextButton (ref), NumberOfHotbarSlots (ref)
	local GamepadCursorEnabled = GamepadService.GamepadCursorEnabled
	
	if GamepadSwapSlot.Frame == GuiService.SelectedCoreObject and not GamepadCursorEnabled then
		local GamepadSwapSlot1 = getGamepadSwapSlot()
		
		if GamepadSwapSlot1 then
			GamepadSwapSlot1.Frame.BorderSizePixel = 0
			
			if GamepadSwapSlot1 ~= GamepadSwapSlot then
				GamepadSwapSlot:Swap(GamepadSwapSlot1)
				
				if TextButton and TextButton.SelectionImageObject then
					TextButton.SelectionImageObject.Visible = false
				end
				if NumberOfHotbarSlots < GamepadSwapSlot.Index and not GamepadSwapSlot.Tool then
					if GuiService.SelectedCoreObject == GamepadSwapSlot.Frame then
						GuiService.SelectedCoreObject = GamepadSwapSlot1.Frame
					end
					GamepadSwapSlot:Delete()
				end
				if NumberOfHotbarSlots < GamepadSwapSlot1.Index and not GamepadSwapSlot1.Tool then
					if GuiService.SelectedCoreObject == GamepadSwapSlot1.Frame then
						GuiService.SelectedCoreObject = GamepadSwapSlot.Frame
					end
					GamepadSwapSlot1:Delete()
					
					return
				end
			end
		else
			local Size = GamepadSwapSlot.Frame.Size
			local Position = GamepadSwapSlot.Frame.Position
			GamepadSwapSlot.Frame:TweenSizeAndPositionInternal(Size + UDim2.new(0, 10, 0, 10), Position - UDim2.new(0, 5, 0, 5), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, function()
				-- upvalues: GamepadSwapSlot (copy), Size (copy), Position (copy)
				GamepadSwapSlot.Frame:TweenSizeAndPositionInternal(Size, Position, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true)
			end)
			GamepadSwapSlot.Frame.BorderSizePixel = 3
			
			if TextButton and TextButton.SelectionImageObject then
				TextButton.SelectionImageObject.Visible = true
				
				return
			end
		end
	else
		GamepadSwapSlot:Select()
		
		if TextButton and TextButton.SelectionImageObject then
			TextButton.SelectionImageObject.Visible = false
		end
	end
end

function enableGamepadInventoryControl()
	-- upvalues: Frame2 (ref), Humanoid (copy), ContextActionService (copy), v107 (copy), Frame1 (ref), GuiService (copy)
	local function v228(_, InputState, _)
		-- upvalues: Frame2 (upval), Humanoid (upval)
		if InputState ~= Enum.UserInputState.Begin then return end
		if getGamepadSwapSlot() then
			local GamepadSwapSlot = getGamepadSwapSlot()
			
			if GamepadSwapSlot then
				GamepadSwapSlot.Frame.BorderSizePixel = 0
				
				return
			end
		elseif Frame2 and Frame2.Visible then
			Humanoid.OpenClose()
		end
	end
	
	ContextActionService:BindAction("RBXBackpackHasGamepadFocus", v107, false, Enum.UserInputType.Gamepad1)
	ContextActionService:BindAction("RBXCloseInventory", v228, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart)
	
	if Frame1 then
		GuiService.SelectedCoreObject = Frame1:FindFirstChild("1")
	end
end

function disableGamepadInventoryControl()
	-- upvalues: NumberOfHotbarSlots (ref), List (copy), Frame (ref), GuiService (copy)
	unbindAllGamepadEquipActions()
	
	for i = 1, NumberOfHotbarSlots do
		local Entry = List[i]
		
		if Entry and Entry.Frame then
			Entry.Frame.BorderSizePixel = 0
		end
	end
	if Frame and GuiService.SelectedCoreObject and GuiService.SelectedCoreObject:IsDescendantOf(Frame) then
		GuiService.SelectedCoreObject = nil
	end
end

local _ = function()
	-- upvalues: Flag2 (ref), Flag (ref), ContextActionService (copy), v5 (ref)
	if Flag2 and not Flag then
		Flag = true
		ContextActionService:BindAction("RBXHotbarEquip", v5, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
	end
end

local _ = function()
	-- upvalues: Flag (ref), ContextActionService (copy)
	disableGamepadInventoryControl()
	Flag = false
	ContextActionService:UnbindAction("RBXHotbarEquip")
end

function gamepadDisconnected()
	-- upvalues: VRService (copy), Flag5 (ref)
	if not VRService.VREnabled then
		Flag5 = false
		disableGamepadInventoryControl()
	end
end

function gamepadConnected()
	-- upvalues: VRService (copy), Flag5 (ref), Frame (ref), FFlagStudioDeviceSimVRSwitchFixes (copy), GuiService (copy), Count (ref), Flag2 (ref), Flag (ref), ContextActionService (copy), v5 (ref), Frame2 (ref)
	if not VRService.VREnabled then
		Flag5 = true
		
		if Frame then
			if FFlagStudioDeviceSimVRSwitchFixes then
				GuiService:RemoveSelectionGroup("RBXBackpackSelection")
			end
			GuiService:AddSelectionParent("RBXBackpackSelection", Frame)
		end
		if Count >= 1 and Flag2 and not Flag then
			Flag = true
			ContextActionService:BindAction("RBXHotbarEquip", v5, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
		end
		if Frame2 and Frame2.Visible then
			enableGamepadInventoryControl()
		end
	end
end

local function setBackpackEnabled(CoreGuiEnabled)
	-- upvalues: v1 (ref), Flag2 (ref), Frame (ref), FFlagMountCoreGuiBackpackModule (copy), RobloxGui (copy), List1 (copy), GuiService (copy), Count (ref), Flag (ref), ContextActionService (copy), v5 (ref)
	local V44 = CoreGuiEnabled and v1
	Flag2 = V44
	
	if Frame then
		if FFlagMountCoreGuiBackpackModule then
			if V44 then
				Frame.Parent = RobloxGui
			else
				Frame.Parent = nil
			end
		else
			Frame.Visible = V44
		end
	end
	for _, value in pairs(List1) do
		if V44 then
			GuiService:AddKey(value)
		else
			GuiService:RemoveKey(value)
		end
	end
	if not V44 then
		disableGamepadInventoryControl()
		Flag = false
		ContextActionService:UnbindAction("RBXHotbarEquip")
	elseif Count >= 1 and Flag2 and not Flag then
		Flag = true
		ContextActionService:BindAction("RBXHotbarEquip", v5, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
		
		return
	end
end

local function MakeVRRoundButton(Name, Image)
	-- upvalues: NewGui (copy)
	local ImageButton = NewGui("ImageButton", Name)
	ImageButton.Size = UDim2.new(0, 40, 0, 40)
	ImageButton.Image = "rbxasset://textures/ui/Keyboard/close_button_background.png"
	local ImageLabel = NewGui("ImageLabel", "Icon")
	ImageLabel.Size = UDim2.new(0.5, 0, 0.5, 0)
	ImageLabel.Position = UDim2.new(0.25, 0, 0.25, 0)
	ImageLabel.Image = Image
	ImageLabel.Parent = ImageButton
	local ImageLabel1 = NewGui("ImageLabel", "Selection")
	ImageLabel1.Size = UDim2.new(0.9, 0, 0.9, 0)
	ImageLabel1.Position = UDim2.new(0.05, 0, 0.05, 0)
	ImageLabel1.Image = "rbxasset://textures/ui/Keyboard/close_button_selection.png"
	ImageButton.SelectionImageObject = ImageLabel1
	
	return ImageButton, ImageLabel, ImageLabel1
end

function Humanoid.createGui()
	-- upvalues: Frame (ref), NewGui (copy), FFlagMountCoreGuiBackpackModule (copy), StarterGui (copy), RobloxGui (copy), Frame1 (ref), NumberOfHotbarSlots (ref), MakeSlot (copy), v2 (ref), ImageButton (ref), Humanoid (copy), _Color3_4 (copy), CloseInventory (ref), MakeVRRoundButton (copy), Frame2 (ref), ScaledPreferredTransparency (ref), _Color3 (copy), TextButton (ref), ScrollingFrame (ref), Frame3 (ref), GridLayout (ref), XOffset (ref), ScrollUpButton (ref), ScrollDownButton (ref), UpdateBackpackLayout (copy), CreateFunction (copy), IsEnabled (copy), _Color3_5 (copy), ScaledPreferredTransparency2 (ref), InGameUnknownNamespaceBACKPACKSEARCH (ref), _Color3_2 (copy), List (copy), Flag4 (ref), UpdateScrollingFrameCanvasSize (copy), List3 (copy), Tbl1 (copy), VRService (copy), UserInputService (copy), GuiService (copy), Tbl2 (copy), AdjustHotbarFrames (copy), Flag5 (ref), config (copy), ContextActionService (copy), Value (copy), LocalPlayer (ref), Players (copy), OnCharacterAdded (copy), List1 (copy), OnInputBegan (copy), Flag3 (ref), Value2 (copy), HopperBin (ref), Humanoid1 (ref), Tbl (copy), OnUISChanged (copy), EnableHotbarHide (copy), SettingsShowSignal (copy), IsInExperienceUIVREnabled (copy), InExperienceUIVRIXP (copy), InExperienceAppChatModalModule (copy), UserGameSettings (copy), ScaledPreferredTransparency1 (ref)
	Frame = NewGui("Frame", "Backpack")
	
	if FFlagMountCoreGuiBackpackModule then
		if StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack) then
			Frame.Parent = RobloxGui
		end
	else
		Frame.Visible = false
		Frame.Parent = RobloxGui
	end
	Frame1 = NewGui("Frame", "Hotbar")
	Frame1.Parent = Frame
	
	for i = 1, NumberOfHotbarSlots do
		local Slot = MakeSlot(Frame1, i)
		Slot.Frame.Visible = false
		
		if not v2 then
			v2 = Slot
		end
	end
	ImageButton = NewGui("ImageButton", "OpenInventory")
	ImageButton.Size = UDim2.new(0, 30, 0, 30)
	ImageButton.Image = "rbxasset://textures/ui/Backpack/ScrollUpArrow.png"
	ImageButton.MouseButton1Click:connect(function()
		-- upvalues: Humanoid (upval)
		Humanoid.OpenClose()
	end)
	ImageButton.SelectionGained:connect(function()
		-- upvalues: ImageButton (upval), _Color3_4 (upval)
		ImageButton.ImageColor3 = _Color3_4
	end)
	ImageButton.SelectionLost:connect(function()
		-- upvalues: ImageButton (upval)
		ImageButton.ImageColor3 = Color3.new(1, 1, 1)
	end)
	local Frame4 = NewGui("Frame", "Selection")
	Frame4.Visible = false
	ImageButton.SelectionImageObject = Frame4
	CloseInventory = MakeVRRoundButton("CloseInventory", "rbxasset://textures/ui/Keyboard/close_button_icon.png")
	CloseInventory.Position = UDim2.new(0, 0, 0, -50)
	CloseInventory.MouseButton1Click:connect(function()
		-- upvalues: Frame2 (upval), Humanoid (upval)
		if Frame2.Visible then
			Humanoid.OpenClose()
		end
	end)
	local ImageLabel = NewGui("ImageLabel", "LeftBumper")
	ImageLabel.Size = UDim2.new(0, 40, 0, 40)
	ImageLabel.Position = UDim2.new(0, -ImageLabel.Size.X.Offset, 0.5, -ImageLabel.Size.Y.Offset / 2)
	local ImageLabel1 = NewGui("ImageLabel", "RightBumper")
	ImageLabel1.Size = UDim2.new(0, 40, 0, 40)
	ImageLabel1.Position = UDim2.new(1, 0, 0.5, -ImageLabel1.Size.Y.Offset / 2)
	Frame2 = NewGui("Frame", "Inventory")
	Frame2.BackgroundTransparency = ScaledPreferredTransparency
	Frame2.BackgroundColor3 = _Color3
	Frame2.Active = true
	Frame2.Visible = false
	Frame2.Parent = Frame
	TextButton = NewGui("TextButton", "VRInventorySelector")
	TextButton.Position = UDim2.new(0, 0, 0, 0)
	TextButton.Size = UDim2.new(1, 0, 1, 0)
	TextButton.BackgroundTransparency = 1
	TextButton.Text = ""
	TextButton.Parent = Frame2
	local ImageLabel2 = NewGui("ImageLabel", "Selector")
	ImageLabel2.Size = UDim2.new(1, 0, 1, 0)
	ImageLabel2.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png"
	ImageLabel2.ScaleType = Enum.ScaleType.Slice
	ImageLabel2.SliceCenter = Rect.new(12, 12, 52, 52)
	ImageLabel2.Visible = false
	TextButton.SelectionImageObject = ImageLabel2
	ScrollingFrame = NewGui("ScrollingFrame", "ScrollingFrame")
	ScrollingFrame.Selectable = false
	ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
	ScrollingFrame.Parent = Frame2
	Frame3 = NewGui("Frame", "UIGridFrame")
	Frame3.Selectable = false
	Frame3.Size = UDim2.new(1, -10, 1, 0)
	Frame3.Position = UDim2.new(0, 5, 0, 0)
	Frame3.Parent = ScrollingFrame
	GridLayout = Instance.new("UIGridLayout")
	GridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	GridLayout.CellSize = UDim2.new(0, XOffset, 0, XOffset)
	GridLayout.CellPadding = UDim2.new(0, 5, 0, 5)
	GridLayout.Parent = Frame3
	ScrollUpButton = MakeVRRoundButton("ScrollUpButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png")
	ScrollUpButton.Size = UDim2.new(0, 34, 0, 34)
	ScrollUpButton.Position = UDim2.new(0.5, -ScrollUpButton.Size.X.Offset / 2, 0, 43)
	ScrollUpButton.Icon.Position -= UDim2.new(0, 0, 0, 2)
	ScrollUpButton.MouseButton1Click:connect(function()
		-- upvalues: ScrollingFrame (upval), XOffset (upval)
		if ScrollingFrame then
			ScrollingFrame.CanvasPosition = Vector2.new(ScrollingFrame.CanvasPosition.X, (math.min(ScrollingFrame.CanvasSize.Y.Offset - ScrollingFrame.AbsoluteWindowSize.Y, (math.max(0, ScrollingFrame.CanvasPosition.Y - (XOffset + 5))))))
			
			return
		end
	end)
	ScrollDownButton = MakeVRRoundButton("ScrollDownButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png")
	ScrollDownButton.Rotation = 180
	ScrollDownButton.Icon.Position -= UDim2.new(0, 0, 0, 2)
	ScrollDownButton.Size = UDim2.new(0, 34, 0, 34)
	ScrollDownButton.Position = UDim2.new(0.5, -ScrollDownButton.Size.X.Offset / 2, 1, -ScrollDownButton.Size.Y.Offset - 3)
	ScrollDownButton.MouseButton1Click:connect(function()
		-- upvalues: ScrollingFrame (upval), XOffset (upval)
		if ScrollingFrame then
			ScrollingFrame.CanvasPosition = Vector2.new(ScrollingFrame.CanvasPosition.X, (math.min(ScrollingFrame.CanvasSize.Y.Offset - ScrollingFrame.AbsoluteWindowSize.Y, (math.max(0, ScrollingFrame.CanvasPosition.Y + (XOffset + 5))))))
			
			return
		end
	end)
	ScrollingFrame.Changed:connect(function(p9)
		-- upvalues: ScrollingFrame (upval), ScrollUpButton (upval), ScrollDownButton (upval)
		if not ScrollingFrame then return end
		if p9 == "AbsoluteWindowSize" or p9 == "CanvasPosition" or p9 == "CanvasSize" then
			local IsYBelow = ScrollingFrame.CanvasPosition.Y < ScrollingFrame.CanvasSize.Y.Offset - ScrollingFrame.AbsoluteWindowSize.Y
			ScrollUpButton.Visible = ScrollingFrame.CanvasPosition.Y ~= 0
			ScrollDownButton.Visible = IsYBelow
		end
	end)
	UpdateBackpackLayout()
	local Frame5 = CreateFunction("Frame")({
		Name = "GamepadHintsFrame",
		BackgroundTransparency = 1,
		Visible = false,
		Size = UDim2.new(0, Frame1.Size.X.Offset, 0, if IsEnabled then 95 else 60),
		Parent = Frame
	})
	
	local function addGamepadHint(p9, p10, Text)
		-- upvalues: CreateFunction (upval), Frame5 (copy), IsEnabled (upval)
		local Parent = CreateFunction("Frame")({
			Name = "HintFrame",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, -5),
			Position = UDim2.new(0, 0, 0, 0),
			Parent = Frame5
		})
		local _ = CreateFunction("ImageLabel")({
			Name = "HintImage",
			BackgroundTransparency = 1,
			Size = IsEnabled and UDim2.new(0, 90, 0, 90) or UDim2.new(0, 60, 0, 60),
			Image = IsEnabled and p10 or p9,
			Parent = Parent
		})
		local Label = CreateFunction("TextLabel")({
			Name = "HintText",
			BackgroundTransparency = 1,
			TextWrapped = true,
			Position = UDim2.new(0, if IsEnabled then 100 else 70, 0, 0),
			Size = UDim2.new(1, -(if IsEnabled then 100 else 70), 1, 0),
			Font = Enum.Font.SourceSansBold,
			FontSize = IsEnabled and Enum.FontSize.Size36 or Enum.FontSize.Size24,
			Text = Text,
			TextColor3 = Color3.new(1, 1, 1),
			TextXAlignment = Enum.TextXAlignment.Left,
			Parent = Parent
		})
		local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
		UITextSizeConstraint.Parent = Label
		UITextSizeConstraint.MaxTextSize = Label.TextSize
	end
	
	local function resizeGamepadHintsFrame()
		-- upvalues: Frame1 (upval), Frame2 (upval), Frame5 (copy), IsEnabled (upval)
		if not Frame1 or not Frame2 then return end
		Frame5.Size = UDim2.new(Frame1.Size.X.Scale, Frame1.Size.X.Offset, 0, if IsEnabled then 95 else 60)
		Frame5.Position = UDim2.new(Frame1.Position.X.Scale, Frame1.Position.X.Offset, Frame2.Position.Y.Scale, Frame2.Position.Y.Offset - Frame5.Size.Y.Offset)
		local NewOffset = 0
		local Children = Frame5:GetChildren()
		
		for i = 1, #Children do
			Children[i].Size = UDim2.new(1, 0, 1, -5)
			Children[i].Position = UDim2.new(0, 0, 0, 0)
			NewOffset += Children[i].HintText.Position.X.Offset + Children[i].HintText.TextBounds.X
		end
		local XRatio = (Frame5.AbsoluteSize.X - NewOffset) / (#Children - 1)
		
		for i1 = 1, #Children do
			Children[i1].Position = i1 == 1 and UDim2.new(0, 0, 0, 0) or UDim2.new(0, Children[i1 - 1].Position.X.Offset + Children[i1 - 1].Size.X.Offset + XRatio, 0, 0)
			Children[i1].Size = UDim2.new(0, Children[i1].HintText.Position.X.Offset + Children[i1].HintText.TextBounds.X, 1, -5)
		end
	end
	
	addGamepadHint("rbxasset://textures/ui/Controls/DesignSystem/ButtonX.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonX@2x.png", "Remove From Hotbar")
	addGamepadHint("rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonA@2x.png", "Select/Swap")
	addGamepadHint("rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonB@2x.png", "Close Backpack")
	local Frame6 = NewGui("Frame", "Search")
	Frame6.BackgroundColor3 = _Color3_5
	Frame6.BackgroundTransparency = ScaledPreferredTransparency2
	Frame6.Size = UDim2.new(0, 190, 0, 30)
	Frame6.Position = UDim2.new(1, -Frame6.Size.X.Offset - 5, 0, 5)
	Frame6.Parent = Frame2
	local TextBox = NewGui("TextBox", "TextBox")
	TextBox.Text = InGameUnknownNamespaceBACKPACKSEARCH
	TextBox.ClearTextOnFocus = false
	TextBox.FontSize = Enum.FontSize.Size24
	TextBox.TextXAlignment = Enum.TextXAlignment.Left
	TextBox.Size = Frame6.Size - UDim2.new(0, 0, 0, 0)
	TextBox.Position = UDim2.new(0, 0, 0, 0)
	TextBox.Parent = Frame6
	local TextButton1 = NewGui("TextButton", "X")
	TextButton1.Text = "x"
	TextButton1.TextColor3 = _Color3_2
	TextButton1.FontSize = Enum.FontSize.Size24
	TextButton1.TextYAlignment = Enum.TextYAlignment.Bottom
	TextButton1.BackgroundColor3 = _Color3_5
	TextButton1.BackgroundTransparency = 0
	TextButton1.Size = UDim2.new(0, Frame6.Size.Y.Offset - 10, 0, Frame6.Size.Y.Offset - 10)
	TextButton1.Position = UDim2.new(1, -TextButton1.Size.X.Offset - 10, 0.5, -TextButton1.Size.Y.Offset / 2)
	TextButton1.ZIndex = 0
	TextButton1.Visible = false
	TextButton1.BorderSizePixel = 0
	TextButton1.Parent = Frame6
	
	local function search()
		-- upvalues: TextBox (copy), NumberOfHotbarSlots (upval), List (upval), Frame2 (upval), Flag4 (upval), Frame3 (upval), ScrollingFrame (upval), UpdateScrollingFrameCanvasSize (upval), TextButton1 (copy)
		local t = {}
		
		for Text in TextBox.Text:gmatch("%S+") do
			t[Text:lower()] = true
		end
		local List1 = {}
		
		for i = NumberOfHotbarSlots + 1, #List do
			local Entry = List[i]
			table.insert(List1, { Entry, (Entry:CheckTerms(t)) })
			Entry.Frame.Visible = false
			Entry.Frame.Parent = Frame2
		end
		table.sort(List1, function(Entry1, Entry): boolean
			return Entry[2] < Entry1[2]
		end)
		Flag4 = true
		local Count = 0
		
		for _, value in ipairs(List1) do
			local v9 = value[1]
			
			if value[2] > 0 then
				v9.Frame.Visible = true
				v9.Frame.Parent = Frame3
				v9.Frame.LayoutOrder = NumberOfHotbarSlots + Count
				Count += 1
			end
		end
		if ScrollingFrame then
			ScrollingFrame.CanvasPosition = Vector2.new(0, 0)
		end
		UpdateScrollingFrameCanvasSize()
		TextButton1.ZIndex = 3
	end
	
	local function clearResults()
		-- upvalues: TextButton1 (copy), Flag4 (upval), NumberOfHotbarSlots (upval), List (upval), Frame3 (upval), UpdateScrollingFrameCanvasSize (upval)
		if TextButton1.ZIndex > 0 then
			Flag4 = false
			
			for i = NumberOfHotbarSlots + 1, #List do
				local Entry = List[i]
				Entry.Frame.LayoutOrder = Entry.Index
				Entry.Frame.Parent = Frame3
				Entry.Frame.Visible = true
			end
			TextButton1.ZIndex = 0
		end
		UpdateScrollingFrameCanvasSize()
	end
	
	local function reset()
		-- upvalues: clearResults (copy), TextBox (copy), InGameUnknownNamespaceBACKPACKSEARCH (upval)
		clearResults()
		TextBox.Text = InGameUnknownNamespaceBACKPACKSEARCH
	end
	
	local function onChanged(p9)
		-- upvalues: TextBox (copy), clearResults (copy), InGameUnknownNamespaceBACKPACKSEARCH (upval), search (copy), TextButton1 (copy)
		if p9 == "Text" then
			local Text = TextBox.Text
			
			if Text == "" then
				clearResults()
			elseif Text ~= InGameUnknownNamespaceBACKPACKSEARCH then
				search()
			end
			TextButton1.Visible = Text ~= "" and Text ~= InGameUnknownNamespaceBACKPACKSEARCH
		end
	end
	
	local function focusLost(EnterPressed)
		-- upvalues: search (copy), TextBox (copy), InGameUnknownNamespaceBACKPACKSEARCH (upval)
		if EnterPressed then
			search()
			
			return
		end
		if TextBox.Text == "" then
			TextBox.Text = InGameUnknownNamespaceBACKPACKSEARCH
		end
	end
	
	TextBox.Focused:connect(function()
		-- upvalues: TextBox (copy), InGameUnknownNamespaceBACKPACKSEARCH (upval)
		if TextBox.Text == InGameUnknownNamespaceBACKPACKSEARCH then
			TextBox.Text = ""
		end
	end)
	TextButton1.MouseButton1Click:connect(reset)
	TextBox.Changed:connect(onChanged)
	TextBox.FocusLost:connect(focusLost)
	table.insert(List3, Humanoid.StateChanged.Event:connect(function(Modal)
		-- upvalues: TextButton1 (copy), clearResults (copy), TextBox (copy), InGameUnknownNamespaceBACKPACKSEARCH (upval)
		TextButton1.Modal = Modal
		
		if not Modal then
			clearResults()
			TextBox.Text = InGameUnknownNamespaceBACKPACKSEARCH
		end
	end))
	
	Tbl1[Enum.KeyCode.Escape.Value] = function(p9)
		-- upvalues: clearResults (copy), TextBox (copy), InGameUnknownNamespaceBACKPACKSEARCH (upval), Frame2 (upval), Humanoid (upval)
		if p9 then
			clearResults()
			TextBox.Text = InGameUnknownNamespaceBACKPACKSEARCH
			
			return
		end
		if Frame2 and Frame2.Visible then
			Humanoid.OpenClose()
		end
	end
	
	table.insert(List3, UserInputService.LastInputTypeChanged:connect(function(LastInputType)
		-- upvalues: VRService (upval), Frame6 (copy)
		if LastInputType == Enum.UserInputType.Gamepad1 and not VRService.VREnabled then
			Frame6.Visible = false
			
			return
		else
			Frame6.Visible = true
		end
	end))
	
	local function v252(_, InputState, _)
		-- upvalues: GuiService (upval), NumberOfHotbarSlots (upval), List (upval)
		if InputState ~= Enum.UserInputState.Begin then return end
		if not GuiService.SelectedCoreObject then return end
		for i = 1, NumberOfHotbarSlots do
			if List[i].Frame == GuiService.SelectedCoreObject and List[i].Tool then
				List[i]:MoveToInventory()
				break
			end
		end
	end
	
	local function openClose()
		-- upvalues: Frame2 (upval), Tbl2 (upval), AdjustHotbarFrames (upval), Frame1 (upval), NumberOfHotbarSlots (upval), List (upval), Flag5 (upval), config (upval), UserInputService (upval), resizeGamepadHintsFrame (copy), Frame5 (copy), ContextActionService (upval), v252 (copy), Humanoid (upval)
		if not Frame2 then return end
		if not next(Tbl2) then
			Frame2.Visible = not Frame2.Visible
			local Visible = Frame2.Visible
			AdjustHotbarFrames()
			Frame1.Active = not Frame1.Active
			
			for i = 1, NumberOfHotbarSlots do
				List[i]:SetClickability(not Visible)
			end
		end
		if Frame2.Visible then
			if Flag5 then
				if config[UserInputService:GetLastInputType()] then
					resizeGamepadHintsFrame()
					Frame5.Visible = true
				end
				enableGamepadInventoryControl()
			end
		else
			if Flag5 then
				Frame5.Visible = false
			end
			disableGamepadInventoryControl()
		end
		if Frame2.Visible then
			ContextActionService:BindAction("RBXRemoveSlot", v252, false, Enum.KeyCode.ButtonX)
		else
			ContextActionService:UnbindAction("RBXRemoveSlot")
		end
		Humanoid.IsOpen = Frame2.Visible
		Humanoid.StateChanged:Fire(Frame2.Visible)
	end
	
	Tbl1[Value] = function()
		-- upvalues: GuiService (upval), openClose (copy)
		if not GuiService.MenuIsOpen then
			openClose()
			
			return
		end
	end
	
	Humanoid.OpenClose = openClose
	while not LocalPlayer do
		wait()
		LocalPlayer = Players.LocalPlayer
	end
	table.insert(List3, LocalPlayer.CharacterAdded:connect(OnCharacterAdded))
	
	if LocalPlayer.Character then
		OnCharacterAdded(LocalPlayer.Character)
	end
	for i1 = 0, 9 do
		table.insert(List1, (tostring(i1)))
	end
	table.insert(List1, "`")
	table.insert(List3, UserInputService.InputBegan:connect(OnInputBegan))
	table.insert(List3, UserInputService.TextBoxFocused:connect(function()
		-- upvalues: Flag3 (upval)
		Flag3 = true
	end))
	table.insert(List3, UserInputService.TextBoxFocusReleased:connect(function()
		-- upvalues: Flag3 (upval)
		Flag3 = false
	end))
	
	Tbl1[Value2] = function()
		-- upvalues: HopperBin (upval), Humanoid1 (upval), Tbl (upval)
		if HopperBin and Humanoid1 then
			Humanoid1:UnequipTools()
			
			if HopperBin then
				HopperBin:ToggleSelect()
				Tbl[HopperBin]:UpdateEquipView()
				HopperBin = nil
			end
		end
	end
	
	table.insert(List3, UserInputService.Changed:connect(OnUISChanged))
	local NoVREnabled: boolean = UserInputService.KeyboardEnabled and not VRService.VREnabled
	for i2 = 1, NumberOfHotbarSlots do
		List[i2]:TurnNumber(NoVREnabled)
	end
	if UserInputService:GetGamepadConnected(Enum.UserInputType.Gamepad1) then
		gamepadConnected()
	end
	table.insert(List3, UserInputService.GamepadConnected:connect(function(GamepadNum)
		if GamepadNum == Enum.UserInputType.Gamepad1 then
			gamepadConnected()
		end
	end))
	table.insert(List3, UserInputService.GamepadDisconnected:connect(function(GamepadNum)
		if GamepadNum == Enum.UserInputType.Gamepad1 then
			gamepadDisconnected()
		end
	end))
	
	if EnableHotbarHide then
		table.insert(List3, SettingsShowSignal:connect(function(p9)
			-- upvalues: Humanoid (upval), AdjustHotbarFrames (upval)
			if not p9 then
				AdjustHotbarFrames(false)
			elseif Humanoid.IsHotbarVisible then
				AdjustHotbarFrames(true)
				
				return
			end
		end))
	end
	table.insert(List3, GuiService.MenuOpened:Connect(function()
		-- upvalues: Humanoid (upval), IsInExperienceUIVREnabled (upval), InExperienceUIVRIXP (upval), VRService (upval)
		if Humanoid.IsOpen and (not IsInExperienceUIVREnabled or InExperienceUIVRIXP:isMovePanelToCenter() or not VRService.VREnabled) then
			Humanoid.OpenClose()
		end
	end))
	table.insert(List3, InExperienceAppChatModalModule.default.visibilitySignal.Event:Connect(function(p9)
		-- upvalues: Humanoid (upval)
		if p9 and Humanoid.IsOpen then
			Humanoid.OpenClose()
		end
	end))
	table.insert(List3, UserGameSettings:GetPropertyChangedSignal("PreferredTransparency"):connect(function()
		-- upvalues: UserGameSettings (upval), ScaledPreferredTransparency (upval), Frame2 (upval), ScaledPreferredTransparency1 (upval), List (upval), ScaledPreferredTransparency2 (upval), Frame6 (copy)
		local PreferredTransparency: number = UserGameSettings.PreferredTransparency
		ScaledPreferredTransparency = 0.5 * UserGameSettings.PreferredTransparency
		
		if Frame2 then
			Frame2.BackgroundTransparency = ScaledPreferredTransparency
		end
		ScaledPreferredTransparency1 = 0.5 * PreferredTransparency
		
		for _, value in ipairs(List) do
			value.Frame.BackgroundTransparency = ScaledPreferredTransparency1
		end
		ScaledPreferredTransparency2 = 0.15 * UserGameSettings.PreferredTransparency
		Frame6.BackgroundTransparency = ScaledPreferredTransparency2
	end))
end

function Humanoid.destroyGui()
	-- upvalues: List3 (copy), List2 (ref), ContextActionService (copy), List (copy), Tbl (copy), Tbl1 (copy), Tbl2 (copy), List1 (copy), Frame (ref), Frame1 (ref), ImageButton (ref), CloseInventory (ref), Frame2 (ref), TextButton (ref), ScrollingFrame (ref), Frame3 (ref), GridLayout (ref), ScrollUpButton (ref), ScrollDownButton (ref), Parent1 (ref), Humanoid1 (ref), Backpack (ref), v2 (ref), Count (ref), HopperBin (ref), Flag1 (ref), Flag2 (ref), Flag3 (ref), Flag4 (ref), Flag5 (ref), Flag (ref), CurrentTime (ref), v4 (ref), Humanoid (copy)
	for _, value in pairs(List3) do
		value:disconnect()
	end
	table.clear(List3)
	
	for _, value1 in pairs(List2) do
		value1:disconnect()
	end
	table.clear(List2)
	ContextActionService:UnbindAction("RBXHotbarEquip")
	ContextActionService:UnbindAction("RBXRemoveSlot")
	unbindAllGamepadEquipActions()
	
	for i = #List, 1, -1 do
		local Entry = List[i]
		
		if Entry.Tool then
			Entry:Clear()
		end
	end
	table.clear(List)
	table.clear(Tbl)
	table.clear(Tbl1)
	table.clear(Tbl2)
	table.clear(List1)
	
	if Frame then
		Frame:Destroy()
		Frame = nil
	end
	Frame1 = nil
	ImageButton = nil
	CloseInventory = nil
	Frame2 = nil
	TextButton = nil
	ScrollingFrame = nil
	Frame3 = nil
	GridLayout = nil
	ScrollUpButton = nil
	ScrollDownButton = nil
	Parent1 = nil
	Humanoid1 = nil
	Backpack = nil
	v2 = nil
	Count = 0
	HopperBin = nil
	Flag1 = false
	Flag2 = false
	Flag3 = false
	Flag4 = false
	Flag5 = false
	Flag = false
	CurrentTime = 0
	v4 = nil
	Humanoid.OpenClose = nil
	Humanoid.IsOpen = false
	Humanoid.IsHotbarVisible = false
end

function Humanoid:TopbarEnabledChanged(TopBarCoreGuiEnabled)
	-- upvalues: v1 (ref), setBackpackEnabled (copy), StarterGui (copy)
	v1 = TopBarCoreGuiEnabled
	setBackpackEnabled(StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack))
end

if FFlagTopBarSignalizeSetCores then
	Humanoid.disposeEffect = SignalsModule.createEffect(function(p9)
		-- upvalues: InExperienceTopBarModule (copy), Humanoid (copy)
		local GetTopBarStoreFunction = InExperienceTopBarModule.Stores.GetTopBarStore
		
		if GetTopBarStoreFunction then
			Humanoid:TopbarEnabledChanged(GetTopBarStoreFunction(p9).getTopBarCoreGuiEnabled(p9))
		end
	end)
end
local Features = SystemModule.Features
local Lifecycle = Features.registerLifecycle(Features.FeatureName.Backpack, {
	defaultVisible = false,
	coreGuiType = Enum.CoreGuiType.Backpack
}).lifecycle
Lifecycle:onEnabledChanged(function(p9)
	-- upvalues: Humanoid (copy), setBackpackEnabled (copy)
	if p9 then
		Humanoid.createGui()
	else
		Humanoid.destroyGui()
	end
	setBackpackEnabled(p9)
end)
Lifecycle:onVisibilityChanged(function(IsOpen)
	-- upvalues: Humanoid (copy)
	if Humanoid.OpenClose and Humanoid.IsOpen ~= IsOpen then
		Humanoid.OpenClose()
	end
	return Humanoid.IsOpen
end)
Humanoid.StateChanged.Event:connect(function(p9)
	-- upvalues: Lifecycle (copy)
	if Lifecycle then
		Lifecycle.setVisible(p9)
	end
end)

return Humanoid