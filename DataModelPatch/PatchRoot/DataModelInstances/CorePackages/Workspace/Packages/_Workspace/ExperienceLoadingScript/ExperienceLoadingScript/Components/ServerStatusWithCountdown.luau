local ExperienceLoadingScript = script:FindFirstAncestor("ExperienceLoadingScript")
local Parent = ExperienceLoadingScript.Parent
local CoreGui = game:GetService("CoreGui")
local ExperienceService = game:GetService("ExperienceService")
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local LoadingScreenTelemetryModule = require(ExperienceLoadingScript.LoadingScreenTelemetry)
local PlaceLauncherStateModule = require(ExperienceLoadingScript.Enums.PlaceLauncherState)
local GetLoadingScreenStoreModule = require(ExperienceLoadingScript.Store.getLoadingScreenStore)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ReactModule = require(Parent.React)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local AutoJoinNewServerTimeMs = game:DefineFastInt("AutoJoinNewServerTimeMs", 5000)
local QueuePositionEnabledEngineFeature = game:GetEngineFeature("QueuePositionEnabled")
local FFlagEnableLuaAppsFollowUserIdModule = require(ExperienceLoadingScript.Flags.FFlagEnableLuaAppsFollowUserId)
local FFlagEnableLuaAppsFollowUserIdModule1 = game:GetEngineFeature("ExperienceServiceFollowUserIdEnabled") and FFlagEnableLuaAppsFollowUserIdModule
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function getStoreJoinState(p1)
	-- upvalues: GetLoadingScreenStoreModule (copy)
	local LoadingScreenStoreModule = GetLoadingScreenStoreModule(p1)
	
	return if p1 and LoadingScreenStoreModule and LoadingScreenStoreModule.getJoinState then LoadingScreenStoreModule.getJoinState(p1) else ""
end

local function getStoreServerStatusText(p1)
	-- upvalues: GetLoadingScreenStoreModule (copy)
	local LoadingScreenStoreModule = GetLoadingScreenStoreModule(p1)
	
	return if p1 and LoadingScreenStoreModule and LoadingScreenStoreModule.getServerStatusText then LoadingScreenStoreModule.getServerStatusText(p1) else ""
