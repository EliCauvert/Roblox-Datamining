local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local apolloClientModule = require(virtualEvents.Parent.ApolloClient)
local _ = require(virtualEvents.Parent.GraphQLServer)
local cryoModule = require(virtualEvents.Parent.Cryo)
local reactModule = require(virtualEvents.Parent.React)
local UIBloxModule = require(virtualEvents.Parent.UIBlox)
local focusNavigationUtilsModule = require(virtualEvents.Parent.FocusNavigationUtils)
local useRoactService = require(virtualEvents.Parent.RobloxAppHooks).useRoactService
local roactNetworking = require(virtualEvents.Parent.RoactServiceTags).RoactNetworking
local formFactor = require(virtualEvents.Parent.FormFactor).Enums.FormFactor
local useSelector = require(virtualEvents.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local getEventTimerStatusModule = require(virtualEvents.Common.getEventTimerStatus)
local findFirstImageInMediaModule = require(virtualEvents.Common.findFirstImageInMedia)
local fetchEventThumbnailModule = require(virtualEvents.Common.fetchEventThumbnail)
local eventDetailsContainerModule = require(virtualEvents.Components.EventDetailsContainer)
local useCTAPropsModule = require(virtualEvents.Hooks.useCTAProps)
local useAnimationModule = require(virtualEvents.Hooks.useAnimation)
local requestsModule = require(virtualEvents.requests)
local _ = require(virtualEvents.Parent.VirtualEventsState)
local constantsModule = require(virtualEvents.constants)
local useMutation = apolloClientModule.useMutation
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local utilityActionIcon = UIBloxModule.App.Button.UtilityActionIcon
local loadableImage = UIBloxModule.App.Loading.LoadableImage
local withStyle = UIBloxModule.Core.Style.withStyle
local focusNavigableSurfaceWrapper = focusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local closeSmall = images["icons/navigation/close_small"]

local var14 = function() end

local t = { onClose = var14, onJoinEvent = var14, onShare = var14 }

return function(p0)
	-- upvalues: cryoModule (ref), t (ref), useRoactService (ref), roactNetworking (ref), useSelector (ref), formFactor (ref), reactModule (ref), findFirstImageInMediaModule (ref), fetchEventThumbnailModule (ref), constantsModule (ref), useMutation (ref), requestsModule (ref), getEventTimerStatusModule (ref), useCTAPropsModule (ref), useAnimationModule (ref), withStyle (ref), utilityActionIcon (ref), imageSetLabel (ref), closeSmall (ref), loadableImage (ref), eventDetailsContainerModule (ref), focusNavigableSurfaceWrapper (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var16 = cryoModule.Dictionary.join(t, p0)
	local var17 = useRoactService(roactNetworking)
	local var18 = useSelector(function(p1)
		return p1.FormFactor
	end) == formFactor.WIDE
	local media = p0.virtualEvent.media
	local var19, var20 = reactModule.useState(0)
	local var21, var22 = reactModule.useState(0)
	local var23, var24 = reactModule.useState(nil)
	local var25 = if media then findFirstImageInMediaModule(media) else nil
	reactModule.useEffect(function()
		-- upvalues: fetchEventThumbnailModule (copy), var17 (ref), p0 (ref), var25 (ref), var24 (ref)
		local var32 = true
		fetchEventThumbnailModule(var17, p0.virtualEvent.id, var25):andThen(function(p2)
			-- upvalues: var32 (write), var24 (copy)
			if var32 then
				var24(p2)
			end
		end)
		
		return function()
			-- upvalues: var32 (write)
			var32 = false
		end
	end, { p0.virtualEvent.id, var25 })
	local var26 = reactModule.useCallback(function(p3)
		-- upvalues: constantsModule (copy), var19 (ref), var20 (ref), var21 (ref), var22 (ref)
		local minValue = math.min(constantsModule.HORIZONTAL_ASPECT_RATIO * p3.AbsoluteSize.X, p3.AbsoluteSize.Y)
		
		if minValue ~= var19 then
			var20(minValue)
		end
		local var34 = p3.AbsoluteSize.Y - minValue + 40
		
		if var34 ~= var21 then
			var22(var34)
		end
	end, { var19, var21 })
	local var27 = useMutation(requestsModule.UPDATE_RSVP_STATUS, {
		variables = { virtualEventId = p0.virtualEvent.id },
		update = function(_, p4, p5)
			-- upvalues: cryoModule (copy)
			local virtualEvent = p5.data.virtualEventRsvp.virtualEvent
			p4:modify({
				id = p4:identify(virtualEvent),
				fields = {
					rsvpCounters = function(_, p6)
						-- upvalues: virtualEvent (ref), cryoModule (copy)
						return cryoModule.Dictionary.join(p6, {
							going = p6.going + (if virtualEvent.userRsvpStatus == "going" then 1 else -1)
						})
					end
				}
			})
		end
	})
	local var28 = reactModule.useMemo(function()
		-- upvalues: getEventTimerStatusModule (copy), var16 (ref)
		return getEventTimerStatusModule(var16.virtualEvent, var16.currentTime)
	end, { var16.virtualEvent, var16.currentTime })
	local var29 = useCTAPropsModule(var16.virtualEvent, var28, p0.notifyMeUseEmphasisVariant, {
		onClose = var16.onClose,
		onJoinEvent = var16.onJoinEvent,
		onRsvpChanged = reactModule.useCallback(function()
			-- upvalues: var16 (ref), var27 (ref)
			var27[1]({
				variables = {
					rsvpStatus = if var16.virtualEvent.userRsvpStatus ~= "going" then "notGoing" else "going"
				}
			}):andThen(function(p7)
				-- upvalues: var16 (copy)
				if var16.onRsvpChanged then
					var16.onRsvpChanged(p7.data.virtualEventRsvp.virtualEvent.userRsvpStatus, p7.data.virtualEventRsvp.shouldSeeNotificationsUpsellModal)
				end
			end)
		end, { var16.virtualEvent }),
		onShare = var16.onShare
	})
	local var30, var31 = reactModule.useState(constantsModule.CONTAINER_WIDTH)
	useAnimationModule({
		endOffset = 0,
		duration = 0.1,
		easingStyle = "linear",
		startOffset = var30,
		setAnimationOffset = var31
	})
	
	return withStyle(function(p8)
		-- upvalues: reactModule (copy), var18 (ref), utilityActionIcon (copy), p0 (ref), imageSetLabel (copy), closeSmall (copy), var26 (ref), loadableImage (copy), var19 (ref), var23 (ref), eventDetailsContainerModule (copy), var28 (ref), var29 (ref), var21 (ref), focusNavigableSurfaceWrapper (copy), focusNavigableSurfaceIdentifierEnum (copy), var30 (ref), constantsModule (copy)
		return reactModule.createElement("ImageButton", {
			ZIndex = 4,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			Active = true,
			AutoButtonColor = false,
			[reactModule.Event.Activated] = p0.onClose
		}, {
			EventDetailsWindow = reactModule.createElement(focusNavigableSurfaceWrapper, {
				isIsolated = true,
				surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
				frameProps = {
					BorderSizePixel = 0,
					AnchorPoint = Vector2.new(1, 0),
					Position = UDim2.new(1, var30, 0, 0),
					Size = if var18 then UDim2.new(0, constantsModule.CONTAINER_WIDTH, 1, 0) else UDim2.fromScale(1, 1),
					BackgroundTransparency = p8.Theme.BackgroundDefault.Transparency,
					BackgroundColor3 = p8.Theme.BackgroundDefault.Color
				}
			}, {
				EventDetailsWrapper = reactModule.createElement("ScrollingFrame", {
					BackgroundTransparency = 1,
					ScrollBarThickness = 0,
					Selectable = false,
					ScrollingDirection = Enum.ScrollingDirection.Y,
					Size = UDim2.fromScale(1, 1),
					Position = UDim2.fromScale(0, 0),
					CanvasSize = UDim2.new(1, 0, 0, 0),
					AutomaticCanvasSize = Enum.AutomaticSize.Y
				}, {
					EventDetailsVerticalPage = reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
						CloseButtonContainer = reactModule.createElement("Frame", {
							ZIndex = 3,
							BackgroundTransparency = 1,
							Size = UDim2.fromOffset(48, 48),
							Position = if var18 then UDim2.new(1, -64, 0, 16) else UDim2.fromOffset(16, 16)
						}, {
							CloseButton = reactModule.createElement(utilityActionIcon, { ZIndex = 1, onMedia = true, onActivated = p0.onClose }),
							CloseIcon = reactModule.createElement(imageSetLabel, {
								ZIndex = 2,
								BackgroundTransparency = 1,
								Size = UDim2.fromOffset(24, 24),
								Image = closeSmall,
								ImageColor3 = p8.Theme.IconEmphasis.Color,
								Position = UDim2.fromOffset(12, 12)
							})
						}),
						MediaContainer = reactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							Size = UDim2.fromScale(1, 1),
							[reactModule.Change.AbsoluteSize] = var26,
							ZIndex = 1
						}, {
							Thumbnail = reactModule.createElement(loadableImage, {
								BackgroundTransparency = 1,
								useShimmerAnimationWhileLoading = true,
								showFailedStateWhenLoadingFailed = true,
								Position = UDim2.fromScale(0, 0),
								Size = UDim2.new(1, 0, 0, var19),
								ScaleType = Enum.ScaleType.Crop,
								Image = var23
							})
						}),
						EventContainer = reactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							ZIndex = 2,
							Size = UDim2.fromScale(1, 1)
						}, {
							EventDetailsContainer = reactModule.createElement(eventDetailsContainerModule, {
								virtualEvent = p0.virtualEvent,
								eventStatus = var28,
								isWideMode = var18,
								ctaProps = var29,
								bottomHeight = var21,
								onExperienceTileActivated = p0.onExperienceTileActivated
							})
						})
					})
				})
			})
		})
	end)
end