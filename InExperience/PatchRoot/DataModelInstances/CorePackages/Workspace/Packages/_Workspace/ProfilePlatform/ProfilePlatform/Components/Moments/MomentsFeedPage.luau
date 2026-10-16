local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local navigationModule = require(parent.Navigation)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local roactUtilsModule = require(parent.RoactUtils)
local momentsCommonModule = require(parent.MomentsCommon)
local momentsModule = require(parent.Moments)
local genericAbuseReportingModule = require(parent.GenericAbuseReporting)
local centralOverlayModule = require(parent.CentralOverlay)
local useOpenBlockingModalModule = require(parent.MomentsCommon.useOpenBlockingModal)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagMomentsOptimisticProfilePending = sharedFlagsModule.FFlagMomentsOptimisticProfilePending
local fFlagEnableArgusImmersiveNav = sharedFlagsModule.FFlagEnableArgusImmersiveNav
local fFlagEnableReportingFlowForMomentsFeed = sharedFlagsModule.FFlagEnableReportingFlowForMomentsFeed
local fFlagEnableMomentsCommentReporting = sharedFlagsModule.FFlagEnableMomentsCommentReporting
local fFlagEnableMomentsCommentBlocking = sharedFlagsModule.FFlagEnableMomentsCommentBlocking
local fFlagAbuseReportSubmissionTargetV4 = sharedFlagsModule.FFlagAbuseReportSubmissionTargetV4
local view = foundationModule.View
local iconButton = foundationModule.IconButton
local buttonSize = foundationModule.Enums.ButtonSize
local foundationProvider = foundationModule.FoundationProvider
local colorMode = foundationModule.Enums.ColorMode
local useScreenSize = robloxAppHooksModule.useScreenSize
local useStatusBarHeight = robloxAppHooksModule.useStatusBarHeight
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local abuseVector = genericAbuseReportingModule.Enums.AbuseVector
local openDynamicAbuseReport = genericAbuseReportingModule.Thunks.OpenDynamicAbuseReport
local closeCentralOverlay = centralOverlayModule.Thunks.CloseCentralOverlay
local fireAnalyticsEvent = momentsCommonModule.Analytics.fireAnalyticsEvent
local eventNames = momentsCommonModule.Analytics.EventNames
local useNavigation = navigationModule.useNavigation
local feed = momentsModule.Feed
local momentsImmersivePresentation = momentsModule.MomentsImmersivePresentation
local immersiveFeedKind = momentsModule.Constants.ImmersiveFeedKind
local createUserMomentsFeedSourceModule = require(parent.Moments.CreateUserMomentsFeedSource)
local reportMoment = momentsModule.reportMoment

