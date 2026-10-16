local CoreGui = game:GetService("CoreGui")
local StreamNotifications = script:FindFirstAncestor("StreamNotifications")
local Parent = StreamNotifications.Parent
local CurrentCamera = workspace.CurrentCamera
local ConstantsModule = require(StreamNotifications.constants)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceWrapper = FocusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local _ = require(Parent.ReactFocusNavigation)
local InputHandlersModule = require(Parent.InputHandlers)
local Components = StreamNotifications.components
local StreamNotificationsHeaderModule = require(Components.StreamNotificationsHeader)
local StreamNotificationsContentModule = require(Components.StreamNotificationsContent)
local EventStream = require(StreamNotifications.analytics.analyticsService).EventStream
local NotificationHelper = require(Parent.NotificationsCommon).NotificationHelper
local AnalyticsConstantsModule = require(StreamNotifications.analytics.analyticsConstants)
local FFlagLuaAppSupportDeviceSafeInsets = require(Parent.SharedFlags).FFlagLuaAppSupportDeviceSafeInsets
local StreamNotificationDropdownExperimentationModule = require(StreamNotifications.StreamNotificationDropdownExperimentation)

local function _(p1): number --[[ Line: 36 | Named "calculateDropdownHeight" ]]
	-- upvalues: ConstantsModule (copy)
	return (math.min(ConstantsModule.Dropdown.MaxHeight, (math.max(p1 - ConstantsModule.Dropdown.VerticalMargin, ConstantsModule.Dropdown.MinHeight))))
end

