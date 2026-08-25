local tiltLoadingScreen = script:FindFirstAncestor("TiltLoadingScreen")
local parent = tiltLoadingScreen.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local localizationModule = require(parent_1.Localization)
local coreGuiService = game:GetService("CoreGui")
local localizationService = game:GetService("LocalizationService")
local runService = game:GetService("RunService")
local constantsModule = require(tiltLoadingScreen.Constants)
local _ = require(tiltLoadingScreen.Types)
local footerModule = require(parent.Components.Footer)
local button = foundationModule.Button
local progress = foundationModule.Progress
local text = foundationModule.Text
local view = foundationModule.View
local enums = foundationModule.Enums
local useLocalization = localizationModule.Hooks.useLocalization
local sharedFlagsModule = require(parent_1.SharedFlags)
local fIntAutoJoinNewServerTimeMs = sharedFlagsModule.FIntAutoJoinNewServerTimeMs
local fFlagDebugEnablePioneerUX = sharedFlagsModule.FFlagDebugEnablePioneerUX

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
	-- upvalues: useLocalization (ref), reactModule (ref), fIntAutoJoinNewServerTimeMs (ref), runService (ref), constantsModule (ref), coreGuiService (ref), localizationService (ref), view (ref), enums (ref), text (ref), progress (ref), button (ref), fFlagDebugEnablePioneerUX (ref), footerModule (ref)
	local var1
	local var2 = useLocalization({
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
	local var3 = reactModule.useRef(-1e999)
	local var4, var5 = reactModule.useBinding(0)
	local var6, var7 = reactModule.useState(false)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), var8 (ref)
		var7(false)
		
		if var8.current then
			var8.current:Disconnect()
			var8.current = nil
		end
	end, {})
	local var11 = reactModule.useCallback(function()
		-- upvalues: var8 (ref), var7 (ref), fIntAutoJoinNewServerTimeMs (copy), runService (copy), var5 (ref), var10 (ref), p1 (ref)
		if var8.current then
			return
		end
		var7(true)
		local processTime = os.clock()
		local var1 = fIntAutoJoinNewServerTimeMs / 1000
		var8.current = runService.Heartbeat:Connect(function()
			-- upvalues: processTime (ref), var1 (ref), var5 (copy), var10 (copy), p1 (copy)
			local clampedValue = math.clamp((os.clock() - processTime) / var1 * 100, 0, 100)
			var5(clampedValue)
			
			if clampedValue >= 100 then
				var10()
				p1.onAutoJoinNewServer()
			end
		end)
	end, { p1.onAutoJoinNewServer, var10 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), constantsModule (copy), var9 (ref)
		if p1.status == constantsModule.QUEUED_STATE then
			var9.current = os.clock()
		end
	end, { p1.status })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), constantsModule (copy), var11 (ref), var10 (ref)
		if p1.status == constantsModule.QUEUED_STATE and p1.queueTreatment == constantsModule.AUTO_JOIN_TREATMENT and p1.followUserId > 0 then
			var11()
		else
			var10()
		end
		return var10
	end, {
		p1.status,
		p1.queueTreatment,
		p1.followUserId,
		var11,
		var10
	})
	local var12 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var3 (ref), constantsModule (copy)
		if p1.isSubjectToChinaPolicies then return end
		local processTime = os.clock()
		
		if processTime - var3.current <= constantsModule.DOUBLE_TAP_WINDOW_SECONDS then
			p1.onShowConnectionHealth()
			var3.current = -1e999
			
			return
		end
		var3.current = processTime
	end, { p1.isSubjectToChinaPolicies, p1.onShowConnectionHealth })
	local var13 = reactModule.useCallback(function()
		-- upvalues: var10 (ref), p1 (ref), var9 (ref)
		var10()
		p1.onJoinTheLine(if var9.current then math.floor((os.clock() - var9.current) * 1000) else nil)
	end, { p1.onJoinTheLine, var10 })
	local var1 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var9 (ref)
		p1.onJoinNewServer(if var9.current then math.floor((os.clock() - var9.current) * 1000) else nil)
	end, { p1.onJoinNewServer })
	local var1 = p1.status == constantsModule.QUEUED_STATE and p1.queueTreatment == constantsModule.JOIN_NEW_SERVER_TREATMENT
	local var2 = p1.status == constantsModule.QUEUED_STATE and (p1.queueTreatment == constantsModule.AUTO_JOIN_TREATMENT and (p1.followUserId > 0 and var6))
	local var3 = if p1.status == constantsModule.QUEUED_STATE and p1.followUserId > 0 and p1.queueTreatment ~= nil then if var6 then var2.friendsServerIsFullJoiningNewServer else var2.friendsServerIsFullWaitingToJoin else nil
	local status = ({
		Joining = var2.statusJoining,
		GameEnded = var2.statusGameEnded,
		HttpError = var2.statusHttpError
	})[p1.status]
	local _ = nil
	
	if p1.status == constantsModule.QUEUED_STATE and p1.queuePosition ~= nil then
		var1 = var2.statusQueued
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
			onActivated = var12,
			stateLayer = { affordance = enums.StateLayerAffordance.None }
		}, {
			Policy = if p1.isSubjectToChinaPolicies then reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-center content-system-contrast",
				Text = var2.antiAddictionText
			}) else nil,
			QueueDescription = if var3 then reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-title-medium content-system-contrast",
				testId = "tilt-loading-screen-queue-description",
				Text = var3
			}) else nil,
			StatusText = if var1 ~= "" then nil else reactModule.createElement(text, {
				LayoutOrder = 3,
				tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-center content-system-contrast",
				Text = var1
			})
		}),
		Countdown = if var6 then reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col align-x-center size-full-0 auto-y"
		}, {
			ProgressBar = reactModule.createElement(progress, {
				testId = "tilt-loading-screen-auto-join-progress",
				shape = enums.ProgressShape.Bar,
				value = var4
			})
		}) else nil,
		JoinNewServerAction = if var1 then reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "col align-x-center gap-xsmall auto-xy"
		}, {
			Description = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-body-medium content-system-contrast",
				Text = var2.dontWantToWait
			}),
			Button = reactModule.createElement(button, {
				LayoutOrder = 2,
				testId = "tilt-loading-screen-join-new-server",
				onActivated = var1,
				text = var2.joinNewServer
			})
		}) else nil,
		JoinTheLineAction = if var2 then reactModule.createElement(view, {
			LayoutOrder = 4,
			tag = "col align-x-center gap-xsmall auto-xy"
		}, {
			Description = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-body-medium content-system-contrast",
				Text = var2.wantToJoinYourFriend
			}),
			Button = reactModule.createElement(button, {
				LayoutOrder = 2,
				testId = "tilt-loading-screen-join-the-line",
				onActivated = var13,
				text = var2.joinTheLine
			})
		}) else nil,
		RobloxWordmark = if fFlagDebugEnablePioneerUX then reactModule.createElement(footerModule, {
			LayoutOrder = 5,
			textTestId = "tilt-loading-screen-pre-logo-text",
			wordmarkTestId = "tilt-loading-screen-roblox-wordmark"
		}) else nil
	})
end)