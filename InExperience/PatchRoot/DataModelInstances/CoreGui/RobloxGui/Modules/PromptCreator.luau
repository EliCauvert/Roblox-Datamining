local var1
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
local var2 = nil
local var3 = nil
local var4 = nil

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

local var5 = tenFootInterfaceModule:IsEnabled()
local var6 = false
local var7 = userInputService.TouchEnabled == true and userInputService.MouseEnabled == false
local var8 = var7 and getViewportSize().Y <= 370
local var9 = var7 and not var8
local var10 = false
local var11 = false
local var12 = false
local var13 = false
local var14 = false
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
local var15 = nil
local var16 = nil
local t_2 = {}
local uDim2 = UDim2.new(0, 438, 0, 300)
local uDim2_1 = UDim2.new(0.5, -219, 0, -300)
local uDim2_2 = UDim2.new(0.5, -219, 0.5, -150)
local var17 = 52
local _ = 24

if var5 then
	uDim2 = UDim2.new(1, 0, 0, 690)
	uDim2_1 = UDim2.new(0, 0, 0, -690)
	uDim2_2 = UDim2.new(0, 0, 0.5, -345)
elseif var8 then
	uDim2 = UDim2.new(0.9, 0, 0.9, 0)
	uDim2_1 = UDim2.new(0.05, 0, -0.9, 0)
	uDim2_2 = UDim2.new(0.05, 0, 0.05, 0)
elseif var9 then
	uDim2 = UDim2.new(0, 400, 0, 305)
	uDim2_1 = UDim2.new(0.5, -200, 0, -305)
	uDim2_2 = UDim2.new(0.5, -200, 0.5, -152)
end
if var8 then
	var17 = 44
end
if var5 then
	var1 = 42
end
local function createFrame(p1, p2, p3, p4, p5)
	local frame = Instance.new("Frame")
	frame.Name = p1
	frame.Size = p2
	frame.Position = p3 or UDim2.new(0, 0, 0, 0)
	frame.BackgroundTransparency = p4
	frame.BackgroundColor3 = p5 or Color3.new()
	frame.BorderSizePixel = 0
	frame.ZIndex = 8
	
	return frame
end

local function createTextLabel(p1, p2, p3, p4, p5, p6)
	local textLabel = Instance.new("TextLabel")
	textLabel.Name = p1
	textLabel.Size = p2 or UDim2.new(0, 0, 0, 0)
	textLabel.Position = p3
	textLabel.BackgroundTransparency = 1
	textLabel.Font = p4
	textLabel.TextSize = p5
	textLabel.TextColor3 = Color3.new(1, 1, 1)
	textLabel.Text = p6
	textLabel.ZIndex = 8
	
	return textLabel
end

