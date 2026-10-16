local Parent = script:FindFirstAncestor("ExperienceLoadingScript").Parent
local RunService = game:GetService("RunService")
local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local GuiService = game:GetService("GuiService")
local TweenService = game:GetService("TweenService")
local SplashScreenManager = require(Parent.SplashScreenManager).SplashScreenManager
local LoadingRemoveRemoteCallErrorPrint = game:DefineFastFlag("LoadingRemoveRemoteCallErrorPrint", false)
local CreateFunction = require(Parent.AppCommonLib).Create

local function FadeElements(Target, BackgroundTransparency, Duration1) --[[ Line: 22 ]]
	-- upvalues: TweenService (copy), FadeElements (copy)
	local Duration = Duration1 or 0.5
	
	if Target == nil then return end
	local _TweenInfo = TweenInfo.new(Duration, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	
	if Target:IsA("ImageLabel") or Target:IsA("ImageButton") then
		TweenService:Create(Target, _TweenInfo, { ImageTransparency = BackgroundTransparency }):Play()
	end
	if Target:IsA("GuiObject") then
		TweenService:Create(Target, _TweenInfo, { BackgroundTransparency = BackgroundTransparency }):Play()
	end
	if Target:IsA("TextLabel") or Target:IsA("TextBox") or Target:IsA("TextButton") then
		TweenService:Create(Target, _TweenInfo, { TextTransparency = BackgroundTransparency }):Play()
	end
	for _, child in pairs(Target:GetChildren()) do
		FadeElements(child, BackgroundTransparency, Duration)
	end
end

local BindableEvent = Instance.new("BindableEvent")
local config = {
	Finished = false,
	GameAssetInfo = nil,
	LoadingFinishedEvent = BindableEvent.Event,
	GetGameName = function(p1) --[[ Line: 51 ]]
		return if p1.GameAssetInfo == nil then "" else p1.GameAssetInfo.Name
	end,
	GetCreatorName = function(p1) --[[ Line: 59 ]]
		return if p1.GameAssetInfo == nil then "" else p1.GameAssetInfo.Creator.Name
	end,
	IsReady = function(p1) --[[ Line: 67 ]]
		return p1.Finished
	end,
	LoadAssetsAsync = function(p1) --[[ Line: 71 ]]
		-- upvalues: MarketplaceService (copy), LoadingRemoveRemoteCallErrorPrint (copy), BindableEvent (copy)
		spawn(function() --[[ Line: 72 ]]
			-- upvalues: p1 (copy), MarketplaceService (upval), LoadingRemoveRemoteCallErrorPrint (upval), BindableEvent (upval)
			while game.PlaceId <= 0 do
				wait()
			end
			local Success, Result = pcall(function() --[[ Line: 78 ]]
				-- upvalues: p1 (upval), MarketplaceService (upval)
				p1.GameAssetInfo = MarketplaceService:GetProductInfoAsync(game.PlaceId)
			end)
			
			if not LoadingRemoveRemoteCallErrorPrint and not Success then
				print("LoadingScript->GameInfoProvider:LoadAssets:", Result)
			end
			p1.Finished = true
			BindableEvent:Fire()
		end)
	end
}
local Target = CreateFunction("Frame")({
	Name = "VRLoadingScreenContainer",
	BackgroundTransparency = 1,
	Size = UDim2.new(1, 0, 1, 0),
	BackgroundColor3 = Color3.new(0, 0, 0)
})
local Parent1 = CreateFunction("ImageLabel")({
	Name = "LoadingBackground",
	Image = "rbxasset://textures/ui/LoadingScreen/BackgroundLight.png",
	BackgroundTransparency = 1,
	Position = UDim2.new(0.25, 0, 0.25, 0),
	Size = UDim2.new(0.5, 0, 0.5, 0),
	ScaleType = Enum.ScaleType.Slice,
	SliceCenter = Rect.new(70, 70, 110, 110),
	Parent = Target,
	ImageColor3 = Color3.new(0, 0, 0)
})
local Rotation = 0
local v1 = CreateFunction("ImageLabel")({
	Name = "Spinner",
	Image = "rbxasset://textures/ui/LoadingScreen/LoadingSpinner.png",
	BackgroundTransparency = 1,
	Size = UDim2.new(0.25, 0, 0.25, 0),
	SizeConstraint = Enum.SizeConstraint.RelativeYY,
	Position = UDim2.new(0.375, 0, 0.325, 0),
	Parent = Parent1
})
local v2 = CreateFunction("TextLabel")({
	Name = "LoadingText",
	Text = "Loading...",
	BackgroundTransparency = 1,
	Font = Enum.Font.SourceSans,
	FontSize = Enum.FontSize.Size60,
	Position = UDim2.new(0.5, 0, 0.2, 0),
	Parent = Parent1,
	TextColor3 = Color3.new(0.30196078431372547, 0.6392156862745098, 0.8784313725490196)
})
local Label = CreateFunction("TextLabel")({
	Name = "GameNameText",
	Text = "",
	BackgroundTransparency = 1,
	ClipsDescendants = true,
	Font = Enum.Font.SourceSans,
	FontSize = Enum.FontSize.Size60,
	Size = UDim2.new(0.9, 0, 0.1, 0),
	Position = UDim2.new(0.05, 0, 0.65, 0),
	Parent = Parent1,
	TextColor3 = Color3.new(0.058823529411764705, 0.9294117647058824, 1)
})
local Frame = CreateFunction("Frame")({
	Name = "CreatorTextContainer",
	BackgroundTransparency = 1,
	ClipsDescendants = true,
	Size = UDim2.new(0.9, 0, 0.1, 0),
	Position = UDim2.new(0.05, 0, 0.77, 0),
	Parent = Parent1
})
local XOffset = 0
local Target1 = CreateFunction("TextLabel")({
	Name = "CreatorText",
	Text = "",
	BackgroundTransparency = 1,
	Font = Enum.Font.SourceSans,
	FontSize = Enum.FontSize.Size42,
	Size = UDim2.new(1, 0, 1, 0),
	Parent = Frame,
	TextColor3 = Color3.new(0.058823529411764705, 0.9294117647058824, 1)
})
local Flag = false
local Flag1 = true
delay(2.5, function() --[[ Line: 169 ]]
	-- upvalues: Flag1 (ref)
	Flag1 = false
end)

local function UpdateLayout(p2: number) --[[ Line: 172 ]]
	-- upvalues: Target1 (copy), Frame (copy), Flag1 (ref), XOffset (ref), TweenService (copy), Flag (ref), Label (copy), v1 (copy), v2 (copy)
	if Target1.TextBounds.X < Frame.AbsoluteSize.X then
		Target1.Position = UDim2.new(0, 0, 0, 0)
		Target1.Size = UDim2.new(1, 0, 1, 0)
	elseif p2 ~= nil then
		Target1.Size = UDim2.new(0, Target1.TextBounds.X, 1, 0)
		
		if not Flag1 then
			local XOffsetDelta = XOffset - p2 * 25
			
			if XOffsetDelta + Target1.AbsoluteSize.X < Frame.AbsoluteSize.X then
				Flag1 = true
				spawn(function() --[[ Line: 182 ]]
					-- upvalues: TweenService (upval), Target1 (upval), Flag (upval), XOffset (upval), Flag1 (upval)
					local _TweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
					TweenService:Create(Target1, _TweenInfo, { TextTransparency = 1 }):Play()
					wait(1.5)
					
					if not Flag then
						XOffset = 0
						TweenService:Create(Target1, _TweenInfo, { TextTransparency = 0 }):Play()
						wait(1.5)
						Flag1 = false
						
						return
					end
				end)
			else
				XOffset = XOffsetDelta
			end
		end
		Target1.Position = UDim2.new(0, XOffset, 0, 0)
	end
	if not Label.TextFits then
		Label.Size = UDim2.new(0.9, 0, 0.3, 0)
		Label.Position = UDim2.new(0.05, 0, 0.5, 0)
		Label.TextScaled = true
		Label.TextWrapped = true
		v1.Position = UDim2.new(0.375, 0, 0.225, 0)
		v2.Position = UDim2.new(0.5, 0, 0.15, 0)
	end
end

local function _() --[[ Line: 213 | Named "CleanUp" ]]
	-- upvalues: Flag (ref), FadeElements (copy), Target (copy), RunService (copy)
	if not Flag then
		Flag = true
		FadeElements(Target, 1, 2.5)
		wait(2.5)
		RunService:UnbindFromRenderStep("LoadingGui3D")
		Target.Parent = nil
		
		return
	end
end

local function OnGameInfoLoaded() --[[ Line: 226 ]]
	-- upvalues: config (copy), Label (copy), Target1 (copy)
	local CreatorName = config:GetCreatorName()
	
	if CreatorName and CreatorName ~= "" then
		CreatorName = string.format("By %s", (tostring(CreatorName)))
	end
	Label.Text = config:GetGameName()
	Target1.Text = CreatorName
end

local function OnDefaultLoadingGuiRemoved() --[[ Line: 235 ]]
	-- upvalues: Flag (ref), FadeElements (copy), Target (copy), RunService (copy)
	if not Flag then
		Flag = true
		FadeElements(Target, 1, 2.5)
		wait(2.5)
		RunService:UnbindFromRenderStep("LoadingGui3D")
		Target.Parent = nil
		
		return
	end
end

local CurrentTime = tick()
RunService:BindToRenderStep("LoadingGui3D", Enum.RenderPriority.Last.Value, function() --[[ Line: 241 ]]
	-- upvalues: CurrentTime (ref), UpdateLayout (copy), Rotation (ref), v1 (copy)
	local CurrentTime1 = tick()
	local CurrentTimeDelta = CurrentTime1 - CurrentTime
	UpdateLayout(CurrentTimeDelta)
	Rotation += CurrentTimeDelta * 0.5 * 360
	v1.Rotation = Rotation
	CurrentTime = CurrentTime1
end)
UpdateLayout()
config:LoadAssetsAsync()

if config:IsReady() then
	local Formatted = config:GetCreatorName()
	
	if Formatted and Formatted ~= "" then
		Formatted = string.format("By %s", (tostring(Formatted)))
	end
	Label.Text = config:GetGameName()
	Target1.Text = Formatted
end
config.LoadingFinishedEvent:Connect(OnGameInfoLoaded)

if ReplicatedFirst:IsDefaultLoadingGuiRemoved() then
	if not Flag then
		Flag = true
		FadeElements(Target, 1, 2.5)
		wait(2.5)
		RunService:UnbindFromRenderStep("LoadingGui3D")
		Target.Parent = nil
	end
else
	ReplicatedFirst.RemoveDefaultLoadingGuiSignal:connect(OnDefaultLoadingGuiRemoved)
end
GuiService.ErrorMessageChanged:connect(function() --[[ Line: 268 ]] end)
GuiService.UiMessageChanged:connect(function(_, _) --[[ Line: 272 ]] end)
SplashScreenManager.addStatusChangeListener(function(p2) --[[ Line: 276 ]]
	-- upvalues: Flag (ref), FadeElements (copy), Target (copy), RunService (copy)
	if p2 then
		if Flag then return end
		Flag = true
		FadeElements(Target, 1, 2.5)
		wait(2.5)
		RunService:UnbindFromRenderStep("LoadingGui3D")
		Target.Parent = nil
	end
end)

return Target