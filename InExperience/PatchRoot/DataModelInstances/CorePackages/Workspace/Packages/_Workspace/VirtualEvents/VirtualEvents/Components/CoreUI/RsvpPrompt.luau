local textService = game:GetService("TextService")
local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local foundationModule = require(parent_1.Foundation)
local localizationModule = require(parent_1.Localization)
local reactModule = require(parent_1.React)
local UIBloxModule = require(parent_1.UIBlox)
local useScreenSize = require(parent_1.CoreScriptsRoactCommon).useScreenSize
local useRoactService = require(parent_1.RobloxAppHooks).useRoactService
local roactNetworking = require(parent_1.RoactServiceTags).RoactNetworking
local notificationModalsManagerModule = require(parent_1.NotificationModalsManager)
local gameTileModule = require(parent_1.GameTile)
local mouseIconOverrideService = require(parent_1.CoreScriptsCommon).MouseIconOverrideService
local useDesignTokens = require(parent_1.Style).useDesignTokens
local constantsModule = require(parent.constants)
local postRsvpStatusModule = require(parent.Common.postRsvpStatus)
local formatDateLocalizedModule = require(parent.Common.formatDateLocalized)
local serviceOverrideContextModule = require(parent.Components.CoreUI.ServiceOverrideContext)
local useContext = reactModule.useContext
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local loadableImage = UIBloxModule.App.Loading.LoadableImage
local useLocalization = localizationModule.Hooks.useLocalization
local text = foundationModule.Text
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local gameTileThumbnailBadges = gameTileModule.GameTileThumbnailBadges
local scrollView = foundationModule.ScrollView
local scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility
local luaAppFixRsvpPromptDescriptionScrolling = game:DefineFastFlag("LuaAppFixRsvpPromptDescriptionScrolling", false)

