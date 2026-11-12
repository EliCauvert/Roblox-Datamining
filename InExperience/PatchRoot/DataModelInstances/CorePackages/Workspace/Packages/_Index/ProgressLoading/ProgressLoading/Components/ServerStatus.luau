local ProgressLoading = script:FindFirstAncestor("ProgressLoading")
local Parent = ProgressLoading.Parent
local CoreGui = game:GetService("CoreGui")
local ExperienceService = game:GetService("ExperienceService")
local GuiService = game:GetService("GuiService")
local LoadingScreenTelemetryModule = require(ProgressLoading.LoadingScreenTelemetry)
local PlaceLauncherStateModule = require(ProgressLoading.Enums.PlaceLauncherState)
local GetLoadingScreenStoreModule = require(ProgressLoading.Stores.getLoadingScreenStore)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ReactModule = require(Parent.React)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local QueuePositionEnabledEngineFeature = game:GetEngineFeature("QueuePositionEnabled")
local FFlagEnableLuaAppsFollowUserId = require(Parent.SharedFlags).FFlagEnableLuaAppsFollowUserId
local FFlagEnableLuaAppsFollowUserId1 = game:GetEngineFeature("ExperienceServiceFollowUserIdEnabled") and FFlagEnableLuaAppsFollowUserId

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
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), GuiService (copy), SignalsReactModule (copy), getStoreJoinState (copy), getStoreServerStatusText (copy), PlaceLauncherStateModule (copy), LoadingScreenTelemetryModule (copy), FFlagEnableLuaAppsFollowUserId1 (copy), ExperienceService (copy), QueuePositionEnabledEngineFeature (copy), FoundationModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), CoreGui (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		queuedDescription = "InGame.ConnectionError.Description.FriendsServerIsFullWaitingToJoin",
		dontWantToWait = "InGame.ConnectionError.Description.DontWantToWait",
		joinNewServer = "InGame.ConnectionError.Action.JoinNewServer"
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
	local UseRefResult2 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), PlaceLauncherStateModule (upval), UseRefResult2 (copy)
		if UseSignalStateResult == PlaceLauncherStateModule.Queued then
			UseRefResult2.current = os.clock()
		end
	end, { UseSignalStateResult })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult2 (copy), LoadingScreenTelemetryModule (upval), FFlagEnableLuaAppsFollowUserId1 (upval), ExperienceService (upval), p1 (copy), QueuePositionEnabledEngineFeature (upval)
		LoadingScreenTelemetryModule.logQueuedStateButtonClick({
			buttonName = "JoinNewServer",
			joinTargetUserId = if FFlagEnableLuaAppsFollowUserId1 then ExperienceService:GetFollowUserId() else nil,
			placeId = p1.placeId,
			positionInQueue = if QueuePositionEnabledEngineFeature then ExperienceService:GetQueuePosition() else nil,
			timeElapsedMs = if UseRefResult2.current then math.floor((os.clock() - UseRefResult2.current) * 1000) else nil,
			universeId = p1.universeId
		})
		ExperienceService:LaunchExperience({ placeId = p1.placeId })
	end, { p1.placeId, p1.universeId })
	
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
				Text = UseLocalizationResult.queuedDescription
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
		ActionContainer = if UseSignalStateResult == PlaceLauncherStateModule.Queued then ReactModule.createElement(FoundationModule.View, {
			LayoutOrder = 2,
			tag = "col align-x-center align-y-bottom gap-xsmall auto-xy"
		}, {
			ActionButtonDescriptionText = ReactModule.createElement(FoundationModule.Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-body-medium content-system-contrast",
				Text = UseLocalizationResult.dontWantToWait
			}),
			ActionButton = ReactModule.createElement(FoundationModule.Button, {
				LayoutOrder = 2,
				onActivated = UseResult2,
				text = UseLocalizationResult.joinNewServer
			})
		}) else nil
	})
end)