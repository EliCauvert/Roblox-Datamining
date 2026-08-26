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

return function(p1)
	-- upvalues: useScreenSize (ref), useLocalization (ref), reactModule (ref), mouseIconOverrideService (ref), constantsModule (ref), useRoactService (ref), roactNetworking (ref), formatDateLocalizedModule (ref), useContext (ref), serviceOverrideContextModule (ref), postRsvpStatusModule (ref), notificationModalsManagerModule (ref), buttonType (ref), useDesignTokens (ref), useTokens (ref), luaAppFixRsvpPromptDescriptionScrolling (ref), textService (ref), loadableImage (ref), gameTileThumbnailBadges (ref), scrollView (ref), scrollBarVisibility (ref), text (ref), view (ref), interactiveAlert (ref)
	local var1 = useScreenSize()
	local var2 = p1.enableInputDelayed ~= nil or p1.enableInputDelayed
	local var3 = useLocalization({
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
	local eventDetails = p1.promptData.eventDetails
	local displayTitle = eventDetails.displayTitle
	local displayDescription = eventDetails.displayDescription
	local thumbnails = eventDetails.thumbnails
	local var4 = if thumbnails and thumbnails[1] and thumbnails[1].mediaId then thumbnails[1].mediaId else constantsModule.DEFAULT_EVENT_MEDIA_ID
	local var5 = useRoactService(roactNetworking)
	local isGoing = eventDetails.userRsvpStatus == "going"
	local none = Enum.RsvpStatus.None
	
	if eventDetails.userRsvpStatus == "going" then
		none = Enum.RsvpStatus.Going
	elseif eventDetails.userRsvpStatus == "notGoing" then
		none = Enum.RsvpStatus.NotGoing
	end
	local var6 = if isGoing then var3.unfollowEvent else var3.notifyMe
	local dateTime = nil
	local var7 = nil
	
	if eventDetails.eventTime and eventDetails.eventTime.startUtc then
		dateTime = DateTime.fromIsoDate(eventDetails.eventTime.startUtc)
		
		if dateTime then
			var7 = formatDateLocalizedModule(var3.dateAtTime, dateTime)
		end
	end
	local var8 = if isGoing then var3.unfollowEvent else var3.joinEvent
	local socialService = useContext(serviceOverrideContextModule).socialService
	local var9 = reactModule.useCallback(function()
		-- upvalues: isGoing (ref), postRsvpStatusModule (copy), var5 (ref), p1 (ref), socialService (ref), none (write), var3 (ref), displayTitle (ref), var7 (write), notificationModalsManagerModule (copy)
		if isGoing then
			postRsvpStatusModule(var5, p1.promptData.eventId, "notGoing"):andThen(function()
				-- upvalues: socialService (copy), p1 (copy), none (copy)
				socialService:PromptRsvpToEventCompleted(p1.promptData.eventId, true, Enum.RsvpStatus.NotGoing, none)
			end, function(p2)
				-- upvalues: socialService (copy), p1 (copy), none (copy)
				socialService:PromptRsvpToEventCompleted(p1.promptData.eventId, false, Enum.RsvpStatus.None, none)
				warn("Error updating rsvp status: ", p2)
			end)
		else
			postRsvpStatusModule(var5, p1.promptData.eventId, "going"):andThen(function()
				-- upvalues: socialService (copy), p1 (copy), none (copy), var3 (copy), displayTitle (copy), var7 (copy), notificationModalsManagerModule (copy)
				socialService:PromptRsvpToEventCompleted(p1.promptData.eventId, true, Enum.RsvpStatus.Going, none)
				notificationModalsManagerModule.SetUIBloxToast({
					toastTitle = var3.toastText:gsub("{(.-)}", { eventName = displayTitle, eventTime = var7 }),
					sequenceNumber = DateTime.now().UnixTimestamp
				})
			end, function(p2)
				-- upvalues: socialService (copy), p1 (copy), none (copy)
				socialService:PromptRsvpToEventCompleted(p1.promptData.eventId, false, Enum.RsvpStatus.None, none)
				warn("Error updating rsvp status: ", p2)
			end)
		end
		p1.closePrompt()
	end, { socialService, p1.closePrompt, isGoing })
	local var10 = reactModule.useCallback(function()
		-- upvalues: eventDetails (ref), socialService (ref), p1 (ref), none (write)
		local none_1 = Enum.RsvpStatus.None
		
		if eventDetails.userRsvpStatus == "notGoing" then
			none_1 = Enum.RsvpStatus.NotGoing
		elseif eventDetails.userRsvpStatus == "going" then
			none_1 = Enum.RsvpStatus.Going
		end
		socialService:PromptRsvpToEventCompleted(p1.promptData.eventId, true, none_1, none)
		p1.closePrompt()
	end, {
		socialService,
		p1.closePrompt,
		eventDetails.userRsvpStatus
	})
	local var11 = reactModule.useMemo(function()
		-- upvalues: buttonType (copy), var2 (ref), var9 (ref), var6 (write)
		return {
			buttons = {
				{
					buttonType = buttonType.PrimaryContextual,
					props = {
						delayInputSeconds = 2,
						enableInputDelayed = var2,
						isDelayedInput = var2,
						onActivated = var9,
						text = var6
					}
				}
			}
		}
	end, { var3, var9, var2, var6 })
	local var12, var13 = reactModule.useState(Vector2.new(0, 0))
	local var14 = reactModule.useCallback(function(p2)
		-- upvalues: var13 (ref)
		var13(p2.AbsoluteSize)
	end, { var13 })
	local var15, var16 = reactModule.useState(0)
	local var17, var18 = reactModule.useState(0)
	local var19 = reactModule.useRef(nil)
	local var20 = reactModule.useRef(nil)
	local var21 = reactModule.useCallback(function(p2)
		-- upvalues: var16 (ref)
		local ceiled = math.ceil(p2.TextBounds.Y)
		
		if ceiled > 0 then
			var16(function(p3)
				-- upvalues: ceiled (ref)
				return if ceiled == p3 then p3 else ceiled
			end)
		end
	end, { var16 })
	local size300 = useDesignTokens().Size.Size_300
	local var22 = useTokens()
	local bodyLarge = var22.Typography.BodyLarge
	local overrideUseWideMode = p1.overrideUseWideMode or (var1.Y < 600 and var1.Y < var1.X)
	reactModule.useEffect(function()
		-- upvalues: luaAppFixRsvpPromptDescriptionScrolling (copy), var16 (ref)
		if luaAppFixRsvpPromptDescriptionScrolling then
			var16(0)
		end
	end, { overrideUseWideMode, displayDescription })
	reactModule.useEffect(function()
		-- upvalues: luaAppFixRsvpPromptDescriptionScrolling (copy), var20 (ref), var18 (ref), var19 (ref), displayDescription (ref), textService (copy), var16 (ref)
		if luaAppFixRsvpPromptDescriptionScrolling then
			if var20.current then
				var18(var20.current.AbsoluteSize.Y)
			end
			return
		elseif not var19.current then return end
		local getTextBoundsParams = Instance.new("GetTextBoundsParams")
		getTextBoundsParams.Text = displayDescription
		getTextBoundsParams.Font = var19.current.FontFace
		getTextBoundsParams.Size = var19.current.TextSize
		getTextBoundsParams.Width = var19.current.AbsoluteSize.X
		var16(textService:GetTextBoundsAsync(getTextBoundsParams).Y * var19.current.LineHeight)
		
		if var20.current then
			var18(var20.current.AbsoluteSize.Y)
		end
	end, { var19, var12.X, displayDescription, overrideUseWideMode })
	
	return reactModule.createElement(interactiveAlert, {
		isMiddleContentFocusable = false,
		onCloseClicked = var10,
		buttonStackInfo = var11,
		middleContent = reactModule.useCallback(function()
			-- upvalues: var1 (ref), overrideUseWideMode (ref), var12 (ref), constantsModule (copy), luaAppFixRsvpPromptDescriptionScrolling (copy), var17 (ref), size300 (ref), var15 (ref), reactModule (copy), loadableImage (copy), var4 (write), dateTime (write), gameTileThumbnailBadges (copy), var7 (write), displayDescription (ref), bodyLarge (ref), var22 (ref), var21 (ref), var19 (ref), scrollView (copy), scrollBarVisibility (copy), text (copy), view (copy), var14 (ref), displayTitle (ref), var20 (ref)
			local var23 = var1.Y - 80 - 200
			
			if var23 < 80 then
				var23 = 80
			end
			if overrideUseWideMode then
				local var24 = var12.X * 0.6
				
				if var24 * 1 / constantsModule.THUMBNAIL_ASPECT_RATIO < var23 then
					var23 = var24 * 1 / constantsModule.THUMBNAIL_ASPECT_RATIO
				end
				if luaAppFixRsvpPromptDescriptionScrolling then
					var23 = math.max(var23 - var17 - size300, 80)
				end
			end
			local var25 = if luaAppFixRsvpPromptDescriptionScrolling and var15 == 0 then 80 else var15
			local minValue = math.min(var25, var23)
			local var26 = var23
			
			if not overrideUseWideMode then
				local var27 = if luaAppFixRsvpPromptDescriptionScrolling then math.max(var23 - var17 - size300 * 2, 80) else var23
				minValue = if luaAppFixRsvpPromptDescriptionScrolling then math.min(var25, var27 * 0.4) else math.min(var15, var27 * 0.4)
				var26 = var27 - minValue
			end
			local var28
			local frame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				AutomaticSize = if overrideUseWideMode then Enum.AutomaticSize.X else Enum.AutomaticSize.Y,
				Size = if overrideUseWideMode then UDim2.new(0.6, 0, 0, var26) else UDim2.new(1, 0, 0, var26)
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
							ImageTopLeft = { { tileBadgeType = "Text", text = var7 } }
						}
					})
				}) else nil
			})
			local var29 = if overrideUseWideMode then if luaAppFixRsvpPromptDescriptionScrolling then UDim2.new(0.4, -size300, 0, minValue) else UDim2.new(0.4, 0, 0, minValue) else UDim2.new(1, 0, 0, minValue)
			local _ = nil
			
			if luaAppFixRsvpPromptDescriptionScrolling then
				local var30 = if var15 > 0 then var15 else 10000
				var28 = reactModule.createElement("ScrollingFrame", {
					LayoutOrder = 3,
					ScrollBarThickness = 0,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					ClipsDescendants = true,
					Size = var29,
					CanvasSize = UDim2.new(0, 0, 0, var30 + 2),
					ScrollingDirection = Enum.ScrollingDirection.Y
				}, {
					Body = reactModule.createElement("TextLabel", {
						Size = UDim2.new(1, 0, 0, var30),
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Text = displayDescription,
						TextTruncate = Enum.TextTruncate.None,
						TextWrapped = true,
						FontFace = Font.fromEnum(bodyLarge.Font),
						TextSize = bodyLarge.FontSize,
						LineHeight = bodyLarge.LineHeight,
						TextColor3 = var22.Color.Content.Emphasis.Color3,
						TextTransparency = var22.Color.Content.Emphasis.Transparency,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Top,
						[reactModule.Change.TextBounds] = var21,
						ref = var19
					})
				})
			else
				var28 = reactModule.createElement(scrollView, {
					tag = "col align-y-top",
					LayoutOrder = 3,
					scroll = {
						AutomaticCanvasSize = Enum.AutomaticSize.Y,
						CanvasSize = UDim2.fromScale(1, 0),
						scrollBarVisibility = scrollBarVisibility.Auto,
						ScrollingDirection = Enum.ScrollingDirection.Y,
						VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
					},
					Size = var29
				}, {
					Body = reactModule.createElement(text, {
						tag = "size-full-0 text-body-large text-align-y-top text-align-x-left",
						TextWrapped = true,
						Text = displayDescription,
						Size = UDim2.new(1, 0, 0, var15),
						padding = Vector2.new(0, 0),
						ref = var19
					})
				})
			end
			return if overrideUseWideMode then reactModule.createElement(view, {
				tag = "col align-x-center size-full-0 auto-y gap-medium",
				Size = UDim2.new(1, 0, 0, 0),
				onAbsoluteSizeChanged = var14
			}, {
				Title = reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-title-large text-align-x-left",
					LayoutOrder = 1,
					Text = displayTitle,
					ref = var20
				}),
				Contents = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = {
						["row align-y-top gap-medium size-full-0"] = luaAppFixRsvpPromptDescriptionScrolling,
						["row align-y-center gap-medium size-full-0"] = not luaAppFixRsvpPromptDescriptionScrolling
					},
					Size = UDim2.new(1, 0, 0, var26)
				}, { ThumbnailFrame = frame, BodyScrollView = var28 })
			}) else reactModule.createElement(view, {
				tag = "col align-x-center size-full-0 auto-y gap-medium",
				Size = UDim2.new(1, 0, 0, 0),
				onAbsoluteSizeChanged = var14
			}, {
				ThumbnailFrame = frame,
				Title = reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-title-large text-align-x-left",
					LayoutOrder = 2,
					Text = displayTitle,
					ref = var20
				}),
				BodyScrollView = var28
			})
		end, {
			var4, displayTitle, displayDescription, dateTime, var7, var12, var15, var14,
			var1, size300, var17, var22, bodyLarge, var21, overrideUseWideMode,
			p1.overrideUseWideMode
		}),
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = var1,
		title = var8
	})
end