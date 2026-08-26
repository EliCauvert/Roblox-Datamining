local experienceLoadingScript = script:FindFirstAncestor("ExperienceLoadingScript")
local parent = experienceLoadingScript.Parent
local colorMode = require(parent.Foundation).Enums.ColorMode
local players = require(parent.MockableProxyServices).Players
local replicatedFirst = require(parent.MockableProxyServices).ReplicatedFirst
local runService = require(parent.MockableProxyServices).RunService
local VRService = require(parent.MockableProxyServices).VRService
local splashScreenManager = require(parent.SplashScreenManager).SplashScreenManager
local isVRAppBuild = require(parent.AppCommonLib).IsVRAppBuild
local fFlagEnableTiltLoadingScreen = require(parent.SharedFlags).FFlagEnableTiltLoadingScreen
local coreGuiService = game:GetService("CoreGui")
local game = require(parent.MockableProxyServices).game
local waitProxy = require(parent.MockableProxyServices).waitProxy
local settingsProxy = require(parent.MockableProxyServices).settingsProxy
game:DefineFastInt("FPSAwareSplashScreenTimeout", 30)
local experienceLoadingScreenFixStyleLink = game:DefineFastFlag("ExperienceLoadingScreenFixStyleLink", false)
local UIBloxModule = require(parent.UIBlox)
UIBloxModule.init(require(parent.CoreScriptsInitializer).UIBloxInGameConfig)
local constants = UIBloxModule.App.Style.Constants
local uiModeStyleProvider = require(parent.Style).UiModeStyleProvider
local create = require(parent.AppCommonLib).Create
local loadingScreenModule = require(experienceLoadingScript.LoadingScreen)
local loadingScreenReducerModule = require(experienceLoadingScript.Reducers.LoadingScreenReducer)
local loggingProtocolModule = require(parent.LoggingProtocol)

local function GenerateDevGUIBlackoutCurtain()
	-- upvalues: create (ref), coreGuiService (ref)
	local var1 = create("ScreenGui")({
		Name = "DevGUIBlackoutCurtain",
		DisplayOrder = 8,
		IgnoreGuiInset = true
	})
	create("Frame")({
		Name = "BlackFrame",
		BackgroundTransparency = 0,
		Active = true,
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.fromScale(10, 10),
		Position = UDim2.fromOffset(0, 0),
		Parent = var1
	})
	var1.Parent = coreGuiService
	
	return var1
end

local function mountTiltLoadingScreen(p1, p2)
	-- upvalues: parent (ref), coreGuiService (ref), game (ref), loggingProtocolModule (ref)
	local reactModule = require(parent.React)
	local reactRobloxModule = require(parent.ReactRoblox)
	local tiltLoadingScreen = require(parent.ProgressLoading).TiltLoadingScreen
	local robloxLoadingGUI = Instance.new("Folder")
	robloxLoadingGUI.Name = "RobloxLoadingGUI"
	robloxLoadingGUI.Parent = coreGuiService
	local var1 = reactRobloxModule.createRoot(robloxLoadingGUI)
	local var2 = false
	
	local function unmount()
		-- upvalues: var1 (ref), robloxLoadingGUI (ref)
		var1:unmount()
		robloxLoadingGUI:Destroy()
	end
	
	var1:render(reactModule.createElement(tiltLoadingScreen, {
		placeId = p1,
		onCancel = function(p3, p4)
			-- upvalues: var2 (write), game (copy), loggingProtocolModule (copy)
			if var2 or p4 and game:IsLoaded() then return end
			var2 = true
			
			if p3 then
				loggingProtocolModule.default:logEventOnce("first_experience_cancelled")
			end
			game:Shutdown()
		end,
		onDismissComplete = function()
			-- upvalues: var1 (ref), robloxLoadingGUI (ref), p2 (ref), loggingProtocolModule (copy)
			var1:unmount()
			robloxLoadingGUI:Destroy()
			p2()
			loggingProtocolModule.default:logEventOnce("first_experience_interactive")
		end
	}))
	
	return unmount
end

local _ = nil

