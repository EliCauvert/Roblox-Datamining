local streamNotifications = script:FindFirstAncestor("StreamNotifications")
local parent = streamNotifications.Parent
local reactModule = require(parent.React)
local constantsModule = require(streamNotifications.constants)
local reactOtterModule = require(parent.ReactOtter)
local sharedFlagsModule = require(parent.SharedFlags)
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local darkTheme = UIBloxModule.App.Style.Themes.DarkTheme
local streamNotificationDropdownExperimentationModule = require(streamNotifications.StreamNotificationDropdownExperimentation)
local notificationsCommonModule = require(parent.NotificationsCommon)
local notificationCard = notificationsCommonModule.NotificationCard
local notificationCardProvider = notificationsCommonModule.NotificationCardProvider
local marshalStreamNotificationData = notificationsCommonModule.NotificationHelper.marshalStreamNotificationData
local useImpressionsTagger = require(parent.Impressions).useImpressionsTagger
local fFlagStreamNotificationImpressionLogging = sharedFlagsModule.FFlagStreamNotificationImpressionLogging
local t = { stiffness = 207, damping = 24, mass = 1 }

return function(p0)
	-- upvalues: useStyle (ref), streamNotificationDropdownExperimentationModule (ref), marshalStreamNotificationData (ref), reactModule (ref), reactOtterModule (ref), t (ref), constantsModule (ref), fFlagStreamNotificationImpressionLogging (ref), useImpressionsTagger (ref), darkTheme (ref), notificationCardProvider (ref), notificationCard (ref)
	local var9 = useStyle()
	local dropdownEnabled = streamNotificationDropdownExperimentationModule.getDropdownEnabled()
	local var11 = marshalStreamNotificationData(p0.notification)
	local var12 = reactModule.useRef(nil)
	local var13, var14 = reactModule.useState(0)
	local var15, var16 = reactOtterModule.useAnimatedBinding({
		dismissHeight = 1,
		transparency = 1,
		collapsedHeight = if p0.collapsed then 0 else 1,
		collapsedWidth = if p0.collapsed then 1 else 0
	}, function()
		-- upvalues: p0 (ref)
		if p0.notification.dismiss then
			p0.finishDismissNotification(p0.notification.id)
		end
	end)
	reactModule.useEffect(function()
		-- upvalues: var16 (ref), reactOtterModule (copy), p0 (ref), t (copy)
		var16({
			dismissHeight = reactOtterModule.spring(if p0.notification.dismiss then 0 else 1, t),
			transparency = reactOtterModule.spring(if p0.notification.dismiss then 0 else 1, t),
			collapsedHeight = reactOtterModule.spring(if p0.collapsed then 0 else 1, t),
			collapsedWidth = reactOtterModule.spring(if p0.collapsed then 1 else 0, t)
		})
	end, { p0.notification.dismiss, p0.collapsed })
	
	local var17 = function(p1)
		-- upvalues: p0 (ref)
		if p0.onHeightChange then
			p0.onHeightChange(p0.layoutOrder, p1.AbsoluteSize.Y)
		end
	end
	
	local var18 = function(p2)
		-- upvalues: p0 (ref), dropdownEnabled (ref), constantsModule (copy), var14 (ref)
		if p0.notification.dismiss ~= true then
			var14(p2.AbsoluteSize.Y + (if dropdownEnabled then 0 else constantsModule.DefaultPadding))
		end
	end
	
	local var19 = 0
	local var20 = 0
	
	if not dropdownEnabled then
		var19 = constantsModule.DefaultPadding * 2
		
		if p0.layoutOrder == 2 then
			var20 = constantsModule.DefaultPadding * 2
		elseif p0.layoutOrder == 3 then
			var20 = constantsModule.DefaultPadding * 4
		elseif p0.layoutOrder >= 4 then
			var20 = constantsModule.DefaultPadding * 6
		end
	end
	if fFlagStreamNotificationImpressionLogging then
		useImpressionsTagger(var12, p0.impressionsTag, p0.impressionIndex)
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ref = var12,
		Size = var15:map(function(p3)
			-- upvalues: p0 (ref), var19 (write), var20 (write), var13 (ref), dropdownEnabled (ref), constantsModule (copy)
			return if p0.layoutOrder == 1 and p0.collapsed then UDim2.new(1, -(var19 + var20 * p3.collapsedWidth), 0, p3.collapsedHeight * p3.dismissHeight * var13 + (if dropdownEnabled then 0 else constantsModule.DefaultPadding)) else UDim2.new(1, -(var19 + var20 * p3.collapsedWidth), 0, p3.collapsedHeight * p3.dismissHeight * var13)
		end),
		ClipsDescendants = if p0.layoutOrder == 1 or not p0.collapsed then false else true,
		LayoutOrder = p0.layoutOrder or 1,
		ZIndex = if p0.layoutOrder then -p0.layoutOrder else 1
	}, {
		DismissFrame = reactModule.createElement("Frame", {
			Size = var15:map(function(p4)
				-- upvalues: var13 (ref)
				return UDim2.new(1, 0, 0, p4.dismissHeight * var13)
			end),
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			LayoutOrder = p0.layoutOrder,
			[reactModule.Change.AbsoluteSize] = var17
		}, {
			FadeFrame = reactModule.createElement("Frame", {
				ZIndex = 2,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundColor3 = if var9.theme == darkTheme then var9.Theme.Overlay.Color else var9.Theme.BackgroundMuted.Color,
				BackgroundTransparency = var15:map(function(p5)
					return p5.transparency
				end),
				Position = UDim2.fromScale(0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0)
			}, {}),
			InnerFrame = reactModule.createElement("Frame", {
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
				ZIndex = 1,
				Position = UDim2.fromScale(0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0),
				[reactModule.Change.AbsoluteSize] = var18
			}, {
				reactModule.createElement(notificationCardProvider, {
					isCompact = false,
					notificationPayload = p0.notification,
					state = var11.state,
					readOnly = if p0.collapsed then true else false,
					handleActions = p0.handleActions,
					openMetaActions = p0.openMetaActions
				}, {
					NotificationCard = reactModule.createElement(notificationCard, { isHover = false, layoutOrder = p0.layoutOrder })
				})
			})
		})
	})
end