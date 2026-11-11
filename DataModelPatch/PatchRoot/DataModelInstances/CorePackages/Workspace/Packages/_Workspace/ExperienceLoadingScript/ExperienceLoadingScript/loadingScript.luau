local ExperienceLoadingScript = script:FindFirstAncestor("ExperienceLoadingScript")
local Parent = ExperienceLoadingScript.Parent
local Players = require(Parent.MockableProxyServices).Players
local ReplicatedFirst = require(Parent.MockableProxyServices).ReplicatedFirst
local RunService = require(Parent.MockableProxyServices).RunService
local VRService = require(Parent.MockableProxyServices).VRService
local SplashScreenManager = require(Parent.SplashScreenManager).SplashScreenManager
local IsVRAppBuildFunction = require(Parent.AppCommonLib).IsVRAppBuild
local CoreGui = game:GetService("CoreGui")
local Game1 = require(Parent.MockableProxyServices).game
local WaitProxyFunction = require(Parent.MockableProxyServices).waitProxy
local SettingsProxyFunction = require(Parent.MockableProxyServices).settingsProxy
game:DefineFastInt("FPSAwareSplashScreenTimeout", 30)
local ExperienceLoadingScreenFixStyleLink = game:DefineFastFlag("ExperienceLoadingScreenFixStyleLink", false)
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

return function(PlaceId, p1)
	-- upvalues: GenerateDevGUIBlackoutCurtain (copy), Parent (copy), LoadingScreenReducerModule (copy), LoadingScreenModule (copy), UiModeStyleProvider (copy), Constants (copy), ExperienceLoadingScreenFixStyleLink (copy), CoreGui (copy), RunService (copy), WaitProxyFunction (copy), SplashScreenManager (copy), ExperienceLoadingScript (copy), Players (copy), Game1 (copy), VRService (copy), IsVRAppBuildFunction (copy), SettingsProxyFunction (copy), ReplicatedFirst (copy), LoggingProtocolModule (copy)
	local Flag = true
	local Flag1 = false
	local Flag2 = false
	local Callback = nil
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
	
	local function v25(PlaceId)
		-- upvalues: RoactModule (ref), Parent (upval), LoadingScreenReducerModule (upval), LoadingScreenModule (upval), UiModeStyleProvider (upval), Constants (upval), ExperienceLoadingScreenFixStyleLink (upval), CoreGui (upval), RunService (upval), DevGUIBlackoutCurtain (ref)
		RoactModule = require(Parent.Roact)
		local RoduxModule = require(Parent.Rodux)
		local Element = RoactModule.createElement(require(Parent.RoactRodux).StoreProvider, {
			store = RoduxModule.Store.new(LoadingScreenReducerModule, {}, { RoduxModule.thunkMiddleware })
		}, {
			RoactModule.createElement(UiModeStyleProvider, {
				style = {
					themeName = Constants.ThemeName.Dark,
					fontName = Constants.FontName.Gotham
				}
			}, {
				loadingScreenUI = RoactModule.createElement(LoadingScreenModule, { placeId = PlaceId })
			})
		})
		
		if ExperienceLoadingScreenFixStyleLink then
			Element = RoactModule.createElement("Folder", nil, Element)
		end
		local RobloxLoadingGUI = RoactModule.mount(Element, CoreGui, "RobloxLoadingGUI")
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
	
	local function v27(p2: number)
		-- upvalues: Flag (ref), RoactModule (ref), WaitProxyFunction (upval), v1 (ref), SplashScreenManager (upval), Callback (ref), DevGUIBlackoutCurtain (ref), ExperienceLoadingScript (upval)
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
			-- upvalues: Flag (upval), Callback (upval)
			Flag = p3
			
			if Flag and Callback then
				Callback()
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
	
	local function Callback1()
		-- upvalues: Game1 (upval), Players (upval), Flag1 (ref), Callback (ref)
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
			
			if Callback then
				Callback()
				
				return
			end
		else
			local Connection = nil
			Connection = Game1.Loaded:Connect(function()
				-- upvalues: Connection (ref), Players (upval), Flag1 (upval), Callback (upval)
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
				
				if Callback then
					Callback()
				end
			end)
		end
	end
	
	if VRService.VREnabled or IsVRAppBuildFunction() then
		v27(p1)
	else
		VRService:GetPropertyChangedSignal("VREnabled"):Connect(function()
			-- upvalues: VRService (upval), v27 (copy), p1 (copy)
			if VRService.VREnabled then
				v27(p1)
			end
		end)
		v1 = v25(PlaceId)
	end
	Callback = function()
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
	
	ReplicatedFirst.FinishedReplicating:Connect(Callback1)
	
	if ReplicatedFirst:IsFinishedReplicating() then
		Callback1()
	end
	ReplicatedFirst.RemoveDefaultLoadingGuiSignal:Connect(function()
		-- upvalues: Flag2 (ref), Callback (ref)
		Flag2 = true
		
		if Callback then
			Callback()
		end
	end)
	
	if ReplicatedFirst:IsDefaultLoadingGuiRemoved() then
		Flag2 = true
		
		if Callback then
			Callback()
		end
	end
end