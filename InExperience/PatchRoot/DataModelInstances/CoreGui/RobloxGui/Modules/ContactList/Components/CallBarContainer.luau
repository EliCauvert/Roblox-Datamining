local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local currentCamera = game:GetService("Workspace").CurrentCamera
local reactModule = require(corePackagesService.Packages.React)
local cryoModule = require(corePackagesService.Packages.Cryo)
local callProtocolModule = require(corePackagesService.Workspace.Packages.CallProtocol)
local sounds = require(corePackagesService.Workspace.Packages.SoundManager).Sounds
local soundGroups = require(corePackagesService.Workspace.Packages.SoundManager).SoundGroups
local soundManager = require(corePackagesService.Workspace.Packages.SoundManager).SoundManager
local reactOtterModule = require(corePackagesService.Packages.ReactOtter)
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local chrome = robloxGui.Modules.Chrome
local enabled = require(corePackagesService.Workspace.Packages.Chrome).Enabled
local var7 = if enabled() then require(chrome.Service) else nil
local constantsModule = require(chrome.ChromeShared.Unibar.Constants)
local constantsModule_1 = require(robloxGui.Modules.TopBar.Constants)
local dependenciesModule = require(robloxGui.Modules.ContactList.dependencies)
local roduxCall = dependenciesModule.RoduxCall
local useSelector = dependenciesModule.Hooks.useSelector
local useDispatch = dependenciesModule.Hooks.useDispatch
local callAction = roduxCall.Enums.CallAction
local callBarModule = require(script.Parent.CallBar)
local vector2 = Vector2.new(200, 44)
local t = { callProtocol = callProtocolModule.CallProtocol.default }
local _ = { On = "On", Off = "Off" }

