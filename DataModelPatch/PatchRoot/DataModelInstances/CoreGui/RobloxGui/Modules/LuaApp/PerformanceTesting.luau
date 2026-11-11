local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local RunService = game:GetService("RunService")
local StatsService = game:GetService("Stats")
local CreateFunction = require(CorePackages.Workspace.Packages.AppCommonLib).Create
local ConfigModule = require(CoreGui.RobloxGui.Modules.LuaApp.Config)
local ConstantsModule = require(CorePackages.Workspace.Packages.AppChat.Constants)
local PerformanceTestingModule = {
	Mode = {
		None = "None",
		Playing = "Playing",
		Recording = "Recording"
	},
	LuaState = function(_)
		-- upvalues: StatsService (copy)
		local FrameRateManager = StatsService:FindFirstChild("FrameRateManager")
		
		if FrameRateManager then
			return {
				AverageFPS = FrameRateManager:FindFirstChild("AverageFPS"):GetValue(),
				FrameTimeVariance = FrameRateManager:FindFirstChild("FrameTimeVariance"):GetValue()
			}
		else
			warn("FrameRateManager not present in Stats")
			
			return { AverageFPS = 0, FrameTimeVariance = 0 }
		end
	end
}

function PerformanceTestingModule:ShowResults(p1)
	-- upvalues: PerformanceTestingModule (copy), CreateFunction (copy), ConstantsModule (copy), ConfigModule (copy), CoreGui (copy)
	local LuaStateResult = PerformanceTestingModule:LuaState()
	CreateFunction("ScreenGui")({
		Name = "TestResults",
		DisplayOrder = 5,
		CreateFunction("Frame")({
			BackgroundTransparency = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = ConstantsModule.Color.WHITE,
			BorderSizePixel = 0,
			CreateFunction("UIListLayout")({ SortOrder = "LayoutOrder" }),
			CreateFunction("TextLabel")({
				Name = "Title",
				BackgroundTransparency = 1,
				TextSize = ConstantsModule.Font.FONT_SIZE_14,
				Size = UDim2.new(1, 0, 0, 100),
				Text = "Test: " .. ConfigModule.General.PerformanceTestFilename
			}),
			CreateFunction("TextLabel")({
				Name = "AverageFPS",
				BackgroundTransparency = 1,
				Text = "AverageFPS:",
				TextXAlignment = Enum.TextXAlignment.Left,
				TextSize = ConstantsModule.Font.FONT_SIZE_14,
				Size = UDim2.new(1, 0, 0, 50)
			}),
			CreateFunction("TextLabel")({
				Name = "ExpectedAverageFPS",
				BackgroundTransparency = 1,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextSize = ConstantsModule.Font.FONT_SIZE_14,
				Size = UDim2.new(1, 0, 0, 30),
				Text = string.format("Expected: %g", p1.AverageFPS)
			}),
			CreateFunction("TextLabel")({
				Name = "ActualAverageFPS",
				BackgroundTransparency = 1,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextSize = ConstantsModule.Font.FONT_SIZE_14,
				Size = UDim2.new(1, 0, 0, 30),
				Text = string.format("Actual  : %g", LuaStateResult.AverageFPS)
			}),
			CreateFunction("TextLabel")({
				Name = "ActualAverageFPS",
				BackgroundTransparency = 1,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextSize = ConstantsModule.Font.FONT_SIZE_14,
				Size = UDim2.new(1, 0, 0, 30),
				Text = string.format("Delta   : %g", LuaStateResult.AverageFPS - p1.AverageFPS)
			}),
			CreateFunction("TextLabel")({
				Name = "FrameTimeVariance",
				BackgroundTransparency = 1,
				Text = "FrameTimeVariance:",
				TextXAlignment = Enum.TextXAlignment.Left,
				TextSize = ConstantsModule.Font.FONT_SIZE_14,
				Size = UDim2.new(1, 0, 0, 50)
			}),
			CreateFunction("TextLabel")({
				Name = "ExpectedAFrameTimeVariance",
				BackgroundTransparency = 1,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextSize = ConstantsModule.Font.FONT_SIZE_14,
				Size = UDim2.new(1, 0, 0, 30),
				Text = string.format("Expected: %g", p1.FrameTimeVariance)
			}),
			CreateFunction("TextLabel")({
				Name = "ActualFrameTimeVariance",
				BackgroundTransparency = 1,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextSize = ConstantsModule.Font.FONT_SIZE_14,
				Size = UDim2.new(1, 0, 0, 30),
				Text = string.format("Actual  : %g", LuaStateResult.FrameTimeVariance)
			}),
			CreateFunction("TextLabel")({
				Name = "ActualFrameTimeVariance",
				BackgroundTransparency = 1,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextSize = ConstantsModule.Font.FONT_SIZE_14,
				Size = UDim2.new(1, 0, 0, 30),
				Text = string.format("Delta   : %g", LuaStateResult.FrameTimeVariance - p1.FrameTimeVariance)
			})
		})
	}).Parent = CoreGui
end

function PerformanceTestingModule.Record(p1)
	-- upvalues: RunService (copy), VirtualInputManager (copy), HttpService (copy)
	RunService:setThrottleFramerateEnabled(false)
	VirtualInputManager.RecordingCompleted:Connect(function(_)
		-- upvalues: VirtualInputManager (upval), HttpService (upval), p1 (copy)
		print("*** Finished Recording Test ***")
		VirtualInputManager.AdditionalLuaState = HttpService:JSONEncode(p1:LuaState())
		print("~~~           DUMP          ~~~")
		VirtualInputManager:Dump()
	end)
	VirtualInputManager:StartRecording()
end

function PerformanceTestingModule.Play(p1, PerformanceTestFilename)
	-- upvalues: RunService (copy), VirtualInputManager (copy), HttpService (copy)
	print("PerformanceTesting:Play")
	RunService:setThrottleFramerateEnabled(false)
	VirtualInputManager.PlaybackCompleted:Connect(function()
		-- upvalues: HttpService (upval), VirtualInputManager (upval), p1 (copy)
		print("*** Finished Playing Test ***")
		p1:ShowResults((HttpService:JSONDecode(VirtualInputManager.AdditionalLuaState)))
	end)
	VirtualInputManager:StartPlaying(PerformanceTestFilename)
end

function PerformanceTestingModule:Stop()
	-- upvalues: ConfigModule (copy), VirtualInputManager (copy)
	if ConfigModule.General.PerformanceTestingMode == Enum.VirtualInputMode.Recording then
		VirtualInputManager:StopRecording()
	end
end

function PerformanceTestingModule.Initialize(p1, AppState)
	-- upvalues: ConfigModule (copy)
	if ConfigModule.General.PerformanceTestingMode == Enum.VirtualInputMode.None then return end
	p1.appState = AppState
	
	if ConfigModule.General.PerformanceTestingMode == Enum.VirtualInputMode.Recording then
		p1:Record()
		
		return
	end
	if ConfigModule.General.PerformanceTestingMode == Enum.VirtualInputMode.Playing then
		p1:Play(ConfigModule.General.PerformanceTestFilename)
	end
end

return PerformanceTestingModule