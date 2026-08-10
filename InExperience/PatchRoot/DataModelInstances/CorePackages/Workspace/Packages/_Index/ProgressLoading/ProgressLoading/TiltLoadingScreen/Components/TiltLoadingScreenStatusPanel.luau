local tiltLoadingScreen = script:FindFirstAncestor("TiltLoadingScreen")
local parent = tiltLoadingScreen.Parent.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local coreGuiService = game:GetService("CoreGui")
local localizationService = game:GetService("LocalizationService")
local runService = game:GetService("RunService")
local constantsModule = require(tiltLoadingScreen.Constants)
local _ = require(tiltLoadingScreen.Types)
local button = foundationModule.Button
local image = foundationModule.Image
local progress = foundationModule.Progress
local text = foundationModule.Text
local view = foundationModule.View
local enums = foundationModule.Enums
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = localizationModule.Hooks.useLocalization
local sharedFlagsModule = require(parent.SharedFlags)
local fIntAutoJoinNewServerTimeMs = sharedFlagsModule.FIntAutoJoinNewServerTimeMs
local fFlagDebugEnablePioneerUX = sharedFlagsModule.FFlagDebugEnablePioneerUX
local fStringTiltLoadingScreenPreLogoText = sharedFlagsModule.FStringTiltLoadingScreenPreLogoText

local function _(p0) --[[ line: 30 | named "localizeUiMessage" ]]
	-- upvalues: coreGuiService (ref), localizationService (ref)
	local coreScriptLocalization = coreGuiService:FindFirstChild("CoreScriptLocalization")
	
	if not coreScriptLocalization then
		return p0
	end
	local ok, status = pcall(function() --[[ line: 35 ]]
		-- upvalues: coreScriptLocalization (ref), localizationService (copy), coreGuiService (copy), p0 (ref)
		return coreScriptLocalization:GetTranslator(localizationService.RobloxLocaleId):Translate(coreGuiService, p0)
	end)
	
	return if ok then status else p0
end

