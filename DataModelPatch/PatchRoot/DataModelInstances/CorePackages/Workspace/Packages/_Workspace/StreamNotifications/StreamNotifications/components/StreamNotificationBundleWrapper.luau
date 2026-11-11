local StreamNotifications = script:FindFirstAncestor("StreamNotifications")
local Parent = StreamNotifications.Parent
local ReactModule = require(Parent.React)
local ConstantsModule = require(StreamNotifications.constants)
local ReactOtterModule = require(Parent.ReactOtter)
local StreamNotificationAnimationWrapperModule = require(StreamNotifications.components.StreamNotificationAnimationWrapper)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local NotificationHelper = require(Parent.NotificationsCommon).NotificationHelper
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local IconsActionsTruncationExpand = Images["icons/actions/truncationExpand"]
local IconsActionsTruncationCollapse = Images["icons/actions/truncationCollapse"]
local _UDim = UDim.new(0, 12)
local _UDim1 = UDim.new(0, 24)
local ScaledDefaultPadding = ConstantsModule.DefaultPadding * 4
local _UDim2 = UDim2.fromOffset(24, 24)
local EventStream = require(StreamNotifications.analytics.analyticsService).EventStream
local AnalyticsConstantsModule = require(StreamNotifications.analytics.analyticsConstants)
local config = { stiffness = 207, damping = 24, mass = 1 }

