local ProgressLoading = script:FindFirstAncestor("ProgressLoading")
local Parent = ProgressLoading.Parent
local CoreGui = game:GetService("CoreGui")
local ExperienceService = game:GetService("ExperienceService")
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local LoadingScreenTelemetryModule = require(ProgressLoading.LoadingScreenTelemetry)
local PlaceLauncherStateModule = require(ProgressLoading.Enums.PlaceLauncherState)
local GetLoadingScreenStoreModule = require(ProgressLoading.Stores.getLoadingScreenStore)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ReactModule = require(Parent.React)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local QueuePositionEnabledEngineFeature = game:GetEngineFeature("QueuePositionEnabled")
local SharedFlagsModule = require(Parent.SharedFlags)
local FIntAutoJoinNewServerTimeMs = SharedFlagsModule.FIntAutoJoinNewServerTimeMs
local FFlagEnableLuaAppsFollowUserId = SharedFlagsModule.FFlagEnableLuaAppsFollowUserId
local FFlagEnableLuaAppsFollowUserId1 = game:GetEngineFeature("ExperienceServiceFollowUserIdEnabled") and FFlagEnableLuaAppsFollowUserId
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration

local function getStoreJoinState(p1) --[[ Line: 36 ]]
	-- upvalues: GetLoadingScreenStoreModule (copy)
	local LoadingScreenStoreModule = GetLoadingScreenStoreModule(p1)
	
	return if p1 and LoadingScreenStoreModule and LoadingScreenStoreModule.getJoinState then LoadingScreenStoreModule.getJoinState(p1) else ""
end

local function getStoreServerStatusText(p1) --[[ Line: 44 ]]
	-- upvalues: GetLoadingScreenStoreModule (copy)
	local LoadingScreenStoreModule = GetLoadingScreenStoreModule(p1)
	
	return if p1 and LoadingScreenStoreModule and LoadingScreenStoreModule.getServerStatusText then LoadingScreenStoreModule.getServerStatusText(p1) else ""
end

return ReactModule.memo(function(p1) --[[ Line: 61 ]]
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), GuiService (copy), SignalsReactModule (copy), getStoreJoinState (copy), getStoreServerStatusText (copy), FIntAutoJoinNewServerTimeMs (copy), RunService (copy), ExperienceService (copy), PlaceLauncherStateModule (copy), FFlagEnableLuaAppsFollowUserId1 (copy), LoadingScreenTelemetryModule (copy), QueuePositionEnabledEngineFeature (copy), FoundationModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), CoreGui (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		friendsServerIsFullJoiningNewServer = "InGame.ConnectionError.Description.FriendsServerIsFullJoiningNewServer",
		friendsServerIsFullWaitingToJoin = "InGame.ConnectionError.Description.FriendsServerIsFullWaitingToJoin",
		joinTheLine = "InGame.ConnectionError.Action.JoinTheLine",
		wantToJoinYourFriend = "InGame.ConnectionError.Description.WantToJoinYourFriend"
	})
	local UseRefResult = ReactModule.useRef(0)
	local UseRefResult1 = ReactModule.useRef(1e999)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 72 ]]
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
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 87 ]]
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
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 102 ]]
		-- upvalues: UseStateResult2 (copy), UseRefResult3 (copy)
		UseStateResult2(false)
		
		if UseRefResult3.current then
			UseRefResult3.current:Disconnect()
			UseRefResult3.current = nil
		end
	end, {})
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 110 ]]
		-- upvalues: UseRefResult3 (copy), UseStateResult2 (copy), FIntAutoJoinNewServerTimeMs (upval), RunService (upval), UseBindingResult2 (copy), ExperienceService (upval), p1 (copy)
		if not UseRefResult3.current then
			UseStateResult2(true)
			local ClockTime = os.clock()
			local FIntAutoJoinNewServerTimeMsRatio = FIntAutoJoinNewServerTimeMs / 1000
			UseRefResult3.current = RunService.Heartbeat:Connect(function() --[[ Line: 120 ]]
				-- upvalues: ClockTime (copy), FIntAutoJoinNewServerTimeMsRatio (copy), UseBindingResult2 (upval), ExperienceService (upval), p1 (upval), UseRefResult3 (upval)
				local ClampedValue = math.clamp((os.clock() - ClockTime) / FIntAutoJoinNewServerTimeMsRatio * 100, 0, 100)
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
	ReactModule.useEffect(function() --[[ Line: 134 ]]
		-- upvalues: UseSignalStateResult (copy), PlaceLauncherStateModule (upval), UseRefResult2 (copy)
		if UseSignalStateResult == PlaceLauncherStateModule.Queued then
			UseRefResult2.current = os.clock()
		end
	end, { UseSignalStateResult })
	ReactModule.useEffect(function() --[[ Line: 140 ]]
		-- upvalues: UseSignalStateResult (copy), PlaceLauncherStateModule (upval), FFlagEnableLuaAppsFollowUserId1 (upval), ExperienceService (upval), UseResult3 (copy), UseResult2 (copy)
		if UseSignalStateResult == PlaceLauncherStateModule.Queued and FFlagEnableLuaAppsFollowUserId1 and ExperienceService:GetFollowUserId() > 0 then
			UseResult3()
		else
			UseResult2()
		end
		return function() --[[ Line: 151 ]]
			-- upvalues: UseResult2 (upval)
			UseResult2()
		end
	end, { UseSignalStateResult, UseResult3, UseResult2 })
	local UseResult4 = ReactModule.useCallback(function() --[[ Line: 156 ]]
		-- upvalues: UseResult2 (copy), UseRefResult2 (copy), LoadingScreenTelemetryModule (upval), FFlagEnableLuaAppsFollowUserId1 (upval), ExperienceService (upval), p1 (copy), QueuePositionEnabledEngineFeature (upval)
		UseResult2()
		LoadingScreenTelemetryModule.logQueuedStateButtonClick({
			buttonName = "JoinTheLine",
			joinTargetUserId = if FFlagEnableLuaAppsFollowUserId1 then ExperienceService:GetFollowUserId() else nil,
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
			QueuedDescriptionText = if UseSignalStateResult == PlaceLauncherStateModule.Queued and FFlagEnableLuaAppsFollowUserId1 and ExperienceService:GetFollowUserId() > 0 then ReactModule.createElement(FoundationModule.Text, {
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
				Font = if FoundationFontFaceMigration then nil else UseTokensResult.Typography.TitleMedium.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.TitleMedium.Font) else nil,
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
		ActionContainer = if UseSignalStateResult == PlaceLauncherStateModule.Queued and UseStateResult and FFlagEnableLuaAppsFollowUserId1 and ExperienceService:GetFollowUserId() > 0 then ReactModule.createElement(FoundationModule.View, {
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