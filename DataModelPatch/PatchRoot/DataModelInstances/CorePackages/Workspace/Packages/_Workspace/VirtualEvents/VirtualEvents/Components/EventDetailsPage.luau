local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local _ = require(VirtualEvents.Parent.GraphQLServer)
local CryoModule = require(VirtualEvents.Parent.Cryo)
local ReactModule = require(VirtualEvents.Parent.React)
local UseDeviceTypeFunction = require(VirtualEvents.Parent.RobloxAppHooks).useDeviceType
local _ = require(VirtualEvents.Parent.RobloxAppEnums)
local UseRoactServiceFunction = require(VirtualEvents.Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(VirtualEvents.Parent.RoactServiceTags).RoactNetworking
local ResponsiveModule = require(VirtualEvents.Parent.Responsive)
local ReactFocusNavigationModule = require(VirtualEvents.Parent.ReactFocusNavigation)
local UseCloseWithBackButtonFunction = require(VirtualEvents.Parent.AppBlox).useCloseWithBackButton
local GetEventTimerStatusModule = require(VirtualEvents.Common.getEventTimerStatus)
local GetGalleryItemsModule = require(VirtualEvents.Common.getGalleryItems)
local FetchEventThumbnailListModule = require(VirtualEvents.Common.fetchEventThumbnailList)
local FetchEventThumbnailModule = require(VirtualEvents.Common.fetchEventThumbnail)
local UseActionBarPropsModule = require(VirtualEvents.Hooks.useActionBarProps)
local EventTimerModule = require(VirtualEvents.Components.EventTimer)
local EventDescriptionModule = require(VirtualEvents.Components.EventDescription)
local EventHostedByModule = require(VirtualEvents.Components.EventHostedBy)
local AttendanceModule = require(VirtualEvents.Components.Attendance)
local RequestsModule = require(VirtualEvents.requests)
local _ = require(VirtualEvents.Parent.VirtualEventsState)
local FFlagLuaAppLimitEventThumbnailToOneModule = require(VirtualEvents.Flags.FFlagLuaAppLimitEventThumbnailToOne)
local UseMutationFunction = require(VirtualEvents.Parent.ApolloClient).useMutation
local AppBloxModule = require(VirtualEvents.Parent.AppBlox)
local DetailsPageTemplate = AppBloxModule.DetailsPageTemplate
local ContentPosition = AppBloxModule.ContentPosition
local MediaGalleryPreview = AppBloxModule.MediaGalleryPreview
local CalcMediaGallerySizesFromWidthFunction = AppBloxModule.calcMediaGallerySizesFromWidth
local ListTable = require(VirtualEvents.Parent.UIBlox).App.Table.ListTable

local function OnClose() end

local config = {
	onClose = OnClose,
	onJoinEvent = OnClose,
	onShare = OnClose
}

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), UseDeviceTypeFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), FFlagLuaAppLimitEventThumbnailToOneModule (copy), FetchEventThumbnailModule (copy), GetGalleryItemsModule (copy), FetchEventThumbnailListModule (copy), UseMutationFunction (copy), RequestsModule (copy), GetEventTimerStatusModule (copy), CalcMediaGallerySizesFromWidthFunction (copy), ResponsiveModule (copy), ReactFocusNavigationModule (copy), UseCloseWithBackButtonFunction (copy), UseActionBarPropsModule (copy), ContentPosition (copy), AttendanceModule (copy), MediaGalleryPreview (copy), EventDescriptionModule (copy), ListTable (copy), EventHostedByModule (copy), DetailsPageTemplate (copy), EventTimerModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local Media = p1.virtualEvent.media
	local ExperienceDetails = p1.virtualEvent.experienceDetails
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseDeviceTypeResult = UseDeviceTypeFunction()
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState({})
	local ImageId = if UseStateResult1[1] then UseStateResult1[1].imageId else nil
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	ReactModule.useEffect(function()
		-- upvalues: FFlagLuaAppLimitEventThumbnailToOneModule (upval), FetchEventThumbnailModule (upval), UseRoactServiceResult (copy), p1 (copy), UseStateResult2_1 (copy), GetGalleryItemsModule (upval), Media (copy), FetchEventThumbnailListModule (upval)
		if FFlagLuaAppLimitEventThumbnailToOneModule then
			FetchEventThumbnailModule(UseRoactServiceResult, p1.virtualEvent.id):andThen(function(Result)
				-- upvalues: UseStateResult2_1 (upval), GetGalleryItemsModule (upval), Media (upval)
				local List = {}
				
				if Result then
					table.insert(List, { isYouTubeVideo = false, imageId = Result })
				end
				if #List > 0 then
					UseStateResult2_1(List)
					
					return
				else
					UseStateResult2_1(GetGalleryItemsModule(Media))
				end
			end, function()
				-- upvalues: UseStateResult2_1 (upval), GetGalleryItemsModule (upval), Media (upval)
				UseStateResult2_1(GetGalleryItemsModule(Media))
			end)
			
			return
		else
			FetchEventThumbnailListModule(UseRoactServiceResult, p1.virtualEvent.id):andThen(function(Result)
				-- upvalues: UseStateResult2_1 (upval), GetGalleryItemsModule (upval), Media (upval)
				local List = {}
				
				if Result then
					for _, value in Result do
						if value.mediaId then
							table.insert(List, {
								isYouTubeVideo = false,
								imageId = "rbxassetid://" .. value.mediaId
							})
						end
					end
				end
				if #List > 0 then
					UseStateResult2_1(List)
					
					return
				else
					UseStateResult2_1(GetGalleryItemsModule(Media))
				end
			end, function()
				-- upvalues: UseStateResult2_1 (upval), GetGalleryItemsModule (upval), Media (upval)
				UseStateResult2_1(GetGalleryItemsModule(Media))
			end)
		end
	end, { p1.virtualEvent.id, Media })
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
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: CalcMediaGallerySizesFromWidthFunction (upval), UseStateResult (copy), UseStateResult2 (copy)
		local Offset = CalcMediaGallerySizesFromWidthFunction(Frame.AbsoluteSize.X, 5).contentSize.Y.Offset
		
		if Offset ~= UseStateResult then
			UseStateResult2(Offset)
		end
	end, { UseStateResult })
	local UseResult1 = ReactModule.useCallback(function()
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
	end, { JoinResult.virtualEvent })
	local UseRefResult = ReactModule.useRef(nil)
	UseRefResult.current = ResponsiveModule.usePreferredInput()
	local IsCurrentMatch = UseRefResult.current == ResponsiveModule.Input.Directional
	local UseMostRecentOrDefaultFocusBehaviorResult, UseMostRecentOrDefaultFocusBehaviorResult2 = ReactFocusNavigationModule.useMostRecentOrDefaultFocusBehavior()
	local UseCloseWithBackButtonResult = UseCloseWithBackButtonFunction(UseMostRecentOrDefaultFocusBehaviorResult2, p1.onClose)
	local UseFocusGuiObjectResult = ReactFocusNavigationModule.useFocusGuiObject()
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_2 (copy), UseMostRecentOrDefaultFocusBehaviorResult (copy)
		UseStateResult2_2(p2)
		
		if typeof(UseMostRecentOrDefaultFocusBehaviorResult) == "function" then
			UseMostRecentOrDefaultFocusBehaviorResult(p2)
		end
	end, { UseMostRecentOrDefaultFocusBehaviorResult })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult3 (copy), UseRefResult (copy), ResponsiveModule (upval), UseFocusGuiObjectResult (copy)
		if UseStateResult3 and UseRefResult.current == ResponsiveModule.Input.Directional then
			UseFocusGuiObjectResult(UseStateResult3)
		end
	end, { UseStateResult3, UseFocusGuiObjectResult })
	local UseActionBarPropsModuleResult = UseActionBarPropsModule(JoinResult.virtualEvent, UseMemoResult, {
		onClose = JoinResult.onClose,
		onJoinEvent = JoinResult.onJoinEvent,
		onShare = JoinResult.onShare,
		onRsvpChanged = UseResult1
	}, UseResult2)
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseActionBarPropsModuleResult (copy)
		return UseActionBarPropsModuleResult.button or #UseActionBarPropsModuleResult.icons > 0
	end, { UseActionBarPropsModuleResult })
	local config1 = {
		Attendance = if UseMemoResult == "Elapsed" then nil else {
			portraitLayoutOrder = 1,
			landscapeLayoutOrder = 1,
			landscapePosition = ContentPosition.Left,
			renderComponent = function()
				-- upvalues: ReactModule (upval), AttendanceModule (upval), JoinResult (copy), UseMemoResult (copy)
				return ReactModule.createElement(AttendanceModule, {
					virtualEvent = JoinResult.virtualEvent,
					eventStatus = UseMemoResult
				})
			end
		},
		MediaGallery = {
			portraitLayoutOrder = 2,
			landscapeLayoutOrder = 1,
			landscapePosition = ContentPosition.Right,
			renderComponent = function()
				-- upvalues: ReactModule (upval), UseStateResult (copy), UseResult (copy), MediaGalleryPreview (upval), UseStateResult1 (copy)
				return ReactModule.createElement("Frame", {
					Size = UDim2.new(1, 0, 0, UseStateResult),
					BackgroundTransparency = 1,
					[ReactModule.Change.AbsoluteSize] = UseResult
				}, {
					Gallery = ReactModule.createElement(MediaGalleryPreview, { numberOfThumbnails = 5, items = UseStateResult1 })
				})
			end
		},
		Description = {
			portraitLayoutOrder = 3,
			landscapeLayoutOrder = 2,
			landscapePosition = ContentPosition.Left,
			renderComponent = function()
				-- upvalues: ReactModule (upval), EventDescriptionModule (upval), JoinResult (copy), ExperienceDetails (copy)
				return ReactModule.createElement(EventDescriptionModule, {
					description = JoinResult.virtualEvent.description,
					experienceName = if ExperienceDetails then ExperienceDetails.name else nil,
					experienceThumbnail = ("rbxthumb://type=GameIcon&id=%s&w=150&h=150"):format(JoinResult.virtualEvent.universeId),
					onExperienceTileActivated = JoinResult.onExperienceTileActivated
				})
			end
		},
		EventInfo = if JoinResult.virtualEvent.host then {
			portraitLayoutOrder = 4,
			landscapeLayoutOrder = 2,
			landscapePosition = ContentPosition.Right,
			renderComponent = function()
				-- upvalues: ReactModule (upval), ListTable (upval), EventHostedByModule (upval), JoinResult (copy)
				return ReactModule.createElement(ListTable, {
					cells = {
						ReactModule.createElement(EventHostedByModule, {
							host = JoinResult.virtualEvent.host,
							onActivated = JoinResult.onHostActivated
						})
					}
				})
			end
		} else nil
	}
	
	return ReactModule.createElement(DetailsPageTemplate, {
		deviceType = UseDeviceTypeResult,
		titleText = if p1.virtualEvent.eventStatus == "moderated" then "[CONTENT MODERATED]" else JoinResult.virtualEvent.title,
		thumbnailImageUrl = ImageId,
		thumbnailAspectRatio = Vector2.new(16, 9),
		renderInfoContent = function()
			-- upvalues: ReactModule (upval), EventTimerModule (upval), JoinResult (copy), UseMemoResult (copy)
			return ReactModule.createElement(EventTimerModule, {
				virtualEvent = JoinResult.virtualEvent,
				status = UseMemoResult,
				currentTime = JoinResult.currentTime
			})
		end,
		actionBarProps = if UseMemoResult1 then UseActionBarPropsModuleResult else nil,
		componentList = if p1.virtualEvent.eventStatus == "cancelled" or p1.virtualEvent.eventStatus == "moderated" then {} else config1,
		onClose = JoinResult.onClose,
		disableStickyActionBar = IsCurrentMatch,
		containerRef = UseCloseWithBackButtonResult
	})
end