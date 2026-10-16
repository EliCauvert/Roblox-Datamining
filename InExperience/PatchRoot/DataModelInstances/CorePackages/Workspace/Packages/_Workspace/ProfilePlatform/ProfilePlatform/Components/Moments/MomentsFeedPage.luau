local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local RobloxAppHooksModule = require(Parent.RobloxAppHooks)
local RoactUtilsModule = require(Parent.RoactUtils)
local MomentsCommonModule = require(Parent.MomentsCommon)
local MomentsModule = require(Parent.Moments)
local GenericAbuseReportingModule = require(Parent.GenericAbuseReporting)
local UseOpenBlockingModalModule = require(Parent.MomentsCommon.useOpenBlockingModal)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagMomentsOptimisticProfilePending = SharedFlagsModule.FFlagMomentsOptimisticProfilePending
local FFlagEnableMomentsCommentReporting = SharedFlagsModule.FFlagEnableMomentsCommentReporting
local FFlagEnableMomentsCommentBlocking = SharedFlagsModule.FFlagEnableMomentsCommentBlocking
local FFlagAbuseReportSubmissionTargetV4 = SharedFlagsModule.FFlagAbuseReportSubmissionTargetV4
local FFlagMomentsServeEDPVideos = SharedFlagsModule.FFlagMomentsServeEDPVideos
local View = FoundationModule.View
local IconButton = FoundationModule.IconButton
local ButtonSize = FoundationModule.Enums.ButtonSize
local FoundationProvider = FoundationModule.FoundationProvider
local ColorMode = FoundationModule.Enums.ColorMode
local UseScreenSizeFunction = RobloxAppHooksModule.useScreenSize
local UseStatusBarHeightFunction = RobloxAppHooksModule.useStatusBarHeight
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local AbuseVector = GenericAbuseReportingModule.Enums.AbuseVector
local OpenDynamicAbuseReportFunction = GenericAbuseReportingModule.Thunks.OpenDynamicAbuseReport
local CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
local FireAnalyticsEventFunction = MomentsCommonModule.Analytics.fireAnalyticsEvent
local EventNames = MomentsCommonModule.Analytics.EventNames
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local Feed = MomentsModule.Feed
local MomentsImmersivePresentation = MomentsModule.MomentsImmersivePresentation
local ImmersiveFeedKind = MomentsModule.Constants.ImmersiveFeedKind
local CreateUserMomentsFeedSourceModule = require(Parent.Moments.CreateUserMomentsFeedSource)
local ReportMomentFunction = MomentsModule.reportMoment