return function(p1)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), ReactOtterModule (copy), UseLocalizationFunction (copy), ConstantsModule (copy), NotificationHelper (copy), EventStream (copy), AnalyticsConstantsModule (copy), config (copy), StreamNotificationAnimationWrapperModule (copy), _UDim (copy), _UDim1 (copy), ImageSetLabel (copy), _UDim2 (copy), IconsActionsTruncationCollapse (copy), ScaledDefaultPadding (copy), IconsActionsTruncationExpand (copy)
	local UseStyleResult = UseStyleFunction()
	local UseStyleResultFont = UseStyleResult.Font
	local HeaderFont = UseStyleResultFont.Header1.Font
	local ScaledBaseSize = UseStyleResultFont.BaseSize * UseStyleResultFont.CaptionHeader.RelativeSize
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(74)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(true)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding({ shadowHeight = 0, shadowWidth = 1 })
	local UseLocalizationResult = UseLocalizationFunction({
		moreText = ConstantsModule.Text.ShowMoreKey,
		lessText = ConstantsModule.Text.ShowLessKey
	})
	local UseResult = ReactModule.useCallback(function(p2, p3)
		-- upvalues: UseStateResult (copy), UseStateResult2_1 (copy)
		if p2 == 1 and UseStateResult then
			UseStateResult2_1(p3)
		end
	end)
	
	local function v33(Notifications)
		local Ids = {}
		
		for _, notification in Notifications do
			if notification.id then
				table.insert(Ids, notification.id)
			end
		end
		return Ids
	end
	
	local function v34()
		-- upvalues: UseStateResult2 (copy), NotificationHelper (upval), EventStream (upval), AnalyticsConstantsModule (upval), p1 (copy), v33 (copy)
		UseStateResult2(function(p2): boolean
			-- upvalues: NotificationHelper (upval), EventStream (upval), AnalyticsConstantsModule (upval), p1 (upval), v33 (upval)
			NotificationHelper.fireEvent(EventStream, AnalyticsConstantsModule.Context.click, if p2 then AnalyticsConstantsModule.EventNames.bundleOpened else AnalyticsConstantsModule.EventNames.bundleClosed, {
				bundleKey = p1.notifications[1].content.bundleKey or nil,
				totalNotifications = #p1.notifications or nil,
				notificationIds = v33(p1.notifications) or nil
			})
			
			if p2 then
				for BundlePosition, notification in p1.notifications do
					NotificationHelper.fireEvent(EventStream, AnalyticsConstantsModule.Context.seen, AnalyticsConstantsModule.EventNames.notificationViewed, {
						notificationId = notification.id or nil,
						notificationType = notification.content.notificationType or nil,
						bundlePosition = BundlePosition,
						bundleKey = notification.content.bundleKey or nil,
						clientEventsPayload = notification.content.clientEventsPayload or nil
					})
				end
			end
			return not p2
		end)
	end
	
	ReactModule.useEffect(function()
		-- upvalues: UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), UseStateResult (copy), config (upval)
		UseAnimatedBindingResult2({
			shadowHeight = ReactOtterModule.spring(if UseStateResult then 0 else 1, config),
			shadowWidth = ReactOtterModule.spring(if UseStateResult then 1 else 0, config)
		})
	end, { UseStateResult })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_2 (copy), p1 (copy)
		UseStateResult2_2(#p1.notifications > 1)
	end, { p1.notifications })
	
	return (ReactModule.useMemo(function()
		-- upvalues: p1 (copy), UseStateResult (copy), UseStateResult3 (copy), ReactModule (upval), StreamNotificationAnimationWrapperModule (upval), UseResult (copy), UseAnimatedBindingResult (copy), UseStateResult1 (copy), ConstantsModule (upval), UseStyleResult (copy), _UDim (upval), HeaderFont (copy), ScaledBaseSize (copy), v34 (copy), _UDim1 (upval), UseLocalizationResult (copy), ImageSetLabel (upval), _UDim2 (upval), IconsActionsTruncationCollapse (upval), ScaledDefaultPadding (upval), IconsActionsTruncationExpand (upval)
		local Elements = {}
		
		for LayoutOrder, notification in ipairs(p1.notifications) do
			local Collapsed = false
			local ImpressionMetadataByNotificationIdEntry = if p1.impressionMetadataByNotificationId then p1.impressionMetadataByNotificationId[notification.id] else nil
			
			if UseStateResult and UseStateResult3 then
				Collapsed = true
			end
			Elements[notification.id] = ReactModule.createElement(StreamNotificationAnimationWrapperModule, {
				layoutOrder = LayoutOrder,
				notification = notification,
				finishDismissNotification = p1.finishDismissNotification,
				handleActions = p1.handleActions,
				openMetaActions = p1.openMetaActions,
				onHeightChange = UseResult,
				collapsed = Collapsed,
				impressionsTag = p1.impressionsTag,
				impressionIndex = ImpressionMetadataByNotificationIdEntry and ImpressionMetadataByNotificationIdEntry.impressionIndex or nil
			})
		end
		Elements.UIPadding = ReactModule.createElement("UIPadding", {
			PaddingTop = if UseStateResult or not UseStateResult3 then UDim.new(0, 0) else UDim.new(0, 40)
		})
		Elements.UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		})
		Elements.Shadow1 = if UseStateResult and UseStateResult3 then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UseAnimatedBindingResult:map(function(p2): UDim2
				-- upvalues: UseStateResult1 (upval), ConstantsModule (upval)
				return UDim2.new(1, 0, 0, p2.shadowHeight * UseStateResult1 + ConstantsModule.DefaultPadding)
			end),
			LayoutOrder = #p1.notifications + 1,
			ZIndex = -(#p1.notifications + 1)
		}, {
			ReactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				Size = UseAnimatedBindingResult:map(function(p2): UDim2
					-- upvalues: ConstantsModule (upval), UseStateResult1 (upval)
					return UDim2.new(1, -(ConstantsModule.DefaultPadding * 4 * p2.shadowWidth), 0, UseStateResult1 - ConstantsModule.DefaultPadding)
				end),
				BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
				Position = UDim2.new(0.5, 0, 0, 0),
				AnchorPoint = Vector2.new(0.5, 0)
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = _UDim })
			})
		}) else nil
		Elements.Shadow2 = if UseStateResult and UseStateResult3 then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UseAnimatedBindingResult:map(function(p2): UDim2
				-- upvalues: UseStateResult1 (upval), ConstantsModule (upval)
				return UDim2.new(1, 0, 0, p2.shadowHeight * UseStateResult1 + ConstantsModule.DefaultPadding * 2)
			end),
			LayoutOrder = #p1.notifications + 2,
			ZIndex = -(#p1.notifications + 2)
		}, {
			ReactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				Size = UseAnimatedBindingResult:map(function(p2): UDim2
					-- upvalues: ConstantsModule (upval), UseStateResult1 (upval)
					return UDim2.new(1, -(ConstantsModule.DefaultPadding * 6 * p2.shadowWidth), 0, UseStateResult1 - ConstantsModule.DefaultPadding)
				end),
				BackgroundColor3 = UseStyleResult.Theme.BackgroundContrast.Color,
				Position = UDim2.new(0.5, 0, 0, 0),
				AnchorPoint = Vector2.new(0.5, 0)
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = _UDim })
			})
		}) else nil
		
		return ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = p1.layoutOrder
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingBottom = if UseStateResult and UseStateResult3 then UDim.new(0, ConstantsModule.DefaultPadding) else UDim.new(0, 0)
			}),
			ShowLessButton = if UseStateResult or not UseStateResult3 then nil else ReactModule.createElement("TextButton", {
				Size = UDim2.new(0, 160, 0, 40),
				Text = "",
				Font = HeaderFont,
				TextSize = ScaledBaseSize,
				[ReactModule.Event.Activated] = v34,
				BackgroundTransparency = 1,
				BackgroundColor3 = UseStyleResult.Theme.BackgroundMuted.Color,
				AutoButtonColor = false,
				LayoutOrder = 1,
				ZIndex = 4,
				Position = UDim2.new(1, 0, 0, 0),
				AnchorPoint = Vector2.new(1, 0),
				BorderSizePixel = 0
			}, {
				ReactModule.createElement("Frame", {
					BackgroundTransparency = 0,
					ZIndex = 10,
					BorderSizePixel = 0,
					Size = UDim2.new(1, -ConstantsModule.DefaultPadding, 1, -ConstantsModule.DefaultPadding),
					BackgroundColor3 = UseStyleResult.Theme.BackgroundContrast.Color,
					Position = UDim2.new(1, -ConstantsModule.DefaultPadding, 0, 0),
					AnchorPoint = Vector2.new(1, 0)
				}, {
					UICorner = ReactModule.createElement("UICorner", { CornerRadius = _UDim1 }),
					ShowLessTextAndIconFrame = ReactModule.createElement("Frame", {
						BorderSizePixel = 0,
						BackgroundTransparency = 1,
						AutomaticSize = Enum.AutomaticSize.XY,
						Position = UDim2.new(0.5, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5)
					}, {
						UIListLayout = ReactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							SortOrder = Enum.SortOrder.LayoutOrder,
							HorizontalAlignment = Enum.HorizontalAlignment.Center
						}),
						ShowLessText = ReactModule.createElement("TextLabel", {
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							Text = UseLocalizationResult and UseLocalizationResult.lessText,
							Font = HeaderFont,
							TextSize = ScaledBaseSize,
							TextColor3 = UseStyleResult.Theme.TextMuted.Color,
							Size = UDim2.new(0, 0, 1, 0),
							AutomaticSize = Enum.AutomaticSize.X
						}, {
							ReactModule.createElement("UIPadding", {
								PaddingRight = UDim.new(0, ConstantsModule.DefaultPadding)
							})
						}),
						CollapseIcon = ReactModule.createElement(ImageSetLabel, {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							BorderSizePixel = 0,
							AnchorPoint = Vector2.new(0.5, 0.5),
							Position = UDim2.fromScale(0.5, 0.5),
							Size = _UDim2,
							Image = IconsActionsTruncationCollapse,
							ImageColor3 = UseStyleResult.Theme.UIEmphasis.Color
						})
					})
				})
			}),
			InvisibleExpandButton = ReactModule.createElement("TextButton", {
				Size = UDim2.new(1, 0, 0, if UseStateResult and UseStateResult3 then UseStateResult1 + ConstantsModule.DefaultPadding * 2 else 0),
				BackgroundTransparency = 1,
				Text = "",
				[ReactModule.Event.Activated] = v34,
				ZIndex = 5,
				BorderSizePixel = 0,
				AutoButtonColor = false
			}),
			NumberMoreButton = if UseStateResult1 == 0 or not UseStateResult or #p1.notifications <= 1 then nil else ReactModule.createElement("Frame", {
				ZIndex = 10,
				BackgroundTransparency = 0,
				Size = UDim2.new(0, 125, 0, ScaledDefaultPadding),
				AutomaticSize = Enum.AutomaticSize.X,
				Position = UDim2.new(0.5, 0, 1, 0),
				AnchorPoint = Vector2.new(0.5, 1),
				BackgroundColor3 = UseStyleResult.Theme.BackgroundContrast.Color
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = _UDim1 }),
				NumberedMoreTextAndIconFrame = ReactModule.createElement("Frame", {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5)
				}, {
					UIListLayout = ReactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						SortOrder = Enum.SortOrder.LayoutOrder,
						HorizontalAlignment = Enum.HorizontalAlignment.Center
					}),
					NumberMoreText = ReactModule.createElement("TextLabel", {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						Text = UseLocalizationResult and (UseLocalizationResult.moreText and string.gsub(UseLocalizationResult.moreText, "{notificationCount}", (tostring(#p1.notifications - 1)))),
						Font = HeaderFont,
						TextSize = ScaledBaseSize,
						TextColor3 = UseStyleResult.Theme.TextMuted.Color,
						Size = UDim2.new(0, 0, 1, 0),
						AutomaticSize = Enum.AutomaticSize.X
					}, {
						ReactModule.createElement("UIPadding", {
							PaddingRight = UDim.new(0, ConstantsModule.DefaultPadding)
						})
					}),
					ExpandIcon = ReactModule.createElement(ImageSetLabel, {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5),
						Size = _UDim2,
						Image = IconsActionsTruncationExpand,
						ImageColor3 = UseStyleResult.Theme.UIEmphasis.Color
					})
				})
			}),
			ListOfNotifications = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 3,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, Elements)
		})
	end, {
		p1.notifications, UseStateResult, UseStateResult1, UseStateResult3,
		p1.impressionsTag, p1.impressionMetadataByNotificationId
	}))
end