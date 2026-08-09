local t = {}
local coreGuiService = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local contextActionService = game:GetService("ContextActionService")
local textService = game:GetService("TextService")
local guiService = game:GetService("GuiService")
local deprecateOldGuiObjectPropertiesEngineFeature = game:GetEngineFeature("DeprecateOldGuiObjectProperties")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local modules = robloxGui:WaitForChild("Modules")
local tenFootInterfaceModule = require(modules:WaitForChild("TenFootInterface"))
local dialogModule = require(modules:WaitForChild("VR"):WaitForChild("Dialog"))
local var11 = nil

function getViewportSize() --[[ line: 30 ]]
	while not game.Workspace.CurrentCamera do
		game.Workspace.Changed:Wait()
	end
	assert(game.Workspace.CurrentCamera, "")
	while game.Workspace.CurrentCamera.ViewportSize == Vector2.new(0, 0) or game.Workspace.CurrentCamera.ViewportSize == Vector2.new(1, 1) do
		game.Workspace.CurrentCamera.Changed:Wait()
	end
	return game.Workspace.CurrentCamera.ViewportSize
end

local var12 = tenFootInterfaceModule:IsEnabled()
local var13 = false
local var14 = userInputService.TouchEnabled == true and userInputService.MouseEnabled == false
local var15 = var14 and getViewportSize().Y <= 370
local var16 = var14 and not var15
local var17 = false
local var18 = false
local var19 = false
local var20 = false
local var21 = false
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
local var23 = nil
local var24 = nil
local uDim2 = UDim2.new(0, 438, 0, 300)
local uDim2_1 = UDim2.new(0.5, -219, 0, -300)
local uDim2_2 = UDim2.new(0.5, -219, 0.5, -150)

if var12 then
	uDim2 = UDim2.new(1, 0, 0, 690)
	uDim2_1 = UDim2.new(0, 0, 0, -690)
	uDim2_2 = UDim2.new(0, 0, 0.5, -345)
elseif var15 then
	uDim2 = UDim2.new(0.9, 0, 0.9, 0)
	uDim2_1 = UDim2.new(0.05, 0, -0.9, 0)
	uDim2_2 = UDim2.new(0.05, 0, 0.05, 0)
elseif var16 then
	uDim2 = UDim2.new(0, 400, 0, 305)
	uDim2_1 = UDim2.new(0.5, -200, 0, -305)
	uDim2_2 = UDim2.new(0.5, -200, 0.5, -152)
end
local var29
local var28 = if var15 then 44 else 52
local _ = 24

if var12 then
	var29 = 42
end
local function createFrame(p0, p1, p2, p3, p4) --[[ line: 121 ]]
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

local function createTextLabel(p5, p6, p7, p8, p9, p10) --[[ line: 134 ]]
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

local function createScrollingTextLabel(p11, p12, p13, p14, p15, p16, p17) --[[ line: 149 ]]
	-- upvalues: createTextLabel (ref), textService (ref)
	local var38 = createTextLabel(p11, p12, p13, p14, p15, p16)
	var38.TextXAlignment = Enum.TextXAlignment.Left
	var38.TextYAlignment = Enum.TextYAlignment.Top
	var38.TextWrapped = true
	
	if p12.Y.Offset < textService:GetTextSize(p16, p15, p14, Vector2.new(p12.X.Offset, 10000)).Y then
		local vector2 = Vector2.new(p12.X.Offset - (p17 + 20), 10000)
		local var40 = textService:GetTextSize(p16, p15, p14, vector2)
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
		emptySelectionImage.CanvasSize = UDim2.new(0, vector2.X - p17 * 2, 0, var40.Y)
		emptySelectionImage.ScrollBarThickness = p17
		emptySelectionImage.SelectionImageObject = Instance.new("ImageLabel")
		emptySelectionImage.SelectionImageObject.Name = "EmptySelectionImage"
		emptySelectionImage.SelectionImageObject.BackgroundTransparency = 1
		emptySelectionImage.SelectionImageObject.Image = ""
		emptySelectionImage.Active = false
		emptySelectionImage.SelectionGained:connect(function() --[[ line: 185 ]]
			-- upvalues: scrollingTextParent (ref)
			scrollingTextParent.BackgroundTransparency = 0.15
		end)
		emptySelectionImage.SelectionLost:connect(function() --[[ line: 189 ]]
			-- upvalues: scrollingTextParent (ref)
			scrollingTextParent.BackgroundTransparency = 1
		end)
		var38.Position = UDim2.new(0, 10, 0, 0)
		var38.Size = UDim2.new(0, vector2.X, 0, var40.Y)
		var38.Parent = emptySelectionImage
		emptySelectionImage.Parent = scrollingTextParent
		
		return scrollingTextParent
	end
	return var38
