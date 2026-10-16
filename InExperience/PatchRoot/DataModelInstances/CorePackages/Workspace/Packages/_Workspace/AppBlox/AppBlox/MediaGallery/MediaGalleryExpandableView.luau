local Parent = script:FindFirstAncestor("AppBlox").Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local UIBloxModule = require(Parent.UIBlox)
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local UseCursorFunction = UIBloxModule.App.SelectionCursor.useCursor
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local FoundationModule = require(Parent.Foundation)
local Icon = FoundationModule.Icon
local View = FoundationModule.View
local IconSize = FoundationModule.Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppEdpConsoleMediaGalleryVideo = SharedFlagsModule.FFlagLuaAppEdpConsoleMediaGalleryVideo
local FFlagLuaAppEdpConsoleMediaGalleryVideoPlayIcon = SharedFlagsModule.FFlagLuaAppEdpConsoleMediaGalleryVideoPlayIcon
local ConstantsModule = require(script.Parent.Constants)
local _ = require(script.Parent.MediaGalleryTypes)
local config = {
	titleText = "Media",
	numItemsShown = 4,
	itemAspectRatio = 1.7777777777777777,
	animationConfig = { dampingRatio = 1, frequency = 6.666666666666667 },
	onActivated = function() --[[ Line: 39 ]] end,
	onSelectionGained = function() --[[ Line: 40 ]] end,
	exitFullscreen = function() --[[ Line: 41 ]] end
}

