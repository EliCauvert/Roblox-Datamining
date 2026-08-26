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

return function(p1)
	-- upvalues: useStyle (ref), streamNotificationDropdownExperimentationModule (ref), marshalStreamNotificationData (ref), reactModule (ref), reactOtterModule (ref), t (ref), constantsModule (ref), fFlagStreamNotificationImpressionLogging (ref), useImpressionsTagger (ref), darkTheme (ref), notificationCardProvider (ref), notificationCard (ref)
	local var1 = useStyle()
	local dropdownEnabled = streamNotificationDropdownExperimentationModule.getDropdownEnabled()
	local var2 = marshalStreamNotificationData(p1.notification)
	local var3 = reactModule.useRef(nil)
	local var4, var5 = reactModule.useState(0)
	local var6, var7 = reactOtterModule.useAnimatedBinding({
		dismissHeight = 1,
		transparency = 1,
		collapsedHeight = if p1.collapsed then 0 else 1,
		collapsedWidth = if p1.collapsed then 1 else 0
	}, function()
		-- upvalues: p1 (ref)
		if p1.notification.dismiss then
			p1.finishDismissNotification(p1.notification.id)
		end
	end)
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), reactOtterModule (copy), p1 (ref), t (copy)
		var7({
			dismissHeight = reactOtterModule.spring(if p1.notification.dismiss then 0 else 1, t),
			transparency = reactOtterModule.spring(if p1.notification.dismiss then 0 else 1, t),
			collapsedHeight = reactOtterModule.spring(if p1.collapsed then 0 else 1, t),
			collapsedWidth = reactOtterModule.spring(if p1.collapsed then 1 else 0, t)
		})
	end, { p1.notification.dismiss, p1.collapsed })
	
	local var8 = function(p2)
		-- upvalues: p1 (ref)
		if p1.onHeightChange then
			p1.onHeightChange(p1.layoutOrder, p2.AbsoluteSize.Y)
		end
	end
	
	local var9 = function(p2)
		-- upvalues: p1 (ref), dropdownEnabled (ref), constantsModule (copy), var5 (ref)
		if p1.notification.dismiss ~= true then
			var5(p2.AbsoluteSize.Y + (if dropdownEnabled then 0 else constantsModule.DefaultPadding))
		end
	end
	
	local var10 = 0
	local var11 = 0
	
	if not dropdownEnabled then
		var10 = constantsModule.DefaultPadding * 2
		
		if p1.layoutOrder == 2 then
			var11 = constantsModule.DefaultPadding * 2
		elseif p1.layoutOrder == 3 then
			var11 = constantsModule.DefaultPadding * 4
		elseif p1.layoutOrder >= 4 then
			var11 = constantsModule.DefaultPadding * 6
		end
	end
	if fFlagStreamNotificationImpressionLogging then
		useImpressionsTagger(var3, p1.impressionsTag, p1.impressionIndex)
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ref = var3,
		Size = var6:map(function(p2)
			-- upvalues: p1 (ref), var10 (write), var11 (write), var4 (ref), dropdownEnabled (ref), constantsModule (copy)
			return if p1.layoutOrder == 1 and p1.collapsed then UDim2.new(1, -(var10 + var11 * p2.collapsedWidth), 0, p2.collapsedHeight * p2.dismissHeight * var4 + (if dropdownEnabled then 0 else constantsModule.DefaultPadding)) else UDim2.new(1, -(var10 + var11 * p2.collapsedWidth), 0, p2.collapsedHeight * p2.dismissHeight * var4)
		end),
		ClipsDescendants = if p1.layoutOrder == 1 or not p1.collapsed then false else true,
		LayoutOrder = p1.layoutOrder or 1,
		ZIndex = if p1.layoutOrder then -p1.layoutOrder else 1
	}, {
		DismissFrame = reactModule.createElement("Frame", {
			Size = var6:map(function(p2)
				-- upvalues: var4 (ref)
				return UDim2.new(1, 0, 0, p2.dismissHeight * var4)
			end),
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			LayoutOrder = p1.layoutOrder,
			[reactModule.Change.AbsoluteSize] = var8
		}, {
			FadeFrame = reactModule.createElement("Frame", {
				ZIndex = 2,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundColor3 = if var1.theme == darkTheme then var1.Theme.Overlay.Color else var1.Theme.BackgroundMuted.Color,
				BackgroundTransparency = var6:map(function(p2)
					return p2.transparency
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
				[reactModule.Change.AbsoluteSize] = var9
			}, {
				reactModule.createElement(notificationCardProvider, {
					isCompact = false,
					notificationPayload = p1.notification,
					state = var2.state,
					readOnly = if p1.collapsed then true else false,
					handleActions = p1.handleActions,
					openMetaActions = p1.openMetaActions
				}, {
					NotificationCard = reactModule.createElement(notificationCard, { isHover = false, layoutOrder = p1.layoutOrder })
				})
			})
		})
	})
end