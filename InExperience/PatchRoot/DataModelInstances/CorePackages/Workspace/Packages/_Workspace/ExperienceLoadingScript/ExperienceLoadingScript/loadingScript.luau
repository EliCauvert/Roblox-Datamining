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
	local var10 = create("ScreenGui")({
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
		Parent = var10
	})
	var10.Parent = coreGuiService
	
	return var10
end

local function mountTiltLoadingScreen(p0, p1)
	-- upvalues: parent (ref), coreGuiService (ref), game (ref), loggingProtocolModule (ref)
	local reactModule = require(parent.React)
	local reactRobloxModule = require(parent.ReactRoblox)
	local tiltLoadingScreen = require(parent.ProgressLoading).TiltLoadingScreen
	local robloxLoadingGUI = Instance.new("Folder")
	robloxLoadingGUI.Name = "RobloxLoadingGUI"
	robloxLoadingGUI.Parent = coreGuiService
	local var14 = reactRobloxModule.createRoot(robloxLoadingGUI)
	local var15 = false
	
	local function unmount()
		-- upvalues: var14 (ref), robloxLoadingGUI (ref)
		var14:unmount()
		robloxLoadingGUI:Destroy()
	end
	
	var14:render(reactModule.createElement(tiltLoadingScreen, {
		placeId = p0,
		onCancel = function(p2, p3)
			-- upvalues: var15 (write), game (copy), loggingProtocolModule (copy)
			if var15 or p3 and game:IsLoaded() then return end
			var15 = true
			
			if p2 then
				loggingProtocolModule.default:logEventOnce("first_experience_cancelled")
			end
			game:Shutdown()
		end,
		onDismissComplete = function()
			-- upvalues: var14 (ref), robloxLoadingGUI (ref), p1 (ref), loggingProtocolModule (copy)
			var14:unmount()
			robloxLoadingGUI:Destroy()
			p1()
			loggingProtocolModule.default:logEventOnce("first_experience_interactive")
		end
	}))
	
	return unmount
end

local _ = nil

