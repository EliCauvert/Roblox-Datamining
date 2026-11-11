local t = {}
local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")
local TextService = game:GetService("TextService")
local GuiService = game:GetService("GuiService")
local PromptCreatorTransientDialog = game:DefineFastFlag("PromptCreatorTransientDialog", false)
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local Modules = RobloxGui:WaitForChild("Modules")
local TenFootInterfaceModule = require(Modules:WaitForChild("TenFootInterface"))
local DialogModule = require(Modules:WaitForChild("VR"):WaitForChild("Dialog"))
local NewResult = nil
local PromptDialog = nil
local ContainerFrame = nil

function getViewportSize()
	while not game.Workspace.CurrentCamera do
		game.Workspace.Changed:Wait()
	end
	assert(game.Workspace.CurrentCamera, "")
	while game.Workspace.CurrentCamera.ViewportSize == Vector2.new(0, 0) or game.Workspace.CurrentCamera.ViewportSize == Vector2.new(1, 1) do
		game.Workspace.CurrentCamera.Changed:Wait()
	end
	return game.Workspace.CurrentCamera.ViewportSize
end

local IsEnabled = TenFootInterfaceModule:IsEnabled()
local Flag = false
local IsNotMouseEnabled: boolean = UserInputService.TouchEnabled == true and UserInputService.MouseEnabled == false
local IsYBelow: boolean = IsNotMouseEnabled and getViewportSize().Y <= 370
local NoIsYBelow: boolean = IsNotMouseEnabled and not IsYBelow
local Flag1 = false
local Flag2 = false
local CoreGuiNavigationEnabled = false
local GuiNavigationEnabled = false
local AutoSelectGuiEnabled = false
local config = {
	WindowTitle = "Confirm",
	MainText = "Is this okay?",
	ConfirmationText = "Confirm",
	CancelText = "Cancel",
	CancelActive = true,
	Image = nil,
	ImageConsoleVR = nil,
	PromptCompletedCallback = nil,
	StripeColor = Color3.new(0.01, 0.72, 0.34)
}
local PromptCompletedCallback = nil
local v1 = nil
local List = {}
local _UDim2 = UDim2.new(0, 438, 0, 300)
local _UDim2_1 = UDim2.new(0.5, -219, 0, -300)
local _UDim2_2 = UDim2.new(0.5, -219, 0.5, -150)
local YOffset = 52
local TextSize = 24

if IsEnabled or Flag then
	_UDim2 = UDim2.new(1, 0, 0, 690)
	_UDim2_1 = UDim2.new(0, 0, 0, -690)
	_UDim2_2 = UDim2.new(0, 0, 0.5, -345)
elseif IsYBelow then
	_UDim2 = UDim2.new(0.9, 0, 0.9, 0)
	_UDim2_1 = UDim2.new(0.05, 0, -0.9, 0)
	_UDim2_2 = UDim2.new(0.05, 0, 0.05, 0)
elseif NoIsYBelow then
	_UDim2 = UDim2.new(0, 400, 0, 305)
	_UDim2_1 = UDim2.new(0.5, -200, 0, -305)
	_UDim2_2 = UDim2.new(0.5, -200, 0.5, -152)
end
if IsYBelow then
	YOffset = 44
end
if IsEnabled or Flag then
	TextSize = 42
end
local function createFrame(Name, Size, Position, BackgroundTransparency, StripeColor)
	local Frame = Instance.new("Frame")
	Frame.Name = Name
	Frame.Size = Size
	Frame.Position = Position or UDim2.new(0, 0, 0, 0)
	Frame.BackgroundTransparency = BackgroundTransparency
	Frame.BackgroundColor3 = StripeColor or Color3.new()
	Frame.BorderSizePixel = 0
	Frame.ZIndex = 8
	
	return Frame
end

local function createTextLabel(Name, Size, Position, SourceSansBold, TextSize, WindowTitle)
	local Label = Instance.new("TextLabel")
	Label.Name = Name
	Label.Size = Size or UDim2.new(0, 0, 0, 0)
	Label.Position = Position
	Label.BackgroundTransparency = 1
	Label.Font = SourceSansBold
	Label.TextSize = TextSize
	Label.TextColor3 = Color3.new(1, 1, 1)
	Label.Text = WindowTitle
	Label.ZIndex = 8
	
	return Label
end