end

local function _(p18, p19, p20, p21, p22) --[[ line: 206 | named "createImageLabel" ]]
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

local function createImageButtonWithText(p23, p24, p25, p26, p27, p28, p29) --[[ line: 221 ]]
	-- upvalues: createTextLabel (ref), var29 (write)
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
	local var45 = createTextLabel(p23 .. "Text", UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), p29, var29, p28)
	var45.ZIndex = 9
	var45.Parent = emptySelectionImage
	emptySelectionImage.MouseEnter:connect(function() --[[ line: 241 ]]
		-- upvalues: emptySelectionImage (ref), p27 (ref)
		emptySelectionImage.Image = p27
	end)
	emptySelectionImage.MouseLeave:connect(function() --[[ line: 244 ]]
		-- upvalues: emptySelectionImage (ref), p26 (ref)
		emptySelectionImage.Image = p26
	end)
	emptySelectionImage.MouseButton1Click:connect(function() --[[ line: 247 ]]
		-- upvalues: emptySelectionImage (ref), p26 (ref)
		emptySelectionImage.Image = p26
	end)
	emptySelectionImage.SelectionGained:connect(function() --[[ line: 250 ]]
		-- upvalues: emptySelectionImage (ref), p27 (ref)
		emptySelectionImage.Image = p27
	end)
	emptySelectionImage.SelectionLost:connect(function() --[[ line: 253 ]]
		-- upvalues: emptySelectionImage (ref), p26 (ref)
		emptySelectionImage.Image = p26
	end)
	
	return emptySelectionImage
end

local var34 = createFrame("PromptDialog", uDim2, uDim2_1, 1, nil)
var34.Visible = false
var34.Parent = robloxGui
var34.Active = true
local var35 = createFrame("ContainerFrame", UDim2.new(1, 0, 1, 0), nil, 0.36, Color3.new(0, 0, 0))
var35.ZIndex = 8
var35.Parent = var34

function AddDefaultsToPromptOptions(p30, p31) --[[ line: 270 ]]
	for i, v in pairs(p31) do
		if p30[i] == nil then
			p30[i] = v
		end
	end
end

function CreatePromptVRorConsole(p32) --[[ line: 279 ]]
	-- upvalues: var35 (ref), createTextLabel (ref), createFrame (ref), createScrollingTextLabel (ref), createImageButtonWithText (ref)
	local var46 = 90
	
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
		local var50 = image
		var50.ZIndex = 9
		var50.Parent = var35
		var46 = 800
	end
	local var51 = createTextLabel("WindowTitle", UDim2.new(0, 800, 0, 60), UDim2.new(0, var46, 0, 60), Enum.Font.SourceSansBold, 48, p32.WindowTitle)
	var51.TextXAlignment = Enum.TextXAlignment.Left
	var51.TextYAlignment = Enum.TextYAlignment.Center
	var51.Parent = var35
	var51.ZIndex = 9
	local var52 = createFrame("ColorStripe", UDim2.new(0, 832, 0, 4), UDim2.new(0, var46, 0, 120), 0, p32.StripeColor)
	var52.ZIndex = 9
	var52.Parent = var35
	createScrollingTextLabel("MainText", UDim2.new(0, 800, 0, 450), UDim2.new(0, var46, 0, 152), Enum.Font.SourceSansBold, 44, p32.MainText, 16).Parent = var35
	local rect = Rect.new(8, 8, 56, 56)
	local slice = Enum.ScaleType.Slice
	local var54 = createImageButtonWithText("ConfirmButton", UDim2.new(0, 320, 0, 80), UDim2.new(0, var46, 1, -125), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p32.ConfirmationText, Enum.Font.SourceSans)
	var54.Parent = var35
	var54.ScaleType = slice
	var54.SliceCenter = rect
	var54.MouseButton1Click:connect(function() --[[ line: 316 ]]
		OnPromptEnded(true)
	end)
	
	if p32.CancelActive then
		local var55 = createImageButtonWithText("CancelButton", UDim2.new(0, 320, 0, 80), UDim2.new(0, var46 + 340, 1, -125), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p32.CancelText, Enum.Font.SourceSans)
		var55.Parent = var35
		var55.ScaleType = slice
		var55.SliceCenter = rect
		var55.MouseButton1Click:connect(function() --[[ line: 328 ]]
			OnPromptEnded(false)
		end)
	end
