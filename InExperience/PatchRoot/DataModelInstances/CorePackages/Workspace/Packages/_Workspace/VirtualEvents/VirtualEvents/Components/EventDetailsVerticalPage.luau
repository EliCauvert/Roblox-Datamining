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

local var1 = function() end

local t = { onClose = var1, onJoinEvent = var1, onShare = var1 }

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), useRoactService (ref), roactNetworking (ref), useSelector (ref), formFactor (ref), reactModule (ref), findFirstImageInMediaModule (ref), fetchEventThumbnailModule (ref), constantsModule (ref), useMutation (ref), requestsModule (ref), getEventTimerStatusModule (ref), useCTAPropsModule (ref), useAnimationModule (ref), withStyle (ref), utilityActionIcon (ref), imageSetLabel (ref), closeSmall (ref), loadableImage (ref), eventDetailsContainerModule (ref), focusNavigableSurfaceWrapper (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var2 = cryoModule.Dictionary.join(t, p1)
	local var3 = useRoactService(roactNetworking)
	local var4 = useSelector(function(p2)
		return p2.FormFactor
	end) == formFactor.WIDE
	local media = p1.virtualEvent.media
	local var5, var6 = reactModule.useState(0)
	local var7, var8 = reactModule.useState(0)
	local var9, var10 = reactModule.useState(nil)
	local var11 = if media then findFirstImageInMediaModule(media) else nil
	reactModule.useEffect(function()
		-- upvalues: fetchEventThumbnailModule (copy), var3 (ref), p1 (ref), var11 (ref), var10 (ref)
		local var12 = true
		fetchEventThumbnailModule(var3, p1.virtualEvent.id, var11):andThen(function(p2)
			-- upvalues: var12 (write), var10 (copy)
			if var12 then
				var10(p2)
			end
		end)
		
		return function()
			-- upvalues: var12 (write)
			var12 = false
		end
	end, { p1.virtualEvent.id, var11 })
	local var12 = reactModule.useCallback(function(p2)
		-- upvalues: constantsModule (copy), var5 (ref), var6 (ref), var7 (ref), var8 (ref)
		local minValue = math.min(constantsModule.HORIZONTAL_ASPECT_RATIO * p2.AbsoluteSize.X, p2.AbsoluteSize.Y)
		
		if minValue ~= var5 then
			var6(minValue)
		end
		local var13 = p2.AbsoluteSize.Y - minValue + 40
		
		if var13 ~= var7 then
			var8(var13)
		end
	end, { var5, var7 })
	local var13 = useMutation(requestsModule.UPDATE_RSVP_STATUS, {
		variables = { virtualEventId = p1.virtualEvent.id },
		update = function(_, p2, p3)
			-- upvalues: cryoModule (copy)
			local virtualEvent = p3.data.virtualEventRsvp.virtualEvent
			p2:modify({
				id = p2:identify(virtualEvent),
				fields = {
					rsvpCounters = function(_, p4)
						-- upvalues: virtualEvent (ref), cryoModule (copy)
						return cryoModule.Dictionary.join(p4, {
							going = p4.going + (if virtualEvent.userRsvpStatus == "going" then 1 else -1)
						})
					end
				}
			})
		end
	})
	local var14 = reactModule.useMemo(function()
		-- upvalues: getEventTimerStatusModule (copy), var2 (ref)
		return getEventTimerStatusModule(var2.virtualEvent, var2.currentTime)
	end, { var2.virtualEvent, var2.currentTime })
	local var15 = useCTAPropsModule(var2.virtualEvent, var14, p1.notifyMeUseEmphasisVariant, {
		onClose = var2.onClose,
		onJoinEvent = var2.onJoinEvent,
		onRsvpChanged = reactModule.useCallback(function()
			-- upvalues: var2 (ref), var13 (ref)
			var13[1]({
				variables = {
					rsvpStatus = if var2.virtualEvent.userRsvpStatus ~= "going" then "notGoing" else "going"
				}
			}):andThen(function(p2)
				-- upvalues: var2 (copy)
				if var2.onRsvpChanged then
					var2.onRsvpChanged(p2.data.virtualEventRsvp.virtualEvent.userRsvpStatus, p2.data.virtualEventRsvp.shouldSeeNotificationsUpsellModal)
				end
			end)
		end, { var2.virtualEvent }),
		onShare = var2.onShare
	})
	local var16, var17 = reactModule.useState(constantsModule.CONTAINER_WIDTH)
	useAnimationModule({
		endOffset = 0,
		duration = 0.1,
		easingStyle = "linear",
		startOffset = var16,
		setAnimationOffset = var17
	})
	
	return withStyle(function(p2)
		-- upvalues: reactModule (copy), var4 (ref), utilityActionIcon (copy), p1 (ref), imageSetLabel (copy), closeSmall (copy), var12 (ref), loadableImage (copy), var5 (ref), var9 (ref), eventDetailsContainerModule (copy), var14 (ref), var15 (ref), var7 (ref), focusNavigableSurfaceWrapper (copy), focusNavigableSurfaceIdentifierEnum (copy), var16 (ref), constantsModule (copy)
		return reactModule.createElement("ImageButton", {
			ZIndex = 4,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			Active = true,
			AutoButtonColor = false,
			[reactModule.Event.Activated] = p1.onClose
		}, {
			EventDetailsWindow = reactModule.createElement(focusNavigableSurfaceWrapper, {
				isIsolated = true,
				surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
				frameProps = {
					BorderSizePixel = 0,
					AnchorPoint = Vector2.new(1, 0),
					Position = UDim2.new(1, var16, 0, 0),
					Size = if var4 then UDim2.new(0, constantsModule.CONTAINER_WIDTH, 1, 0) else UDim2.fromScale(1, 1),
					BackgroundTransparency = p2.Theme.BackgroundDefault.Transparency,
					BackgroundColor3 = p2.Theme.BackgroundDefault.Color
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
							Position = if var4 then UDim2.new(1, -64, 0, 16) else UDim2.fromOffset(16, 16)
						}, {
							CloseButton = reactModule.createElement(utilityActionIcon, { ZIndex = 1, onMedia = true, onActivated = p1.onClose }),
							CloseIcon = reactModule.createElement(imageSetLabel, {
								ZIndex = 2,
								BackgroundTransparency = 1,
								Size = UDim2.fromOffset(24, 24),
								Image = closeSmall,
								ImageColor3 = p2.Theme.IconEmphasis.Color,
								Position = UDim2.fromOffset(12, 12)
							})
						}),
						MediaContainer = reactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							Size = UDim2.fromScale(1, 1),
							[reactModule.Change.AbsoluteSize] = var12,
							ZIndex = 1
						}, {
							Thumbnail = reactModule.createElement(loadableImage, {
								BackgroundTransparency = 1,
								useShimmerAnimationWhileLoading = true,
								showFailedStateWhenLoadingFailed = true,
								Position = UDim2.fromScale(0, 0),
								Size = UDim2.new(1, 0, 0, var5),
								ScaleType = Enum.ScaleType.Crop,
								Image = var9
							})
						}),
						EventContainer = reactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							ZIndex = 2,
							Size = UDim2.fromScale(1, 1)
						}, {
							EventDetailsContainer = reactModule.createElement(eventDetailsContainerModule, {
								virtualEvent = p1.virtualEvent,
								eventStatus = var14,
								isWideMode = var4,
								ctaProps = var15,
								bottomHeight = var7,
								onExperienceTileActivated = p1.onExperienceTileActivated
							})
						})
					})
				})
			})
		})
	end)
end