local function createScrollingTextLabel(Name, Size, Position, SourceSansBold, TextSize, MainText, ScrollBarThickness: number)
	-- upvalues: createTextLabel (copy), TextService (copy)
	local TextLabel = createTextLabel(Name, Size, Position, SourceSansBold, TextSize, MainText)
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel.TextYAlignment = Enum.TextYAlignment.Top
	TextLabel.TextWrapped = true
	
	if Size.Y.Offset < TextService:GetTextSize(MainText, TextSize, SourceSansBold, Vector2.new(Size.X.Offset, 10000)).Y then
		local _Vector2 = Vector2.new(Size.X.Offset - (ScrollBarThickness + 20), 10000)
		local TextSize1 = TextService:GetTextSize(MainText, TextSize, SourceSansBold, _Vector2)
		local ScrollingTextParent = Instance.new("Frame")
		ScrollingTextParent.Name = "ScrollingTextParent"
		ScrollingTextParent.BackgroundTransparency = 1
		ScrollingTextParent.BackgroundColor3 = Color3.new(1, 1, 1)
		ScrollingTextParent.BorderSizePixel = 0
		ScrollingTextParent.Position = Position
		ScrollingTextParent.Size = Size - UDim2.new(0, ScrollBarThickness * 2, 0, 0)
		local ScrollingFrame = Instance.new("ScrollingFrame")
		ScrollingFrame.Selectable = true
		ScrollingFrame.Name = "ScrollingFrame"
		ScrollingFrame.BackgroundTransparency = 1
		ScrollingFrame.BackgroundColor3 = Color3.new(1, 1, 1)
		ScrollingFrame.BorderSizePixel = 0
		ScrollingFrame.Position = UDim2.new(0, 0, 0, 0)
		ScrollingFrame.Size = Size
		ScrollingFrame.CanvasSize = UDim2.new(0, _Vector2.X - ScrollBarThickness * 2, 0, TextSize1.Y)
		ScrollingFrame.ScrollBarThickness = ScrollBarThickness
		ScrollingFrame.SelectionImageObject = Instance.new("ImageLabel")
		ScrollingFrame.SelectionImageObject.Name = "EmptySelectionImage"
		ScrollingFrame.SelectionImageObject.BackgroundTransparency = 1
		ScrollingFrame.SelectionImageObject.Image = ""
		ScrollingFrame.Active = false
		ScrollingFrame.SelectionGained:connect(function()
			-- upvalues: ScrollingTextParent (copy)
			ScrollingTextParent.BackgroundTransparency = 0.15
		end)
		ScrollingFrame.SelectionLost:connect(function()
			-- upvalues: ScrollingTextParent (copy)
			ScrollingTextParent.BackgroundTransparency = 1
		end)
		TextLabel.Position = UDim2.new(0, 10, 0, 0)
		TextLabel.Size = UDim2.new(0, _Vector2.X, 0, TextSize1.Y)
		TextLabel.Parent = ScrollingFrame
		ScrollingFrame.Parent = ScrollingTextParent
		
		return ScrollingTextParent
	else
		return TextLabel
	end
end

local function _(Name, Size, Position, Image, Callback: (any) -> ())
	local Image1 = Instance.new("ImageLabel")
	Image1.Name = Name
	Image1.Size = Size
	Image1.BackgroundTransparency = 1
	Image1.Position = Position
	Image1.Image = Image
	
	if Callback then
		Callback(Image1)
	end
	return Image1
end

local function createImageButtonWithText(Name, Size, Position, Image, Image1, ConfirmationText, SourceSans)
	-- upvalues: createTextLabel (copy), TextSize (ref)
	local ImageButton = Instance.new("ImageButton")
	ImageButton.Name = Name
	ImageButton.Size = Size
	ImageButton.Position = Position
	ImageButton.Image = Image
	ImageButton.BackgroundTransparency = 1
	ImageButton.AutoButtonColor = false
	ImageButton.ZIndex = 8
	ImageButton.Modal = true
	ImageButton.Selectable = true
	ImageButton.SelectionImageObject = Instance.new("ImageLabel")
	ImageButton.SelectionImageObject.Name = "EmptySelectionImage"
	ImageButton.SelectionImageObject.BackgroundTransparency = 1
	ImageButton.SelectionImageObject.Image = ""
	local TextLabel = createTextLabel(Name .. "Text", UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), SourceSans, TextSize, ConfirmationText)
	TextLabel.ZIndex = 9
	TextLabel.Parent = ImageButton
	ImageButton.MouseEnter:connect(function()
		-- upvalues: ImageButton (copy), Image1 (copy)
		ImageButton.Image = Image1
	end)
	ImageButton.MouseLeave:connect(function()
		-- upvalues: ImageButton (copy), Image (copy)
		ImageButton.Image = Image
	end)
	ImageButton.MouseButton1Click:connect(function()
		-- upvalues: ImageButton (copy), Image (copy)
		ImageButton.Image = Image
	end)
	ImageButton.SelectionGained:connect(function()
		-- upvalues: ImageButton (copy), Image1 (copy)
		ImageButton.Image = Image1
	end)
	ImageButton.SelectionLost:connect(function()
		-- upvalues: ImageButton (copy), Image (copy)
		ImageButton.Image = Image
	end)
	
	return ImageButton
