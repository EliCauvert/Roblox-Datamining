local var32
local t = {}
local coreGuiService = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local contextActionService = game:GetService("ContextActionService")
local textService = game:GetService("TextService")
local guiService = game:GetService("GuiService")
local promptCreatorTransientDialog = game:DefineFastFlag("PromptCreatorTransientDialog", false)
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local modules = robloxGui:WaitForChild("Modules")
local tenFootInterfaceModule = require(modules:WaitForChild("TenFootInterface"))
local dialogModule = require(modules:WaitForChild("VR"):WaitForChild("Dialog"))
local var11 = nil
local var12 = nil
local var13 = nil

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

local var14 = tenFootInterfaceModule:IsEnabled()
local var15 = false
local var16 = userInputService.TouchEnabled == true and userInputService.MouseEnabled == false
local var17 = var16 and getViewportSize().Y <= 370
local var18 = var16 and not var17
local var19 = false
local var20 = false
local var21 = false
local var22 = false
local var23 = false
local t_1 = {
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
local var25 = nil
local var26 = nil
local t_2 = {}
local uDim2 = UDim2.new(0, 438, 0, 300)
local uDim2_1 = UDim2.new(0.5, -219, 0, -300)
local uDim2_2 = UDim2.new(0.5, -219, 0.5, -150)
local var31 = 52
local _ = 24

if var14 then
	uDim2 = UDim2.new(1, 0, 0, 690)
	uDim2_1 = UDim2.new(0, 0, 0, -690)
	uDim2_2 = UDim2.new(0, 0, 0.5, -345)
elseif var17 then
	uDim2 = UDim2.new(0.9, 0, 0.9, 0)
	uDim2_1 = UDim2.new(0.05, 0, -0.9, 0)
	uDim2_2 = UDim2.new(0.05, 0, 0.05, 0)
elseif var18 then
	uDim2 = UDim2.new(0, 400, 0, 305)
	uDim2_1 = UDim2.new(0.5, -200, 0, -305)
	uDim2_2 = UDim2.new(0.5, -200, 0.5, -152)
end
if var17 then
	var31 = 44
end
if var14 then
	var32 = 42
end
local function createFrame(p0, p1, p2, p3, p4)
	local frame = Instance.new("Frame")
	frame.Name = p0
	frame.Size = p1
	frame.Position = p2 or UDim2.new(0, 0, 0, 0)
	frame.BackgroundTransparency = p3
	frame.BackgroundColor3 = p4 or Color3.new()
	frame.BorderSizePixel = 0
	frame.ZIndex = 8
	
	return frame
end

local function createTextLabel(p5, p6, p7, p8, p9, p10)
	local textLabel = Instance.new("TextLabel")
	textLabel.Name = p5
	textLabel.Size = p6 or UDim2.new(0, 0, 0, 0)
	textLabel.Position = p7
	textLabel.BackgroundTransparency = 1
	textLabel.Font = p8
	textLabel.TextSize = p9
	textLabel.TextColor3 = Color3.new(1, 1, 1)
	textLabel.Text = p10
	textLabel.ZIndex = 8
	
	return textLabel
end

local function createScrollingTextLabel(p11, p12, p13, p14, p15, p16, p17)
	-- upvalues: createTextLabel (ref), textService (ref)
	local var41 = createTextLabel(p11, p12, p13, p14, p15, p16)
	var41.TextXAlignment = Enum.TextXAlignment.Left
	var41.TextYAlignment = Enum.TextYAlignment.Top
	var41.TextWrapped = true
	
	if p12.Y.Offset < textService:GetTextSize(p16, p15, p14, Vector2.new(p12.X.Offset, 10000)).Y then
		local vector2 = Vector2.new(p12.X.Offset - (p17 + 20), 10000)
		local var43 = textService:GetTextSize(p16, p15, p14, vector2)
		local scrollingTextParent = Instance.new("Frame")
		scrollingTextParent.Name = "ScrollingTextParent"
		scrollingTextParent.BackgroundTransparency = 1
		scrollingTextParent.BackgroundColor3 = Color3.new(1, 1, 1)
		scrollingTextParent.BorderSizePixel = 0
		scrollingTextParent.Position = p13
		scrollingTextParent.Size = p12 - UDim2.new(0, p17 * 2, 0, 0)
		local emptySelectionImage = Instance.new("ScrollingFrame")
		emptySelectionImage.Selectable = true
		emptySelectionImage.Name = "ScrollingFrame"
		emptySelectionImage.BackgroundTransparency = 1
		emptySelectionImage.BackgroundColor3 = Color3.new(1, 1, 1)
		emptySelectionImage.BorderSizePixel = 0
		emptySelectionImage.Position = UDim2.new(0, 0, 0, 0)
		emptySelectionImage.Size = p12
		emptySelectionImage.CanvasSize = UDim2.new(0, vector2.X - p17 * 2, 0, var43.Y)
		emptySelectionImage.ScrollBarThickness = p17
		emptySelectionImage.SelectionImageObject = Instance.new("ImageLabel")
		emptySelectionImage.SelectionImageObject.Name = "EmptySelectionImage"
		emptySelectionImage.SelectionImageObject.BackgroundTransparency = 1
		emptySelectionImage.SelectionImageObject.Image = ""
		emptySelectionImage.Active = false
		emptySelectionImage.SelectionGained:connect(function()
			-- upvalues: scrollingTextParent (ref)
			scrollingTextParent.BackgroundTransparency = 0.15
		end)
		emptySelectionImage.SelectionLost:connect(function()
			-- upvalues: scrollingTextParent (ref)
			scrollingTextParent.BackgroundTransparency = 1
		end)
		var41.Position = UDim2.new(0, 10, 0, 0)
		var41.Size = UDim2.new(0, vector2.X, 0, var43.Y)
		var41.Parent = emptySelectionImage
		emptySelectionImage.Parent = scrollingTextParent
		
		return scrollingTextParent
	end
	return var41
end

local function _(p18, p19, p20, p21, p22)
	local imageLabel = Instance.new("ImageLabel")
	imageLabel.Name = p18
	imageLabel.Size = p19
	imageLabel.BackgroundTransparency = 1
	imageLabel.Position = p20
	imageLabel.Image = p21
	
	if p22 then
		p22(imageLabel)
	end
	return imageLabel
end

local function createImageButtonWithText(p23, p24, p25, p26, p27, p28, p29)
	-- upvalues: createTextLabel (ref), var32 (write)
	local emptySelectionImage = Instance.new("ImageButton")
	emptySelectionImage.Name = p23
	emptySelectionImage.Size = p24
	emptySelectionImage.Position = p25
	emptySelectionImage.Image = p26
	emptySelectionImage.BackgroundTransparency = 1
	emptySelectionImage.AutoButtonColor = false
	emptySelectionImage.ZIndex = 8
	emptySelectionImage.Modal = true
	emptySelectionImage.Selectable = true
	emptySelectionImage.SelectionImageObject = Instance.new("ImageLabel")
	emptySelectionImage.SelectionImageObject.Name = "EmptySelectionImage"
	emptySelectionImage.SelectionImageObject.BackgroundTransparency = 1
	emptySelectionImage.SelectionImageObject.Image = ""
	local var48 = createTextLabel(p23 .. "Text", UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), p29, var32, p28)
	var48.ZIndex = 9
	var48.Parent = emptySelectionImage
	emptySelectionImage.MouseEnter:connect(function()
		-- upvalues: emptySelectionImage (ref), p27 (ref)
		emptySelectionImage.Image = p27
	end)
	emptySelectionImage.MouseLeave:connect(function()
		-- upvalues: emptySelectionImage (ref), p26 (ref)
		emptySelectionImage.Image = p26
	end)
	emptySelectionImage.MouseButton1Click:connect(function()
		-- upvalues: emptySelectionImage (ref), p26 (ref)
		emptySelectionImage.Image = p26
	end)
	emptySelectionImage.SelectionGained:connect(function()
		-- upvalues: emptySelectionImage (ref), p27 (ref)
		emptySelectionImage.Image = p27
	end)
	emptySelectionImage.SelectionLost:connect(function()
		-- upvalues: emptySelectionImage (ref), p26 (ref)
		emptySelectionImage.Image = p26
	end)
	
	return emptySelectionImage
