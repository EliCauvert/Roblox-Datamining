local LandingPage = script:FindFirstAncestor("LandingPage")
local Parent = LandingPage.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local AccountCarouselAvatarModule = require(LandingPage.Components.AccountCarouselAvatar)
local ScrollIndicatorComponentModule = require(LandingPage.Components.ScrollIndicatorComponent)
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local EnableAccountCarouselPatch = game:DefineFastFlag("EnableAccountCarouselPatch", false)
local AccountCarouselTweenDurationOnScroll = game:DefineFastInt("AccountCarouselTweenDurationOnScroll", 100)
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local GetFFlagEnableAccountCarouselEventsFunction = require(Parent.SharedFlags).GetFFlagEnableAccountCarouselEvents
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local AuthButtonClickFunction = AuthAnalyticsModule.Events.authButtonClick
local AccountCarouselAvatarScaleFactor = require(LandingPage.Constants.LandingPageConstants).Common.AccountCarouselAvatarScaleFactor
local EnableAccountCarouselDefaultCenter = game:DefineFastFlag("EnableAccountCarouselDefaultCenter", false)

return function(Frame)
	-- upvalues: ReactModule (copy), AccountCarouselAvatarScaleFactor (copy), EnableAccountCarouselDefaultCenter (copy), AccountCarouselTweenDurationOnScroll (copy), TweenService (copy), EnableAccountCarouselPatch (copy), UserInputService (copy), GetFFlagEnableAccountCarouselEventsFunction (copy), AuthButtonClickFunction (copy), EventStreamConstants (copy), AccountCarouselAvatarModule (copy), FoundationModule (copy), ScrollIndicatorComponentModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(1)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(0)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(0)
	local UseRefResult = ReactModule.useRef({})
	local UseRefResult1 = ReactModule.useRef(nil)
	local Elements = {}
	
	local function SetAvatarElementHeightForParent(YOffset)
		-- upvalues: UseStateResult4 (copy), UseStateResult2_3 (copy)
		if YOffset ~= UseStateResult4 then
			UseStateResult2_3(YOffset)
		end
	end
	
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(false)
	
	local function scrollToCenter(ClampedValue, Frame1: Frame)
		-- upvalues: UseStateResult5 (copy), UseStateResult2_4 (copy), UseRefResult (copy), Frame (copy), AccountCarouselAvatarScaleFactor (upval), EnableAccountCarouselDefaultCenter (upval), AccountCarouselTweenDurationOnScroll (upval), TweenService (upval)
		if UseStateResult5 then return end
		UseStateResult2_4(true)
		local CurrentEntry = UseRefResult.current[ClampedValue]
		
		if CurrentEntry and CurrentEntry.AbsolutePosition and Frame1.AbsolutePosition then
			local NewX = CurrentEntry.AbsolutePosition.X + Frame.avatarSize.X.Offset * AccountCarouselAvatarScaleFactor / 2
			local NewX1 = Frame1.AbsolutePosition.X + Frame1.AbsoluteSize.X / 2
			local Tween = TweenService:Create(Frame1, TweenInfo.new(AccountCarouselTweenDurationOnScroll / 1000), {
				CanvasPosition = Vector2.new(if EnableAccountCarouselDefaultCenter and NewX1 == 0 then 0 else NewX - NewX1 + Frame1.CanvasPosition.X, 0)
			})
			Tween:Play()
			Tween.Completed:Connect(function()
				-- upvalues: UseStateResult2_4 (upval)
				UseStateResult2_4(false)
			end)
		end
	end
	
	local function _(p1, Frame1)
		-- upvalues: EnableAccountCarouselPatch (upval), UseStateResult5 (copy), UseStateResult2 (copy), Frame (copy), scrollToCenter (copy)
		if not EnableAccountCarouselPatch or not UseStateResult5 then
			UseStateResult2(p1)
			Frame.setSelectedAvatarIndex(p1)
			scrollToCenter(p1, Frame1)
			
			return
		end
	end
	
	local UseRefResult2 = ReactModule.useRef(UseStateResult)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (copy), UseStateResult (copy)
		UseRefResult2.current = UseStateResult
	end, { UseStateResult })
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: EnableAccountCarouselPatch (upval), UseRefResult1 (copy), Frame (copy), UseStateResult5 (copy), UseStateResult2 (copy), scrollToCenter (copy), UseStateResult6 (copy), UserInputService (upval), UseRefResult2 (copy), GetFFlagEnableAccountCarouselEventsFunction (upval), AuthButtonClickFunction (upval), EventStreamConstants (upval), UseStateResult2_5 (copy)
		if EnableAccountCarouselPatch and UseRefResult1.current and #Frame.accounts >= 1 then
			local Current = UseRefResult1.current
			
			if not EnableAccountCarouselPatch or not UseStateResult5 then
				UseStateResult2(1)
				Frame.setSelectedAvatarIndex(1)
				scrollToCenter(1, Current)
			end
		end
		if UseStateResult6 then
			UseStateResult6:Disconnect()
		end
		UseStateResult2_5((UserInputService.TouchSwipe:Connect(function(SwipeDirection)
			-- upvalues: Frame (upval), UseRefResult1 (upval), UseRefResult2 (upval), GetFFlagEnableAccountCarouselEventsFunction (upval), AuthButtonClickFunction (upval), EventStreamConstants (upval), EnableAccountCarouselPatch (upval), UseStateResult5 (upval), UseStateResult2 (upval), scrollToCenter (upval)
			if #Frame.accounts <= 1 then return end
			if UseRefResult1.current and SwipeDirection == Enum.SwipeDirection.Left then
				local ClampedValue = math.clamp(UseRefResult2.current + 1, 1, #Frame.accounts)
				
				if GetFFlagEnableAccountCarouselEventsFunction() then
					AuthButtonClickFunction(EventStreamConstants.Context.AccountPickerLandingScreen, EventStreamConstants.Button.AccountPickerSwipeLeft, tostring(UseRefResult2.current) .. ";" .. tostring(ClampedValue))
				end
				local Current = UseRefResult1.current
				
				if not EnableAccountCarouselPatch or not UseStateResult5 then
					UseStateResult2(ClampedValue)
					Frame.setSelectedAvatarIndex(ClampedValue)
					scrollToCenter(ClampedValue, Current)
					
					return
				end
				return
			else
				if UseRefResult1.current and SwipeDirection == Enum.SwipeDirection.Right then
					local ClampedValue = math.clamp(UseRefResult2.current - 1, 1, #Frame.accounts)
					
					if GetFFlagEnableAccountCarouselEventsFunction() then
						AuthButtonClickFunction(EventStreamConstants.Context.AccountPickerLandingScreen, EventStreamConstants.Button.AccountPickerSwipeRight, tostring(UseRefResult2.current) .. ";" .. tostring(ClampedValue))
					end
					local Current = UseRefResult1.current
					
					if EnableAccountCarouselPatch and UseStateResult5 then return end
					UseStateResult2(ClampedValue)
					Frame.setSelectedAvatarIndex(ClampedValue)
					scrollToCenter(ClampedValue, Current)
				end
			end
		end)))
		
		return function()
			-- upvalues: UseStateResult6 (upval)
			if UseStateResult6 then
				UseStateResult6:Disconnect()
			end
		end
	end, { UseRefResult2, Frame.accounts, UseRefResult1 })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy)
		if UseRefResult1.current then
			UseRefResult1.current.ScrollingEnabled = false
		end
	end, { UseRefResult1 })
	local UseResult = ReactModule.useCallback(function(p1)
		-- upvalues: UseRefResult (copy)
		table.insert(UseRefResult.current, p1)
	end, {})
	
	for Current, account in ipairs(Frame.accounts) do
		Elements[Current] = ReactModule.createElement(AccountCarouselAvatarModule, {
			avatarSize = Frame.avatarSize,
			ref = UseResult,
			accountInfo = account,
			isHighlighted = Current == UseStateResult,
			setAvatarElementHeightForParent = SetAvatarElementHeightForParent,
			onActivated = function()
				-- upvalues: UseRefResult1 (copy), Current (copy), UseStateResult (copy), EnableAccountCarouselPatch (upval), UseStateResult5 (copy), UseStateResult2 (copy), Frame (copy), scrollToCenter (copy)
				if UseRefResult1.current and Current ~= UseStateResult then
					local Current1 = UseRefResult1.current
					
					if EnableAccountCarouselPatch and UseStateResult5 then return end
					UseStateResult2(Current)
					Frame.setSelectedAvatarIndex(Current)
					scrollToCenter(Current, Current1)
				end
			end
		})
	end
	ReactModule.useLayoutEffect(function()
		-- upvalues: Frame (copy), AccountCarouselAvatarScaleFactor (upval), UseStateResult3 (copy), UseStateResult1 (copy), UseStateResult2_1 (copy)
		local UseStateResultRatio = (UseStateResult3 - Frame.avatarSize.X.Offset * AccountCarouselAvatarScaleFactor) / 2
		
		if UseStateResultRatio ~= UseStateResult1 then
			UseStateResult2_1(UseStateResultRatio)
		end
	end, { UseStateResult3 })
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "col grow size-full-0 align-y-bottom",
		LayoutOrder = Frame.LayoutOrder
	}, {
		ScrollView = ReactModule.createElement(FoundationModule.ScrollView, {
			tag = "row gap-none no-wrap",
			LayoutOrder = 1,
			scrollingFrameRef = UseRefResult1,
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.XY,
				CanvasSize = UDim2.fromOffset(0, 0),
				ScrollingDirection = Enum.ScrollingDirection.X,
				scrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility.None
			},
			onAbsoluteWindowSizeChanged = function(Frame)
				-- upvalues: UseStateResult3 (copy), UseStateResult2_2 (copy)
				local X = Frame.AbsoluteSize.X
				
				if X ~= UseStateResult3 then
					UseStateResult2_2(X)
				end
			end,
			Size = UDim2.new(1, 0, 0, UseStateResult4)
		}, {
			ReactModule.createElement(FoundationModule.View, { tag = "row align-y-center gap-none no-wrap auto-xy" }, {
				Padding = ReactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, UseStateResult1),
					PaddingRight = UDim.new(0, UseStateResult1)
				}),
				AvatarElements = ReactModule.createElement(ReactModule.Fragment, {}, Elements)
			})
		}),
		ScrollIndicators = ReactModule.createElement(ScrollIndicatorComponentModule, {
			LayoutOrder = 2,
			totalAvatars = #Frame.accounts,
			highlightedIndex = UseStateResult
		})
	})
end