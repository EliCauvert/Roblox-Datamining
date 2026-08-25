local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local apolloClientModule = require(virtualEvents.Parent.ApolloClient)
local _ = require(virtualEvents.Parent.GraphQLServer)
local cryoModule = require(virtualEvents.Parent.Cryo)
local reactModule = require(virtualEvents.Parent.React)
local UIBloxModule = require(virtualEvents.Parent.UIBlox)
local useDeviceType = require(virtualEvents.Parent.RobloxAppHooks).useDeviceType
local _ = require(virtualEvents.Parent.RobloxAppEnums)
local useRoactService = require(virtualEvents.Parent.RobloxAppHooks).useRoactService
local roactNetworking = require(virtualEvents.Parent.RoactServiceTags).RoactNetworking
local responsiveModule = require(virtualEvents.Parent.Responsive)
local reactFocusNavigationModule = require(virtualEvents.Parent.ReactFocusNavigation)
local useCloseWithBackButton = require(virtualEvents.Parent.AppBlox).useCloseWithBackButton
local getEventTimerStatusModule = require(virtualEvents.Common.getEventTimerStatus)
local getGalleryItemsModule = require(virtualEvents.Common.getGalleryItems)
local fetchEventThumbnailListModule = require(virtualEvents.Common.fetchEventThumbnailList)
local fetchEventThumbnailModule = require(virtualEvents.Common.fetchEventThumbnail)
local useActionBarPropsModule = require(virtualEvents.Hooks.useActionBarProps)
local eventTimerModule = require(virtualEvents.Components.EventTimer)
local eventDescriptionModule = require(virtualEvents.Components.EventDescription)
local eventHostedByModule = require(virtualEvents.Components.EventHostedBy)
local attendanceModule = require(virtualEvents.Components.Attendance)
local requestsModule = require(virtualEvents.requests)
local _ = require(virtualEvents.Parent.VirtualEventsState)
local fFlagLuaAppLimitEventThumbnailToOneModule = require(virtualEvents.Flags.FFlagLuaAppLimitEventThumbnailToOne)
local useMutation = apolloClientModule.useMutation
local appBloxModule = require(virtualEvents.Parent.AppBlox)
local detailsPageTemplate = appBloxModule.DetailsPageTemplate
local contentPosition = appBloxModule.ContentPosition
local mediaGalleryPreview = appBloxModule.MediaGalleryPreview
local calcMediaGallerySizesFromWidth = appBloxModule.calcMediaGallerySizesFromWidth
local listTable = UIBloxModule.App.Table.ListTable

local var19 = function() end

local t = { onClose = var19, onJoinEvent = var19, onShare = var19 }