end

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), GuiService (copy), SignalsReactModule (copy), getStoreJoinState (copy), getStoreServerStatusText (copy), AutoJoinNewServerTimeMs (copy), RunService (copy), ExperienceService (copy), PlaceLauncherStateModule (copy), FFlagEnableLuaAppsFollowUserIdModule1 (copy), LoadingScreenTelemetryModule (copy), QueuePositionEnabledEngineFeature (copy), FoundationModule (copy), CoreGui (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		friendsServerIsFullJoiningNewServer = "InGame.ConnectionError.Description.FriendsServerIsFullJoiningNewServer",
		friendsServerIsFullWaitingToJoin = "InGame.ConnectionError.Description.FriendsServerIsFullWaitingToJoin",
		joinTheLine = "InGame.ConnectionError.Action.JoinTheLine",
		wantToJoinYourFriend = "InGame.ConnectionError.Description.WantToJoinYourFriend"
	})
	local UseRefResult = ReactModule.useRef(0)
	local UseRefResult1 = ReactModule.useRef(1e999)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), GuiService (upval)
		if UseRefResult.current == 0 then
			UseRefResult.current = 1
			UseRefResult1.current = tick()
			
			return
		end
		if tick() - UseRefResult1.current <= 0.5 then
			GuiService:ShowStatsBasedOnInputString("ConnectionHealth")
		end
		UseRefResult.current = 0
		UseRefResult1.current = 1e999
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseResult (copy)
		if not p1.isSubjectToChinaPolicies then
			UseResult()
		end
	end, { p1.isSubjectToChinaPolicies, UseResult })
	local UseSignalStateResult = SignalsReactModule.useSignalState(getStoreJoinState)
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding(getStoreServerStatusText)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), UseRefResult3 (copy)
		UseStateResult2(false)
		
		if UseRefResult3.current then
			UseRefResult3.current:Disconnect()
			UseRefResult3.current = nil
		end
	end, {})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult3 (copy), UseStateResult2 (copy), AutoJoinNewServerTimeMs (upval), RunService (upval), UseBindingResult2 (copy), ExperienceService (upval), p1 (copy)
		if not UseRefResult3.current then
			UseStateResult2(true)
			local ClockTime = os.clock()
			local AutoJoinNewServerTimeMsRatio = AutoJoinNewServerTimeMs / 1000
			UseRefResult3.current = RunService.Heartbeat:Connect(function()
				-- upvalues: ClockTime (copy), AutoJoinNewServerTimeMsRatio (copy), UseBindingResult2 (upval), ExperienceService (upval), p1 (upval), UseRefResult3 (upval)
				local ClampedValue = math.clamp((os.clock() - ClockTime) / AutoJoinNewServerTimeMsRatio * 100, 0, 100)
				UseBindingResult2(ClampedValue)
				
				if ClampedValue >= 100 then
					ExperienceService:LaunchExperience({ placeId = p1.placeId })
					
					if UseRefResult3.current then
						UseRefResult3.current:Disconnect()
						UseRefResult3.current = nil
					end
				end
			end)
			
			return
		end
	end, { p1.placeId })
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), PlaceLauncherStateModule (upval), UseRefResult2 (copy)
		if UseSignalStateResult == PlaceLauncherStateModule.Queued then
			UseRefResult2.current = os.clock()
		end
	end, { UseSignalStateResult })
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), PlaceLauncherStateModule (upval), FFlagEnableLuaAppsFollowUserIdModule1 (upval), ExperienceService (upval), UseResult3 (copy), UseResult2 (copy)
		if UseSignalStateResult == PlaceLauncherStateModule.Queued and FFlagEnableLuaAppsFollowUserIdModule1 and ExperienceService:GetFollowUserId() > 0 then
			UseResult3()
		else
			UseResult2()
		end
		return function()
			-- upvalues: UseResult2 (upval)
			UseResult2()
		end
	end, { UseSignalStateResult, UseResult3, UseResult2 })
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseResult2 (copy), UseRefResult2 (copy), LoadingScreenTelemetryModule (upval), FFlagEnableLuaAppsFollowUserIdModule1 (upval), ExperienceService (upval), p1 (copy), QueuePositionEnabledEngineFeature (upval)
		UseResult2()
		LoadingScreenTelemetryModule.logQueuedStateButtonClick({
			buttonName = "JoinTheLine",
			joinTargetUserId = if FFlagEnableLuaAppsFollowUserIdModule1 then ExperienceService:GetFollowUserId() else nil,
			placeId = p1.placeId,
			positionInQueue = if QueuePositionEnabledEngineFeature then ExperienceService:GetQueuePosition() else nil,
			timeElapsedMs = if UseRefResult2.current then math.floor((os.clock() - UseRefResult2.current) * 1000) else nil,
			universeId = p1.universeId
		})
	end, { p1.placeId, p1.universeId, UseResult2 })
	
	return ReactModule.createElement(FoundationModule.View, {
		AutoLocalize = true,
		tag = "col align-x-center align-y-bottom gap-xxlarge",
		AnchorPoint = p1.anchorPoint,
		Position = p1.position,
		Size = p1.size
	}, {
		ServerStatusContainer = ReactModule.createElement(FoundationModule.View, {
			AutoLocalize = true,
			LayoutOrder = 1,
			tag = "col align-x-center align-y-bottom gap-xsmall auto-xy",
			onActivated = UseResult1,
			stateLayer = {
				affordance = FoundationModule.Enums.StateLayerAffordance.None
			}
		}, {
			QueuedDescriptionText = if UseSignalStateResult == PlaceLauncherStateModule.Queued and FFlagEnableLuaAppsFollowUserIdModule1 and ExperienceService:GetFollowUserId() > 0 then ReactModule.createElement(FoundationModule.Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-title-medium content-system-contrast",
				Text = if UseStateResult then UseLocalizationResult.friendsServerIsFullJoiningNewServer else UseLocalizationResult.friendsServerIsFullWaitingToJoin
			}) else nil,
			ServerStatusText = ReactModule.createElement("TextLabel", {
				AutoLocalize = true,
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				TextWrapped = true,
				TextScaled = false,
				TextStrokeTransparency = 1,
				ZIndex = 2,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0),
				Font = UseTokensResult.Typography.TitleMedium.Font,
				TextSize = UseTokensResult.Typography.TitleMedium.FontSize,
				TextColor3 = UseTokensResult.Color.System.Contrast.Color3,
				Text = UseSignalBindingResult,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				RootLocalizationTable = CoreGui:FindFirstChild("CoreScriptLocalization")
			})
		}),
		ProgressBarContainer = if UseStateResult then ReactModule.createElement(FoundationModule.View, {
			LayoutOrder = 2,
			tag = "col align-x-center align-y-bottom gap-xsmall size-full-0 auto-y",
			sizeConstraint = { MaxSize = Vector2.new(277, 1e999) }
		}, {
			ProgressBar = ReactModule.createElement(FoundationModule.Progress, {
				shape = FoundationModule.Enums.ProgressShape.Bar,
				value = UseBindingResult
			})
		}) else nil,
		ActionContainer = if UseSignalStateResult == PlaceLauncherStateModule.Queued and UseStateResult and FFlagEnableLuaAppsFollowUserIdModule1 and ExperienceService:GetFollowUserId() > 0 then ReactModule.createElement(FoundationModule.View, {
			LayoutOrder = 3,
			tag = "col align-x-center align-y-bottom gap-xsmall auto-xy"
		}, {
			ActionButtonDescriptionText = ReactModule.createElement(FoundationModule.Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-body-medium content-system-contrast",
				Text = UseLocalizationResult.wantToJoinYourFriend
			}),
			ActionButton = ReactModule.createElement(FoundationModule.Button, {
				LayoutOrder = 2,
				onActivated = UseResult4,
				text = UseLocalizationResult.joinTheLine
			})
		}) else nil
	})
end)