local function MomentsFeedPageImmersive() --[[ Line: 70 ]]
	-- upvalues: UseNavigationFunction (copy), FFlagMomentsOptimisticProfilePending (copy), ReactModule (copy), FireAnalyticsEventFunction (copy), EventNames (copy), UseDispatchFunction (copy), FFlagMomentsServeEDPVideos (copy), OpenDynamicAbuseReportFunction (copy), AbuseVector (copy), CloseCentralOverlayFunction (copy), ReportMomentFunction (copy), FFlagAbuseReportSubmissionTargetV4 (copy), FFlagEnableMomentsCommentReporting (copy), FFlagEnableMomentsCommentBlocking (copy), UseOpenBlockingModalModule (copy), UseScreenSizeFunction (copy), View (copy), MomentsImmersivePresentation (copy), ImmersiveFeedKind (copy)
	local UseNavigationResult = UseNavigationFunction()
	local ExtraPropsParam = UseNavigationResult.getParam("extraProps")
	local TargetUserId = if ExtraPropsParam and ExtraPropsParam.targetUserId then ExtraPropsParam.targetUserId else 0
	local UseResult = ReactModule.useCallback(function() --[[ Line: 80 ]]
		-- upvalues: FireAnalyticsEventFunction (upval), EventNames (upval), TargetUserId (copy), UseNavigationResult (copy)
		FireAnalyticsEventFunction(EventNames.ProfileClosePressed, { userId = tostring(TargetUserId) })
		UseNavigationResult.goBack()
	end, { UseNavigationResult.goBack, TargetUserId })
	local UseDispatchResult = UseDispatchFunction()
	local UseResult1 = ReactModule.useCallback(function(p1) --[[ Line: 90 ]]
		-- upvalues: FFlagMomentsServeEDPVideos (upval), UseDispatchResult (copy), OpenDynamicAbuseReportFunction (upval), AbuseVector (upval), CloseCentralOverlayFunction (upval), ReportMomentFunction (upval), FFlagAbuseReportSubmissionTargetV4 (upval)
		if FFlagMomentsServeEDPVideos and p1.onCustomSubmit then
			UseDispatchResult(OpenDynamicAbuseReportFunction({
				abuseVector = AbuseVector.MomentsFeed,
				targetId = p1.feedItemId,
				onSubmit = p1.onSubmit,
				onClose = function() --[[ Line: 103 ]]
					-- upvalues: p1 (copy), UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
					p1.onClose()
					UseDispatchResult(CloseCentralOverlayFunction())
				end,
				onCustomSubmit = p1.onCustomSubmit
			}))
			
			return
		else
			local Flag = false
			
			local function submitMomentsIp(_) --[[ Line: 116 ]]
				-- upvalues: Flag (ref), p1 (copy), UseDispatchResult (upval), CloseCentralOverlayFunction (upval), ReportMomentFunction (upval)
				Flag = true
				
				local function _(p2) --[[ Line: 122 | Named "showConfirmation" ]]
					-- upvalues: p1 (upval), UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
					p1.onClose()
					UseDispatchResult(CloseCentralOverlayFunction())
					
					if p1.onIpReportCode then
						p1.onIpReportCode(p2)
					end
				end
				
				return ReportMomentFunction(p1.feedItemId, "IntellectualProperty"):andThen(function(Result) --[[ Line: 129 ]]
					-- upvalues: p1 (upval), UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
					local ReportCode = Result.reportCode
					p1.onClose()
					UseDispatchResult(CloseCentralOverlayFunction())
					
					if p1.onIpReportCode then
						p1.onIpReportCode(ReportCode)
					end
					return Result
				end, function() --[[ Line: 132 ]]
					-- upvalues: p1 (upval), UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
					p1.onClose()
					UseDispatchResult(CloseCentralOverlayFunction())
					
					if p1.onIpReportCode then
						p1.onIpReportCode(nil)
					end
				end)
			end
			
			UseDispatchResult(OpenDynamicAbuseReportFunction({
				abuseVector = AbuseVector.MomentsFeed,
				targetId = p1.feedItemId,
				onSubmit = function() --[[ Line: 139 ]]
					-- upvalues: Flag (ref), p1 (copy)
					if not Flag then
						p1.onSubmit()
						
						return
					end
				end,
				onClose = function() --[[ Line: 145 ]]
					-- upvalues: p1 (copy), UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
					p1.onClose()
					UseDispatchResult(CloseCentralOverlayFunction())
				end,
				onCustomSubmit = if FFlagAbuseReportSubmissionTargetV4 then nil else function(p2) --[[ Line: 150 ]]
					-- upvalues: submitMomentsIp (copy)
					return if p2.endpoint == "moments-ip" then submitMomentsIp(p2) else nil
				end,
				clientActionHandlers = if FFlagAbuseReportSubmissionTargetV4 then { ["moments-ip"] = submitMomentsIp } else nil
			}))
		end
	end, { UseDispatchResult })
	local UseScreenSizeResult = UseScreenSizeFunction()
	
	return ReactModule.createElement(View, {
		tag = "bg-surface-0",
		Size = UDim2.fromOffset(UseScreenSizeResult.X, UseScreenSizeResult.Y)
	}, {
		Presentation = ReactModule.createElement(MomentsImmersivePresentation, {
			sessionSource = "profile",
			feedKind = ImmersiveFeedKind.User,
			targetUserId = TargetUserId,
			initialIndex = if ExtraPropsParam and ExtraPropsParam.initialIndex then ExtraPropsParam.initialIndex else 1,
			initialMomentId = if FFlagMomentsOptimisticProfilePending and ExtraPropsParam ~= nil then ExtraPropsParam.initialMomentId else nil,
			onBack = UseResult,
			openMomentsFeedReport = UseResult1,
			openMomentCommentReport = if FFlagEnableMomentsCommentReporting then ReactModule.useCallback(function(p1) --[[ Line: 167 ]]
				-- upvalues: UseDispatchResult (copy), OpenDynamicAbuseReportFunction (upval), AbuseVector (upval), CloseCentralOverlayFunction (upval)
				UseDispatchResult(OpenDynamicAbuseReportFunction({
					abuseVector = AbuseVector.MomentComment,
					attributes = {
						targetId = p1.commentId,
						channelId = p1.channelId,
						reportedUserId = p1.reportedUserId
					},
					analyticsTargetId = p1.commentId,
					onClose = function() --[[ Line: 183 ]]
						-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
						UseDispatchResult(CloseCentralOverlayFunction())
					end
				}))
			end, { UseDispatchResult }) else nil,
			openBlockUser = if FFlagEnableMomentsCommentBlocking then UseOpenBlockingModalModule(UseNavigationResult) else nil
		})
	})
