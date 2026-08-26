local coreGuiService = game:GetService("CoreGui")
local streamNotifications = script:FindFirstAncestor("StreamNotifications")
local parent = streamNotifications.Parent
local currentCamera = workspace.CurrentCamera
local constantsModule = require(streamNotifications.constants)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceWrapper = focusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local _ = require(parent.ReactFocusNavigation)
local inputHandlersModule = require(parent.InputHandlers)
local components = streamNotifications.components
local streamNotificationsHeaderModule = require(components.StreamNotificationsHeader)
local streamNotificationsContentModule = require(components.StreamNotificationsContent)
local eventStream = require(streamNotifications.analytics.analyticsService).EventStream
local notificationHelper = require(parent.NotificationsCommon).NotificationHelper
local analyticsConstantsModule = require(streamNotifications.analytics.analyticsConstants)
local fFlagLuaAppSupportDeviceSafeInsets = require(parent.SharedFlags).FFlagLuaAppSupportDeviceSafeInsets
local streamNotificationDropdownExperimentationModule = require(streamNotifications.StreamNotificationDropdownExperimentation)

local function _(p1)
	-- upvalues: constantsModule (ref)
	return math.min(constantsModule.Dropdown.MaxHeight, math.max(p1 - constantsModule.Dropdown.VerticalMargin, constantsModule.Dropdown.MinHeight))
end

