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
local var9 = constantsModule.DefaultPadding * 4
local uDim2 = UDim2.fromOffset(24, 24)
local eventStream = require(streamNotifications.analytics.analyticsService).EventStream
local analyticsConstantsModule = require(streamNotifications.analytics.analyticsConstants)
local t = { stiffness = 207, damping = 24, mass = 1 }

return function(p0) --[[ line: 54 ]]
	-- upvalues: useStyle (ref), reactModule (ref), reactOtterModule (ref), useLocalization (ref), constantsModule (ref), notificationHelper (ref), eventStream (ref), analyticsConstantsModule (ref), t (ref), streamNotificationAnimationWrapperModule (ref), uDim (ref), uDim_1 (ref), imageSetLabel (ref), uDim2 (ref), truncationCollapse (ref), var9 (ref), truncationExpand (ref)
	local var13 = useStyle()
	local font = var13.Font
	local font_1 = font.Header1.Font
	local var14 = font.BaseSize * font.CaptionHeader.RelativeSize
	local var15, var16 = reactModule.useState(true)
	local var17, var18 = reactModule.useState(74)
	local var19, var20 = reactModule.useState(true)
	local var21, var22 = reactOtterModule.useAnimatedBinding({ shadowHeight = 0, shadowWidth = 1 })
	local var23 = useLocalization({
		moreText = constantsModule.Text.ShowMoreKey,
		lessText = constantsModule.Text.ShowLessKey
	})
	local var24 = reactModule.useCallback(function(p1, p2) --[[ line: 77 ]]
		-- upvalues: var15 (ref), var18 (ref)
		if p1 == 1 and var15 then
			var18(p2)
		end
	end)
	
	local var25 = function(p3) --[[ line: 83 ]]
		local t = {}
		
		for i, v in p3 do
			if v.id then
				table.insert(t, v.id)
			end
		end
		return t
	end
	
	local var26 = function() --[[ line: 93 ]]
		-- upvalues: var16 (ref), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy), p0 (ref), var25 (ref)
		var16(function(p4) --[[ line: 94 ]]
			-- upvalues: notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy), p0 (copy), var25 (copy)
			notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.click, if p4 then analyticsConstantsModule.EventNames.bundleOpened else analyticsConstantsModule.EventNames.bundleClosed, {
				bundleKey = p0.notifications[1].content.bundleKey or nil,
				totalNotifications = #p0.notifications or nil,
				notificationIds = var25(p0.notifications) or nil
			})
			
			if p4 then
				for i, v in p0.notifications do
					notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.seen, analyticsConstantsModule.EventNames.notificationViewed, {
						notificationId = v.id or nil,
						notificationType = v.content.notificationType or nil,
						bundlePosition = i,
						bundleKey = v.content.bundleKey or nil,
						clientEventsPayload = v.content.clientEventsPayload or nil
					})
				end
			end
			return not p4
		end)
	end
	
	reactModule.useEffect(function() --[[ line: 132 ]]
		-- upvalues: var22 (ref), reactOtterModule (copy), var15 (ref), t (copy)
		var22({
			shadowHeight = reactOtterModule.spring(if var15 then 0 else 1, t),
			shadowWidth = reactOtterModule.spring(if var15 then 1 else 0, t)
		})
	end, { var15 })
	reactModule.useEffect(function() --[[ line: 140 ]]
		-- upvalues: var20 (ref), p0 (ref)
		var20(#p0.notifications > 1)
	end, { p0.notifications })
	
	return reactModule.useMemo(function() --[[ line: 145 ]]
		-- upvalues: p0 (ref), var15 (ref), var19 (ref), reactModule (copy), streamNotificationAnimationWrapperModule (copy), var24 (ref), var21 (ref), var17 (ref), constantsModule (copy), var13 (ref), uDim (copy), font_1 (ref), var14 (ref), var26 (ref), uDim_1 (copy), var23 (ref), imageSetLabel (copy), uDim2 (copy), truncationCollapse (copy), var9 (copy), truncationExpand (copy)
		local t = {}
		
		for i, v in ipairs(p0.notifications) do
			local var29 = false
			local var30 = if p0.impressionMetadataByNotificationId then p0.impressionMetadataByNotificationId[v.id] else nil
			
			if var15 and var19 then
				var29 = true
			end
			t[v.id] = reactModule.createElement(streamNotificationAnimationWrapperModule, {
				layoutOrder = i,
				notification = v,
				finishDismissNotification = p0.finishDismissNotification,
				handleActions = p0.handleActions,
				openMetaActions = p0.openMetaActions,
				onHeightChange = var24,
				collapsed = var29,
				impressionsTag = p0.impressionsTag,
				impressionIndex = if var30 then var30.impressionIndex else nil
			})
		end
		t.UIPadding = reactModule.createElement("UIPadding", {
			PaddingTop = if var15 or not var19 then UDim.new(0, 0) else UDim.new(0, 40)
		})
		t.UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		})
		t.Shadow1 = if var15 and var19 then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = var21:map(function(p5) --[[ line: 185 ]]
				-- upvalues: var17 (copy), constantsModule (copy)
				return UDim2.new(1, 0, 0, p5.shadowHeight * var17 + constantsModule.DefaultPadding)
			end),
			LayoutOrder = #p0.notifications + 1,
			ZIndex = -(#p0.notifications + 1)
		}, {
			reactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				Size = var21:map(function(p6) --[[ line: 194 ]]
					-- upvalues: constantsModule (copy), var17 (copy)
					return UDim2.new(1, -(constantsModule.DefaultPadding * 4 * p6.shadowWidth), 0, var17 - constantsModule.DefaultPadding)
				end),
				BackgroundColor3 = var13.Theme.BackgroundDefault.Color,
				Position = UDim2.new(0.5, 0, 0, 0),
				AnchorPoint = Vector2.new(0.5, 0)
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = uDim })
			})
		}) else nil
		t.Shadow2 = if var15 and var19 then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = var21:map(function(p7) --[[ line: 219 ]]
				-- upvalues: var17 (copy), constantsModule (copy)
				return UDim2.new(1, 0, 0, p7.shadowHeight * var17 + constantsModule.DefaultPadding * 2)
			end),
			LayoutOrder = #p0.notifications + 2,
			ZIndex = -(#p0.notifications + 2)
		}, {
			reactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				Size = var21:map(function(p8) --[[ line: 228 ]]
					-- upvalues: constantsModule (copy), var17 (copy)
					return UDim2.new(1, -(constantsModule.DefaultPadding * 6 * p8.shadowWidth), 0, var17 - constantsModule.DefaultPadding)
				end),
				BackgroundColor3 = var13.Theme.BackgroundContrast.Color,
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
			LayoutOrder = p0.layoutOrder
		}, {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingBottom = if var15 and var19 then UDim.new(0, constantsModule.DefaultPadding) else UDim.new(0, 0)
			}),
			ShowLessButton = if var15 or not var19 then nil else reactModule.createElement("TextButton", {
				Size = UDim2.new(0, 160, 0, 40),
				Text = "",
				Font = font_1,
				TextSize = var14,
				[reactModule.Event.Activated] = var26,
				BackgroundTransparency = 1,
				BackgroundColor3 = var13.Theme.BackgroundMuted.Color,
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
					BackgroundColor3 = var13.Theme.BackgroundContrast.Color,
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
							Text = var23 and var23.lessText,
							Font = font_1,
							TextSize = var14,
							TextColor3 = var13.Theme.TextMuted.Color,
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
							ImageColor3 = var13.Theme.UIEmphasis.Color
						})
					})
				})
			}),
			InvisibleExpandButton = reactModule.createElement("TextButton", {
				Size = UDim2.new(1, 0, 0, if var15 and var19 then var17 + constantsModule.DefaultPadding * 2 else 0),
				BackgroundTransparency = 1,
				Text = "",
				[reactModule.Event.Activated] = var26,
				ZIndex = 5,
				BorderSizePixel = 0,
				AutoButtonColor = false
			}),
			NumberMoreButton = if var17 == 0 or not var15 or #p0.notifications <= 1 then nil else reactModule.createElement("Frame", {
				ZIndex = 10,
				BackgroundTransparency = 0,
				Size = UDim2.new(0, 125, 0, var9),
				AutomaticSize = Enum.AutomaticSize.X,
				Position = UDim2.new(0.5, 0, 1, 0),
				AnchorPoint = Vector2.new(0.5, 1),
				BackgroundColor3 = var13.Theme.BackgroundContrast.Color
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
						Text = var23 and (var23.moreText and string.gsub(var23.moreText, "{notificationCount}", tostring(#p0.notifications - 1))),
						Font = font_1,
						TextSize = var14,
						TextColor3 = var13.Theme.TextMuted.Color,
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
						ImageColor3 = var13.Theme.UIEmphasis.Color
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
		p0.notifications, var15, var17, var19, p0.impressionsTag,
		p0.impressionMetadataByNotificationId
	})
end