end

local function createPromptDialog()
	-- upvalues: var12 (write), createFrame (ref), uDim2 (write), uDim2_1 (write), robloxGui (ref), var13 (write)
	var12 = createFrame("PromptDialog", uDim2, uDim2_1, 1, nil)
	var12.Visible = false
	var12.Active = true
	var12.Parent = robloxGui
	var13 = createFrame("ContainerFrame", UDim2.new(1, 0, 1, 0), nil, 0.36, Color3.new(0, 0, 0))
	var13.ZIndex = 8
	var13.Parent = var12
end

local _ = function()
	-- upvalues: var12 (write), var13 (write)
	if var12 then
		var12:Destroy()
		var12 = nil
		var13 = nil
	end
end

function AddDefaultsToPromptOptions(p30, p31)
	for i, v in pairs(p31) do
		if p30[i] == nil then
			p30[i] = v
		end
	end
end

function CreatePromptVRorConsole(p32)
	-- upvalues: var13 (write), createTextLabel (ref), createFrame (ref), createScrollingTextLabel (ref), createImageButtonWithText (ref)
	local var49 = 90
	
	if p32.ImageConsoleVR then
		local uDim2 = UDim2.new(0, 600, 0, 600)
		local uDim2_1 = UDim2.new(0, 100, 0, 45)
		local imageConsoleVR = p32.ImageConsoleVR
		local fetchImageFunctionConsoleVR = p32.FetchImageFunctionConsoleVR
		local image = Instance.new("ImageLabel")
		image.Name = "Image"
		image.Size = uDim2
		image.BackgroundTransparency = 1
		image.Position = uDim2_1
		image.Image = imageConsoleVR
		
		if fetchImageFunctionConsoleVR then
			fetchImageFunctionConsoleVR(image)
		end
		local var53 = image
		var53.ZIndex = 9
		var53.Parent = var13
		var49 = 800
	end
	local var54 = createTextLabel("WindowTitle", UDim2.new(0, 800, 0, 60), UDim2.new(0, var49, 0, 60), Enum.Font.SourceSansBold, 48, p32.WindowTitle)
	var54.TextXAlignment = Enum.TextXAlignment.Left
	var54.TextYAlignment = Enum.TextYAlignment.Center
	var54.Parent = var13
	var54.ZIndex = 9
	local var55 = createFrame("ColorStripe", UDim2.new(0, 832, 0, 4), UDim2.new(0, var49, 0, 120), 0, p32.StripeColor)
	var55.ZIndex = 9
	var55.Parent = var13
	createScrollingTextLabel("MainText", UDim2.new(0, 800, 0, 450), UDim2.new(0, var49, 0, 152), Enum.Font.SourceSansBold, 44, p32.MainText, 16).Parent = var13
	local rect = Rect.new(8, 8, 56, 56)
	local slice = Enum.ScaleType.Slice
	local var57 = createImageButtonWithText("ConfirmButton", UDim2.new(0, 320, 0, 80), UDim2.new(0, var49, 1, -125), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p32.ConfirmationText, Enum.Font.SourceSans)
	var57.Parent = var13
	var57.ScaleType = slice
	var57.SliceCenter = rect
	var57.MouseButton1Click:connect(function()
		OnPromptEnded(true)
	end)
	
	if p32.CancelActive then
		local var58 = createImageButtonWithText("CancelButton", UDim2.new(0, 320, 0, 80), UDim2.new(0, var49 + 340, 1, -125), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p32.CancelText, Enum.Font.SourceSans)
		var58.Parent = var13
		var58.ScaleType = slice
		var58.SliceCenter = rect
		var58.MouseButton1Click:connect(function()
			OnPromptEnded(false)
		end)
	end