end

function CreatePromptPCorTablet(p33) --[[ line: 334 ]]
	-- upvalues: createTextLabel (ref), var28 (write), var35 (ref), createFrame (ref), var16 (ref), createScrollingTextLabel (ref), createImageButtonWithText (ref)
	local var62
	local var56 = createTextLabel("WindowTitle", UDim2.new(1, 0, 0, var28), UDim2.new(0, 0, 0, 0), Enum.Font.SourceSansBold, 24, p33.WindowTitle)
	var56.Parent = var35
	var56.ZIndex = 9
	local var57 = createFrame("ColorStripe", UDim2.new(1, 0, 0, 2), nil, 0, p33.StripeColor)
	var57.Position = UDim2.new(0, 0, 0, var28)
	var57.ZIndex = 9
	var57.Parent = var35
	local _ = nil
	local _ = nil
	
	if p33.Image then
		local uDim2 = UDim2.new(0, 150, 0, 150)
		local uDim2_1 = UDim2.new(0, 15, 0, var28 + 17)
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
		local var61 = image_1
		var61.ZIndex = 9
		var61.Parent = var35
		var62 = if var16 then createScrollingTextLabel("MainText", UDim2.new(0, 195, 0, 150), UDim2.new(0, 185, 0, var28 + 17), Enum.Font.SourceSansBold, 22, p33.MainText, 8) else createScrollingTextLabel("MainText", UDim2.new(0, 233, 0, 150), UDim2.new(0, 185, 0, var28 + 17), Enum.Font.SourceSansBold, 22, p33.MainText, 8)
	else
		var62 = if var16 then createScrollingTextLabel("MainText", UDim2.new(0, 360, 0, 150), UDim2.new(0, 20, 0, var28 + 17), Enum.Font.SourceSansBold, 22, p33.MainText, 8) else createScrollingTextLabel("MainText", UDim2.new(0, 398, 0, 150), UDim2.new(0, 20, 0, var28 + 17), Enum.Font.SourceSansBold, 22, p33.MainText, 8)
	end
	var62.Parent = var35
	local rect = Rect.new(8, 8, 56, 56)
	local slice = Enum.ScaleType.Slice
	local var64 = if var16 then if p33.CancelActive then createImageButtonWithText("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -138, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p33.ConfirmationText, Enum.Font.SourceSansBold) else createImageButtonWithText("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -64, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p33.ConfirmationText, Enum.Font.SourceSans) elseif p33.CancelActive then createImageButtonWithText("ConfirmButton", UDim2.new(0, 128, 0, 38), UDim2.new(0.5, -138, 1, -53), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p33.ConfirmationText, Enum.Font.SourceSansBold) else createImageButtonWithText("ConfirmButton", UDim2.new(0, 128, 0, 38), UDim2.new(0.5, -64, 1, -53), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p33.ConfirmationText, Enum.Font.SourceSans)
	var64.Parent = var35
	var64.ScaleType = slice
	var64.SliceCenter = rect
	var64.MouseButton1Click:connect(function() --[[ line: 400 ]]
		OnPromptEnded(true)
	end)
	
	if p33.CancelActive then
		local var65 = if var16 then createImageButtonWithText("CancelButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, 10, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p33.CancelText, Enum.Font.SourceSans) else createImageButtonWithText("CancelButton", UDim2.new(0, 128, 0, 38), UDim2.new(0.5, 10, 1, -53), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p33.CancelText, Enum.Font.SourceSans)
		var65.Parent = var35
		var65.ScaleType = slice
		var65.SliceCenter = rect
		var65.MouseButton1Click:connect(function() --[[ line: 418 ]]
			OnPromptEnded(false)
		end)
		var65.NextSelectionLeft = var64
		var64.NextSelectionRight = var65
	end
end

function CreatePromptPhone(p34) --[[ line: 427 ]]
	-- upvalues: createTextLabel (ref), var28 (write), var35 (ref), createFrame (ref), createScrollingTextLabel (ref), createImageButtonWithText (ref)
	local var72
	local var66 = createTextLabel("WindowTitle", UDim2.new(1, 0, 0, var28), UDim2.new(0, 0, 0, 0), Enum.Font.SourceSansBold, 24, p34.WindowTitle)
	var66.Parent = var35
	var66.ZIndex = 9
	local var67 = createFrame("ColorStripe", UDim2.new(1, 0, 0, 2), nil, 0, p34.StripeColor)
	var67.Position = UDim2.new(0, 0, 0, var28)
	var67.ZIndex = 9
	var67.Parent = var35
	local _ = nil
	local _ = nil
	
	if p34.Image then
		local uDim2 = UDim2.new(0, 120, 0, 120)
		local uDim2_1 = UDim2.new(0, 15, 0, var28 + 17)
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
		local var71 = image_1
		var71.ZIndex = 9
		var71.Parent = var35
		var72 = createScrollingTextLabel("MainText", UDim2.new(0, var35.AbsoluteSize.X - 175, 0, 120), UDim2.new(0, 155, 0, var28 + 17), Enum.Font.SourceSansBold, 20, p34.MainText, 8)
	else
		var72 = createScrollingTextLabel("MainText", UDim2.new(1, var35.AbsoluteSize.X - 40, 0, 120), UDim2.new(0, 20, 0, var28 + 17), Enum.Font.SourceSansBold, 20, p34.MainText, 8)
	end
	var72.Parent = var35
	local rect = Rect.new(8, 8, 56, 56)
	local slice = Enum.ScaleType.Slice
	local var74 = if p34.CancelActive then createImageButtonWithText("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -138, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p34.ConfirmationText, Enum.Font.SourceSansBold) else createImageButtonWithText("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -64, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p34.ConfirmationText, Enum.Font.SourceSans)
	var74.Parent = var35
	var74.ScaleType = slice
	var74.SliceCenter = rect
	var74.MouseButton1Click:connect(function() --[[ line: 473 ]]
		OnPromptEnded(true)
	end)
	
	if p34.CancelActive then
		local var75 = createImageButtonWithText("CancelButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, 10, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p34.CancelText, Enum.Font.SourceSans)
		var75.Parent = var35
		var75.ScaleType = slice
		var75.SliceCenter = rect
		var75.MouseButton1Click:connect(function() --[[ line: 484 ]]
			OnPromptEnded(false)
		end)
	end
end

function CreatePromptFromOptions(p35) --[[ line: 490 ]]
	-- upvalues: var35 (ref), var13 (write), var12 (ref), var15 (ref)
	var35:ClearAllChildren()
	
	if var13 or var12 then
		CreatePromptVRorConsole(p35)
		
		return
	elseif var15 then
		CreatePromptPhone(p35)
		
		return
	end
	CreatePromptPCorTablet(p35)
end

function SetSelectedObject() --[[ line: 502 ]]
	-- upvalues: var35 (ref), guiService (ref)
	local cancelButton = var35:FindFirstChild("CancelButton")
	
	if cancelButton then
		guiService.SelectedCoreObject = cancelButton
		
		return
	end
	local confirmButton = var35:FindFirstChild("ConfirmButton")
	
	if confirmButton then
		guiService.SelectedCoreObject = confirmButton
	end
end

function OnTweenInFinished() --[[ line: 514 ]]
	-- upvalues: var18 (write), var12 (ref)
	if var18 or var12 then
		SetSelectedObject()
	end
end

function ShowPrompt() --[[ line: 520 ]]
	-- upvalues: var34 (ref), var12 (ref), userInputService (ref), var13 (write), uDim2_2 (write), var11 (write), deprecateOldGuiObjectPropertiesEngineFeature (ref)
	var34.Visible = true
	
	if var12 then
		userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
	end
	if var13 then
		var34.Position = uDim2_2
		var11:SetContent(var34)
		var11:Show(true)
		DisableControllerMovement()
		
		return
	elseif deprecateOldGuiObjectPropertiesEngineFeature then
		var34:TweenPositionInternal(uDim2_2, Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.3, true, OnTweenInFinished)
	else
		var34:TweenPosition(uDim2_2, Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.3, true, OnTweenInFinished)
	end
	DisableControllerMovement()
	EnableControllerInput()
end

function HidePrompt() --[[ line: 541 ]]
	-- upvalues: var34 (ref), var17 (write), guiService (ref), var19 (write), var20 (write), var21 (write), var12 (ref), userInputService (ref), var13 (write), uDim2_1 (write), var11 (write), deprecateOldGuiObjectPropertiesEngineFeature (ref)
	local function onClosed() --[[ line: 542 ]]
		-- upvalues: var34 (copy), var17 (copy), guiService (copy), var19 (copy), var20 (copy), var21 (copy), var12 (copy), userInputService (copy)
		var34.Visible = false
		var17 = false
		guiService.CoreGuiNavigationEnabled = var19
		guiService.GuiNavigationEnabled = var20
		guiService.AutoSelectGuiEnabled = var21
		guiService.SelectedCoreObject = nil
		
		if var12 then
			userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
		end
	end
	
	if var13 then
		var34.Position = uDim2_1
		var11:Close()
		var34.Visible = false
		var17 = false
		guiService.CoreGuiNavigationEnabled = var19
		guiService.GuiNavigationEnabled = var20
		guiService.AutoSelectGuiEnabled = var21
		guiService.SelectedCoreObject = nil
		
		if var12 then
			userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
			
			return
		end
	elseif deprecateOldGuiObjectPropertiesEngineFeature then
		var34:TweenPositionInternal(uDim2_1, Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.3, true, onClosed)
		
		return
	end
	var34:TweenPosition(uDim2_1, Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.3, true, onClosed)
end

function DoCreatePrompt(p36) --[[ line: 566 ]]
	-- upvalues: var23 (write), t_1 (ref), var24 (write)
	var23 = p36.PromptCompletedCallback
	AddDefaultsToPromptOptions(p36, t_1)
	var24 = p36
	CreatePromptFromOptions(p36)
	ShowPrompt()
end

function OnPromptEnded(p37) --[[ line: 574 ]]
	-- upvalues: var23 (write), var24 (write)
	if var23 then
		if var24.CancelActive then
			spawn(function() --[[ line: 577 ]]
				-- upvalues: var23 (copy), p37 (ref)
				var23(p37)
			end)
		else
			spawn(function() --[[ line: 579 ]]
				-- upvalues: var23 (copy)
				var23(true)
			end)
		end
	end
	HidePrompt()
	EnableControllerMovement()
	DisableControllerInput()
end

function NoOpFunc() --[[ line: 589 ]] end

function EnableControllerMovement() --[[ line: 591 ]]
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("doNothingThumbstick2PromptCreator")
	contextActionService:UnbindCoreAction("doNothingAButtonPromptCreator")
end

function DisableControllerMovement() --[[ line: 596 ]]
	-- upvalues: contextActionService (ref)
	contextActionService:BindCoreAction("doNothingThumbstick2PromptCreator", NoOpFunc, false, Enum.KeyCode.Thumbstick2)
	contextActionService:BindCoreAction("doNothingAButtonPromptCreator", NoOpFunc, false, Enum.KeyCode.ButtonA)
end

function EnableControllerInput() --[[ line: 601 ]]
	-- upvalues: contextActionService (ref), var24 (write), guiService (ref)
	contextActionService:BindCoreAction("CoreScriptPromptCreatorCancel", function(_, p38, _) --[[ line: 605 ]]
		-- upvalues: var24 (copy)
		if p38 ~= Enum.UserInputState.Begin then return end
		if var24.CancelActive then
			OnPromptEnded(false)
		end
	end, false, Enum.KeyCode.ButtonB)
	contextActionService:BindCoreAction("CoreScriptPromptCreatorSelect", function(_, p39, _) --[[ line: 618 ]]
		-- upvalues: guiService (copy)
		if p39 ~= Enum.UserInputState.Begin then return end
		if guiService.SelectedCoreObject == nil then
			SetSelectedObject()
		end
	end, false, Enum.KeyCode.ButtonSelect)
end

function DisableControllerInput() --[[ line: 630 ]]
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("CoreScriptPromptCreatorCancel")
	contextActionService:UnbindCoreAction("CoreScriptPromptCreatorSelect")
end

function valueInTable(p40, p41) --[[ line: 635 ]]
	for i, v in pairs(p41) do
		if v == p40 then
			return true
		end
	end
	return false
end

function OnInputChanged(p42) --[[ line: 644 ]]
	-- upvalues: var13 (write), var18 (write)
	local userInputType = Enum.UserInputType
	
	if var13 or not valueInTable(p42.UserInputType, {
		userInputType.Gamepad1,
		userInputType.Gamepad2,
		userInputType.Gamepad3,
		userInputType.Gamepad4
	}) then
		var18 = false
	elseif p42.KeyCode ~= Enum.KeyCode.Thumbstick1 and p42.KeyCode ~= Enum.KeyCode.Thumbstick2 then
		var18 = true
		
		return
	elseif math.abs(p42.Position.X) > 0.1 or math.abs(p42.Position.Z) > 0.1 or math.abs(p42.Position.Y) > 0.1 then
		var18 = true
		
		return
	end
end

userInputService.InputChanged:connect(OnInputChanged)
userInputService.InputBegan:connect(OnInputChanged)

function OnVREnabled(p43) --[[ line: 663 ]]
	-- upvalues: var11 (write), dialogModule (ref), var34 (ref), var13 (write), robloxGui (ref)
	if p43 then
		if not var11 then
			var11 = dialogModule.new()
		end
		var11:SetContent(var34)
		var13 = true
		
		return
	else
		var13 = false
		
		if var11 then
			var11:SetContent(nil)
		end
		var34.Parent = robloxGui
	end
end

spawn(function() --[[ line: 679 ]]
	-- upvalues: userInputService (ref)
	OnVREnabled(userInputService.VREnabled)
end)
userInputService.Changed:connect(function(p44) --[[ line: 683 ]]
	-- upvalues: userInputService (ref)
	if p44 == "VREnabled" then
		OnVREnabled(userInputService.VREnabled)
	end
end)
guiService.Changed:connect(function(p45) --[[ line: 689 ]]
	-- upvalues: var17 (write), guiService (ref), var19 (write), var20 (write), var21 (write)
	if var17 then
		if p45 == "CoreGuiNavigationEnabled" then
			if guiService.CoreGuiNavigationEnabled == true then
				return
			else
				var19 = guiService.CoreGuiNavigationEnabled
				guiService.CoreGuiNavigationEnabled = true
				
				return
			end
		elseif p45 == "GuiNavigationEnabled" then
			if guiService.GuiNavigationEnabled == false then
			else
				var20 = guiService.GuiNavigationEnabled
				guiService.GuiNavigationEnabled = false
				
				return
			end
		elseif p45 == "AutoSelectGuiEnabled" and guiService.AutoSelectGuiEnabled ~= false then
			var21 = guiService.AutoSelectGuiEnabled
			guiService.AutoSelectGuiEnabled = false
		end
	end
end)

function SetupGamepadSelection() --[[ line: 710 ]]
	-- upvalues: var19 (write), guiService (ref), var20 (write), var21 (write)
	var19 = guiService.CoreGuiNavigationEnabled
	var20 = guiService.GuiNavigationEnabled
	var21 = guiService.AutoSelectGuiEnabled
	guiService.SelectedCoreObject = nil
	guiService.CoreGuiNavigationEnabled = true
	guiService.GuiNavigationEnabled = false
	guiService.AutoSelectGuiEnabled = false
end

function t.CreatePrompt(_, p46) --[[ line: 722 ]]
	-- upvalues: var17 (write)
	if var17 then
		return false
	end
	var17 = true
	SetupGamepadSelection()
	DoCreatePrompt(p46)
	
	return true
end

function t.IsCurrentlyPrompting(_) --[[ line: 732 ]]
	-- upvalues: var17 (write)
	return var17
end

return t