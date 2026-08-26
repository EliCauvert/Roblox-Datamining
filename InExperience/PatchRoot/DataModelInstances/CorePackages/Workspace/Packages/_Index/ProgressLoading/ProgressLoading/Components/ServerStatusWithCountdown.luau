local progressLoading = script:FindFirstAncestor("ProgressLoading")
local parent = progressLoading.Parent
local coreGuiService = game:GetService("CoreGui")
local experienceService = game:GetService("ExperienceService")
local guiService = game:GetService("GuiService")
local runService = game:GetService("RunService")
local loadingScreenTelemetryModule = require(progressLoading.LoadingScreenTelemetry)
local placeLauncherStateModule = require(progressLoading.Enums.PlaceLauncherState)
local getLoadingScreenStoreModule = require(progressLoading.Stores.getLoadingScreenStore)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local reactModule = require(parent.React)
local _ = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local queuePositionEnabledEngineFeature = game:GetEngineFeature("QueuePositionEnabled")
local sharedFlagsModule = require(parent.SharedFlags)
local fIntAutoJoinNewServerTimeMs = sharedFlagsModule.FIntAutoJoinNewServerTimeMs
local fFlagEnableLuaAppsFollowUserId = game:GetEngineFeature("ExperienceServiceFollowUserIdEnabled") and sharedFlagsModule.FFlagEnableLuaAppsFollowUserId
local useTokens = foundationModule.Hooks.useTokens

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
	-- upvalues: useTokens (ref), useLocalization (ref), reactModule (ref), guiService (ref), signalsReactModule (ref), getStoreJoinState (ref), getStoreServerStatusText (ref), fIntAutoJoinNewServerTimeMs (ref), runService (ref), experienceService (ref), placeLauncherStateModule (ref), fFlagEnableLuaAppsFollowUserId (ref), loadingScreenTelemetryModule (ref), queuePositionEnabledEngineFeature (ref), foundationModule (ref), coreGuiService (ref)
	local var1 = useTokens()
	local var2 = useLocalization({
		friendsServerIsFullJoiningNewServer = "InGame.ConnectionError.Description.FriendsServerIsFullJoiningNewServer",
		friendsServerIsFullWaitingToJoin = "InGame.ConnectionError.Description.FriendsServerIsFullWaitingToJoin",
		joinTheLine = "InGame.ConnectionError.Action.JoinTheLine",
		wantToJoinYourFriend = "InGame.ConnectionError.Description.WantToJoinYourFriend"
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
	local var9, var10 = reactModule.useBinding(0)
	local var11 = reactModule.useRef(nil)
	local var12, var13 = reactModule.useState(false)
	local var14 = reactModule.useRef(nil)
	local var15 = reactModule.useCallback(function()
		-- upvalues: var13 (ref), var14 (ref)
		var13(false)
		
		if var14.current then
			var14.current:Disconnect()
			var14.current = nil
		end
	end, {})
	local var16 = reactModule.useCallback(function()
		-- upvalues: var14 (ref), var13 (ref), fIntAutoJoinNewServerTimeMs (copy), runService (copy), var10 (ref), experienceService (copy), p1 (ref)
		if var14.current then
			return
		end
		var13(true)
		local processTime = os.clock()
		local var17 = fIntAutoJoinNewServerTimeMs / 1000
		var14.current = runService.Heartbeat:Connect(function()
			-- upvalues: processTime (ref), var17 (ref), var10 (copy), experienceService (copy), p1 (copy), var14 (copy)
			local clampedValue = math.clamp((os.clock() - processTime) / var17 * 100, 0, 100)
			var10(clampedValue)
			
			if clampedValue >= 100 then
				experienceService:LaunchExperience({ placeId = p1.placeId })
				
				if var14.current then
					var14.current:Disconnect()
					var14.current = nil
				end
			end
		end)
	end, { p1.placeId })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), placeLauncherStateModule (copy), var11 (ref)
		if var7 == placeLauncherStateModule.Queued then
			var11.current = os.clock()
		end
	end, { var7 })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), placeLauncherStateModule (copy), fFlagEnableLuaAppsFollowUserId (copy), experienceService (copy), var16 (ref), var15 (ref)
		if var7 == placeLauncherStateModule.Queued and fFlagEnableLuaAppsFollowUserId and experienceService:GetFollowUserId() > 0 then
			var16()
		else
			var15()
		end
		return function()
			-- upvalues: var15 (copy)
			var15()
		end
	end, { var7, var16, var15 })
	
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
				Text = if var12 then var2.friendsServerIsFullJoiningNewServer else var2.friendsServerIsFullWaitingToJoin
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
		ProgressBarContainer = if var12 then reactModule.createElement(foundationModule.View, {
			LayoutOrder = 2,
			tag = "col align-x-center align-y-bottom gap-xsmall size-full-0 auto-y",
			sizeConstraint = { MaxSize = Vector2.new(277, 1e999) }
		}, {
			ProgressBar = reactModule.createElement(foundationModule.Progress, {
				shape = foundationModule.Enums.ProgressShape.Bar,
				value = var9
			})
		}) else nil,
		ActionContainer = if var7 == placeLauncherStateModule.Queued and var12 and (fFlagEnableLuaAppsFollowUserId and experienceService:GetFollowUserId() > 0) then reactModule.createElement(foundationModule.View, {
			LayoutOrder = 3,
			tag = "col align-x-center align-y-bottom gap-xsmall auto-xy"
		}, {
			ActionButtonDescriptionText = reactModule.createElement(foundationModule.Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-body-medium content-system-contrast",
				Text = var2.wantToJoinYourFriend
			}),
			ActionButton = reactModule.createElement(foundationModule.Button, {
				LayoutOrder = 2,
				onActivated = reactModule.useCallback(function()
					-- upvalues: var15 (ref), var11 (ref), loadingScreenTelemetryModule (copy), fFlagEnableLuaAppsFollowUserId (copy), experienceService (copy), p1 (ref), queuePositionEnabledEngineFeature (copy)
					var15()
					loadingScreenTelemetryModule.logQueuedStateButtonClick({
						buttonName = "JoinTheLine",
						joinTargetUserId = if fFlagEnableLuaAppsFollowUserId then experienceService:GetFollowUserId() else nil,
						placeId = p1.placeId,
						positionInQueue = if queuePositionEnabledEngineFeature then experienceService:GetQueuePosition() else nil,
						timeElapsedMs = if var11.current then math.floor((os.clock() - var11.current) * 1000) else nil,
						universeId = p1.universeId
					})
				end, { p1.placeId, p1.universeId, var15 }),
				text = var2.joinTheLine
			})
		}) else nil
	})
end)