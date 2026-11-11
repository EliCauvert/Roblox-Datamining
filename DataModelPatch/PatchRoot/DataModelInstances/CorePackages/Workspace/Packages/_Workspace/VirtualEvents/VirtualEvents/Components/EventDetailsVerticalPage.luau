local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local _ = require(VirtualEvents.Parent.GraphQLServer)
local CryoModule = require(VirtualEvents.Parent.Cryo)
local ReactModule = require(VirtualEvents.Parent.React)
local UIBloxModule = require(VirtualEvents.Parent.UIBlox)
local FocusNavigationUtilsModule = require(VirtualEvents.Parent.FocusNavigationUtils)
local UseRoactServiceFunction = require(VirtualEvents.Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(VirtualEvents.Parent.RoactServiceTags).RoactNetworking
local FormFactor = require(VirtualEvents.Parent.FormFactor).Enums.FormFactor
local UseSelectorFunction = require(VirtualEvents.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local GetEventTimerStatusModule = require(VirtualEvents.Common.getEventTimerStatus)
local FindFirstImageInMediaModule = require(VirtualEvents.Common.findFirstImageInMedia)
local FetchEventThumbnailModule = require(VirtualEvents.Common.fetchEventThumbnail)
local EventDetailsContainerModule = require(VirtualEvents.Components.EventDetailsContainer)
local UseCTAPropsModule = require(VirtualEvents.Hooks.useCTAProps)
local UseAnimationModule = require(VirtualEvents.Hooks.useAnimation)
local RequestsModule = require(VirtualEvents.requests)
local _ = require(VirtualEvents.Parent.VirtualEventsState)
local ConstantsModule = require(VirtualEvents.constants)
local UseMutationFunction = require(VirtualEvents.Parent.ApolloClient).useMutation
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UtilityActionIcon = UIBloxModule.App.Button.UtilityActionIcon
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local FocusNavigableSurfaceWrapper = FocusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local IconsNavigationCloseSmall = UIBloxModule.App.ImageSet.Images["icons/navigation/close_small"]

local function OnClose() end

local config = {
	onClose = OnClose,
	onJoinEvent = OnClose,
	onShare = OnClose
}

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseSelectorFunction (copy), FormFactor (copy), ReactModule (copy), FindFirstImageInMediaModule (copy), FetchEventThumbnailModule (copy), ConstantsModule (copy), UseMutationFunction (copy), RequestsModule (copy), GetEventTimerStatusModule (copy), UseCTAPropsModule (copy), UseAnimationModule (copy), WithStyleFunction (copy), UtilityActionIcon (copy), ImageSetLabel (copy), IconsNavigationCloseSmall (copy), LoadableImage (copy), EventDetailsContainerModule (copy), FocusNavigableSurfaceWrapper (copy), FocusNavigableSurfaceIdentifierEnum (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local IsUseSelectorResultMatch = UseSelectorFunction(function(p2)
		return p2.FormFactor
	end) == FormFactor.WIDE
	local Media = p1.virtualEvent.media
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local FirstImageInMediaModule = if Media then FindFirstImageInMediaModule(Media) else nil
	ReactModule.useEffect(function()
		-- upvalues: FetchEventThumbnailModule (upval), UseRoactServiceResult (copy), p1 (copy), FirstImageInMediaModule (copy), UseStateResult2_2 (copy)
		local Flag = true
		FetchEventThumbnailModule(UseRoactServiceResult, p1.virtualEvent.id, FirstImageInMediaModule):andThen(function(Result)
			-- upvalues: Flag (ref), UseStateResult2_2 (upval)
			if Flag then
				UseStateResult2_2(Result)
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = false
		end
	end, { p1.virtualEvent.id, FirstImageInMediaModule })
	local UseResult = ReactModule.useCallback(function(Frame: Frame)
		-- upvalues: ConstantsModule (upval), UseStateResult (copy), UseStateResult2 (copy), UseStateResult1 (copy), UseStateResult2_1 (copy)
		local Smallest = math.min(ConstantsModule.HORIZONTAL_ASPECT_RATIO * Frame.AbsoluteSize.X, Frame.AbsoluteSize.Y)
		
		if Smallest ~= UseStateResult then
			UseStateResult2(Smallest)
		end
		local NewY = Frame.AbsoluteSize.Y - Smallest + 40
		
		if NewY ~= UseStateResult1 then
			UseStateResult2_1(NewY)
		end
	end, { UseStateResult, UseStateResult1 })
	local UseMutationResult = UseMutationFunction(RequestsModule.UPDATE_RSVP_STATUS, {
		variables = { virtualEventId = p1.virtualEvent.id },
		update = function(_, p2, p3)
			-- upvalues: CryoModule (upval)
			local VirtualEvent = p3.data.virtualEventRsvp.virtualEvent
			p2:modify({
				id = p2:identify(VirtualEvent),
				fields = {
					rsvpCounters = function(_, p4)
						-- upvalues: VirtualEvent (copy), CryoModule (upval)
						return CryoModule.Dictionary.join(p4, {
							going = p4.going + (if VirtualEvent.userRsvpStatus == "going" then 1 else -1)
						})
					end
				}
			})
		end
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetEventTimerStatusModule (upval), JoinResult (copy)
		return GetEventTimerStatusModule(JoinResult.virtualEvent, JoinResult.currentTime)
	end, { JoinResult.virtualEvent, JoinResult.currentTime })
	local UseCTAPropsModuleResult = UseCTAPropsModule(JoinResult.virtualEvent, UseMemoResult, p1.notifyMeUseEmphasisVariant, {
		onClose = JoinResult.onClose,
		onJoinEvent = JoinResult.onJoinEvent,
		onRsvpChanged = ReactModule.useCallback(function()
			-- upvalues: JoinResult (copy), UseMutationResult (copy)
			UseMutationResult[1]({
				variables = {
					rsvpStatus = if JoinResult.virtualEvent.userRsvpStatus == "going" then "notGoing" else "going"
				}
			}):andThen(function(Result)
				-- upvalues: JoinResult (upval)
				if JoinResult.onRsvpChanged then
					JoinResult.onRsvpChanged(Result.data.virtualEventRsvp.virtualEvent.userRsvpStatus, Result.data.virtualEventRsvp.shouldSeeNotificationsUpsellModal)
				end
			end)
		end, { JoinResult.virtualEvent }),
		onShare = JoinResult.onShare
	})
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(ConstantsModule.CONTAINER_WIDTH)
	UseAnimationModule({
		endOffset = 0,
		duration = 0.1,
		easingStyle = "linear",
		startOffset = UseStateResult4,
		setAnimationOffset = UseStateResult2_3
	})
	
	return WithStyleFunction(function(p2)
		-- upvalues: ReactModule (upval), IsUseSelectorResultMatch (copy), UtilityActionIcon (upval), p1 (copy), ImageSetLabel (upval), IconsNavigationCloseSmall (upval), UseResult (copy), LoadableImage (upval), UseStateResult (copy), UseStateResult3 (copy), EventDetailsContainerModule (upval), UseMemoResult (copy), UseCTAPropsModuleResult (copy), UseStateResult1 (copy), FocusNavigableSurfaceWrapper (upval), FocusNavigableSurfaceIdentifierEnum (upval), UseStateResult4 (copy), ConstantsModule (upval)
		return ReactModule.createElement("ImageButton", {
			ZIndex = 4,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			Active = true,
			AutoButtonColor = false,
			[ReactModule.Event.Activated] = p1.onClose
		}, {
			EventDetailsWindow = ReactModule.createElement(FocusNavigableSurfaceWrapper, {
				isIsolated = true,
				surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
				frameProps = {
					BorderSizePixel = 0,
					AnchorPoint = Vector2.new(1, 0),
					Position = UDim2.new(1, UseStateResult4, 0, 0),
					Size = if IsUseSelectorResultMatch then UDim2.new(0, ConstantsModule.CONTAINER_WIDTH, 1, 0) else UDim2.fromScale(1, 1),
					BackgroundTransparency = p2.Theme.BackgroundDefault.Transparency,
					BackgroundColor3 = p2.Theme.BackgroundDefault.Color
				}
			}, {
				EventDetailsWrapper = ReactModule.createElement("ScrollingFrame", {
					BackgroundTransparency = 1,
					ScrollBarThickness = 0,
					Selectable = false,
					ScrollingDirection = Enum.ScrollingDirection.Y,
					Size = UDim2.fromScale(1, 1),
					Position = UDim2.fromScale(0, 0),
					CanvasSize = UDim2.new(1, 0, 0, 0),
					AutomaticCanvasSize = Enum.AutomaticSize.Y
				}, {
					EventDetailsVerticalPage = ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
						CloseButtonContainer = ReactModule.createElement("Frame", {
							ZIndex = 3,
							BackgroundTransparency = 1,
							Size = UDim2.fromOffset(48, 48),
							Position = if IsUseSelectorResultMatch then UDim2.new(1, -64, 0, 16) else UDim2.fromOffset(16, 16)
						}, {
							CloseButton = ReactModule.createElement(UtilityActionIcon, { ZIndex = 1, onMedia = true, onActivated = p1.onClose }),
							CloseIcon = ReactModule.createElement(ImageSetLabel, {
								ZIndex = 2,
								BackgroundTransparency = 1,
								Size = UDim2.fromOffset(24, 24),
								Image = IconsNavigationCloseSmall,
								ImageColor3 = p2.Theme.IconEmphasis.Color,
								Position = UDim2.fromOffset(12, 12)
							})
						}),
						MediaContainer = ReactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							Size = UDim2.fromScale(1, 1),
							[ReactModule.Change.AbsoluteSize] = UseResult,
							ZIndex = 1
						}, {
							Thumbnail = ReactModule.createElement(LoadableImage, {
								BackgroundTransparency = 1,
								useShimmerAnimationWhileLoading = true,
								showFailedStateWhenLoadingFailed = true,
								Position = UDim2.fromScale(0, 0),
								Size = UDim2.new(1, 0, 0, UseStateResult),
								ScaleType = Enum.ScaleType.Crop,
								Image = UseStateResult3
							})
						}),
						EventContainer = ReactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							ZIndex = 2,
							Size = UDim2.fromScale(1, 1)
						}, {
							EventDetailsContainer = ReactModule.createElement(EventDetailsContainerModule, {
								virtualEvent = p1.virtualEvent,
								eventStatus = UseMemoResult,
								isWideMode = IsUseSelectorResultMatch,
								ctaProps = UseCTAPropsModuleResult,
								bottomHeight = UseStateResult1,
								onExperienceTileActivated = p1.onExperienceTileActivated
							})
						})
					})
				})
			})
		})
	end)
end