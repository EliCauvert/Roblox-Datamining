local lightingService = game:GetService("Lighting")
local tweenService = game:GetService("TweenService")
local runService = game:GetService("RunService")
local adService = game:GetService("AdService")
local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local var1 = nil
local var2 = 0
local _ = coreGuiService.RobloxGui
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local appFonts = require(corePackagesService.Workspace.Packages.Style).AppFonts
local teleportEffectGui = Instance.new("ScreenGui")
teleportEffectGui.Name = "TeleportEffectGui"
teleportEffectGui.IgnoreGuiInset = true
teleportEffectGui.Enabled = false
teleportEffectGui.DisplayOrder = 7
teleportEffectGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
teleportEffectGui.Parent = coreGuiService
local topFrame = Instance.new("Frame")
topFrame.Name = "TopFrame"
topFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
topFrame.BorderSizePixel = 0
topFrame.AnchorPoint = Vector2.new(0.5, 1)
topFrame.Position = UDim2.new(0.5, 0, 0, 0)
topFrame.Size = UDim2.new(1, 0, 1, 0)
topFrame.ZIndex = 1
topFrame.Parent = teleportEffectGui
local var3 = topFrame:Clone()
var3.AnchorPoint = Vector2.new(0.5, 0)
var3.Position = UDim2.new(0.5, 0, 1, 0)
var3.Parent = teleportEffectGui
local spinnerContainer = Instance.new("Frame")
spinnerContainer.Name = "SpinnerContainer"
spinnerContainer.ZIndex = 2
spinnerContainer.BackgroundTransparency = 1
spinnerContainer.AnchorPoint = Vector2.new(1, 1)
spinnerContainer.Size = UDim2.new(0.125, 0, 0.125, 0)
spinnerContainer.Position = UDim2.new(1, 0, 1, 0)
spinnerContainer.Parent = teleportEffectGui
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint.AspectRatio = 1
UIAspectRatioConstraint.Parent = spinnerContainer
local spinnerRobloxTilt = Instance.new("ImageLabel")
spinnerRobloxTilt.Name = "SpinnerRobloxTilt"
spinnerRobloxTilt.BackgroundTransparency = 1
spinnerRobloxTilt.ImageTransparency = 1
spinnerRobloxTilt.Image = "rbxasset://textures/loading/robloxTilt.png"
spinnerRobloxTilt.ZIndex = 2
spinnerRobloxTilt.AnchorPoint = Vector2.new(0.5, 0.5)
spinnerRobloxTilt.Size = UDim2.new(1, 0, 1, 0)
spinnerRobloxTilt.Position = UDim2.new(0, 0, 0, 0)
spinnerRobloxTilt.Parent = spinnerContainer
local UIAspectRatioConstraint_1 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint_1.AspectRatio = 1
UIAspectRatioConstraint_1.Parent = spinnerRobloxTilt
local textLabel = Instance.new("TextLabel")
textLabel.Text = robloxTranslatorModule:FormatByKey("CoreScripts.Ads.Label.Teleporting")
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.TextTransparency = 1
textLabel.BackgroundTransparency = 1
textLabel.ZIndex = 2
textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
textLabel.Size = UDim2.new(0.6, 0, 0, 48)
textLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
textLabel.Font = appFonts.default:getDefault()
textLabel.TextScaled = true
textLabel.Parent = teleportEffectGui
local var4 = false

function spinSpinner()
	-- upvalues: var4 (write), runService (ref), spinnerRobloxTilt (ref)
	if not var4 then
		var4 = true
		local processTime = os.clock()
		runService:BindToRenderStep("PortalLoadingSpinner", Enum.RenderPriority.Last.Value, function()
			-- upvalues: spinnerRobloxTilt (copy), processTime (ref)
			if not spinnerRobloxTilt or not spinnerRobloxTilt.Parent then
				stopSpinner()
				
				return
			end
			local var5, var6
			local var7 = (os.clock() - processTime) / 4 % 1
			local _ = 0
			local _ = 0
			
			if var7 <= 0.75 then
				var5 = math.cos(3.14159265359 * (var7 / 0.75)) * -0.5 + 0.5
				var6 = 2.25
			else
				var5 = math.cos(3.14159265359 + 3.14159265359 * ((var7 - 0.75) / 0.25)) * -0.5 + 0.5
				var6 = 0.25
			end
			local var8 = var5 * 0.25 + 1
			spinnerRobloxTilt.Size = UDim2.new(var8, 0, var8, 0)
			spinnerRobloxTilt.Rotation = var5 * 360 * var6
		end)
	end
