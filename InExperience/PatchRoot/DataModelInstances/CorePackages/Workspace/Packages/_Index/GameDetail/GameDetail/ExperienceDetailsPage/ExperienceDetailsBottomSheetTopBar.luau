local parent = script:FindFirstAncestor("GameDetail").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local iconButton = foundationModule.IconButton
local iconName = foundationModule.Enums.IconName
local buttonSize = foundationModule.Enums.ButtonSize
local buttonVariant = foundationModule.Enums.ButtonVariant

return function(p0) --[[ line: 29 | named "ExperienceDetailsBottomSheetTopBar" ]]
	-- upvalues: reactModule (ref), roactNavigationModule (ref), foundationModule (ref), iconButton (ref), iconName (ref), buttonVariant (ref), buttonSize (ref)
	local tokens = p0.tokens
	local navigation = p0.navigation
	local var3, var4 = reactModule.useBinding(0)
	local var5, var6 = reactModule.useBinding(false)
	local var7 = tokens.Padding.Small + tokens.Size.Size_100
	reactModule.useEffect(function() --[[ line: 39 ]]
		-- upvalues: p0 (ref), var4 (ref), var7 (ref)
		local current = p0.sheetContentRef.current
		
		if current then
			local function updateTopBarState() --[[ line: 46 ]]
				-- upvalues: current (ref), p0 (copy), var7 (copy), var4 (copy)
				var4(1 - math.clamp((math.ceil(current.AbsolutePosition.Y) + p0.deviceInsets.top - p0.topBarHeight - var7) / math.max(p0.fullH - p0.briefH, 1), 0, 1))
			end
			
			var4(1 - math.clamp((math.ceil(current.AbsolutePosition.Y) + p0.deviceInsets.top - p0.topBarHeight - var7) / math.max(p0.fullH - p0.briefH, 1), 0, 1))
			local var9 = current:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateTopBarState)
			
			return function() --[[ line: 60 ]]
				-- upvalues: var9 (ref)
				var9:Disconnect()
			end
		end
		var4(0)
	end, {
		p0.overlayFrame, p0.deviceInsets.top, p0.topBarHeight, var7, p0.fullH,
		p0.briefH
	})
	reactModule.useEffect(function() --[[ line: 67 ]]
		-- upvalues: var6 (ref), navigation (ref), roactNavigationModule (copy)
		var6(navigation.isFocused())
		local var10 = navigation.addListener(roactNavigationModule.Events.WillFocus, function() --[[ line: 70 ]]
			-- upvalues: var6 (copy)
			var6(true)
		end)
		local var11 = navigation.addListener(roactNavigationModule.Events.WillBlur, function() --[[ line: 74 ]]
			-- upvalues: var6 (copy)
			var6(false)
		end)
		
		return function() --[[ line: 78 ]]
			-- upvalues: var10 (ref), var11 (ref)
			var10.remove()
			var11.remove()
		end
	end, { navigation })
	
	return reactModule.createElement("ScreenGui", {
		DisplayOrder = 1,
		IgnoreGuiInset = true,
		ClipToDeviceSafeArea = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		ScreenInsets = Enum.ScreenInsets.None,
		Enabled = var5
	}, {
		TopBarCanvasGroup = reactModule.createElement("CanvasGroup", {
			Active = false,
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			ZIndex = 2,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 0, p0.topBarHeight),
			BackgroundColor3 = tokens.Color.Surface.Surface_0.Color3,
			GroupTransparency = if p0.shouldMountAsFullView then 0 else var3:map(function(p1) --[[ line: 100 ]]
				return 1 - p1
			end),
			BorderColor3 = tokens.Color.Common.Shimmer.Color3
		}, {
			TopBarOverlay = reactModule.createElement(foundationModule.View, {
				tag = "row align-y-center size-full",
				padding = {
					top = UDim.new(0, p0.deviceInsets.top),
					left = UDim.new(0, tokens.Padding.Large)
				}
			}, {
				TopBarButton = reactModule.createElement(iconButton, {
					isCircular = true,
					icon = if p0.shouldMountAsFullView then iconName.ChevronLargeLeft else iconName.X,
					variant = buttonVariant.Utility,
					size = buttonSize.Medium,
					onActivated = if p0.shouldMountAsFullView then p0.onBack else p0.onClose
				})
			})
		})
	})
end