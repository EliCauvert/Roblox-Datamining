local streamNotifications = script:FindFirstAncestor("StreamNotifications")
local components = streamNotifications.components
local parent = streamNotifications.Parent
local reactModule = require(parent.React)
local constantsModule = require(streamNotifications.constants)
local reactOtterModule = require(parent.ReactOtter)
local notificationsCommonModule = require(parent.NotificationsCommon)
local streamNotificationAnimationWrapperModule = require(components.StreamNotificationAnimationWrapper)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local notificationHelper = notificationsCommonModule.NotificationHelper
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local truncationExpand = images["icons/actions/truncationExpand"]
local truncationCollapse = images["icons/actions/truncationCollapse"]
local uDim = UDim.new(0, 12)
local uDim_1 = UDim.new(0, 24)
local var1 = constantsModule.DefaultPadding * 4
local uDim2 = UDim2.fromOffset(24, 24)
local eventStream = require(streamNotifications.analytics.analyticsService).EventStream
local analyticsConstantsModule = require(streamNotifications.analytics.analyticsConstants)
local t = { stiffness = 207, damping = 24, mass = 1 }

return function(p1)
	-- upvalues: useStyle (ref), reactModule (ref), reactOtterModule (ref), useLocalization (ref), constantsModule (ref), notificationHelper (ref), eventStream (ref), analyticsConstantsModule (ref), t (ref), streamNotificationAnimationWrapperModule (ref), uDim (ref), uDim_1 (ref), imageSetLabel (ref), uDim2 (ref), truncationCollapse (ref), var1 (ref), truncationExpand (ref)
	local var2 = useStyle()
	local font = var2.Font
	local font_1 = font.Header1.Font
	local var3 = font.BaseSize * font.CaptionHeader.RelativeSize
	local var4, var5 = reactModule.useState(true)
	local var6, var7 = reactModule.useState(74)
	local var8, var9 = reactModule.useState(true)
	local var10, var11 = reactOtterModule.useAnimatedBinding({ shadowHeight = 0, shadowWidth = 1 })
	local var12 = useLocalization({
		moreText = constantsModule.Text.ShowMoreKey,
		lessText = constantsModule.Text.ShowLessKey
	})
	local var13 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var4 (ref), var7 (ref)
		if p2 == 1 and var4 then
			var7(p3)
		end
	end)
	
	local var14 = function(p2)
		local t = {}
		
		for i, v in p2 do
			if v.id then
				table.insert(t, v.id)
			end
		end
		return t
	end
	
	local var15 = function()
		-- upvalues: var5 (ref), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy), p1 (ref), var14 (ref)
		var5(function(p3)
			-- upvalues: notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy), p1 (copy), var14 (copy)
			notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.click, if p3 then analyticsConstantsModule.EventNames.bundleOpened else analyticsConstantsModule.EventNames.bundleClosed, {
				bundleKey = p1.notifications[1].content.bundleKey or nil,
				totalNotifications = #p1.notifications or nil,
				notificationIds = var14(p1.notifications) or nil
			})
			
			if p3 then
				for i, v in p1.notifications do
					notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.seen, analyticsConstantsModule.EventNames.notificationViewed, {
						notificationId = v.id or nil,
						notificationType = v.content.notificationType or nil,
						bundlePosition = i,
						bundleKey = v.content.bundleKey or nil,
						clientEventsPayload = v.content.clientEventsPayload or nil
					})
				end
			end
			return not p3
		end)
	end
	
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), reactOtterModule (copy), var4 (ref), t (copy)
		var11({
			shadowHeight = reactOtterModule.spring(if var4 then 0 else 1, t),
			shadowWidth = reactOtterModule.spring(if var4 then 1 else 0, t)
		})
	end, { var4 })
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), p1 (ref)
		var9(#p1.notifications > 1)
	end, { p1.notifications })
	
	return reactModule.useMemo(function()
		-- upvalues: p1 (ref), var4 (ref), var8 (ref), reactModule (copy), streamNotificationAnimationWrapperModule (copy), var13 (ref), var10 (ref), var6 (ref), constantsModule (copy), var2 (ref), uDim (copy), font_1 (ref), var3 (ref), var15 (ref), uDim_1 (copy), var12 (ref), imageSetLabel (copy), uDim2 (copy), truncationCollapse (copy), var1 (copy), truncationExpand (copy)
		local t = {}
		
		for i, v in ipairs(p1.notifications) do
			local var16 = false
			local var17 = if p1.impressionMetadataByNotificationId then p1.impressionMetadataByNotificationId[v.id] else nil
			
			if var4 and var8 then
				var16 = true
			end
			t[v.id] = reactModule.createElement(streamNotificationAnimationWrapperModule, {
				layoutOrder = i,
				notification = v,
				finishDismissNotification = p1.finishDismissNotification,
				handleActions = p1.handleActions,
				openMetaActions = p1.openMetaActions,
				onHeightChange = var13,
				collapsed = var16,
				impressionsTag = p1.impressionsTag,
				impressionIndex = if var17 then var17.impressionIndex else nil
			})
		end
		t.UIPadding = reactModule.createElement("UIPadding", {
			PaddingTop = if var4 or not var8 then UDim.new(0, 0) else UDim.new(0, 40)
		})
		t.UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		})
		t.Shadow1 = if var4 and var8 then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = var10:map(function(p3)
				-- upvalues: var6 (copy), constantsModule (copy)
				return UDim2.new(1, 0, 0, p3.shadowHeight * var6 + constantsModule.DefaultPadding)
			end),
			LayoutOrder = #p1.notifications + 1,
			ZIndex = -(#p1.notifications + 1)
		}, {
			reactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				Size = var10:map(function(p3)
					-- upvalues: constantsModule (copy), var6 (copy)
					return UDim2.new(1, -(constantsModule.DefaultPadding * 4 * p3.shadowWidth), 0, var6 - constantsModule.DefaultPadding)
				end),
				BackgroundColor3 = var2.Theme.BackgroundDefault.Color,
				Position = UDim2.new(0.5, 0, 0, 0),
				AnchorPoint = Vector2.new(0.5, 0)
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = uDim })
			})
		}) else nil
		t.Shadow2 = if var4 and var8 then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = var10:map(function(p3)
				-- upvalues: var6 (copy), constantsModule (copy)
				return UDim2.new(1, 0, 0, p3.shadowHeight * var6 + constantsModule.DefaultPadding * 2)
			end),
			LayoutOrder = #p1.notifications + 2,
			ZIndex = -(#p1.notifications + 2)
		}, {
			reactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				Size = var10:map(function(p3)
					-- upvalues: constantsModule (copy), var6 (copy)
					return UDim2.new(1, -(constantsModule.DefaultPadding * 6 * p3.shadowWidth), 0, var6 - constantsModule.DefaultPadding)
				end),
				BackgroundColor3 = var2.Theme.BackgroundContrast.Color,
				Position = UDim2.new(0.5, 0, 0, 0),
				AnchorPoint = Vector2.new(0.5, 0)
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = uDim })
			})
		}) else nil
		
		return reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = p1.layoutOrder
		}, {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingBottom = if var4 and var8 then UDim.new(0, constantsModule.DefaultPadding) else UDim.new(0, 0)
			}),
			ShowLessButton = if var4 or not var8 then nil else reactModule.createElement("TextButton", {
				Size = UDim2.new(0, 160, 0, 40),
				Text = "",
				Font = font_1,
				TextSize = var3,
				[reactModule.Event.Activated] = var15,
				BackgroundTransparency = 1,
				BackgroundColor3 = var2.Theme.BackgroundMuted.Color,
				AutoButtonColor = false,
				LayoutOrder = 1,
				ZIndex = 4,
				Position = UDim2.new(1, 0, 0, 0),
				AnchorPoint = Vector2.new(1, 0),
				BorderSizePixel = 0
			}, {
				reactModule.createElement("Frame", {
					BackgroundTransparency = 0,
					ZIndex = 10,
					BorderSizePixel = 0,
					Size = UDim2.new(1, -constantsModule.DefaultPadding, 1, -constantsModule.DefaultPadding),
					BackgroundColor3 = var2.Theme.BackgroundContrast.Color,
					Position = UDim2.new(1, -constantsModule.DefaultPadding, 0, 0),
					AnchorPoint = Vector2.new(1, 0)
				}, {
					UICorner = reactModule.createElement("UICorner", { CornerRadius = uDim_1 }),
					ShowLessTextAndIconFrame = reactModule.createElement("Frame", {
						BorderSizePixel = 0,
						BackgroundTransparency = 1,
						AutomaticSize = Enum.AutomaticSize.XY,
						Position = UDim2.new(0.5, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5)
					}, {
						UIListLayout = reactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							SortOrder = Enum.SortOrder.LayoutOrder,
							HorizontalAlignment = Enum.HorizontalAlignment.Center
						}),
						ShowLessText = reactModule.createElement("TextLabel", {
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							Text = var12 and var12.lessText,
							Font = font_1,
							TextSize = var3,
							TextColor3 = var2.Theme.TextMuted.Color,
							Size = UDim2.new(0, 0, 1, 0),
							AutomaticSize = Enum.AutomaticSize.X
						}, {
							reactModule.createElement("UIPadding", {
								PaddingRight = UDim.new(0, constantsModule.DefaultPadding)
							})
						}),
						CollapseIcon = reactModule.createElement(imageSetLabel, {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							BorderSizePixel = 0,
							AnchorPoint = Vector2.new(0.5, 0.5),
							Position = UDim2.fromScale(0.5, 0.5),
							Size = uDim2,
							Image = truncationCollapse,
							ImageColor3 = var2.Theme.UIEmphasis.Color
						})
					})
				})
			}),
			InvisibleExpandButton = reactModule.createElement("TextButton", {
				Size = UDim2.new(1, 0, 0, if var4 and var8 then var6 + constantsModule.DefaultPadding * 2 else 0),
				BackgroundTransparency = 1,
				Text = "",
				[reactModule.Event.Activated] = var15,
				ZIndex = 5,
				BorderSizePixel = 0,
				AutoButtonColor = false
			}),
			NumberMoreButton = if var6 == 0 or not var4 or #p1.notifications <= 1 then nil else reactModule.createElement("Frame", {
				ZIndex = 10,
				BackgroundTransparency = 0,
				Size = UDim2.new(0, 125, 0, var1),
				AutomaticSize = Enum.AutomaticSize.X,
				Position = UDim2.new(0.5, 0, 1, 0),
				AnchorPoint = Vector2.new(0.5, 1),
				BackgroundColor3 = var2.Theme.BackgroundContrast.Color
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = uDim_1 }),
				NumberedMoreTextAndIconFrame = reactModule.createElement("Frame", {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5)
				}, {
					UIListLayout = reactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						SortOrder = Enum.SortOrder.LayoutOrder,
						HorizontalAlignment = Enum.HorizontalAlignment.Center
					}),
					NumberMoreText = reactModule.createElement("TextLabel", {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						Text = var12 and (var12.moreText and string.gsub(var12.moreText, "{notificationCount}", tostring(#p1.notifications - 1))),
						Font = font_1,
						TextSize = var3,
						TextColor3 = var2.Theme.TextMuted.Color,
						Size = UDim2.new(0, 0, 1, 0),
						AutomaticSize = Enum.AutomaticSize.X
					}, {
						reactModule.createElement("UIPadding", {
							PaddingRight = UDim.new(0, constantsModule.DefaultPadding)
						})
					}),
					ExpandIcon = reactModule.createElement(imageSetLabel, {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5),
						Size = uDim2,
						Image = truncationExpand,
						ImageColor3 = var2.Theme.UIEmphasis.Color
					})
				})
			}),
			ListOfNotifications = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 3,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, t)
		})
	end, {
		p1.notifications, var4, var6, var8, p1.impressionsTag,
		p1.impressionMetadataByNotificationId
	})
end