return function(p0) --[[ line: 56 | named "CallBarContainer" ]]
	-- upvalues: cryoModule (ref), t (ref), useDispatch (ref), constantsModule_1 (ref), reactModule (ref), reactOtterModule (ref), currentCamera (ref), vector2 (ref), enabled (ref), var7 (ref), constantsModule (ref), useSelector (ref), soundManager (ref), sounds (ref), soundGroups (ref), roduxCall (ref), callAction (ref), callBarModule (ref)
	local var14 = cryoModule.Dictionary.join(t, p0)
	local var15 = useDispatch()
	local var16 = constantsModule_1.useDisplayScaleState(constantsModule_1.TopBarButtonPadding)
	local var17 = constantsModule_1.useDisplayScaleState(constantsModule_1.TopBarTopMargin)
	local var18, var19 = reactModule.useState(false)
	local _ = nil
	local _ = nil
	local var20, var21 = reactOtterModule.useAnimatedBinding({
		X = currentCamera.ViewportSize.X / 2 - vector2.X / 2,
		Y = -vector2.Y
	}, function(p1) --[[ line: 69 ]]
		-- upvalues: vector2 (copy), var18 (ref), var19 (ref)
		if p1.Y == -vector2.Y and var18 then
			var19(false)
		end
	end)
	local var22 = var21
	local var23 = reactModule.useCallback(function(p2) --[[ line: 84 ]]
		-- upvalues: currentCamera (copy), vector2 (copy), enabled (copy), var17 (ref), var16 (ref), var7 (copy), constantsModule_1 (copy), var22 (write), reactOtterModule (copy), constantsModule (copy)
		local var29 = currentCamera.ViewportSize.X / 2 - vector2.X / 2
		local var30 = if p2 == "On" then if enabled() then var17 + var16 else 4 else -vector2.Y
		
		if enabled() and var7 then
			local max = var7:layout():get().Max
			
			if currentCamera.ViewportSize.X / 2 - vector2.X / 2 < max.X + 12 then
				if currentCamera.ViewportSize.X >= max.X + 24 + vector2.X then
					var29 = max.X + 12
				elseif p2 == "On" then
					var30 = constantsModule_1.ApplyDisplayScale(constantsModule_1.TopBarHeight) + 10
				end
			end
		end
		var22({
			X = reactOtterModule.spring(var29, constantsModule.MENU_ANIMATION_SPRING),
			Y = reactOtterModule.spring(var30, constantsModule.MENU_ANIMATION_SPRING)
		})
	end, {})
	local var24 = useSelector(reactModule.useCallback(function(p3) --[[ line: 124 ]]
		return if p3.Call.currentCall == nil then nil else p3.Call.currentCall.status
	end, {}))
	local var25 = useSelector(reactModule.useCallback(function(p4) --[[ line: 129 ]]
		return if p4.Call.currentCall and p4.Call.currentCall.activeUtc then p4.Call.currentCall.activeUtc else 0
	end))
	local var26 = useSelector(reactModule.useCallback(function(p5) --[[ line: 138 ]]
		return if p5.Call.currentCall == nil then nil else p5.Call.currentCall.instanceId
	end))
	reactModule.useEffect(function() --[[ line: 143 ]]
		-- upvalues: var14 (ref), soundManager (copy), sounds (copy), soundGroups (copy), var15 (ref), roduxCall (copy)
		local var31 = var14.callProtocol:listenToHandleConnectingCall(function(p6) --[[ line: 146 ]]
			-- upvalues: soundManager (copy), sounds (copy), soundGroups (copy), var15 (copy), roduxCall (copy)
			soundManager:PlaySound(sounds.Ringtone.Name, { Volume = 0.5, Looped = true }, soundGroups.Iris)
			var15(roduxCall.Actions.UpdateCall(p6))
		end)
		local var32 = var14.callProtocol:listenToHandleTeleportingCall(function(p7) --[[ line: 152 ]]
			-- upvalues: soundManager (copy), sounds (copy), soundGroups (copy), var15 (copy), roduxCall (copy)
			soundManager:StopSound(sounds.Ringtone.Name)
			soundManager:PlaySound(sounds.CallAccept.Name, { Volume = 0.5 }, soundGroups.Iris)
			var15(roduxCall.Actions.UpdateCall(p7))
		end)
		local var33 = var14.callProtocol:listenToHandleActiveCall(function(p8) --[[ line: 158 ]]
			-- upvalues: var15 (copy), roduxCall (copy)
			var15(roduxCall.Actions.UpdateCall(p8))
		end)
		local var34 = var14.callProtocol:listenToHandleTransferCallTeleportJoin(function() --[[ line: 162 ]]
			-- upvalues: var14 (copy), var15 (copy), roduxCall (copy)
			var14.callProtocol:getCallState():andThen(function(p9) --[[ line: 165 ]]
				-- upvalues: var15 (copy), roduxCall (copy)
				var15(roduxCall.Actions.UpdateCall(p9))
			end)
		end)
		var14.callProtocol:getCallState():andThen(function(p10) --[[ line: 170 ]]
			-- upvalues: var15 (copy), roduxCall (copy)
			var15(roduxCall.Actions.UpdateCall(p10))
		end)
		
		return function() --[[ line: 174 ]]
			-- upvalues: var31 (ref), var32 (ref), var33 (ref), var34 (ref)
			var31:Disconnect()
			var32:Disconnect()
			var33:Disconnect()
			var34:Disconnect()
		end
	end, { var14.callProtocol })
	local var27, var28 = reactModule.useState(nil)
	
	if enabled() and var7 then
		reactModule.useEffect(function() --[[ line: 184 ]]
			-- upvalues: var7 (copy), var28 (ref)
			local var35 = var7:layout():connect(function(p11) --[[ line: 186 ]]
				-- upvalues: var28 (copy)
				var28(p11)
			end)
			
			return function() --[[ line: 190 ]]
				-- upvalues: var35 (ref)
				var35.disconnect()
			end
		end, {})
	end
	reactModule.useEffect(function() --[[ line: 196 ]]
		-- upvalues: var24 (ref), roduxCall (copy), var26 (ref), var19 (ref), var23 (ref), currentCamera (copy)
		local var36 = if var24 ~= roduxCall.Enums.Status.Connecting then if var24 ~= roduxCall.Enums.Status.Teleporting then if var24 ~= roduxCall.Enums.Status.Active then var24 == roduxCall.Enums.Status.Idle and game.JobId == var26 else true else true else true
		
		if var36 then
			var19(true)
		end
		var23(if var36 then "On" else "Off")
		local var37 = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ line: 209 ]]
			-- upvalues: var23 (copy), var36 (ref)
			var23(if var36 then "On" else "Off")
		end)
		
		return function() --[[ line: 213 ]]
			-- upvalues: var37 (ref)
			var37:Disconnect()
		end
	end, { var24, var26, var27 })
	reactModule.useEffect(function() --[[ line: 222 ]]
		-- upvalues: var14 (ref), callAction (copy), soundManager (copy), sounds (copy), soundGroups (copy), var15 (ref), roduxCall (copy)
		local var38 = var14.callProtocol:listenToHandleEndCall(function(p12) --[[ line: 223 ]]
			-- upvalues: callAction (copy), soundManager (copy), sounds (copy), soundGroups (copy), var15 (copy), roduxCall (copy)
			if p12.callAction == callAction.Cancel then
				soundManager:StopSound(sounds.Ringtone.Name)
				soundManager:PlaySound(sounds.HangUp.Name, { Volume = 0.5 }, soundGroups.Iris)
			elseif p12.callAction == callAction.Decline then
				soundManager:StopSound(sounds.Ringtone.Name)
				soundManager:PlaySound(sounds.CallDecline.Name, { Volume = 0.5 }, soundGroups.Iris)
			elseif p12.callAction == callAction.Finish then
				soundManager:PlaySound(sounds.HangUp.Name, { Volume = 0.5 }, soundGroups.Iris)
			end
			var15(roduxCall.Actions.UpdateCall(p12))
		end)
		
		return function() --[[ line: 237 ]]
			-- upvalues: var38 (ref)
			var38:Disconnect()
		end
	end, { var14.callProtocol })
	
	return if var18 then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1)
	}, {
		CallBar = reactModule.createElement(callBarModule, {
			size = vector2,
			activeUtc = var25,
			position = var20:map(function(p13) --[[ line: 251 ]]
				return UDim2.fromOffset(math.round(p13.X), math.round(p13.Y))
			end)
		})
	}) else nil
end