return function(p0)
	-- upvalues: useScreenSize (ref), useLocalization (ref), reactModule (ref), mouseIconOverrideService (ref), constantsModule (ref), useRoactService (ref), roactNetworking (ref), formatDateLocalizedModule (ref), useContext (ref), serviceOverrideContextModule (ref), postRsvpStatusModule (ref), notificationModalsManagerModule (ref), buttonType (ref), useDesignTokens (ref), useTokens (ref), luaAppFixRsvpPromptDescriptionScrolling (ref), textService (ref), loadableImage (ref), gameTileThumbnailBadges (ref), scrollView (ref), scrollBarVisibility (ref), text (ref), view (ref), interactiveAlert (ref)
	local var12 = useScreenSize()
	local var13 = p0.enableInputDelayed ~= nil or p0.enableInputDelayed
	local var14 = useLocalization({
		joinEvent = "Feature.VirtualEvents.JoinEvent",
		notifyMe = "Feature.VirtualEvents.NotifyMe",
		unfollowEvent = "Feature.VirtualEvents.UnfollowEvent",
		notNowButton = "Feature.VirtualEvents.NotNowButton",
		dateAtTime = "Feature.VirtualEvents.Label.DateAtTime",
		toastText = "Feature.VirtualEvents.Label.ReminderSetForEventTime"
	})
	reactModule.useEffect(function()
		-- upvalues: mouseIconOverrideService (copy)
		mouseIconOverrideService.push("RSVPPromptOverride", Enum.OverrideMouseIconBehavior.ForceShow)
		
		return function()
			-- upvalues: mouseIconOverrideService (copy)
			mouseIconOverrideService.pop("RSVPPromptOverride")
		end
	end, {})
	local eventDetails = p0.promptData.eventDetails
	local displayTitle = eventDetails.displayTitle
	local displayDescription = eventDetails.displayDescription
	local thumbnails = eventDetails.thumbnails
	local var15 = if thumbnails and thumbnails[1] and thumbnails[1].mediaId then thumbnails[1].mediaId else constantsModule.DEFAULT_EVENT_MEDIA_ID
	local var16 = useRoactService(roactNetworking)
	local isGoing = eventDetails.userRsvpStatus == "going"
	local none = Enum.RsvpStatus.None
	
	if eventDetails.userRsvpStatus == "going" then
		none = Enum.RsvpStatus.Going
	elseif eventDetails.userRsvpStatus == "notGoing" then
		none = Enum.RsvpStatus.NotGoing
	end
	local var18 = if isGoing then var14.unfollowEvent else var14.notifyMe
	local dateTime = nil
	local var20 = nil
	
	if eventDetails.eventTime and eventDetails.eventTime.startUtc then
		dateTime = DateTime.fromIsoDate(eventDetails.eventTime.startUtc)
		
		if dateTime then
			var20 = formatDateLocalizedModule(var14.dateAtTime, dateTime)
		end
	end
	local var21 = if isGoing then var14.unfollowEvent else var14.joinEvent
	local socialService = useContext(serviceOverrideContextModule).socialService
	local var22 = reactModule.useCallback(function()
		-- upvalues: isGoing (ref), postRsvpStatusModule (copy), var16 (ref), p0 (ref), socialService (ref), none (write), var14 (ref), displayTitle (ref), var20 (write), notificationModalsManagerModule (copy)
		if isGoing then
			postRsvpStatusModule(var16, p0.promptData.eventId, "notGoing"):andThen(function()
				-- upvalues: socialService (copy), p0 (copy), none (copy)
				socialService:PromptRsvpToEventCompleted(p0.promptData.eventId, true, Enum.RsvpStatus.NotGoing, none)
			end, function(p1)
				-- upvalues: socialService (copy), p0 (copy), none (copy)
				socialService:PromptRsvpToEventCompleted(p0.promptData.eventId, false, Enum.RsvpStatus.None, none)
				warn("Error updating rsvp status: ", p1)
			end)
		else
			postRsvpStatusModule(var16, p0.promptData.eventId, "going"):andThen(function()
				-- upvalues: socialService (copy), p0 (copy), none (copy), var14 (copy), displayTitle (copy), var20 (copy), notificationModalsManagerModule (copy)
				socialService:PromptRsvpToEventCompleted(p0.promptData.eventId, true, Enum.RsvpStatus.Going, none)
				notificationModalsManagerModule.SetUIBloxToast({
					toastTitle = var14.toastText:gsub("{(.-)}", { eventName = displayTitle, eventTime = var20 }),
					sequenceNumber = DateTime.now().UnixTimestamp
				})
			end, function(p2)
				-- upvalues: socialService (copy), p0 (copy), none (copy)
				socialService:PromptRsvpToEventCompleted(p0.promptData.eventId, false, Enum.RsvpStatus.None, none)
				warn("Error updating rsvp status: ", p2)
			end)
		end
		p0.closePrompt()
	end, { socialService, p0.closePrompt, isGoing })
	local var23 = reactModule.useCallback(function()
		-- upvalues: eventDetails (ref), socialService (ref), p0 (ref), none (write)
		local none_1 = Enum.RsvpStatus.None
		
		if eventDetails.userRsvpStatus == "notGoing" then
			none_1 = Enum.RsvpStatus.NotGoing
		elseif eventDetails.userRsvpStatus == "going" then
			none_1 = Enum.RsvpStatus.Going
		end
		socialService:PromptRsvpToEventCompleted(p0.promptData.eventId, true, none_1, none)
		p0.closePrompt()
	end, {
		socialService,
		p0.closePrompt,
		eventDetails.userRsvpStatus
	})
	local var24 = reactModule.useMemo(function()
		-- upvalues: buttonType (copy), var13 (ref), var22 (ref), var18 (write)
		return {
			buttons = {
				{
					buttonType = buttonType.PrimaryContextual,
					props = {
						delayInputSeconds = 2,
						enableInputDelayed = var13,
						isDelayedInput = var13,
						onActivated = var22,
						text = var18
					}
				}
			}
		}
	end, { var14, var22, var13, var18 })
	local var25, var26 = reactModule.useState(Vector2.new(0, 0))
	local var27 = reactModule.useCallback(function(p3)
		-- upvalues: var26 (ref)
		var26(p3.AbsoluteSize)
	end, { var26 })
	local var28, var29 = reactModule.useState(0)
	local var30, var31 = reactModule.useState(0)
	local var32 = reactModule.useRef(nil)
	local var33 = reactModule.useRef(nil)
	local var34 = reactModule.useCallback(function(p4)
		-- upvalues: var29 (ref)
		local ceiled = math.ceil(p4.TextBounds.Y)
		
		if ceiled > 0 then
			var29(function(p5)
				-- upvalues: ceiled (ref)
				return if ceiled == p5 then p5 else ceiled
			end)
		end
	end, { var29 })
	local size300 = useDesignTokens().Size.Size_300
	local var35 = useTokens()
	local bodyLarge = var35.Typography.BodyLarge
	local overrideUseWideMode = p0.overrideUseWideMode or (var12.Y < 600 and var12.Y < var12.X)
	reactModule.useEffect(function()
		-- upvalues: luaAppFixRsvpPromptDescriptionScrolling (copy), var29 (ref)
		if luaAppFixRsvpPromptDescriptionScrolling then
			var29(0)
		end
	end, { overrideUseWideMode, displayDescription })
	reactModule.useEffect(function()
		-- upvalues: luaAppFixRsvpPromptDescriptionScrolling (copy), var33 (ref), var31 (ref), var32 (ref), displayDescription (ref), textService (copy), var29 (ref)
		if luaAppFixRsvpPromptDescriptionScrolling then
			if var33.current then
				var31(var33.current.AbsoluteSize.Y)
			end
			return
		elseif not var32.current then return end
		local getTextBoundsParams = Instance.new("GetTextBoundsParams")
		getTextBoundsParams.Text = displayDescription
		getTextBoundsParams.Font = var32.current.FontFace
		getTextBoundsParams.Size = var32.current.TextSize
		getTextBoundsParams.Width = var32.current.AbsoluteSize.X
		var29(textService:GetTextBoundsAsync(getTextBoundsParams).Y * var32.current.LineHeight)
		
		if var33.current then
			var31(var33.current.AbsoluteSize.Y)
		end
	end, { var32, var25.X, displayDescription, overrideUseWideMode })
	
	return reactModule.createElement(interactiveAlert, {
		isMiddleContentFocusable = false,
		onCloseClicked = var23,
		buttonStackInfo = var24,
		middleContent = reactModule.useCallback(function()
			-- upvalues: var12 (ref), overrideUseWideMode (ref), var25 (ref), constantsModule (copy), luaAppFixRsvpPromptDescriptionScrolling (copy), var30 (ref), size300 (ref), var28 (ref), reactModule (copy), loadableImage (copy), var15 (write), dateTime (write), gameTileThumbnailBadges (copy), var20 (write), displayDescription (ref), bodyLarge (ref), var35 (ref), var34 (ref), var32 (ref), scrollView (copy), scrollBarVisibility (copy), text (copy), view (copy), var27 (ref), displayTitle (ref), var33 (ref)
			local var39 = var12.Y - 80 - 200
			
			if var39 < 80 then
				var39 = 80
			end
			if overrideUseWideMode then
				local var40 = var25.X * 0.6
				
				if var40 * 1 / constantsModule.THUMBNAIL_ASPECT_RATIO < var39 then
					var39 = var40 * 1 / constantsModule.THUMBNAIL_ASPECT_RATIO
				end
				if luaAppFixRsvpPromptDescriptionScrolling then
					var39 = math.max(var39 - var30 - size300, 80)
				end
			end
			local var41 = if luaAppFixRsvpPromptDescriptionScrolling and var28 == 0 then 80 else var28
			local minValue = math.min(var41, var39)
			local var43 = var39
			
			if not overrideUseWideMode then
				local var44 = if luaAppFixRsvpPromptDescriptionScrolling then math.max(var39 - var30 - size300 * 2, 80) else var39
				minValue = if luaAppFixRsvpPromptDescriptionScrolling then math.min(var41, var44 * 0.4) else math.min(var28, var44 * 0.4)
				var43 = var44 - minValue
			end
			local var47
			local frame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				AutomaticSize = if overrideUseWideMode then Enum.AutomaticSize.X else Enum.AutomaticSize.Y,
				Size = if overrideUseWideMode then UDim2.new(0.6, 0, 0, var43) else UDim2.new(1, 0, 0, var43)
			}, {
				Thumbnail = reactModule.createElement(loadableImage, {
					BackgroundTransparency = 1,
					useShimmerAnimationWhileLoading = true,
					showFailedStateWhenLoadingFailed = true,
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Size = UDim2.fromScale(1, 1),
					Image = "rbxassetid://" .. var15,
					cornerRadius = UDim.new(0, 8)
				}),
				AspectRatioConstraint = reactModule.createElement("UIAspectRatioConstraint", {
					AspectRatio = constantsModule.THUMBNAIL_ASPECT_RATIO,
					DominantAxis = Enum.DominantAxis.Width,
					AspectType = Enum.AspectType.FitWithinMaxSize
				}),
				Overlay = if dateTime then reactModule.createElement("Frame", {
					ZIndex = 2,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1)
				}, {
					Badge = reactModule.createElement(gameTileThumbnailBadges, {
						tileBadgesByPosition = {
							ImageTopLeft = { { tileBadgeType = "Text", text = var20 } }
						}
					})
				}) else nil
			})
			local var46 = if overrideUseWideMode then if luaAppFixRsvpPromptDescriptionScrolling then UDim2.new(0.4, -size300, 0, minValue) else UDim2.new(0.4, 0, 0, minValue) else UDim2.new(1, 0, 0, minValue)
			local _ = nil
			
			if luaAppFixRsvpPromptDescriptionScrolling then
				local var48 = if var28 > 0 then var28 else 10000
				var47 = reactModule.createElement("ScrollingFrame", {
					LayoutOrder = 3,
					ScrollBarThickness = 0,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					ClipsDescendants = true,
					Size = var46,
					CanvasSize = UDim2.new(0, 0, 0, var48 + 2),
					ScrollingDirection = Enum.ScrollingDirection.Y
				}, {
					Body = reactModule.createElement("TextLabel", {
						Size = UDim2.new(1, 0, 0, var48),
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Text = displayDescription,
						TextTruncate = Enum.TextTruncate.None,
						TextWrapped = true,
						FontFace = Font.fromEnum(bodyLarge.Font),
						TextSize = bodyLarge.FontSize,
						LineHeight = bodyLarge.LineHeight,
						TextColor3 = var35.Color.Content.Emphasis.Color3,
						TextTransparency = var35.Color.Content.Emphasis.Transparency,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Top,
						[reactModule.Change.TextBounds] = var34,
						ref = var32
					})
				})
			else
				var47 = reactModule.createElement(scrollView, {
					tag = "col align-y-top",
					LayoutOrder = 3,
					scroll = {
						AutomaticCanvasSize = Enum.AutomaticSize.Y,
						CanvasSize = UDim2.fromScale(1, 0),
						scrollBarVisibility = scrollBarVisibility.Auto,
						ScrollingDirection = Enum.ScrollingDirection.Y,
						VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
					},
					Size = var46
				}, {
					Body = reactModule.createElement(text, {
						tag = "size-full-0 text-body-large text-align-y-top text-align-x-left",
						TextWrapped = true,
						Text = displayDescription,
						Size = UDim2.new(1, 0, 0, var28),
						padding = Vector2.new(0, 0),
						ref = var32
					})
				})
			end
			return if overrideUseWideMode then reactModule.createElement(view, {
				tag = "col align-x-center size-full-0 auto-y gap-medium",
				Size = UDim2.new(1, 0, 0, 0),
				onAbsoluteSizeChanged = var27
			}, {
				Title = reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-title-large text-align-x-left",
					LayoutOrder = 1,
					Text = displayTitle,
					ref = var33
				}),
				Contents = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = {
						["row align-y-top gap-medium size-full-0"] = luaAppFixRsvpPromptDescriptionScrolling,
						["row align-y-center gap-medium size-full-0"] = not luaAppFixRsvpPromptDescriptionScrolling
					},
					Size = UDim2.new(1, 0, 0, var43)
				}, { ThumbnailFrame = frame, BodyScrollView = var47 })
			}) else reactModule.createElement(view, {
				tag = "col align-x-center size-full-0 auto-y gap-medium",
				Size = UDim2.new(1, 0, 0, 0),
				onAbsoluteSizeChanged = var27
			}, {
				ThumbnailFrame = frame,
				Title = reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-title-large text-align-x-left",
					LayoutOrder = 2,
					Text = displayTitle,
					ref = var33
				}),
				BodyScrollView = var47
			})
		end, {
			var15, displayTitle, displayDescription, dateTime, var20, var25, var28, var27,
			var12, size300, var30, var35, bodyLarge, var34, overrideUseWideMode,
			p0.overrideUseWideMode
		}),
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = var12,
		title = var21
	})
end