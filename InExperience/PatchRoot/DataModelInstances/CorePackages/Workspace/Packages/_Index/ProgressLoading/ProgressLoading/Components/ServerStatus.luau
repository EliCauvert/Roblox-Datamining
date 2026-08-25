local progressLoading = script:FindFirstAncestor("ProgressLoading")
local parent = progressLoading.Parent
local coreGuiService = game:GetService("CoreGui")
local experienceService = game:GetService("ExperienceService")
local guiService = game:GetService("GuiService")
local loadingScreenTelemetryModule = require(progressLoading.LoadingScreenTelemetry)
local placeLauncherStateModule = require(progressLoading.Enums.PlaceLauncherState)
local getLoadingScreenStoreModule = require(progressLoading.Stores.getLoadingScreenStore)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local reactModule = require(parent.React)
local _ = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local useTokens = foundationModule.Hooks.useTokens
local queuePositionEnabledEngineFeature = game:GetEngineFeature("QueuePositionEnabled")
local fFlagEnableLuaAppsFollowUserId = game:GetEngineFeature("ExperienceServiceFollowUserIdEnabled") and require(parent.SharedFlags).FFlagEnableLuaAppsFollowUserId

local function getStoreJoinState(p0)
	-- upvalues: getLoadingScreenStoreModule (ref)
	local var14 = getLoadingScreenStoreModule(p0)
	
	return if p0 and var14 and var14.getJoinState then var14.getJoinState(p0) else ""
end

local function getStoreServerStatusText(p1)
	-- upvalues: getLoadingScreenStoreModule (ref)
	local var15 = getLoadingScreenStoreModule(p1)
	
	return if p1 and var15 and var15.getServerStatusText then var15.getServerStatusText(p1) else ""
end

return reactModule.memo(function(p2)
	-- upvalues: useTokens (ref), useLocalization (ref), reactModule (ref), guiService (ref), signalsReactModule (ref), getStoreJoinState (ref), getStoreServerStatusText (ref), placeLauncherStateModule (ref), loadingScreenTelemetryModule (ref), fFlagEnableLuaAppsFollowUserId (ref), experienceService (ref), queuePositionEnabledEngineFeature (ref), foundationModule (ref), coreGuiService (ref)
	local var16 = useTokens()
	local var17 = useLocalization({
		queuedDescription = "InGame.ConnectionError.Description.FriendsServerIsFullWaitingToJoin",
		dontWantToWait = "InGame.ConnectionError.Description.DontWantToWait",
		joinNewServer = "InGame.ConnectionError.Action.JoinNewServer"
	})
	local var18 = reactModule.useRef(0)
	local var19 = reactModule.useRef(1e999)
	local var20 = reactModule.useCallback(function()
		-- upvalues: var18 (ref), var19 (ref), guiService (copy)
		if var18.current == 0 then
			var18.current = 1
			var19.current = tick()
			
			return
		elseif tick() - var19.current <= 0.5 then
			guiService:ShowStatsBasedOnInputString("ConnectionHealth")
		end
		var18.current = 0
		var19.current = 1e999
	end, {})
	local var21 = reactModule.useCallback(function()
		-- upvalues: p2 (ref), var20 (ref)
		if not p2.isSubjectToChinaPolicies then
			var20()
		end
	end, { p2.isSubjectToChinaPolicies, var20 })
	local var22 = signalsReactModule.useSignalState(getStoreJoinState)
	local var23 = signalsReactModule.useSignalBinding(getStoreServerStatusText)
	local var24 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var22 (ref), placeLauncherStateModule (copy), var24 (ref)
		if var22 == placeLauncherStateModule.Queued then
			var24.current = os.clock()
		end
	end, { var22 })
	
	return reactModule.createElement(foundationModule.View, {
		AutoLocalize = true,
		tag = "col align-x-center align-y-bottom gap-xxlarge",
		AnchorPoint = p2.anchorPoint,
		Position = p2.position,
		Size = p2.size
	}, {
		ServerStatusContainer = reactModule.createElement(foundationModule.View, {
			AutoLocalize = true,
			LayoutOrder = 1,
			tag = "col align-x-center align-y-bottom gap-xsmall auto-xy",
			onActivated = var21,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			}
		}, {
			QueuedDescriptionText = if var22 == placeLauncherStateModule.Queued and fFlagEnableLuaAppsFollowUserId and experienceService:GetFollowUserId() > 0 then reactModule.createElement(foundationModule.Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-title-medium content-system-contrast",
				Text = var17.queuedDescription
			}) else nil,
			ServerStatusText = reactModule.createElement("TextLabel", {
				AutoLocalize = true,
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				TextWrapped = true,
				TextScaled = false,
				TextStrokeTransparency = 1,
				ZIndex = 2,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0),
				Font = var16.Typography.TitleMedium.Font,
				TextSize = var16.Typography.TitleMedium.FontSize,
				TextColor3 = var16.Color.System.Contrast.Color3,
				Text = var23,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				RootLocalizationTable = coreGuiService:FindFirstChild("CoreScriptLocalization")
			})
		}),
		ActionContainer = if var22 == placeLauncherStateModule.Queued then reactModule.createElement(foundationModule.View, {
			LayoutOrder = 2,
			tag = "col align-x-center align-y-bottom gap-xsmall auto-xy"
		}, {
			ActionButtonDescriptionText = reactModule.createElement(foundationModule.Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-body-medium content-system-contrast",
				Text = var17.dontWantToWait
			}),
			ActionButton = reactModule.createElement(foundationModule.Button, {
				LayoutOrder = 2,
				onActivated = reactModule.useCallback(function()
					-- upvalues: var24 (ref), loadingScreenTelemetryModule (copy), fFlagEnableLuaAppsFollowUserId (copy), experienceService (copy), p2 (ref), queuePositionEnabledEngineFeature (copy)
					loadingScreenTelemetryModule.logQueuedStateButtonClick({
						buttonName = "JoinNewServer",
						joinTargetUserId = if fFlagEnableLuaAppsFollowUserId then experienceService:GetFollowUserId() else nil,
						placeId = p2.placeId,
						positionInQueue = if queuePositionEnabledEngineFeature then experienceService:GetQueuePosition() else nil,
						timeElapsedMs = if var24.current then math.floor((os.clock() - var24.current) * 1000) else nil,
						universeId = p2.universeId
					})
					experienceService:LaunchExperience({ placeId = p2.placeId })
				end, { p2.placeId, p2.universeId }),
				text = var17.joinNewServer
			})
		}) else nil
	})
end)