return function(p1) --[[ Line: 79 | Named "MediaGalleryExpandableView" ]]
	-- upvalues: CryoModule (copy), config (copy), UseStyleFunction (copy), FFlagLuaAppEdpConsoleMediaGalleryVideoPlayIcon (copy), UseTokensFunction (copy), ConstantsModule (copy), ReactOtterModule (copy), ReactModule (copy), UseCursorFunction (copy), UseSelectionCursorFunction (copy), CursorKind (copy), View (copy), Icon (copy), IconSize (copy), FFlagLuaAppEdpConsoleMediaGalleryVideo (copy), StyledTextLabel (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = if FFlagLuaAppEdpConsoleMediaGalleryVideoPlayIcon then UseTokensFunction() else nil
	local JoinResult1 = CryoModule.Dictionary.join(ConstantsModule.getDefaultStyleProps(UseStyleResult), JoinResult.styleProps or {})
	local BorderRadius = JoinResult1.borderRadius
	local Gutter = JoinResult1.gutter
	local ContentGap = JoinResult1.contentGap
	local TitleFont = JoinResult1.titleFont
	local TitleTextColor = JoinResult1.titleTextColor
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.zero)
	local UseResult = ReactModule.useCallback(function(Frame, _, _, _) --[[ Line: 96 ]]
		-- upvalues: Gutter (copy), JoinResult (copy), UseStateResult2 (copy)
		local XRatio = (Frame.AbsoluteSize.X - Gutter * (JoinResult.numItemsShown - 1)) / JoinResult.numItemsShown
		UseStateResult2(Vector2.new(XRatio, XRatio / JoinResult.itemAspectRatio))
	end, {
		Gutter,
		JoinResult.itemAspectRatio,
		JoinResult.numItemsShown
	})
	local UseResult1 = ReactModule.useCallback(function(Ancestor, _, Frame, Frame1) --[[ Line: 110 ]]
		-- upvalues: UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), JoinResult (copy)
		if not Ancestor then
			return nil
		end
		local IsDescendantOf = Frame1 ~= nil and Frame1:IsDescendantOf(Ancestor)
		local IsDescendantOf1 = Frame ~= nil and Frame:IsDescendantOf(Ancestor)
		local IsDescendantOf1_1 = not IsDescendantOf and IsDescendantOf1
		
		if IsDescendantOf and not IsDescendantOf1 then
			UseAnimatedBindingResult2(ReactOtterModule.spring(JoinResult.expandableAreaHeightOffset, JoinResult.animationConfig))
			JoinResult.mediaGalleryGainFocused(true)
			
			return nil
		end
		if not IsDescendantOf1_1 then
			return nil
		end
		if Frame1 == nil or Frame1.AbsolutePosition.Y <= Frame.AbsolutePosition.Y then
			UseAnimatedBindingResult2(ReactOtterModule.spring(0, JoinResult.animationConfig))
		end
		JoinResult.exitFullscreen()
		JoinResult.mediaGalleryGainFocused(false)
		
		return nil
	end, {
		JoinResult.expandableAreaHeightOffset,
		JoinResult.animationConfig,
		JoinResult.exitFullscreen,
		JoinResult.mediaGalleryGainFocused
	})
	local UseCursorResult = UseCursorFunction(BorderRadius)
	local UseSelectionCursorResult = UseSelectionCursorFunction(CursorKind.Invisible)
	local UseCursorResult1 = if JoinResult.showCursor then UseCursorResult else UseSelectionCursorResult
	
	return ReactModule.createElement("CanvasGroup", {
		BackgroundTransparency = 1,
		GroupTransparency = JoinResult.groupTransparency,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		ref = if FFlagLuaAppEdpConsoleMediaGalleryVideo then JoinResult.rootRef else nil
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, ContentGap)
		}),
		ExpandableArea = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UseAnimatedBindingResult:map(function(YOffset): UDim2 --[[ Line: 229 ]]
				return UDim2.new(1, 0, 0, YOffset)
			end)
		}),
		Title = ReactModule.createElement(StyledTextLabel, {
			layoutOrder = 2,
			text = JoinResult.titleText,
			fontStyle = TitleFont,
			colorStyle = TitleTextColor,
			textXAlignment = Enum.TextXAlignment.Left,
			size = UDim2.new(1, 0, 0, if TitleFont.RelativeSize then TitleFont.RelativeSize * UseStyleResult.Font.BaseSize else TitleFont.FontSize)
		}),
		MediaGallery = ReactModule.createElement("ScrollingFrame", {
			Size = UDim2.new(1, 0, 0, UseStateResult.Y),
			BackgroundTransparency = 1,
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			ScrollBarImageTransparency = 1,
			ScrollBarThickness = 0,
			ScrollingDirection = Enum.ScrollingDirection.X,
			Selectable = false,
			LayoutOrder = 3,
			[ReactModule.Change.AbsoluteSize] = UseResult,
			[ReactModule.Event.SelectionChanged] = UseResult1
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, Gutter)
			}),
			Items = ReactModule.createElement(ReactModule.Fragment, {}, (ReactModule.useMemo(function() --[[ Line: 161 ]]
				-- upvalues: JoinResult (copy), ReactModule (upval), UseStateResult (copy), UseCursorResult1 (copy), BorderRadius (copy), FFlagLuaAppEdpConsoleMediaGalleryVideoPlayIcon (upval), View (upval), Icon (upval), IconSize (upval), UseTokensResult (copy)
				local ImageButtons = {}
				
				for LayoutOrder, item in JoinResult.items do
					ImageButtons["Item" .. LayoutOrder] = ReactModule.createElement("ImageButton", {
						LayoutOrder = LayoutOrder,
						Size = UDim2.fromOffset(UseStateResult.X, UseStateResult.Y),
						Image = item.imageId,
						ScaleType = Enum.ScaleType.Crop,
						BackgroundTransparency = 1,
						AutoButtonColor = false,
						SelectionImageObject = UseCursorResult1,
						[ReactModule.Event.Activated] = function() --[[ Line: 172 ]]
							-- upvalues: JoinResult (upval), LayoutOrder (copy)
							JoinResult.onActivated(LayoutOrder)
						end,
						[ReactModule.Event.SelectionGained] = function() --[[ Line: 175 ]]
							-- upvalues: JoinResult (upval), LayoutOrder (copy)
							JoinResult.onSelectionGained(LayoutOrder)
						end
					}, {
						Corner = ReactModule.createElement("UICorner", { CornerRadius = BorderRadius }),
						PlayIcon = if FFlagLuaAppEdpConsoleMediaGalleryVideoPlayIcon and item.videoId then ReactModule.createElement(View, {
							tag = "auto-xy padding-medium radius-circle bg-over-media-100",
							ZIndex = 2,
							AnchorPoint = Vector2.new(0.5, 0.5),
							Position = UDim2.fromScale(0.5, 0.5),
							selection = { Selectable = false }
						}, {
							Icon = ReactModule.createElement(Icon, {
								name = "play-large",
								size = IconSize.Medium,
								style = UseTokensResult.Color.Content.Emphasis
							})
						}) else nil
					})
				end
				return ImageButtons
			end, {
				UseStateResult, JoinResult.items, JoinResult.onActivated,
				JoinResult.onSelectionGained, UseCursorResult1, BorderRadius,
				if FFlagLuaAppEdpConsoleMediaGalleryVideoPlayIcon then UseTokensResult else nil
			})))
		})
	})
end