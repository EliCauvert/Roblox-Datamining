local ExperienceLoadingScript = script:FindFirstAncestor("ExperienceLoadingScript")
local Parent = ExperienceLoadingScript.Parent
local ColorMode = require(Parent.Foundation).Enums.ColorMode
local Players = require(Parent.MockableProxyServices).Players
local ReplicatedFirst = require(Parent.MockableProxyServices).ReplicatedFirst
local RunService = require(Parent.MockableProxyServices).RunService
local VRService = require(Parent.MockableProxyServices).VRService
local SplashScreenManager = require(Parent.SplashScreenManager).SplashScreenManager
local IsVRAppBuildFunction = require(Parent.AppCommonLib).IsVRAppBuild
local LoadingScreenMilestonesModule = require(Parent.ProgressLoading.LoadingScreenMilestones)
local AbortReason = LoadingScreenMilestonesModule.AbortReason
local FFlagLoadingScreenMilestones = require(Parent.SharedFlags).FFlagLoadingScreenMilestones
local FFlagTiltLoadingScreenEnterExitHold = require(Parent.SharedFlags).FFlagTiltLoadingScreenEnterExitHold
local FFlagEnableTiltLoadingScreen = require(Parent.SharedFlags).FFlagEnableTiltLoadingScreen
local CoreGui = game:GetService("CoreGui")
local Game1 = require(Parent.MockableProxyServices).game
local WaitProxyFunction = require(Parent.MockableProxyServices).waitProxy
local SettingsProxyFunction = require(Parent.MockableProxyServices).settingsProxy
game:DefineFastInt("FPSAwareSplashScreenTimeout", 30)
local UIBloxModule = require(Parent.UIBlox)
UIBloxModule.init(require(Parent.CoreScriptsInitializer).UIBloxInGameConfig)
local Constants = UIBloxModule.App.Style.Constants
local UiModeStyleProvider = require(Parent.Style).UiModeStyleProvider
local CreateFunction = require(Parent.AppCommonLib).Create
local LoadingScreenModule = require(ExperienceLoadingScript.LoadingScreen)
local LoadingScreenReducerModule = require(ExperienceLoadingScript.Reducers.LoadingScreenReducer)
local LoggingProtocolModule = require(Parent.LoggingProtocol)

local function GenerateDevGUIBlackoutCurtain()
	-- upvalues: CreateFunction (copy), CoreGui (copy)
	local Parent = CreateFunction("ScreenGui")({
		Name = "DevGUIBlackoutCurtain",
		DisplayOrder = 8,
		IgnoreGuiInset = true
	})
	CreateFunction("Frame")({
		Name = "BlackFrame",
		BackgroundTransparency = 0,
		Active = true,
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.fromScale(10, 10),
		Position = UDim2.fromOffset(0, 0),
		Parent = Parent
	})
	Parent.Parent = CoreGui
	
	return Parent
end

local function mountTiltLoadingScreen(PlaceId, Callback, StartResult)
	-- upvalues: Parent (copy), CoreGui (copy), FFlagLoadingScreenMilestones (copy), AbortReason (copy), Game1 (copy), LoggingProtocolModule (copy)
	local RobloxLoadingGUI = Instance.new("Folder")
	RobloxLoadingGUI.Name = "RobloxLoadingGUI"
	RobloxLoadingGUI.Parent = CoreGui
	local Root = require(Parent.ReactRoblox).createRoot(RobloxLoadingGUI)
	local Flag = false
	
	local function unmount()
		-- upvalues: FFlagLoadingScreenMilestones (upval), StartResult (copy), AbortReason (upval), Root (copy), RobloxLoadingGUI (copy)
		if FFlagLoadingScreenMilestones and StartResult then
			StartResult.abort(AbortReason.Unmounted)
		end
		Root:unmount()
		RobloxLoadingGUI:Destroy()
	end
	
	Root:render(require(Parent.React).createElement(require(Parent.ProgressLoading).TiltLoadingScreen, {
		milestones = if FFlagLoadingScreenMilestones then StartResult else nil,
		placeId = PlaceId,
		onCancel = function(p1, p2)
			-- upvalues: Flag (ref), Game1 (upval), FFlagLoadingScreenMilestones (upval), StartResult (copy), AbortReason (upval), LoggingProtocolModule (upval)
			if Flag or p2 and Game1:IsLoaded() then return end
			Flag = true
			
			if FFlagLoadingScreenMilestones and StartResult then
				StartResult.abort(AbortReason.Cancelled)
			end
			if p1 then
				LoggingProtocolModule.default:logEventOnce("first_experience_cancelled")
			end
			Game1:Shutdown()
		end,
		onDismissComplete = function()
			-- upvalues: FFlagLoadingScreenMilestones (upval), StartResult (copy), AbortReason (upval), Root (copy), RobloxLoadingGUI (copy), Callback (copy), LoggingProtocolModule (upval)
			if FFlagLoadingScreenMilestones and StartResult then
				StartResult.abort(AbortReason.Unmounted)
			end
			Root:unmount()
			RobloxLoadingGUI:Destroy()
			Callback()
			LoggingProtocolModule.default:logEventOnce("first_experience_interactive")
		end
	}))
	
	return unmount
