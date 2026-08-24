local parent = script:FindFirstAncestor("ExperienceLoadingScript").Parent
local runService = game:GetService("RunService")
local marketplaceService = game:GetService("MarketplaceService")
local replicatedFirstService = game:GetService("ReplicatedFirst")
local guiService = game:GetService("GuiService")
local tweenService = game:GetService("TweenService")
local splashScreenManager = require(parent.SplashScreenManager).SplashScreenManager
local loadingRemoveRemoteCallErrorPrint = game:DefineFastFlag("LoadingRemoveRemoteCallErrorPrint", false)
local create = require(parent.AppCommonLib).Create

local function FadeElements(p0, p1, p2)
	-- upvalues: tweenService (ref), FadeElements (ref)
	p2 = p2 or 0.5
	
	if p0 == nil then return end
	local tweenInfo = TweenInfo.new(p2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	
	if p0:IsA("ImageLabel") or p0:IsA("ImageButton") then
		tweenService:Create(p0, tweenInfo, { ImageTransparency = p1 }):Play()
	end
	if p0:IsA("GuiObject") then
		tweenService:Create(p0, tweenInfo, { BackgroundTransparency = p1 }):Play()
	end
	if p0:IsA("TextLabel") or p0:IsA("TextBox") or p0:IsA("TextButton") then
		tweenService:Create(p0, tweenInfo, { TextTransparency = p1 }):Play()
	end
	for i, v in pairs(p0:GetChildren()) do
		FadeElements(v, p1, p2)
	end
end

local t = { Finished = false, GameAssetInfo = nil }
local bindableEvent = Instance.new("BindableEvent")
t.LoadingFinishedEvent = bindableEvent.Event

function t.GetGameName(p3)
	return if p3.GameAssetInfo == nil then "" else p3.GameAssetInfo.Name
end

function t.GetCreatorName(p4)
	return if p4.GameAssetInfo == nil then "" else p4.GameAssetInfo.Creator.Name
end

function t.IsReady(p5)
	return p5.Finished
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
			if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
				value.GameAssetInfo = marketplaceService:GetProductInfoAsync(game.PlaceId)
				
				return
			end
			value.GameAssetInfo = marketplaceService:GetProductInfo(game.PlaceId)
		end)
		
		if not loadingRemoveRemoteCallErrorPrint and not ok then
			print("LoadingScript->GameInfoProvider:LoadAssets:", status)
		end
		value.Finished = true
		bindableEvent:Fire()
	end)
end

local var9 = create("Frame")({
	Name = "VRLoadingScreenContainer",
	BackgroundTransparency = 1,
	Size = UDim2.new(1, 0, 1, 0),
	BackgroundColor3 = Color3.new(0, 0, 0)
})
local var10 = create("ImageLabel")({
	Name = "LoadingBackground",
	Image = "rbxasset://textures/ui/LoadingScreen/BackgroundLight.png",
	BackgroundTransparency = 1,
	Position = UDim2.new(0.25, 0, 0.25, 0),
	Size = UDim2.new(0.5, 0, 0.5, 0),
	ScaleType = Enum.ScaleType.Slice,
	SliceCenter = Rect.new(70, 70, 110, 110),
	Parent = var9,
	ImageColor3 = Color3.new(0, 0, 0)
})
local var11 = 0
local var12 = create("ImageLabel")({
	Name = "Spinner",
	Image = "rbxasset://textures/ui/LoadingScreen/LoadingSpinner.png",
	BackgroundTransparency = 1,
	Size = UDim2.new(0.25, 0, 0.25, 0),
	SizeConstraint = Enum.SizeConstraint.RelativeYY,
	Position = UDim2.new(0.375, 0, 0.325, 0),
	Parent = var10
})
local var13 = create("TextLabel")({
	Name = "LoadingText",
	Text = "Loading...",
	BackgroundTransparency = 1,
	Font = Enum.Font.SourceSans,
	FontSize = Enum.FontSize.Size60,
	Position = UDim2.new(0.5, 0, 0.2, 0),
	Parent = var10,
	TextColor3 = Color3.new(0.301960784314, 0.639215686275, 0.878431372549)
})
local var14 = create("TextLabel")({
	Name = "GameNameText",
	Text = "",
	BackgroundTransparency = 1,
	ClipsDescendants = true,
	Font = Enum.Font.SourceSans,
	FontSize = Enum.FontSize.Size60,
	Size = UDim2.new(0.9, 0, 0.1, 0),
	Position = UDim2.new(0.05, 0, 0.65, 0),
	Parent = var10,
	TextColor3 = Color3.new(0.058823529412, 0.929411764706, 1)
})
local var15 = create("Frame")({
	Name = "CreatorTextContainer",
	BackgroundTransparency = 1,
	ClipsDescendants = true,
	Size = UDim2.new(0.9, 0, 0.1, 0),
	Position = UDim2.new(0.05, 0, 0.77, 0),
	Parent = var10
})
local var16 = 0
local var17 = create("TextLabel")({
	Name = "CreatorText",
	Text = "",
	BackgroundTransparency = 1,
	Font = Enum.Font.SourceSans,
	FontSize = Enum.FontSize.Size42,
	Size = UDim2.new(1, 0, 1, 0),
	Parent = var15,
	TextColor3 = Color3.new(0.058823529412, 0.929411764706, 1)
})
local var18 = false
local var19 = true
delay(2.5, function()
	-- upvalues: var19 (write)
	var19 = false
end)

