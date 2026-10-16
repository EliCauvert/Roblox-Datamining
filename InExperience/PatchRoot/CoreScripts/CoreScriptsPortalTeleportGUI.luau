local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local AdService = game:GetService("AdService")
local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local ColorCorrect = nil
local Count = 0
local _ = CoreGui.RobloxGui
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local TeleportEffectGui = Instance.new("ScreenGui")
TeleportEffectGui.Name = "TeleportEffectGui"
TeleportEffectGui.IgnoreGuiInset = true
TeleportEffectGui.Enabled = false
TeleportEffectGui.DisplayOrder = 7
TeleportEffectGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
TeleportEffectGui.Parent = CoreGui
local TopFrame = Instance.new("Frame")
TopFrame.Name = "TopFrame"
TopFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TopFrame.BorderSizePixel = 0
TopFrame.AnchorPoint = Vector2.new(0.5, 1)
TopFrame.Position = UDim2.new(0.5, 0, 0, 0)
TopFrame.Size = UDim2.new(1, 0, 1, 0)
TopFrame.ZIndex = 1
TopFrame.Parent = TeleportEffectGui
local TopFrameClone = TopFrame:Clone()
TopFrameClone.AnchorPoint = Vector2.new(0.5, 0)
TopFrameClone.Position = UDim2.new(0.5, 0, 1, 0)
TopFrameClone.Parent = TeleportEffectGui
local SpinnerContainer = Instance.new("Frame")
SpinnerContainer.Name = "SpinnerContainer"
SpinnerContainer.ZIndex = 2
SpinnerContainer.BackgroundTransparency = 1
SpinnerContainer.AnchorPoint = Vector2.new(1, 1)
SpinnerContainer.Size = UDim2.new(0.125, 0, 0.125, 0)
SpinnerContainer.Position = UDim2.new(1, 0, 1, 0)
SpinnerContainer.Parent = TeleportEffectGui
local AspectRatio = Instance.new("UIAspectRatioConstraint")
AspectRatio.AspectRatio = 1
AspectRatio.Parent = SpinnerContainer
local SpinnerRobloxTilt = Instance.new("ImageLabel")
SpinnerRobloxTilt.Name = "SpinnerRobloxTilt"
SpinnerRobloxTilt.BackgroundTransparency = 1
SpinnerRobloxTilt.ImageTransparency = 1
SpinnerRobloxTilt.Image = "rbxasset://textures/loading/robloxTilt.png"
SpinnerRobloxTilt.ZIndex = 2
SpinnerRobloxTilt.AnchorPoint = Vector2.new(0.5, 0.5)
SpinnerRobloxTilt.Size = UDim2.new(1, 0, 1, 0)
SpinnerRobloxTilt.Position = UDim2.new(0, 0, 0, 0)
SpinnerRobloxTilt.Parent = SpinnerContainer
local AspectRatio1 = Instance.new("UIAspectRatioConstraint")
AspectRatio1.AspectRatio = 1
AspectRatio1.Parent = SpinnerRobloxTilt
local Label = Instance.new("TextLabel")
Label.Text = RobloxTranslatorModule:FormatByKey("CoreScripts.Ads.Label.Teleporting")
Label.TextColor3 = Color3.new(1, 1, 1)
Label.TextTransparency = 1
Label.BackgroundTransparency = 1
Label.ZIndex = 2
Label.AnchorPoint = Vector2.new(0.5, 0.5)
Label.Size = UDim2.new(0.6, 0, 0, 48)
Label.Position = UDim2.new(0.5, 0, 0.5, 0)
Label.Font = AppFonts.default:getDefault()
Label.TextScaled = true
Label.Parent = TeleportEffectGui
local Flag = false

function spinSpinner() --[[ Line: 93 ]]
	-- upvalues: Flag (ref), RunService (copy), SpinnerRobloxTilt (copy)
	if not Flag then
		Flag = true
		local ClockTime = os.clock()
		RunService:BindToRenderStep("PortalLoadingSpinner", Enum.RenderPriority.Last.Value, function() --[[ Line: 97 ]]
			-- upvalues: SpinnerRobloxTilt (upval), ClockTime (copy)
			if not SpinnerRobloxTilt or not SpinnerRobloxTilt.Parent then
				stopSpinner()
				
				return
			end
			local ClockTimeRemainder = (os.clock() - ClockTime) / 4 % 1
			local NewCosine = nil
			local v1 = nil
			
			if ClockTimeRemainder <= 0.75 then
				NewCosine = math.cos(3.141592653589793 * (ClockTimeRemainder / 0.75)) * -0.5 + 0.5
				v1 = 2.25
			else
				NewCosine = math.cos(3.141592653589793 + 3.141592653589793 * ((ClockTimeRemainder - 0.75) / 0.25)) * -0.5 + 0.5
				v1 = 0.25
			end
			local XScale = NewCosine * 0.25 + 1
			SpinnerRobloxTilt.Size = UDim2.new(XScale, 0, XScale, 0)
			SpinnerRobloxTilt.Rotation = NewCosine * 360 * v1
		end)
	end
