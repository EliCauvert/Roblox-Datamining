local StreamNotifications = script:FindFirstAncestor("StreamNotifications")
local Parent = StreamNotifications.Parent
local ReactModule = require(Parent.React)
local ConstantsModule = require(StreamNotifications.constants)
local ReactOtterModule = require(Parent.ReactOtter)
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local DarkTheme = UIBloxModule.App.Style.Themes.DarkTheme
local StreamNotificationDropdownExperimentationModule = require(StreamNotifications.StreamNotificationDropdownExperimentation)
local NotificationsCommonModule = require(Parent.NotificationsCommon)
local NotificationCard = NotificationsCommonModule.NotificationCard
local NotificationCardProvider = NotificationsCommonModule.NotificationCardProvider
local MarshalStreamNotificationDataFunction = NotificationsCommonModule.NotificationHelper.marshalStreamNotificationData
local UseImpressionsTaggerFunction = require(Parent.Impressions).useImpressionsTagger
local FFlagStreamNotificationImpressionLogging = require(Parent.SharedFlags).FFlagStreamNotificationImpressionLogging
local config = { stiffness = 207, damping = 24, mass = 1 }

return function(p1)
	-- upvalues: UseStyleFunction (copy), StreamNotificationDropdownExperimentationModule (copy), MarshalStreamNotificationDataFunction (copy), ReactModule (copy), ReactOtterModule (copy), config (copy), ConstantsModule (copy), FFlagStreamNotificationImpressionLogging (copy), UseImpressionsTaggerFunction (copy), DarkTheme (copy), NotificationCardProvider (copy), NotificationCard (copy)
	local UseStyleResult = UseStyleFunction()
	local DropdownEnabled = StreamNotificationDropdownExperimentationModule.getDropdownEnabled()
	local MarshalStreamNotificationDataResult = MarshalStreamNotificationDataFunction(p1.notification)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding({
		dismissHeight = 1,
		transparency = 1,
		collapsedHeight = if p1.collapsed then 0 else 1,
		collapsedWidth = if p1.collapsed then 1 else 0
	}, function()
		-- upvalues: p1 (copy)
		if p1.notification.dismiss then
			p1.finishDismissNotification(p1.notification.id)
		end
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), p1 (copy), config (upval)
		UseAnimatedBindingResult2({
			dismissHeight = ReactOtterModule.spring(if p1.notification.dismiss then 0 else 1, config),
			transparency = ReactOtterModule.spring(if p1.notification.dismiss then 0 else 1, config),
			collapsedHeight = ReactOtterModule.spring(if p1.collapsed then 0 else 1, config),
			collapsedWidth = ReactOtterModule.spring(if p1.collapsed then 1 else 0, config)
		})
	end, { p1.notification.dismiss, p1.collapsed })
	
	local function v21(Frame)
		-- upvalues: p1 (copy)
		if p1.onHeightChange then
			p1.onHeightChange(p1.layoutOrder, Frame.AbsoluteSize.Y)
		end
	end
	
	local function v22(Frame)
		-- upvalues: p1 (copy), DropdownEnabled (copy), ConstantsModule (upval), UseStateResult2 (copy)
		if p1.notification.dismiss ~= true then
			UseStateResult2(Frame.AbsoluteSize.Y + (if DropdownEnabled then 0 else ConstantsModule.DefaultPadding))
		end
	end
	
	local ScaledDefaultPadding = 0
	local ScaledDefaultPadding1 = 0
	
	if not DropdownEnabled then
		ScaledDefaultPadding = ConstantsModule.DefaultPadding * 2
		
		if p1.layoutOrder == 2 then
			ScaledDefaultPadding1 = ConstantsModule.DefaultPadding * 2
		elseif p1.layoutOrder == 3 then
			ScaledDefaultPadding1 = ConstantsModule.DefaultPadding * 4
		elseif p1.layoutOrder >= 4 then
			ScaledDefaultPadding1 = ConstantsModule.DefaultPadding * 6
		end
	end
	if FFlagStreamNotificationImpressionLogging then
		UseImpressionsTaggerFunction(UseRefResult, p1.impressionsTag, p1.impressionIndex)
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ref = UseRefResult,
		Size = UseAnimatedBindingResult:map(function(p2): UDim2
			-- upvalues: p1 (copy), ScaledDefaultPadding (ref), ScaledDefaultPadding1 (ref), UseStateResult (copy), DropdownEnabled (copy), ConstantsModule (upval)
			return if p1.layoutOrder == 1 and p1.collapsed then UDim2.new(1, -(ScaledDefaultPadding + ScaledDefaultPadding1 * p2.collapsedWidth), 0, p2.collapsedHeight * p2.dismissHeight * UseStateResult + (if DropdownEnabled then 0 else ConstantsModule.DefaultPadding)) else UDim2.new(1, -(ScaledDefaultPadding + ScaledDefaultPadding1 * p2.collapsedWidth), 0, p2.collapsedHeight * p2.dismissHeight * UseStateResult)
		end),
		ClipsDescendants = p1.layoutOrder ~= 1 and p1.collapsed,
		LayoutOrder = p1.layoutOrder or 1,
		ZIndex = if p1.layoutOrder then -p1.layoutOrder else 1
	}, {
		DismissFrame = ReactModule.createElement("Frame", {
			Size = UseAnimatedBindingResult:map(function(p2): UDim2
				-- upvalues: UseStateResult (copy)
				return UDim2.new(1, 0, 0, p2.dismissHeight * UseStateResult)
			end),
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			LayoutOrder = p1.layoutOrder,
			[ReactModule.Change.AbsoluteSize] = v21
		}, {
			FadeFrame = ReactModule.createElement("Frame", {
				ZIndex = 2,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundColor3 = if UseStyleResult.theme == DarkTheme then UseStyleResult.Theme.Overlay.Color else UseStyleResult.Theme.BackgroundMuted.Color,
				BackgroundTransparency = UseAnimatedBindingResult:map(function(p2)
					return p2.transparency
				end),
				Position = UDim2.fromScale(0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0)
			}, {}),
			InnerFrame = ReactModule.createElement("Frame", {
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
				ZIndex = 1,
				Position = UDim2.fromScale(0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0),
				[ReactModule.Change.AbsoluteSize] = v22
			}, {
				ReactModule.createElement(NotificationCardProvider, {
					isCompact = false,
					notificationPayload = p1.notification,
					state = MarshalStreamNotificationDataResult.state,
					readOnly = if p1.collapsed then true else false,
					handleActions = p1.handleActions,
					openMetaActions = p1.openMetaActions
				}, {
					NotificationCard = ReactModule.createElement(NotificationCard, { isHover = false, layoutOrder = p1.layoutOrder })
				})
			})
		})
	})
end