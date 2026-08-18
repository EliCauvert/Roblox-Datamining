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
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableArgusImmersiveNav = sharedFlagsModule.FFlagEnableArgusImmersiveNav
local fFlagEnableReportingFlowForMomentsFeed = sharedFlagsModule.FFlagEnableReportingFlowForMomentsFeed
local fFlagMomentsReportWithFeedId = sharedFlagsModule.FFlagMomentsReportWithFeedId
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

return if fFlagEnableArgusImmersiveNav then function() --[[ line: 65 | named "MomentsFeedPageImmersive" ]]
	-- upvalues: useNavigation (ref), reactModule (ref), fireAnalyticsEvent (ref), eventNames (ref), fFlagEnableReportingFlowForMomentsFeed (ref), useDispatch (ref), openDynamicAbuseReport (ref), abuseVector (ref), closeCentralOverlay (ref), reportMoment (ref), fFlagMomentsReportWithFeedId (ref), useScreenSize (ref), view (ref), momentsImmersivePresentation (ref), immersiveFeedKind (ref)
	local var19 = useNavigation()
	local extraProps = var19.getParam("extraProps")
	local var21 = if extraProps and extraProps.targetUserId then extraProps.targetUserId else 0
	local var22 = if extraProps and extraProps.initialIndex then extraProps.initialIndex else 1
	local var23 = reactModule.useCallback(function() --[[ line: 72 ]]
		-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), var21 (ref), var19 (ref)
		fireAnalyticsEvent(eventNames.ProfileClosePressed, { userId = tostring(var21) })
		var19.goBack()
	end, { var19.goBack, var21 })
	local var24 = nil
	
	if fFlagEnableReportingFlowForMomentsFeed then
		local var25 = useDispatch()
		var24 = reactModule.useCallback(function(p1) --[[ line: 85 ]]
			-- upvalues: var25 (ref), openDynamicAbuseReport (copy), abuseVector (copy), closeCentralOverlay (copy), reportMoment (copy), fFlagMomentsReportWithFeedId (copy)
			local var27 = false
			var25(openDynamicAbuseReport({
				abuseVector = abuseVector.MomentsFeed,
				targetId = p1.feedItemId,
				onSubmit = function() --[[ line: 99 ]]
					-- upvalues: var27 (write), p1 (ref)
					if var27 then
						return
					end
					p1.onSubmit()
				end,
				onClose = function() --[[ line: 105 ]]
					-- upvalues: p1 (ref), var25 (copy), closeCentralOverlay (copy)
					p1.onClose()
					var25(closeCentralOverlay())
				end,
				onCustomSubmit = function(p2) --[[ line: 113 ]]
					-- upvalues: var27 (write), p1 (ref), var25 (copy), closeCentralOverlay (copy), reportMoment (copy), fFlagMomentsReportWithFeedId (copy)
					if p2.endpoint == "moments-ip" then
						var27 = true
						
						local function _(p3) --[[ line: 122 | named "showConfirmation" ]]
							-- upvalues: p1 (copy), var25 (copy), closeCentralOverlay (copy)
							p1.onClose()
							var25(closeCentralOverlay())
							
							if p1.onIpReportCode then
								p1.onIpReportCode(p3)
							end
						end
						
						return reportMoment(if fFlagMomentsReportWithFeedId then p1.feedItemId else p1.momentId, "IntellectualProperty"):andThen(function(p4) --[[ line: 132 ]]
							-- upvalues: p1 (copy), var25 (copy), closeCentralOverlay (copy)
							local reportCode = p4.reportCode
							p1.onClose()
							var25(closeCentralOverlay())
							
							if p1.onIpReportCode then
								p1.onIpReportCode(reportCode)
							end
							return p4
						end, function() --[[ line: 135 ]]
							-- upvalues: p1 (copy), var25 (copy), closeCentralOverlay (copy)
							p1.onClose()
							var25(closeCentralOverlay())
							
							if p1.onIpReportCode then
								p1.onIpReportCode(nil)
							end
						end)
					end
					return nil
				end
			}))
		end, { var25 })
	end
	local var26 = useScreenSize()
	
	return reactModule.createElement(view, {
		tag = "bg-surface-0",
		Size = UDim2.fromOffset(var26.X, var26.Y)
	}, {
		Presentation = reactModule.createElement(momentsImmersivePresentation, {
			sessionSource = "profile",
			feedKind = immersiveFeedKind.User,
			targetUserId = var21,
			initialIndex = var22,
			onBack = var23,
			openMomentsFeedReport = var24
		})
	})
end else function() --[[ line: 166 | named "MomentsFeedPageLegacy" ]]
	-- upvalues: useNavigation (ref), reactModule (ref), createUserMomentsFeedSourceModule (ref), fireAnalyticsEvent (ref), eventNames (ref), useScreenSize (ref), useSelector (ref), useStatusBarHeight (ref), view (ref), foundationProvider (ref), colorMode (ref), feed (ref), iconButton (ref), buttonSize (ref)
	local var11 = useNavigation()
	local extraProps = var11.getParam("extraProps")
	local var13 = if extraProps and extraProps.targetUserId then extraProps.targetUserId else 0
	local var14 = if extraProps and extraProps.initialIndex then extraProps.initialIndex else 1
	local var15 = reactModule.useMemo(function() --[[ line: 173 ]]
		-- upvalues: createUserMomentsFeedSourceModule (copy), var13 (ref), var14 (ref)
		return createUserMomentsFeedSourceModule(var13, { initialIndex = var14 })
	end, { var13, var14 })
	local var16 = reactModule.useCallback(function() --[[ line: 179 ]]
		-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), var13 (ref), var11 (ref)
		fireAnalyticsEvent(eventNames.ProfileClosePressed, { userId = tostring(var13) })
		var11.goBack()
	end, { var11.goBack, var13 })
	local var17 = useScreenSize()
	local var18 = useSelector(function(p0) --[[ line: 189 ]]
		return p0.GlobalGuiInset
	end)
	
	return reactModule.createElement(view, {
		tag = "bg-surface-0",
		Size = UDim2.fromOffset(var17.X, var17.Y),
		padding = {
			top = UDim.new(0, var18.top + useStatusBarHeight()),
			bottom = UDim.new(0, var18.bottom),
			left = UDim.new(0, var18.left),
			right = UDim.new(0, var18.right)
		}
	}, {
		OnVideoUI = reactModule.createElement(foundationProvider, { colorMode = colorMode.Dark }, {
			Feed = reactModule.createElement(feed, {
				active = true,
				playbackActive = true,
				source = var15,
				initialIndex = var14
			}),
			CloseButtonContainer = reactModule.createElement(view, {
				tag = "position-top-left anchor-top-left auto-xy padding-large",
				ZIndex = 100000
			}, {
				CloseButton = reactModule.createElement(iconButton, {
					icon = "icons/navigation/close",
					size = buttonSize.Medium,
					onActivated = var16
				})
			})
		})
	})
end