end

function CreatePromptPCorTablet(p33)
	-- upvalues: createTextLabel (ref), var31 (write), var13 (write), createFrame (ref), var18 (ref), createScrollingTextLabel (ref), createImageButtonWithText (ref)
	local var65
	local var59 = createTextLabel("WindowTitle", UDim2.new(1, 0, 0, var31), UDim2.new(0, 0, 0, 0), Enum.Font.SourceSansBold, 24, p33.WindowTitle)
	var59.Parent = var13
	var59.ZIndex = 9
	local var60 = createFrame("ColorStripe", UDim2.new(1, 0, 0, 2), nil, 0, p33.StripeColor)
	var60.Position = UDim2.new(0, 0, 0, var31)
	var60.ZIndex = 9
	var60.Parent = var13
	local _ = nil
	local _ = nil
	
	if p33.Image then
		local uDim2 = UDim2.new(0, 150, 0, 150)
		local uDim2_1 = UDim2.new(0, 15, 0, var31 + 17)
		local image = p33.Image
		local fetchImageFunction = p33.FetchImageFunction
		local image_1 = Instance.new("ImageLabel")
		image_1.Name = "Image"
		image_1.Size = uDim2
		image_1.BackgroundTransparency = 1
		image_1.Position = uDim2_1
		image_1.Image = image
		
		if fetchImageFunction then
			fetchImageFunction(image_1)
		end
		local var64 = image_1
		var64.ZIndex = 9
		var64.Parent = var13
		var65 = if var18 then createScrollingTextLabel("MainText", UDim2.new(0, 195, 0, 150), UDim2.new(0, 185, 0, var31 + 17), Enum.Font.SourceSansBold, 22, p33.MainText, 8) else createScrollingTextLabel("MainText", UDim2.new(0, 233, 0, 150), UDim2.new(0, 185, 0, var31 + 17), Enum.Font.SourceSansBold, 22, p33.MainText, 8)
	else
		var65 = if var18 then createScrollingTextLabel("MainText", UDim2.new(0, 360, 0, 150), UDim2.new(0, 20, 0, var31 + 17), Enum.Font.SourceSansBold, 22, p33.MainText, 8) else createScrollingTextLabel("MainText", UDim2.new(0, 398, 0, 150), UDim2.new(0, 20, 0, var31 + 17), Enum.Font.SourceSansBold, 22, p33.MainText, 8)
	end
	var65.Parent = var13
	local rect = Rect.new(8, 8, 56, 56)
	local slice = Enum.ScaleType.Slice
	local var67 = if var18 then if p33.CancelActive then createImageButtonWithText("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -138, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p33.ConfirmationText, Enum.Font.SourceSansBold) else createImageButtonWithText("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -64, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p33.ConfirmationText, Enum.Font.SourceSans) elseif p33.CancelActive then createImageButtonWithText("ConfirmButton", UDim2.new(0, 128, 0, 38), UDim2.new(0.5, -138, 1, -53), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p33.ConfirmationText, Enum.Font.SourceSansBold) else createImageButtonWithText("ConfirmButton", UDim2.new(0, 128, 0, 38), UDim2.new(0.5, -64, 1, -53), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p33.ConfirmationText, Enum.Font.SourceSans)
	var67.Parent = var13
	var67.ScaleType = slice
	var67.SliceCenter = rect
	var67.MouseButton1Click:connect(function()
		OnPromptEnded(true)
	end)
	
	if p33.CancelActive then
		local var68 = if var18 then createImageButtonWithText("CancelButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, 10, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p33.CancelText, Enum.Font.SourceSans) else createImageButtonWithText("CancelButton", UDim2.new(0, 128, 0, 38), UDim2.new(0.5, 10, 1, -53), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p33.CancelText, Enum.Font.SourceSans)
		var68.Parent = var13
		var68.ScaleType = slice
		var68.SliceCenter = rect
		var68.MouseButton1Click:connect(function()
			OnPromptEnded(false)
		end)
		var68.NextSelectionLeft = var67
		var67.NextSelectionRight = var68
	end
end

function CreatePromptPhone(p34)
	-- upvalues: createTextLabel (ref), var31 (write), var13 (write), createFrame (ref), createScrollingTextLabel (ref), createImageButtonWithText (ref)
	local var75
	local var69 = createTextLabel("WindowTitle", UDim2.new(1, 0, 0, var31), UDim2.new(0, 0, 0, 0), Enum.Font.SourceSansBold, 24, p34.WindowTitle)
	var69.Parent = var13
	var69.ZIndex = 9
	local var70 = createFrame("ColorStripe", UDim2.new(1, 0, 0, 2), nil, 0, p34.StripeColor)
	var70.Position = UDim2.new(0, 0, 0, var31)
	var70.ZIndex = 9
	var70.Parent = var13
	local _ = nil
	local _ = nil
	
	if p34.Image then
		local uDim2 = UDim2.new(0, 120, 0, 120)
		local uDim2_1 = UDim2.new(0, 15, 0, var31 + 17)
		local image = p34.Image
		local fetchImageFunction = p34.FetchImageFunction
		local image_1 = Instance.new("ImageLabel")
		image_1.Name = "Image"
		image_1.Size = uDim2
		image_1.BackgroundTransparency = 1
		image_1.Position = uDim2_1
		image_1.Image = image
		
		if fetchImageFunction then
			fetchImageFunction(image_1)
		end
		local var74 = image_1
		var74.ZIndex = 9
		var74.Parent = var13
		var75 = createScrollingTextLabel("MainText", UDim2.new(0, var13.AbsoluteSize.X - 175, 0, 120), UDim2.new(0, 155, 0, var31 + 17), Enum.Font.SourceSansBold, 20, p34.MainText, 8)
	else
		var75 = createScrollingTextLabel("MainText", UDim2.new(1, var13.AbsoluteSize.X - 40, 0, 120), UDim2.new(0, 20, 0, var31 + 17), Enum.Font.SourceSansBold, 20, p34.MainText, 8)
	end
	var75.Parent = var13
	local rect = Rect.new(8, 8, 56, 56)
	local slice = Enum.ScaleType.Slice
	local var77 = if p34.CancelActive then createImageButtonWithText("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -138, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p34.ConfirmationText, Enum.Font.SourceSansBold) else createImageButtonWithText("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -64, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p34.ConfirmationText, Enum.Font.SourceSans)
	var77.Parent = var13
	var77.ScaleType = slice
	var77.SliceCenter = rect
	var77.MouseButton1Click:connect(function()
		OnPromptEnded(true)
	end)
	
	if p34.CancelActive then
		local var78 = createImageButtonWithText("CancelButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, 10, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p34.CancelText, Enum.Font.SourceSans)
		var78.Parent = var13
		var78.ScaleType = slice
		var78.SliceCenter = rect
		var78.MouseButton1Click:connect(function()
			OnPromptEnded(false)
		end)
	end
end

function CreatePromptFromOptions(p35)
	-- upvalues: var13 (write), var15 (write), var14 (ref), var17 (ref)
	var13:ClearAllChildren()
	
	if var15 or var14 then
		CreatePromptVRorConsole(p35)
		
		return
	elseif var17 then
		CreatePromptPhone(p35)
		
		return
	end
	CreatePromptPCorTablet(p35)
end

function SetSelectedObject()
	-- upvalues: var13 (write), guiService (ref)
	local cancelButton = var13:FindFirstChild("CancelButton")
	
	if cancelButton then
		guiService.SelectedCoreObject = cancelButton
		
		return
	end
	local confirmButton = var13:FindFirstChild("ConfirmButton")
	
	if confirmButton then
		guiService.SelectedCoreObject = confirmButton
	end
end

function OnTweenInFinished()
	-- upvalues: var20 (write), var14 (ref)
	if var20 or var14 then
		SetSelectedObject()
	end
end

function ConnectActiveEvents()
	-- upvalues: var15 (write), var20 (write), t_2 (write), userInputService (ref), guiService (ref), var19 (write), var21 (write), var22 (write), var23 (write)
	local function OnInputChanged(p36)
		-- upvalues: var15 (copy), var20 (copy)
		local userInputType = Enum.UserInputType
		
		if var15 or not valueInTable(p36.UserInputType, {
			userInputType.Gamepad1,
			userInputType.Gamepad2,
			userInputType.Gamepad3,
			userInputType.Gamepad4
		}) then
			var20 = false
		elseif p36.KeyCode ~= Enum.KeyCode.Thumbstick1 and p36.KeyCode ~= Enum.KeyCode.Thumbstick2 then
			var20 = true
			
			return
		elseif math.abs(p36.Position.X) > 0.1 or math.abs(p36.Position.Z) > 0.1 or math.abs(p36.Position.Y) > 0.1 then
			var20 = true
			
			return
		end
	end
	
	table.insert(t_2, userInputService.InputChanged:connect(OnInputChanged))
	table.insert(t_2, userInputService.InputBegan:connect(OnInputChanged))
	table.insert(t_2, guiService.Changed:connect(function(p37)
		-- upvalues: var19 (copy), guiService (copy), var21 (copy), var22 (copy), var23 (copy)
		if var19 then
			if p37 == "CoreGuiNavigationEnabled" then
				if guiService.CoreGuiNavigationEnabled == true then
					return
				else
					var21 = guiService.CoreGuiNavigationEnabled
					guiService.CoreGuiNavigationEnabled = true
					
					return
				end
			elseif p37 == "GuiNavigationEnabled" then
				if guiService.GuiNavigationEnabled == false then
				else
					var22 = guiService.GuiNavigationEnabled
					guiService.GuiNavigationEnabled = false
					
					return
				end
			elseif p37 == "AutoSelectGuiEnabled" and guiService.AutoSelectGuiEnabled ~= false then
				var23 = guiService.AutoSelectGuiEnabled
				guiService.AutoSelectGuiEnabled = false
			end
		end
	end))
end

function DisconnectActiveEvents()
	-- upvalues: t_2 (write)
	for i, v in ipairs(t_2) do
		v:Disconnect()
	end
	t_2 = {}
end

function ShowPrompt()
	-- upvalues: var12 (write), var14 (ref), userInputService (ref), var15 (write), var11 (write), dialogModule (ref), uDim2_2 (write)
	var12.Visible = true
	
	if var14 then
		userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
	end
	if not var15 then
		var12:TweenPositionInternal(uDim2_2, Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.3, true, OnTweenInFinished)
		DisableControllerMovement()
		EnableControllerInput()
		
		return
	elseif not var11 then
		var11 = dialogModule.new()
	end
	var12.Position = uDim2_2
	var11:SetContent(var12)
	var11:Show(true)
	DisableControllerMovement()
end

function HidePrompt()
	-- upvalues: var19 (write), guiService (ref), var21 (write), var22 (write), var23 (write), var14 (ref), userInputService (ref), promptCreatorTransientDialog (ref), var12 (write), var13 (write), var15 (write), uDim2_1 (write), var11 (write)
	local function onClosed()
		-- upvalues: var19 (copy), guiService (copy), var21 (copy), var22 (copy), var23 (copy), var14 (copy), userInputService (copy), promptCreatorTransientDialog (copy), var12 (copy), var13 (copy)
		var19 = false
		guiService.CoreGuiNavigationEnabled = var21
		guiService.GuiNavigationEnabled = var22
		guiService.AutoSelectGuiEnabled = var23
		guiService.SelectedCoreObject = nil
		
		if var14 then
			userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
		end
		if promptCreatorTransientDialog then
			DisconnectActiveEvents()
			
			if var12 then
				var12:Destroy()
				var12 = nil
				var13 = nil
				
				return
			end
		else
			var12.Visible = false
		end
	end
	
	if var15 then
		var12.Position = uDim2_1
		
		if var11 then
			var11:Close()
		end
		var19 = false
		guiService.CoreGuiNavigationEnabled = var21
		guiService.GuiNavigationEnabled = var22
		guiService.AutoSelectGuiEnabled = var23
		guiService.SelectedCoreObject = nil
		
		if var14 then
			userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
		end
		if not promptCreatorTransientDialog then
			var12.Visible = false
			
			return
		end
		DisconnectActiveEvents()
		
		if var12 then
			var12:Destroy()
			var12 = nil
			var13 = nil
			
			return
		end
	else
		var12:TweenPositionInternal(uDim2_1, Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.3, true, onClosed)
	end
end

function DoCreatePrompt(p38)
	-- upvalues: var25 (write), t_1 (ref), var26 (write)
	var25 = p38.PromptCompletedCallback
	AddDefaultsToPromptOptions(p38, t_1)
	var26 = p38
	CreatePromptFromOptions(p38)
	ShowPrompt()
end

function OnPromptEnded(p39)
	-- upvalues: var25 (write), var26 (write)
	if var25 then
		if var26.CancelActive then
			spawn(function()
				-- upvalues: var25 (copy), p39 (ref)
				var25(p39)
			end)
		else
			spawn(function()
				-- upvalues: var25 (copy)
				var25(true)
			end)
		end
	end
	HidePrompt()
	EnableControllerMovement()
	DisableControllerInput()
end

function NoOpFunc() end

function EnableControllerMovement()
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("doNothingThumbstick2PromptCreator")
	contextActionService:UnbindCoreAction("doNothingAButtonPromptCreator")
end

function DisableControllerMovement()
	-- upvalues: contextActionService (ref)
	contextActionService:BindCoreAction("doNothingThumbstick2PromptCreator", NoOpFunc, false, Enum.KeyCode.Thumbstick2)
	contextActionService:BindCoreAction("doNothingAButtonPromptCreator", NoOpFunc, false, Enum.KeyCode.ButtonA)
end

function EnableControllerInput()
	-- upvalues: contextActionService (ref), var26 (write), guiService (ref)
	contextActionService:BindCoreAction("CoreScriptPromptCreatorCancel", function(_, p40, _)
		-- upvalues: var26 (copy)
		if p40 ~= Enum.UserInputState.Begin then return end
		if var26.CancelActive then
			OnPromptEnded(false)
		end
	end, false, Enum.KeyCode.ButtonB)
	contextActionService:BindCoreAction("CoreScriptPromptCreatorSelect", function(_, p41, _)
		-- upvalues: guiService (copy)
		if p41 ~= Enum.UserInputState.Begin then return end
		if guiService.SelectedCoreObject == nil then
			SetSelectedObject()
		end
	end, false, Enum.KeyCode.ButtonSelect)
end

function DisableControllerInput()
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("CoreScriptPromptCreatorCancel")
	contextActionService:UnbindCoreAction("CoreScriptPromptCreatorSelect")
end

function valueInTable(p42, p43)
	for i, v in pairs(p43) do
		if v == p42 then
			return true
		end
	end
	return false
end

function SetupGamepadSelection()
	-- upvalues: var21 (write), guiService (ref), var22 (write), var23 (write)
	var21 = guiService.CoreGuiNavigationEnabled
	var22 = guiService.GuiNavigationEnabled
	var23 = guiService.AutoSelectGuiEnabled
	guiService.SelectedCoreObject = nil
	guiService.CoreGuiNavigationEnabled = true
	guiService.GuiNavigationEnabled = false
	guiService.AutoSelectGuiEnabled = false
end

if not promptCreatorTransientDialog then
	createPromptDialog()
	
	local function OnInputChanged(p44)
		-- upvalues: var15 (write), var20 (write)
		local userInputType = Enum.UserInputType
		
		if var15 or not valueInTable(p44.UserInputType, {
			userInputType.Gamepad1,
			userInputType.Gamepad2,
			userInputType.Gamepad3,
			userInputType.Gamepad4
		}) then
			var20 = false
		elseif p44.KeyCode ~= Enum.KeyCode.Thumbstick1 and p44.KeyCode ~= Enum.KeyCode.Thumbstick2 then
			var20 = true
			
			return
		elseif math.abs(p44.Position.X) > 0.1 or math.abs(p44.Position.Z) > 0.1 or math.abs(p44.Position.Y) > 0.1 then
			var20 = true
			
			return
		end
	end
	
	userInputService.InputChanged:connect(OnInputChanged)
	userInputService.InputBegan:connect(OnInputChanged)
	
	local _ = function(p45)
		-- upvalues: var11 (write), dialogModule (ref), var12 (write), var15 (write), robloxGui (ref)
		if p45 then
			if not var11 then
				var11 = dialogModule.new()
			end
			var11:SetContent(var12)
			var15 = true
			
			return
		else
			var15 = false
			
			if var11 then
				var11:SetContent(nil)
			end
			var12.Parent = robloxGui
		end
	end
	
	spawn(function()
		-- upvalues: userInputService (ref), var11 (write), dialogModule (ref), var12 (write), var15 (write), robloxGui (ref)
		if userInputService.VREnabled then
			if not var11 then
				var11 = dialogModule.new()
			end
			var11:SetContent(var12)
			var15 = true
			
			return
		else
			var15 = false
			
			if var11 then
				var11:SetContent(nil)
			end
			var12.Parent = robloxGui
		end
	end)
	userInputService.Changed:connect(function(p46)
		-- upvalues: userInputService (ref), var11 (write), dialogModule (ref), var12 (write), var15 (write), robloxGui (ref)
		if p46 == "VREnabled" then
			if userInputService.VREnabled then
				if not var11 then
					var11 = dialogModule.new()
				end
				var11:SetContent(var12)
				var15 = true
				
				return
			else
				var15 = false
				
				if var11 then
					var11:SetContent(nil)
				end
				var12.Parent = robloxGui
			end
		end
	end)
	guiService.Changed:connect(function(p47)
		-- upvalues: var19 (write), guiService (ref), var21 (write), var22 (write), var23 (write)
		if var19 then
			if p47 == "CoreGuiNavigationEnabled" then
				if guiService.CoreGuiNavigationEnabled == true then
					return
				else
					var21 = guiService.CoreGuiNavigationEnabled
					guiService.CoreGuiNavigationEnabled = true
					
					return
				end
			elseif p47 == "GuiNavigationEnabled" then
				if guiService.GuiNavigationEnabled == false then
				else
					var22 = guiService.GuiNavigationEnabled
					guiService.GuiNavigationEnabled = false
					
					return
				end
			elseif p47 == "AutoSelectGuiEnabled" and guiService.AutoSelectGuiEnabled ~= false then
				var23 = guiService.AutoSelectGuiEnabled
				guiService.AutoSelectGuiEnabled = false
			end
		end
	end)
end
function t.CreatePrompt(_, p48)
	-- upvalues: var19 (write), promptCreatorTransientDialog (ref), createPromptDialog (ref)
	if var19 then
		return false
	end
	var19 = true
	
	if promptCreatorTransientDialog then
		createPromptDialog()
		ConnectActiveEvents()
	end
	SetupGamepadSelection()
	DoCreatePrompt(p48)
	
	return true
end

function t.IsCurrentlyPrompting(_)
	-- upvalues: var19 (write)
	return var19
end

return t