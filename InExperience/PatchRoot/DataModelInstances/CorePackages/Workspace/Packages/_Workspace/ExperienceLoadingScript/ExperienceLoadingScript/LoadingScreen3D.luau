local parent = script:FindFirstAncestor("ExperienceLoadingScript").Parent
local runService = game:GetService("RunService")
local marketplaceService = game:GetService("MarketplaceService")
local replicatedFirstService = game:GetService("ReplicatedFirst")
local guiService = game:GetService("GuiService")
local tweenService = game:GetService("TweenService")
local splashScreenManager = require(parent.SplashScreenManager).SplashScreenManager
local loadingRemoveRemoteCallErrorPrint = game:DefineFastFlag("LoadingRemoveRemoteCallErrorPrint", false)
local create = require(parent.AppCommonLib).Create

local function FadeElements(p1, p2, p3)
	-- upvalues: tweenService (ref), FadeElements (ref)
	p3 = p3 or 0.5
	
	if p1 == nil then return end
	local tweenInfo = TweenInfo.new(p3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	
	if p1:IsA("ImageLabel") or p1:IsA("ImageButton") then
		tweenService:Create(p1, tweenInfo, { ImageTransparency = p2 }):Play()
	end
	if p1:IsA("GuiObject") then
		tweenService:Create(p1, tweenInfo, { BackgroundTransparency = p2 }):Play()
	end
	if p1:IsA("TextLabel") or p1:IsA("TextBox") or p1:IsA("TextButton") then
		tweenService:Create(p1, tweenInfo, { TextTransparency = p2 }):Play()
	end
	for i, v in pairs(p1:GetChildren()) do
		FadeElements(v, p2, p3)
	end
end

local t = { Finished = false, GameAssetInfo = nil }
local bindableEvent = Instance.new("BindableEvent")
t.LoadingFinishedEvent = bindableEvent.Event

function t.GetGameName(p4)
	return if p4.GameAssetInfo == nil then "" else p4.GameAssetInfo.Name
end

function t.GetCreatorName(p4)
	return if p4.GameAssetInfo == nil then "" else p4.GameAssetInfo.Creator.Name
end

function t.IsReady(p4)
	return p4.Finished
end

function t.LoadAssetsAsync(value)
	-- upvalues: marketplaceService (ref), loadingRemoveRemoteCallErrorPrint (ref), bindableEvent (ref)
	spawn(function()
		-- upvalues: value (ref), marketplaceService (copy), loadingRemoveRemoteCallErrorPrint (copy), bindableEvent (copy)
		while game.PlaceId <= 0 do
			wait()
		end
		local ok, status = pcall(function()
			-- upvalues: value (copy), marketplaceService (copy)
			value.GameAssetInfo = marketplaceService:GetProductInfoAsync(game.PlaceId)
		end)
		
		if not loadingRemoveRemoteCallErrorPrint and not ok then
			print("LoadingScript->GameInfoProvider:LoadAssets:", status)
		end
		value.Finished = true
		bindableEvent:Fire()
	end)
end

local var1 = create("Frame")({
	Name = "VRLoadingScreenContainer",
	BackgroundTransparency = 1,
	Size = UDim2.new(1, 0, 1, 0),
	BackgroundColor3 = Color3.new(0, 0, 0)
})
local var2 = create("ImageLabel")({
	Name = "LoadingBackground",
	Image = "rbxasset://textures/ui/LoadingScreen/BackgroundLight.png",
	BackgroundTransparency = 1,
	Position = UDim2.new(0.25, 0, 0.25, 0),
	Size = UDim2.new(0.5, 0, 0.5, 0),
	ScaleType = Enum.ScaleType.Slice,
	SliceCenter = Rect.new(70, 70, 110, 110),
	Parent = var1,
	ImageColor3 = Color3.new(0, 0, 0)
})
local var3 = 0
local var4 = create("ImageLabel")({
	Name = "Spinner",
	Image = "rbxasset://textures/ui/LoadingScreen/LoadingSpinner.png",
	BackgroundTransparency = 1,
	Size = UDim2.new(0.25, 0, 0.25, 0),
	SizeConstraint = Enum.SizeConstraint.RelativeYY,
	Position = UDim2.new(0.375, 0, 0.325, 0),
	Parent = var2
})
local var5 = create("TextLabel")({
	Name = "LoadingText",
	Text = "Loading...",
	BackgroundTransparency = 1,
	Font = Enum.Font.SourceSans,
	FontSize = Enum.FontSize.Size60,
	Position = UDim2.new(0.5, 0, 0.2, 0),
	Parent = var2,
	TextColor3 = Color3.new(0.301960784314, 0.639215686275, 0.878431372549)
})
local var6 = create("TextLabel")({
	Name = "GameNameText",
	Text = "",
	BackgroundTransparency = 1,
	ClipsDescendants = true,
	Font = Enum.Font.SourceSans,
	FontSize = Enum.FontSize.Size60,
	Size = UDim2.new(0.9, 0, 0.1, 0),
	Position = UDim2.new(0.05, 0, 0.65, 0),
	Parent = var2,
	TextColor3 = Color3.new(0.058823529412, 0.929411764706, 1)
})
local var7 = create("Frame")({
	Name = "CreatorTextContainer",
	BackgroundTransparency = 1,
	ClipsDescendants = true,
	Size = UDim2.new(0.9, 0, 0.1, 0),
	Position = UDim2.new(0.05, 0, 0.77, 0),
	Parent = var2
})
local var8 = 0
local var9 = create("TextLabel")({
	Name = "CreatorText",
	Text = "",
	BackgroundTransparency = 1,
	Font = Enum.Font.SourceSans,
	FontSize = Enum.FontSize.Size42,
	Size = UDim2.new(1, 0, 1, 0),
	Parent = var7,
	TextColor3 = Color3.new(0.058823529412, 0.929411764706, 1)
})
local var10 = false
local var11 = true
delay(2.5, function()
	-- upvalues: var11 (write)
	var11 = false
end)

local function UpdateLayout(p4)
	-- upvalues: var9 (ref), var7 (ref), var11 (write), var8 (write), tweenService (ref), var10 (write), var6 (ref), var4 (ref), var5 (ref)
	if var9.TextBounds.X < var7.AbsoluteSize.X then
		var9.Position = UDim2.new(0, 0, 0, 0)
		var9.Size = UDim2.new(1, 0, 1, 0)
	elseif p4 ~= nil then
		var9.Size = UDim2.new(0, var9.TextBounds.X, 1, 0)
		
		if not var11 then
			local var12 = var8 - p4 * 25
			
			if var12 + var9.AbsoluteSize.X < var7.AbsoluteSize.X then
				var11 = true
				spawn(function()
					-- upvalues: tweenService (copy), var9 (copy), var10 (copy), var8 (copy), var11 (copy)
					local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
					tweenService:Create(var9, tweenInfo, { TextTransparency = 1 }):Play()
					wait(1.5)
					
					if var10 then
						return
					end
					var8 = 0
					tweenService:Create(var9, tweenInfo, { TextTransparency = 0 }):Play()
					wait(1.5)
					var11 = false
				end)
			else
				var8 = var12
			end
		end
		var9.Position = UDim2.new(0, var8, 0, 0)
	end
	if not var6.TextFits then
		var6.Size = UDim2.new(0.9, 0, 0.3, 0)
		var6.Position = UDim2.new(0.05, 0, 0.5, 0)
		var6.TextScaled = true
		var6.TextWrapped = true
		var4.Position = UDim2.new(0.375, 0, 0.225, 0)
		var5.Position = UDim2.new(0.5, 0, 0.15, 0)
	end
end

local function _()
	-- upvalues: var10 (write), FadeElements (ref), var1 (ref), runService (ref)
	if var10 then
		return
	end
	var10 = true
	FadeElements(var1, 1, 2.5)
	wait(2.5)
	runService:UnbindFromRenderStep("LoadingGui3D")
	var1.Parent = nil
end

local function OnGameInfoLoaded()
	-- upvalues: t (ref), var6 (ref), var9 (ref)
	local creatorName = t:GetCreatorName()
	
	if creatorName and creatorName ~= "" then
		creatorName = string.format("By %s", tostring(creatorName))
	end
	var6.Text = t:GetGameName()
	var9.Text = creatorName
end

local function OnDefaultLoadingGuiRemoved()
	-- upvalues: var10 (write), FadeElements (ref), var1 (ref), runService (ref)
	if var10 then
		return
	end
	var10 = true
	FadeElements(var1, 1, 2.5)
	wait(2.5)
	runService:UnbindFromRenderStep("LoadingGui3D")
	var1.Parent = nil
end

local currentTime = tick()
runService:BindToRenderStep("LoadingGui3D", Enum.RenderPriority.Last.Value, function()
	-- upvalues: currentTime (write), UpdateLayout (ref), var3 (write), var4 (ref)
	local currentTime_1 = tick()
	local var12 = currentTime_1 - currentTime
	UpdateLayout(var12)
	var3 += var12 * 0.5 * 360
	var4.Rotation = var3
	currentTime = currentTime_1
end)
UpdateLayout()
t:LoadAssetsAsync()

if t:IsReady() then
	currentTime = t:GetCreatorName()
	
	if currentTime and currentTime ~= "" then
		currentTime = string.format("By %s", tostring(currentTime))
	end
	var6.Text = t:GetGameName()
	var9.Text = currentTime
end
t.LoadingFinishedEvent:Connect(OnGameInfoLoaded)

if replicatedFirstService:IsDefaultLoadingGuiRemoved() then
	var10 = true
	FadeElements(var1, 1, 2.5)
	wait(2.5)
	runService:UnbindFromRenderStep("LoadingGui3D")
	var1.Parent = nil
else
	replicatedFirstService.RemoveDefaultLoadingGuiSignal:connect(OnDefaultLoadingGuiRemoved)
end
guiService.ErrorMessageChanged:connect(function() end)
guiService.UiMessageChanged:connect(function(_, _) end)
splashScreenManager.addStatusChangeListener(function(p4)
	-- upvalues: var10 (write), FadeElements (ref), var1 (ref), runService (ref)
	if p4 then
		if var10 then return end
		var10 = true
		FadeElements(var1, 1, 2.5)
		wait(2.5)
		runService:UnbindFromRenderStep("LoadingGui3D")
		var1.Parent = nil
	end
end)

return var1