return function(p1)
	-- upvalues: useStyle (ref), streamNotificationDropdownExperimentationModule (ref), reactModule (ref), currentCamera (ref), constantsModule (ref), inputHandlersModule (ref), notificationHelper (ref), eventStream (ref), analyticsConstantsModule (ref), streamNotificationsHeaderModule (ref), streamNotificationsContentModule (ref), reactRobloxModule (ref), fFlagLuaAppSupportDeviceSafeInsets (ref), focusNavigableSurfaceWrapper (ref), focusNavigableSurfaceIdentifierEnum (ref), focusNavigationEventNameEnum (ref), coreGuiService (ref)
	local var1 = useStyle()
	local dropdownEnabled = streamNotificationDropdownExperimentationModule.getDropdownEnabled()
	local var2, var3 = reactModule.useState(if dropdownEnabled then math.min(constantsModule.Dropdown.MaxHeight, math.max(currentCamera.ViewportSize.Y - constantsModule.Dropdown.VerticalMargin, constantsModule.Dropdown.MinHeight)) else 0)
	local var4, var5 = reactModule.useState(currentCamera.ViewportSize.X < constantsModule.Modal.WidthLimit)
	reactModule.useEffect(function()
		-- upvalues: dropdownEnabled (ref), var3 (ref), currentCamera (copy), constantsModule (copy), var5 (ref)
		if dropdownEnabled then
			var3(math.min(constantsModule.Dropdown.MaxHeight, math.max(currentCamera.ViewportSize.Y - constantsModule.Dropdown.VerticalMargin, constantsModule.Dropdown.MinHeight)))
		end
		local var6 = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
			-- upvalues: dropdownEnabled (copy), var3 (copy), currentCamera (copy), constantsModule (copy), var5 (copy)
			if dropdownEnabled then
				var3(math.min(constantsModule.Dropdown.MaxHeight, math.max(currentCamera.ViewportSize.Y - constantsModule.Dropdown.VerticalMargin, constantsModule.Dropdown.MinHeight)))
			end
			if currentCamera.ViewportSize.X < constantsModule.Modal.WidthLimit then
				var5(true)
				
				return
			end
			var5(false)
		end)
		
		return function()
			-- upvalues: var6 (ref)
			var6:Disconnect()
		end
	end, { dropdownEnabled })
	local var6, var7 = reactModule.useState(true)
	local var8 = reactModule.useCallback(function(p2)
		-- upvalues: var7 (ref)
		var7(p2)
	end)
	local var9, var10 = reactModule.useState(true)
	local var11 = reactModule.useRef(nil)
	
	return if dropdownEnabled then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Size = UDim2.new(0, constantsModule.Dropdown.Width, 0, var2)
	}, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, constantsModule.Dropdown.PaddingTop),
			PaddingBottom = UDim.new(0, constantsModule.Dropdown.PaddingBottom),
			PaddingLeft = UDim.new(0, constantsModule.Dropdown.HorizontalPadding),
			PaddingRight = UDim.new(0, constantsModule.Dropdown.HorizontalPadding - constantsModule.Dropdown.ScrollBarThickness)
		}),
		UIListLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, constantsModule.Dropdown.HeaderBodyGap)
		}),
		Header = reactModule.createElement(streamNotificationsHeaderModule, { isSmallScreen = false, displayStream = p1.displayStream }),
		StreamNotificationsContent = reactModule.createElement(streamNotificationsContentModule, {
			isSmallScreen = false,
			showOverlay = function() end,
			displayStream = p1.displayStream,
			setDisplayScreenGuiEnabled = function() end,
			dropdownHeight = var2
		})
	}) else reactRobloxModule.createPortal({
		ScreenGui = reactModule.createElement("ScreenGui", {
			DisplayOrder = 10,
			IgnoreGuiInset = true,
			Enabled = var9,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			ScreenInsets = if fFlagLuaAppSupportDeviceSafeInsets then Enum.ScreenInsets.None else nil
		}, {
			reactModule.createElement(focusNavigableSurfaceWrapper, {
				isIsolated = true,
				surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
				frameProps = { ref = var11 },
				customEventHandlers = {
					[focusNavigationEventNameEnum.NavigateBack] = {
						handler = reactModule.useMemo(function()
							-- upvalues: inputHandlersModule (copy), p1 (ref), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy)
							return inputHandlersModule.onRelease(function(p2)
								-- upvalues: p1 (copy), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy)
								p1.displayStream(false)
								notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.click, analyticsConstantsModule.EventNames.closeContent, {
									closeMethod = analyticsConstantsModule.CloseMethod.focusNavigationBack
								})
								p2:cancel()
							end)
						end, { p1.displayStream })
					}
				}
			}, {
				TextButtonOverlayBackground = reactModule.createElement("TextButton", {
					ref = var11,
					Selectable = false,
					Size = UDim2.new(1, 0, 1, 0),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundTransparency = if var6 then var1.Theme.Overlay.Transparency else 1,
					BackgroundColor3 = var1.Theme.Overlay.Color,
					AutoButtonColor = false,
					BorderSizePixel = 0,
					Text = "",
					[reactModule.Event.Activated] = function()
						-- upvalues: p1 (ref), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy)
						p1.displayStream(false)
						notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.click, analyticsConstantsModule.EventNames.closeContent, {
							closeMethod = analyticsConstantsModule.CloseMethod.backgroundOverlay
						})
					end
				}, {
					StreamNotificationsFrame = reactModule.createElement("TextButton", {
						AutoButtonColor = false,
						BorderSizePixel = 0,
						Text = "",
						Selectable = false,
						Size = if var4 then UDim2.new(1, 0, 1, 0) else UDim2.new(0, constantsModule.Modal.Width, 0, constantsModule.Modal.Height),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundColor3 = var1.Theme.BackgroundDefault.Color,
						BackgroundTransparency = var1.Theme.BackgroundDefault.Transparency
					}, {
						UICorner = reactModule.createElement("UICorner", {
							CornerRadius = if not var4 then UDim.new(0, constantsModule.Modal.CornerRadius) else UDim.new(0, 0)
						}),
						Header = reactModule.createElement(streamNotificationsHeaderModule, { isSmallScreen = var4, displayStream = p1.displayStream }),
						StreamNotificationsContent = reactModule.createElement(streamNotificationsContentModule, {
							showOverlay = var8,
							isSmallScreen = var4,
							displayStream = p1.displayStream,
							setDisplayScreenGuiEnabled = var10
						})
					})
				})
			})
		})
	}, coreGuiService)
end