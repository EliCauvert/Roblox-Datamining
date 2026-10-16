local TextService = game:GetService("TextService")
local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local FoundationModule = require(Parent1.Foundation)
local ReactModule = require(Parent1.React)
local UIBloxModule = require(Parent1.UIBlox)
local UseScreenSizeFunction = require(Parent1.CoreScriptsRoactCommon).useScreenSize
local UseRoactServiceFunction = require(Parent1.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent1.RoactServiceTags).RoactNetworking
local NotificationModalsManagerModule = require(Parent1.NotificationModalsManager)
local MouseIconOverrideService = require(Parent1.CoreScriptsCommon).MouseIconOverrideService
local UseDesignTokensFunction = require(Parent1.Style).useDesignTokens
local ConstantsModule = require(Parent.constants)
local PostRsvpStatusModule = require(Parent.Common.postRsvpStatus)
local FormatDateLocalizedModule = require(Parent.Common.formatDateLocalized)
local ServiceOverrideContextModule = require(Parent.Components.CoreUI.ServiceOverrideContext)
local UseContextFunction = ReactModule.useContext
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local GetTextBoundsAsyncFunction = FoundationModule.Utility.getTextBoundsAsync
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local GameTileThumbnailBadges = require(Parent1.GameTile).GameTileThumbnailBadges
local ScrollView = FoundationModule.ScrollView
local ScrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility
local LuaAppFixRsvpPromptDescriptionScrolling = game:DefineFastFlag("LuaAppFixRsvpPromptDescriptionScrolling", false)