local function UpdateLayout(p6)
	-- upvalues: var17 (ref), var15 (ref), var19 (write), var16 (write), tweenService (ref), var18 (write), var14 (ref), var12 (ref), var13 (ref)
	if var17.TextBounds.X < var15.AbsoluteSize.X then
		var17.Position = UDim2.new(0, 0, 0, 0)
		var17.Size = UDim2.new(1, 0, 1, 0)
	elseif p6 ~= nil then
		var17.Size = UDim2.new(0, var17.TextBounds.X, 1, 0)
		
		if not var19 then
			local var25 = var16 - p6 * 25
			
			if var25 + var17.AbsoluteSize.X < var15.AbsoluteSize.X then
				var19 = true
				spawn(function()
					-- upvalues: tweenService (copy), var17 (copy), var18 (copy), var16 (copy), var19 (copy)
					local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
					tweenService:Create(var17, tweenInfo, { TextTransparency = 1 }):Play()
					wait(1.5)
					
					if var18 then
						return
					end
					var16 = 0
					tweenService:Create(var17, tweenInfo, { TextTransparency = 0 }):Play()
					wait(1.5)
					var19 = false
				end)
			else
				var16 = var25
			end
		end
		var17.Position = UDim2.new(0, var16, 0, 0)
	end
	if not var14.TextFits then
		var14.Size = UDim2.new(0.9, 0, 0.3, 0)
		var14.Position = UDim2.new(0.05, 0, 0.5, 0)
		var14.TextScaled = true
		var14.TextWrapped = true
		var12.Position = UDim2.new(0.375, 0, 0.225, 0)
		var13.Position = UDim2.new(0.5, 0, 0.15, 0)
	end
end

local function _()
	-- upvalues: var18 (write), FadeElements (ref), var9 (ref), runService (ref)
	if var18 then
		return
	end
	var18 = true
	FadeElements(var9, 1, 2.5)
	wait(2.5)
	runService:UnbindFromRenderStep("LoadingGui3D")
	var9.Parent = nil
end

local function OnGameInfoLoaded()
	-- upvalues: t (ref), var14 (ref), var17 (ref)
	local creatorName = t:GetCreatorName()
	
	if creatorName and creatorName ~= "" then
		creatorName = string.format("By %s", tostring(creatorName))
	end
	var14.Text = t:GetGameName()
	var17.Text = creatorName
end

local function OnDefaultLoadingGuiRemoved()
	-- upvalues: var18 (write), FadeElements (ref), var9 (ref), runService (ref)
	if var18 then
		return
	end
	var18 = true
	FadeElements(var9, 1, 2.5)
	wait(2.5)
	runService:UnbindFromRenderStep("LoadingGui3D")
	var9.Parent = nil
end

local currentTime = tick()
runService:BindToRenderStep("LoadingGui3D", Enum.RenderPriority.Last.Value, function()
	-- upvalues: currentTime (write), UpdateLayout (ref), var11 (write), var12 (ref)
	local currentTime_1 = tick()
	local var29 = currentTime_1 - currentTime
	UpdateLayout(var29)
	var11 += var29 * 0.5 * 360
	var12.Rotation = var11
	currentTime = currentTime_1
end)
UpdateLayout()
t:LoadAssetsAsync()

if t:IsReady() then
	currentTime = t:GetCreatorName()
	
	if currentTime and currentTime ~= "" then
		currentTime = string.format("By %s", tostring(currentTime))
	end
	var14.Text = t:GetGameName()
	var17.Text = currentTime
end
t.LoadingFinishedEvent:Connect(OnGameInfoLoaded)

if replicatedFirstService:IsDefaultLoadingGuiRemoved() then
	var18 = true
	FadeElements(var9, 1, 2.5)
	wait(2.5)
	runService:UnbindFromRenderStep("LoadingGui3D")
	var9.Parent = nil
else
	replicatedFirstService.RemoveDefaultLoadingGuiSignal:connect(OnDefaultLoadingGuiRemoved)
end
guiService.ErrorMessageChanged:connect(function() end)
guiService.UiMessageChanged:connect(function(_, _) end)
splashScreenManager.addStatusChangeListener(function(p7)
	-- upvalues: var18 (write), FadeElements (ref), var9 (ref), runService (ref)
	if p7 then
		if var18 then return end
		var18 = true
		FadeElements(var9, 1, 2.5)
		wait(2.5)
		runService:UnbindFromRenderStep("LoadingGui3D")
		var9.Parent = nil
	end
end)

return var9