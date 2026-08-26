local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local reactModule = require(virtualEvents.Parent.React)
local foundationModule = require(virtualEvents.Parent.Foundation)
local _ = require(virtualEvents.Parent.GraphQLServer)
local useScreenSize = require(virtualEvents.Parent.RobloxAppHooks).useScreenSize
local eventDetailsBodyModule = require(virtualEvents.Components.EventDetailsBody)
local eventActionBarModule = require(virtualEvents.Components.EventActionBar)
local _ = require(virtualEvents.Parent.VirtualEventsState)
local constantsModule = require(virtualEvents.constants)
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), useScreenSize (ref), reactModule (ref), eventDetailsBodyModule (ref), constantsModule (ref), eventActionBarModule (ref)
	local var1 = useTokens()
	local var2 = useScreenSize()
	local experienceDetails = p1.virtualEvent.experienceDetails
	local var3, var4 = reactModule.useState(false)
	local var5, var6 = reactModule.useState(0.99)
	local var7 = reactModule.useRef(0)
	local var8 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), p1 (ref), var6 (ref)
		if not var7.current or not p1.bottomHeight then return end
		if p1.bottomHeight > 0 and p1.bottomHeight < var7.current then
			var6(1 - p1.bottomHeight / var7.current)
		end
	end, { p1.bottomHeight })
	local var9 = reactModule.useCallback(function(p2)
		-- upvalues: var7 (ref), var8 (ref)
		if var7.current and var7.current ~= p2.AbsoluteSize.Y then
			var7.current = p2.AbsoluteSize.Y
			var8()
		end
	end, { var8 })
	reactModule.useEffect(function()
		-- upvalues: var8 (ref)
		var8()
	end, { p1.bottomHeight, var8 })
	
	return reactModule.createElement("TextButton", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Text = "",
		AutoButtonColor = false,
		[reactModule.Event.TouchTap] = function()
			-- upvalues: var4 (ref)
			var4(false)
		end,
		[reactModule.Event.Activated] = function()
			-- upvalues: var4 (ref)
			var4(false)
		end
	}, {
		Scrim = reactModule.createElement("Frame", {
			ZIndex = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = if var3 then var1.Color.Extended.Black.Black_50.Transparency else 1,
			BackgroundColor3 = var1.Color.Extended.Black.Black_50.Color3
		}),
		EventsWithGradientContainer = reactModule.createElement("Frame", {
			ZIndex = 2,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, 0),
			BackgroundTransparency = var1.Color.Extended.White.White_100.Transparency,
			BackgroundColor3 = var1.Color.Extended.White.White_100.Color3,
			BorderSizePixel = 0,
			[reactModule.Change.AbsoluteSize] = var9
		}, {
			Gradient = reactModule.createElement("UIGradient", {
				Rotation = 90,
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, var1.Color.Surface.Surface_100.Color3),
					ColorSequenceKeypoint.new(1, var1.Color.Surface.Surface_100.Color3)
				}),
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(var5, 0),
					NumberSequenceKeypoint.new(1, 0)
				})
			}),
			ContentContainer = reactModule.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				[reactModule.Change.AbsoluteSize] = var9
			}, {
				Padding = reactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 80),
					PaddingLeft = UDim.new(0, 20),
					PaddingRight = UDim.new(0, 20),
					PaddingBottom = UDim.new(0, 20)
				}),
				Layout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					VerticalAlignment = Enum.VerticalAlignment.Bottom,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 16)
				}),
				EventDetailsBody = reactModule.createElement(eventDetailsBodyModule, {
					virtualEvent = p1.virtualEvent,
					eventStatus = p1.eventStatus,
					containerSize = Vector2.new((if p1.isWideMode then constantsModule.CONTAINER_WIDTH else var2.X) - 40, var2.Y),
					isExpanded = var3,
					setIsExpanded = var4
				}),
				Divider = reactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 1),
					BackgroundColor3 = var1.Color.Common.Shimmer.Color3,
					BackgroundTransparency = var1.Color.Common.Shimmer.Transparency
				}),
				EventActionBar = reactModule.createElement(eventActionBarModule, {
					universeId = p1.virtualEvent.universeId,
					experienceName = if experienceDetails then experienceDetails.name else "",
					onExperienceTileActivated = p1.onExperienceTileActivated,
					ctaProps = p1.ctaProps
				})
			})
		})
	})
end