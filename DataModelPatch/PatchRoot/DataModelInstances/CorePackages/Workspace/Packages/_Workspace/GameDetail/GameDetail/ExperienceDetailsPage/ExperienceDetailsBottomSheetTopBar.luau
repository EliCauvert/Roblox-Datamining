local Parent = script:FindFirstAncestor("GameDetail").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local IconButton = FoundationModule.IconButton
local IconName = FoundationModule.Enums.IconName
local ButtonSize = FoundationModule.Enums.ButtonSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant

return function(p1)
	-- upvalues: ReactModule (copy), RoactNavigationModule (copy), FoundationModule (copy), IconButton (copy), IconName (copy), ButtonVariant (copy), ButtonSize (copy)
	local Tokens = p1.tokens
	local Navigation = p1.navigation
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(false)
	local NewSmall = Tokens.Padding.Small + Tokens.Size.Size_100
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseBindingResult2 (copy), NewSmall (copy)
		local Current = p1.sheetContentRef.current
		
		if not Current then
			UseBindingResult2(0)
			
			return
		end
		local function updateTopBarState()
			-- upvalues: Current (copy), p1 (upval), NewSmall (upval), UseBindingResult2 (upval)
			UseBindingResult2(1 - math.clamp((math.ceil(Current.AbsolutePosition.Y) + p1.deviceInsets.top - p1.topBarHeight - NewSmall) / math.max(p1.fullH - p1.briefH, 1), 0, 1))
		end
		
		UseBindingResult2(1 - math.clamp((math.ceil(Current.AbsolutePosition.Y) + p1.deviceInsets.top - p1.topBarHeight - NewSmall) / math.max(p1.fullH - p1.briefH, 1), 0, 1))
		local Connection = Current:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateTopBarState)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {
		p1.overlayFrame, p1.deviceInsets.top, p1.topBarHeight, NewSmall, p1.fullH,
		p1.briefH
	})
	ReactModule.useEffect(function()
		-- upvalues: UseBindingResult2_1 (copy), Navigation (copy), RoactNavigationModule (upval)
		UseBindingResult2_1(Navigation.isFocused())
		local AddListenerResult = Navigation.addListener(RoactNavigationModule.Events.WillFocus, function()
			-- upvalues: UseBindingResult2_1 (upval)
			UseBindingResult2_1(true)
		end)
		local AddListenerResult1 = Navigation.addListener(RoactNavigationModule.Events.WillBlur, function()
			-- upvalues: UseBindingResult2_1 (upval)
			UseBindingResult2_1(false)
		end)
		
		return function()
			-- upvalues: AddListenerResult (copy), AddListenerResult1 (copy)
			AddListenerResult.remove()
			AddListenerResult1.remove()
		end
	end, { Navigation })
	
	return ReactModule.createElement("ScreenGui", {
		DisplayOrder = 1,
		IgnoreGuiInset = true,
		ClipToDeviceSafeArea = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		ScreenInsets = Enum.ScreenInsets.None,
		Enabled = UseBindingResult1
	}, {
		TopBarCanvasGroup = ReactModule.createElement("CanvasGroup", {
			Active = false,
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			ZIndex = 2,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 0, p1.topBarHeight),
			BackgroundColor3 = Tokens.Color.Surface.Surface_0.Color3,
			GroupTransparency = if p1.shouldMountAsFullView then 0 else UseBindingResult:map(function(p2: number): number
				return 1 - p2
			end),
			BorderColor3 = Tokens.Color.Common.Shimmer.Color3
		}, {
			TopBarOverlay = ReactModule.createElement(FoundationModule.View, {
				tag = "row align-y-center size-full",
				padding = {
					top = UDim.new(0, p1.deviceInsets.top),
					left = UDim.new(0, Tokens.Padding.Large)
				}
			}, {
				TopBarButton = ReactModule.createElement(IconButton, {
					isCircular = true,
					icon = if p1.shouldMountAsFullView then IconName.ChevronLargeLeft else IconName.X,
					variant = ButtonVariant.Utility,
					size = ButtonSize.Medium,
					onActivated = if p1.shouldMountAsFullView then p1.onBack else p1.onClose
				})
			})
		})
	})
end