local function createScrollingTextLabel(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: createTextLabel (ref), textService (ref)
	local var18 = createTextLabel(p1, p2, p3, p4, p5, p6)
	var18.TextXAlignment = Enum.TextXAlignment.Left
	var18.TextYAlignment = Enum.TextYAlignment.Top
	var18.TextWrapped = true
	
	if p2.Y.Offset < textService:GetTextSize(p6, p5, p4, Vector2.new(p2.X.Offset, 10000)).Y then
		local vector2 = Vector2.new(p2.X.Offset - (p7 + 20), 10000)
		local var19 = textService:GetTextSize(p6, p5, p4, vector2)
		local scrollingTextParent = Instance.new("Frame")
		scrollingTextParent.Name = "ScrollingTextParent"
		scrollingTextParent.BackgroundTransparency = 1
		scrollingTextParent.BackgroundColor3 = Color3.new(1, 1, 1)
		scrollingTextParent.BorderSizePixel = 0
		scrollingTextParent.Position = p3
		scrollingTextParent.Size = p2 - UDim2.new(0, p7 * 2, 0, 0)
		local emptySelectionImage = Instance.new("ScrollingFrame")
		emptySelectionImage.Selectable = true
		emptySelectionImage.Name = "ScrollingFrame"
		emptySelectionImage.BackgroundTransparency = 1
		emptySelectionImage.BackgroundColor3 = Color3.new(1, 1, 1)
		emptySelectionImage.BorderSizePixel = 0
		emptySelectionImage.Position = UDim2.new(0, 0, 0, 0)
		emptySelectionImage.Size = p2
		emptySelectionImage.CanvasSize = UDim2.new(0, vector2.X - p7 * 2, 0, var19.Y)
		emptySelectionImage.ScrollBarThickness = p7
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
		var18.Position = UDim2.new(0, 10, 0, 0)
		var18.Size = UDim2.new(0, vector2.X, 0, var19.Y)
		var18.Parent = emptySelectionImage
		emptySelectionImage.Parent = scrollingTextParent
		
		return scrollingTextParent
	end
	return var18
end

local function _(p1, p2, p3, p4, p5)
	local imageLabel = Instance.new("ImageLabel")
	imageLabel.Name = p1
	imageLabel.Size = p2
	imageLabel.BackgroundTransparency = 1
	imageLabel.Position = p3
	imageLabel.Image = p4
	
	if p5 then
		p5(imageLabel)
	end
	return imageLabel
end

local function createImageButtonWithText(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: createTextLabel (ref), var1 (write)
	local emptySelectionImage = Instance.new("ImageButton")
	emptySelectionImage.Name = p1
	emptySelectionImage.Size = p2
	emptySelectionImage.Position = p3
	emptySelectionImage.Image = p4
	emptySelectionImage.BackgroundTransparency = 1
	emptySelectionImage.AutoButtonColor = false
	emptySelectionImage.ZIndex = 8
	emptySelectionImage.Modal = true
	emptySelectionImage.Selectable = true
	emptySelectionImage.SelectionImageObject = Instance.new("ImageLabel")
	emptySelectionImage.SelectionImageObject.Name = "EmptySelectionImage"
	emptySelectionImage.SelectionImageObject.BackgroundTransparency = 1
	emptySelectionImage.SelectionImageObject.Image = ""
	local var18 = createTextLabel(p1 .. "Text", UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), p7, var1, p6)
	var18.ZIndex = 9
	var18.Parent = emptySelectionImage
	emptySelectionImage.MouseEnter:connect(function()
		-- upvalues: emptySelectionImage (ref), p5 (ref)
		emptySelectionImage.Image = p5
	end)
	emptySelectionImage.MouseLeave:connect(function()
		-- upvalues: emptySelectionImage (ref), p4 (ref)
		emptySelectionImage.Image = p4
	end)
	emptySelectionImage.MouseButton1Click:connect(function()
		-- upvalues: emptySelectionImage (ref), p4 (ref)
		emptySelectionImage.Image = p4
	end)
	emptySelectionImage.SelectionGained:connect(function()
		-- upvalues: emptySelectionImage (ref), p5 (ref)
		emptySelectionImage.Image = p5
	end)
	emptySelectionImage.SelectionLost:connect(function()
		-- upvalues: emptySelectionImage (ref), p4 (ref)
		emptySelectionImage.Image = p4
	end)
	
	return emptySelectionImage
end

local function createPromptDialog()
	-- upvalues: var3 (write), createFrame (ref), uDim2 (write), uDim2_1 (write), robloxGui (ref), var4 (write)
	var3 = createFrame("PromptDialog", uDim2, uDim2_1, 1, nil)
	var3.Visible = false
	var3.Active = true
	var3.Parent = robloxGui
	var4 = createFrame("ContainerFrame", UDim2.new(1, 0, 1, 0), nil, 0.36, Color3.new(0, 0, 0))
	var4.ZIndex = 8
	var4.Parent = var3
end

local _ = function()
	-- upvalues: var3 (write), var4 (write)
	if var3 then
		var3:Destroy()
		var3 = nil
		var4 = nil
	end
end

function AddDefaultsToPromptOptions(p1, p2)
	for i, v in pairs(p2) do
		if p1[i] == nil then
			p1[i] = v
		end
	end
end

function CreatePromptVRorConsole(p3)
	-- upvalues: var4 (write), createTextLabel (ref), createFrame (ref), createScrollingTextLabel (ref), createImageButtonWithText (ref)
	local var18 = 90
	
	if p3.ImageConsoleVR then
		local uDim2 = UDim2.new(0, 600, 0, 600)
		local uDim2_1 = UDim2.new(0, 100, 0, 45)
		local imageConsoleVR = p3.ImageConsoleVR
		local fetchImageFunctionConsoleVR = p3.FetchImageFunctionConsoleVR
		local image = Instance.new("ImageLabel")
		image.Name = "Image"
		image.Size = uDim2
		image.BackgroundTransparency = 1
		image.Position = uDim2_1
		image.Image = imageConsoleVR
		
		if fetchImageFunctionConsoleVR then
			fetchImageFunctionConsoleVR(image)
		end
		local var19 = image
		var19.ZIndex = 9
		var19.Parent = var4
		var18 = 800
	end
	local var20 = createTextLabel("WindowTitle", UDim2.new(0, 800, 0, 60), UDim2.new(0, var18, 0, 60), Enum.Font.SourceSansBold, 48, p3.WindowTitle)
	var20.TextXAlignment = Enum.TextXAlignment.Left
	var20.TextYAlignment = Enum.TextYAlignment.Center
	var20.Parent = var4
	var20.ZIndex = 9
	local var21 = createFrame("ColorStripe", UDim2.new(0, 832, 0, 4), UDim2.new(0, var18, 0, 120), 0, p3.StripeColor)
	var21.ZIndex = 9
	var21.Parent = var4
	createScrollingTextLabel("MainText", UDim2.new(0, 800, 0, 450), UDim2.new(0, var18, 0, 152), Enum.Font.SourceSansBold, 44, p3.MainText, 16).Parent = var4
	local rect = Rect.new(8, 8, 56, 56)
	local slice = Enum.ScaleType.Slice
	local var22 = createImageButtonWithText("ConfirmButton", UDim2.new(0, 320, 0, 80), UDim2.new(0, var18, 1, -125), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p3.ConfirmationText, Enum.Font.SourceSans)
	var22.Parent = var4
	var22.ScaleType = slice
	var22.SliceCenter = rect
	var22.MouseButton1Click:connect(function()
		OnPromptEnded(true)
	end)
	
	if p3.CancelActive then
		local var23 = createImageButtonWithText("CancelButton", UDim2.new(0, 320, 0, 80), UDim2.new(0, var18 + 340, 1, -125), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p3.CancelText, Enum.Font.SourceSans)
		var23.Parent = var4
		var23.ScaleType = slice
		var23.SliceCenter = rect
		var23.MouseButton1Click:connect(function()
			OnPromptEnded(false)
		end)
	end
end

function CreatePromptPCorTablet(p3)
	-- upvalues: createTextLabel (ref), var17 (write), var4 (write), createFrame (ref), var9 (ref), createScrollingTextLabel (ref), createImageButtonWithText (ref)
	local var18
	local var19 = createTextLabel("WindowTitle", UDim2.new(1, 0, 0, var17), UDim2.new(0, 0, 0, 0), Enum.Font.SourceSansBold, 24, p3.WindowTitle)
	var19.Parent = var4
	var19.ZIndex = 9
	local var20 = createFrame("ColorStripe", UDim2.new(1, 0, 0, 2), nil, 0, p3.StripeColor)
	var20.Position = UDim2.new(0, 0, 0, var17)
	var20.ZIndex = 9
	var20.Parent = var4
	local _ = nil
	local _ = nil
	
	if p3.Image then
		local uDim2 = UDim2.new(0, 150, 0, 150)
		local uDim2_1 = UDim2.new(0, 15, 0, var17 + 17)
		local image = p3.Image
		local fetchImageFunction = p3.FetchImageFunction
		local image_1 = Instance.new("ImageLabel")
		image_1.Name = "Image"
		image_1.Size = uDim2
		image_1.BackgroundTransparency = 1
		image_1.Position = uDim2_1
		image_1.Image = image
		
		if fetchImageFunction then
			fetchImageFunction(image_1)
		end
		local var21 = image_1
		var21.ZIndex = 9
		var21.Parent = var4
		var18 = if var9 then createScrollingTextLabel("MainText", UDim2.new(0, 195, 0, 150), UDim2.new(0, 185, 0, var17 + 17), Enum.Font.SourceSansBold, 22, p3.MainText, 8) else createScrollingTextLabel("MainText", UDim2.new(0, 233, 0, 150), UDim2.new(0, 185, 0, var17 + 17), Enum.Font.SourceSansBold, 22, p3.MainText, 8)
	else
		var18 = if var9 then createScrollingTextLabel("MainText", UDim2.new(0, 360, 0, 150), UDim2.new(0, 20, 0, var17 + 17), Enum.Font.SourceSansBold, 22, p3.MainText, 8) else createScrollingTextLabel("MainText", UDim2.new(0, 398, 0, 150), UDim2.new(0, 20, 0, var17 + 17), Enum.Font.SourceSansBold, 22, p3.MainText, 8)
	end
	var18.Parent = var4
	local rect = Rect.new(8, 8, 56, 56)
	local slice = Enum.ScaleType.Slice
	local var22 = if var9 then if p3.CancelActive then createImageButtonWithText("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -138, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p3.ConfirmationText, Enum.Font.SourceSansBold) else createImageButtonWithText("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -64, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p3.ConfirmationText, Enum.Font.SourceSans) elseif p3.CancelActive then createImageButtonWithText("ConfirmButton", UDim2.new(0, 128, 0, 38), UDim2.new(0.5, -138, 1, -53), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p3.ConfirmationText, Enum.Font.SourceSansBold) else createImageButtonWithText("ConfirmButton", UDim2.new(0, 128, 0, 38), UDim2.new(0.5, -64, 1, -53), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p3.ConfirmationText, Enum.Font.SourceSans)
	var22.Parent = var4
	var22.ScaleType = slice
	var22.SliceCenter = rect
	var22.MouseButton1Click:connect(function()
		OnPromptEnded(true)
	end)
	
	if p3.CancelActive then
		local var23 = if var9 then createImageButtonWithText("CancelButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, 10, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p3.CancelText, Enum.Font.SourceSans) else createImageButtonWithText("CancelButton", UDim2.new(0, 128, 0, 38), UDim2.new(0.5, 10, 1, -53), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p3.CancelText, Enum.Font.SourceSans)
		var23.Parent = var4
		var23.ScaleType = slice
		var23.SliceCenter = rect
		var23.MouseButton1Click:connect(function()
			OnPromptEnded(false)
		end)
		var23.NextSelectionLeft = var22
		var22.NextSelectionRight = var23
	end
end

function CreatePromptPhone(p3)
	-- upvalues: createTextLabel (ref), var17 (write), var4 (write), createFrame (ref), createScrollingTextLabel (ref), createImageButtonWithText (ref)
	local var18
	local var19 = createTextLabel("WindowTitle", UDim2.new(1, 0, 0, var17), UDim2.new(0, 0, 0, 0), Enum.Font.SourceSansBold, 24, p3.WindowTitle)
	var19.Parent = var4
	var19.ZIndex = 9
	local var20 = createFrame("ColorStripe", UDim2.new(1, 0, 0, 2), nil, 0, p3.StripeColor)
	var20.Position = UDim2.new(0, 0, 0, var17)
	var20.ZIndex = 9
	var20.Parent = var4
	local _ = nil
	local _ = nil
	
	if p3.Image then
		local uDim2 = UDim2.new(0, 120, 0, 120)
		local uDim2_1 = UDim2.new(0, 15, 0, var17 + 17)
		local image = p3.Image
		local fetchImageFunction = p3.FetchImageFunction
		local image_1 = Instance.new("ImageLabel")
		image_1.Name = "Image"
		image_1.Size = uDim2
		image_1.BackgroundTransparency = 1
		image_1.Position = uDim2_1
		image_1.Image = image
		
		if fetchImageFunction then
			fetchImageFunction(image_1)
		end
		local var21 = image_1
		var21.ZIndex = 9
		var21.Parent = var4
		var18 = createScrollingTextLabel("MainText", UDim2.new(0, var4.AbsoluteSize.X - 175, 0, 120), UDim2.new(0, 155, 0, var17 + 17), Enum.Font.SourceSansBold, 20, p3.MainText, 8)
	else
		var18 = createScrollingTextLabel("MainText", UDim2.new(1, var4.AbsoluteSize.X - 40, 0, 120), UDim2.new(0, 20, 0, var17 + 17), Enum.Font.SourceSansBold, 20, p3.MainText, 8)
	end
	var18.Parent = var4
	local rect = Rect.new(8, 8, 56, 56)
	local slice = Enum.ScaleType.Slice
	local var22 = if p3.CancelActive then createImageButtonWithText("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -138, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p3.ConfirmationText, Enum.Font.SourceSansBold) else createImageButtonWithText("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -64, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p3.ConfirmationText, Enum.Font.SourceSans)
	var22.Parent = var4
	var22.ScaleType = slice
	var22.SliceCenter = rect
	var22.MouseButton1Click:connect(function()
		OnPromptEnded(true)
	end)
	
	if p3.CancelActive then
		local var23 = createImageButtonWithText("CancelButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, 10, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", p3.CancelText, Enum.Font.SourceSans)
		var23.Parent = var4
		var23.ScaleType = slice
		var23.SliceCenter = rect
		var23.MouseButton1Click:connect(function()
			OnPromptEnded(false)
		end)
	end
end

function CreatePromptFromOptions(p3)
	-- upvalues: var4 (write), var6 (write), var5 (ref), var8 (ref)
	var4:ClearAllChildren()
	
	if var6 or var5 then
		CreatePromptVRorConsole(p3)
		
		return
	elseif var8 then
		CreatePromptPhone(p3)
		
		return
	end
	CreatePromptPCorTablet(p3)
end

function SetSelectedObject()
	-- upvalues: var4 (write), guiService (ref)
	local cancelButton = var4:FindFirstChild("CancelButton")
	
	if cancelButton then
		guiService.SelectedCoreObject = cancelButton
		
		return
	end
	local confirmButton = var4:FindFirstChild("ConfirmButton")
	
	if confirmButton then
		guiService.SelectedCoreObject = confirmButton
	end
end

function OnTweenInFinished()
	-- upvalues: var11 (write), var5 (ref)
	if var11 or var5 then
		SetSelectedObject()
	end
end

function ConnectActiveEvents()
	-- upvalues: var6 (write), var11 (write), t_2 (write), userInputService (ref), guiService (ref), var10 (write), var12 (write), var13 (write), var14 (write)
	local function OnInputChanged(p3)
		-- upvalues: var6 (copy), var11 (copy)
		local userInputType = Enum.UserInputType
		
		if var6 or not valueInTable(p3.UserInputType, {
			userInputType.Gamepad1,
			userInputType.Gamepad2,
			userInputType.Gamepad3,
			userInputType.Gamepad4
		}) then
			var11 = false
		elseif p3.KeyCode ~= Enum.KeyCode.Thumbstick1 and p3.KeyCode ~= Enum.KeyCode.Thumbstick2 then
			var11 = true
			
			return
		elseif math.abs(p3.Position.X) > 0.1 or math.abs(p3.Position.Z) > 0.1 or math.abs(p3.Position.Y) > 0.1 then
			var11 = true
			
			return
		end
	end
	
	table.insert(t_2, userInputService.InputChanged:connect(OnInputChanged))
	table.insert(t_2, userInputService.InputBegan:connect(OnInputChanged))
	table.insert(t_2, guiService.Changed:connect(function(p3)
		-- upvalues: var10 (copy), guiService (copy), var12 (copy), var13 (copy), var14 (copy)
		if var10 then
			if p3 == "CoreGuiNavigationEnabled" then
				if guiService.CoreGuiNavigationEnabled == true then
					return
				else
					var12 = guiService.CoreGuiNavigationEnabled
					guiService.CoreGuiNavigationEnabled = true
					
					return
				end
			elseif p3 == "GuiNavigationEnabled" then
				if guiService.GuiNavigationEnabled == false then
				else
					var13 = guiService.GuiNavigationEnabled
					guiService.GuiNavigationEnabled = false
					
					return
				end
			elseif p3 == "AutoSelectGuiEnabled" and guiService.AutoSelectGuiEnabled ~= false then
				var14 = guiService.AutoSelectGuiEnabled
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
	-- upvalues: var3 (write), var5 (ref), userInputService (ref), var6 (write), var2 (write), dialogModule (ref), uDim2_2 (write)
	var3.Visible = true
	
	if var5 then
		userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
	end
	if not var6 then
		var3:TweenPositionInternal(uDim2_2, Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.3, true, OnTweenInFinished)
		DisableControllerMovement()
		EnableControllerInput()
		
		return
	elseif not var2 then
		var2 = dialogModule.new()
	end
	var3.Position = uDim2_2
	var2:SetContent(var3)
	var2:Show(true)
	DisableControllerMovement()
end

function HidePrompt()
	-- upvalues: var10 (write), guiService (ref), var12 (write), var13 (write), var14 (write), var5 (ref), userInputService (ref), promptCreatorTransientDialog (ref), var3 (write), var4 (write), var6 (write), uDim2_1 (write), var2 (write)
	local function onClosed()
		-- upvalues: var10 (copy), guiService (copy), var12 (copy), var13 (copy), var14 (copy), var5 (copy), userInputService (copy), promptCreatorTransientDialog (copy), var3 (copy), var4 (copy)
		var10 = false
		guiService.CoreGuiNavigationEnabled = var12
		guiService.GuiNavigationEnabled = var13
		guiService.AutoSelectGuiEnabled = var14
		guiService.SelectedCoreObject = nil
		
		if var5 then
			userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
		end
		if promptCreatorTransientDialog then
			DisconnectActiveEvents()
			
			if var3 then
				var3:Destroy()
				var3 = nil
				var4 = nil
				
				return
			end
		else
			var3.Visible = false
		end
	end
	
	if var6 then
		var3.Position = uDim2_1
		
		if var2 then
			var2:Close()
		end
		var10 = false
		guiService.CoreGuiNavigationEnabled = var12
		guiService.GuiNavigationEnabled = var13
		guiService.AutoSelectGuiEnabled = var14
		guiService.SelectedCoreObject = nil
		
		if var5 then
			userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
		end
		if not promptCreatorTransientDialog then
			var3.Visible = false
			
			return
		end
		DisconnectActiveEvents()
		
		if var3 then
			var3:Destroy()
			var3 = nil
			var4 = nil
			
			return
		end
	else
		var3:TweenPositionInternal(uDim2_1, Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.3, true, onClosed)
	end
end

function DoCreatePrompt(p3)
	-- upvalues: var15 (write), t_1 (ref), var16 (write)
	var15 = p3.PromptCompletedCallback
	AddDefaultsToPromptOptions(p3, t_1)
	var16 = p3
	CreatePromptFromOptions(p3)
	ShowPrompt()
end

function OnPromptEnded(p3)
	-- upvalues: var15 (write), var16 (write)
	if var15 then
		if var16.CancelActive then
			spawn(function()
				-- upvalues: var15 (copy), p3 (ref)
				var15(p3)
			end)
		else
			spawn(function()
				-- upvalues: var15 (copy)
				var15(true)
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
	-- upvalues: contextActionService (ref), var16 (write), guiService (ref)
	contextActionService:BindCoreAction("CoreScriptPromptCreatorCancel", function(_, p3, _)
		-- upvalues: var16 (copy)
		if p3 ~= Enum.UserInputState.Begin then return end
		if var16.CancelActive then
			OnPromptEnded(false)
		end
	end, false, Enum.KeyCode.ButtonB)
	contextActionService:BindCoreAction("CoreScriptPromptCreatorSelect", function(_, p3, _)
		-- upvalues: guiService (copy)
		if p3 ~= Enum.UserInputState.Begin then return end
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

function valueInTable(p3, p4)
	for i, v in pairs(p4) do
		if v == p3 then
			return true
		end
	end
	return false
end

function SetupGamepadSelection()
	-- upvalues: var12 (write), guiService (ref), var13 (write), var14 (write)
	var12 = guiService.CoreGuiNavigationEnabled
	var13 = guiService.GuiNavigationEnabled
	var14 = guiService.AutoSelectGuiEnabled
	guiService.SelectedCoreObject = nil
	guiService.CoreGuiNavigationEnabled = true
	guiService.GuiNavigationEnabled = false
	guiService.AutoSelectGuiEnabled = false
end

if not promptCreatorTransientDialog then
	createPromptDialog()
	
	local function OnInputChanged(p5)
		-- upvalues: var6 (write), var11 (write)
		local userInputType = Enum.UserInputType
		
		if var6 or not valueInTable(p5.UserInputType, {
			userInputType.Gamepad1,
			userInputType.Gamepad2,
			userInputType.Gamepad3,
			userInputType.Gamepad4
		}) then
			var11 = false
		elseif p5.KeyCode ~= Enum.KeyCode.Thumbstick1 and p5.KeyCode ~= Enum.KeyCode.Thumbstick2 then
			var11 = true
			
			return
		elseif math.abs(p5.Position.X) > 0.1 or math.abs(p5.Position.Z) > 0.1 or math.abs(p5.Position.Y) > 0.1 then
			var11 = true
			
			return
		end
	end
	
	userInputService.InputChanged:connect(OnInputChanged)
	userInputService.InputBegan:connect(OnInputChanged)
	
	local _ = function(p5)
		-- upvalues: var2 (write), dialogModule (ref), var3 (write), var6 (write), robloxGui (ref)
		if p5 then
			if not var2 then
				var2 = dialogModule.new()
			end
			var2:SetContent(var3)
			var6 = true
			
			return
		else
			var6 = false
			
			if var2 then
				var2:SetContent(nil)
			end
			var3.Parent = robloxGui
		end
	end
	
	spawn(function()
		-- upvalues: userInputService (ref), var2 (write), dialogModule (ref), var3 (write), var6 (write), robloxGui (ref)
		if userInputService.VREnabled then
			if not var2 then
				var2 = dialogModule.new()
			end
			var2:SetContent(var3)
			var6 = true
			
			return
		else
			var6 = false
			
			if var2 then
				var2:SetContent(nil)
			end
			var3.Parent = robloxGui
		end
	end)
	userInputService.Changed:connect(function(p5)
		-- upvalues: userInputService (ref), var2 (write), dialogModule (ref), var3 (write), var6 (write), robloxGui (ref)
		if p5 == "VREnabled" then
			if userInputService.VREnabled then
				if not var2 then
					var2 = dialogModule.new()
				end
				var2:SetContent(var3)
				var6 = true
				
				return
			else
				var6 = false
				
				if var2 then
					var2:SetContent(nil)
				end
				var3.Parent = robloxGui
			end
		end
	end)
	guiService.Changed:connect(function(p5)
		-- upvalues: var10 (write), guiService (ref), var12 (write), var13 (write), var14 (write)
		if var10 then
			if p5 == "CoreGuiNavigationEnabled" then
				if guiService.CoreGuiNavigationEnabled == true then
					return
				else
					var12 = guiService.CoreGuiNavigationEnabled
					guiService.CoreGuiNavigationEnabled = true
					
					return
				end
			elseif p5 == "GuiNavigationEnabled" then
				if guiService.GuiNavigationEnabled == false then
				else
					var13 = guiService.GuiNavigationEnabled
					guiService.GuiNavigationEnabled = false
					
					return
				end
			elseif p5 == "AutoSelectGuiEnabled" and guiService.AutoSelectGuiEnabled ~= false then
				var14 = guiService.AutoSelectGuiEnabled
				guiService.AutoSelectGuiEnabled = false
			end
		end
	end)
end
function t.CreatePrompt(_, p5)
	-- upvalues: var10 (write), promptCreatorTransientDialog (ref), createPromptDialog (ref)
	if var10 then
		return false
	end
	var10 = true
	
	if promptCreatorTransientDialog then
		createPromptDialog()
		ConnectActiveEvents()
	end
	SetupGamepadSelection()
	DoCreatePrompt(p5)
	
	return true
end

function t.IsCurrentlyPrompting(_)
	-- upvalues: var10 (write)
	return var10
end

return t