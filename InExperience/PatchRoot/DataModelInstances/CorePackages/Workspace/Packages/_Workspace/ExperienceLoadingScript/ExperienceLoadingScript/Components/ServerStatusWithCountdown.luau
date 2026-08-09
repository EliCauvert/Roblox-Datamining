local experienceLoadingScript = script:FindFirstAncestor("ExperienceLoadingScript")
local parent = experienceLoadingScript.Parent
local coreGuiService = game:GetService("CoreGui")
local experienceService = game:GetService("ExperienceService")
local guiService = game:GetService("GuiService")
local runService = game:GetService("RunService")
local loadingScreenTelemetryModule = require(experienceLoadingScript.LoadingScreenTelemetry)
local placeLauncherStateModule = require(experienceLoadingScript.Enums.PlaceLauncherState)
local getLoadingScreenStoreModule = require(experienceLoadingScript.Store.getLoadingScreenStore)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local reactModule = require(parent.React)
local _ = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local autoJoinNewServerTimeMs = game:DefineFastInt("AutoJoinNewServerTimeMs", 5000)
local queuePositionEnabledEngineFeature = game:GetEngineFeature("QueuePositionEnabled")
local fFlagEnableLuaAppsFollowUserId = game:GetEngineFeature("ExperienceServiceFollowUserIdEnabled") and require(experienceLoadingScript.Flags.FFlagEnableLuaAppsFollowUserId)
local useTokens = foundationModule.Hooks.useTokens

local function getStoreJoinState(p0) --[[ line: 33 ]]
	-- upvalues: getLoadingScreenStoreModule (ref)
	local var16 = getLoadingScreenStoreModule(p0)
	
	return if p0 and var16 and var16.getJoinState then var16.getJoinState(p0) else ""
end

local function getStoreServerStatusText(p1) --[[ line: 41 ]]
	-- upvalues: getLoadingScreenStoreModule (ref)
	local var17 = getLoadingScreenStoreModule(p1)
	
	return if p1 and var17 and var17.getServerStatusText then var17.getServerStatusText(p1) else ""
end

