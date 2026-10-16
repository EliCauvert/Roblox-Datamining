local UserGameSettings = UserSettings():GetService("UserGameSettings")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local CorePackages = game:GetService("CorePackages")
local Modules = RobloxGui.Modules
local SignalsModule = require(CorePackages.Packages.Signals)
local InExperienceTopBarModule = require(CorePackages.Workspace.Packages.InExperienceTopBar)
local SettingsShowSignal = require(CorePackages.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local InExperienceAppChatModalModule = require(CorePackages.Workspace.Packages.AppChat.InExperienceAppChatModal)
local FFlagMountCoreGuiBackpackModule = require(Modules.Flags.FFlagMountCoreGuiBackpack)
local IsInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local InExperienceUIVRIXP = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP
local FFlagTopBarSignalizeSetCores = InExperienceTopBarModule.Flags.FFlagTopBarSignalizeSetCores
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local FFlagBackpackResponsiveUnits = require(CorePackages.Workspace.Packages.SharedFlags).FFlagBackpackResponsiveUnits
local EnableHotbarHide = game:DefineFastFlag("EnableHotbarHide", false)
local FFlagStudioDeviceSimVRSwitchFixes = require(CorePackages.Workspace.Packages.SharedFlags).FFlagStudioDeviceSimVRSwitchFixes
local SAToolEquipLuauFlag = game:DefineFastFlag("SAToolEquipLuauFlag", false)

local function _(): boolean --[[ Line: 36 | Named "featureSAToolEquipEnabled" ]]
	-- upvalues: SAToolEquipLuauFlag (copy)
	return if SAToolEquipLuauFlag and game:GetEngineFeature("SAToolEquipEngineFeature") then workspace.AuthorityMode == Enum.AuthorityMode.Server else false
end

local BackpackScriptModule = {
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
local CreateFunction = require(CorePackages.Workspace.Packages.AppCommonLib).Create
local GameTranslatorModule = require(Modules.GameTranslator)
pcall(function() --[[ Line: 134 ]]
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
local Parent = nil
local Parent1 = nil
local ImageButton = nil
local Parent2 = nil
local v2 = nil
local ScrollingFrame = nil
local Parent3 = nil
local ScrollUpButton = nil
local ScrollDownButton = nil
local Parent4 = nil
local Humanoid = nil
local Backpack = nil
local List = {}
local v3 = nil
local t = {}
local t1 = {}
local t2 = {}
local Count = 0
local HopperBin = nil
local Flag1 = false
local v4 = false
local Flag2 = false
local Flag3 = false
local List1 = {}
local List2 = {}
local Flag4 = false
local CurrentTime = 0
local NumberOfHotbarSlots: number = if IsXBelow then 3 else 10
local v5: number = if IsXBelow then 2 else 4
local v6 = nil
BackpackScriptModule.BackpackEmpty = CreateFunction("BindableEvent")({ Name = "BackpackEmpty" })
BackpackScriptModule.BackpackItemAdded = CreateFunction("BindableEvent")({ Name = "BackpackAdded" })
BackpackScriptModule.BackpackItemRemoved = CreateFunction("BindableEvent")({ Name = "BackpackRemoved" })

local function NewGui(p1, Name) --[[ Line: 207 ]]
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

local _ = function() --[[ Line: 229 | Named "FindLowestEmpty" ]]
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

function BackpackScriptModule.IsInventoryEmpty(): boolean --[[ Line: 239 ]]
	-- upvalues: NumberOfHotbarSlots (ref), List (copy)
	for i = NumberOfHotbarSlots + 1, #List do
		local Entry = List[i]
		
		if Entry and Entry.Tool then
			return false
		end
	end
	return true
end

local _ = function(): boolean --[[ Line: 251 | Named "UseGazeSelection" ]]
	return false
end

local function AdjustHotbarFrames(p1) --[[ Line: 255 ]]
	-- upvalues: Parent2 (ref), NumberOfHotbarSlots (ref), Count (ref), EnableHotbarHide (copy), List (copy), ImageButton (ref), BackpackScriptModule (copy)
	local Visible = Parent2.Visible
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
	local ImageButton1 = ImageButton
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
	ImageButton1.Visible = NoVisible
	ImageButton.Position = UDim2.new(0.5, -15, 1, if NoP2 then -110 else -50)
	BackpackScriptModule.IsHotbarVisible = NoP2
end

local function UpdateScrollingFrameCanvasSize() --[[ Line: 278 ]]
	-- upvalues: ScrollingFrame (ref), XOffset (ref), Parent3 (ref)
	ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, math.ceil((#Parent3:GetChildren() - 1) / math.floor(ScrollingFrame.AbsoluteSize.X / (XOffset + 5))) * (XOffset + 5) + 5)
end

local function AdjustInventoryFrames() --[[ Line: 285 ]]
	-- upvalues: NumberOfHotbarSlots (ref), List (copy), UpdateScrollingFrameCanvasSize (copy)
	for i = NumberOfHotbarSlots + 1, #List do
		local Entry = List[i]
		Entry.Frame.LayoutOrder = Entry.Index
		Entry.Frame.Visible = Entry.Tool ~= nil
	end
	UpdateScrollingFrameCanvasSize()
end

local function UpdateBackpackLayout() --[[ Line: 294 ]]
	-- upvalues: Parent1 (ref), NumberOfHotbarSlots (ref), XOffset (ref), Parent2 (ref), v5 (copy), ScrollingFrame (ref), AdjustHotbarFrames (copy), AdjustInventoryFrames (copy)
	Parent1.Size = UDim2.new(0, 5 + NumberOfHotbarSlots * (XOffset + 5), 0, XOffset + 5 + 5)
	Parent1.Position = UDim2.new(0.5, -Parent1.Size.X.Offset / 2, 1, -Parent1.Size.Y.Offset)
	Parent2.Size = UDim2.new(0, Parent1.Size.X.Offset, 0, Parent1.Size.Y.Offset * v5 + 40)
	Parent2.Position = UDim2.new(0.5, -Parent2.Size.X.Offset / 2, 1, Parent1.Position.Y.Offset - Parent2.Size.Y.Offset)
	ScrollingFrame.Size = UDim2.new(1, ScrollingFrame.ScrollBarThickness + 1, 1, -40)
	ScrollingFrame.Position = UDim2.new(0, 0, 0, 40)
	AdjustHotbarFrames()
	AdjustInventoryFrames()
end

local _ = function(p2: number, p3: number, p4: number): number --[[ Line: 306 | Named "Clamp" ]]
	return (math.min(p3, (math.max(p2, p4))))
end

local _ = function(Frame: Frame, p2, p3): boolean --[[ Line: 310 | Named "CheckBounds" ]]
	local AbsolutePosition = Frame.AbsolutePosition
	local AbsoluteSize = Frame.AbsoluteSize
	
	return AbsolutePosition.X < p2 and (p2 <= AbsolutePosition.X + AbsoluteSize.X and AbsolutePosition.Y < p3) and p3 <= AbsolutePosition.Y + AbsoluteSize.Y
end

local _ = function(Frame: Frame, p2) --[[ Line: 316 | Named "GetOffset" ]]
	return (Frame.AbsolutePosition + Frame.AbsoluteSize / 2 - p2).magnitude
end

local _ = function() --[[ Line: 321 | Named "DisableActiveHopper" ]]
	-- upvalues: HopperBin (ref), t (copy)
	HopperBin:ToggleSelect()
	t[HopperBin]:UpdateEquipView()
	HopperBin = nil
end

local _ = function() --[[ Line: 327 | Named "UnequipAllTools" ]]
	-- upvalues: Humanoid (ref), HopperBin (ref), t (copy)
	if Humanoid then
		Humanoid:UnequipTools()
		
		if HopperBin then
			HopperBin:ToggleSelect()
			t[HopperBin]:UpdateEquipView()
			HopperBin = nil
		end
	end
end

local function EquipNewTool(HopperBin1) --[[ Line: 336 ]]
	-- upvalues: Humanoid (ref), HopperBin (ref), t (copy), SAToolEquipLuauFlag (copy), LocalPlayer (ref), Parent4 (ref)
	if Humanoid then
		Humanoid:UnequipTools()
		
		if HopperBin then
			HopperBin:ToggleSelect()
			t[HopperBin]:UpdateEquipView()
			HopperBin = nil
		end
	end
	if HopperBin1:IsA("HopperBin") then
		HopperBin1:ToggleSelect()
		t[HopperBin1]:UpdateEquipView()
		HopperBin = HopperBin1
		
		return
	end
	if if SAToolEquipLuauFlag and game:GetEngineFeature("SAToolEquipEngineFeature") then workspace.AuthorityMode == Enum.AuthorityMode.Server else false then
		LocalPlayer:RequestTool(HopperBin1)
	end
	HopperBin1.Parent = Parent4
end

local _ = function(HopperBin) --[[ Line: 352 | Named "IsEquipped" ]]
	-- upvalues: Parent4 (ref)
	return HopperBin and (HopperBin:IsA("HopperBin") and HopperBin.Active or HopperBin.Parent == Parent4)
end

local function MakeSlot(Frame, p2) --[[ Line: 356 ]]
	-- upvalues: List (copy), ScaledPreferredTransparency1 (ref), _Color3_1 (copy), _Color3 (copy), Parent1 (ref), XOffset (ref), GameTranslatorModule (copy), NumberOfHotbarSlots (ref), Parent2 (ref), Count (ref), v4 (ref), Flag (ref), ContextActionService (copy), t (copy), v3 (ref), Parent4 (ref), v6 (ref), NewGui (copy), _Color3_2 (copy), t2 (copy), UpdateScrollingFrameCanvasSize (copy), SAToolEquipLuauFlag (copy), LocalPlayer (ref), Humanoid (ref), HopperBin (ref), Backpack (ref), EquipNewTool (copy), _Color3_3 (copy), MakeSlot (copy), Parent3 (ref), Flag3 (ref), t1 (copy), Value1 (copy), ScrollingFrame (ref)
	local P14 = p2 or #List + 1
	local Frame1 = nil
	local Frame2 = nil
	local ImageLabel = nil
	local TextLabel = nil
	local ChangedConnection = nil
	local Frame3 = nil
	local Label = nil
	local TextLabel1 = nil
	
	local function _() --[[ Line: 381 | Named "UpdateSlotFading" ]]
		-- upvalues: Frame1 (ref), ScaledPreferredTransparency1 (upval), _Color3_1 (upval), _Color3 (upval)
		Frame1.SelectionImageObject = nil
		Frame1.BackgroundTransparency = if Frame1.Draggable then 0 else ScaledPreferredTransparency1
		Frame1.BackgroundColor3 = Frame1.Draggable and _Color3_1 or _Color3
	end
	
	local config = {
		Tool = nil,
		Index = P14,
		Frame = nil,
		Readjust = function(_, Count, p3: number) --[[ Line: 387 ]]
			-- upvalues: Parent1 (upval), XOffset (upval), Frame1 (ref)
			Frame1.Position = UDim2.new(0, Parent1.Size.X.Offset / 2 - XOffset / 2 + (XOffset + 5) * (Count - (p3 / 2 + 0.5)), 0, 5)
		end,
		Fill = function(p3, Tool: Tool) --[[ Line: 395 ]]
			-- upvalues: ImageLabel (ref), TextLabel (ref), GameTranslatorModule (upval), Label (ref), ChangedConnection (ref), NumberOfHotbarSlots (upval), Parent2 (upval), Frame1 (ref), Count (upval), v4 (upval), Flag (upval), ContextActionService (upval), t (upval), v3 (upval), List (upval)
			if not Tool then
				return p3:Clear()
			end
			p3.Tool = Tool
			
			local function assignToolData() --[[ Line: 402 ]]
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
			ChangedConnection = Tool.Changed:connect(function(p4) --[[ Line: 428 ]]
				-- upvalues: assignToolData (copy)
				if p4 == "TextureId" or p4 == "Name" or p4 == "ToolTip" then
					assignToolData()
				end
			end)
			local IsIndexBelow = p3.Index <= NumberOfHotbarSlots
			local Visible = Parent2.Visible
			
			if not IsIndexBelow or Visible then
				Frame1.Draggable = true
			end
			p3:UpdateEquipView()
			
			if IsIndexBelow then
				Count += 1
				
				if v4 and Count >= 1 and not Flag then
					Flag = true
					ContextActionService:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
				end
			end
			t[Tool] = p3
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
			v3 = v7
		end,
		Clear = function(p4) --[[ Line: 459 ]]
			-- upvalues: ChangedConnection (ref), ImageLabel (ref), TextLabel (ref), Label (ref), Frame1 (ref), NumberOfHotbarSlots (upval), Count (upval), Flag (upval), ContextActionService (upval), t (upval), v3 (upval), List (upval)
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
			Frame1.Draggable = false
			p4:UpdateEquipView(true)
			
			if p4.Index <= NumberOfHotbarSlots then
				Count -= 1
				
				if Count < 1 then
					Flag = false
					ContextActionService:UnbindAction("RBXHotbarEquip")
				end
			end
			t[p4.Tool] = nil
			p4.Tool = nil
			local v8 = nil
			local Entry = nil
			
			for i = 1, NumberOfHotbarSlots do
				Entry = List[i]
				
				if Entry.Tool then
					continue
				end
				v8 = Entry
				break
			end
			v3 = v8
		end
	}
	
	function config.UpdateEquipView(p5, p6) --[[ Line: 490 ]]
		-- upvalues: Parent4 (upval), v6 (upval), config (copy), Frame3 (ref), NewGui (upval), Frame1 (ref), _Color3_2 (upval), ScaledPreferredTransparency1 (upval), _Color3_1 (upval), _Color3 (upval)
		repeat
			if not p6 then
				local Tool = p5.Tool
				
				if Tool and (Tool:IsA("HopperBin") and Tool.Active or Tool.Parent == Parent4) then
					v6 = config
					
					if not Frame3 then
						Frame3 = NewGui("Frame", "Equipped")
						Frame3.ZIndex = Frame1.ZIndex
						
						for _, value in pairs({
							{ 0.1, 1, 0, 0 },
							{ 0.8, 0.1, 0.1, 0 },
							{ 0.1, 1, 0.9, 0 },
							{ 0.8, 0.1, 0.1, 0.9 }
						}) do
							local Frame = NewGui("Frame", "Edge")
							Frame.BackgroundTransparency = 0
							Frame.BackgroundColor3 = _Color3_2
							Frame.Size = UDim2.new(value[1], 0, value[2], 0)
							Frame.Position = UDim2.new(value[3], 0, value[4], 0)
							Frame.ZIndex = Frame3.ZIndex
							Frame.Parent = Frame3
						end
					end
					Frame3.Parent = Frame1
					break
				end
			end
			if not Frame3 then break end
			Frame3.Parent = nil
		until true
		Frame1.SelectionImageObject = nil
		Frame1.BackgroundTransparency = if Frame1.Draggable then 0 else ScaledPreferredTransparency1
		Frame1.BackgroundColor3 = Frame1.Draggable and _Color3_1 or _Color3
	end
	
	function config.IsEquipped(p5) --[[ Line: 522 ]]
		-- upvalues: Parent4 (upval)
		local Tool = p5.Tool
		
		return Tool and (Tool:IsA("HopperBin") and Tool.Active or Tool.Parent == Parent4)
	end
	
	function config.Delete(p5) --[[ Line: 526 ]]
		-- upvalues: t2 (upval), Frame1 (ref), List (upval), UpdateScrollingFrameCanvasSize (upval)
		t2[Frame1] = nil
		Frame1:Destroy()
		table.remove(List, p5.Index)
		
		for i = p5.Index, #List do
			List[i]:SlideBack()
		end
		UpdateScrollingFrameCanvasSize()
	end
	
	function config.Swap(p6, GamepadSwapSlot) --[[ Line: 540 ]]
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
	
	function config.SlideBack(p6) --[[ Line: 554 ]]
		-- upvalues: Frame1 (ref)
		p6.Index -= 1
		Frame1.Name = p6.Index
		Frame1.LayoutOrder = p6.Index
	end
	
	function config:TurnNumber(Visible) --[[ Line: 560 ]]
		-- upvalues: TextLabel1 (ref)
		if TextLabel1 then
			TextLabel1.Visible = Visible
		end
	end
	
	function config.SetClickability(p6, p7) --[[ Line: 566 ]]
		-- upvalues: Frame1 (ref), ScaledPreferredTransparency1 (upval), _Color3_1 (upval), _Color3 (upval)
		if p6.Tool then
			Frame1.Draggable = not p7
			Frame1.SelectionImageObject = nil
			Frame1.BackgroundTransparency = if Frame1.Draggable then 0 else ScaledPreferredTransparency1
			Frame1.BackgroundColor3 = Frame1.Draggable and _Color3_1 or _Color3
		end
	end
	
	function config.CheckTerms(p6, List): number --[[ Line: 573 ]]
		-- upvalues: TextLabel (ref), Label (ref)
		local Total = 0
		
		local function _(Text: string, p7) --[[ Line: 575 | Named "checkEm" ]]
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
	
	function config:Select(p7) --[[ Line: 593 ]]
		-- upvalues: config (copy), Parent4 (upval), SAToolEquipLuauFlag (upval), LocalPlayer (upval), Humanoid (upval), HopperBin (upval), t (upval), Backpack (upval), EquipNewTool (upval)
		if p7 then return end
		local Tool = config.Tool
		
		if Tool then
			if Tool and (Tool:IsA("HopperBin") and Tool.Active or Tool.Parent == Parent4) then
				if (if SAToolEquipLuauFlag and game:GetEngineFeature("SAToolEquipEngineFeature") then workspace.AuthorityMode == Enum.AuthorityMode.Server else false) and not Tool:IsA("HopperBin") then
					LocalPlayer:RequestTool(nil)
				end
				if Humanoid then
					Humanoid:UnequipTools()
					
					if HopperBin then
						HopperBin:ToggleSelect()
						t[HopperBin]:UpdateEquipView()
						HopperBin = nil
						
						return
					end
				end
			elseif Tool.Parent == Backpack then
				EquipNewTool(Tool)
			end
		end
	end
	
	Frame1 = NewGui("TextButton", P14)
	Frame1.BackgroundColor3 = _Color3
	Frame1.BorderColor3 = _Color3_3
	Frame1.Text = ""
	Frame1.AutoButtonColor = false
	Frame1.BorderSizePixel = 0
	Frame1.Size = UDim2.new(0, XOffset, 0, XOffset)
	Frame1.Active = true
	Frame1.Draggable = false
	Frame1.BackgroundTransparency = ScaledPreferredTransparency1
	Frame1.MouseButton1Click:connect(function() --[[ Line: 623 ]]
		-- upvalues: config (copy)
		changeSlot(config)
	end)
	config.Frame = Frame1
	local Frame4 = NewGui("Frame", "SelectionObjectClipper")
	Frame4.Visible = false
	Frame4.Parent = Frame1
	local ImageLabel1 = NewGui("ImageLabel", "Selector")
	ImageLabel1.Size = UDim2.new(1, 0, 1, 0)
	ImageLabel1.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png"
	ImageLabel1.ScaleType = Enum.ScaleType.Slice
	ImageLabel1.SliceCenter = Rect.new(12, 12, 52, 52)
	ImageLabel1.Parent = Frame4
	ImageLabel = NewGui("ImageLabel", "Icon")
	ImageLabel.Size = UDim2.new(0.8, 0, 0.8, 0)
	ImageLabel.Position = UDim2.new(0.1, 0, 0.1, 0)
	ImageLabel.Parent = Frame1
	TextLabel = NewGui("TextLabel", "ToolName")
	TextLabel.Size = UDim2.new(1, -2, 1, -2)
	TextLabel.Position = UDim2.new(0, 1, 0, 1)
	TextLabel.Parent = Frame1
	config.Frame.LayoutOrder = config.Index
	
	if P14 <= NumberOfHotbarSlots then
		Label = NewGui("TextLabel", "ToolTip")
		Label.TextWrapped = false
		Label.TextYAlignment = Enum.TextYAlignment.Top
		Label.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
		Label.BackgroundTransparency = 0
		Label.Visible = false
		Label.Parent = Frame1
		Frame1.MouseEnter:connect(function() --[[ Line: 661 ]]
			-- upvalues: Label (ref)
			if Label.Text ~= "" then
				Label.Visible = true
			end
		end)
		Frame1.MouseLeave:connect(function() --[[ Line: 666 ]]
			-- upvalues: Label (ref)
			Label.Visible = false
		end)
		
		function config.MoveToInventory(p7) --[[ Line: 668 ]]
			-- upvalues: config (copy), NumberOfHotbarSlots (upval), MakeSlot (upval), Parent3 (upval), Parent4 (upval), Humanoid (upval), HopperBin (upval), t (upval), Flag3 (upval), Parent2 (upval)
			if config.Index <= NumberOfHotbarSlots then
				local Tool = config.Tool
				p7:Clear()
				local Slot = MakeSlot(Parent3)
				Slot:Fill(Tool)
				
				if Tool and (Tool:IsA("HopperBin") and Tool.Active or Tool.Parent == Parent4) and Humanoid then
					Humanoid:UnequipTools()
					
					if HopperBin then
						HopperBin:ToggleSelect()
						t[HopperBin]:UpdateEquipView()
						HopperBin = nil
					end
				end
				if Flag3 then
					Slot.Frame.Visible = false
					Slot.Parent = Parent2
				end
			end
		end
		
		if P14 < 10 or P14 == NumberOfHotbarSlots then
			local P14_1: number = P14 < 10 and P14 or 0
			TextLabel1 = NewGui("TextLabel", "Number")
			TextLabel1.Text = P14_1
			TextLabel1.Size = UDim2.new(0.15, 0, 0.15, 0)
			TextLabel1.Visible = false
			TextLabel1.Parent = Frame1
			
			t1[Value1 + P14_1] = function(p7) --[[ Line: 694 ]]
				-- upvalues: config (copy)
				config:Select(p7)
			end
		end
	end
	local Position = Frame1.Position
	local v9 = 0
	local Parent = nil
	Frame1.DragBegin:connect(function(InitialPosition) --[[ Line: 705 ]]
		-- upvalues: t2 (upval), Frame1 (ref), Position (ref), ImageLabel (ref), TextLabel (ref), TextLabel1 (ref), Frame3 (ref), Parent (ref), Parent3 (upval), Parent2 (upval), Frame2 (ref), NewGui (upval)
		t2[Frame1] = true
		Position = InitialPosition
		Frame1.BorderSizePixel = 2
		Frame1.ZIndex = 2
		ImageLabel.ZIndex = 2
		TextLabel.ZIndex = 2
		Frame1.Parent.ZIndex = 2
		
		if TextLabel1 then
			TextLabel1.ZIndex = 2
		end
		if Frame3 then
			Frame3.ZIndex = 2
			
			for _, child in pairs(Frame3:GetChildren()) do
				child.ZIndex = 2
			end
		end
		Parent = Frame1.Parent
		
		if Parent == Parent3 then
			local _ = Frame1.AbsolutePosition
			Frame1.Parent = Parent2
			Frame1.Position = UDim2.new(0, Frame1.AbsolutePosition.X - Parent2.AbsolutePosition.X, 0, Frame1.AbsolutePosition.Y - Parent2.AbsolutePosition.Y)
			Frame2 = NewGui("Frame", "FakeSlot")
			Frame2.LayoutOrder = Frame1.LayoutOrder
			Frame2.Size = Frame1.Size
			Frame2.BackgroundTransparency = 1
			Frame2.Parent = Parent3
		end
	end)
	Frame1.DragStopped:connect(function(X, Y) --[[ Line: 743 ]]
		-- upvalues: Frame2 (ref), Frame1 (ref), Position (ref), Parent (ref), ImageLabel (ref), TextLabel (ref), TextLabel1 (ref), Frame3 (ref), t2 (upval), config (copy), Parent2 (upval), NumberOfHotbarSlots (upval), v9 (ref), v3 (upval), Parent1 (upval), List (upval), Parent4 (upval), Humanoid (upval), HopperBin (upval), t (upval), Flag3 (upval)
		if Frame2 then
			Frame2:Destroy()
		end
		local CurrentTime = tick()
		Frame1.Position = Position
		Frame1.Parent = Parent
		Frame1.BorderSizePixel = 0
		Frame1.ZIndex = 1
		ImageLabel.ZIndex = 1
		TextLabel.ZIndex = 1
		Parent.ZIndex = 1
		
		if TextLabel1 then
			TextLabel1.ZIndex = 1
		end
		if Frame3 then
			Frame3.ZIndex = 1
			
			for _, child in pairs(Frame3:GetChildren()) do
				child.ZIndex = 1
			end
		end
		t2[Frame1] = nil
		
		if not config.Tool then return end
		local Frame = Parent2
		local AbsolutePosition = Frame.AbsolutePosition
		local AbsoluteSize = Frame.AbsoluteSize
		
		if AbsolutePosition.X < X and (X <= AbsolutePosition.X + AbsoluteSize.X and (AbsolutePosition.Y < Y and Y <= AbsolutePosition.Y + AbsoluteSize.Y)) then
			if config.Index <= NumberOfHotbarSlots then
				config:MoveToInventory()
			end
			if NumberOfHotbarSlots < config.Index and CurrentTime - v9 < 0.5 then
				if v3 then
					local Tool = config.Tool
					config:Clear()
					v3:Fill(Tool)
					config:Delete()
				end
				CurrentTime = 0
			end
		else
			local Frame1 = Parent1
			local AbsolutePosition1 = Frame1.AbsolutePosition
			local AbsoluteSize1 = Frame1.AbsoluteSize
			
			if AbsolutePosition1.X < X and (X <= AbsolutePosition1.X + AbsoluteSize1.X and (AbsolutePosition1.Y < Y and Y <= AbsolutePosition1.Y + AbsoluteSize1.Y)) then
				local list = { 1e999, nil }
				
				for i = 1, NumberOfHotbarSlots do
					local Entry = List[i]
					local Frame2 = Entry.Frame
					local Magnitude = (Frame2.AbsolutePosition + Frame2.AbsoluteSize / 2 - Vector2.new(X, Y)).magnitude
					
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
							if Tool and (Tool:IsA("HopperBin") and Tool.Active or Tool.Parent == Parent4) and Humanoid then
								Humanoid:UnequipTools()
								
								if HopperBin then
									HopperBin:ToggleSelect()
									t[HopperBin]:UpdateEquipView()
									HopperBin = nil
								end
							end
							if Flag3 then
								config.Frame.Visible = false
								config.Frame.Parent = Parent2
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
		v9 = CurrentTime
	end)
	Frame1.Parent = Frame
	List[P14] = config
	
	if NumberOfHotbarSlots < P14 then
		UpdateScrollingFrameCanvasSize()
		
		if Parent2.Visible and not Flag3 then
			ScrollingFrame.CanvasPosition = Vector2.new(0, (math.max(0, ScrollingFrame.CanvasSize.Y.Offset - ScrollingFrame.AbsoluteSize.Y)))
		end
	end
	return config
end

local _ = function(Value: number) --[[ Line: 852 | Named "SetNumberOfHotbarSlots" ]]
	-- upvalues: NumberOfHotbarSlots (ref), List (copy), MakeSlot (copy), Parent1 (ref), v3 (ref), Count (ref), UpdateBackpackLayout (copy)
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
					local Slot = MakeSlot(Parent1, i1)
					
					if Tool then
						Slot:Fill(Tool)
					elseif not v3 then
						v3 = Slot
					end
				else
					local Slot1 = MakeSlot(Parent1, i1)
					Slot1.Frame.Visible = false
					
					if not v3 then
						v3 = Slot1
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

local function OnChildAdded(Child: Tool) --[[ Line: 914 ]]
	-- upvalues: Parent4 (ref), Humanoid (ref), CurrentTime (ref), HopperBin (ref), t (copy), Flag1 (ref), LocalPlayer (ref), v3 (ref), MakeSlot (copy), Parent3 (ref), List (copy), Backpack (ref), AdjustHotbarFrames (copy), NumberOfHotbarSlots (ref), Parent2 (ref), BackpackScriptModule (copy)
	if Child:IsA("Tool") or Child:IsA("HopperBin") then
		if Child.Parent == Parent4 then
			CurrentTime = tick()
		end
		if HopperBin and Child.Parent == Parent4 then
			HopperBin:ToggleSelect()
			t[HopperBin]:UpdateEquipView()
			HopperBin = nil
		end
		if not Flag1 and Child.Parent == Parent4 and not t[Child] then
			local StarterGear = LocalPlayer:FindFirstChild("StarterGear")
			
			if StarterGear and StarterGear:FindFirstChild(Child.Name) then
				Flag1 = true
				local V82 = v3 or MakeSlot(Parent3)
				for i = V82.Index, 1, -1 do
					local Entry1 = List[i]
					local IDelta = i - 1
					
					if IDelta > 0 then
						List[IDelta]:Swap(Entry1)
					else
						Entry1:Fill(Child)
					end
				end
				for _, Tool in pairs(Parent4:GetChildren()) do
					if Tool:IsA("Tool") and Tool ~= Child then
						Tool.Parent = Backpack
					end
				end
				AdjustHotbarFrames()
				
				return
			end
		end
		local Entry = t[Child]
		
		if Entry then
			Entry:UpdateEquipView()
		else
			local V82 = v3 or MakeSlot(Parent3)
			V82:Fill(Child)
			
			if V82.Index <= NumberOfHotbarSlots and not Parent2.Visible then
				AdjustHotbarFrames()
			end
			if Child:IsA("HopperBin") and Child.Active then
				if Humanoid then
					Humanoid:UnequipTools()
					
					if HopperBin then
						HopperBin:ToggleSelect()
						t[HopperBin]:UpdateEquipView()
						HopperBin = nil
					end
				end
				HopperBin = Child
			end
		end
		BackpackScriptModule.BackpackItemAdded:Fire()
		
		return
	elseif Child:IsA("Humanoid") and Child.Parent == Parent4 then
		Humanoid = Child
	end
end

local function OnChildRemoved(Child) --[[ Line: 981 ]]
	-- upvalues: CurrentTime (ref), Parent4 (ref), Backpack (ref), t (copy), NumberOfHotbarSlots (ref), Parent2 (ref), AdjustHotbarFrames (copy), HopperBin (ref), BackpackScriptModule (copy), List (copy)
	if not Child:IsA("Tool") and not Child:IsA("HopperBin") then return end
	CurrentTime = tick()
	local Parent = Child.Parent
	
	if Parent == Parent4 or Parent == Backpack then return end
	local Entry = t[Child]
	
	if Entry then
		Entry:Clear()
		
		if NumberOfHotbarSlots < Entry.Index then
			Entry:Delete()
		elseif not Parent2.Visible then
			AdjustHotbarFrames()
		end
	end
	if Child == HopperBin then
		HopperBin = nil
	end
	BackpackScriptModule.BackpackItemRemoved:Fire()
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
		BackpackScriptModule.BackpackEmpty:Fire()
	end
end

local function OnCharacterAdded(Character) --[[ Line: 1015 ]]
	-- upvalues: List (copy), NumberOfHotbarSlots (ref), HopperBin (ref), List2 (ref), Parent4 (ref), OnChildRemoved (copy), OnChildAdded (copy), Backpack (ref), LocalPlayer (ref), AdjustHotbarFrames (copy)
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
	Parent4 = Character
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

local function OnInputBegan(Input, GameProcessed) --[[ Line: 1054 ]]
	-- upvalues: Flag2 (ref), v4 (ref), Value2 (copy), t1 (copy), Parent2 (ref), BackpackScriptModule (copy)
	if Input.UserInputType == Enum.UserInputType.Keyboard and not Flag2 and (v4 or Input.KeyCode.Value == Value2) then
		local Entry: (any) -> () = t1[Input.KeyCode.Value]
		
		if Entry then
			Entry(GameProcessed)
		end
	end
	local UserInputType = Input.UserInputType
	
	if not GameProcessed and (UserInputType == Enum.UserInputType.MouseButton1 or UserInputType == Enum.UserInputType.Touch) and Parent2.Visible then
		BackpackScriptModule.OpenClose()
	end
end

local function OnUISChanged(Property) --[[ Line: 1073 ]]
	-- upvalues: UserInputService (copy), VRService (copy), NumberOfHotbarSlots (ref), List (copy)
	if Property == "KeyboardEnabled" or Property == "VREnabled" then
		local NoVREnabled: boolean = UserInputService.KeyboardEnabled and not VRService.VREnabled
		for i = 1, NumberOfHotbarSlots do
			List[i]:TurnNumber(NoVREnabled)
		end
	end
end

local Input = nil
local CurrentTime1 = nil

local function v122() --[[ Line: 1085 ]] end

local _Vector2 = Vector2.new(0, 0)

function unbindAllGamepadEquipActions() --[[ Line: 1089 ]]
	-- upvalues: ContextActionService (copy)
	ContextActionService:UnbindAction("RBXBackpackHasGamepadFocus")
	ContextActionService:UnbindAction("RBXCloseInventory")
end

local _ = function(Visible, p7) --[[ Line: 1094 | Named "setHotbarVisibility" ]]
	-- upvalues: NumberOfHotbarSlots (ref), List (copy)
	for i = 1, NumberOfHotbarSlots do
		local Entry = List[i]
		
		if Entry and Entry.Frame and (p7 or Entry.Tool) then
			Entry.Frame.Visible = Visible
		end
	end
end

local function getInputDirection(Input): Vector2 --[[ Line: 1103 ]]
	-- upvalues: _Vector2 (ref)
	local v10: number = if Input.UserInputState == Enum.UserInputState.End then -1 else 1
	
	if Input.KeyCode == Enum.KeyCode.Thumbstick1 then
		local Magnitude: number = Input.Position.magnitude
		_Vector2 = if Magnitude > 0.98 then Vector2.new(Input.Position.x / Magnitude, -Input.Position.y / Magnitude) else Vector2.new(0, 0)
	elseif Input.KeyCode == Enum.KeyCode.DPadLeft then
		_Vector2 = Vector2.new(_Vector2.x - v10 * 1, _Vector2.y)
	elseif Input.KeyCode == Enum.KeyCode.DPadRight then
		_Vector2 = Vector2.new(_Vector2.x + v10 * 1, _Vector2.y)
	elseif Input.KeyCode == Enum.KeyCode.DPadUp then
		_Vector2 = Vector2.new(_Vector2.x, _Vector2.y - v10 * 1)
	elseif Input.KeyCode == Enum.KeyCode.DPadDown then
		_Vector2 = Vector2.new(_Vector2.x, _Vector2.y + v10 * 1)
	else
		_Vector2 = Vector2.new(0, 0)
	end
	return _Vector2
end

local _ = function(_, _, Input) --[[ Line: 1134 ]]
	-- upvalues: getInputDirection (copy), NumberOfHotbarSlots (ref), List (copy), Humanoid (ref), HopperBin (ref), t (copy)
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
	elseif Humanoid then
		Humanoid:UnequipTools()
		
		if HopperBin then
			HopperBin:ToggleSelect()
			t[HopperBin]:UpdateEquipView()
			HopperBin = nil
		end
	end
end

function changeToolFunc(_, UserInputState, Input1) --[[ Line: 1164 ]]
	-- upvalues: Input (ref), CurrentTime1 (ref), Humanoid (ref), HopperBin (ref), t (copy), NumberOfHotbarSlots (ref), List (copy), v6 (ref)
	if UserInputState ~= Enum.UserInputState.Begin then return end
	if not Input or (Input.KeyCode ~= Enum.KeyCode.ButtonR1 or Input1.KeyCode ~= Enum.KeyCode.ButtonL1) and (Input.KeyCode ~= Enum.KeyCode.ButtonL1 or Input1.KeyCode ~= Enum.KeyCode.ButtonR1) or tick() - CurrentTime1 > 0.06 then
		Input = Input1
		CurrentTime1 = tick()
		delay(0.06, function() --[[ Line: 1184 ]]
			-- upvalues: Input (upval), Input1 (copy), NumberOfHotbarSlots (upval), List (upval), Humanoid (upval), HopperBin (upval), t (upval), v6 (upval)
			if Input ~= Input1 then return end
			local Amount: number = if Input1.KeyCode == Enum.KeyCode.ButtonL1 then -1 else 1
			for i = 1, NumberOfHotbarSlots do
				if not List[i]:IsEquipped() then
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
				if Humanoid then
					Humanoid:UnequipTools()
					
					if HopperBin then
						HopperBin:ToggleSelect()
						t[HopperBin]:UpdateEquipView()
						HopperBin = nil
					end
				end
				v6 = nil
				
				return
			end
			if v6 and v6.Tool then
				v6:Select()
				
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
	if Humanoid then
		Humanoid:UnequipTools()
		
		if HopperBin then
			HopperBin:ToggleSelect()
			t[HopperBin]:UpdateEquipView()
			HopperBin = nil
		end
	end
	Input = Input1
	CurrentTime1 = tick()
end

function getGamepadSwapSlot() --[[ Line: 1248 ]]
	-- upvalues: List (copy)
	for i = 1, #List do
		if List[i].Frame.BorderSizePixel > 0 then
			return List[i]
		end
	end
end

function changeSlot(GamepadSwapSlot) --[[ Line: 1256 ]]
	-- upvalues: GamepadService (copy), GuiService (copy), v2 (ref), NumberOfHotbarSlots (ref)
	local GamepadCursorEnabled = GamepadService.GamepadCursorEnabled
	
	if GamepadSwapSlot.Frame == GuiService.SelectedCoreObject and not GamepadCursorEnabled then
		local GamepadSwapSlot1 = getGamepadSwapSlot()
		
		if not GamepadSwapSlot1 then
			local Size = GamepadSwapSlot.Frame.Size
			local Position = GamepadSwapSlot.Frame.Position
			GamepadSwapSlot.Frame:TweenSizeAndPositionInternal(Size + UDim2.new(0, 10, 0, 10), Position - UDim2.new(0, 5, 0, 5), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, function() --[[ Line: 1285 ]]
				-- upvalues: GamepadSwapSlot (copy), Size (copy), Position (copy)
				GamepadSwapSlot.Frame:TweenSizeAndPositionInternal(Size, Position, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true)
			end)
			GamepadSwapSlot.Frame.BorderSizePixel = 3
			v2.SelectionImageObject.Visible = true
			
			return
		end
		GamepadSwapSlot1.Frame.BorderSizePixel = 0
		
		if GamepadSwapSlot1 ~= GamepadSwapSlot then
			GamepadSwapSlot:Swap(GamepadSwapSlot1)
			v2.SelectionImageObject.Visible = false
			
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
		GamepadSwapSlot:Select()
		v2.SelectionImageObject.Visible = false
	end
end

function enableGamepadInventoryControl() --[[ Line: 1295 ]]
	-- upvalues: Parent2 (ref), BackpackScriptModule (copy), ContextActionService (copy), v122 (copy), GuiService (copy), Parent1 (ref)
	local function v245(_, InputState, _) --[[ Line: 1296 ]]
		-- upvalues: Parent2 (upval), BackpackScriptModule (upval)
		if InputState ~= Enum.UserInputState.Begin then return end
		if getGamepadSwapSlot() then
			local GamepadSwapSlot = getGamepadSwapSlot()
			
			if GamepadSwapSlot then
				GamepadSwapSlot.Frame.BorderSizePixel = 0
				
				return
			end
		elseif Parent2.Visible then
			BackpackScriptModule.OpenClose()
		end
	end
	
	ContextActionService:BindAction("RBXBackpackHasGamepadFocus", v122, false, Enum.UserInputType.Gamepad1)
	ContextActionService:BindAction("RBXCloseInventory", v245, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart)
	GuiService.SelectedCoreObject = Parent1:FindFirstChild("1")
end

function disableGamepadInventoryControl() --[[ Line: 1321 ]]
	-- upvalues: NumberOfHotbarSlots (ref), List (copy), GuiService (copy), Parent (ref)
	unbindAllGamepadEquipActions()
	
	for i = 1, NumberOfHotbarSlots do
		local Entry = List[i]
		
		if Entry and Entry.Frame then
			Entry.Frame.BorderSizePixel = 0
		end
	end
	if GuiService.SelectedCoreObject and GuiService.SelectedCoreObject:IsDescendantOf(Parent) then
		GuiService.SelectedCoreObject = nil
	end
end

local _ = function() --[[ Line: 1337 | Named "bindBackpackHotbarAction" ]]
	-- upvalues: v4 (ref), Flag (ref), ContextActionService (copy)
	if v4 and not Flag then
		Flag = true
		ContextActionService:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
	end
end

local _ = function() --[[ Line: 1344 | Named "unbindBackpackHotbarAction" ]]
	-- upvalues: Flag (ref), ContextActionService (copy)
	disableGamepadInventoryControl()
	Flag = false
	ContextActionService:UnbindAction("RBXHotbarEquip")
end

function gamepadDisconnected() --[[ Line: 1350 ]]
	-- upvalues: VRService (copy), Flag4 (ref)
	if not VRService.VREnabled then
		Flag4 = false
		disableGamepadInventoryControl()
	end
end

function gamepadConnected() --[[ Line: 1357 ]]
	-- upvalues: VRService (copy), Flag4 (ref), FFlagStudioDeviceSimVRSwitchFixes (copy), GuiService (copy), Parent (ref), Count (ref), v4 (ref), Flag (ref), ContextActionService (copy), Parent2 (ref)
	if not VRService.VREnabled then
		Flag4 = true
		
		if FFlagStudioDeviceSimVRSwitchFixes then
			GuiService:RemoveSelectionGroup("RBXBackpackSelection")
		end
		GuiService:AddSelectionParent("RBXBackpackSelection", Parent)
		
		if Count >= 1 and v4 and not Flag then
			Flag = true
			ContextActionService:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
		end
		if Parent2.Visible then
			enableGamepadInventoryControl()
		end
	end
end

local function OnCoreGuiChanged(CoreGuiType, Enabled) --[[ Line: 1375 ]]
	-- upvalues: v1 (ref), v4 (ref), FFlagMountCoreGuiBackpackModule (copy), Parent (ref), RobloxGui (copy), List1 (copy), GuiService (copy), Count (ref), Flag (ref), ContextActionService (copy)
	if CoreGuiType == Enum.CoreGuiType.Backpack or CoreGuiType == Enum.CoreGuiType.All then
		local V44 = Enabled and v1
		v4 = V44
		
		if FFlagMountCoreGuiBackpackModule then
			if V44 then
				Parent.Parent = RobloxGui
			else
				Parent.Parent = nil
			end
		else
			Parent.Visible = V44
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
		elseif Count >= 1 and v4 and not Flag then
			Flag = true
			ContextActionService:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
			
			return
		end
	end
end

local function MakeVRRoundButton(Name, Image) --[[ Line: 1410 ]]
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

Parent = NewGui("Frame", "Backpack")

if FFlagMountCoreGuiBackpackModule then
	if StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack) then
		Parent.Parent = RobloxGui
	end
else
	Parent.Visible = false
	Parent.Parent = RobloxGui
end
Parent1 = NewGui("Frame", "Hotbar")
Parent1.Parent = Parent

for i = 1, NumberOfHotbarSlots do
	local v10 = MakeSlot(Parent1, i)
	v10.Frame.Visible = false
	
	if not v3 then
		v3 = v10
	end
end
ImageButton = NewGui("ImageButton", "OpenInventory")
ImageButton.Size = UDim2.new(0, 30, 0, 30)
ImageButton.Image = "rbxasset://textures/ui/Backpack/ScrollUpArrow.png"
ImageButton.MouseButton1Click:connect(function() --[[ Line: 1462 ]]
	-- upvalues: BackpackScriptModule (copy)
	BackpackScriptModule.OpenClose()
end)
ImageButton.SelectionGained:connect(function() --[[ Line: 1465 ]]
	-- upvalues: ImageButton (ref), _Color3_4 (copy)
	ImageButton.ImageColor3 = _Color3_4
end)
ImageButton.SelectionLost:connect(function() --[[ Line: 1468 ]]
	-- upvalues: ImageButton (ref)
	ImageButton.ImageColor3 = Color3.new(1, 1, 1)
end)
local Frame = NewGui("Frame", "Selection")
Frame.Visible = false
ImageButton.SelectionImageObject = Frame
local CloseInventory = MakeVRRoundButton("CloseInventory", "rbxasset://textures/ui/Keyboard/close_button_icon.png")
CloseInventory.Position = UDim2.new(0, 0, 0, -50)
CloseInventory.MouseButton1Click:connect(function() --[[ Line: 1478 ]]
	-- upvalues: Parent2 (ref), BackpackScriptModule (copy)
	if Parent2.Visible then
		BackpackScriptModule.OpenClose()
	end
end)
LeftBumperButton = NewGui("ImageLabel", "LeftBumper")
LeftBumperButton.Size = UDim2.new(0, 40, 0, 40)
LeftBumperButton.Position = UDim2.new(0, -LeftBumperButton.Size.X.Offset, 0.5, -LeftBumperButton.Size.Y.Offset / 2)
RightBumperButton = NewGui("ImageLabel", "RightBumper")
RightBumperButton.Size = UDim2.new(0, 40, 0, 40)
RightBumperButton.Position = UDim2.new(1, 0, 0.5, -RightBumperButton.Size.Y.Offset / 2)
Parent2 = NewGui("Frame", "Inventory")
Parent2.BackgroundTransparency = ScaledPreferredTransparency
Parent2.BackgroundColor3 = _Color3
Parent2.Active = true
Parent2.Visible = false
Parent2.Parent = Parent
v2 = NewGui("TextButton", "VRInventorySelector")
v2.Position = UDim2.new(0, 0, 0, 0)
v2.Size = UDim2.new(1, 0, 1, 0)
v2.BackgroundTransparency = 1
v2.Text = ""
v2.Parent = Parent2
local ImageLabel = NewGui("ImageLabel", "Selector")
ImageLabel.Size = UDim2.new(1, 0, 1, 0)
ImageLabel.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png"
ImageLabel.ScaleType = Enum.ScaleType.Slice
ImageLabel.SliceCenter = Rect.new(12, 12, 52, 52)
ImageLabel.Visible = false
v2.SelectionImageObject = ImageLabel
ScrollingFrame = NewGui("ScrollingFrame", "ScrollingFrame")
ScrollingFrame.Selectable = false
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.Parent = Parent2
Parent3 = NewGui("Frame", "UIGridFrame")
Parent3.Selectable = false
Parent3.Size = UDim2.new(1, -10, 1, 0)
Parent3.Position = UDim2.new(0, 5, 0, 0)
Parent3.Parent = ScrollingFrame
local GridLayout = Instance.new("UIGridLayout")
GridLayout.SortOrder = Enum.SortOrder.LayoutOrder
GridLayout.CellSize = UDim2.new(0, XOffset, 0, XOffset)
GridLayout.CellPadding = UDim2.new(0, 5, 0, 5)
GridLayout.Parent = Parent3
ScrollUpButton = MakeVRRoundButton("ScrollUpButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png")
ScrollUpButton.Size = UDim2.new(0, 34, 0, 34)
ScrollUpButton.Position = UDim2.new(0.5, -ScrollUpButton.Size.X.Offset / 2, 0, 43)
ScrollUpButton.Icon.Position -= UDim2.new(0, 0, 0, 2)
ScrollUpButton.MouseButton1Click:connect(function() --[[ Line: 1537 ]]
	-- upvalues: ScrollingFrame (ref), XOffset (ref)
	ScrollingFrame.CanvasPosition = Vector2.new(ScrollingFrame.CanvasPosition.X, (math.min(ScrollingFrame.CanvasSize.Y.Offset - ScrollingFrame.AbsoluteWindowSize.Y, (math.max(0, ScrollingFrame.CanvasPosition.Y - (XOffset + 5))))))
end)
ScrollDownButton = MakeVRRoundButton("ScrollDownButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png")
ScrollDownButton.Rotation = 180
ScrollDownButton.Icon.Position -= UDim2.new(0, 0, 0, 2)
ScrollDownButton.Size = UDim2.new(0, 34, 0, 34)
ScrollDownButton.Position = UDim2.new(0.5, -ScrollDownButton.Size.X.Offset / 2, 1, -ScrollDownButton.Size.Y.Offset - 3)
ScrollDownButton.MouseButton1Click:connect(function() --[[ Line: 1548 ]]
	-- upvalues: ScrollingFrame (ref), XOffset (ref)
	ScrollingFrame.CanvasPosition = Vector2.new(ScrollingFrame.CanvasPosition.X, (math.min(ScrollingFrame.CanvasSize.Y.Offset - ScrollingFrame.AbsoluteWindowSize.Y, (math.max(0, ScrollingFrame.CanvasPosition.Y + (XOffset + 5))))))
end)
ScrollingFrame.Changed:connect(function(p8) --[[ Line: 1554 ]]
	-- upvalues: ScrollingFrame (ref), ScrollUpButton (ref), ScrollDownButton (ref)
	if p8 == "AbsoluteWindowSize" or p8 == "CanvasPosition" or p8 == "CanvasSize" then
		local IsYBelow = ScrollingFrame.CanvasPosition.Y < ScrollingFrame.CanvasSize.Y.Offset - ScrollingFrame.AbsoluteWindowSize.Y
		ScrollUpButton.Visible = ScrollingFrame.CanvasPosition.Y ~= 0
		ScrollDownButton.Visible = IsYBelow
	end
end)
UpdateBackpackLayout()
local Frame2 = CreateFunction("Frame")({
	Name = "GamepadHintsFrame",
	BackgroundTransparency = 1,
	Visible = false,
	Size = UDim2.new(0, Parent1.Size.X.Offset, 0, if IsEnabled then 95 else 60),
	Parent = Parent
})

local function addGamepadHint(p8, p9, Text) --[[ Line: 1577 ]]
	-- upvalues: CreateFunction (copy), Frame2 (copy), IsEnabled (copy)
	local Parent = CreateFunction("Frame")({
		Name = "HintFrame",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, -5),
		Position = UDim2.new(0, 0, 0, 0),
		Parent = Frame2
	})
	local _ = CreateFunction("ImageLabel")({
		Name = "HintImage",
		BackgroundTransparency = 1,
		Size = IsEnabled and UDim2.new(0, 90, 0, 90) or UDim2.new(0, 60, 0, 60),
		Image = IsEnabled and p9 or p8,
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
	Instance.new("UITextSizeConstraint", Label).MaxTextSize = Label.TextSize
end

local function resizeGamepadHintsFrame() --[[ Line: 1614 ]]
	-- upvalues: Frame2 (copy), Parent1 (ref), IsEnabled (copy), Parent2 (ref)
	Frame2.Size = UDim2.new(Parent1.Size.X.Scale, Parent1.Size.X.Offset, 0, if IsEnabled then 95 else 60)
	Frame2.Position = UDim2.new(Parent1.Position.X.Scale, Parent1.Position.X.Offset, Parent2.Position.Y.Scale, Parent2.Position.Y.Offset - Frame2.Size.Y.Offset)
	local NewOffset = 0
	local Children = Frame2:GetChildren()
	
	for i = 1, #Children do
		Children[i].Size = UDim2.new(1, 0, 1, -5)
		Children[i].Position = UDim2.new(0, 0, 0, 0)
		NewOffset += Children[i].HintText.Position.X.Offset + Children[i].HintText.TextBounds.X
	end
	local XRatio = (Frame2.AbsoluteSize.X - NewOffset) / (#Children - 1)
	
	for i1 = 1, #Children do
		Children[i1].Position = i1 == 1 and UDim2.new(0, 0, 0, 0) or UDim2.new(0, Children[i1 - 1].Position.X.Offset + Children[i1 - 1].Size.X.Offset + XRatio, 0, 0)
		Children[i1].Size = UDim2.new(0, Children[i1].HintText.Position.X.Offset + Children[i1].HintText.TextBounds.X, 1, -5)
	end
end

addGamepadHint("rbxasset://textures/ui/Controls/DesignSystem/ButtonX.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonX@2x.png", "Remove From Hotbar")
addGamepadHint("rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonA@2x.png", "Select/Swap")
addGamepadHint("rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonB@2x.png", "Close Backpack")
local Frame3 = NewGui("Frame", "Search")
Frame3.BackgroundColor3 = _Color3_5
Frame3.BackgroundTransparency = ScaledPreferredTransparency2
Frame3.Size = UDim2.new(0, 190, 0, 30)
Frame3.Position = UDim2.new(1, -Frame3.Size.X.Offset - 5, 0, 5)
Frame3.Parent = Parent2
local TextBox = NewGui("TextBox", "TextBox")
TextBox.Text = InGameUnknownNamespaceBACKPACKSEARCH
TextBox.ClearTextOnFocus = false
TextBox.FontSize = Enum.FontSize.Size24
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.Size = Frame3.Size - UDim2.new(0, 0, 0, 0)
TextBox.Position = UDim2.new(0, 0, 0, 0)
TextBox.Parent = Frame3
local TextButton = NewGui("TextButton", "X")
TextButton.Text = "x"
TextButton.TextColor3 = _Color3_2
TextButton.FontSize = Enum.FontSize.Size24
TextButton.TextYAlignment = Enum.TextYAlignment.Bottom
TextButton.BackgroundColor3 = _Color3_5
TextButton.BackgroundTransparency = 0
TextButton.Size = UDim2.new(0, Frame3.Size.Y.Offset - 10, 0, Frame3.Size.Y.Offset - 10)
TextButton.Position = UDim2.new(1, -TextButton.Size.X.Offset - 10, 0.5, -TextButton.Size.Y.Offset / 2)
TextButton.ZIndex = 0
TextButton.Visible = false
TextButton.BorderSizePixel = 0
TextButton.Parent = Frame3

local function search() --[[ Line: 1671 ]]
	-- upvalues: TextBox (copy), NumberOfHotbarSlots (ref), List (copy), Parent2 (ref), Flag3 (ref), Parent3 (ref), ScrollingFrame (ref), UpdateScrollingFrameCanvasSize (copy), TextButton (copy)
	local t = {}
	
	for Text in TextBox.Text:gmatch("%S+") do
		t[Text:lower()] = true
	end
	local List1 = {}
	
	for i = NumberOfHotbarSlots + 1, #List do
		local Entry = List[i]
		table.insert(List1, { Entry, (Entry:CheckTerms(t)) })
		Entry.Frame.Visible = false
		Entry.Frame.Parent = Parent2
	end
	table.sort(List1, function(Entry1, Entry): boolean --[[ Line: 1686 ]]
		return Entry[2] < Entry1[2]
	end)
	Flag3 = true
	local Count = 0
	
	for _, value in ipairs(List1) do
		local v11 = value[1]
		
		if value[2] > 0 then
			v11.Frame.Visible = true
			v11.Frame.Parent = Parent3
			v11.Frame.LayoutOrder = NumberOfHotbarSlots + Count
			Count += 1
		end
	end
	ScrollingFrame.CanvasPosition = Vector2.new(0, 0)
	UpdateScrollingFrameCanvasSize()
	TextButton.ZIndex = 3
end

local function clearResults() --[[ Line: 1708 ]]
	-- upvalues: TextButton (copy), Flag3 (ref), NumberOfHotbarSlots (ref), List (copy), Parent3 (ref), UpdateScrollingFrameCanvasSize (copy)
	if TextButton.ZIndex > 0 then
		Flag3 = false
		
		for i = NumberOfHotbarSlots + 1, #List do
			local Entry = List[i]
			Entry.Frame.LayoutOrder = Entry.Index
			Entry.Frame.Parent = Parent3
			Entry.Frame.Visible = true
		end
		TextButton.ZIndex = 0
	end
	UpdateScrollingFrameCanvasSize()
end

local function reset() --[[ Line: 1722 ]]
	-- upvalues: clearResults (copy), TextBox (copy), InGameUnknownNamespaceBACKPACKSEARCH (ref)
	clearResults()
	TextBox.Text = InGameUnknownNamespaceBACKPACKSEARCH
end

local function onChanged(p8) --[[ Line: 1727 ]]
	-- upvalues: TextBox (copy), clearResults (copy), InGameUnknownNamespaceBACKPACKSEARCH (ref), search (copy), TextButton (copy)
	if p8 == "Text" then
		local Text = TextBox.Text
		
		if Text == "" then
			clearResults()
		elseif Text ~= InGameUnknownNamespaceBACKPACKSEARCH then
			search()
		end
		TextButton.Visible = Text ~= "" and Text ~= InGameUnknownNamespaceBACKPACKSEARCH
	end
end

local function focusLost(EnterPressed) --[[ Line: 1745 ]]
	-- upvalues: search (copy), TextBox (copy), InGameUnknownNamespaceBACKPACKSEARCH (ref)
	if EnterPressed then
		search()
		
		return
	end
	if TextBox.Text == "" then
		TextBox.Text = InGameUnknownNamespaceBACKPACKSEARCH
	end
end

TextBox.Focused:connect(function() --[[ Line: 1739 | Named "onFocused" ]]
	-- upvalues: TextBox (copy), InGameUnknownNamespaceBACKPACKSEARCH (ref)
	if TextBox.Text == InGameUnknownNamespaceBACKPACKSEARCH then
		TextBox.Text = ""
	end
end)
TextButton.MouseButton1Click:connect(reset)
TextBox.Changed:connect(onChanged)
TextBox.FocusLost:connect(focusLost)
BackpackScriptModule.StateChanged.Event:connect(function(Modal) --[[ Line: 1759 ]]
	-- upvalues: TextButton (copy), clearResults (copy), TextBox (copy), InGameUnknownNamespaceBACKPACKSEARCH (ref)
	TextButton.Modal = Modal
	
	if not Modal then
		clearResults()
		TextBox.Text = InGameUnknownNamespaceBACKPACKSEARCH
	end
end)

t1[Enum.KeyCode.Escape.Value] = function(p8) --[[ Line: 1766 ]]
	-- upvalues: clearResults (copy), TextBox (copy), InGameUnknownNamespaceBACKPACKSEARCH (ref), Parent2 (ref), BackpackScriptModule (copy)
	if p8 then
		clearResults()
		TextBox.Text = InGameUnknownNamespaceBACKPACKSEARCH
		
		return
	end
	if Parent2.Visible then
		BackpackScriptModule.OpenClose()
	end
end

UserInputService.LastInputTypeChanged:connect(function(LastInputType) --[[ Line: 1774 | Named "detectGamepad" ]]
	-- upvalues: VRService (copy), Frame3 (copy)
	if LastInputType == Enum.UserInputType.Gamepad1 and not VRService.VREnabled then
		Frame3.Visible = false
		
		return
	else
		Frame3.Visible = true
	end
end)

local function v69(_, InputState, _) --[[ Line: 1785 ]]
	-- upvalues: GuiService (copy), NumberOfHotbarSlots (ref), List (copy)
	if InputState ~= Enum.UserInputState.Begin then return end
	if not GuiService.SelectedCoreObject then return end
	for i = 1, NumberOfHotbarSlots do
		if List[i].Frame == GuiService.SelectedCoreObject and List[i].Tool then
			List[i]:MoveToInventory()
			break
		end
	end
end

local function openClose() --[[ Line: 1797 ]]
	-- upvalues: t2 (copy), Parent2 (ref), AdjustHotbarFrames (copy), Parent1 (ref), NumberOfHotbarSlots (ref), List (copy), Flag4 (ref), config (copy), UserInputService (copy), resizeGamepadHintsFrame (copy), Frame2 (copy), ContextActionService (copy), v69 (copy), BackpackScriptModule (copy)
	if not next(t2) then
		Parent2.Visible = not Parent2.Visible
		local Visible = Parent2.Visible
		AdjustHotbarFrames()
		Parent1.Active = not Parent1.Active
		
		for i = 1, NumberOfHotbarSlots do
			List[i]:SetClickability(not Visible)
		end
	end
	if Parent2.Visible then
		if Flag4 then
			if config[UserInputService:GetLastInputType()] then
				resizeGamepadHintsFrame()
				Frame2.Visible = true
			end
			enableGamepadInventoryControl()
		end
	else
		if Flag4 then
			Frame2.Visible = false
		end
		disableGamepadInventoryControl()
	end
	if Parent2.Visible then
		ContextActionService:BindAction("RBXRemoveSlot", v69, false, Enum.KeyCode.ButtonX)
	else
		ContextActionService:UnbindAction("RBXRemoveSlot")
	end
	BackpackScriptModule.IsOpen = Parent2.Visible
	BackpackScriptModule.StateChanged:Fire(Parent2.Visible)
end

t1[Value] = function() --[[ Line: 1833 ]]
	-- upvalues: GuiService (copy), openClose (copy)
	if not GuiService.MenuIsOpen then
		openClose()
		
		return
	end
end

BackpackScriptModule.OpenClose = openClose
while not LocalPlayer do
	wait()
	LocalPlayer = Players.LocalPlayer
end
LocalPlayer.CharacterAdded:connect(OnCharacterAdded)

if LocalPlayer.Character then
	OnCharacterAdded(LocalPlayer.Character)
end
for i2 = 0, 9 do
	table.insert(List1, (tostring(i2)))
end
table.insert(List1, "`")
UserInputService.InputBegan:connect(OnInputBegan)
UserInputService.TextBoxFocused:connect(function() --[[ Line: 1868 ]]
	-- upvalues: Flag2 (ref)
	Flag2 = true
end)
UserInputService.TextBoxFocusReleased:connect(function() --[[ Line: 1869 ]]
	-- upvalues: Flag2 (ref)
	Flag2 = false
end)

t1[Value2] = function() --[[ Line: 1872 ]]
	-- upvalues: HopperBin (ref), Humanoid (ref), t (copy)
	if HopperBin and Humanoid then
		Humanoid:UnequipTools()
		
		if HopperBin then
			HopperBin:ToggleSelect()
			t[HopperBin]:UpdateEquipView()
			HopperBin = nil
		end
	end
end

UserInputService.Changed:connect(OnUISChanged)
local NoVREnabled: boolean = UserInputService.KeyboardEnabled and not VRService.VREnabled
for i1 = 1, NumberOfHotbarSlots do
	List[i1]:TurnNumber(NoVREnabled)
end
if UserInputService:GetGamepadConnected(Enum.UserInputType.Gamepad1) then
	gamepadConnected()
end
UserInputService.GamepadConnected:connect(function(GamepadNum) --[[ Line: 1886 ]]
	if GamepadNum == Enum.UserInputType.Gamepad1 then
		gamepadConnected()
	end
end)
UserInputService.GamepadDisconnected:connect(function(GamepadNum) --[[ Line: 1891 ]]
	if GamepadNum == Enum.UserInputType.Gamepad1 then
		gamepadDisconnected()
	end
end)

function BackpackScriptModule:TopbarEnabledChanged(TopBarCoreGuiEnabled) --[[ Line: 1898 ]]
	-- upvalues: v1 (ref), OnCoreGuiChanged (copy), StarterGui (copy)
	v1 = TopBarCoreGuiEnabled
	OnCoreGuiChanged(Enum.CoreGuiType.Backpack, StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack))
end

if FFlagTopBarSignalizeSetCores then
	BackpackScriptModule.disposeEffect = SignalsModule.createEffect(function(p8) --[[ Line: 1905 ]]
		-- upvalues: InExperienceTopBarModule (copy), BackpackScriptModule (copy)
		local GetTopBarStoreFunction = InExperienceTopBarModule.Stores.GetTopBarStore
		
		if GetTopBarStoreFunction then
			BackpackScriptModule:TopbarEnabledChanged(GetTopBarStoreFunction(p8).getTopBarCoreGuiEnabled(p8))
		end
	end)
end
StarterGui.CoreGuiChangedSignal:connect(OnCoreGuiChanged)
local Backpack1 = Enum.CoreGuiType.Backpack
local Health = Enum.CoreGuiType.Health
OnCoreGuiChanged(Backpack1, StarterGui:GetCoreGuiEnabled(Backpack1))
OnCoreGuiChanged(Health, StarterGui:GetCoreGuiEnabled(Health))

if EnableHotbarHide then
	SettingsShowSignal:connect(function(p8) --[[ Line: 1920 ]]
		-- upvalues: BackpackScriptModule (copy), AdjustHotbarFrames (copy)
		if not p8 then
			AdjustHotbarFrames(false)
		elseif BackpackScriptModule.IsHotbarVisible then
			AdjustHotbarFrames(true)
			
			return
		end
	end)
end
GuiService.MenuOpened:Connect(function() --[[ Line: 1931 ]]
	-- upvalues: BackpackScriptModule (copy), IsInExperienceUIVREnabled (copy), InExperienceUIVRIXP (copy), VRService (copy)
	if BackpackScriptModule.IsOpen and (not IsInExperienceUIVREnabled or InExperienceUIVRIXP:isMovePanelToCenter() or not VRService.VREnabled) then
		BackpackScriptModule.OpenClose()
	end
end)
InExperienceAppChatModalModule.default.visibilitySignal.Event:Connect(function(p8) --[[ Line: 1940 ]]
	-- upvalues: BackpackScriptModule (copy)
	if p8 and BackpackScriptModule.IsOpen then
		BackpackScriptModule.OpenClose()
	end
end)
UserGameSettings:GetPropertyChangedSignal("PreferredTransparency"):connect(function() --[[ Line: 1946 | Named "OnPreferredTransparencyChanged" ]]
	-- upvalues: UserGameSettings (copy), ScaledPreferredTransparency (ref), Parent2 (ref), ScaledPreferredTransparency1 (ref), List (copy), ScaledPreferredTransparency2 (ref), Frame3 (copy)
	ScaledPreferredTransparency = 0.5 * UserGameSettings.PreferredTransparency
	Parent2.BackgroundTransparency = ScaledPreferredTransparency
	ScaledPreferredTransparency1 = 0.5 * UserGameSettings.PreferredTransparency
	
	for _, value in ipairs(List) do
		value.Frame.BackgroundTransparency = ScaledPreferredTransparency1
	end
	ScaledPreferredTransparency2 = 0.15 * UserGameSettings.PreferredTransparency
	Frame3.BackgroundTransparency = ScaledPreferredTransparency2
end)

return BackpackScriptModule