end

function stopSpinner() --[[ Line: 119 ]]
	-- upvalues: RunService (copy), Flag (ref)
	RunService:UnbindFromRenderStep("PortalLoadingSpinner")
	Flag = false
end

function cover() --[[ Line: 124 ]]
	-- upvalues: Count (ref), ColorCorrect (ref), Lighting (copy), TweenService (copy), TeleportEffectGui (copy), TopFrame (copy), TopFrameClone (copy), SpinnerRobloxTilt (copy), Label (copy)
	Count += 1
	local Count1: number = Count
	
	if ColorCorrect then
		if ColorCorrect.Parent then
			ColorCorrect:Destroy()
		end
		ColorCorrect = nil
	end
	ColorCorrect = Instance.new("ColorCorrectionEffect")
	ColorCorrect.Name = "TeleportColorCorrectionEffect"
	ColorCorrect.Parent = Lighting
	TweenService:Create(ColorCorrect, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { Brightness = 1 }):Play()
	task.delay(0.25, function() --[[ Line: 144 ]]
		-- upvalues: Count1 (copy), Count (upval), TeleportEffectGui (upval), TopFrame (upval), TopFrameClone (upval), TweenService (upval)
		if Count1 ~= Count then return end
		if TeleportEffectGui and TeleportEffectGui.Parent then
			TeleportEffectGui.Enabled = true
		end
		if TopFrame and TopFrame.Parent and TopFrameClone and TopFrameClone.Parent then
			TweenService:Create(TopFrame, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { Position = UDim2.new(0.5, 0, 0.5, 0) }):Play()
			TweenService:Create(TopFrameClone, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { Position = UDim2.new(0.5, 0, 0.5, 0) }):Play()
		end
	end)
	task.delay(1.25, function() --[[ Line: 165 ]]
		-- upvalues: Count1 (copy), Count (upval), SpinnerRobloxTilt (upval), TweenService (upval), Label (upval)
		if Count1 ~= Count then return end
		if SpinnerRobloxTilt and SpinnerRobloxTilt.Parent then
			TweenService:Create(SpinnerRobloxTilt, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { ImageTransparency = 0 }):Play()
			spinSpinner()
		end
		if Label and Label.Parent then
			TweenService:Create(Label, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { TextTransparency = 0 }):Play()
		end
	end)
end

function uncover() --[[ Line: 187 ]]
	-- upvalues: Count (ref), SpinnerRobloxTilt (copy), TweenService (copy), Label (copy), ColorCorrect (ref), TopFrame (copy), TopFrameClone (copy), TeleportEffectGui (copy)
	Count += 1
	local Count1: number = Count
	
	if SpinnerRobloxTilt and SpinnerRobloxTilt.Parent then
		TweenService:Create(SpinnerRobloxTilt, TweenInfo.new(0.6000000000000001, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { ImageTransparency = 1 }):Play()
	end
	if Label and Label.Parent then
		TweenService:Create(Label, TweenInfo.new(0.6000000000000001, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { TextTransparency = 1 }):Play()
	end
	if ColorCorrect and ColorCorrect.Parent then
		TweenService:Create(ColorCorrect, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { Brightness = 0 }):Play()
	end
	if TopFrame and TopFrame.Parent and TopFrameClone and TopFrameClone.Parent then
		TweenService:Create(TopFrame, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { Position = UDim2.new(0.5, 0, 0, 0) }):Play()
		TweenService:Create(TopFrameClone, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { Position = UDim2.new(0.5, 0, 1, 0) }):Play()
	end
	task.delay(3, function() --[[ Line: 226 ]]
		-- upvalues: Count1 (copy), Count (upval), ColorCorrect (upval), TeleportEffectGui (upval)
		if Count1 ~= Count then return end
		if ColorCorrect then
			if ColorCorrect.Parent then
				ColorCorrect:Destroy()
			end
			ColorCorrect = nil
		end
		if TeleportEffectGui and TeleportEffectGui.Parent then
			TeleportEffectGui.Enabled = false
		end
		stopSpinner()
	end)
end

AdService.AdTeleportInitiated:Connect(cover)
AdService.AdTeleportEnded:Connect(uncover)