return function(p1) --[[ Line: 43 ]]
	-- upvalues: UseStyleFunction (copy), StreamNotificationDropdownExperimentationModule (copy), ReactModule (copy), CurrentCamera (copy), ConstantsModule (copy), InputHandlersModule (copy), NotificationHelper (copy), EventStream (copy), AnalyticsConstantsModule (copy), StreamNotificationsHeaderModule (copy), StreamNotificationsContentModule (copy), ReactRobloxModule (copy), FFlagLuaAppSupportDeviceSafeInsets (copy), FocusNavigableSurfaceWrapper (copy), FocusNavigableSurfaceIdentifierEnum (copy), FocusNavigationEventNameEnum (copy), CoreGui (copy)
	local UseStyleResult = UseStyleFunction()
	local DropdownEnabled = StreamNotificationDropdownExperimentationModule.getDropdownEnabled()
	local UseStateResult, UseStateResult2 = ReactModule.useState(if DropdownEnabled then math.min(ConstantsModule.Dropdown.MaxHeight, (math.max(CurrentCamera.ViewportSize.Y - ConstantsModule.Dropdown.VerticalMargin, ConstantsModule.Dropdown.MinHeight))) else 0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(CurrentCamera.ViewportSize.X < ConstantsModule.Modal.WidthLimit)
	ReactModule.useEffect(function() --[[ Line: 56 ]]
		-- upvalues: DropdownEnabled (copy), UseStateResult2 (copy), CurrentCamera (upval), ConstantsModule (upval), UseStateResult2_1 (copy)
		if DropdownEnabled then
			UseStateResult2((math.min(ConstantsModule.Dropdown.MaxHeight, (math.max(CurrentCamera.ViewportSize.Y - ConstantsModule.Dropdown.VerticalMargin, ConstantsModule.Dropdown.MinHeight)))))
		end
		local Connection = CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 60 ]]
			-- upvalues: DropdownEnabled (upval), UseStateResult2 (upval), CurrentCamera (upval), ConstantsModule (upval), UseStateResult2_1 (upval)
			if DropdownEnabled then
				UseStateResult2((math.min(ConstantsModule.Dropdown.MaxHeight, (math.max(CurrentCamera.ViewportSize.Y - ConstantsModule.Dropdown.VerticalMargin, ConstantsModule.Dropdown.MinHeight)))))
			end
			if CurrentCamera.ViewportSize.X < ConstantsModule.Modal.WidthLimit then
				UseStateResult2_1(true)
				
				return
			else
				UseStateResult2_1(false)
			end
		end)
		
		return function() --[[ Line: 70 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { DropdownEnabled })
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(true)
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 76 ]]
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(p2)
	end)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(true)
	local UseRefResult = ReactModule.useRef(nil)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 83 ]]
		-- upvalues: InputHandlersModule (upval), p1 (copy), NotificationHelper (upval), EventStream (upval), AnalyticsConstantsModule (upval)
		return InputHandlersModule.onRelease(function(p2) --[[ Line: 84 ]]
			-- upvalues: p1 (upval), NotificationHelper (upval), EventStream (upval), AnalyticsConstantsModule (upval)
			p1.displayStream(false)
			NotificationHelper.fireEvent(EventStream, AnalyticsConstantsModule.Context.click, AnalyticsConstantsModule.EventNames.closeContent, {
				closeMethod = AnalyticsConstantsModule.CloseMethod.focusNavigationBack
			})
			p2:cancel()
		end)
	end, { p1.displayStream })
	
	return if DropdownEnabled then ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Size = UDim2.new(0, ConstantsModule.Dropdown.Width, 0, UseStateResult)
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, ConstantsModule.Dropdown.PaddingTop),
			PaddingBottom = UDim.new(0, ConstantsModule.Dropdown.PaddingBottom),
			PaddingLeft = UDim.new(0, ConstantsModule.Dropdown.HorizontalPadding),
			PaddingRight = UDim.new(0, ConstantsModule.Dropdown.HorizontalPadding - ConstantsModule.Dropdown.ScrollBarThickness)
		}),
		UIListLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, ConstantsModule.Dropdown.HeaderBodyGap)
		}),
		Header = ReactModule.createElement(StreamNotificationsHeaderModule, { isSmallScreen = false, displayStream = p1.displayStream }),
		StreamNotificationsContent = ReactModule.createElement(StreamNotificationsContentModule, {
			isSmallScreen = false,
			showOverlay = function() --[[ Line: 126 ]] end,
			displayStream = p1.displayStream,
			setDisplayScreenGuiEnabled = function() --[[ Line: 129 ]] end,
			dropdownHeight = UseStateResult
		})
	}) else ReactRobloxModule.createPortal({
		ScreenGui = ReactModule.createElement("ScreenGui", {
			DisplayOrder = 10,
			IgnoreGuiInset = true,
			Enabled = UseStateResult4,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			ScreenInsets = if FFlagLuaAppSupportDeviceSafeInsets then Enum.ScreenInsets.None else nil
		}, {
			ReactModule.createElement(FocusNavigableSurfaceWrapper, {
				isIsolated = true,
				surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
				frameProps = { ref = UseRefResult },
				customEventHandlers = {
					[FocusNavigationEventNameEnum.NavigateBack] = { handler = UseMemoResult }
				}
			}, {
				TextButtonOverlayBackground = ReactModule.createElement("TextButton", {
					ref = UseRefResult,
					Selectable = false,
					Size = UDim2.new(1, 0, 1, 0),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundTransparency = if UseStateResult3 then UseStyleResult.Theme.Overlay.Transparency else 1,
					BackgroundColor3 = UseStyleResult.Theme.Overlay.Color,
					AutoButtonColor = false,
					BorderSizePixel = 0,
					Text = "",
					[ReactModule.Event.Activated] = function() --[[ Line: 147 ]]
						-- upvalues: p1 (copy), NotificationHelper (upval), EventStream (upval), AnalyticsConstantsModule (upval)
						p1.displayStream(false)
						NotificationHelper.fireEvent(EventStream, AnalyticsConstantsModule.Context.click, AnalyticsConstantsModule.EventNames.closeContent, {
							closeMethod = AnalyticsConstantsModule.CloseMethod.backgroundOverlay
						})
					end
				}, {
					StreamNotificationsFrame = ReactModule.createElement("TextButton", {
						AutoButtonColor = false,
						BorderSizePixel = 0,
						Text = "",
						Selectable = false,
						Size = if UseStateResult1 then UDim2.new(1, 0, 1, 0) else UDim2.new(0, ConstantsModule.Modal.Width, 0, ConstantsModule.Modal.Height),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
						BackgroundTransparency = UseStyleResult.Theme.BackgroundDefault.Transparency
					}, {
						UICorner = ReactModule.createElement("UICorner", {
							CornerRadius = if UseStateResult1 then UDim.new(0, 0) else UDim.new(0, ConstantsModule.Modal.CornerRadius)
						}),
						Header = ReactModule.createElement(StreamNotificationsHeaderModule, {
							isSmallScreen = UseStateResult1,
							displayStream = p1.displayStream
						}),
						StreamNotificationsContent = ReactModule.createElement(StreamNotificationsContentModule, {
							showOverlay = UseResult,
							isSmallScreen = UseStateResult1,
							displayStream = p1.displayStream,
							setDisplayScreenGuiEnabled = UseStateResult2_3
						})
					})
				})
			})
		})
	}, CoreGui)
end