end

local function createPromptDialog()
	-- upvalues: PromptDialog (ref), createFrame (copy), _UDim2 (ref), _UDim2_1 (ref), RobloxGui (copy), ContainerFrame (ref)
	PromptDialog = createFrame("PromptDialog", _UDim2, _UDim2_1, 1, nil)
	PromptDialog.Visible = false
	PromptDialog.Active = true
	PromptDialog.Parent = RobloxGui
	ContainerFrame = createFrame("ContainerFrame", UDim2.new(1, 0, 1, 0), nil, 0.36, Color3.new(0, 0, 0))
	ContainerFrame.ZIndex = 8
	ContainerFrame.Parent = PromptDialog
end

local _ = function()
	-- upvalues: PromptDialog (ref), ContainerFrame (ref)
	if PromptDialog then
		PromptDialog:Destroy()
		PromptDialog = nil
		ContainerFrame = nil
	end
end

function AddDefaultsToPromptOptions(p1, List)
	for i, value in pairs(List) do
		if p1[i] == nil then
			p1[i] = value
		end
	end
end

function CreatePromptVRorConsole(p2)
	-- upvalues: ContainerFrame (ref), createTextLabel (copy), createFrame (copy), createScrollingTextLabel (copy), createImageButtonWithText (copy)
	local XOffset = 90
	
	if p2.ImageConsoleVR then
		local _UDim2 = UDim2.new(0, 100, 0, 45)
		local ImageConsoleVR = p2.ImageConsoleVR
		local FetchImageFunctionConsoleVRFunction: (any) -> () = p2.FetchImageFunctionConsoleVR
		local Image = Instance.new("ImageLabel")
		Image.Name = "Image"
		Image.Size = UDim2.new(0, 600, 0, 600)
		Image.BackgroundTransparency = 1
		Image.Position = _UDim2
		Image.Image = ImageConsoleVR
		
		if FetchImageFunctionConsoleVRFunction then
			FetchImageFunctionConsoleVRFunction(Image)
		end
		Image.ZIndex = 9
		Image.Parent = ContainerFrame
		XOffset = 800
	end
	local WindowTitle = createTextLabel("WindowTitle", UDim2.new(0, 800, 0, 60), UDim2.new(0, XOffset, 0, 60), Enum.Font.SourceSansBold, 48, p2.WindowTitle)
	WindowTitle.TextXAlignment = Enum.TextXAlignment.Left
	WindowTitle.TextYAlignment = Enum.TextYAlignment.Center
	WindowTitle.Parent = ContainerFrame
	WindowTitle.ZIndex = 9
	local ColorStripe = createFrame("ColorStripe", UDim2.new(0, 832, 0, 4), UDim2.new(0, XOffset, 0, 120), 0, p2.StripeColor)
	ColorStripe.ZIndex = 9
	ColorStripe.Parent = ContainerFrame
	createScrollingTextLabel("MainText", UDim2.new(0, 800, 0, 450), UDim2.new(0, XOffset, 0, 152), Enum.Font.SourceSansBold, 44, p2.MainText, 16).Parent = ContainerFrame
	local _Rect = Rect.new(8, 8, 56, 56)
	local Slice = Enum.ScaleType.Slice
	local ConfirmButton = createImageButtonWithText("ConfirmButton", UDim2.new(0, 320, 0, 80), UDim2.new(0, XOffset, 1, -125), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p2.ConfirmationText, Enum.Font.SourceSans)
	ConfirmButton.Parent = ContainerFrame
	ConfirmButton.ScaleType = Slice
	ConfirmButton.SliceCenter = _Rect
	ConfirmButton.MouseButton1Click:connect(function()
		OnPromptEnded(true)
	end)
	
	if p2.CancelActive then
		local CancelButton = createImageButtonWithText("CancelButton", UDim2.new(0, 320, 0, 80), UDim2.new(0, XOffset + 340, 1, -125), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p2.CancelText, Enum.Font.SourceSans)
		CancelButton.Parent = ContainerFrame
		CancelButton.ScaleType = Slice
		CancelButton.SliceCenter = _Rect
		CancelButton.MouseButton1Click:connect(function()
			OnPromptEnded(false)
		end)
	end
