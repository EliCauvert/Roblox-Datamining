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

local var1 = function() end

local t = { onClose = var1, onJoinEvent = var1, onShare = var1 }

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), useDeviceType (ref), useRoactService (ref), roactNetworking (ref), fFlagLuaAppLimitEventThumbnailToOneModule (ref), fetchEventThumbnailModule (ref), getGalleryItemsModule (ref), fetchEventThumbnailListModule (ref), useMutation (ref), requestsModule (ref), getEventTimerStatusModule (ref), calcMediaGallerySizesFromWidth (ref), responsiveModule (ref), reactFocusNavigationModule (ref), useCloseWithBackButton (ref), useActionBarPropsModule (ref), contentPosition (ref), attendanceModule (ref), mediaGalleryPreview (ref), eventDescriptionModule (ref), listTable (ref), eventHostedByModule (ref), detailsPageTemplate (ref), eventTimerModule (ref)
	local var2 = cryoModule.Dictionary.join(t, p1)
	local media = p1.virtualEvent.media
	local experienceDetails = p1.virtualEvent.experienceDetails
	local var3, var4 = reactModule.useState(0)
	local var5 = useDeviceType()
	local var6, var7 = reactModule.useState({})
	local var8 = if var6[1] then var6[1].imageId else nil
	local var9 = useRoactService(roactNetworking)
	reactModule.useEffect(function()
		-- upvalues: fFlagLuaAppLimitEventThumbnailToOneModule (copy), fetchEventThumbnailModule (copy), var9 (ref), p1 (ref), var7 (ref), getGalleryItemsModule (copy), media (ref), fetchEventThumbnailListModule (copy)
		if fFlagLuaAppLimitEventThumbnailToOneModule then
			fetchEventThumbnailModule(var9, p1.virtualEvent.id):andThen(function(p2)
				-- upvalues: var7 (copy), getGalleryItemsModule (copy), media (copy)
				local t = {}
				
				if p2 then
					table.insert(t, { isYouTubeVideo = false, imageId = p2 })
				end
				if #t > 0 then
					var7(t)
					
					return
				end
				var7(getGalleryItemsModule(media))
			end, function()
				-- upvalues: var7 (copy), getGalleryItemsModule (copy), media (copy)
				var7(getGalleryItemsModule(media))
			end)
			
			return
		end
		fetchEventThumbnailListModule(var9, p1.virtualEvent.id):andThen(function(p2)
			-- upvalues: var7 (copy), getGalleryItemsModule (copy), media (copy)
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
				var7(t)
				
				return
			end
			var7(getGalleryItemsModule(media))
		end, function()
			-- upvalues: var7 (copy), getGalleryItemsModule (copy), media (copy)
			var7(getGalleryItemsModule(media))
		end)
	end, { p1.virtualEvent.id, media })
	local var10 = useMutation(requestsModule.UPDATE_RSVP_STATUS, {
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
	local var11 = reactModule.useMemo(function()
		-- upvalues: getEventTimerStatusModule (copy), var2 (ref)
		return getEventTimerStatusModule(var2.virtualEvent, var2.currentTime)
	end, { var2.virtualEvent, var2.currentTime })
	local var12 = reactModule.useCallback(function(p2)
		-- upvalues: calcMediaGallerySizesFromWidth (copy), var3 (ref), var4 (ref)
		local offset = calcMediaGallerySizesFromWidth(p2.AbsoluteSize.X, 5).contentSize.Y.Offset
		
		if offset ~= var3 then
			var4(offset)
		end
	end, { var3 })
	local var13 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), var10 (ref)
		var10[1]({
			variables = {
				rsvpStatus = if var2.virtualEvent.userRsvpStatus ~= "going" then "notGoing" else "going"
			}
		}):andThen(function(p2)
			-- upvalues: var2 (copy)
			if var2.onRsvpChanged then
				var2.onRsvpChanged(p2.data.virtualEventRsvp.virtualEvent.userRsvpStatus, p2.data.virtualEventRsvp.shouldSeeNotificationsUpsellModal)
			end
		end)
	end, { var2.virtualEvent })
	local var14 = reactModule.useRef(nil)
	var14.current = responsiveModule.usePreferredInput()
	local var15 = var14.current == responsiveModule.Input.Directional
	local var16, var17 = reactFocusNavigationModule.useMostRecentOrDefaultFocusBehavior()
	local var18 = useCloseWithBackButton(var17, p1.onClose)
	local var19 = reactFocusNavigationModule.useFocusGuiObject()
	local var20, var21 = reactModule.useState(nil)
	local var22 = reactModule.useCallback(function(p2)
		-- upvalues: var21 (ref), var16 (ref)
		var21(p2)
		
		if typeof(var16) == "function" then
			var16(p2)
		end
	end, { var16 })
	reactModule.useEffect(function()
		-- upvalues: var20 (ref), var14 (ref), responsiveModule (copy), var19 (ref)
		if var20 and var14.current == responsiveModule.Input.Directional then
			var19(var20)
		end
	end, { var20, var19 })
	local var23 = useActionBarPropsModule(var2.virtualEvent, var11, {
		onClose = var2.onClose,
		onJoinEvent = var2.onJoinEvent,
		onShare = var2.onShare,
		onRsvpChanged = var13
	}, var22)
	
	return reactModule.createElement(detailsPageTemplate, {
		deviceType = var5,
		titleText = if p1.virtualEvent.eventStatus == "moderated" then "[CONTENT MODERATED]" else var2.virtualEvent.title,
		thumbnailImageUrl = var8,
		thumbnailAspectRatio = Vector2.new(16, 9),
		renderInfoContent = function()
			-- upvalues: reactModule (copy), eventTimerModule (copy), var2 (ref), var11 (ref)
			return reactModule.createElement(eventTimerModule, {
				virtualEvent = var2.virtualEvent,
				status = var11,
				currentTime = var2.currentTime
			})
		end,
		actionBarProps = if reactModule.useMemo(function()
			-- upvalues: var23 (ref)
			return var23.button or #var23.icons > 0
		end, { var23 }) then var23 else nil,
		componentList = if p1.virtualEvent.eventStatus == "cancelled" or p1.virtualEvent.eventStatus == "moderated" then {} else {
			Attendance = if var11 ~= "Elapsed" then nil else {
				portraitLayoutOrder = 1,
				landscapeLayoutOrder = 1,
				landscapePosition = contentPosition.Left,
				renderComponent = function()
					-- upvalues: reactModule (copy), attendanceModule (copy), var2 (ref), var11 (ref)
					return reactModule.createElement(attendanceModule, { virtualEvent = var2.virtualEvent, eventStatus = var11 })
				end
			},
			MediaGallery = {
				portraitLayoutOrder = 2,
				landscapeLayoutOrder = 1,
				landscapePosition = contentPosition.Right,
				renderComponent = function()
					-- upvalues: reactModule (copy), var3 (ref), var12 (ref), mediaGalleryPreview (copy), var6 (ref)
					return reactModule.createElement("Frame", {
						Size = UDim2.new(1, 0, 0, var3),
						BackgroundTransparency = 1,
						[reactModule.Change.AbsoluteSize] = var12
					}, {
						Gallery = reactModule.createElement(mediaGalleryPreview, { numberOfThumbnails = 5, items = var6 })
					})
				end
			},
			Description = {
				portraitLayoutOrder = 3,
				landscapeLayoutOrder = 2,
				landscapePosition = contentPosition.Left,
				renderComponent = function()
					-- upvalues: reactModule (copy), eventDescriptionModule (copy), var2 (ref), experienceDetails (ref)
					return reactModule.createElement(eventDescriptionModule, {
						description = var2.virtualEvent.description,
						experienceName = if experienceDetails then experienceDetails.name else nil,
						experienceThumbnail = ("rbxthumb://type=GameIcon&id=%s&w=150&h=150"):format(var2.virtualEvent.universeId),
						onExperienceTileActivated = var2.onExperienceTileActivated
					})
				end
			},
			EventInfo = if var2.virtualEvent.host then {
				portraitLayoutOrder = 4,
				landscapeLayoutOrder = 2,
				landscapePosition = contentPosition.Right,
				renderComponent = function()
					-- upvalues: reactModule (copy), listTable (copy), eventHostedByModule (copy), var2 (ref)
					return reactModule.createElement(listTable, {
						cells = {
							reactModule.createElement(eventHostedByModule, {
								host = var2.virtualEvent.host,
								onActivated = var2.onHostActivated
							})
						}
					})
				end
			} else nil
		},
		onClose = var2.onClose,
		disableStickyActionBar = var15,
		containerRef = var18
	})
end