end

local _ = nil

local function v24(PlaceId, p1)
	-- upvalues: GenerateDevGUIBlackoutCurtain (copy), Parent (copy), LoadingScreenReducerModule (copy), LoadingScreenModule (copy), UiModeStyleProvider (copy), ColorMode (copy), Constants (copy), CoreGui (copy), RunService (copy), WaitProxyFunction (copy), SplashScreenManager (copy), ExperienceLoadingScript (copy), Players (copy), Game1 (copy), VRService (copy), IsVRAppBuildFunction (copy), FFlagEnableTiltLoadingScreen (copy), ReplicatedFirst (copy), LoggingProtocolModule (copy), FFlagLoadingScreenMilestones (copy), LoadingScreenMilestonesModule (copy), FFlagTiltLoadingScreenEnterExitHold (copy), mountTiltLoadingScreen (copy), AbortReason (copy), v24 (ref), SettingsProxyFunction (copy)
	local Flag = true
	local Flag1 = false
	local Flag2 = false
	local Callback3 = nil
	local v1 = nil
	local DevGUIBlackoutCurtain = GenerateDevGUIBlackoutCurtain()
	local RoactModule = nil
	
	local function _()
		-- upvalues: DevGUIBlackoutCurtain (ref)
		if DevGUIBlackoutCurtain then
			DevGUIBlackoutCurtain.Enabled = false
			DevGUIBlackoutCurtain:Destroy()
			DevGUIBlackoutCurtain = nil
		end
	end
	
	local function v37(PlaceId)
		-- upvalues: RoactModule (ref), Parent (upval), LoadingScreenReducerModule (upval), LoadingScreenModule (upval), UiModeStyleProvider (upval), ColorMode (upval), Constants (upval), CoreGui (upval), RunService (upval), DevGUIBlackoutCurtain (ref)
		RoactModule = require(Parent.Roact)
		local RoduxModule = require(Parent.Rodux)
		local RobloxLoadingGUI = RoactModule.mount(RoactModule.createElement("Folder", nil, (RoactModule.createElement(require(Parent.RoactRodux).StoreProvider, {
			store = RoduxModule.Store.new(LoadingScreenReducerModule, {}, { RoduxModule.thunkMiddleware })
		}, {
			RoactModule.createElement(UiModeStyleProvider, {
				style = {
					themeName = ColorMode.Dark,
					fontName = Constants.FontName.Gotham
				}
			}, {
				loadingScreenUI = RoactModule.createElement(LoadingScreenModule, { placeId = PlaceId })
			})
		}))), CoreGui, "RobloxLoadingGUI")
		RunService.Heartbeat:Wait()
		DevGUIBlackoutCurtain.Enabled = false
		
		return RobloxLoadingGUI
	end
	
	local _ = function()
		-- upvalues: RoactModule (ref), WaitProxyFunction (upval), v1 (ref)
		if RoactModule then
			WaitProxyFunction(0.6)
			
			if v1 ~= nil then
				RoactModule.unmount(v1)
				v1 = nil
			end
		end
	end
	
	local function v39(p2: number)
		-- upvalues: Flag (ref), RoactModule (ref), WaitProxyFunction (upval), v1 (ref), SplashScreenManager (upval), Callback3 (ref), DevGUIBlackoutCurtain (ref), ExperienceLoadingScript (upval)
		Flag = false
		
		if RoactModule then
			WaitProxyFunction(0.6)
			
			if v1 ~= nil then
				RoactModule.unmount(v1)
				v1 = nil
			end
		end
		SplashScreenManager.initialize(p2 / 2, game:GetFastInt("FPSAwareSplashScreenTimeout"), p2)
		SplashScreenManager.addStatusChangeListener(function(p3)
			-- upvalues: Flag (upval), Callback3 (upval)
			Flag = p3
			
			if Flag and Callback3 then
				Callback3()
			end
		end)
		DevGUIBlackoutCurtain.Enabled = true
		require(ExperienceLoadingScript.LoadingScreen3D).Parent = DevGUIBlackoutCurtain
	end
	
	local _ = function()
		-- upvalues: Players (upval)
		if Players.CharacterAutoLoads then
			local LocalPlayer = Players.LocalPlayer
			
			if not LocalPlayer then
				Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
				LocalPlayer = Players.LocalPlayer
			end
			if not LocalPlayer.Character then
				LocalPlayer.CharacterAdded:Wait()
			end
		end
	end
	
	local function Callback4()
		-- upvalues: Game1 (upval), Players (upval), Flag1 (ref), Callback3 (ref)
		if Game1:IsLoaded() then
			if Players.CharacterAutoLoads then
				local LocalPlayer = Players.LocalPlayer
				
				if not LocalPlayer then
					Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
					LocalPlayer = Players.LocalPlayer
				end
				if not LocalPlayer.Character then
					LocalPlayer.CharacterAdded:Wait()
				end
			end
			Flag1 = true
			
			if Callback3 then
				Callback3()
				
				return
			end
		else
			local Connection = nil
			Connection = Game1.Loaded:Connect(function()
				-- upvalues: Connection (ref), Players (upval), Flag1 (upval), Callback3 (upval)
				Connection:Disconnect()
				Connection = nil
				
				if Players.CharacterAutoLoads then
					local LocalPlayer = Players.LocalPlayer
					
					if not LocalPlayer then
						Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
						LocalPlayer = Players.LocalPlayer
					end
					if not LocalPlayer.Character then
						LocalPlayer.CharacterAdded:Wait()
					end
				end
				Flag1 = true
				
				if Callback3 then
					Callback3()
				end
			end)
		end
	end
	
	if VRService.VREnabled or IsVRAppBuildFunction() then
		v39(p1)
	elseif FFlagEnableTiltLoadingScreen then
		if ReplicatedFirst:IsDefaultLoadingGuiRemoved() then
			if DevGUIBlackoutCurtain then
				DevGUIBlackoutCurtain.Enabled = false
				DevGUIBlackoutCurtain:Destroy()
				DevGUIBlackoutCurtain = nil
			end
			ReplicatedFirst:SetDefaultLoadingGuiRemoved()
			LoggingProtocolModule.default:logEventOnce("first_experience_interactive")
			
			return
		else
			local Connection = nil
			local Flag4 = true
			local StartResult = if FFlagLoadingScreenMilestones then LoadingScreenMilestonesModule.start({
				holdEnabled = FFlagTiltLoadingScreenEnterExitHold,
				reducedMotion = UserSettings():GetService("UserGameSettings").ReducedMotion
			}) else nil
			local MountTiltLoadingScreenResult: () -> () = mountTiltLoadingScreen(PlaceId, function()
				-- upvalues: Flag4 (ref), Connection (ref), DevGUIBlackoutCurtain (ref)
				Flag4 = false
				
				if Connection then
					Connection:Disconnect()
					Connection = nil
				end
				if DevGUIBlackoutCurtain then
					DevGUIBlackoutCurtain.Enabled = false
					DevGUIBlackoutCurtain:Destroy()
					DevGUIBlackoutCurtain = nil
				end
			end, StartResult)
			
			local _ = function()
				-- upvalues: Flag4 (ref), FFlagLoadingScreenMilestones (upval), StartResult (ref), AbortReason (upval), Connection (ref), DevGUIBlackoutCurtain (ref), MountTiltLoadingScreenResult (copy), v24 (upval), PlaceId (copy), p1 (copy)
				if not Flag4 then return end
				if FFlagLoadingScreenMilestones and StartResult then
					StartResult.abort(AbortReason.VRHandoff)
				end
				Flag4 = false
				
				if Connection then
					Connection:Disconnect()
					Connection = nil
				end
				if DevGUIBlackoutCurtain then
					DevGUIBlackoutCurtain.Enabled = false
					DevGUIBlackoutCurtain:Destroy()
					DevGUIBlackoutCurtain = nil
				end
				MountTiltLoadingScreenResult()
				v24(PlaceId, p1)
			end
			
			Connection = VRService:GetPropertyChangedSignal("VREnabled"):Connect(function()
				-- upvalues: VRService (upval), Flag4 (ref), FFlagLoadingScreenMilestones (upval), StartResult (ref), AbortReason (upval), Connection (ref), DevGUIBlackoutCurtain (ref), MountTiltLoadingScreenResult (copy), v24 (upval), PlaceId (copy), p1 (copy)
				if VRService.VREnabled then
					if not Flag4 then return end
					if FFlagLoadingScreenMilestones and StartResult then
						StartResult.abort(AbortReason.VRHandoff)
					end
					Flag4 = false
					
					if Connection then
						Connection:Disconnect()
						Connection = nil
					end
					if DevGUIBlackoutCurtain then
						DevGUIBlackoutCurtain.Enabled = false
						DevGUIBlackoutCurtain:Destroy()
						DevGUIBlackoutCurtain = nil
					end
					MountTiltLoadingScreenResult()
					v24(PlaceId, p1)
				end
			end)
			
			if VRService.VREnabled and Flag4 then
				if FFlagLoadingScreenMilestones and StartResult then
					StartResult.abort(AbortReason.VRHandoff)
				end
				Flag4 = false
				
				if Connection then
					Connection:Disconnect()
					Connection = nil
				end
				if DevGUIBlackoutCurtain then
					DevGUIBlackoutCurtain.Enabled = false
					DevGUIBlackoutCurtain:Destroy()
					DevGUIBlackoutCurtain = nil
				end
				MountTiltLoadingScreenResult()
				v24(PlaceId, p1)
			end
			if Flag4 then
				RunService.Heartbeat:Wait()
				
				if Flag4 then
					DevGUIBlackoutCurtain.Enabled = false
				end
			end
			return
		end
	else
		local Connection = VRService
		Connection = Connection:GetPropertyChangedSignal("VREnabled")
		Connection:Connect(function()
			-- upvalues: VRService (upval), v39 (copy), p1 (copy)
			if VRService.VREnabled then
				v39(p1)
			end
		end)
		Connection = v37
		local Flag4 = PlaceId
		Connection = Connection(Flag4)
		v1 = Connection
	end
	Callback3 = function()
		-- upvalues: VRService (upval), Flag (ref), SettingsProxyFunction (upval), DevGUIBlackoutCurtain (ref), ReplicatedFirst (upval), LoggingProtocolModule (upval), Flag1 (ref), Flag2 (ref), RoactModule (ref), WaitProxyFunction (upval), v1 (ref)
		if VRService.VREnabled then
			if Flag or SettingsProxyFunction().Rendering.QualityLevel ~= Enum.QualityLevel.Automatic then
				if DevGUIBlackoutCurtain then
					DevGUIBlackoutCurtain.Enabled = false
					DevGUIBlackoutCurtain:Destroy()
					DevGUIBlackoutCurtain = nil
				end
				ReplicatedFirst:SetDefaultLoadingGuiRemoved()
				LoggingProtocolModule.default:logEventOnce("first_experience_interactive")
				
				return
			end
		elseif Flag1 or Flag2 then
			if RoactModule then
				WaitProxyFunction(0.6)
				
				if v1 ~= nil then
					RoactModule.unmount(v1)
					v1 = nil
				end
			end
			if DevGUIBlackoutCurtain then
				DevGUIBlackoutCurtain.Enabled = false
				DevGUIBlackoutCurtain:Destroy()
				DevGUIBlackoutCurtain = nil
			end
			ReplicatedFirst:SetDefaultLoadingGuiRemoved()
			LoggingProtocolModule.default:logEventOnce("first_experience_interactive")
		end
	end
	
	local Connection = ReplicatedFirst
	Connection = Connection.FinishedReplicating
	Connection:Connect(Callback4)
	Connection = ReplicatedFirst
	Connection = Connection:IsFinishedReplicating()
	
	if Connection then
		Connection = Callback4
		Connection()
	end
	Connection = ReplicatedFirst
	Connection = Connection.RemoveDefaultLoadingGuiSignal
	Connection:Connect(function()
		-- upvalues: Flag2 (ref), Callback3 (ref)
		Flag2 = true
		
		if Callback3 then
			Callback3()
		end
	end)
	Connection = ReplicatedFirst
	Connection = Connection:IsDefaultLoadingGuiRemoved()
	
	if Connection then
		Flag2 = true
		
		if Callback3 then
			Connection = Callback3
			Connection()
		end
	end
end

return v24