end

function CreatePromptPCorTablet(p2)
	-- upvalues: createTextLabel (copy), YOffset (ref), ContainerFrame (ref), createFrame (copy), NoIsYBelow (copy), createScrollingTextLabel (copy), createImageButtonWithText (copy)
	local WindowTitle = createTextLabel("WindowTitle", UDim2.new(1, 0, 0, YOffset), UDim2.new(0, 0, 0, 0), Enum.Font.SourceSansBold, 24, p2.WindowTitle)
	WindowTitle.Parent = ContainerFrame
	WindowTitle.ZIndex = 9
	local ColorStripe = createFrame("ColorStripe", UDim2.new(1, 0, 0, 2), nil, 0, p2.StripeColor)
	ColorStripe.Position = UDim2.new(0, 0, 0, YOffset)
	ColorStripe.ZIndex = 9
	ColorStripe.Parent = ContainerFrame
	local MainText = nil
	
	if p2.Image then
		local _UDim2 = UDim2.new(0, 15, 0, YOffset + 17)
		local Image = p2.Image
		local FetchImageFunctionFunction: (any) -> () = p2.FetchImageFunction
		local Image1 = Instance.new("ImageLabel")
		Image1.Name = "Image"
		Image1.Size = UDim2.new(0, 150, 0, 150)
		Image1.BackgroundTransparency = 1
		Image1.Position = _UDim2
		Image1.Image = Image
		
		if FetchImageFunctionFunction then
			FetchImageFunctionFunction(Image1)
		end
		Image1.ZIndex = 9
		Image1.Parent = ContainerFrame
		MainText = if NoIsYBelow then createScrollingTextLabel("MainText", UDim2.new(0, 195, 0, 150), UDim2.new(0, 185, 0, YOffset + 17), Enum.Font.SourceSansBold, 22, p2.MainText, 8) else createScrollingTextLabel("MainText", UDim2.new(0, 233, 0, 150), UDim2.new(0, 185, 0, YOffset + 17), Enum.Font.SourceSansBold, 22, p2.MainText, 8)
	else
		MainText = if NoIsYBelow then createScrollingTextLabel("MainText", UDim2.new(0, 360, 0, 150), UDim2.new(0, 20, 0, YOffset + 17), Enum.Font.SourceSansBold, 22, p2.MainText, 8) else createScrollingTextLabel("MainText", UDim2.new(0, 398, 0, 150), UDim2.new(0, 20, 0, YOffset + 17), Enum.Font.SourceSansBold, 22, p2.MainText, 8)
	end
	MainText.Parent = ContainerFrame
	local _Rect = Rect.new(8, 8, 56, 56)
	local Slice = Enum.ScaleType.Slice
	local ConfirmButton = if NoIsYBelow then if p2.CancelActive then createImageButtonWithText("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -138, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p2.ConfirmationText, Enum.Font.SourceSansBold) else createImageButtonWithText("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -64, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p2.ConfirmationText, Enum.Font.SourceSans) elseif p2.CancelActive then createImageButtonWithText("ConfirmButton", UDim2.new(0, 128, 0, 38), UDim2.new(0.5, -138, 1, -53), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p2.ConfirmationText, Enum.Font.SourceSansBold) else createImageButtonWithText("ConfirmButton", UDim2.new(0, 128, 0, 38), UDim2.new(0.5, -64, 1, -53), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p2.ConfirmationText, Enum.Font.SourceSans)
	ConfirmButton.Parent = ContainerFrame
	ConfirmButton.ScaleType = Slice
	ConfirmButton.SliceCenter = _Rect
	ConfirmButton.MouseButton1Click:connect(function()
		OnPromptEnded(true)
	end)
	
	if p2.CancelActive then
		local CancelButton = if NoIsYBelow then createImageButtonWithText("CancelButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, 10, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p2.CancelText, Enum.Font.SourceSans) else createImageButtonWithText("CancelButton", UDim2.new(0, 128, 0, 38), UDim2.new(0.5, 10, 1, -53), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p2.CancelText, Enum.Font.SourceSans)
		CancelButton.Parent = ContainerFrame
		CancelButton.ScaleType = Slice
		CancelButton.SliceCenter = _Rect
		CancelButton.MouseButton1Click:connect(function()
			OnPromptEnded(false)
		end)
		CancelButton.NextSelectionLeft = ConfirmButton
		ConfirmButton.NextSelectionRight = CancelButton
	end
end

function CreatePromptPhone(p2)
	-- upvalues: createTextLabel (copy), YOffset (ref), ContainerFrame (ref), createFrame (copy), createScrollingTextLabel (copy), createImageButtonWithText (copy)
	local WindowTitle = createTextLabel("WindowTitle", UDim2.new(1, 0, 0, YOffset), UDim2.new(0, 0, 0, 0), Enum.Font.SourceSansBold, 24, p2.WindowTitle)
	WindowTitle.Parent = ContainerFrame
	WindowTitle.ZIndex = 9
	local ColorStripe = createFrame("ColorStripe", UDim2.new(1, 0, 0, 2), nil, 0, p2.StripeColor)
	ColorStripe.Position = UDim2.new(0, 0, 0, YOffset)
	ColorStripe.ZIndex = 9
	ColorStripe.Parent = ContainerFrame
	local MainText = nil
	
	if p2.Image then
		local _UDim2 = UDim2.new(0, 15, 0, YOffset + 17)
		local Image = p2.Image
		local FetchImageFunctionFunction: (any) -> () = p2.FetchImageFunction
		local Image1 = Instance.new("ImageLabel")
		Image1.Name = "Image"
		Image1.Size = UDim2.new(0, 120, 0, 120)
		Image1.BackgroundTransparency = 1
		Image1.Position = _UDim2
		Image1.Image = Image
		
		if FetchImageFunctionFunction then
			FetchImageFunctionFunction(Image1)
		end
		Image1.ZIndex = 9
		Image1.Parent = ContainerFrame
		MainText = createScrollingTextLabel("MainText", UDim2.new(0, ContainerFrame.AbsoluteSize.X - 175, 0, 120), UDim2.new(0, 155, 0, YOffset + 17), Enum.Font.SourceSansBold, 20, p2.MainText, 8)
	else
		MainText = createScrollingTextLabel("MainText", UDim2.new(1, ContainerFrame.AbsoluteSize.X - 40, 0, 120), UDim2.new(0, 20, 0, YOffset + 17), Enum.Font.SourceSansBold, 20, p2.MainText, 8)
	end
	MainText.Parent = ContainerFrame
	local _Rect = Rect.new(8, 8, 56, 56)
	local Slice = Enum.ScaleType.Slice
	local ConfirmButton = if p2.CancelActive then createImageButtonWithText("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -138, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p2.ConfirmationText, Enum.Font.SourceSansBold) else createImageButtonWithText("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -64, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p2.ConfirmationText, Enum.Font.SourceSans)
	ConfirmButton.Parent = ContainerFrame
	ConfirmButton.ScaleType = Slice
	ConfirmButton.SliceCenter = _Rect
	ConfirmButton.MouseButton1Click:connect(function()
		OnPromptEnded(true)
	end)
	
	if p2.CancelActive then
		local CancelButton = createImageButtonWithText("CancelButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, 10, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p2.CancelText, Enum.Font.SourceSans)
		CancelButton.Parent = ContainerFrame
		CancelButton.ScaleType = Slice
		CancelButton.SliceCenter = _Rect
		CancelButton.MouseButton1Click:connect(function()
			OnPromptEnded(false)
		end)
	end
end

function CreatePromptFromOptions(p2)
	-- upvalues: ContainerFrame (ref), Flag (ref), IsEnabled (copy), IsYBelow (copy)
	ContainerFrame:ClearAllChildren()
	
	if Flag or IsEnabled then
		CreatePromptVRorConsole(p2)
		
		return
	end
	if IsYBelow then
		CreatePromptPhone(p2)
		
		return
	else
		CreatePromptPCorTablet(p2)
	end
end

function SetSelectedObject()
	-- upvalues: ContainerFrame (ref), GuiService (copy)
	local CancelButton = ContainerFrame:FindFirstChild("CancelButton")
	
	if CancelButton then
		GuiService.SelectedCoreObject = CancelButton
		
		return
	end
	local ConfirmButton = ContainerFrame:FindFirstChild("ConfirmButton")
	
	if ConfirmButton then
		GuiService.SelectedCoreObject = ConfirmButton
	end
end

function OnTweenInFinished()
	-- upvalues: Flag2 (ref), IsEnabled (copy)
	if Flag2 or IsEnabled then
		SetSelectedObject()
	end
end

function ConnectActiveEvents()
	-- upvalues: Flag (ref), Flag2 (ref), List (ref), UserInputService (copy), GuiService (copy), Flag1 (ref), CoreGuiNavigationEnabled (ref), GuiNavigationEnabled (ref), AutoSelectGuiEnabled (ref)
	local function OnInputChanged(Input)
		-- upvalues: Flag (upval), Flag2 (upval)
		local UserInputType = Input.UserInputType
		local UserInputType1 = Enum.UserInputType
		
		if Flag or not valueInTable(UserInputType, {
			UserInputType1.Gamepad1,
			UserInputType1.Gamepad2,
			UserInputType1.Gamepad3,
			UserInputType1.Gamepad4
		}) then
			Flag2 = false
		elseif Input.KeyCode ~= Enum.KeyCode.Thumbstick1 and Input.KeyCode ~= Enum.KeyCode.Thumbstick2 then
			Flag2 = true
			
			return
		else
			if math.abs(Input.Position.X) > 0.1 or math.abs(Input.Position.Z) > 0.1 or math.abs(Input.Position.Y) > 0.1 then
				Flag2 = true
				
				return
			end
		end
	end
	
	table.insert(List, UserInputService.InputChanged:connect(OnInputChanged))
	table.insert(List, UserInputService.InputBegan:connect(OnInputChanged))
	table.insert(List, GuiService.Changed:connect(function(p2)
		-- upvalues: Flag1 (upval), GuiService (upval), CoreGuiNavigationEnabled (upval), GuiNavigationEnabled (upval), AutoSelectGuiEnabled (upval)
		if Flag1 then
			if p2 == "CoreGuiNavigationEnabled" then
				if GuiService.CoreGuiNavigationEnabled ~= true then
					CoreGuiNavigationEnabled = GuiService.CoreGuiNavigationEnabled
					GuiService.CoreGuiNavigationEnabled = true
					
					return
				end
			elseif p2 == "GuiNavigationEnabled" then
				if GuiService.GuiNavigationEnabled ~= false then
					GuiNavigationEnabled = GuiService.GuiNavigationEnabled
					GuiService.GuiNavigationEnabled = false
					
					return
				end
			elseif p2 == "AutoSelectGuiEnabled" and GuiService.AutoSelectGuiEnabled ~= false then
				AutoSelectGuiEnabled = GuiService.AutoSelectGuiEnabled
				GuiService.AutoSelectGuiEnabled = false
			end
		end
	end))
end

function DisconnectActiveEvents()
	-- upvalues: List (ref)
	for _, Connection in ipairs(List) do
		Connection:Disconnect()
	end
	List = {}
end

function ShowPrompt()
	-- upvalues: PromptDialog (ref), IsEnabled (copy), UserInputService (copy), Flag (ref), NewResult (ref), DialogModule (copy), _UDim2_2 (ref)
	PromptDialog.Visible = true
	
	if IsEnabled then
		UserInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
	end
	if not Flag then
		PromptDialog:TweenPositionInternal(_UDim2_2, Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.3, true, OnTweenInFinished)
		DisableControllerMovement()
		EnableControllerInput()
		
		return
	end
	if not NewResult then
		NewResult = DialogModule.new()
	end
	PromptDialog.Position = _UDim2_2
	NewResult:SetContent(PromptDialog)
	NewResult:Show(true)
	DisableControllerMovement()
end

function HidePrompt()
	-- upvalues: Flag1 (ref), GuiService (copy), CoreGuiNavigationEnabled (ref), GuiNavigationEnabled (ref), AutoSelectGuiEnabled (ref), IsEnabled (copy), UserInputService (copy), PromptCreatorTransientDialog (copy), PromptDialog (ref), ContainerFrame (ref), Flag (ref), _UDim2_1 (ref), NewResult (ref)
	local function onClosed()
		-- upvalues: Flag1 (upval), GuiService (upval), CoreGuiNavigationEnabled (upval), GuiNavigationEnabled (upval), AutoSelectGuiEnabled (upval), IsEnabled (upval), UserInputService (upval), PromptCreatorTransientDialog (upval), PromptDialog (upval), ContainerFrame (upval)
		Flag1 = false
		GuiService.CoreGuiNavigationEnabled = CoreGuiNavigationEnabled
		GuiService.GuiNavigationEnabled = GuiNavigationEnabled
		GuiService.AutoSelectGuiEnabled = AutoSelectGuiEnabled
		GuiService.SelectedCoreObject = nil
		
		if IsEnabled then
			UserInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
		end
		if PromptCreatorTransientDialog then
			DisconnectActiveEvents()
			
			if PromptDialog then
				PromptDialog:Destroy()
				PromptDialog = nil
				ContainerFrame = nil
				
				return
			end
		else
			PromptDialog.Visible = false
		end
	end
	
	if Flag then
		PromptDialog.Position = _UDim2_1
		
		if NewResult then
			NewResult:Close()
		end
		Flag1 = false
		GuiService.CoreGuiNavigationEnabled = CoreGuiNavigationEnabled
		GuiService.GuiNavigationEnabled = GuiNavigationEnabled
		GuiService.AutoSelectGuiEnabled = AutoSelectGuiEnabled
		GuiService.SelectedCoreObject = nil
		
		if IsEnabled then
			UserInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
		end
		if not PromptCreatorTransientDialog then
			PromptDialog.Visible = false
			
			return
		end
		DisconnectActiveEvents()
		
		if PromptDialog then
			PromptDialog:Destroy()
			PromptDialog = nil
			ContainerFrame = nil
			
			return
		end
	else
		PromptDialog:TweenPositionInternal(_UDim2_1, Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.3, true, onClosed)
	end
end

function DoCreatePrompt(p2)
	-- upvalues: PromptCompletedCallback (ref), config (copy), v1 (ref)
	PromptCompletedCallback = p2.PromptCompletedCallback
	AddDefaultsToPromptOptions(p2, config)
	v1 = p2
	CreatePromptFromOptions(p2)
	ShowPrompt()
end

function OnPromptEnded(p2)
	-- upvalues: PromptCompletedCallback (ref), v1 (ref)
	if PromptCompletedCallback then
		if v1.CancelActive then
			spawn(function()
				-- upvalues: PromptCompletedCallback (upval), p2 (copy)
				PromptCompletedCallback(p2)
			end)
		else
			spawn(function()
				-- upvalues: PromptCompletedCallback (upval)
				PromptCompletedCallback(true)
			end)
		end
	end
	HidePrompt()
	EnableControllerMovement()
	DisableControllerInput()
end

function NoOpFunc() end

function EnableControllerMovement()
	-- upvalues: ContextActionService (copy)
	ContextActionService:UnbindCoreAction("doNothingThumbstick2PromptCreator")
	ContextActionService:UnbindCoreAction("doNothingAButtonPromptCreator")
end

function DisableControllerMovement()
	-- upvalues: ContextActionService (copy)
	ContextActionService:BindCoreAction("doNothingThumbstick2PromptCreator", NoOpFunc, false, Enum.KeyCode.Thumbstick2)
	ContextActionService:BindCoreAction("doNothingAButtonPromptCreator", NoOpFunc, false, Enum.KeyCode.ButtonA)
end

function EnableControllerInput()
	-- upvalues: ContextActionService (copy), v1 (ref), GuiService (copy)
	ContextActionService:BindCoreAction("CoreScriptPromptCreatorCancel", function(_, UserInputState, _)
		-- upvalues: v1 (upval)
		if UserInputState ~= Enum.UserInputState.Begin then return end
		if v1.CancelActive then
			OnPromptEnded(false)
		end
	end, false, Enum.KeyCode.ButtonB)
	ContextActionService:BindCoreAction("CoreScriptPromptCreatorSelect", function(_, UserInputState, _)
		-- upvalues: GuiService (upval)
		if UserInputState ~= Enum.UserInputState.Begin then return end
		if GuiService.SelectedCoreObject == nil then
			SetSelectedObject()
		end
	end, false, Enum.KeyCode.ButtonSelect)
end

function DisableControllerInput()
	-- upvalues: ContextActionService (copy)
	ContextActionService:UnbindCoreAction("CoreScriptPromptCreatorCancel")
	ContextActionService:UnbindCoreAction("CoreScriptPromptCreatorSelect")
end

function valueInTable(p2, List): boolean
	for _, value in pairs(List) do
		if value == p2 then
			return true
		end
	end
	return false
end

function SetupGamepadSelection()
	-- upvalues: CoreGuiNavigationEnabled (ref), GuiService (copy), GuiNavigationEnabled (ref), AutoSelectGuiEnabled (ref)
	CoreGuiNavigationEnabled = GuiService.CoreGuiNavigationEnabled
	GuiNavigationEnabled = GuiService.GuiNavigationEnabled
	AutoSelectGuiEnabled = GuiService.AutoSelectGuiEnabled
	GuiService.SelectedCoreObject = nil
	GuiService.CoreGuiNavigationEnabled = true
	GuiService.GuiNavigationEnabled = false
	GuiService.AutoSelectGuiEnabled = false
end

if not PromptCreatorTransientDialog then
	createPromptDialog()
	
	local function OnInputChanged(Input)
		-- upvalues: Flag (ref), Flag2 (ref)
		local UserInputType = Input.UserInputType
		local UserInputType1 = Enum.UserInputType
		
		if Flag or not valueInTable(UserInputType, {
			UserInputType1.Gamepad1,
			UserInputType1.Gamepad2,
			UserInputType1.Gamepad3,
			UserInputType1.Gamepad4
		}) then
			Flag2 = false
		elseif Input.KeyCode ~= Enum.KeyCode.Thumbstick1 and Input.KeyCode ~= Enum.KeyCode.Thumbstick2 then
			Flag2 = true
			
			return
		else
			if math.abs(Input.Position.X) > 0.1 or math.abs(Input.Position.Z) > 0.1 or math.abs(Input.Position.Y) > 0.1 then
				Flag2 = true
				
				return
			end
		end
	end
	
	UserInputService.InputChanged:connect(OnInputChanged)
	UserInputService.InputBegan:connect(OnInputChanged)
	
	local _ = function(p3)
		-- upvalues: NewResult (ref), DialogModule (copy), PromptDialog (ref), Flag (ref), RobloxGui (copy)
		if p3 then
			if not NewResult then
				NewResult = DialogModule.new()
			end
			NewResult:SetContent(PromptDialog)
			Flag = true
			
			return
		else
			Flag = false
			
			if NewResult then
				NewResult:SetContent(nil)
			end
			PromptDialog.Parent = RobloxGui
		end
	end
	
	spawn(function()
		-- upvalues: UserInputService (copy), NewResult (ref), DialogModule (copy), PromptDialog (ref), Flag (ref), RobloxGui (copy)
		if UserInputService.VREnabled then
			if not NewResult then
				NewResult = DialogModule.new()
			end
			NewResult:SetContent(PromptDialog)
			Flag = true
			
			return
		else
			Flag = false
			
			if NewResult then
				NewResult:SetContent(nil)
			end
			PromptDialog.Parent = RobloxGui
		end
	end)
	UserInputService.Changed:connect(function(Property)
		-- upvalues: UserInputService (copy), NewResult (ref), DialogModule (copy), PromptDialog (ref), Flag (ref), RobloxGui (copy)
		if Property == "VREnabled" then
			if UserInputService.VREnabled then
				if not NewResult then
					NewResult = DialogModule.new()
				end
				NewResult:SetContent(PromptDialog)
				Flag = true
				
				return
			else
				Flag = false
				
				if NewResult then
					NewResult:SetContent(nil)
				end
				PromptDialog.Parent = RobloxGui
			end
		end
	end)
	GuiService.Changed:connect(function(Property)
		-- upvalues: Flag1 (ref), GuiService (copy), CoreGuiNavigationEnabled (ref), GuiNavigationEnabled (ref), AutoSelectGuiEnabled (ref)
		if Flag1 then
			if Property == "CoreGuiNavigationEnabled" then
				if GuiService.CoreGuiNavigationEnabled ~= true then
					CoreGuiNavigationEnabled = GuiService.CoreGuiNavigationEnabled
					GuiService.CoreGuiNavigationEnabled = true
					
					return
				end
			elseif Property == "GuiNavigationEnabled" then
				if GuiService.GuiNavigationEnabled ~= false then
					GuiNavigationEnabled = GuiService.GuiNavigationEnabled
					GuiService.GuiNavigationEnabled = false
					
					return
				end
			elseif Property == "AutoSelectGuiEnabled" and GuiService.AutoSelectGuiEnabled ~= false then
				AutoSelectGuiEnabled = GuiService.AutoSelectGuiEnabled
				GuiService.AutoSelectGuiEnabled = false
			end
		end
	end)
end
function t:CreatePrompt(p3): boolean
	-- upvalues: Flag1 (ref), PromptCreatorTransientDialog (copy), createPromptDialog (copy)
	if Flag1 then
		return false
	end
	Flag1 = true
	
	if PromptCreatorTransientDialog then
		createPromptDialog()
		ConnectActiveEvents()
	end
	SetupGamepadSelection()
	DoCreatePrompt(p3)
	
	return true
end

function t:IsCurrentlyPrompting()
	-- upvalues: Flag1 (ref)
	return Flag1
end

return t