local TiltLoadingScreen = script:FindFirstAncestor("TiltLoadingScreen")
local Parent = TiltLoadingScreen.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local CoreGui = game:GetService("CoreGui")
local LocalizationService = game:GetService("LocalizationService")
local RunService = game:GetService("RunService")
local ConstantsModule = require(TiltLoadingScreen.Constants)
local _ = require(TiltLoadingScreen.Types)
local FooterModule = require(Parent.Components.Footer)
local Button = FoundationModule.Button
local Progress = FoundationModule.Progress
local Text = FoundationModule.Text
local View = FoundationModule.View
local Enums = FoundationModule.Enums
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local FIntAutoJoinNewServerTimeMs = require(Parent1.SharedFlags).FIntAutoJoinNewServerTimeMs
local IsPioneerLaunchFunction = require(Parent1.PioneerUtils).isPioneerLaunch

local function _(p1) --[[ Line: 28 | Named "localizeUiMessage" ]]
	-- upvalues: CoreGui (copy), LocalizationService (copy)
	local CoreScriptLocalization = CoreGui:FindFirstChild("CoreScriptLocalization")
	
	if CoreScriptLocalization then
		local Success, Result = pcall(function() --[[ Line: 33 ]]
			-- upvalues: CoreScriptLocalization (copy), LocalizationService (upval), CoreGui (upval), p1 (copy)
			return CoreScriptLocalization:GetTranslator(LocalizationService.RobloxLocaleId):Translate(CoreGui, p1)
		end)
		
		return if Success then Result else p1
	else
		return p1
	end
end

