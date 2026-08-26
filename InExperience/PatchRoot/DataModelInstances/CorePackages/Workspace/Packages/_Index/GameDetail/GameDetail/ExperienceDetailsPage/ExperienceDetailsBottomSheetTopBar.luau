local parent = script:FindFirstAncestor("GameDetail").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local iconButton = foundationModule.IconButton
local iconName = foundationModule.Enums.IconName
local buttonSize = foundationModule.Enums.ButtonSize
local buttonVariant = foundationModule.Enums.ButtonVariant

return function(p1)
	-- upvalues: reactModule (ref), roactNavigationModule (ref), foundationModule (ref), iconButton (ref), iconName (ref), buttonVariant (ref), buttonSize (ref)
	local tokens = p1.tokens
	local navigation = p1.navigation
	local var1, var2 = reactModule.useBinding(0)
	local var3, var4 = reactModule.useBinding(false)
	local var5 = tokens.Padding.Small + tokens.Size.Size_100
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref), var5 (ref)
		local current = p1.sheetContentRef.current
		
		if current then
			local function updateTopBarState()
				-- upvalues: current (ref), p1 (copy), var5 (copy), var2 (copy)
				var2(1 - math.clamp((math.ceil(current.AbsolutePosition.Y) + p1.deviceInsets.top - p1.topBarHeight - var5) / math.max(p1.fullH - p1.briefH, 1), 0, 1))
			end
			
			var2(1 - math.clamp((math.ceil(current.AbsolutePosition.Y) + p1.deviceInsets.top - p1.topBarHeight - var5) / math.max(p1.fullH - p1.briefH, 1), 0, 1))
			local var6 = current:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateTopBarState)
			
			return function()
				-- upvalues: var6 (ref)
				var6:Disconnect()
			end
		end
		var2(0)
	end, {
		p1.overlayFrame, p1.deviceInsets.top, p1.topBarHeight, var5, p1.fullH,
		p1.briefH
	})
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), navigation (ref), roactNavigationModule (copy)
		var4(navigation.isFocused())
		local var6 = navigation.addListener(roactNavigationModule.Events.WillFocus, function()
			-- upvalues: var4 (copy)
			var4(true)
		end)
		local var7 = navigation.addListener(roactNavigationModule.Events.WillBlur, function()
			-- upvalues: var4 (copy)
			var4(false)
		end)
		
		return function()
			-- upvalues: var6 (ref), var7 (ref)
			var6.remove()
			var7.remove()
		end
	end, { navigation })
	
	return reactModule.createElement("ScreenGui", {
		DisplayOrder = 1,
		IgnoreGuiInset = true,
		ClipToDeviceSafeArea = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		ScreenInsets = Enum.ScreenInsets.None,
		Enabled = var3
	}, {
		TopBarCanvasGroup = reactModule.createElement("CanvasGroup", {
			Active = false,
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			ZIndex = 2,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 0, p1.topBarHeight),
			BackgroundColor3 = tokens.Color.Surface.Surface_0.Color3,
			GroupTransparency = if p1.shouldMountAsFullView then 0 else var1:map(function(p2)
				return 1 - p2
			end),
			BorderColor3 = tokens.Color.Common.Shimmer.Color3
		}, {
			TopBarOverlay = reactModule.createElement(foundationModule.View, {
				tag = "row align-y-center size-full",
				padding = {
					top = UDim.new(0, p1.deviceInsets.top),
					left = UDim.new(0, tokens.Padding.Large)
				}
			}, {
				TopBarButton = reactModule.createElement(iconButton, {
					isCircular = true,
					icon = if p1.shouldMountAsFullView then iconName.ChevronLargeLeft else iconName.X,
					variant = buttonVariant.Utility,
					size = buttonSize.Medium,
					onActivated = if p1.shouldMountAsFullView then p1.onBack else p1.onClose
				})
			})
		})
	})
end