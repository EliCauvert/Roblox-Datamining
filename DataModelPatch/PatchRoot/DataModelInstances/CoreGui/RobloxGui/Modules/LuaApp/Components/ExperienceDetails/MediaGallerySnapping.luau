local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local CryoModule = require(CorePackages.Packages.Cryo)
local OtterModule = require(CorePackages.Packages.Otter)
local ReactModule = require(CorePackages.Packages.React)
local _ = require(CorePackages.Packages.ReactOtter)
local CarouselScrollButtons = require(CorePackages.Workspace.Packages.CollectionViews).CarouselScrollButtons
local _ = require(CorePackages.Workspace.Packages.AppBlox)
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local FoundationModule = require(CorePackages.Packages.Foundation)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UseCursorFunction = FoundationModule.Hooks.useCursor
local CursorType = FoundationModule.Enums.CursorType
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local SystemInfoProtocol = require(CorePackages.Workspace.Packages.SystemInfoProtocol).SystemInfoProtocol
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local UseBreakpointXOrSmallerFunction = ResponsiveModule.useBreakpointXOrSmaller
local UseLastInputFunction = ResponsiveModule.useLastInput
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local LoadingStrategy = UIBloxModule.App.Loading.Enum.LoadingStrategy
local RoundIconButton = require(CorePackages.Workspace.Packages.VideoUtils).RoundIconButton
local MediaGalleryPageIndicatorsModule = require(script.Parent.MediaGalleryPageIndicators)
local MediaGalleryVideoItemModule = require(script.Parent.MediaGalleryVideoItem)
local UseMediaGalleryRenderStepWhenVisibleModule = require(script.Parent.Hooks.useMediaGalleryRenderStepWhenVisible)
local UseVisibleMediaGalleryItemsModule = require(script.Parent.Hooks.useVisibleMediaGalleryItems)
local EnableAudioPlaybackInAppFunction = require(CorePackages.Workspace.Packages.MediaPlayback).enableAudioPlaybackInApp
local FFlagFixMediaGalleryOversized = require(CorePackages.Workspace.Packages.SharedFlags).FFlagFixMediaGalleryOversized
local FFlagLuaAppEdpMediaGalleryRedesign = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesign
local FFlagLuaAppEdpMediaGalleryRedesignIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignIxp
local FFlagLuaAppEdpMediaGalleryVideoPreview = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview
local FFlagLuaAppEdpMediaGalleryVideoPreviewIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreviewIxp
local FFlagLuaAppEdpMediaGalleryAutoAdvance = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryAutoAdvance
local FFlagLuaAppEdpMediaGalleryPreloadImage = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryPreloadImage
local FFlagLuaAppEdpMediaGalleryFullScreen = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen
local FFlagLuaAppEdpMediaGalleryRedesignTelemetry = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignTelemetry
local FFlagLuaAppEdpMediaGalleryHeightJitterFix = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryHeightJitterFix
local LuaAppEdpMediaGalleryVideoAudioFix2 = game:DefineFastFlag("LuaAppEdpMediaGalleryVideoAudioFix2", false)
local FStringLuaAppEdpAudioManufacturerDenyList = require(CorePackages.Workspace.Packages.SharedFlags).FStringLuaAppEdpAudioManufacturerDenyList
pcall(function()
	-- upvalues: SystemInfoProtocol (copy), FStringLuaAppEdpAudioManufacturerDenyList (copy), LuaAppEdpMediaGalleryVideoAudioFix2 (ref)
	local SystemInfo = SystemInfoProtocol.default:getSystemInfo({ SystemInfoProtocol.InfoNames.MANUFACTURER })
	
	if typeof(SystemInfo.manufacturer) == "string" then
		for i in FStringLuaAppEdpAudioManufacturerDenyList:gmatch("(%w+)") do
			if typeof(i) == "string" and string.lower(i) == string.lower(SystemInfo.manufacturer) then
				LuaAppEdpMediaGalleryVideoAudioFix2 = false
			end
		end
	end
end)
local LuaAppEdpMediaGalleryPageIndicators3 = game:DefineFastFlag("LuaAppEdpMediaGalleryPageIndicators3", false)
local LuaAppEdpMediaGalleryTouchDrag = game:DefineFastFlag("LuaAppEdpMediaGalleryTouchDrag", false)
local LuaAppEdpMediaGalleryImageAutoAdvanceDuration = game:DefineFastInt("LuaAppEdpMediaGalleryImageAutoAdvanceDuration", 5)
local LuaAppMediaGalleryMinValidMeasuredWidthRatioPct = game:DefineFastInt("LuaAppMediaGalleryMinValidMeasuredWidthRatioPct", 50)
local config = {
	itemPadding = 16,
	useSpring = true,
	showCounter = true,
	borderRadius = UDim.new(0, 8),
	springConfig = {
		frequency = 3,
		dampingRatio = 1,
		restingVelocityLimit = 0.05
	}
}

local function _(Text: string): string
	local FoundAt: number? = string.find(Text, "http://www.roblox.com/asset/?id=", 1, true)
	
	return if FoundAt and FoundAt == 1 then `rbxthumb://type=Asset&id={string.sub(Text, 33)}&w=768&h=432` else Text
end