return function(p0)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), useDeviceType (ref), useRoactService (ref), roactNetworking (ref), fFlagLuaAppLimitEventThumbnailToOneModule (ref), fetchEventThumbnailModule (ref), getGalleryItemsModule (ref), fetchEventThumbnailListModule (ref), useMutation (ref), requestsModule (ref), getEventTimerStatusModule (ref), calcMediaGallerySizesFromWidth (ref), responsiveModule (ref), reactFocusNavigationModule (ref), useCloseWithBackButton (ref), useActionBarPropsModule (ref), contentPosition (ref), attendanceModule (ref), mediaGalleryPreview (ref), eventDescriptionModule (ref), listTable (ref), eventHostedByModule (ref), detailsPageTemplate (ref), eventTimerModule (ref)
	local var21 = cryoModule.Dictionary.join(t, p0)
	local media = p0.virtualEvent.media
	local experienceDetails = p0.virtualEvent.experienceDetails
	local var22, var23 = reactModule.useState(0)
	local var24 = useDeviceType()
	local var25, var26 = reactModule.useState({})
	local var27 = if var25[1] then var25[1].imageId else nil
	local var28 = useRoactService(roactNetworking)
	reactModule.useEffect(function()
		-- upvalues: fFlagLuaAppLimitEventThumbnailToOneModule (copy), fetchEventThumbnailModule (copy), var28 (ref), p0 (ref), var26 (ref), getGalleryItemsModule (copy), media (ref), fetchEventThumbnailListModule (copy)
		if fFlagLuaAppLimitEventThumbnailToOneModule then
			fetchEventThumbnailModule(var28, p0.virtualEvent.id):andThen(function(p1)
				-- upvalues: var26 (copy), getGalleryItemsModule (copy), media (copy)
				local t = {}
				
				if p1 then
					table.insert(t, { isYouTubeVideo = false, imageId = p1 })
				end
				if #t > 0 then
					var26(t)
					
					return
				end
				var26(getGalleryItemsModule(media))
			end, function()
				-- upvalues: var26 (copy), getGalleryItemsModule (copy), media (copy)
				var26(getGalleryItemsModule(media))
			end)
			
			return
		end
		fetchEventThumbnailListModule(var28, p0.virtualEvent.id):andThen(function(p2)
			-- upvalues: var26 (copy), getGalleryItemsModule (copy), media (copy)
			local t = {}
			
			if p2 then
				for i, v in p2 do
					if v.mediaId then
						table.insert(t, {
							isYouTubeVideo = false,
							imageId = "rbxassetid://" .. v.mediaId
						})
					end
				end
			end
			if #t > 0 then
				var26(t)
				
				return
			end
			var26(getGalleryItemsModule(media))
		end, function()
			-- upvalues: var26 (copy), getGalleryItemsModule (copy), media (copy)
			var26(getGalleryItemsModule(media))
		end)
	end, { p0.virtualEvent.id, media })
	local var29 = useMutation(requestsModule.UPDATE_RSVP_STATUS, {
		variables = { virtualEventId = p0.virtualEvent.id },
		update = function(_, p3, p4)
			-- upvalues: cryoModule (copy)
			local virtualEvent = p4.data.virtualEventRsvp.virtualEvent
			p3:modify({
				id = p3:identify(virtualEvent),
				fields = {
					rsvpCounters = function(_, p5)
						-- upvalues: virtualEvent (ref), cryoModule (copy)
						return cryoModule.Dictionary.join(p5, {
							going = p5.going + (if virtualEvent.userRsvpStatus == "going" then 1 else -1)
						})
					end
				}
			})
		end
	})
	local var30 = reactModule.useMemo(function()
		-- upvalues: getEventTimerStatusModule (copy), var21 (ref)
		return getEventTimerStatusModule(var21.virtualEvent, var21.currentTime)
	end, { var21.virtualEvent, var21.currentTime })
	local var31 = reactModule.useCallback(function(p6)
		-- upvalues: calcMediaGallerySizesFromWidth (copy), var22 (ref), var23 (ref)
		local offset = calcMediaGallerySizesFromWidth(p6.AbsoluteSize.X, 5).contentSize.Y.Offset
		
		if offset ~= var22 then
			var23(offset)
		end
	end, { var22 })
	local var32 = reactModule.useCallback(function()
		-- upvalues: var21 (ref), var29 (ref)
		var29[1]({
			variables = {
				rsvpStatus = if var21.virtualEvent.userRsvpStatus ~= "going" then "notGoing" else "going"
			}
		}):andThen(function(p7)
			-- upvalues: var21 (copy)
			if var21.onRsvpChanged then
				var21.onRsvpChanged(p7.data.virtualEventRsvp.virtualEvent.userRsvpStatus, p7.data.virtualEventRsvp.shouldSeeNotificationsUpsellModal)
			end
		end)
	end, { var21.virtualEvent })
	local var33 = reactModule.useRef(nil)
	var33.current = responsiveModule.usePreferredInput()
	local var34 = var33.current == responsiveModule.Input.Directional
	local var35, var36 = reactFocusNavigationModule.useMostRecentOrDefaultFocusBehavior()
	local var37 = useCloseWithBackButton(var36, p0.onClose)
	local var38 = reactFocusNavigationModule.useFocusGuiObject()
	local var39, var40 = reactModule.useState(nil)
	local var41 = reactModule.useCallback(function(p8)
		-- upvalues: var40 (ref), var35 (ref)
		var40(p8)
		
		if typeof(var35) == "function" then
			var35(p8)
		end
	end, { var35 })
	reactModule.useEffect(function()
		-- upvalues: var39 (ref), var33 (ref), responsiveModule (copy), var38 (ref)
		if var39 and var33.current == responsiveModule.Input.Directional then
			var38(var39)
		end
	end, { var39, var38 })
	local var42 = useActionBarPropsModule(var21.virtualEvent, var30, {
		onClose = var21.onClose,
		onJoinEvent = var21.onJoinEvent,
		onShare = var21.onShare,
		onRsvpChanged = var32
	}, var41)
	
	return reactModule.createElement(detailsPageTemplate, {
		deviceType = var24,
		titleText = if p0.virtualEvent.eventStatus == "moderated" then "[CONTENT MODERATED]" else var21.virtualEvent.title,
		thumbnailImageUrl = var27,
		thumbnailAspectRatio = Vector2.new(16, 9),
		renderInfoContent = function()
			-- upvalues: reactModule (copy), eventTimerModule (copy), var21 (ref), var30 (ref)
			return reactModule.createElement(eventTimerModule, {
				virtualEvent = var21.virtualEvent,
				status = var30,
				currentTime = var21.currentTime
			})
		end,
		actionBarProps = if reactModule.useMemo(function()
			-- upvalues: var42 (ref)
			return var42.button or #var42.icons > 0
		end, { var42 }) then var42 else nil,
		componentList = if p0.virtualEvent.eventStatus == "cancelled" or p0.virtualEvent.eventStatus == "moderated" then {} else {
			Attendance = if var30 ~= "Elapsed" then nil else {
				portraitLayoutOrder = 1,
				landscapeLayoutOrder = 1,
				landscapePosition = contentPosition.Left,
				renderComponent = function()
					-- upvalues: reactModule (copy), attendanceModule (copy), var21 (ref), var30 (ref)
					return reactModule.createElement(attendanceModule, { virtualEvent = var21.virtualEvent, eventStatus = var30 })
				end
			},
			MediaGallery = {
				portraitLayoutOrder = 2,
				landscapeLayoutOrder = 1,
				landscapePosition = contentPosition.Right,
				renderComponent = function()
					-- upvalues: reactModule (copy), var22 (ref), var31 (ref), mediaGalleryPreview (copy), var25 (ref)
					return reactModule.createElement("Frame", {
						Size = UDim2.new(1, 0, 0, var22),
						BackgroundTransparency = 1,
						[reactModule.Change.AbsoluteSize] = var31
					}, {
						Gallery = reactModule.createElement(mediaGalleryPreview, { numberOfThumbnails = 5, items = var25 })
					})
				end
			},
			Description = {
				portraitLayoutOrder = 3,
				landscapeLayoutOrder = 2,
				landscapePosition = contentPosition.Left,
				renderComponent = function()
					-- upvalues: reactModule (copy), eventDescriptionModule (copy), var21 (ref), experienceDetails (ref)
					return reactModule.createElement(eventDescriptionModule, {
						description = var21.virtualEvent.description,
						experienceName = if experienceDetails then experienceDetails.name else nil,
						experienceThumbnail = ("rbxthumb://type=GameIcon&id=%s&w=150&h=150"):format(var21.virtualEvent.universeId),
						onExperienceTileActivated = var21.onExperienceTileActivated
					})
				end
			},
			EventInfo = if var21.virtualEvent.host then {
				portraitLayoutOrder = 4,
				landscapeLayoutOrder = 2,
				landscapePosition = contentPosition.Right,
				renderComponent = function()
					-- upvalues: reactModule (copy), listTable (copy), eventHostedByModule (copy), var21 (ref)
					return reactModule.createElement(listTable, {
						cells = {
							reactModule.createElement(eventHostedByModule, {
								host = var21.virtualEvent.host,
								onActivated = var21.onHostActivated
							})
						}
					})
				end
			} else nil
		},
		onClose = var21.onClose,
		disableStickyActionBar = var34,
		containerRef = var37
	})
end