local Parent = script:FindFirstAncestor("BugReporting").Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local _ = require(Parent.AppCommonLib)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local RobloxLocaleIdKey = require(Parent.Localization).RobloxLocaleIdKey
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local GetCurrentRouteStateFunction = require(Parent.Navigation).getCurrentRouteState
local UseCurrentCameraFunction = require(Parent.RobloxAppHooks).useCurrentCamera
local UsePropertyFunction = require(Parent.GuiObjectUtils).useProperty
local SystemInfoProtocol = require(Parent.SystemInfoProtocol).SystemInfoProtocol
local InfoNames = SystemInfoProtocol.InfoNames
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local _ = require(script.Parent.BugReporterModal)
local BugReporterCounterName = require(script.Parent.BugReporterTypes).BugReporterCounterName
local SharedConstantsModule = require(script.Parent.SharedConstants)
local config = {
	[InfoNames.APP_VERSION] = "Feature.InAppBugReporting.Message.AppVersion",
	[InfoNames.DEVICE_NAME] = "Feature.InAppBugReporting.Message.DeviceName",
	[InfoNames.SYSTEM_VERSION] = "Feature.InAppBugReporting.Message.SystemVersion",
	[SharedConstantsModule.SCREEN_SUMMARY_KEY] = "Feature.InAppBugReporting.Message.Screen"
}

local function _(p1, p2, p3)
	local Flag = false
	local CommentEmptyError = nil
	
	if type(p2) ~= "string" or p2 == "" then
		CommentEmptyError = p1.commentEmptyError
		
		return Flag, CommentEmptyError
	end
	if #p2 < p3 then
		CommentEmptyError = p1.commmentTooShortError
	end
	if p3 <= #p2 then
		Flag = true
	end
	return Flag, CommentEmptyError
end

local function makeDeviceLocalizationKeys(UseMemoResult, p1)
	-- upvalues: DashModule (copy), SharedConstantsModule (copy), config (copy)
	return DashModule.reduce(SharedConstantsModule.DEVICE_SUMMARY_ORDERED_KEYS, function(p2, Key)
		-- upvalues: UseMemoResult (copy), p1 (copy), config (upval)
		p2[Key] = {
			config[Key],
			value = UseMemoResult[Key] or (p1[Key] or `Unknown ({Key})`)
		}
		
		return p2
	end, {})
end

local _ = function(LocalizedStrings): string
	-- upvalues: DashModule (copy), SharedConstantsModule (copy)
	return table.concat(DashModule.map(SharedConstantsModule.DEVICE_SUMMARY_ORDERED_KEYS, function(p1)
		-- upvalues: LocalizedStrings (copy)
		return LocalizedStrings[p1]
	end), "\n")
end

local _ = function(p1)
	-- upvalues: GetCurrentRouteStateFunction (copy)
	local CurrentRouteState = GetCurrentRouteStateFunction(p1)
	
	return CurrentRouteState and CurrentRouteState.routeName or "Unknown"
end

local _ = function(p1): number
	return (math.floor(p1 or 0.5))
end