return if fFlagEnableArgusImmersiveNav then function()
	-- upvalues: useNavigation (ref), fFlagMomentsOptimisticProfilePending (ref), reactModule (ref), fireAnalyticsEvent (ref), eventNames (ref), fFlagEnableReportingFlowForMomentsFeed (ref), useDispatch (ref), closeCentralOverlay (ref), reportMoment (ref), openDynamicAbuseReport (ref), abuseVector (ref), fFlagAbuseReportSubmissionTargetV4 (ref), fFlagEnableMomentsCommentReporting (ref), fFlagEnableMomentsCommentBlocking (ref), useOpenBlockingModalModule (ref), useScreenSize (ref), view (ref), momentsImmersivePresentation (ref), immersiveFeedKind (ref)
	local var1 = useNavigation()
	local extraProps = var1.getParam("extraProps")
	local var2 = if extraProps and extraProps.targetUserId then extraProps.targetUserId else 0
	local var3 = if extraProps and extraProps.initialIndex then extraProps.initialIndex else 1
	local var4 = if fFlagMomentsOptimisticProfilePending and extraProps ~= nil then extraProps.initialMomentId else nil
	local var5 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), var2 (ref), var1 (ref)
		fireAnalyticsEvent(eventNames.ProfileClosePressed, { userId = tostring(var2) })
		var1.goBack()
	end, { var1.goBack, var2 })
	local var6 = nil
	
	if fFlagEnableReportingFlowForMomentsFeed then
		local var7 = useDispatch()
		var6 = reactModule.useCallback(function(p1)
			-- upvalues: var7 (ref), closeCentralOverlay (copy), reportMoment (copy), openDynamicAbuseReport (copy), abuseVector (copy), fFlagAbuseReportSubmissionTargetV4 (copy)
			local var8 = false
			
			local function submitMomentsIp(_)
				-- upvalues: var8 (write), p1 (ref), var7 (copy), closeCentralOverlay (copy), reportMoment (copy)
				var8 = true
				
				local function _(p2)
					-- upvalues: p1 (copy), var7 (copy), closeCentralOverlay (copy)
					p1.onClose()
					var7(closeCentralOverlay())
					
					if p1.onIpReportCode then
						p1.onIpReportCode(p2)
					end
				end
				
				return reportMoment(p1.feedItemId, "IntellectualProperty"):andThen(function(p2)
					-- upvalues: p1 (copy), var7 (copy), closeCentralOverlay (copy)
					local reportCode = p2.reportCode
					p1.onClose()
					var7(closeCentralOverlay())
					
					if p1.onIpReportCode then
						p1.onIpReportCode(reportCode)
					end
					return p2
				end, function()
					-- upvalues: p1 (copy), var7 (copy), closeCentralOverlay (copy)
					p1.onClose()
					var7(closeCentralOverlay())
					
					if p1.onIpReportCode then
						p1.onIpReportCode(nil)
					end
				end)
			end
			
			var7(openDynamicAbuseReport({
				abuseVector = abuseVector.MomentsFeed,
				targetId = p1.feedItemId,
				onSubmit = function()
					-- upvalues: var8 (write), p1 (ref)
					if var8 then
						return
					end
					p1.onSubmit()
				end,
				onClose = function()
					-- upvalues: p1 (ref), var7 (copy), closeCentralOverlay (copy)
					p1.onClose()
					var7(closeCentralOverlay())
				end,
				onCustomSubmit = if not fFlagAbuseReportSubmissionTargetV4 then function(p2)
					-- upvalues: submitMomentsIp (ref)
					return if p2.endpoint == "moments-ip" then submitMomentsIp(p2) else nil
				end else nil,
				clientActionHandlers = if fFlagAbuseReportSubmissionTargetV4 then { ["moments-ip"] = submitMomentsIp } else nil
			}))
		end, { var7 })
	end
	local var8 = nil
	
	if fFlagEnableMomentsCommentReporting then
		local var9 = useDispatch()
		var8 = reactModule.useCallback(function(p1)
			-- upvalues: var9 (ref), openDynamicAbuseReport (copy), abuseVector (copy), closeCentralOverlay (copy)
			var9(openDynamicAbuseReport({
				abuseVector = abuseVector.MomentComment,
				attributes = {
					targetId = p1.commentId,
					channelId = p1.channelId,
					reportedUserId = p1.reportedUserId
				},
				analyticsTargetId = p1.commentId,
				onClose = function()
					-- upvalues: var9 (copy), closeCentralOverlay (copy)
					var9(closeCentralOverlay())
				end
			}))
		end, { var9 })
	end
	local var10 = useScreenSize()
	
	return reactModule.createElement(view, {
		tag = "bg-surface-0",
		Size = UDim2.fromOffset(var10.X, var10.Y)
	}, {
		Presentation = reactModule.createElement(momentsImmersivePresentation, {
			sessionSource = "profile",
			feedKind = immersiveFeedKind.User,
			targetUserId = var2,
			initialIndex = var3,
			initialMomentId = var4,
			onBack = var5,
			openMomentsFeedReport = var6,
			openMomentCommentReport = var8,
			openBlockUser = if fFlagEnableMomentsCommentBlocking then useOpenBlockingModalModule(var1) else nil
		})
	})
end else function()
	-- upvalues: useNavigation (ref), fFlagMomentsOptimisticProfilePending (ref), reactModule (ref), createUserMomentsFeedSourceModule (ref), fireAnalyticsEvent (ref), eventNames (ref), useScreenSize (ref), useSelector (ref), useStatusBarHeight (ref), view (ref), foundationProvider (ref), colorMode (ref), feed (ref), iconButton (ref), buttonSize (ref)
	local var1 = useNavigation()
	local extraProps = var1.getParam("extraProps")
	local var2 = if extraProps and extraProps.targetUserId then extraProps.targetUserId else 0
	local var3 = if extraProps and extraProps.initialIndex then extraProps.initialIndex else 1
	local var4 = if fFlagMomentsOptimisticProfilePending and extraProps ~= nil then extraProps.initialMomentId else nil
	local var5 = reactModule.useMemo(function()
		-- upvalues: createUserMomentsFeedSourceModule (copy), var2 (ref), var3 (ref), var4 (ref)
		return createUserMomentsFeedSourceModule(var2, { initialIndex = var3, initialMomentId = var4 })
	end, { var2, var3, var4 })
	local var6 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), var2 (ref), var1 (ref)
		fireAnalyticsEvent(eventNames.ProfileClosePressed, { userId = tostring(var2) })
		var1.goBack()
	end, { var1.goBack, var2 })
	local var7 = useScreenSize()
	local var8 = useSelector(function(p1)
		return p1.GlobalGuiInset
	end)
	
	return reactModule.createElement(view, {
		tag = "bg-surface-0",
		Size = UDim2.fromOffset(var7.X, var7.Y),
		padding = {
			top = UDim.new(0, var8.top + useStatusBarHeight()),
			bottom = UDim.new(0, var8.bottom),
			left = UDim.new(0, var8.left),
			right = UDim.new(0, var8.right)
		}
	}, {
		OnVideoUI = reactModule.createElement(foundationProvider, { colorMode = colorMode.Dark }, {
			Feed = reactModule.createElement(feed, {
				active = true,
				playbackActive = true,
				source = var5,
				initialIndex = var3
			}),
			CloseButtonContainer = reactModule.createElement(view, {
				tag = "position-top-left anchor-top-left auto-xy padding-large",
				ZIndex = 100000
			}, {
				CloseButton = reactModule.createElement(iconButton, {
					icon = "icons/navigation/close",
					size = buttonSize.Medium,
					onActivated = var6
				})
			})
		})
	})
end