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
local FFlagLoadingScreenControlMilestones = require(Parent.SharedFlags).FFlagLoadingScreenControlMilestones
local FFlagTiltLoadingScreenEnterExitHold = require(Parent.SharedFlags).FFlagTiltLoadingScreenEnterExitHold
local FFlagTiltLoadingScreenDismissOnLoaded = require(Parent.SharedFlags).FFlagTiltLoadingScreenDismissOnLoaded
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
	-- upvalues: Parent (copy), CoreGui (copy), FFlagLoadingScreenMilestones (copy), AbortReason (copy), Game1 (copy), LoggingProtocolModule (copy), FFlagTiltLoadingScreenDismissOnLoaded (copy)
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
			-- upvalues: FFlagTiltLoadingScreenDismissOnLoaded (upval), Callback (copy), FFlagLoadingScreenMilestones (upval), StartResult (copy), AbortReason (upval), Root (copy), RobloxLoadingGUI (copy), LoggingProtocolModule (upval)
			if FFlagTiltLoadingScreenDismissOnLoaded then
				Callback()
				
				return
			end
			if FFlagLoadingScreenMilestones and StartResult then
				StartResult.complete()
			end
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

local function v26(PlaceId, p1)
	-- upvalues: GenerateDevGUIBlackoutCurtain (copy), Parent (copy), LoadingScreenReducerModule (copy), LoadingScreenModule (copy), FFlagLoadingScreenControlMilestones (copy), UiModeStyleProvider (copy), ColorMode (copy), Constants (copy), CoreGui (copy), RunService (copy), FFlagTiltLoadingScreenDismissOnLoaded (copy), WaitProxyFunction (copy), LoadingScreenMilestonesModule (copy), SplashScreenManager (copy), ExperienceLoadingScript (copy), Players (copy), Game1 (copy), VRService (copy), IsVRAppBuildFunction (copy), FFlagEnableTiltLoadingScreen (copy), ReplicatedFirst (copy), LoggingProtocolModule (copy), FFlagLoadingScreenMilestones (copy), FFlagTiltLoadingScreenEnterExitHold (copy), mountTiltLoadingScreen (copy), AbortReason (copy), v26 (ref), SettingsProxyFunction (copy)
	local Flag = true
	local Flag1 = false
	local Flag2 = false
	local Callback1 = nil
	local v1 = nil
	local Callback: (() -> ())? = nil
	local Flag3 = false
	local StartResult = nil
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
	
	local function v41(PlaceId)
		-- upvalues: RoactModule (ref), Parent (upval), LoadingScreenReducerModule (upval), LoadingScreenModule (upval), FFlagLoadingScreenControlMilestones (upval), StartResult (ref), UiModeStyleProvider (upval), ColorMode (upval), Constants (upval), CoreGui (upval), RunService (upval), DevGUIBlackoutCurtain (ref)
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
				loadingScreenUI = RoactModule.createElement(LoadingScreenModule, {
					placeId = PlaceId,
					milestones = if FFlagLoadingScreenControlMilestones then StartResult else nil
				})
			})
		}))), CoreGui, "RobloxLoadingGUI")
		RunService.Heartbeat:Wait()
		DevGUIBlackoutCurtain.Enabled = false
		
		return RobloxLoadingGUI
	end
	
	local function v42()
		-- upvalues: FFlagTiltLoadingScreenDismissOnLoaded (upval), Callback (ref), RoactModule (ref), WaitProxyFunction (upval), v1 (ref), FFlagLoadingScreenControlMilestones (upval), StartResult (ref), LoadingScreenMilestonesModule (upval)
		if FFlagTiltLoadingScreenDismissOnLoaded and Callback then
			Callback()
			Callback = nil
			
			return
		end
		if RoactModule then
			WaitProxyFunction(0.6)
			
			if v1 ~= nil then
				if FFlagLoadingScreenControlMilestones and StartResult then
					StartResult.record(LoadingScreenMilestonesModule.Milestone.ScreenHidden)
					StartResult.complete()
				end
				RoactModule.unmount(v1)
				v1 = nil
			end
		end
	end
	
	local function v43(p2: number)
		-- upvalues: Flag (ref), v42 (copy), SplashScreenManager (upval), Callback1 (ref), DevGUIBlackoutCurtain (ref), ExperienceLoadingScript (upval)
		Flag = false
		v42()
		SplashScreenManager.initialize(p2 / 2, game:GetFastInt("FPSAwareSplashScreenTimeout"), p2)
		SplashScreenManager.addStatusChangeListener(function(p3)
			-- upvalues: Flag (upval), Callback1 (upval)
			Flag = p3
			
			if Flag and Callback1 then
				Callback1()
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
	
	local function Callback2()
		-- upvalues: Game1 (upval), FFlagLoadingScreenControlMilestones (upval), StartResult (ref), LoadingScreenMilestonesModule (upval), Players (upval), Flag1 (ref), Callback1 (ref)
		if Game1:IsLoaded() then
			if FFlagLoadingScreenControlMilestones and StartResult then
				StartResult.dismissRequested(LoadingScreenMilestonesModule.DismissSource.NormalReady)
			end
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
			
			if Callback1 then
				Callback1()
				
				return
			end
		else
			local Connection = nil
			Connection = Game1.Loaded:Connect(function()
				-- upvalues: Connection (ref), FFlagLoadingScreenControlMilestones (upval), StartResult (upval), LoadingScreenMilestonesModule (upval), Players (upval), Flag1 (upval), Callback1 (upval)
				Connection:Disconnect()
				Connection = nil
				
				if FFlagLoadingScreenControlMilestones and StartResult then
					StartResult.dismissRequested(LoadingScreenMilestonesModule.DismissSource.NormalReady)
				end
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
				
				if Callback1 then
					Callback1()
				end
			end)
		end
	end
	
	if VRService.VREnabled or IsVRAppBuildFunction() then
		v43(p1)
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
			
			local _ = function()
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
			end
			
			local StartResult1 = if FFlagLoadingScreenMilestones then LoadingScreenMilestonesModule.start({
				page = LoadingScreenMilestonesModule.Page.TiltLoadingScreen,
				holdEnabled = FFlagTiltLoadingScreenEnterExitHold,
				reducedMotion = UserSettings():GetService("UserGameSettings").ReducedMotion
			}) else nil
			local MountTiltLoadingScreenResult: () -> () = mountTiltLoadingScreen(PlaceId, function()
				-- upvalues: FFlagTiltLoadingScreenDismissOnLoaded (upval), Flag3 (ref), Callback1 (ref), Flag4 (ref), Connection (ref), DevGUIBlackoutCurtain (ref)
				if FFlagTiltLoadingScreenDismissOnLoaded then
					Flag3 = true
					
					if Callback1 then
						Callback1()
						
						return
					end
				else
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
				end
			end, StartResult1)
			
			if FFlagTiltLoadingScreenDismissOnLoaded then
				Callback = function()
					-- upvalues: FFlagLoadingScreenMilestones (upval), StartResult1 (ref), MountTiltLoadingScreenResult (copy), Flag4 (ref), Connection (ref), DevGUIBlackoutCurtain (ref)
					if FFlagLoadingScreenMilestones and StartResult1 then
						StartResult1.complete()
					end
					MountTiltLoadingScreenResult()
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
				end
			end
			local _ = function()
				-- upvalues: Flag4 (ref), FFlagLoadingScreenMilestones (upval), StartResult1 (ref), AbortReason (upval), Connection (ref), DevGUIBlackoutCurtain (ref), MountTiltLoadingScreenResult (copy), FFlagTiltLoadingScreenDismissOnLoaded (upval), Callback (ref), Callback1 (ref), v26 (upval), PlaceId (copy), p1 (copy)
				if not Flag4 then return end
				if FFlagLoadingScreenMilestones and StartResult1 then
					StartResult1.abort(AbortReason.VRHandoff)
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
				
				if FFlagTiltLoadingScreenDismissOnLoaded then
					Callback = nil
					Callback1 = nil
				end
				v26(PlaceId, p1)
			end
			
			Connection = VRService:GetPropertyChangedSignal("VREnabled"):Connect(function()
				-- upvalues: VRService (upval), Flag4 (ref), FFlagLoadingScreenMilestones (upval), StartResult1 (ref), AbortReason (upval), Connection (ref), DevGUIBlackoutCurtain (ref), MountTiltLoadingScreenResult (copy), FFlagTiltLoadingScreenDismissOnLoaded (upval), Callback (ref), Callback1 (ref), v26 (upval), PlaceId (copy), p1 (copy)
				if VRService.VREnabled then
					if not Flag4 then return end
					if FFlagLoadingScreenMilestones and StartResult1 then
						StartResult1.abort(AbortReason.VRHandoff)
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
					
					if FFlagTiltLoadingScreenDismissOnLoaded then
						Callback = nil
						Callback1 = nil
					end
					v26(PlaceId, p1)
				end
			end)
			
			if VRService.VREnabled and Flag4 then
				if FFlagLoadingScreenMilestones and StartResult1 then
					StartResult1.abort(AbortReason.VRHandoff)
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
				
				if FFlagTiltLoadingScreenDismissOnLoaded then
					Callback = nil
					Callback1 = nil
				end
				v26(PlaceId, p1)
			end
			if Flag4 then
				RunService.Heartbeat:Wait()
				
				if Flag4 then
					DevGUIBlackoutCurtain.Enabled = false
				end
			end
			if not FFlagTiltLoadingScreenDismissOnLoaded or not Flag4 then return end
		end
	else
		VRService:GetPropertyChangedSignal("VREnabled"):Connect(function()
			-- upvalues: VRService (upval), FFlagLoadingScreenControlMilestones (upval), StartResult (ref), AbortReason (upval), v43 (copy), p1 (copy)
			if VRService.VREnabled then
				if FFlagLoadingScreenControlMilestones and StartResult then
					StartResult.abort(AbortReason.VRHandoff)
				end
				v43(p1)
			end
		end)
		
		if FFlagLoadingScreenControlMilestones and not ReplicatedFirst:IsDefaultLoadingGuiRemoved() then
			StartResult = LoadingScreenMilestonesModule.start({
				holdEnabled = false,
				page = LoadingScreenMilestonesModule.Page.LoadingScreenView,
				reducedMotion = UserSettings():GetService("UserGameSettings").ReducedMotion
			})
		end
		v1 = v41(PlaceId)
	end
	Callback1 = function()
		-- upvalues: VRService (upval), Flag (ref), SettingsProxyFunction (upval), DevGUIBlackoutCurtain (ref), ReplicatedFirst (upval), LoggingProtocolModule (upval), Flag1 (ref), Flag2 (ref), FFlagTiltLoadingScreenDismissOnLoaded (upval), Callback (ref), Flag3 (ref), v42 (copy)
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
			if FFlagTiltLoadingScreenDismissOnLoaded and Callback and not Flag3 then return end
			v42()
			
			if DevGUIBlackoutCurtain then
				DevGUIBlackoutCurtain.Enabled = false
				DevGUIBlackoutCurtain:Destroy()
				DevGUIBlackoutCurtain = nil
			end
			ReplicatedFirst:SetDefaultLoadingGuiRemoved()
			LoggingProtocolModule.default:logEventOnce("first_experience_interactive")
		end
	end
	
	ReplicatedFirst.FinishedReplicating:Connect(Callback2)
	
	if ReplicatedFirst:IsFinishedReplicating() then
		Callback2()
	end
	ReplicatedFirst.RemoveDefaultLoadingGuiSignal:Connect(function()
		-- upvalues: FFlagLoadingScreenControlMilestones (upval), StartResult (ref), LoadingScreenMilestonesModule (upval), Flag2 (ref), Callback1 (ref)
		if FFlagLoadingScreenControlMilestones and StartResult then
			StartResult.dismissRequested(LoadingScreenMilestonesModule.DismissSource.DeveloperOverride)
		end
		Flag2 = true
		
		if Callback1 then
			Callback1()
		end
	end)
	
	if ReplicatedFirst:IsDefaultLoadingGuiRemoved() then
		if FFlagLoadingScreenControlMilestones and StartResult then
			StartResult.dismissRequested(LoadingScreenMilestonesModule.DismissSource.DeveloperOverride)
		end
		Flag2 = true
		
		if Callback1 then
			Callback1()
		end
	end
end

return v26