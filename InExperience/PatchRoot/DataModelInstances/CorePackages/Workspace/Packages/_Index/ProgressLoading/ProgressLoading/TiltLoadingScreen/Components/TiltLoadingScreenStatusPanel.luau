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

local function _(p1)
	-- upvalues: coreGuiService (ref), localizationService (ref)
	local coreScriptLocalization = coreGuiService:FindFirstChild("CoreScriptLocalization")
	
	if not coreScriptLocalization then
		return p1
	end
	local ok, status = pcall(function()
		-- upvalues: coreScriptLocalization (ref), localizationService (copy), coreGuiService (copy), p1 (ref)
		return coreScriptLocalization:GetTranslator(localizationService.RobloxLocaleId):Translate(coreGuiService, p1)
	end)
	
	return if ok then status else p1
end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), useLocalization (ref), reactModule (ref), fIntAutoJoinNewServerTimeMs (ref), runService (ref), constantsModule (ref), coreGuiService (ref), localizationService (ref), view (ref), enums (ref), text (ref), progress (ref), button (ref), fFlagDebugEnablePioneerUX (ref), fStringTiltLoadingScreenPreLogoText (ref), image (ref)
	local var1
	local var2 = useTokens()
	local var3 = useLocalization({
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
	local var4 = reactModule.useRef(-1e999)
	local var5, var6 = reactModule.useBinding(0)
	local var7, var8 = reactModule.useState(false)
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useRef(nil)
	local var11 = reactModule.useCallback(function()
		-- upvalues: var8 (ref), var9 (ref)
		var8(false)
		
		if var9.current then
			var9.current:Disconnect()
			var9.current = nil
		end
	end, {})
	local var12 = reactModule.useCallback(function()
		-- upvalues: var9 (ref), var8 (ref), fIntAutoJoinNewServerTimeMs (copy), runService (copy), var6 (ref), var11 (ref), p1 (ref)
		if var9.current then
			return
		end
		var8(true)
		local processTime = os.clock()
		local var13 = fIntAutoJoinNewServerTimeMs / 1000
		var9.current = runService.Heartbeat:Connect(function()
			-- upvalues: processTime (ref), var13 (ref), var6 (copy), var11 (copy), p1 (copy)
			local clampedValue = math.clamp((os.clock() - processTime) / var13 * 100, 0, 100)
			var6(clampedValue)
			
			if clampedValue >= 100 then
				var11()
				p1.onAutoJoinNewServer()
			end
		end)
	end, { p1.onAutoJoinNewServer, var11 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), constantsModule (copy), var10 (ref)
		if p1.status == constantsModule.QUEUED_STATE then
			var10.current = os.clock()
		end
	end, { p1.status })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), constantsModule (copy), var12 (ref), var11 (ref)
		if p1.status == constantsModule.QUEUED_STATE and p1.queueTreatment == constantsModule.AUTO_JOIN_TREATMENT and p1.followUserId > 0 then
			var12()
		else
			var11()
		end
		return var11
	end, {
		p1.status,
		p1.queueTreatment,
		p1.followUserId,
		var12,
		var11
	})
	local var13 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var4 (ref), constantsModule (copy)
		if p1.isSubjectToChinaPolicies then return end
		local processTime = os.clock()
		
		if processTime - var4.current <= constantsModule.DOUBLE_TAP_WINDOW_SECONDS then
			p1.onShowConnectionHealth()
			var4.current = -1e999
			
			return
		end
		var4.current = processTime
	end, { p1.isSubjectToChinaPolicies, p1.onShowConnectionHealth })
	local var14 = reactModule.useCallback(function()
		-- upvalues: var11 (ref), p1 (ref), var10 (ref)
		var11()
		p1.onJoinTheLine(if var10.current then math.floor((os.clock() - var10.current) * 1000) else nil)
	end, { p1.onJoinTheLine, var11 })
	local var15 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var10 (ref)
		p1.onJoinNewServer(if var10.current then math.floor((os.clock() - var10.current) * 1000) else nil)
	end, { p1.onJoinNewServer })
	local var16 = p1.status == constantsModule.QUEUED_STATE and p1.queueTreatment == constantsModule.JOIN_NEW_SERVER_TREATMENT
	local var17 = p1.status == constantsModule.QUEUED_STATE and (p1.queueTreatment == constantsModule.AUTO_JOIN_TREATMENT and (p1.followUserId > 0 and var7))
	local var18 = if p1.status == constantsModule.QUEUED_STATE and p1.followUserId > 0 and p1.queueTreatment ~= nil then if var7 then var3.friendsServerIsFullJoiningNewServer else var3.friendsServerIsFullWaitingToJoin else nil
	local status = ({
		Joining = var3.statusJoining,
		GameEnded = var3.statusGameEnded,
		HttpError = var3.statusHttpError
	})[p1.status]
	local _ = nil
	
	if p1.status == constantsModule.QUEUED_STATE and p1.queuePosition ~= nil then
		var1 = var3.statusQueued
	elseif status then
		var1 = status
	else
		local statusText = p1.statusText
		local coreScriptLocalization = coreGuiService:FindFirstChild("CoreScriptLocalization")
		
		if coreScriptLocalization then
			local ok, status_1 = pcall(function()
				-- upvalues: coreScriptLocalization (ref), localizationService (copy), coreGuiService (copy), statusText (ref)
				return coreScriptLocalization:GetTranslator(localizationService.RobloxLocaleId):Translate(coreGuiService, statusText)
			end)
			var1 = if ok then status_1 else statusText
		else
			var1 = statusText
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
			onActivated = var13,
			stateLayer = { affordance = enums.StateLayerAffordance.None }
		}, {
			Policy = if p1.isSubjectToChinaPolicies then reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-center content-system-contrast",
				Text = var3.antiAddictionText
			}) else nil,
			QueueDescription = if var18 then reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-title-medium content-system-contrast",
				testId = "tilt-loading-screen-queue-description",
				Text = var18
			}) else nil,
			StatusText = if var1 ~= "" then nil else reactModule.createElement(text, {
				LayoutOrder = 3,
				tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-center content-system-contrast",
				Text = var1
			})
		}),
		Countdown = if var7 then reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col align-x-center size-full-0 auto-y"
		}, {
			ProgressBar = reactModule.createElement(progress, {
				testId = "tilt-loading-screen-auto-join-progress",
				shape = enums.ProgressShape.Bar,
				value = var5
			})
		}) else nil,
		JoinNewServerAction = if var16 then reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "col align-x-center gap-xsmall auto-xy"
		}, {
			Description = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-body-medium content-system-contrast",
				Text = var3.dontWantToWait
			}),
			Button = reactModule.createElement(button, {
				LayoutOrder = 2,
				testId = "tilt-loading-screen-join-new-server",
				onActivated = var15,
				text = var3.joinNewServer
			})
		}) else nil,
		JoinTheLineAction = if var17 then reactModule.createElement(view, {
			LayoutOrder = 4,
			tag = "col align-x-center gap-xsmall auto-xy"
		}, {
			Description = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-body-medium content-system-contrast",
				Text = var3.wantToJoinYourFriend
			}),
			Button = reactModule.createElement(button, {
				LayoutOrder = 2,
				testId = "tilt-loading-screen-join-the-line",
				onActivated = var14,
				text = var3.joinTheLine
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
				imageStyle = var2.Color.System.Contrast,
				Size = UDim2.fromOffset(var2.Size.Size_300 * constantsModule.ROBLOX_WORDMARK_ASPECT_RATIO, var2.Size.Size_300)
			})
		}) else nil
	})
end)