return reactModule.memo(function(p1) --[[ line: 42 | named "TiltLoadingScreenStatusPanel" ]]
	-- upvalues: useTokens (ref), useLocalization (ref), reactModule (ref), fIntAutoJoinNewServerTimeMs (ref), runService (ref), constantsModule (ref), coreGuiService (ref), localizationService (ref), view (ref), enums (ref), text (ref), progress (ref), button (ref), fFlagDebugEnablePioneerUX (ref), fStringTiltLoadingScreenPreLogoText (ref), image (ref)
	local var27
	local var10 = useTokens()
	local var11 = useLocalization({
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
			POSITION = tostring(p1.queuePosition or "")
		}
	})
	local var12 = reactModule.useRef(-1e999)
	local var13, var14 = reactModule.useBinding(0)
	local var15, var16 = reactModule.useState(false)
	local var17 = reactModule.useRef(nil)
	local var18 = reactModule.useRef(nil)
	local var19 = reactModule.useCallback(function() --[[ line: 67 ]]
		-- upvalues: var16 (ref), var17 (ref)
		var16(false)
		
		if var17.current then
			var17.current:Disconnect()
			var17.current = nil
		end
	end, {})
	local var20 = reactModule.useCallback(function() --[[ line: 75 ]]
		-- upvalues: var17 (ref), var16 (ref), fIntAutoJoinNewServerTimeMs (copy), runService (copy), var14 (ref), var19 (ref), p1 (ref)
		if var17.current then
			return
		end
		var16(true)
		local processTime = os.clock()
		local var30 = fIntAutoJoinNewServerTimeMs / 1000
		var17.current = runService.Heartbeat:Connect(function() --[[ line: 84 ]]
			-- upvalues: processTime (ref), var30 (ref), var14 (copy), var19 (copy), p1 (copy)
			local clampedValue = math.clamp((os.clock() - processTime) / var30 * 100, 0, 100)
			var14(clampedValue)
			
			if clampedValue >= 100 then
				var19()
				p1.onAutoJoinNewServer()
			end
		end)
	end, { p1.onAutoJoinNewServer, var19 })
	reactModule.useEffect(function() --[[ line: 95 ]]
		-- upvalues: p1 (ref), constantsModule (copy), var18 (ref)
		if p1.status == constantsModule.QUEUED_STATE then
			var18.current = os.clock()
		end
	end, { p1.status })
	reactModule.useEffect(function() --[[ line: 101 ]]
		-- upvalues: p1 (ref), constantsModule (copy), var20 (ref), var19 (ref)
		if p1.status == constantsModule.QUEUED_STATE and p1.queueTreatment == constantsModule.AUTO_JOIN_TREATMENT and p1.followUserId > 0 then
			var20()
		else
			var19()
		end
		return var19
	end, {
		p1.status,
		p1.queueTreatment,
		p1.followUserId,
		var20,
		var19
	})
	local var21 = reactModule.useCallback(function() --[[ line: 115 ]]
		-- upvalues: p1 (ref), var12 (ref), constantsModule (copy)
		if p1.isSubjectToChinaPolicies then return end
		local processTime = os.clock()
		
		if processTime - var12.current <= constantsModule.DOUBLE_TAP_WINDOW_SECONDS then
			p1.onShowConnectionHealth()
			var12.current = -1e999
			
			return
		end
		var12.current = processTime
	end, { p1.isSubjectToChinaPolicies, p1.onShowConnectionHealth })
	local var22 = reactModule.useCallback(function() --[[ line: 128 ]]
		-- upvalues: var19 (ref), p1 (ref), var18 (ref)
		var19()
		p1.onJoinTheLine(if var18.current then math.floor((os.clock() - var18.current) * 1000) else nil)
	end, { p1.onJoinTheLine, var19 })
	local var23 = reactModule.useCallback(function() --[[ line: 135 ]]
		-- upvalues: p1 (ref), var18 (ref)
		p1.onJoinNewServer(if var18.current then math.floor((os.clock() - var18.current) * 1000) else nil)
	end, { p1.onJoinNewServer })
	local var24 = p1.status == constantsModule.QUEUED_STATE and p1.queueTreatment == constantsModule.JOIN_NEW_SERVER_TREATMENT
	local var25 = p1.status == constantsModule.QUEUED_STATE and (p1.queueTreatment == constantsModule.AUTO_JOIN_TREATMENT and (p1.followUserId > 0 and var15))
	local var26 = if p1.status == constantsModule.QUEUED_STATE and p1.followUserId > 0 and p1.queueTreatment ~= nil then if var15 then var11.friendsServerIsFullJoiningNewServer else var11.friendsServerIsFullWaitingToJoin else nil
	local status = ({
		Joining = var11.statusJoining,
		GameEnded = var11.statusGameEnded,
		HttpError = var11.statusHttpError
	})[p1.status]
	local _ = nil
	
	if p1.status == constantsModule.QUEUED_STATE and p1.queuePosition ~= nil then
		var27 = var11.statusQueued
	elseif status then
		var27 = status
	else
		local statusText = p1.statusText
		local coreScriptLocalization = coreGuiService:FindFirstChild("CoreScriptLocalization")
		
		if coreScriptLocalization then
			local ok, status_1 = pcall(function() --[[ line: 35 ]]
				-- upvalues: coreScriptLocalization (ref), localizationService (copy), coreGuiService (copy), statusText (ref)
				return coreScriptLocalization:GetTranslator(localizationService.RobloxLocaleId):Translate(coreGuiService, statusText)
			end)
			var27 = if ok then status_1 else statusText
		else
			var27 = statusText
		end
	end
	return reactModule.createElement(view, {
		tag = "col align-x-center align-y-bottom gap-large size-full-0 auto-y padding-x-xlarge padding-bottom-xlarge",
		testId = "tilt-loading-screen-status-panel",
		LayoutOrder = p1.LayoutOrder
	}, {
		Status = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col align-x-center gap-small size-full-0 auto-y",
			onActivated = var21,
			stateLayer = { affordance = enums.StateLayerAffordance.None }
		}, {
			Policy = if p1.isSubjectToChinaPolicies then reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-center content-system-contrast",
				Text = var11.antiAddictionText
			}) else nil,
			QueueDescription = if var26 then reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-title-medium content-system-contrast",
				testId = "tilt-loading-screen-queue-description",
				Text = var26
			}) else nil,
			StatusText = if var27 ~= "" then nil else reactModule.createElement(text, {
				LayoutOrder = 3,
				tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-center content-system-contrast",
				Text = var27
			})
		}),
		Countdown = if var15 then reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col align-x-center size-full-0 auto-y"
		}, {
			ProgressBar = reactModule.createElement(progress, {
				testId = "tilt-loading-screen-auto-join-progress",
				shape = enums.ProgressShape.Bar,
				value = var13
			})
		}) else nil,
		JoinNewServerAction = if var24 then reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "col align-x-center gap-xsmall auto-xy"
		}, {
			Description = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-body-medium content-system-contrast",
				Text = var11.dontWantToWait
			}),
			Button = reactModule.createElement(button, {
				LayoutOrder = 2,
				testId = "tilt-loading-screen-join-new-server",
				onActivated = var23,
				text = var11.joinNewServer
			})
		}) else nil,
		JoinTheLineAction = if var25 then reactModule.createElement(view, {
			LayoutOrder = 4,
			tag = "col align-x-center gap-xsmall auto-xy"
		}, {
			Description = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-body-medium content-system-contrast",
				Text = var11.wantToJoinYourFriend
			}),
			Button = reactModule.createElement(button, {
				LayoutOrder = 2,
				testId = "tilt-loading-screen-join-the-line",
				onActivated = var22,
				text = var11.joinTheLine
			})
		}) else nil,
		RobloxWordmark = if fFlagDebugEnablePioneerUX then reactModule.createElement(view, {
			LayoutOrder = 5,
			tag = "row align-x-center align-y-center gap-xsmall auto-xy"
		}, {
			PreLogoText = if fStringTiltLoadingScreenPreLogoText ~= "" then nil else reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-body-small content-system-contrast",
				testId = "tilt-loading-screen-pre-logo-text",
				Text = fStringTiltLoadingScreenPreLogoText
			}),
			Wordmark = reactModule.createElement(image, {
				LayoutOrder = 2,
				testId = "tilt-loading-screen-roblox-wordmark",
				Image = constantsModule.ROBLOX_WORDMARK_IMAGE,
				imageStyle = var10.Color.System.Contrast,
				Size = UDim2.fromOffset(var10.Size.Size_300 * constantsModule.ROBLOX_WORDMARK_ASPECT_RATIO, var10.Size.Size_300)
			})
		}) else nil
	})
end)