return ReactModule.memo(function(Frame) --[[ Line: 40 | Named "TiltLoadingScreenStatusPanel" ]]
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), FIntAutoJoinNewServerTimeMs (copy), RunService (copy), ConstantsModule (copy), CoreGui (copy), LocalizationService (copy), View (copy), IsPioneerLaunchFunction (copy), Enums (copy), Text (copy), Progress (copy), Button (copy), FooterModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		antiAddictionText = "Authentication.Login.WeChat.AntiAddictionText",
		dontWantToWait = "InGame.ConnectionError.Description.DontWantToWait",
		friendsServerIsFullJoiningNewServer = "InGame.ConnectionError.Description.FriendsServerIsFullJoiningNewServer",
		friendsServerIsFullWaitingToJoin = "InGame.ConnectionError.Description.FriendsServerIsFullWaitingToJoin",
		joinNewServer = "InGame.ConnectionError.Action.JoinNewServer",
		joinTheLine = "InGame.ConnectionError.Action.JoinTheLine",
		statusGameEnded = "InGame.ConnectionError.PlacelaunchGameEnded",
		statusHttpError = "InGame.ConnectionError.PlacelaunchHttpError",
		statusJoining = "InGame.ConnectionError.Joining",
		wantToJoinYourFriend = "InGame.ConnectionError.Description.WantToJoinYourFriend",
		statusQueued = {
			"InGame.ConnectionError.Queue",
			POSITION = tostring(Frame.queuePosition or "")
		}
	})
	local UseRefResult = ReactModule.useRef(-1e999)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 64 ]]
		-- upvalues: UseStateResult2 (copy), UseRefResult1 (copy)
		UseStateResult2(false)
		
		if UseRefResult1.current then
			UseRefResult1.current:Disconnect()
			UseRefResult1.current = nil
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 72 ]]
		-- upvalues: UseRefResult1 (copy), UseStateResult2 (copy), FIntAutoJoinNewServerTimeMs (upval), RunService (upval), UseBindingResult2 (copy), UseResult (copy), Frame (copy)
		if not UseRefResult1.current then
			UseStateResult2(true)
			local ClockTime = os.clock()
			local FIntAutoJoinNewServerTimeMsRatio = FIntAutoJoinNewServerTimeMs / 1000
			UseRefResult1.current = RunService.Heartbeat:Connect(function() --[[ Line: 81 ]]
				-- upvalues: ClockTime (copy), FIntAutoJoinNewServerTimeMsRatio (copy), UseBindingResult2 (upval), UseResult (upval), Frame (upval)
				local ClampedValue = math.clamp((os.clock() - ClockTime) / FIntAutoJoinNewServerTimeMsRatio * 100, 0, 100)
				UseBindingResult2(ClampedValue)
				
				if ClampedValue >= 100 then
					UseResult()
					Frame.onAutoJoinNewServer()
				end
			end)
			
			return
		end
	end, { Frame.onAutoJoinNewServer, UseResult })
	ReactModule.useEffect(function() --[[ Line: 92 ]]
		-- upvalues: Frame (copy), ConstantsModule (upval), UseRefResult2 (copy)
		if Frame.status == ConstantsModule.QUEUED_STATE then
			UseRefResult2.current = os.clock()
		end
	end, { Frame.status })
	ReactModule.useEffect(function() --[[ Line: 98 ]]
		-- upvalues: Frame (copy), ConstantsModule (upval), UseResult1 (copy), UseResult (copy)
		if Frame.status == ConstantsModule.QUEUED_STATE and Frame.queueTreatment == ConstantsModule.AUTO_JOIN_TREATMENT and Frame.followUserId > 0 then
			UseResult1()
		else
			UseResult()
		end
		return UseResult
	end, {
		Frame.status,
		Frame.queueTreatment,
		Frame.followUserId,
		UseResult1,
		UseResult
	})
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 112 ]]
		-- upvalues: Frame (copy), UseRefResult (copy), ConstantsModule (upval)
		if Frame.isSubjectToChinaPolicies then return end
		local ClockTime = os.clock()
		
		if ClockTime - UseRefResult.current <= ConstantsModule.DOUBLE_TAP_WINDOW_SECONDS then
			Frame.onShowConnectionHealth()
			UseRefResult.current = -1e999
			
			return
		else
			UseRefResult.current = ClockTime
		end
	end, {
		Frame.isSubjectToChinaPolicies,
		Frame.onShowConnectionHealth
	})
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 125 ]]
		-- upvalues: UseResult (copy), Frame (copy), UseRefResult2 (copy)
		UseResult()
		Frame.onJoinTheLine(if UseRefResult2.current then math.floor((os.clock() - UseRefResult2.current) * 1000) else nil)
	end, { Frame.onJoinTheLine, UseResult })
	local UseResult4 = ReactModule.useCallback(function() --[[ Line: 132 ]]
		-- upvalues: Frame (copy), UseRefResult2 (copy)
		Frame.onJoinNewServer(if UseRefResult2.current then math.floor((os.clock() - UseRefResult2.current) * 1000) else nil)
	end, { Frame.onJoinNewServer })
	local IsQueueTreatmentMatch: boolean = Frame.status == ConstantsModule.QUEUED_STATE and Frame.queueTreatment == ConstantsModule.JOIN_NEW_SERVER_TREATMENT
	local UseStateResult1 = Frame.status == ConstantsModule.QUEUED_STATE and (Frame.queueTreatment == ConstantsModule.AUTO_JOIN_TREATMENT and Frame.followUserId > 0) and UseStateResult
	local FriendsServerIsFullJoiningNewServer = if Frame.status == ConstantsModule.QUEUED_STATE and Frame.followUserId > 0 and Frame.queueTreatment ~= nil then if UseStateResult then UseLocalizationResult.friendsServerIsFullJoiningNewServer else UseLocalizationResult.friendsServerIsFullWaitingToJoin else nil
	local Entry = ({
		Joining = UseLocalizationResult.statusJoining,
		GameEnded = UseLocalizationResult.statusGameEnded,
		HttpError = UseLocalizationResult.statusHttpError
	})[Frame.status]
	local Result1 = nil
	
	if Frame.status == ConstantsModule.QUEUED_STATE and Frame.queuePosition ~= nil then
		Result1 = UseLocalizationResult.statusQueued
	elseif Entry then
		Result1 = Entry
	else
		local StatusText = Frame.statusText
		local CoreScriptLocalization = CoreGui:FindFirstChild("CoreScriptLocalization")
		
		if CoreScriptLocalization then
			local Success, Result = pcall(function() --[[ Line: 33 ]]
				-- upvalues: CoreScriptLocalization (copy), LocalizationService (upval), CoreGui (upval), StatusText (copy)
				return CoreScriptLocalization:GetTranslator(LocalizationService.RobloxLocaleId):Translate(CoreGui, StatusText)
			end)
			Result1 = if Success then Result else StatusText
		else
			Result1 = StatusText
		end
	end
	return ReactModule.createElement(View, {
		tag = "col align-x-center align-y-bottom gap-large size-full-0 auto-y padding-x-xlarge padding-bottom-xlarge",
		testId = "tilt-loading-screen-status-panel",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Status = ReactModule.createElement(View, {
			LayoutOrder = 1,
			testId = "tilt-loading-screen-status",
			tag = {
				["col align-x-center gap-small size-full-0 auto-y"] = true,
				["padding-bottom-small"] = IsPioneerLaunchFunction()
			},
			onActivated = UseResult2,
			stateLayer = { affordance = Enums.StateLayerAffordance.None }
		}, {
			Policy = if Frame.isSubjectToChinaPolicies then ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-center content-system-contrast",
				Text = UseLocalizationResult.antiAddictionText
			}) else nil,
			QueueDescription = if FriendsServerIsFullJoiningNewServer then ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-title-medium content-system-contrast",
				testId = "tilt-loading-screen-queue-description",
				Text = FriendsServerIsFullJoiningNewServer
			}) else nil,
			StatusText = if Result1 == "" then nil else ReactModule.createElement(Text, {
				LayoutOrder = 3,
				tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-center content-system-contrast",
				Text = Result1
			})
		}),
		Countdown = if UseStateResult then ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col align-x-center size-full-0 auto-y"
		}, {
			ProgressBar = ReactModule.createElement(Progress, {
				testId = "tilt-loading-screen-auto-join-progress",
				shape = Enums.ProgressShape.Bar,
				value = UseBindingResult
			})
		}) else nil,
		JoinNewServerAction = if IsQueueTreatmentMatch then ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = "col align-x-center gap-xsmall auto-xy"
		}, {
			Description = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-body-medium content-system-contrast",
				Text = UseLocalizationResult.dontWantToWait
			}),
			Button = ReactModule.createElement(Button, {
				LayoutOrder = 2,
				testId = "tilt-loading-screen-join-new-server",
				onActivated = UseResult4,
				text = UseLocalizationResult.joinNewServer
			})
		}) else nil,
		JoinTheLineAction = if UseStateResult1 then ReactModule.createElement(View, {
			LayoutOrder = 4,
			tag = "col align-x-center gap-xsmall auto-xy"
		}, {
			Description = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-body-medium content-system-contrast",
				Text = UseLocalizationResult.wantToJoinYourFriend
			}),
			Button = ReactModule.createElement(Button, {
				LayoutOrder = 2,
				testId = "tilt-loading-screen-join-the-line",
				onActivated = UseResult3,
				text = UseLocalizationResult.joinTheLine
			})
		}) else nil,
		RobloxWordmark = if IsPioneerLaunchFunction() then ReactModule.createElement(FooterModule, {
			LayoutOrder = 5,
			textTestId = "tilt-loading-screen-pre-logo-text",
			wordmarkTestId = "tilt-loading-screen-roblox-wordmark"
		}) else nil
	})
end)