return reactModule.memo(function(p2) --[[ line: 58 ]]
	-- upvalues: useTokens (ref), useLocalization (ref), reactModule (ref), guiService (ref), signalsReactModule (ref), getStoreJoinState (ref), getStoreServerStatusText (ref), autoJoinNewServerTimeMs (ref), runService (ref), experienceService (ref), placeLauncherStateModule (ref), fFlagEnableLuaAppsFollowUserId (ref), loadingScreenTelemetryModule (ref), queuePositionEnabledEngineFeature (ref), foundationModule (ref), coreGuiService (ref)
	local var18 = useTokens()
	local var19 = useLocalization({
		friendsServerIsFullJoiningNewServer = "InGame.ConnectionError.Description.FriendsServerIsFullJoiningNewServer",
		friendsServerIsFullWaitingToJoin = "InGame.ConnectionError.Description.FriendsServerIsFullWaitingToJoin",
		joinTheLine = "InGame.ConnectionError.Action.JoinTheLine",
		wantToJoinYourFriend = "InGame.ConnectionError.Description.WantToJoinYourFriend"
	})
	local var20 = reactModule.useRef(0)
	local var21 = reactModule.useRef(1e999)
	local var22 = reactModule.useCallback(function() --[[ line: 69 ]]
		-- upvalues: var20 (ref), var21 (ref), guiService (copy)
		if var20.current == 0 then
			var20.current = 1
			var21.current = tick()
			
			return
		elseif tick() - var21.current <= 0.5 then
			guiService:ShowStatsBasedOnInputString("ConnectionHealth")
		end
		var20.current = 0
		var21.current = 1e999
	end, {})
	local var23 = reactModule.useCallback(function() --[[ line: 84 ]]
		-- upvalues: p2 (ref), var22 (ref)
		if not p2.isSubjectToChinaPolicies then
			var22()
		end
	end, { p2.isSubjectToChinaPolicies, var22 })
	local var24 = signalsReactModule.useSignalState(getStoreJoinState)
	local var25 = signalsReactModule.useSignalBinding(getStoreServerStatusText)
	local var26, var27 = reactModule.useBinding(0)
	local var28 = reactModule.useRef(nil)
	local var29, var30 = reactModule.useState(false)
	local var31 = reactModule.useRef(nil)
	local var32 = reactModule.useCallback(function() --[[ line: 99 ]]
		-- upvalues: var30 (ref), var31 (ref)
		var30(false)
		
		if var31.current then
			var31.current:Disconnect()
			var31.current = nil
		end
	end, {})
	local var33 = reactModule.useCallback(function() --[[ line: 107 ]]
		-- upvalues: var31 (ref), var30 (ref), autoJoinNewServerTimeMs (copy), runService (copy), var27 (ref), experienceService (copy), p2 (ref)
		if var31.current then
			return
		end
		var30(true)
		local processTime = os.clock()
		local var35 = autoJoinNewServerTimeMs / 1000
		var31.current = runService.Heartbeat:Connect(function() --[[ line: 117 ]]
			-- upvalues: processTime (ref), var35 (ref), var27 (copy), experienceService (copy), p2 (copy), var31 (copy)
			local clampedValue = math.clamp((os.clock() - processTime) / var35 * 100, 0, 100)
			var27(clampedValue)
			
			if clampedValue >= 100 then
				experienceService:LaunchExperience({ placeId = p2.placeId })
				
				if var31.current then
					var31.current:Disconnect()
					var31.current = nil
				end
			end
		end)
	end, { p2.placeId })
	reactModule.useEffect(function() --[[ line: 131 ]]
		-- upvalues: var24 (ref), placeLauncherStateModule (copy), var28 (ref)
		if var24 == placeLauncherStateModule.Queued then
			var28.current = os.clock()
		end
	end, { var24 })
	reactModule.useEffect(function() --[[ line: 137 ]]
		-- upvalues: var24 (ref), placeLauncherStateModule (copy), fFlagEnableLuaAppsFollowUserId (copy), experienceService (copy), var33 (ref), var32 (ref)
		if var24 == placeLauncherStateModule.Queued and fFlagEnableLuaAppsFollowUserId and experienceService:GetFollowUserId() > 0 then
			var33()
		else
			var32()
		end
		return function() --[[ line: 148 ]]
			-- upvalues: var32 (copy)
			var32()
		end
	end, { var24, var33, var32 })
	
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
			onActivated = var23,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			}
		}, {
			QueuedDescriptionText = if var24 == placeLauncherStateModule.Queued and fFlagEnableLuaAppsFollowUserId and experienceService:GetFollowUserId() > 0 then reactModule.createElement(foundationModule.Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-title-medium content-system-contrast",
				Text = if var29 then var19.friendsServerIsFullJoiningNewServer else var19.friendsServerIsFullWaitingToJoin
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
				Font = var18.Typography.TitleMedium.Font,
				TextSize = var18.Typography.TitleMedium.FontSize,
				TextColor3 = var18.Color.System.Contrast.Color3,
				Text = var25,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				RootLocalizationTable = coreGuiService:FindFirstChild("CoreScriptLocalization")
			})
		}),
		ProgressBarContainer = if var29 then reactModule.createElement(foundationModule.View, {
			LayoutOrder = 2,
			tag = "col align-x-center align-y-bottom gap-xsmall size-full-0 auto-y",
			sizeConstraint = { MaxSize = Vector2.new(277, 1e999) }
		}, {
			ProgressBar = reactModule.createElement(foundationModule.Progress, {
				shape = foundationModule.Enums.ProgressShape.Bar,
				value = var26
			})
		}) else nil,
		ActionContainer = if var24 == placeLauncherStateModule.Queued and var29 and (fFlagEnableLuaAppsFollowUserId and experienceService:GetFollowUserId() > 0) then reactModule.createElement(foundationModule.View, {
			LayoutOrder = 3,
			tag = "col align-x-center align-y-bottom gap-xsmall auto-xy"
		}, {
			ActionButtonDescriptionText = reactModule.createElement(foundationModule.Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-body-medium content-system-contrast",
				Text = var19.wantToJoinYourFriend
			}),
			ActionButton = reactModule.createElement(foundationModule.Button, {
				LayoutOrder = 2,
				onActivated = reactModule.useCallback(function() --[[ line: 153 ]]
					-- upvalues: var32 (ref), var28 (ref), loadingScreenTelemetryModule (copy), fFlagEnableLuaAppsFollowUserId (copy), experienceService (copy), p2 (ref), queuePositionEnabledEngineFeature (copy)
					var32()
					loadingScreenTelemetryModule.logQueuedStateButtonClick({
						buttonName = "JoinTheLine",
						joinTargetUserId = if fFlagEnableLuaAppsFollowUserId then experienceService:GetFollowUserId() else nil,
						placeId = p2.placeId,
						positionInQueue = if queuePositionEnabledEngineFeature then experienceService:GetQueuePosition() else nil,
						timeElapsedMs = if var28.current then math.floor((os.clock() - var28.current) * 1000) else nil,
						universeId = p2.universeId
					})
				end, { p2.placeId, p2.universeId, var32 }),
				text = var19.joinTheLine
			})
		}) else nil
	})
end)