local var1 = function(p1, p2)
	-- upvalues: GenerateDevGUIBlackoutCurtain (ref), parent (ref), loadingScreenReducerModule (ref), loadingScreenModule (ref), uiModeStyleProvider (ref), colorMode (ref), constants (ref), experienceLoadingScreenFixStyleLink (ref), coreGuiService (ref), runService (ref), waitProxy (ref), splashScreenManager (ref), experienceLoadingScript (ref), players (ref), game (ref), VRService (ref), isVRAppBuild (ref), fFlagEnableTiltLoadingScreen (ref), replicatedFirst (ref), loggingProtocolModule (ref), mountTiltLoadingScreen (ref), var1 (write), settingsProxy (ref)
	local var2 = true
	local var3 = false
	local var4 = false
	local var5 = nil
	local var6 = nil
	local var7 = GenerateDevGUIBlackoutCurtain()
	local var8 = nil
	
	local _ = function()
		-- upvalues: var7 (write)
		if var7 then
			var7.Enabled = false
			var7:Destroy()
			var7 = nil
		end
	end
	
	local var9 = function(p3)
		-- upvalues: var8 (write), parent (copy), loadingScreenReducerModule (copy), loadingScreenModule (copy), uiModeStyleProvider (copy), colorMode (copy), constants (copy), experienceLoadingScreenFixStyleLink (copy), coreGuiService (copy), runService (copy), var7 (write)
		var8 = require(parent.Roact)
		local roduxModule = require(parent.Rodux)
		local var10 = var8.createElement(require(parent.RoactRodux).StoreProvider, {
			store = roduxModule.Store.new(loadingScreenReducerModule, {}, { roduxModule.thunkMiddleware })
		}, {
			var8.createElement(uiModeStyleProvider, {
				style = {
					themeName = colorMode.Dark,
					fontName = constants.FontName.Gotham
				}
			}, {
				loadingScreenUI = var8.createElement(loadingScreenModule, { placeId = p3 })
			})
		})
		
		if experienceLoadingScreenFixStyleLink then
			var10 = var8.createElement("Folder", nil, var10)
		end
		local robloxLoadingGUI = var8.mount(var10, coreGuiService, "RobloxLoadingGUI")
		runService.Heartbeat:Wait()
		var7.Enabled = false
		
		return robloxLoadingGUI
	end
	
	local _ = function()
		-- upvalues: var8 (write), waitProxy (copy), var6 (write)
		if var8 then
			waitProxy(0.6)
			
			if var6 ~= nil then
				var8.unmount(var6)
				var6 = nil
			end
		end
	end
	
	local var10 = function(p3)
		-- upvalues: var2 (write), var8 (write), waitProxy (copy), var6 (write), splashScreenManager (copy), var5 (write), var7 (write), experienceLoadingScript (copy)
		var2 = false
		
		if var8 then
			waitProxy(0.6)
			
			if var6 ~= nil then
				var8.unmount(var6)
				var6 = nil
			end
		end
		splashScreenManager.initialize(p3 / 2, game:GetFastInt("FPSAwareSplashScreenTimeout"), p3)
		splashScreenManager.addStatusChangeListener(function(p4)
			-- upvalues: var2 (copy), var5 (copy)
			var2 = p4
			
			if var2 and var5 then
				var5()
			end
		end)
		var7.Enabled = true
		require(experienceLoadingScript.LoadingScreen3D).Parent = var7
	end
	
	local _ = function()
		-- upvalues: players (copy)
		if players.CharacterAutoLoads then
			local localPlayer = players.LocalPlayer
			
			if not localPlayer then
				players:GetPropertyChangedSignal("LocalPlayer"):Wait()
				localPlayer = players.LocalPlayer
			end
			if not localPlayer.Character then
				localPlayer.CharacterAdded:Wait()
			end
		end
	end
	
	local var11 = function()
		-- upvalues: game (copy), players (copy), var3 (write), var5 (write)
		if game:IsLoaded() then
			if players.CharacterAutoLoads then
				local localPlayer = players.LocalPlayer
				
				if not localPlayer then
					players:GetPropertyChangedSignal("LocalPlayer"):Wait()
					localPlayer = players.LocalPlayer
				end
				if not localPlayer.Character then
					localPlayer.CharacterAdded:Wait()
				end
			end
			var3 = true
			
			if var5 then
				var5()
				
				return
			end
		else
			local loadedConnection = nil
			loadedConnection = game.Loaded:Connect(function()
				-- upvalues: loadedConnection (write), players (copy), var3 (copy), var5 (copy)
				loadedConnection:Disconnect()
				loadedConnection = nil
				
				if players.CharacterAutoLoads then
					local localPlayer = players.LocalPlayer
					
					if not localPlayer then
						players:GetPropertyChangedSignal("LocalPlayer"):Wait()
						localPlayer = players.LocalPlayer
					end
					if not localPlayer.Character then
						localPlayer.CharacterAdded:Wait()
					end
				end
				var3 = true
				
				if var5 then
					var5()
				end
			end)
		end
	end
	
	if VRService.VREnabled or isVRAppBuild() then
		var10(p2)
	elseif fFlagEnableTiltLoadingScreen then
		if replicatedFirst:IsDefaultLoadingGuiRemoved() then
			if var7 then
				var7.Enabled = false
				var7:Destroy()
				var7 = nil
			end
			replicatedFirst:SetDefaultLoadingGuiRemoved()
			loggingProtocolModule.default:logEventOnce("first_experience_interactive")
			
			return
		else
			local var12 = nil
			local var13 = true
			local var14 = mountTiltLoadingScreen(p1, function()
				-- upvalues: var13 (write), var12 (write), var7 (write)
				var13 = false
				
				if var12 then
					var12:Disconnect()
					var12 = nil
				end
				if var7 then
					var7.Enabled = false
					var7:Destroy()
					var7 = nil
				end
			end)
			
			local function _()
				-- upvalues: var13 (write), var12 (write), var7 (write), var14 (ref), var1 (copy), p1 (ref), p2 (ref)
				if not var13 then return end
				var13 = false
				
				if var12 then
					var12:Disconnect()
					var12 = nil
				end
				if var7 then
					var7.Enabled = false
					var7:Destroy()
					var7 = nil
				end
				var14()
				var1(p1, p2)
			end
			
			var12 = VRService:GetPropertyChangedSignal("VREnabled"):Connect(function()
				-- upvalues: VRService (copy), var13 (write), var12 (write), var7 (write), var14 (ref), var1 (copy), p1 (ref), p2 (ref)
				if VRService.VREnabled then
					if not var13 then return end
					var13 = false
					
					if var12 then
						var12:Disconnect()
						var12 = nil
					end
					if var7 then
						var7.Enabled = false
						var7:Destroy()
						var7 = nil
					end
					var14()
					var1(p1, p2)
				end
			end)
			
			if VRService.VREnabled then
				var13 = false
				
				if var12 then
					var12:Disconnect()
					var12 = nil
				end
				if var7 then
					var7.Enabled = false
					var7:Destroy()
					var7 = nil
				end
				var14()
				var1(p1, p2)
			end
			if var13 then
				runService.Heartbeat:Wait()
				
				if var13 then
					var7.Enabled = false
				end
			end
			return
		end
	else
		VRService:GetPropertyChangedSignal("VREnabled"):Connect(function()
			-- upvalues: VRService (copy), var10 (ref), p2 (ref)
			if VRService.VREnabled then
				var10(p2)
			end
		end)
		var6 = var9(p1)
	end
	var5 = function()
		-- upvalues: VRService (copy), var2 (write), settingsProxy (copy), var7 (write), replicatedFirst (copy), loggingProtocolModule (copy), var3 (write), var4 (write), var8 (write), waitProxy (copy), var6 (write)
		if VRService.VREnabled then
			if not var2 and settingsProxy().Rendering.QualityLevel == Enum.QualityLevel.Automatic then return end
			if var7 then
				var7.Enabled = false
				var7:Destroy()
				var7 = nil
			end
			replicatedFirst:SetDefaultLoadingGuiRemoved()
			loggingProtocolModule.default:logEventOnce("first_experience_interactive")
			
			return
		elseif var3 or var4 then
			if var8 then
				waitProxy(0.6)
				
				if var6 ~= nil then
					var8.unmount(var6)
					var6 = nil
				end
			end
			if var7 then
				var7.Enabled = false
				var7:Destroy()
				var7 = nil
			end
			replicatedFirst:SetDefaultLoadingGuiRemoved()
			loggingProtocolModule.default:logEventOnce("first_experience_interactive")
		end
	end
	
	replicatedFirst.FinishedReplicating:Connect(var11)
	
	if replicatedFirst:IsFinishedReplicating() then
		var11()
	end
	replicatedFirst.RemoveDefaultLoadingGuiSignal:Connect(function()
		-- upvalues: var4 (write), var5 (write)
		var4 = true
		
		if var5 then
			var5()
		end
	end)
	
	if replicatedFirst:IsDefaultLoadingGuiRemoved() then
		var4 = true
		
		if var5 then
			var5()
		end
	end
end

return var1