end

local function MomentsFeedPageLegacy() --[[ Line: 221 ]]
	-- upvalues: UseNavigationFunction (copy), FFlagMomentsOptimisticProfilePending (copy), ReactModule (copy), CreateUserMomentsFeedSourceModule (copy), FireAnalyticsEventFunction (copy), EventNames (copy), UseScreenSizeFunction (copy), UseSelectorFunction (copy), UseStatusBarHeightFunction (copy), View (copy), FoundationProvider (copy), ColorMode (copy), Feed (copy), IconButton (copy), ButtonSize (copy)
	local UseNavigationResult = UseNavigationFunction()
	local ExtraPropsParam = UseNavigationResult.getParam("extraProps")
	local TargetUserId = if ExtraPropsParam and ExtraPropsParam.targetUserId then ExtraPropsParam.targetUserId else 0
	local InitialIndex = if ExtraPropsParam and ExtraPropsParam.initialIndex then ExtraPropsParam.initialIndex else 1
	local InitialMomentId = if FFlagMomentsOptimisticProfilePending and ExtraPropsParam ~= nil then ExtraPropsParam.initialMomentId else nil
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 231 ]]
		-- upvalues: CreateUserMomentsFeedSourceModule (upval), TargetUserId (copy), InitialIndex (copy), InitialMomentId (copy)
		return CreateUserMomentsFeedSourceModule(TargetUserId, {
			initialIndex = InitialIndex,
			initialMomentId = InitialMomentId
		})
	end, { TargetUserId, InitialIndex, InitialMomentId })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 238 ]]
		-- upvalues: FireAnalyticsEventFunction (upval), EventNames (upval), TargetUserId (copy), UseNavigationResult (copy)
		FireAnalyticsEventFunction(EventNames.ProfileClosePressed, { userId = tostring(TargetUserId) })
		UseNavigationResult.goBack()
	end, { UseNavigationResult.goBack, TargetUserId })
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseSelectorResult = UseSelectorFunction(function(p1) --[[ Line: 248 ]]
		return p1.GlobalGuiInset
	end)
	
	return ReactModule.createElement(View, {
		tag = "bg-surface-0",
		Size = UDim2.fromOffset(UseScreenSizeResult.X, UseScreenSizeResult.Y),
		padding = {
			top = UDim.new(0, UseSelectorResult.top + UseStatusBarHeightFunction()),
			bottom = UDim.new(0, UseSelectorResult.bottom),
			left = UDim.new(0, UseSelectorResult.left),
			right = UDim.new(0, UseSelectorResult.right)
		}
	}, {
		OnVideoUI = ReactModule.createElement(FoundationProvider, { colorMode = ColorMode.Dark }, {
			Feed = ReactModule.createElement(Feed, {
				active = true,
				playbackActive = true,
				source = UseMemoResult,
				initialIndex = InitialIndex
			}),
			CloseButtonContainer = ReactModule.createElement(View, {
				tag = "position-top-left anchor-top-left auto-xy padding-large",
				ZIndex = 100000
			}, {
				CloseButton = ReactModule.createElement(IconButton, {
					icon = "icons/navigation/close",
					size = ButtonSize.Medium,
					onActivated = UseResult
				})
			})
		})
	})
end

return if SharedFlagsModule.FFlagEnableArgusImmersiveNav then MomentsFeedPageImmersive else MomentsFeedPageLegacy