end

function stopSpinner()
	-- upvalues: runService (ref), var4 (write)
	runService:UnbindFromRenderStep("PortalLoadingSpinner")
	var4 = false
end

function cover()
	-- upvalues: var2 (write), var1 (write), lightingService (ref), tweenService (ref), teleportEffectGui (ref), topFrame (ref), var3 (ref), spinnerRobloxTilt (ref), textLabel (ref)
	var2 += 1
	local var5 = var2
	
	if var1 then
		if var1.Parent then
			var1:Destroy()
		end
		var1 = nil
	end
	var1 = Instance.new("ColorCorrectionEffect")
	var1.Name = "TeleportColorCorrectionEffect"
	var1.Parent = lightingService
	tweenService:Create(var1, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { Brightness = 1 }):Play()
	task.delay(0.25, function()
		-- upvalues: var5 (ref), var2 (copy), teleportEffectGui (copy), topFrame (copy), var3 (copy), tweenService (copy)
		if var5 ~= var2 then return end
		if teleportEffectGui and teleportEffectGui.Parent then
			teleportEffectGui.Enabled = true
		end
		if topFrame and topFrame.Parent and (var3 and var3.Parent) then
			tweenService:Create(topFrame, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { Position = UDim2.new(0.5, 0, 0.5, 0) }):Play()
			tweenService:Create(var3, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { Position = UDim2.new(0.5, 0, 0.5, 0) }):Play()
		end
	end)
	task.delay(1.25, function()
		-- upvalues: var5 (ref), var2 (copy), spinnerRobloxTilt (copy), tweenService (copy), textLabel (copy)
		if var5 ~= var2 then return end
		if spinnerRobloxTilt and spinnerRobloxTilt.Parent then
			tweenService:Create(spinnerRobloxTilt, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { ImageTransparency = 0 }):Play()
			spinSpinner()
		end
		if textLabel and textLabel.Parent then
			tweenService:Create(textLabel, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { TextTransparency = 0 }):Play()
		end
	end)
end

function uncover()
	-- upvalues: var2 (write), spinnerRobloxTilt (ref), tweenService (ref), textLabel (ref), var1 (write), topFrame (ref), var3 (ref), teleportEffectGui (ref)
	var2 += 1
	local var5 = var2
	
	if spinnerRobloxTilt and spinnerRobloxTilt.Parent then
		tweenService:Create(spinnerRobloxTilt, TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { ImageTransparency = 1 }):Play()
	end
	if textLabel and textLabel.Parent then
		tweenService:Create(textLabel, TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { TextTransparency = 1 }):Play()
	end
	if var1 and var1.Parent then
		tweenService:Create(var1, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { Brightness = 0 }):Play()
	end
	if topFrame and topFrame.Parent and (var3 and var3.Parent) then
		tweenService:Create(topFrame, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { Position = UDim2.new(0.5, 0, 0, 0) }):Play()
		tweenService:Create(var3, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { Position = UDim2.new(0.5, 0, 1, 0) }):Play()
	end
	task.delay(3, function()
		-- upvalues: var5 (ref), var2 (copy), var1 (copy), teleportEffectGui (copy)
		if var5 ~= var2 then return end
		if var1 then
			if var1.Parent then
				var1:Destroy()
			end
			var1 = nil
		end
		if teleportEffectGui and teleportEffectGui.Parent then
			teleportEffectGui.Enabled = false
		end
		stopSpinner()
	end)
end

adService.AdTeleportInitiated:Connect(cover)
adService.AdTeleportEnded:Connect(uncover)