return function(p1)
	-- upvalues: UseNavigationFunction (copy), UseDispatchFunction (copy), UseStyleFunction (copy), UseCurrentCameraFunction (copy), ReactModule (copy), GetCurrentRouteStateFunction (copy), SystemInfoProtocol (copy), UsePropertyFunction (copy), makeDeviceLocalizationKeys (copy), SharedConstantsModule (copy), UseLocalizationFunction (copy), DashModule (copy), RobloxLocaleIdKey (copy), BugReporterCounterName (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseDispatchResult = UseDispatchFunction()
	local Tokens = UseStyleFunction().Tokens
	local UseCurrentCameraResult = UseCurrentCameraFunction()
	local UseMemoResult = ReactModule.useMemo(function(): Vector2
		-- upvalues: UseCurrentCameraResult (copy)
		return Vector2.new(math.floor(UseCurrentCameraResult.ViewportSize.X or 0.5), (math.floor(UseCurrentCameraResult.ViewportSize.Y or 0.5)))
	end, {
		UseCurrentCameraResult.ViewportSize.X,
		UseCurrentCameraResult.ViewportSize.Y
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState("")
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(nil)
	local Count = #(UseStateResult3 or "")
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy)
		local _, GuiInset2 = p1.guiService:GetGuiInset()
		
		return GuiInset2.Y
	end, { p1.guiService })
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: UseNavigationResult (copy), GetCurrentRouteStateFunction (upval)
		local CurrentRouteState = GetCurrentRouteStateFunction(UseNavigationResult)
		
		return CurrentRouteState and CurrentRouteState.routeName or "Unknown"
	end, { UseNavigationResult })
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), SystemInfoProtocol (upval)
		return (p1.systemInfoProtocol:getSystemInfo(SystemInfoProtocol.ALL_INFO_NAMES))
	end, { p1.systemInfoProtocol })
	local OnScreenKeyboardSize = UsePropertyFunction(p1.userInputService, "OnScreenKeyboardSize")
	local UseLocalizationResult = UseLocalizationFunction(DashModule.assign({
		title = "Feature.InAppBugReporting.Message.Title",
		commentLabel = "Feature.InAppBugReporting.Message.CommentLabel",
		commentPlaceholder = "Feature.InAppBugReporting.Message.CommentPlaceholder",
		commentEmptyError = "Feature.InAppBugReporting.Message.CommentEmptyError",
		screenshotAnnotation = "Feature.InAppBugReporting.Message.ScreenshotAnnotation",
		submit = "CommonUI.Controls.Action.Submit",
		commentCharacterCount = {
			"Feature.InAppBugReporting.Message.MinCharacterCount",
			currentCount = Count,
			minCount = p1.minCommentLength
		},
		commentTooShortError = {
			"Feature.InAppBugReporting.Message.CommentTooShortError",
			minLength = p1.minCommentLength
		}
	}, (ReactModule.useMemo(function()
		-- upvalues: makeDeviceLocalizationKeys (upval), UseMemoResult3 (copy), SharedConstantsModule (upval), UseMemoResult2 (copy)
		return makeDeviceLocalizationKeys(UseMemoResult3, {
			[SharedConstantsModule.SCREEN_SUMMARY_KEY] = UseMemoResult2
		})
	end, { UseMemoResult3, UseMemoResult2 }))))
	local Joined = table.concat(DashModule.map(SharedConstantsModule.DEVICE_SUMMARY_ORDERED_KEYS, function(p2)
		-- upvalues: UseLocalizationResult (copy)
		return UseLocalizationResult[p2]
	end), "\n")
	local UseLocalizationResultEntry = UseLocalizationResult[RobloxLocaleIdKey]
	local UseMemoResult4 = ReactModule.useMemo(function()
		-- upvalues: SharedConstantsModule (upval), UseMemoResult2 (copy), UseLocalizationResultEntry (copy), p1 (copy)
		return {
			[SharedConstantsModule.SCREEN_SUMMARY_KEY] = UseMemoResult2,
			locale = UseLocalizationResultEntry,
			clientChannel = p1.runService:GetRobloxClientChannel(),
			coreScriptVersion = p1.runService:GetCoreScriptVersion()
		}
	end, {
		UseMemoResult2,
		UseLocalizationResultEntry,
		p1.runService
	})
	local UseMemoResult5 = ReactModule.useMemo(function()
		-- upvalues: UseLocalizationResult (copy)
		return {
			commentEmptyError = UseLocalizationResult.commentEmptyError,
			commmentTooShortError = UseLocalizationResult.commmentTooShortError
		}
	end, {
		UseLocalizationResult.commentEmptyError,
		UseLocalizationResult.commmentTooShortError
	})
	local MinCommentLength = p1.minCommentLength
	local Flag = false
	local CanSubmit = nil
	
	if type(UseStateResult3) == "string" and UseStateResult3 ~= "" then
		if #UseStateResult3 < MinCommentLength then
			local _ = UseMemoResult5.commmentTooShortError
		end
		if MinCommentLength <= #UseStateResult3 then
			Flag = true
		end
		CanSubmit = Flag
	else
		local _ = UseMemoResult5.commentEmptyError
		CanSubmit = Flag
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), BugReporterCounterName (upval), UseMemoResult2 (copy)
		p1.logger.reportCounter(BugReporterCounterName.ReportOpened)
		p1.logger.reportMilestone(BugReporterCounterName.ReportOpened, { screen = UseMemoResult2 })
	end, { p1.logger, UseMemoResult2 })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult5 (copy), UseStateResult3 (copy), p1 (copy), UseStateResult (copy), UseMemoResult3 (copy), UseMemoResult4 (copy), UseStateResult2_3 (copy), UseDispatchResult (copy)
		local MinCommentLength = p1.minCommentLength
		local Flag = false
		local CommmentTooShortError = nil
		local Flag1 = nil
		local CommentEmptyError = nil
		
		if type(UseStateResult3) == "string" and UseStateResult3 ~= "" then
			if #UseStateResult3 < MinCommentLength then
				CommmentTooShortError = UseMemoResult5.commmentTooShortError
			end
			if MinCommentLength <= #UseStateResult3 then
				Flag = true
			end
			Flag1 = Flag
			CommentEmptyError = CommmentTooShortError
		else
			Flag1 = Flag
			CommentEmptyError = UseMemoResult5.commentEmptyError
		end
		if Flag1 then
			p1.onSubmitBugReport(p1.logger, {
				screenshotId = UseStateResult,
				description = UseStateResult3,
				systemInfo = UseMemoResult3,
				additionalInfo = UseMemoResult4
			})
			UseStateResult2_3(nil)
			UseDispatchResult(p1.closeCentralOverlayThunk())
			
			return
		else
			UseStateResult2_3(CommentEmptyError)
		end
	end, {
		UseDispatchResult, UseMemoResult5, UseStateResult, UseStateResult3,
		UseMemoResult3, UseMemoResult4, p1.minCommentLength,
		p1.closeCentralOverlayThunk, p1.onSubmitBugReport, p1.logger
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), BugReporterCounterName (upval), UseMemoResult2 (copy), UseDispatchResult (copy)
		p1.logger.reportCounter(BugReporterCounterName.ReportAbandoned)
		p1.logger.reportMilestone(BugReporterCounterName.ReportAbandoned, { screen = UseMemoResult2 })
		UseDispatchResult(p1.closeCentralOverlayThunk())
	end, {
		UseDispatchResult,
		p1.closeCentralOverlayThunk,
		p1.logger,
		UseMemoResult2
	})
	local UseResult3 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(p2.Text)
	end, {})
	local UseResult4 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(p2.AbsoluteContentSize.Y)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult2 (copy)
		local OnScreenshotUploadedConnection = p1.onScreenshotUploaded:connect(function(p2)
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(p2)
		end)
		
		return function()
			-- upvalues: OnScreenshotUploadedConnection (copy)
			OnScreenshotUploadedConnection:disconnect()
		end
	end, { p1.onScreenshotUploaded })
	
	return DashModule.assign(ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy), UseMemoResult1 (copy), UseMemoResult3 (copy), Joined (copy), p1 (copy), OnScreenKeyboardSize (copy), UseStateResult1 (copy), UseResult4 (copy), UseStateResult3 (copy), UseStateResult4 (copy), UseResult3 (copy), CanSubmit (copy), UseResult1 (copy), UseResult (copy), UseResult2 (copy)
		return {
			screenSize = UseMemoResult,
			bottomInset = UseMemoResult1,
			systemInfo = UseMemoResult3,
			localizedDeviceSummary = Joined,
			screenshotContentId = p1.screenshotLocalId,
			onScreenKeyboardSize = OnScreenKeyboardSize,
			scrollContentHeight = UseStateResult1,
			onListLayoutSizeChange = UseResult4,
			commentText = UseStateResult3,
			commentErrorMessage = UseStateResult4,
			onCommentTextChange = UseResult3,
			canSubmit = CanSubmit,
			onSubmit = UseResult1,
			onLoad = UseResult,
			onClose = UseResult2
		}
	end, {
		UseMemoResult, UseMemoResult1, UseMemoResult3, Joined, p1.screenshotLocalId,
		OnScreenKeyboardSize, UseStateResult1, UseResult4, UseStateResult3,
		UseStateResult4, UseResult3, CanSubmit, UseResult1, UseResult, UseResult2
	}), {
		designTokens = Tokens,
		localizedStrings = UseLocalizationResult
	})
end