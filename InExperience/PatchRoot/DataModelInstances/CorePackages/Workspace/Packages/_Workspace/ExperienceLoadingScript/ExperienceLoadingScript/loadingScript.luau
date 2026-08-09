local experienceLoadingScript = script:FindFirstAncestor("ExperienceLoadingScript")
local parent = experienceLoadingScript.Parent
local players = require(parent.MockableProxyServices).Players
local replicatedFirst = require(parent.MockableProxyServices).ReplicatedFirst
local runService = require(parent.MockableProxyServices).RunService
local VRService = require(parent.MockableProxyServices).VRService
local splashScreenManager = require(parent.SplashScreenManager).SplashScreenManager
local isVRAppBuild = require(parent.AppCommonLib).IsVRAppBuild
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

local function GenerateDevGUIBlackoutCurtain() --[[ line: 37 ]]
	-- upvalues: create (ref), coreGuiService (ref)
	local var8 = create("ScreenGui")({
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
		Parent = var8
	})
	var8.Parent = coreGuiService
	
	return var8
end

return function(p0, p1) --[[ line: 61 ]]
	-- upvalues: GenerateDevGUIBlackoutCurtain (ref), parent (ref), loadingScreenReducerModule (ref), loadingScreenModule (ref), uiModeStyleProvider (ref), constants (ref), experienceLoadingScreenFixStyleLink (ref), coreGuiService (ref), runService (ref), waitProxy (ref), splashScreenManager (ref), experienceLoadingScript (ref), players (ref), game (ref), VRService (ref), isVRAppBuild (ref), settingsProxy (ref), replicatedFirst (ref), loggingProtocolModule (ref)
	local var9 = true
	local var10 = false
	local var11 = false
	local var12 = nil
	local var13 = nil
	local var14 = GenerateDevGUIBlackoutCurtain()
	local var15 = nil
	
	local _ = function() --[[ line: 74 ]]
		-- upvalues: var14 (write)
		if var14 then
			var14.Enabled = false
			var14:Destroy()
			var14 = nil
		end
	end
	
	local var16 = function(p2) --[[ line: 82 ]]
		-- upvalues: var15 (write), parent (copy), loadingScreenReducerModule (copy), loadingScreenModule (copy), uiModeStyleProvider (copy), constants (copy), experienceLoadingScreenFixStyleLink (copy), coreGuiService (copy), runService (copy), var14 (write)
		var15 = require(parent.Roact)
		local roduxModule = require(parent.Rodux)
		local var20 = var15.createElement(require(parent.RoactRodux).StoreProvider, {
			store = roduxModule.Store.new(loadingScreenReducerModule, {}, { roduxModule.thunkMiddleware })
		}, {
			var15.createElement(uiModeStyleProvider, {
				style = {
					themeName = constants.ThemeName.Dark,
					fontName = constants.FontName.Gotham
				}
			}, {
				loadingScreenUI = var15.createElement(loadingScreenModule, { placeId = p2 })
			})
		})
		
		if experienceLoadingScreenFixStyleLink then
			var20 = var15.createElement("Folder", nil, var20)
		end
		local robloxLoadingGUI = var15.mount(var20, coreGuiService, "RobloxLoadingGUI")
		runService.Heartbeat:Wait()
		var14.Enabled = false
		
		return robloxLoadingGUI
	end
	
	local _ = function() --[[ line: 113 ]]
		-- upvalues: var15 (write), waitProxy (copy), var13 (write)
		if var15 then
			waitProxy(0.6)
			
			if var13 ~= nil then
				var15.unmount(var13)
				var13 = nil
			end
		end
	end
	
	local var17 = function(p3) --[[ line: 124 ]]
		-- upvalues: var9 (write), var15 (write), waitProxy (copy), var13 (write), splashScreenManager (copy), var12 (write), var14 (write), experienceLoadingScript (copy)
		var9 = false
		
		if var15 then
			waitProxy(0.6)
			
			if var13 ~= nil then
				var15.unmount(var13)
				var13 = nil
			end
		end
		splashScreenManager.initialize(p3 / 2, game:GetFastInt("FPSAwareSplashScreenTimeout"), p3)
		splashScreenManager.addStatusChangeListener(function(p4) --[[ line: 130 ]]
			-- upvalues: var9 (copy), var12 (copy)
			var9 = p4
			
			if var9 and var12 then
				var12()
			end
		end)
		var14.Enabled = true
		require(experienceLoadingScript.LoadingScreen3D).Parent = var14
	end
	
	local _ = function() --[[ line: 143 ]]
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
	
	local var18 = function() --[[ line: 156 ]]
		-- upvalues: game (copy), players (copy), var10 (write), var12 (write)
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
			var10 = true
			
			if var12 then
				var12()
				
				return
			end
		else
			local loadedConnection = nil
			loadedConnection = game.Loaded:Connect(function() --[[ line: 165 ]]
				-- upvalues: loadedConnection (write), players (copy), var10 (copy), var12 (copy)
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
				var10 = true
				
				if var12 then
					var12()
				end
			end)
		end
	end
	
	if VRService.VREnabled or isVRAppBuild() then
		var17(p1)
	else
		VRService:GetPropertyChangedSignal("VREnabled"):Connect(function() --[[ line: 181 ]]
			-- upvalues: VRService (copy), var17 (ref), p1 (ref)
			if VRService.VREnabled then
				var17(p1)
			end
		end)
		var13 = var16(p0)
	end
	var12 = function() --[[ line: 191 ]]
		-- upvalues: VRService (copy), var9 (write), settingsProxy (copy), var14 (write), replicatedFirst (copy), loggingProtocolModule (copy), var10 (write), var11 (write), var15 (write), waitProxy (copy), var13 (write)
		if VRService.VREnabled then
			if not var9 and settingsProxy().Rendering.QualityLevel == Enum.QualityLevel.Automatic then return end
			if var14 then
				var14.Enabled = false
				var14:Destroy()
				var14 = nil
			end
			replicatedFirst:SetDefaultLoadingGuiRemoved()
			loggingProtocolModule.default:logEventOnce("first_experience_interactive")
			
			return
		elseif var10 or var11 then
			if var15 then
				waitProxy(0.6)
				
				if var13 ~= nil then
					var15.unmount(var13)
					var13 = nil
				end
			end
			if var14 then
				var14.Enabled = false
				var14:Destroy()
				var14 = nil
			end
			replicatedFirst:SetDefaultLoadingGuiRemoved()
			loggingProtocolModule.default:logEventOnce("first_experience_interactive")
		end
	end
	
	replicatedFirst.FinishedReplicating:Connect(var18)
	
	if replicatedFirst:IsFinishedReplicating() then
		var18()
	end
	replicatedFirst.RemoveDefaultLoadingGuiSignal:Connect(function() --[[ line: 221 ]]
		-- upvalues: var11 (write), var12 (write)
		var11 = true
		
		if var12 then
			var12()
		end
	end)
	
	if replicatedFirst:IsDefaultLoadingGuiRemoved() then
		var11 = true
		
		if var12 then
			var12()
		end
	end
end