local var9 = function(p4, p5)
	-- upvalues: GenerateDevGUIBlackoutCurtain (ref), parent (ref), loadingScreenReducerModule (ref), loadingScreenModule (ref), uiModeStyleProvider (ref), colorMode (ref), constants (ref), experienceLoadingScreenFixStyleLink (ref), coreGuiService (ref), runService (ref), waitProxy (ref), splashScreenManager (ref), experienceLoadingScript (ref), players (ref), game (ref), VRService (ref), isVRAppBuild (ref), fFlagEnableTiltLoadingScreen (ref), replicatedFirst (ref), loggingProtocolModule (ref), mountTiltLoadingScreen (ref), var9 (write), settingsProxy (ref)
	local var17 = true
	local var18 = false
	local var19 = false
	local var20 = nil
	local var21 = nil
	local var22 = GenerateDevGUIBlackoutCurtain()
	local var23 = nil
	
	local _ = function()
		-- upvalues: var22 (write)
		if var22 then
			var22.Enabled = false
			var22:Destroy()
			var22 = nil
		end
	end
	
	local var24 = function(p6)
		-- upvalues: var23 (write), parent (copy), loadingScreenReducerModule (copy), loadingScreenModule (copy), uiModeStyleProvider (copy), colorMode (copy), constants (copy), experienceLoadingScreenFixStyleLink (copy), coreGuiService (copy), runService (copy), var22 (write)
		var23 = require(parent.Roact)
		local roduxModule = require(parent.Rodux)
		local var31 = var23.createElement(require(parent.RoactRodux).StoreProvider, {
			store = roduxModule.Store.new(loadingScreenReducerModule, {}, { roduxModule.thunkMiddleware })
		}, {
			var23.createElement(uiModeStyleProvider, {
				style = {
					themeName = colorMode.Dark,
					fontName = constants.FontName.Gotham
				}
			}, {
				loadingScreenUI = var23.createElement(loadingScreenModule, { placeId = p6 })
			})
		})
		
		if experienceLoadingScreenFixStyleLink then
			var31 = var23.createElement("Folder", nil, var31)
		end
		local robloxLoadingGUI = var23.mount(var31, coreGuiService, "RobloxLoadingGUI")
		runService.Heartbeat:Wait()
		var22.Enabled = false
		
		return robloxLoadingGUI
	end
	
	local _ = function()
		-- upvalues: var23 (write), waitProxy (copy), var21 (write)
		if var23 then
			waitProxy(0.6)
			
			if var21 ~= nil then
				var23.unmount(var21)
				var21 = nil
			end
		end
	end
	
	local var25 = function(p7)
		-- upvalues: var17 (write), var23 (write), waitProxy (copy), var21 (write), splashScreenManager (copy), var20 (write), var22 (write), experienceLoadingScript (copy)
		var17 = false
		
		if var23 then
			waitProxy(0.6)
			
			if var21 ~= nil then
				var23.unmount(var21)
				var21 = nil
			end
		end
		splashScreenManager.initialize(p7 / 2, game:GetFastInt("FPSAwareSplashScreenTimeout"), p7)
		splashScreenManager.addStatusChangeListener(function(p8)
			-- upvalues: var17 (copy), var20 (copy)
			var17 = p8
			
			if var17 and var20 then
				var20()
			end
		end)
		var22.Enabled = true
		require(experienceLoadingScript.LoadingScreen3D).Parent = var22
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
	
	local var26 = function()
		-- upvalues: game (copy), players (copy), var18 (write), var20 (write)
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
			var18 = true
			
			if var20 then
				var20()
				
				return
			end
		else
			local loadedConnection = nil
			loadedConnection = game.Loaded:Connect(function()
				-- upvalues: loadedConnection (write), players (copy), var18 (copy), var20 (copy)
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
				var18 = true
				
				if var20 then
					var20()
				end
			end)
		end
	end
	
	if VRService.VREnabled or isVRAppBuild() then
		var25(p5)
	elseif fFlagEnableTiltLoadingScreen then
		if replicatedFirst:IsDefaultLoadingGuiRemoved() then
			if var22 then
				var22.Enabled = false
				var22:Destroy()
				var22 = nil
			end
			replicatedFirst:SetDefaultLoadingGuiRemoved()
			loggingProtocolModule.default:logEventOnce("first_experience_interactive")
			
			return
		else
			local var27 = nil
			local var28 = true
			local var29 = mountTiltLoadingScreen(p4, function()
				-- upvalues: var28 (write), var27 (write), var22 (write)
				var28 = false
				
				if var27 then
					var27:Disconnect()
					var27 = nil
				end
				if var22 then
					var22.Enabled = false
					var22:Destroy()
					var22 = nil
				end
			end)
			
			local function _()
				-- upvalues: var28 (write), var27 (write), var22 (write), var29 (ref), var9 (copy), p4 (ref), p5 (ref)
				if not var28 then return end
				var28 = false
				
				if var27 then
					var27:Disconnect()
					var27 = nil
				end
				if var22 then
					var22.Enabled = false
					var22:Destroy()
					var22 = nil
				end
				var29()
				var9(p4, p5)
			end
			
			var27 = VRService:GetPropertyChangedSignal("VREnabled"):Connect(function()
				-- upvalues: VRService (copy), var28 (write), var27 (write), var22 (write), var29 (ref), var9 (copy), p4 (ref), p5 (ref)
				if VRService.VREnabled then
					if not var28 then return end
					var28 = false
					
					if var27 then
						var27:Disconnect()
						var27 = nil
					end
					if var22 then
						var22.Enabled = false
						var22:Destroy()
						var22 = nil
					end
					var29()
					var9(p4, p5)
				end
			end)
			
			if VRService.VREnabled then
				var28 = false
				
				if var27 then
					var27:Disconnect()
					var27 = nil
				end
				if var22 then
					var22.Enabled = false
					var22:Destroy()
					var22 = nil
				end
				var29()
				var9(p4, p5)
			end
			if var28 then
				runService.Heartbeat:Wait()
				
				if var28 then
					var22.Enabled = false
				end
			end
			return
		end
	else
		VRService:GetPropertyChangedSignal("VREnabled"):Connect(function()
			-- upvalues: VRService (copy), var25 (ref), p5 (ref)
			if VRService.VREnabled then
				var25(p5)
			end
		end)
		var21 = var24(p4)
	end
	var20 = function()
		-- upvalues: VRService (copy), var17 (write), settingsProxy (copy), var22 (write), replicatedFirst (copy), loggingProtocolModule (copy), var18 (write), var19 (write), var23 (write), waitProxy (copy), var21 (write)
		if VRService.VREnabled then
			if not var17 and settingsProxy().Rendering.QualityLevel == Enum.QualityLevel.Automatic then return end
			if var22 then
				var22.Enabled = false
				var22:Destroy()
				var22 = nil
			end
			replicatedFirst:SetDefaultLoadingGuiRemoved()
			loggingProtocolModule.default:logEventOnce("first_experience_interactive")
			
			return
		elseif var18 or var19 then
			if var23 then
				waitProxy(0.6)
				
				if var21 ~= nil then
					var23.unmount(var21)
					var21 = nil
				end
			end
			if var22 then
				var22.Enabled = false
				var22:Destroy()
				var22 = nil
			end
			replicatedFirst:SetDefaultLoadingGuiRemoved()
			loggingProtocolModule.default:logEventOnce("first_experience_interactive")
		end
	end
	
	replicatedFirst.FinishedReplicating:Connect(var26)
	
	if replicatedFirst:IsFinishedReplicating() then
		var26()
	end
	replicatedFirst.RemoveDefaultLoadingGuiSignal:Connect(function()
		-- upvalues: var19 (write), var20 (write)
		var19 = true
		
		if var20 then
			var20()
		end
	end)
	
	if replicatedFirst:IsDefaultLoadingGuiRemoved() then
		var19 = true
		
		if var20 then
			var20()
		end
	end
end

return var9