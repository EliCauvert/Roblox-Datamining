local CorePackages = game:GetService("CorePackages")
local CurrentCamera = game:GetService("Workspace").CurrentCamera
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local Sounds = require(CorePackages.Workspace.Packages.SoundManager).Sounds
local SoundGroups = require(CorePackages.Workspace.Packages.SoundManager).SoundGroups
local SoundManager = require(CorePackages.Workspace.Packages.SoundManager).SoundManager
local ReactOtterModule = require(CorePackages.Packages.ReactOtter)
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local Chrome = RobloxGui.Modules.Chrome
local EnabledFunction = require(CorePackages.Workspace.Packages.Chrome).Enabled
local ServiceModule = if EnabledFunction() then require(Chrome.Service) else nil
local ConstantsModule = require(Chrome.ChromeShared.Unibar.Constants)
local ConstantsModule1 = require(RobloxGui.Modules.TopBar.Constants)
local DependenciesModule = require(RobloxGui.Modules.ContactList.dependencies)
local RoduxCall = DependenciesModule.RoduxCall
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local UseDispatchFunction = DependenciesModule.Hooks.useDispatch
local CallAction = RoduxCall.Enums.CallAction
local CallBarModule = require(script.Parent.CallBar)
local _Vector2 = Vector2.new(200, 44)
local config = {
	callProtocol = require(CorePackages.Workspace.Packages.CallProtocol).CallProtocol.default
}

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseDispatchFunction (copy), ConstantsModule1 (copy), ReactModule (copy), ReactOtterModule (copy), CurrentCamera (copy), _Vector2 (copy), EnabledFunction (copy), ServiceModule (copy), ConstantsModule (copy), UseSelectorFunction (copy), SoundManager (copy), Sounds (copy), SoundGroups (copy), RoduxCall (copy), CallAction (copy), CallBarModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseDispatchResult = UseDispatchFunction()
	local UseDisplayScaleStateResult = ConstantsModule1.useDisplayScaleState(ConstantsModule1.TopBarButtonPadding)
	local UseDisplayScaleStateResult1 = ConstantsModule1.useDisplayScaleState(ConstantsModule1.TopBarTopMargin)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseAnimatedBindingResult2 = nil
	local UseAnimatedBindingResult
	UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding({
		X = CurrentCamera.ViewportSize.X / 2 - _Vector2.X / 2,
		Y = -_Vector2.Y
	}, function(p2)
		-- upvalues: _Vector2 (upval), UseStateResult (copy), UseStateResult2 (copy)
		if p2.Y == -_Vector2.Y and UseStateResult then
			UseStateResult2(false)
		end
	end)
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: CurrentCamera (upval), _Vector2 (upval), EnabledFunction (upval), UseDisplayScaleStateResult1 (copy), UseDisplayScaleStateResult (copy), ServiceModule (upval), ConstantsModule1 (upval), UseAnimatedBindingResult2 (ref), ReactOtterModule (upval), ConstantsModule (upval)
		local XDelta = CurrentCamera.ViewportSize.X / 2 - _Vector2.X / 2
		local NewUseDisplayScaleStateResult = if p2 == "On" then if EnabledFunction() then UseDisplayScaleStateResult1 + UseDisplayScaleStateResult else 4 else -_Vector2.Y
		
		if EnabledFunction() and ServiceModule then
			local Max = ServiceModule:layout():get().Max
			
			if CurrentCamera.ViewportSize.X / 2 - _Vector2.X / 2 < Max.X + 12 then
				if CurrentCamera.ViewportSize.X < Max.X + 24 + _Vector2.X then
					if p2 == "On" then
						NewUseDisplayScaleStateResult = ConstantsModule1.ApplyDisplayScale(ConstantsModule1.TopBarHeight) + 10
					end
				else
					XDelta = Max.X + 12
				end
			end
		end
		UseAnimatedBindingResult2({
			X = ReactOtterModule.spring(XDelta, ConstantsModule.MENU_ANIMATION_SPRING),
			Y = ReactOtterModule.spring(NewUseDisplayScaleStateResult, ConstantsModule.MENU_ANIMATION_SPRING)
		})
	end, {})
	local UseSelectorResult = UseSelectorFunction((ReactModule.useCallback(function(p2)
		return if p2.Call.currentCall == nil then nil else p2.Call.currentCall.status
	end, {})))
	local UseSelectorResult1 = UseSelectorFunction((ReactModule.useCallback(function(p2)
		return if p2.Call.currentCall and p2.Call.currentCall.activeUtc then p2.Call.currentCall.activeUtc else 0
	end)))
	local UseSelectorResult2 = UseSelectorFunction((ReactModule.useCallback(function(p2)
		return if p2.Call.currentCall == nil then nil else p2.Call.currentCall.instanceId
	end)))
	ReactModule.useEffect(function()
		-- upvalues: JoinResult (copy), SoundManager (upval), Sounds (upval), SoundGroups (upval), UseDispatchResult (copy), RoduxCall (upval)
		local ListenToHandleConnectingCallResult = JoinResult.callProtocol:listenToHandleConnectingCall(function(p2)
			-- upvalues: SoundManager (upval), Sounds (upval), SoundGroups (upval), UseDispatchResult (upval), RoduxCall (upval)
			SoundManager:PlaySound(Sounds.Ringtone.Name, { Volume = 0.5, Looped = true }, SoundGroups.Iris)
			UseDispatchResult(RoduxCall.Actions.UpdateCall(p2))
		end)
		local ListenToHandleTeleportingCallResult = JoinResult.callProtocol:listenToHandleTeleportingCall(function(p2)
			-- upvalues: SoundManager (upval), Sounds (upval), SoundGroups (upval), UseDispatchResult (upval), RoduxCall (upval)
			SoundManager:StopSound(Sounds.Ringtone.Name)
			SoundManager:PlaySound(Sounds.CallAccept.Name, { Volume = 0.5 }, SoundGroups.Iris)
			UseDispatchResult(RoduxCall.Actions.UpdateCall(p2))
		end)
		local ListenToHandleActiveCallResult = JoinResult.callProtocol:listenToHandleActiveCall(function(p2)
			-- upvalues: UseDispatchResult (upval), RoduxCall (upval)
			UseDispatchResult(RoduxCall.Actions.UpdateCall(p2))
		end)
		local ListenToHandleTransferCallTeleportJoinResult = JoinResult.callProtocol:listenToHandleTransferCallTeleportJoin(function()
			-- upvalues: JoinResult (upval), UseDispatchResult (upval), RoduxCall (upval)
			JoinResult.callProtocol:getCallState():andThen(function(Result)
				-- upvalues: UseDispatchResult (upval), RoduxCall (upval)
				UseDispatchResult(RoduxCall.Actions.UpdateCall(Result))
			end)
		end)
		JoinResult.callProtocol:getCallState():andThen(function(Result)
			-- upvalues: UseDispatchResult (upval), RoduxCall (upval)
			UseDispatchResult(RoduxCall.Actions.UpdateCall(Result))
		end)
		
		return function()
			-- upvalues: ListenToHandleConnectingCallResult (copy), ListenToHandleTeleportingCallResult (copy), ListenToHandleActiveCallResult (copy), ListenToHandleTransferCallTeleportJoinResult (copy)
			ListenToHandleConnectingCallResult:Disconnect()
			ListenToHandleTeleportingCallResult:Disconnect()
			ListenToHandleActiveCallResult:Disconnect()
			ListenToHandleTransferCallTeleportJoinResult:Disconnect()
		end
	end, { JoinResult.callProtocol })
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	
	if EnabledFunction() and ServiceModule then
		ReactModule.useEffect(function()
			-- upvalues: ServiceModule (upval), UseStateResult2_1 (copy)
			local Connection = ServiceModule:layout():connect(function(p2)
				-- upvalues: UseStateResult2_1 (upval)
				UseStateResult2_1(p2)
			end)
			
			return function()
				-- upvalues: Connection (copy)
				Connection.disconnect()
			end
		end, {})
	end
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), RoduxCall (upval), UseSelectorResult2 (copy), UseStateResult2 (copy), UseResult (copy), CurrentCamera (upval)
		local IsUseSelectorResultMatch: boolean = UseSelectorResult == RoduxCall.Enums.Status.Connecting or (UseSelectorResult == RoduxCall.Enums.Status.Teleporting or (UseSelectorResult == RoduxCall.Enums.Status.Active or UseSelectorResult == RoduxCall.Enums.Status.Idle and game.JobId == UseSelectorResult2))
		
		if IsUseSelectorResultMatch then
			UseStateResult2(true)
		end
		UseResult(if IsUseSelectorResultMatch then "On" else "Off")
		local Connection = CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
			-- upvalues: UseResult (upval), IsUseSelectorResultMatch (copy)
			UseResult(if IsUseSelectorResultMatch then "On" else "Off")
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { UseSelectorResult, UseSelectorResult2, UseStateResult1 })
	ReactModule.useEffect(function()
		-- upvalues: JoinResult (copy), CallAction (upval), SoundManager (upval), Sounds (upval), SoundGroups (upval), UseDispatchResult (copy), RoduxCall (upval)
		local ListenToHandleEndCallResult = JoinResult.callProtocol:listenToHandleEndCall(function(p2)
			-- upvalues: CallAction (upval), SoundManager (upval), Sounds (upval), SoundGroups (upval), UseDispatchResult (upval), RoduxCall (upval)
			if p2.callAction == CallAction.Cancel then
				SoundManager:StopSound(Sounds.Ringtone.Name)
				SoundManager:PlaySound(Sounds.HangUp.Name, { Volume = 0.5 }, SoundGroups.Iris)
			elseif p2.callAction == CallAction.Decline then
				SoundManager:StopSound(Sounds.Ringtone.Name)
				SoundManager:PlaySound(Sounds.CallDecline.Name, { Volume = 0.5 }, SoundGroups.Iris)
			elseif p2.callAction == CallAction.Finish then
				SoundManager:PlaySound(Sounds.HangUp.Name, { Volume = 0.5 }, SoundGroups.Iris)
			end
			UseDispatchResult(RoduxCall.Actions.UpdateCall(p2))
		end)
		
		return function()
			-- upvalues: ListenToHandleEndCallResult (copy)
			ListenToHandleEndCallResult:Disconnect()
		end
	end, { JoinResult.callProtocol })
	
	return if UseStateResult then ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1)
	}, {
		CallBar = ReactModule.createElement(CallBarModule, {
			size = _Vector2,
			activeUtc = UseSelectorResult1,
			position = UseAnimatedBindingResult:map(function(Vector): UDim2
				return UDim2.fromOffset(math.round(Vector.X), (math.round(Vector.Y)))
			end)
		})
	}) else nil
end