return function(p1) --[[ Line: 77 ]]
	-- upvalues: UseScreenSizeFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), MouseIconOverrideService (copy), ConstantsModule (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), FormatDateLocalizedModule (copy), UseContextFunction (copy), ServiceOverrideContextModule (copy), PostRsvpStatusModule (copy), NotificationModalsManagerModule (copy), ButtonType (copy), UseDesignTokensFunction (copy), UseTokensFunction (copy), LuaAppFixRsvpPromptDescriptionScrolling (copy), FoundationFontFaceMigration (copy), GetTextBoundsAsyncFunction (copy), TextService (copy), LoadableImage (copy), GameTileThumbnailBadges (copy), NormalizeFontFaceFunction (copy), ScrollView (copy), ScrollBarVisibility (copy), Text (copy), View (copy), InteractiveAlert (copy)
	local UseScreenSizeResult = UseScreenSizeFunction()
	local NoEnableInputDelayed = p1.enableInputDelayed == nil or p1.enableInputDelayed
	local UseLocalizationResult = UseLocalizationFunction({
		joinEvent = "Feature.VirtualEvents.JoinEvent",
		notifyMe = "Feature.VirtualEvents.NotifyMe",
		unfollowEvent = "Feature.VirtualEvents.UnfollowEvent",
		notNowButton = "Feature.VirtualEvents.NotNowButton",
		dateAtTime = "Feature.VirtualEvents.Label.DateAtTime",
		toastText = "Feature.VirtualEvents.Label.ReminderSetForEventTime"
	})
	ReactModule.useEffect(function() --[[ Line: 91 ]]
		-- upvalues: MouseIconOverrideService (upval)
		MouseIconOverrideService.push("RSVPPromptOverride", Enum.OverrideMouseIconBehavior.ForceShow)
		
		return function() --[[ Line: 94 ]]
			-- upvalues: MouseIconOverrideService (upval)
			MouseIconOverrideService.pop("RSVPPromptOverride")
		end
	end, {})
	local EventDetails = p1.promptData.eventDetails
	local DisplayTitle = EventDetails.displayTitle
	local DisplayDescription = EventDetails.displayDescription
	local Thumbnails = EventDetails.thumbnails
	local MediaId = if Thumbnails and Thumbnails[1] and Thumbnails[1].mediaId then Thumbnails[1].mediaId else ConstantsModule.DEFAULT_EVENT_MEDIA_ID
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local IsGoing = EventDetails.userRsvpStatus == "going"
	local Going = if EventDetails.userRsvpStatus == "going" then Enum.RsvpStatus.Going elseif EventDetails.userRsvpStatus == "notGoing" then Enum.RsvpStatus.NotGoing else Enum.RsvpStatus.None
	local UnfollowEvent = if IsGoing then UseLocalizationResult.unfollowEvent else UseLocalizationResult.notifyMe
	local v1 = nil
	local EventTime = nil
	
	if EventDetails.eventTime and EventDetails.eventTime.startUtc then
		v1 = DateTime.fromIsoDate(EventDetails.eventTime.startUtc)
		
		if v1 then
			EventTime = FormatDateLocalizedModule(UseLocalizationResult.dateAtTime, v1)
		end
	end
	local UnfollowEvent1 = if IsGoing then UseLocalizationResult.unfollowEvent else UseLocalizationResult.joinEvent
	local SocialService = UseContextFunction(ServiceOverrideContextModule).socialService
	local UseResult = ReactModule.useCallback(function() --[[ Line: 145 ]]
		-- upvalues: IsGoing (copy), PostRsvpStatusModule (upval), UseRoactServiceResult (copy), p1 (copy), SocialService (copy), Going (ref), UseLocalizationResult (copy), DisplayTitle (copy), EventTime (ref), NotificationModalsManagerModule (upval)
		if IsGoing then
			PostRsvpStatusModule(UseRoactServiceResult, p1.promptData.eventId, "notGoing"):andThen(function() --[[ Line: 147 ]]
				-- upvalues: SocialService (upval), p1 (upval), Going (upval)
				SocialService:PromptRsvpToEventCompleted(p1.promptData.eventId, true, Enum.RsvpStatus.NotGoing, Going)
			end, function(p2) --[[ Line: 154 ]]
				-- upvalues: SocialService (upval), p1 (upval), Going (upval)
				SocialService:PromptRsvpToEventCompleted(p1.promptData.eventId, false, Enum.RsvpStatus.None, Going)
				warn("Error updating rsvp status: ", p2)
			end)
		else
			PostRsvpStatusModule(UseRoactServiceResult, p1.promptData.eventId, "going"):andThen(function() --[[ Line: 164 ]]
				-- upvalues: SocialService (upval), p1 (upval), Going (upval), UseLocalizationResult (upval), DisplayTitle (upval), EventTime (upval), NotificationModalsManagerModule (upval)
				SocialService:PromptRsvpToEventCompleted(p1.promptData.eventId, true, Enum.RsvpStatus.Going, Going)
				NotificationModalsManagerModule.SetUIBloxToast({
					toastTitle = UseLocalizationResult.toastText:gsub("{(.-)}", { eventName = DisplayTitle, eventTime = EventTime }),
					sequenceNumber = DateTime.now().UnixTimestamp
				})
			end, function(p2) --[[ Line: 181 ]]
				-- upvalues: SocialService (upval), p1 (upval), Going (upval)
				SocialService:PromptRsvpToEventCompleted(p1.promptData.eventId, false, Enum.RsvpStatus.None, Going)
				warn("Error updating rsvp status: ", p2)
			end)
		end
		p1.closePrompt()
	end, { SocialService, p1.closePrompt, IsGoing })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 194 ]]
		-- upvalues: EventDetails (copy), SocialService (copy), p1 (copy), Going (ref)
		SocialService:PromptRsvpToEventCompleted(p1.promptData.eventId, true, if EventDetails.userRsvpStatus == "notGoing" then Enum.RsvpStatus.NotGoing elseif EventDetails.userRsvpStatus == "going" then Enum.RsvpStatus.Going else Enum.RsvpStatus.None, Going)
		p1.closePrompt()
	end, {
		SocialService,
		p1.closePrompt,
		EventDetails.userRsvpStatus
	})
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 206 ]]
		-- upvalues: ButtonType (upval), NoEnableInputDelayed (copy), UseResult (copy), UnfollowEvent (ref)
		return {
			buttons = {
				{
					buttonType = ButtonType.PrimaryContextual,
					props = {
						delayInputSeconds = 2,
						enableInputDelayed = NoEnableInputDelayed,
						isDelayedInput = NoEnableInputDelayed,
						onActivated = UseResult,
						text = UnfollowEvent
					}
				}
			}
		}
	end, {
		UseLocalizationResult,
		UseResult,
		NoEnableInputDelayed,
		UnfollowEvent
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(0, 0))
	local UseResult2 = ReactModule.useCallback(function(Frame) --[[ Line: 225 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize)
	end, { UseStateResult2 })
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(0)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseResult3 = ReactModule.useCallback(function(Label) --[[ Line: 235 ]]
		-- upvalues: UseStateResult2_1 (copy)
		local Ceiled = math.ceil(Label.TextBounds.Y)
		
		if Ceiled > 0 then
			UseStateResult2_1(function(Ceiled1) --[[ Line: 238 ]]
				-- upvalues: Ceiled (copy)
				return if Ceiled == Ceiled1 then Ceiled1 else Ceiled
			end)
		end
	end, { UseStateResult2_1 })
	local Size300 = UseDesignTokensFunction().Size.Size_300
	local UseTokensResult = UseTokensFunction()
	local BodyLarge = UseTokensResult.Typography.BodyLarge
	local OverrideUseWideMode = p1.overrideUseWideMode or UseScreenSizeResult.Y < 600 and UseScreenSizeResult.Y < UseScreenSizeResult.X
	ReactModule.useEffect(function() --[[ Line: 258 ]]
		-- upvalues: LuaAppFixRsvpPromptDescriptionScrolling (upval), UseStateResult2_1 (copy)
		if LuaAppFixRsvpPromptDescriptionScrolling then
			UseStateResult2_1(0)
		end
	end, { OverrideUseWideMode, DisplayDescription })
	ReactModule.useEffect(function() --[[ Line: 264 ]]
		-- upvalues: LuaAppFixRsvpPromptDescriptionScrolling (upval), UseRefResult1 (copy), UseStateResult2_2 (copy), FoundationFontFaceMigration (upval), UseRefResult (copy), GetTextBoundsAsyncFunction (upval), DisplayDescription (copy), UseStateResult2_1 (copy), TextService (upval)
		if LuaAppFixRsvpPromptDescriptionScrolling then
			if UseRefResult1.current then
				UseStateResult2_2(UseRefResult1.current.AbsoluteSize.Y)
			end
			return
		elseif FoundationFontFaceMigration then
			local Current = UseRefResult.current
			
			if not Current then return end
			local Current1 = false
			task.spawn(function() --[[ Line: 279 ]]
				-- upvalues: GetTextBoundsAsyncFunction (upval), DisplayDescription (upval), Current (copy), Current1 (ref), UseStateResult2_1 (upval), UseRefResult1 (upval), UseStateResult2_2 (upval)
				local TextBoundsAsync = GetTextBoundsAsyncFunction(DisplayDescription, Current.FontFace, Current.TextSize, Current.AbsoluteSize.X)
				
				if Current1 or not TextBoundsAsync then return end
				UseStateResult2_1(TextBoundsAsync.Y * Current.LineHeight)
				
				if UseRefResult1.current then
					UseStateResult2_2(UseRefResult1.current.AbsoluteSize.Y)
				end
			end)
			
			return function() --[[ Line: 298 ]]
				-- upvalues: Current1 (ref)
				Current1 = true
			end
		elseif not UseRefResult.current then return end
		local Current1 = "GetTextBoundsParams"
		local NewInstance = Instance.new(Current1)
		Current1 = DisplayDescription
		NewInstance.Text = Current1
		Current1 = UseRefResult
		Current1 = Current1.current
		Current1 = Current1.FontFace
		NewInstance.Font = Current1
		Current1 = UseRefResult
		Current1 = Current1.current
		Current1 = Current1.TextSize
		NewInstance.Size = Current1
		Current1 = UseRefResult
		Current1 = Current1.current
		Current1 = Current1.AbsoluteSize
		Current1 = Current1.X
		NewInstance.Width = Current1
		Current1 = TextService
		Current1 = Current1:GetTextBoundsAsync(NewInstance)
		UseStateResult2_1(Current1.Y * UseRefResult.current.LineHeight)
		
		if UseRefResult1.current then
			UseStateResult2_2(UseRefResult1.current.AbsoluteSize.Y)
		end
	end, {
		UseRefResult,
		UseStateResult.X,
		DisplayDescription,
		OverrideUseWideMode
	})
	
	return ReactModule.createElement(InteractiveAlert, {
		isMiddleContentFocusable = false,
		onCloseClicked = UseResult1,
		buttonStackInfo = UseMemoResult,
		middleContent = ReactModule.useCallback(function() --[[ Line: 322 ]]
			-- upvalues: UseScreenSizeResult (copy), OverrideUseWideMode (copy), UseStateResult (copy), ConstantsModule (upval), LuaAppFixRsvpPromptDescriptionScrolling (upval), UseStateResult3 (copy), Size300 (copy), UseStateResult1 (copy), ReactModule (upval), LoadableImage (upval), MediaId (ref), v1 (ref), GameTileThumbnailBadges (upval), EventTime (ref), DisplayDescription (copy), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval), BodyLarge (copy), UseTokensResult (copy), UseResult3 (copy), UseRefResult (copy), ScrollView (upval), ScrollBarVisibility (upval), Text (upval), View (upval), UseResult2 (copy), DisplayTitle (copy), UseRefResult1 (copy)
			local YDelta = UseScreenSizeResult.Y - 80 - 200
			
			if YDelta < 80 then
				YDelta = 80
			end
			if OverrideUseWideMode then
				local ScaledX = UseStateResult.X * 0.6
				
				if ScaledX * 1 / ConstantsModule.THUMBNAIL_ASPECT_RATIO < YDelta then
					YDelta = ScaledX * 1 / ConstantsModule.THUMBNAIL_ASPECT_RATIO
				end
				if LuaAppFixRsvpPromptDescriptionScrolling then
					YDelta = math.max(YDelta - UseStateResult3 - Size300, 80)
				end
			end
			local UseStateResult2 = if LuaAppFixRsvpPromptDescriptionScrolling and UseStateResult1 == 0 then 80 else UseStateResult1
			local Smallest = math.min(UseStateResult2, YDelta)
			local YOffset: number = YDelta
			
			if not OverrideUseWideMode then
				local Largest: number = if LuaAppFixRsvpPromptDescriptionScrolling then math.max(YDelta - UseStateResult3 - Size300 * 2, 80) else YDelta
				Smallest = if LuaAppFixRsvpPromptDescriptionScrolling then math.min(UseStateResult2, Largest * 0.4) else math.min(UseStateResult1, Largest * 0.4)
				YOffset = Largest - Smallest
			end
			local Frame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				AutomaticSize = if OverrideUseWideMode then Enum.AutomaticSize.X else Enum.AutomaticSize.Y,
				Size = if OverrideUseWideMode then UDim2.new(0.6, 0, 0, YOffset) else UDim2.new(1, 0, 0, YOffset)
			}, {
				Thumbnail = ReactModule.createElement(LoadableImage, {
					BackgroundTransparency = 1,
					useShimmerAnimationWhileLoading = true,
					showFailedStateWhenLoadingFailed = true,
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Size = UDim2.fromScale(1, 1),
					Image = "rbxassetid://" .. MediaId,
					cornerRadius = UDim.new(0, 8)
				}),
				AspectRatioConstraint = ReactModule.createElement("UIAspectRatioConstraint", {
					AspectRatio = ConstantsModule.THUMBNAIL_ASPECT_RATIO,
					DominantAxis = Enum.DominantAxis.Width,
					AspectType = Enum.AspectType.FitWithinMaxSize
				}),
				Overlay = if v1 then ReactModule.createElement("Frame", {
					ZIndex = 2,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1)
				}, {
					Badge = ReactModule.createElement(GameTileThumbnailBadges, {
						tileBadgesByPosition = {
							ImageTopLeft = { { tileBadgeType = "Text", text = EventTime } }
						}
					})
				}) else nil
			})
			local _UDim2: UDim2 = if OverrideUseWideMode then if LuaAppFixRsvpPromptDescriptionScrolling then UDim2.new(0.4, -Size300, 0, Smallest) else UDim2.new(0.4, 0, 0, Smallest) else UDim2.new(1, 0, 0, Smallest)
			local ScrollingFrame = nil
			
			if LuaAppFixRsvpPromptDescriptionScrolling then
				local UseStateResult4: number = if UseStateResult1 > 0 then UseStateResult1 else 10000
				ScrollingFrame = ReactModule.createElement("ScrollingFrame", {
					LayoutOrder = 3,
					ScrollBarThickness = 0,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					ClipsDescendants = true,
					Size = _UDim2,
					CanvasSize = UDim2.new(0, 0, 0, UseStateResult4 + 2),
					ScrollingDirection = Enum.ScrollingDirection.Y
				}, {
					Body = ReactModule.createElement("TextLabel", {
						Size = UDim2.new(1, 0, 0, UseStateResult4),
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Text = DisplayDescription,
						TextTruncate = Enum.TextTruncate.None,
						TextWrapped = true,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(BodyLarge.Font) else Font.fromEnum(BodyLarge.Font),
						TextSize = BodyLarge.FontSize,
						LineHeight = BodyLarge.LineHeight,
						TextColor3 = UseTokensResult.Color.Content.Emphasis.Color3,
						TextTransparency = UseTokensResult.Color.Content.Emphasis.Transparency,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Top,
						[ReactModule.Change.TextBounds] = UseResult3,
						ref = UseRefResult
					})
				})
			else
				ScrollingFrame = ReactModule.createElement(ScrollView, {
					tag = "col align-y-top",
					LayoutOrder = 3,
					scroll = {
						AutomaticCanvasSize = Enum.AutomaticSize.Y,
						CanvasSize = UDim2.fromScale(1, 0),
						scrollBarVisibility = ScrollBarVisibility.Auto,
						ScrollingDirection = Enum.ScrollingDirection.Y,
						VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
					},
					Size = _UDim2
				}, {
					Body = ReactModule.createElement(Text, {
						tag = "size-full-0 text-body-large text-align-y-top text-align-x-left",
						TextWrapped = true,
						Text = DisplayDescription,
						Size = UDim2.new(1, 0, 0, UseStateResult1),
						padding = Vector2.new(0, 0),
						ref = UseRefResult
					})
				})
			end
			return if OverrideUseWideMode then ReactModule.createElement(View, {
				tag = "col align-x-center size-full-0 auto-y gap-medium",
				Size = UDim2.new(1, 0, 0, 0),
				onAbsoluteSizeChanged = UseResult2
			}, {
				Title = ReactModule.createElement(Text, {
					tag = "size-full-0 auto-y text-title-large text-align-x-left",
					LayoutOrder = 1,
					Text = DisplayTitle,
					ref = UseRefResult1
				}),
				Contents = ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = {
						["row align-y-top gap-medium size-full-0"] = LuaAppFixRsvpPromptDescriptionScrolling,
						["row align-y-center gap-medium size-full-0"] = not LuaAppFixRsvpPromptDescriptionScrolling
					},
					Size = UDim2.new(1, 0, 0, YOffset)
				}, { ThumbnailFrame = Frame, BodyScrollView = ScrollingFrame })
			}) else ReactModule.createElement(View, {
				tag = "col align-x-center size-full-0 auto-y gap-medium",
				Size = UDim2.new(1, 0, 0, 0),
				onAbsoluteSizeChanged = UseResult2
			}, {
				ThumbnailFrame = Frame,
				Title = ReactModule.createElement(Text, {
					tag = "size-full-0 auto-y text-title-large text-align-x-left",
					LayoutOrder = 2,
					Text = DisplayTitle,
					ref = UseRefResult1
				}),
				BodyScrollView = ScrollingFrame
			})
		end, {
			MediaId, DisplayTitle, DisplayDescription, v1, EventTime, UseStateResult,
			UseStateResult1, UseResult2, UseScreenSizeResult, Size300, UseStateResult3,
			UseTokensResult, BodyLarge, UseResult3, OverrideUseWideMode,
			p1.overrideUseWideMode
		}),
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = UseScreenSizeResult,
		title = UnfollowEvent1
	})
end