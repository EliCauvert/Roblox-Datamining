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

local function getStoreJoinState(p1)
	-- upvalues: getLoadingScreenStoreModule (ref)
	local var1 = getLoadingScreenStoreModule(p1)
	
	return if p1 and var1 and var1.getJoinState then var1.getJoinState(p1) else ""
end

local function getStoreServerStatusText(p1)
	-- upvalues: getLoadingScreenStoreModule (ref)
	local var1 = getLoadingScreenStoreModule(p1)
	
	return if p1 and var1 and var1.getServerStatusText then var1.getServerStatusText(p1) else ""
end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), useLocalization (ref), reactModule (ref), guiService (ref), signalsReactModule (ref), getStoreJoinState (ref), getStoreServerStatusText (ref), placeLauncherStateModule (ref), loadingScreenTelemetryModule (ref), fFlagEnableLuaAppsFollowUserId (ref), experienceService (ref), queuePositionEnabledEngineFeature (ref), foundationModule (ref), coreGuiService (ref)
	local var1 = useTokens()
	local var2 = useLocalization({
		queuedDescription = "InGame.ConnectionError.Description.FriendsServerIsFullWaitingToJoin",
		dontWantToWait = "InGame.ConnectionError.Description.DontWantToWait",
		joinNewServer = "InGame.ConnectionError.Action.JoinNewServer"
	})
	local var3 = reactModule.useRef(0)
	local var4 = reactModule.useRef(1e999)
	local var5 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var4 (ref), guiService (copy)
		if var3.current == 0 then
			var3.current = 1
			var4.current = tick()
			
			return
		elseif tick() - var4.current <= 0.5 then
			guiService:ShowStatsBasedOnInputString("ConnectionHealth")
		end
		var3.current = 0
		var4.current = 1e999
	end, {})
	local var6 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var5 (ref)
		if not p1.isSubjectToChinaPolicies then
			var5()
		end
	end, { p1.isSubjectToChinaPolicies, var5 })
	local var7 = signalsReactModule.useSignalState(getStoreJoinState)
	local var8 = signalsReactModule.useSignalBinding(getStoreServerStatusText)
	local var9 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), placeLauncherStateModule (copy), var9 (ref)
		if var7 == placeLauncherStateModule.Queued then
			var9.current = os.clock()
		end
	end, { var7 })
	
	return reactModule.createElement(foundationModule.View, {
		AutoLocalize = true,
		tag = "col align-x-center align-y-bottom gap-xxlarge",
		AnchorPoint = p1.anchorPoint,
		Position = p1.position,
		Size = p1.size
	}, {
		ServerStatusContainer = reactModule.createElement(foundationModule.View, {
			AutoLocalize = true,
			LayoutOrder = 1,
			tag = "col align-x-center align-y-bottom gap-xsmall auto-xy",
			onActivated = var6,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			}
		}, {
			QueuedDescriptionText = if var7 == placeLauncherStateModule.Queued and fFlagEnableLuaAppsFollowUserId and experienceService:GetFollowUserId() > 0 then reactModule.createElement(foundationModule.Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-title-medium content-system-contrast",
				Text = var2.queuedDescription
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
				Font = var1.Typography.TitleMedium.Font,
				TextSize = var1.Typography.TitleMedium.FontSize,
				TextColor3 = var1.Color.System.Contrast.Color3,
				Text = var8,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				RootLocalizationTable = coreGuiService:FindFirstChild("CoreScriptLocalization")
			})
		}),
		ActionContainer = if var7 == placeLauncherStateModule.Queued then reactModule.createElement(foundationModule.View, {
			LayoutOrder = 2,
			tag = "col align-x-center align-y-bottom gap-xsmall auto-xy"
		}, {
			ActionButtonDescriptionText = reactModule.createElement(foundationModule.Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-body-medium content-system-contrast",
				Text = var2.dontWantToWait
			}),
			ActionButton = reactModule.createElement(foundationModule.Button, {
				LayoutOrder = 2,
				onActivated = reactModule.useCallback(function()
					-- upvalues: var9 (ref), loadingScreenTelemetryModule (copy), fFlagEnableLuaAppsFollowUserId (copy), experienceService (copy), p1 (ref), queuePositionEnabledEngineFeature (copy)
					loadingScreenTelemetryModule.logQueuedStateButtonClick({
						buttonName = "JoinNewServer",
						joinTargetUserId = if fFlagEnableLuaAppsFollowUserId then experienceService:GetFollowUserId() else nil,
						placeId = p1.placeId,
						positionInQueue = if queuePositionEnabledEngineFeature then experienceService:GetQueuePosition() else nil,
						timeElapsedMs = if var9.current then math.floor((os.clock() - var9.current) * 1000) else nil,
						universeId = p1.universeId
					})
					experienceService:LaunchExperience({ placeId = p1.placeId })
				end, { p1.placeId, p1.universeId }),
				text = var2.joinNewServer
			})
		}) else nil
	})
end)