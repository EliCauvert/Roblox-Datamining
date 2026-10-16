local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local ReactModule = require(VirtualEvents.Parent.React)
local _ = require(VirtualEvents.Parent.GraphQLServer)
local UseScreenSizeFunction = require(VirtualEvents.Parent.RobloxAppHooks).useScreenSize
local EventDetailsBodyModule = require(VirtualEvents.Components.EventDetailsBody)
local EventActionBarModule = require(VirtualEvents.Components.EventActionBar)
local _ = require(VirtualEvents.Parent.VirtualEventsState)
local ConstantsModule = require(VirtualEvents.constants)
local UseTokensFunction = require(VirtualEvents.Parent.Foundation).Hooks.useTokens

return function(p1) --[[ Line: 31 | Named "EventDetailsContainer" ]]
	-- upvalues: UseTokensFunction (copy), UseScreenSizeFunction (copy), ReactModule (copy), EventDetailsBodyModule (copy), ConstantsModule (copy), EventActionBarModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseScreenSizeResult = UseScreenSizeFunction()
	local ExperienceDetails = p1.virtualEvent.experienceDetails
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0.99)
	local UseRefResult = ReactModule.useRef(0)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 40 ]]
		-- upvalues: UseRefResult (copy), p1 (copy), UseStateResult2_1 (copy)
		if not UseRefResult.current or not p1.bottomHeight then return end
		if p1.bottomHeight > 0 and p1.bottomHeight < UseRefResult.current then
			UseStateResult2_1(1 - p1.bottomHeight / UseRefResult.current)
		end
	end, { p1.bottomHeight })
	local UseResult1 = ReactModule.useCallback(function(Frame: Frame) --[[ Line: 49 ]]
		-- upvalues: UseRefResult (copy), UseResult (copy)
		if UseRefResult.current and UseRefResult.current ~= Frame.AbsoluteSize.Y then
			UseRefResult.current = Frame.AbsoluteSize.Y
			UseResult()
		end
	end, { UseResult })
	ReactModule.useEffect(function() --[[ Line: 56 ]]
		-- upvalues: UseResult (copy)
		UseResult()
	end, { p1.bottomHeight, UseResult })
	
	return ReactModule.createElement("TextButton", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Text = "",
		AutoButtonColor = false,
		[ReactModule.Event.TouchTap] = function() --[[ Line: 66 ]]
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(false)
		end,
		[ReactModule.Event.Activated] = function() --[[ Line: 69 ]]
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(false)
		end
	}, {
		Scrim = ReactModule.createElement("Frame", {
			ZIndex = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = if UseStateResult then UseTokensResult.Color.Extended.Black.Black_50.Transparency else 1,
			BackgroundColor3 = UseTokensResult.Color.Extended.Black.Black_50.Color3
		}),
		EventsWithGradientContainer = ReactModule.createElement("Frame", {
			ZIndex = 2,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, 0),
			BackgroundTransparency = UseTokensResult.Color.Extended.White.White_100.Transparency,
			BackgroundColor3 = UseTokensResult.Color.Extended.White.White_100.Color3,
			BorderSizePixel = 0,
			[ReactModule.Change.AbsoluteSize] = UseResult1
		}, {
			Gradient = ReactModule.createElement("UIGradient", {
				Rotation = 90,
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, UseTokensResult.Color.Surface.Surface_100.Color3),
					ColorSequenceKeypoint.new(1, UseTokensResult.Color.Surface.Surface_100.Color3)
				}),
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(UseStateResult1, 0),
					NumberSequenceKeypoint.new(1, 0)
				})
			}),
			ContentContainer = ReactModule.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				[ReactModule.Change.AbsoluteSize] = UseResult1
			}, {
				Padding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 80),
					PaddingLeft = UDim.new(0, 20),
					PaddingRight = UDim.new(0, 20),
					PaddingBottom = UDim.new(0, 20)
				}),
				Layout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					VerticalAlignment = Enum.VerticalAlignment.Bottom,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 16)
				}),
				EventDetailsBody = ReactModule.createElement(EventDetailsBodyModule, {
					virtualEvent = p1.virtualEvent,
					eventStatus = p1.eventStatus,
					containerSize = Vector2.new((p1.isWideMode and ConstantsModule.CONTAINER_WIDTH or UseScreenSizeResult.X) - 40, UseScreenSizeResult.Y),
					isExpanded = UseStateResult,
					setIsExpanded = UseStateResult2
				}),
				Divider = ReactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 1),
					BackgroundColor3 = UseTokensResult.Color.Common.Shimmer.Color3,
					BackgroundTransparency = UseTokensResult.Color.Common.Shimmer.Transparency
				}),
				EventActionBar = ReactModule.createElement(EventActionBarModule, {
					universeId = p1.virtualEvent.universeId,
					experienceName = if ExperienceDetails then ExperienceDetails.name else "",
					onExperienceTileActivated = p1.onExperienceTileActivated,
					ctaProps = p1.ctaProps
				})
			})
		})
	})
end