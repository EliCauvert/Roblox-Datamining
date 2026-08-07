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

return function(p0) --[[ line: 31 | named "EventDetailsContainer" ]]
	-- upvalues: useTokens (ref), useScreenSize (ref), reactModule (ref), eventDetailsBodyModule (ref), constantsModule (ref), eventActionBarModule (ref)
	local var6 = useTokens()
	local var7 = useScreenSize()
	local experienceDetails = p0.virtualEvent.experienceDetails
	local var8, var9 = reactModule.useState(false)
	local var10, var11 = reactModule.useState(0.99)
	local var12 = reactModule.useRef(0)
	local var13 = reactModule.useCallback(function() --[[ line: 40 ]]
		-- upvalues: var12 (ref), p0 (ref), var11 (ref)
		if not var12.current or not p0.bottomHeight then return end
		if p0.bottomHeight > 0 and p0.bottomHeight < var12.current then
			var11(1 - p0.bottomHeight / var12.current)
		end
	end, { p0.bottomHeight })
	local var14 = reactModule.useCallback(function(p1) --[[ line: 49 ]]
		-- upvalues: var12 (ref), var13 (ref)
		if var12.current and var12.current ~= p1.AbsoluteSize.Y then
			var12.current = p1.AbsoluteSize.Y
			var13()
		end
	end, { var13 })
	reactModule.useEffect(function() --[[ line: 56 ]]
		-- upvalues: var13 (ref)
		var13()
	end, { p0.bottomHeight, var13 })
	
	return reactModule.createElement("TextButton", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Text = "",
		AutoButtonColor = false,
		[reactModule.Event.TouchTap] = function() --[[ line: 66 ]]
			-- upvalues: var9 (ref)
			var9(false)
		end,
		[reactModule.Event.Activated] = function() --[[ line: 69 ]]
			-- upvalues: var9 (ref)
			var9(false)
		end
	}, {
		Scrim = reactModule.createElement("Frame", {
			ZIndex = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = if var8 then var6.Color.Extended.Black.Black_50.Transparency else 1,
			BackgroundColor3 = var6.Color.Extended.Black.Black_50.Color3
		}),
		EventsWithGradientContainer = reactModule.createElement("Frame", {
			ZIndex = 2,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, 0),
			BackgroundTransparency = var6.Color.Extended.White.White_100.Transparency,
			BackgroundColor3 = var6.Color.Extended.White.White_100.Color3,
			BorderSizePixel = 0,
			[reactModule.Change.AbsoluteSize] = var14
		}, {
			Gradient = reactModule.createElement("UIGradient", {
				Rotation = 90,
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, var6.Color.Surface.Surface_100.Color3),
					ColorSequenceKeypoint.new(1, var6.Color.Surface.Surface_100.Color3)
				}),
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(var10, 0),
					NumberSequenceKeypoint.new(1, 0)
				})
			}),
			ContentContainer = reactModule.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				[reactModule.Change.AbsoluteSize] = var14
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
					virtualEvent = p0.virtualEvent,
					eventStatus = p0.eventStatus,
					containerSize = Vector2.new((if p0.isWideMode then constantsModule.CONTAINER_WIDTH else var7.X) - 40, var7.Y),
					isExpanded = var8,
					setIsExpanded = var9
				}),
				Divider = reactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 1),
					BackgroundColor3 = var6.Color.Common.Shimmer.Color3,
					BackgroundTransparency = var6.Color.Common.Shimmer.Transparency
				}),
				EventActionBar = reactModule.createElement(eventActionBarModule, {
					universeId = p0.virtualEvent.universeId,
					experienceName = if experienceDetails then experienceDetails.name else "",
					onExperienceTileActivated = p0.onExperienceTileActivated,
					ctaProps = p0.ctaProps
				})
			})
		})
	})
end