local function MediaGallerySnapping(p1)
	-- upvalues: CryoModule (copy), config (copy), FFlagLuaAppEdpMediaGalleryRedesign (copy), FFlagLuaAppEdpMediaGalleryRedesignIxp (copy), FFlagLuaAppEdpMediaGalleryVideoPreview (copy), FFlagLuaAppEdpMediaGalleryVideoPreviewIxp (copy), UseDesignTokensFunction (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ReactModule (copy), FFlagLuaAppEdpMediaGalleryHeightJitterFix (copy), LuaAppMediaGalleryMinValidMeasuredWidthRatioPct (copy), LuaAppEdpMediaGalleryTouchDrag (copy), FFlagLuaAppEdpMediaGalleryAutoAdvance (copy), LuaAppEdpMediaGalleryVideoAudioFix2 (ref), EnableAudioPlaybackInAppFunction (copy), Signal (copy), UseLastInputFunction (copy), ResponsiveModule (copy), OtterModule (copy), FFlagLuaAppEdpMediaGalleryRedesignTelemetry (copy), FFlagLuaAppEdpMediaGalleryFullScreen (copy), LuaAppEdpMediaGalleryImageAutoAdvanceDuration (copy), UseMediaGalleryRenderStepWhenVisibleModule (copy), UseBreakpointXOrSmallerFunction (copy), UseCursorFunction (copy), CursorType (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), ReactFocusNavigationModule (copy), UserInputService (copy), UseVisibleMediaGalleryItemsModule (copy), LoadableImage (copy), FFlagLuaAppEdpMediaGalleryPreloadImage (copy), LoadingStrategy (copy), MediaGalleryVideoItemModule (copy), ImageSetLabel (copy), Images (copy), RoundIconButton (copy), LuaAppEdpMediaGalleryPageIndicators3 (copy), MediaGalleryPageIndicatorsModule (copy), CarouselScrollButtons (copy), FFlagFixMediaGalleryOversized (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local NoFFlagLuaAppEdpMediaGalleryRedesignIxp = if FFlagLuaAppEdpMediaGalleryRedesign then not FFlagLuaAppEdpMediaGalleryRedesignIxp or JoinResult.mediaGalleryRedesignEnabledIxp else nil
	local NoFFlagLuaAppEdpMediaGalleryVideoPreviewIxp = if FFlagLuaAppEdpMediaGalleryVideoPreview then not FFlagLuaAppEdpMediaGalleryVideoPreviewIxp or JoinResult.mediaGalleryVideoPreviewEnabledIxp else nil
	local UseDesignTokensResult = UseDesignTokensFunction()
	local Size300 = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_300 else UseDesignTokensResult.Global.Space_150
	local ItemAspectRatio = if JoinResult.itemAspectRatio and JoinResult.itemAspectRatio ~= 0 then JoinResult.itemAspectRatio else 1.7777777777777777
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(FFlagLuaAppEdpMediaGalleryHeightJitterFix and JoinResult.initialWidth or 0, 0))
	local UseResult = if FFlagLuaAppEdpMediaGalleryHeightJitterFix then ReactModule.useCallback(function(p2: number): boolean
		-- upvalues: JoinResult (copy), LuaAppMediaGalleryMinValidMeasuredWidthRatioPct (upval)
		return if JoinResult.initialWidth == nil then p2 > 0 else JoinResult.initialWidth * (LuaAppMediaGalleryMinValidMeasuredWidthRatioPct / 100) <= p2
	end, { JoinResult.initialWidth }) else nil
	local UseRefResult = if LuaAppEdpMediaGalleryTouchDrag then nil else ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef((Vector3.new()))
	local UseRefResult2 = ReactModule.useRef(nil)
	local ItemIndex: number? = nil
	local UseStateResult2_1 = nil
	local v1 = nil
	local UseBindingResult2 = nil
	local UseResult7 = nil
	local UseBindingResult = nil
	local UseBindingResult2_1 = nil
	local UseRefResult3 = nil
	local IsPointerMatch = nil
	local UseResult8 = nil
	local UseResult1 = nil
	local UseResult2 = nil
	local UseResult9 = nil
	local UseResult11 = nil
	local UseResult3: ((any, any) -> ())? = nil
	local UseResult4: ((any, any) -> ())? = nil
	local UseResult5: ((any, any) -> ())? = nil
	local v2 = nil
	local Callback = nil
	local v3 = nil
	local Callback1 = nil
	local UseRefResult4 = nil
	local UseResult6 = nil
	local v4 = nil
	local UseEventHandlerMapResult = nil
	local IsDirectionalMatch: boolean? = nil
	local Size500 = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_500 else UseDesignTokensResult.Global.Size_250
	local Size350 = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_350 else UseDesignTokensResult.Global.Size_175
	local UseMemoResult = nil
	local UseMemoResult1 = nil
	local UseStateResult1 = nil
	local v5 = nil
	local v6 = nil
	
	if FFlagLuaAppEdpMediaGalleryAutoAdvance or LuaAppEdpMediaGalleryTouchDrag then
		UseRefResult4 = ReactModule.useRef(nil)
	end
	if FFlagLuaAppEdpMediaGalleryRedesign then
		if FFlagLuaAppEdpMediaGalleryVideoPreview and LuaAppEdpMediaGalleryVideoAudioFix2 then
			local Flag: boolean? = nil
			
			for _, item in JoinResult.items do
				if item.videoId then
					Flag = true
					break
				end
			end
			ReactModule.useEffect(function()
				-- upvalues: Flag (ref), EnableAudioPlaybackInAppFunction (upval)
				if Flag then
					task.delay(0, function()
						-- upvalues: EnableAudioPlaybackInAppFunction (upval)
						EnableAudioPlaybackInAppFunction()
					end)
				end
			end, { Flag })
		end
		ItemIndex, UseStateResult2_1 = ReactModule.useState(JoinResult.startIndex or 1)
		ReactModule.useEffect(function()
			-- upvalues: JoinResult (copy)
			local List = {}
			
			for _, item in JoinResult.items do
				if item.imageId then
					local ImageId: string = item.imageId
					local FoundAt: number? = string.find(ImageId, "http://www.roblox.com/asset/?id=", 1, true)
					table.insert(List, if FoundAt and FoundAt == 1 then `rbxthumb://type=Asset&id={string.sub(ImageId, 33)}&w=768&h=432` else ImageId)
				end
			end
			if #List > 0 then
				task.spawn(function()
					-- upvalues: List (copy)
					game:GetService("ContentProvider"):PreloadAsync(List)
				end)
			end
		end, { JoinResult.items })
		UseResult7 = ReactModule.useCallback(function(p2): Vector2
			-- upvalues: UseStateResult (copy), JoinResult (copy)
			return if p2 == 1 then Vector2.new(0, 0) else Vector2.new(UseStateResult.X + JoinResult.itemPadding, 0)
		end, { JoinResult.itemPadding, UseStateResult })
		local UseBindingResult2_1
		UseBindingResult, UseBindingResult2_1 = ReactModule.useBinding(UseResult7(ItemIndex))
		ReactModule.useEffect(function()
			-- upvalues: UseBindingResult2_1 (ref), UseResult7 (ref), ItemIndex (ref)
			UseBindingResult2_1(UseResult7(ItemIndex))
		end, { UseResult7, ItemIndex })
		UseRefResult3 = ReactModule.useRef(Signal.new())
		local UseLastInputResult = UseLastInputFunction()
		IsDirectionalMatch = UseLastInputResult == ResponsiveModule.Input.Directional
		IsPointerMatch = if NoFFlagLuaAppEdpMediaGalleryRedesignIxp then UseLastInputResult == ResponsiveModule.Input.Pointer else nil
		
		if FFlagLuaAppEdpMediaGalleryAutoAdvance then
			v2, Callback = ReactModule.useBinding(0)
			v3, Callback1 = ReactModule.useBinding(0)
		end
		local UseRefResult5 = ReactModule.useRef(false)
		UseResult8 = ReactModule.useCallback(function(p2, p3)
			-- upvalues: UseRefResult5 (copy), UseBindingResult (ref), UseStateResult (copy), JoinResult (copy), ItemIndex (ref), FFlagLuaAppEdpMediaGalleryAutoAdvance (upval), NoFFlagLuaAppEdpMediaGalleryRedesignIxp (ref), Callback (ref), Callback1 (ref), UseRefResult3 (ref), OtterModule (upval), UseBindingResult2_1 (ref), FFlagLuaAppEdpMediaGalleryRedesignTelemetry (upval), UseStateResult2_1 (ref)
			if UseRefResult5.current then return end
			local Value = UseBindingResult:getValue()
			local NewX = UseStateResult.X + JoinResult.itemPadding
			local NewItemIndex = nil
			local NewValue = nil
			
			if p2 == "Right" then
				NewItemIndex = ItemIndex + 1
				NewValue = Value + Vector2.new(NewX, 0)
			else
				NewItemIndex = ItemIndex - 1
				NewValue = Value - Vector2.new(NewX, 0)
			end
			if NewItemIndex < 1 or #JoinResult.items < NewItemIndex then return end
			if FFlagLuaAppEdpMediaGalleryAutoAdvance and NoFFlagLuaAppEdpMediaGalleryRedesignIxp then
				Callback(0)
				Callback1(0)
			end
			if NoFFlagLuaAppEdpMediaGalleryRedesignIxp then
				UseRefResult3.current:fire(NewItemIndex)
			end
			UseRefResult5.current = true
			local SingleMotor = OtterModule.createSingleMotor(0)
			SingleMotor:onStep(function(Alpha)
				-- upvalues: UseBindingResult2_1 (upval), Value (copy), NewValue (ref)
				UseBindingResult2_1(Value:Lerp(NewValue, Alpha))
			end)
			
			if JoinResult.useSpring then
				SingleMotor:setGoal(OtterModule.spring(1, JoinResult.springConfig))
			else
				SingleMotor:setGoal(OtterModule.instant(1))
			end
			SingleMotor:onComplete(function()
				-- upvalues: UseRefResult5 (upval), JoinResult (upval), FFlagLuaAppEdpMediaGalleryRedesignTelemetry (upval), NewItemIndex (ref), p3 (copy), UseStateResult2_1 (upval)
				UseRefResult5.current = false
				
				if JoinResult.onSwipe then
					JoinResult.onSwipe()
				end
				if FFlagLuaAppEdpMediaGalleryRedesignTelemetry and JoinResult.onMediaGalleryMediaChanged and JoinResult.items and JoinResult.items[NewItemIndex] then
					local Item = JoinResult.items[NewItemIndex]
					JoinResult.onMediaGalleryMediaChanged(Item.imageId, Item.videoId, Item.isYouTubeVideo, p3)
				end
				UseStateResult2_1(NewItemIndex)
			end)
			
			return function()
				-- upvalues: SingleMotor (copy)
				SingleMotor:destroy()
			end
		end, {
			JoinResult.items, JoinResult.itemPadding, JoinResult.useSpring,
			JoinResult.springConfig, JoinResult.onSwipe, UseStateResult, ItemIndex,
			UseBindingResult, NoFFlagLuaAppEdpMediaGalleryRedesignIxp
		})
		UseResult1 = ReactModule.useCallback(function()
			-- upvalues: UseResult8 (ref)
			UseResult8("Left")
		end, { UseResult8 })
		UseResult2 = ReactModule.useCallback(function()
			-- upvalues: UseResult8 (ref)
			UseResult8("Right")
		end, { UseResult8 })
		UseResult9 = ReactModule.useCallback(function(_, SwipeDirection)
			-- upvalues: UseResult8 (ref)
			if SwipeDirection == Enum.SwipeDirection.Right then
				UseResult8("Left")
				
				return
			end
			if SwipeDirection == Enum.SwipeDirection.Left then
				UseResult8("Right")
			end
		end, { UseResult8 })
		local UseResult10: (any) -> () = ReactModule.useCallback(function(Frame: Frame)
			-- upvalues: FFlagLuaAppEdpMediaGalleryHeightJitterFix (upval), UseResult (ref), UseStateResult2 (copy)
			if not FFlagLuaAppEdpMediaGalleryHeightJitterFix or UseResult(Frame.AbsoluteSize.X) then
				UseStateResult2(Frame.AbsoluteSize)
			end
		end, {
			if FFlagLuaAppEdpMediaGalleryHeightJitterFix then UseResult else nil
		})
		UseStateResult1, v89 = ReactModule.useState(true)
		UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: Signal (upval)
			return Signal.new()
		end, {})
		UseMemoResult1 = ReactModule.useMemo(function()
			-- upvalues: Signal (upval)
			return Signal.new()
		end, {})
		UseResult11 = ReactModule.useCallback(function()
			-- upvalues: JoinResult (copy), ItemIndex (ref), UseMemoResult (ref)
			local Item = JoinResult.items[ItemIndex]
			
			if Item and Item.videoId then
				UseMemoResult:fire()
			end
		end, { ItemIndex, JoinResult.items, UseMemoResult })
		
		if not LuaAppEdpMediaGalleryTouchDrag then
			UseResult3 = ReactModule.useCallback(function(_, Input)
				-- upvalues: UseRefResult (copy), UseRefResult1 (copy)
				if Input.UserInputType == Enum.UserInputType.Touch then
					UseRefResult.current = false
					UseRefResult1.current = Input.Position
				end
			end, {})
			UseResult4 = ReactModule.useCallback(function(_, Input)
				-- upvalues: UseRefResult1 (copy), UseRefResult (copy)
				if Input.UserInputType == Enum.UserInputType.Touch and UseRefResult1.current and UseRefResult1.current.X and math.abs(Input.Position.X - UseRefResult1.current.X) > 50 then
					UseRefResult.current = true
				end
			end, {})
			UseResult5 = ReactModule.useCallback(function(_, Input)
				-- upvalues: UseRefResult1 (copy)
				if Input.UserInputType == Enum.UserInputType.Touch then
					UseRefResult1.current = Vector3.new()
				end
			end, {})
		end
		if FFlagLuaAppEdpMediaGalleryAutoAdvance then
			if FFlagLuaAppEdpMediaGalleryVideoPreview then
				UseResult6 = ReactModule.useCallback(function()
					-- upvalues: FFlagLuaAppEdpMediaGalleryFullScreen (upval), JoinResult (copy), UseResult8 (ref)
					if not FFlagLuaAppEdpMediaGalleryFullScreen or not JoinResult.isFullscreen then
						UseResult8("Right", true)
						
						return
					end
				end, { UseResult8 })
			end
			local v7 = if FFlagLuaAppEdpMediaGalleryVideoPreview and NoFFlagLuaAppEdpMediaGalleryVideoPreviewIxp and JoinResult.items and JoinResult.items[ItemIndex] and JoinResult.items[ItemIndex].videoId then true else nil
			UseMediaGalleryRenderStepWhenVisibleModule(if FFlagLuaAppEdpMediaGalleryFullScreen then JoinResult.isOccluded else nil, if FFlagLuaAppEdpMediaGalleryFullScreen then JoinResult.isFullscreen else nil, if FFlagLuaAppEdpMediaGalleryVideoPreview and NoFFlagLuaAppEdpMediaGalleryVideoPreviewIxp then v7 else nil, UseRefResult4, ReactModule.useCallback(function(p2)
				-- upvalues: UseRefResult5 (copy), v2 (ref), LuaAppEdpMediaGalleryImageAutoAdvanceDuration (upval), UseResult8 (ref), Callback (ref), Callback1 (ref)
				if not UseRefResult5.current then
					local NewValue = v2:getValue() + p2
					
					if LuaAppEdpMediaGalleryImageAutoAdvanceDuration <= NewValue then
						UseResult8("Right", true)
						
						return
					end
					Callback(NewValue)
					Callback1(NewValue / LuaAppEdpMediaGalleryImageAutoAdvanceDuration)
				end
			end, { v2, UseResult8 }), ReactModule.useCallback(function()
				-- upvalues: Callback (ref), Callback1 (ref)
				Callback(0)
				Callback1(0)
			end, {}), if FFlagLuaAppEdpMediaGalleryRedesignIxp then JoinResult.mediaGalleryRedesignEnabledIxp else nil, if FFlagLuaAppEdpMediaGalleryVideoPreviewIxp then JoinResult.mediaGalleryVideoPreviewEnabledIxp else nil)
		end
		if FFlagLuaAppEdpMediaGalleryFullScreen then
			ReactModule.useEffect(function()
				-- upvalues: NoFFlagLuaAppEdpMediaGalleryRedesignIxp (ref), UseStateResult2_1 (ref), JoinResult (copy)
				if NoFFlagLuaAppEdpMediaGalleryRedesignIxp then
					UseStateResult2_1(JoinResult.startIndex or 1)
				end
			end, {
				JoinResult.startIndex,
				NoFFlagLuaAppEdpMediaGalleryRedesignIxp
			})
		end
		v4 = UseBreakpointXOrSmallerFunction(ResponsiveModule.Keys.Small)
		v6 = UseCursorFunction(CursorType.Invisible)
		local UseResult12 = ReactModule.useCallback(function()
			-- upvalues: JoinResult (copy), ItemIndex (ref)
			if JoinResult.onFullscreenToggleButtonActivated and JoinResult.items and JoinResult.items[ItemIndex] then
				JoinResult.onFullscreenToggleButtonActivated(ItemIndex, JoinResult.items[ItemIndex].videoId ~= nil)
			end
		end, {
			JoinResult.onFullscreenToggleButtonActivated,
			ItemIndex,
			JoinResult.items
		})
		local HasVideoId: boolean = JoinResult.items and (ItemIndex and (JoinResult.items[ItemIndex] and JoinResult.items[ItemIndex].videoId ~= nil))
		local UseResult13 = ReactModule.useCallback(function()
			-- upvalues: HasVideoId (copy), UseMemoResult1 (ref)
			if HasVideoId then
				UseMemoResult1:fire()
			end
		end, { UseMemoResult1, HasVideoId })
		UseEventHandlerMapResult = ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UseResult1 (ref), UseResult2 (ref), UseResult12 (copy), UseResult13 (copy)
			return {
				[FocusNavigationEventNameEnum.TabBackward] = { handler = InputHandlersModule.onRelease(UseResult1) },
				[FocusNavigationEventNameEnum.TabForward] = { handler = InputHandlersModule.onRelease(UseResult2) },
				[FocusNavigationEventNameEnum.Fullscreen] = { handler = InputHandlersModule.onRelease(UseResult12) },
				[FocusNavigationEventNameEnum.ExitFullscreen] = { handler = InputHandlersModule.onRelease(UseResult12) },
				[FocusNavigationEventNameEnum.Mute] = { handler = InputHandlersModule.onRelease(UseResult13) },
				[FocusNavigationEventNameEnum.Unmute] = { handler = InputHandlersModule.onRelease(UseResult13) }
			}
		end, { UseResult1, UseResult2, UseResult12, UseResult13 }), (ReactFocusNavigationModule.useEventMap((ReactModule.useMemo(function()
			-- upvalues: FocusNavigationEventNameEnum (upval), JoinResult (copy), HasVideoId (copy), UseStateResult1 (ref)
			return {
				[Enum.KeyCode.ButtonL1] = FocusNavigationEventNameEnum.TabBackward,
				[Enum.KeyCode.ButtonR1] = FocusNavigationEventNameEnum.TabForward,
				[Enum.KeyCode.ButtonR3] = if JoinResult.isFullscreen then FocusNavigationEventNameEnum.ExitFullscreen else FocusNavigationEventNameEnum.Fullscreen,
				[Enum.KeyCode.ButtonL3] = if HasVideoId then if UseStateResult1 then FocusNavigationEventNameEnum.Unmute else FocusNavigationEventNameEnum.Mute else nil
			}
		end, { JoinResult.isFullscreen, UseStateResult1, HasVideoId })))))
	else
		v1, UseBindingResult2 = ReactModule.useBinding(JoinResult.startIndex or 1)
		
		UseResult7 = function(ItemIndex: number): Vector2
			-- upvalues: UseStateResult (copy), JoinResult (copy)
			return Vector2.new((UseStateResult.X + JoinResult.itemPadding) * (ItemIndex - 1), 0)
		end
		
		UseBindingResult, UseBindingResult2_1 = ReactModule.useBinding(UseResult7(v1:getValue()))
		ReactModule.useEffect(function()
			-- upvalues: UseBindingResult2_1 (ref), UseResult7 (ref), v1 (ref)
			UseBindingResult2_1(UseResult7(v1:getValue()))
		end, { UseStateResult })
		
		UseResult8 = function(p2)
			-- upvalues: v1 (ref), JoinResult (copy), UseBindingResult2 (ref), UseResult7 (ref), UseBindingResult (ref), OtterModule (upval), UseBindingResult2_1 (ref), LuaAppEdpMediaGalleryTouchDrag (upval), UseRefResult (copy)
			local NewValue: number = if p2 == "Right" then v1:getValue() + 1 else v1:getValue() - 1
			
			if NewValue < 1 or NewValue > #JoinResult.items then return end
			UseBindingResult2(NewValue)
			local UseResultResult = UseResult7(v1:getValue())
			local Value = UseBindingResult:getValue()
			local SingleMotor = OtterModule.createSingleMotor(0)
			SingleMotor:onStep(function(Alpha)
				-- upvalues: UseBindingResult2_1 (upval), Value (copy), UseResultResult (copy)
				UseBindingResult2_1(Value:Lerp(UseResultResult, Alpha))
			end)
			
			if JoinResult.useSpring then
				SingleMotor:setGoal(OtterModule.spring(1, JoinResult.springConfig))
			else
				SingleMotor:setGoal(OtterModule.instant(1))
			end
			SingleMotor:onComplete(function()
				-- upvalues: LuaAppEdpMediaGalleryTouchDrag (upval), UseRefResult (upval), JoinResult (upval)
				if not LuaAppEdpMediaGalleryTouchDrag then
					UseRefResult.current = false
				end
				if JoinResult.onSwipe then
					JoinResult.onSwipe()
				end
			end)
		end
		
		UseResult9 = function(_, SwipeDirection)
			-- upvalues: UseResult8 (ref)
			if SwipeDirection == Enum.SwipeDirection.Right then
				UseResult8("Left")
				
				return
			end
			if SwipeDirection == Enum.SwipeDirection.Left then
				UseResult8("Right")
			end
		end
		
		local function UseResult10(Frame: Frame)
			-- upvalues: FFlagLuaAppEdpMediaGalleryHeightJitterFix (upval), UseResult (ref), UseStateResult2 (copy)
			if not FFlagLuaAppEdpMediaGalleryHeightJitterFix or UseResult(Frame.AbsoluteSize.X) then
				UseStateResult2(Frame.AbsoluteSize)
			end
		end
		
		UseResult11 = function(ItemIndex)
			-- upvalues: LuaAppEdpMediaGalleryTouchDrag (upval), UseRefResult (copy), JoinResult (copy)
			if not LuaAppEdpMediaGalleryTouchDrag and UseRefResult.current then return end
			if not JoinResult.onPreviewActivated then return end
			return JoinResult.onPreviewActivated(ItemIndex)
		end
		
		if not LuaAppEdpMediaGalleryTouchDrag then
			UseResult3 = function(_, Input)
				-- upvalues: UseRefResult (copy), UseRefResult1 (copy)
				if Input.UserInputType == Enum.UserInputType.Touch then
					UseRefResult.current = false
					UseRefResult1.current = Input.Position
				end
			end
			
			UseResult4 = function(_, Input)
				-- upvalues: UseRefResult1 (copy), UseRefResult (copy)
				if Input.UserInputType == Enum.UserInputType.Touch and UseRefResult1.current and math.abs(Input.Position.X - UseRefResult1.current.X) > 50 then
					UseRefResult.current = true
				end
			end
			
			UseResult5 = function(_, Input)
				-- upvalues: UseRefResult1 (copy)
				if Input.UserInputType == Enum.UserInputType.Touch then
					UseRefResult1.current = Vector3.new()
				end
			end
		end
	end
	if LuaAppEdpMediaGalleryTouchDrag then
		ReactModule.useEffect(function()
			-- upvalues: UserInputService (upval), UseRefResult4 (ref), UseResult9 (ref)
			local Flag = false
			local TouchStartedConnection = UserInputService.TouchStarted:Connect(function(Touch)
				-- upvalues: UseRefResult4 (upval), Flag (ref)
				local Current = UseRefResult4.current
				
				if Current then
					local AbsolutePosition = Current.AbsolutePosition
					local AbsoluteSize = Current.AbsoluteSize
					
					if AbsolutePosition.X <= Touch.Position.X and Touch.Position.X <= AbsolutePosition.X + AbsoluteSize.X and AbsolutePosition.Y <= Touch.Position.Y and Touch.Position.Y <= AbsolutePosition.Y + AbsoluteSize.Y then
						Flag = true
					end
				end
			end)
			local TouchEndedConnection = UserInputService.TouchEnded:Connect(function(_)
				-- upvalues: Flag (ref)
				Flag = false
			end)
			local TouchDragConnection = UserInputService.TouchDrag:Connect(function(DragDirection)
				-- upvalues: Flag (ref), UseResult9 (upval)
				if Flag then
					UseResult9(nil, DragDirection)
				end
			end)
			
			return function()
				-- upvalues: TouchStartedConnection (copy), TouchEndedConnection (copy), TouchDragConnection (copy)
				TouchStartedConnection:Disconnect()
				TouchEndedConnection:Disconnect()
				TouchDragConnection:Disconnect()
			end
		end, { UseResult9 })
	end
	local UseVisibleMediaGalleryItemsModuleResult = if FFlagLuaAppEdpMediaGalleryRedesign then UseVisibleMediaGalleryItemsModule(JoinResult.items, ItemIndex) else nil
	local YOffset = if FFlagLuaAppEdpMediaGalleryRedesign and NoFFlagLuaAppEdpMediaGalleryRedesignIxp then (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_200 else UseDesignTokensResult.Global.Size_100) + (if v4 then if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_400 else UseDesignTokensResult.Global.Size_200 elseif FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_700 else UseDesignTokensResult.Global.Size_350) + (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_1000 else UseDesignTokensResult.Global.Size_500) else nil
	local t = {}
	local UseVisibleMediaGalleryItemsModuleResult1 = if FFlagLuaAppEdpMediaGalleryRedesign then UseVisibleMediaGalleryItemsModuleResult else JoinResult.items
	for i, value in UseVisibleMediaGalleryItemsModuleResult1 do
		local NewItemIndex = if FFlagLuaAppEdpMediaGalleryRedesign then if ItemIndex == 1 then i else ItemIndex - 2 + i else i
		local Text = "Item" .. NewItemIndex
		local CreateElementFunction2 = ReactModule.createElement
		local v8 = "TextButton"
		local InputBegan = ReactModule.Event.InputBegan
		InputBegan = ReactModule.Event.InputChanged
		InputBegan = ReactModule.Event.InputEnded
		InputBegan = ReactModule.Event.Activated
		InputBegan = ReactModule.Event.TouchSwipe
		InputBegan = not NoFFlagLuaAppEdpMediaGalleryRedesignIxp and nil
		local config2 = {
			LayoutOrder = NewItemIndex,
			Size = UDim2.new(1, 0, 0, UseStateResult.X / ItemAspectRatio),
			TextTransparency = 1,
			Text = "",
			BackgroundTransparency = 1,
			AutoButtonColor = false,
			[InputBegan] = if LuaAppEdpMediaGalleryTouchDrag then nil else UseResult3,
			[InputBegan] = if LuaAppEdpMediaGalleryTouchDrag then nil else UseResult4,
			[InputBegan] = if LuaAppEdpMediaGalleryTouchDrag then nil else UseResult5,
			[InputBegan] = if FFlagLuaAppEdpMediaGalleryRedesign then nil elseif FFlagLuaAppEdpMediaGalleryVideoPreview and NoFFlagLuaAppEdpMediaGalleryVideoPreviewIxp and value.videoId then nil else function()
				-- upvalues: UseResult11 (ref), NewItemIndex (ref)
				UseResult11(NewItemIndex)
			end,
			[InputBegan] = if LuaAppEdpMediaGalleryTouchDrag then nil else UseResult9,
			Selectable = InputBegan
		}
		InputBegan = {}
		local CreateElementFunction = nil
		
		if FFlagLuaAppEdpMediaGalleryVideoPreview and NoFFlagLuaAppEdpMediaGalleryVideoPreviewIxp and value.videoId then
			CreateElementFunction = nil
		else
			CreateElementFunction = ReactModule.createElement
			local config1 = {
				BackgroundTransparency = 1,
				ZIndex = 1,
				useShimmerAnimationWhileLoading = true,
				cornerRadius = JoinResult.borderRadius,
				Size = UDim2.fromScale(1, 1)
			}
			local RbxthumbName = nil
			
			if NoFFlagLuaAppEdpMediaGalleryRedesignIxp then
				local ImageId: string = value.imageId
				local FoundAt: number? = string.find(ImageId, "http://www.roblox.com/asset/?id=", 1, true)
				RbxthumbName = if FoundAt and FoundAt == 1 then `rbxthumb://type=Asset&id={string.sub(ImageId, 33)}&w=768&h=432` else ImageId
			else
				RbxthumbName = value.imageId
			end
			config1.Image = RbxthumbName
			config1.ScaleType = Enum.ScaleType.Crop
			config1.loadingStrategy = if FFlagLuaAppEdpMediaGalleryPreloadImage then LoadingStrategy.Eager else nil
			CreateElementFunction = CreateElementFunction(LoadableImage, config1)
		end
		InputBegan.Image = CreateElementFunction
		local CreateElementFunction4 = nil
		
		if FFlagLuaAppEdpMediaGalleryVideoPreview and NoFFlagLuaAppEdpMediaGalleryVideoPreviewIxp and value.videoId then
			CreateElementFunction4 = ReactModule.createElement
			CreateElementFunction4 = CreateElementFunction4(MediaGalleryVideoItemModule, {
				ZIndex = 1,
				video = value.videoId,
				thumbnail = value.imageId,
				Size = UDim2.fromScale(1, 1),
				cornerRadius = JoinResult.borderRadius.Offset,
				itemIndex = NewItemIndex,
				isFullscreen = if FFlagLuaAppEdpMediaGalleryFullScreen then JoinResult.isFullscreen else nil,
				isMediaGalleryOccluded = if FFlagLuaAppEdpMediaGalleryFullScreen then JoinResult.isOccluded else nil,
				videoPlaybackCoordinator = JoinResult.videoPlaybackCoordinator,
				onVideoProgressChanged = if FFlagLuaAppEdpMediaGalleryAutoAdvance then Callback1 else nil,
				onVideoEnded = if FFlagLuaAppEdpMediaGalleryAutoAdvance then UseResult6 else nil,
				videoAnalytics = JoinResult.videoAnalytics,
				universeId = JoinResult.universeId,
				toggleVideoPlaybackSignal = if NewItemIndex == ItemIndex then UseMemoResult else nil,
				toggleMuteSignal = if NewItemIndex == ItemIndex then UseMemoResult1 else nil,
				onMutedChanged = if NewItemIndex == ItemIndex then v5 else nil
			})
		else
			CreateElementFunction4 = nil
		end
		InputBegan.Video = CreateElementFunction4
		local CreateElementFunction5 = nil
		
		if FFlagLuaAppEdpMediaGalleryRedesign and NoFFlagLuaAppEdpMediaGalleryRedesignIxp then
			if FFlagLuaAppEdpMediaGalleryVideoPreview and (NoFFlagLuaAppEdpMediaGalleryVideoPreviewIxp and value.videoId) then
				CreateElementFunction5 = nil
			else
				CreateElementFunction5 = ReactModule.createElement
				CreateElementFunction5 = CreateElementFunction5("Frame", {
					BorderSizePixel = 0,
					ZIndex = 2,
					AnchorPoint = Vector2.new(0, 1),
					Position = UDim2.fromScale(0, 1),
					Size = UDim2.new(1, 0, 0, YOffset),
					BackgroundColor3 = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Extended.Black.Black_100 else UseDesignTokensResult.Global.Color.Black).Color3
				}, {
					Gradient = ReactModule.createElement("UIGradient", {
						Rotation = 90,
						Transparency = NumberSequence.new({
							NumberSequenceKeypoint.new(0, 1),
							NumberSequenceKeypoint.new(1, 0.2)
						})
					}),
					UICorner = ReactModule.createElement("UICorner", { CornerRadius = JoinResult.borderRadius })
				})
			end
		else
			CreateElementFunction5 = nil
		end
		InputBegan.GradientOverlay = CreateElementFunction5
		local CreateElementFunction3 = nil
		
		if value.isYouTubeVideo then
			CreateElementFunction3 = ReactModule.createElement
			CreateElementFunction3 = CreateElementFunction3("TextButton", {
				Size = UDim2.new(0, 60, 0, 45),
				AnchorPoint = Vector2.new(1, 1),
				Position = UDim2.new(1, -Size300, 1, -Size300),
				TextTransparency = 1,
				Text = "",
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 0.5,
				ZIndex = if FFlagLuaAppEdpMediaGalleryRedesign and NoFFlagLuaAppEdpMediaGalleryRedesignIxp then 3 else 2,
				[ReactModule.Event.Activated] = function()
					-- upvalues: JoinResult (copy), NewItemIndex (ref)
					if JoinResult.onVideoPlayActivated then
						JoinResult.onVideoPlayActivated(NewItemIndex)
					end
				end
			}, {
				PlayButtonCorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
				PlayIcon = ReactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Size = UDim2.fromOffset(26, 26),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					Image = Images["icons/common/play"]
				})
			})
		else
			CreateElementFunction3 = nil
		end
		InputBegan.PlayButton = CreateElementFunction3
		local CreateElementFunction1 = nil
		
		if FFlagLuaAppEdpMediaGalleryFullScreen and (NoFFlagLuaAppEdpMediaGalleryRedesignIxp and JoinResult.onFullscreenToggleButtonActivated) then
			CreateElementFunction1 = ReactModule.createElement
			CreateElementFunction1 = CreateElementFunction1(RoundIconButton, {
				ZIndex = 3,
				Selectable = false,
				icon = if JoinResult.isFullscreen then "two-arrows-to-center" else "two-arrows-from-center",
				onActivated = function()
					-- upvalues: JoinResult (copy), NewItemIndex (ref), value (copy)
					JoinResult.onFullscreenToggleButtonActivated(NewItemIndex, value.videoId ~= nil)
				end,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, -(if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_500 else UseDesignTokensResult.Global.Space_250), 0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_500 else UseDesignTokensResult.Global.Space_250)
			})
		else
			CreateElementFunction1 = nil
		end
		InputBegan.FullscreenButton = CreateElementFunction1
		t[Text] = CreateElementFunction2(v8, config2, InputBegan)
	end
	local Size600 = nil
	local Size200 = nil
	if UseStateResult.X < 500 then
		Size600 = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_600 else UseDesignTokensResult.Global.Space_300
		Size200 = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_200 else UseDesignTokensResult.Global.Space_100
	else
		Size600 = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_800 else UseDesignTokensResult.Global.Space_400
		Size200 = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_400 else UseDesignTokensResult.Global.Space_200
	end
	local TextLabel = if JoinResult.showCounter and (not FFlagLuaAppEdpMediaGalleryRedesign or not NoFFlagLuaAppEdpMediaGalleryRedesignIxp) then ReactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		RichText = true,
		LineHeight = 1,
		Size = UDim2.fromScale(0, 1),
		AutomaticSize = Enum.AutomaticSize.X,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Text = if FFlagLuaAppEdpMediaGalleryRedesign then `<b>{ItemIndex} / {#JoinResult.items}</b>` else v1:map(function(p2): string
			-- upvalues: JoinResult (copy)
			return `<b>{p2} / {#JoinResult.items}</b>`
		end),
		Font = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.CaptionLarge.Font else UseDesignTokensResult.Semantic.Typography.CaptionHeader.Font,
		TextSize = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.FontSize.FontSize_300 else UseDesignTokensResult.Semantic.Typography.CaptionHeader.FontSize,
		TextColor3 = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Content.Emphasis else UseDesignTokensResult.Semantic.Color.Text.Emphasis).Color3,
		TextTransparency = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Content.Emphasis else UseDesignTokensResult.Semantic.Color.Text.Emphasis).Transparency,
		ref = UseRefResult2
	}) else nil
	
	return ReactModule.createElement(if FFlagLuaAppEdpMediaGalleryRedesign and NoFFlagLuaAppEdpMediaGalleryRedesignIxp then "TextButton" else "Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ref = UseEventHandlerMapResult,
		AutoButtonColor = (not FFlagLuaAppEdpMediaGalleryRedesign or not NoFFlagLuaAppEdpMediaGalleryRedesignIxp) and nil,
		Text = if FFlagLuaAppEdpMediaGalleryRedesign and NoFFlagLuaAppEdpMediaGalleryRedesignIxp then "" else nil,
		[ReactModule.Event.Activated] = if FFlagLuaAppEdpMediaGalleryRedesign and NoFFlagLuaAppEdpMediaGalleryRedesignIxp then UseResult11 else nil,
		SelectionBehaviorRight = if FFlagLuaAppEdpMediaGalleryRedesign and NoFFlagLuaAppEdpMediaGalleryRedesignIxp then Enum.SelectionBehavior.Stop else nil,
		SelectionImageObject = if FFlagLuaAppEdpMediaGalleryRedesign and (NoFFlagLuaAppEdpMediaGalleryRedesignIxp and JoinResult.isFullscreen) then v6 else nil,
		SelectionGroup = if FFlagLuaAppEdpMediaGalleryRedesign and NoFFlagLuaAppEdpMediaGalleryRedesignIxp then true else nil
	}, {
		ScrollingFrame = ReactModule.createElement("ScrollingFrame", {
			Selectable = false,
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.fromScale(0, 0.5),
			Size = UDim2.new(1, 0, 0, UseStateResult.X / ItemAspectRatio),
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			CanvasPosition = UseBindingResult,
			ScrollingEnabled = false,
			ScrollBarImageTransparency = 1,
			ScrollBarThickness = if FFlagLuaAppEdpMediaGalleryRedesign and NoFFlagLuaAppEdpMediaGalleryRedesignIxp and JoinResult.clipsNonCurrentItems then 0 else nil,
			ScrollingDirection = Enum.ScrollingDirection.X,
			ClipsDescendants = if FFlagLuaAppEdpMediaGalleryRedesign and NoFFlagLuaAppEdpMediaGalleryRedesignIxp then JoinResult.clipsNonCurrentItems else false,
			ZIndex = 1,
			[ReactModule.Change.AbsoluteSize] = UseResult10,
			ref = if FFlagLuaAppEdpMediaGalleryAutoAdvance or LuaAppEdpMediaGalleryTouchDrag then UseRefResult4 else nil
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, JoinResult.itemPadding)
			}),
			Items = ReactModule.createElement(ReactModule.Fragment, {}, t)
		}),
		Counter = if JoinResult.showCounter and (not FFlagLuaAppEdpMediaGalleryRedesign or not NoFFlagLuaAppEdpMediaGalleryRedesignIxp) then ReactModule.createElement("Frame", {
			BackgroundTransparency = 0.3,
			BorderSizePixel = 0,
			ZIndex = 2,
			AnchorPoint = Vector2.new(0.5, 1),
			Position = UDim2.new(0.5, 0, 1, -Size300),
			Size = UDim2.fromOffset((UseRefResult2.current and UseRefResult2.current.AbsoluteSize.X or 0) + Size200 * 2, Size600),
			BackgroundColor3 = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Surface.Surface_0 else UseDesignTokensResult.Semantic.Color.Background.Default).Color3
		}, {
			TextLabel = TextLabel,
			Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
		}) else nil,
		PageIndicators = if FFlagLuaAppEdpMediaGalleryRedesign and (NoFFlagLuaAppEdpMediaGalleryRedesignIxp and LuaAppEdpMediaGalleryPageIndicators3 and #JoinResult.items > 1 and (not FFlagLuaAppEdpMediaGalleryFullScreen or not JoinResult.isFullscreen)) then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			AnchorPoint = Vector2.new(0.5, 1),
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.fromOffset(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_200 else UseDesignTokensResult.Global.Size_100),
			Position = UDim2.new(0.5, 0, 1, if v4 then -(if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_400 else UseDesignTokensResult.Global.Size_200) else -(if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_700 else UseDesignTokensResult.Global.Size_350))
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, Size350),
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			PageLeftGamepadIcon = if IsDirectionalMatch then ReactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = -1,
				Image = UserInputService:GetImageForKeyCode(Enum.KeyCode.ButtonL1),
				ImageTransparency = if ItemIndex <= 1 then 0.5 else nil,
				Size = UDim2.fromOffset(Size500, Size500)
			}) else nil,
			Indicators = ReactModule.createElement(MediaGalleryPageIndicatorsModule, {
				numberOfItems = #JoinResult.items,
				mediaGalleryStartIndex = JoinResult.startIndex or 1,
				currentItemProgressBinding = if FFlagLuaAppEdpMediaGalleryAutoAdvance then v3 else nil,
				mediaGalleryScrolledSignal = UseRefResult3.current,
				useSpring = JoinResult.useSpring,
				springConfig = JoinResult.springConfig
			}),
			PageRightGamepadIcon = if IsDirectionalMatch then ReactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Image = UserInputService:GetImageForKeyCode(Enum.KeyCode.ButtonR1),
				ImageTransparency = if #JoinResult.items <= ItemIndex then 0.5 else nil,
				Size = UDim2.fromOffset(Size500, Size500)
			}) else nil
		}) else nil,
		ScrollButtons = if FFlagLuaAppEdpMediaGalleryRedesign and (NoFFlagLuaAppEdpMediaGalleryRedesignIxp and IsPointerMatch) then ReactModule.createElement(CarouselScrollButtons, {
			ZIndex = 10,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.fromScale(0.5, 0),
			Size = UDim2.new(1, if FFlagLuaAppEdpMediaGalleryFullScreen and JoinResult.isFullscreen then 0 elseif FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_1000 else UseDesignTokensResult.Global.Size_500, 1, 0),
			buttonOffsetFromEdge = if FFlagLuaAppEdpMediaGalleryFullScreen and JoinResult.isFullscreen then if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_500 else UseDesignTokensResult.Global.Space_250 else nil,
			leftScrollingEnabled = ItemIndex > 1,
			rightScrollingEnabled = ItemIndex < #JoinResult.items,
			handleScrollLeft = UseResult1,
			handleScrollRight = UseResult2
		}) else nil,
		SizeConstraint = ReactModule.createElement("UISizeConstraint", {
			MinSize = Vector2.new(if FFlagFixMediaGalleryOversized then 0 else UseStateResult.X, UseStateResult.X / ItemAspectRatio)
		})
	})
end

return if FFlagLuaAppEdpMediaGalleryVideoPreview then ReactModule.memo(MediaGallerySnapping) else MediaGallerySnapping