local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local FoundationModule = require(Parent.Foundation)
local GetTextSizeFunction = require(Parent.Style).GetTextSize
local ReactModule = require(Parent.React)
local Enums = FoundationModule.Enums
local Image = FoundationModule.Image
local Skeleton = FoundationModule.Skeleton
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize
local StatusIndicator = FoundationModule.StatusIndicator
local StatusIndicatorVariant = FoundationModule.Enums.StatusIndicatorVariant
local Radius = FoundationModule.Enums.Radius
local FFlagSocialCarouselShowLoadingSkeletonModule = require(SocialCarousel.Flags.FFlagSocialCarouselShowLoadingSkeleton)
local FFlagSocialCarouselUnselectableSkeletonModule = require(SocialCarousel.Flags.FFlagSocialCarouselUnselectableSkeleton)
local FFlagSocialCarouselRemoveStrokeForAddFriendsModule = require(SocialCarousel.Flags.FFlagSocialCarouselRemoveStrokeForAddFriends)
local FFlagSocialCarouselXSmallTileTextModule = require(SocialCarousel.Flags.FFlagSocialCarouselXSmallTileText)
local FFlagSocialCarouselXXSmallTilesModule = require(SocialCarousel.Flags.FFlagSocialCarouselXXSmallTiles)
local UseXSmallTileTypographyModule = require(SocialCarousel.Hooks.useXSmallTileTypography)
local FIntSocalCarouselMaxNewRequestsCountModule = require(SocialCarousel.Flags.FIntSocalCarouselMaxNewRequestsCount)

return function(p1)
	-- upvalues: ReactModule (copy), UseTokensFunction (copy), FFlagSocialCarouselXXSmallTilesModule (copy), FFlagSocialCarouselXSmallTileTextModule (copy), UseXSmallTileTypographyModule (copy), FFlagSocialCarouselShowLoadingSkeletonModule (copy), GetTextSizeFunction (copy), View (copy), Image (copy), Enums (copy), Text (copy), StatusIndicator (copy), StatusIndicatorVariant (copy), FIntSocalCarouselMaxNewRequestsCountModule (copy), FFlagSocialCarouselUnselectableSkeletonModule (copy), Skeleton (copy), Radius (copy), FFlagSocialCarouselRemoveStrokeForAddFriendsModule (copy), Icon (copy), IconSize (copy)
	local TileRef = p1.tileRef or ReactModule.useRef(nil)
	local UseTokensResult = UseTokensFunction()
	local v1 = nil
	local UseResult = nil
	local v2 = nil
	local UseResult1 = nil
	
	if FFlagSocialCarouselXXSmallTilesModule then
		local UseBindingResult2
		v1, UseBindingResult2 = ReactModule.useBinding(0)
		UseResult = ReactModule.useCallback(function(Frame)
			-- upvalues: UseBindingResult2 (copy), p1 (copy)
			UseBindingResult2(Frame.AbsoluteSize.X * (p1.iconScale or 0))
		end, { p1.iconScale })
		local UseBindingResult2_1
		v2, UseBindingResult2_1 = ReactModule.useBinding(0)
		UseResult1 = ReactModule.useCallback(function(Frame)
			-- upvalues: UseBindingResult2_1 (copy)
			UseBindingResult2_1(Frame.AbsoluteSize.X)
		end, {})
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseXSmallTileTypographyModuleResult = if FFlagSocialCarouselXSmallTileTextModule then UseXSmallTileTypographyModule() else nil
	local Title = if UseXSmallTileTypographyModuleResult then UseXSmallTileTypographyModuleResult.title else UseTokensResult.Typography.TitleSmall
	local Label = if UseXSmallTileTypographyModuleResult then UseXSmallTileTypographyModuleResult.label else UseTokensResult.Typography.LabelSmall
	local IsLoading = FFlagSocialCarouselShowLoadingSkeletonModule and p1.isLoading
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), GetTextSizeFunction (upval), Title (copy)
		return if p1.title then GetTextSizeFunction(p1.title, Title.FontSize, Title.Font, Vector2.new(500, 500), { addTemporaryPadding = false }) else Vector2.new(0, 0)
	end, {
		p1.title,
		if FFlagSocialCarouselXSmallTileTextModule or FFlagSocialCarouselXXSmallTilesModule then Title else nil
	})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), ReactModule (upval), View (upval), Image (upval)
		return if p1.presenceIconEnabled or p1.titleIcon then if p1.presenceIconEnabled then ReactModule.createElement(View, {
			tag = "size-300-300 bg-system-success radius-circle",
			LayoutOrder = 1
		}) elseif p1.titleIcon then ReactModule.createElement(Image, {
			tag = "size-300-300 radius-circle",
			LayoutOrder = 1,
			Image = p1.titleIcon
		}) else nil else nil
	end, { p1.titleIcon, p1.presenceIconEnabled })
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: FFlagSocialCarouselXXSmallTilesModule (upval), v2 (ref), ReactModule (upval), UseMemoResult1 (copy), p1 (copy), UseMemoResult (copy), TileRef (copy)
		return if FFlagSocialCarouselXXSmallTilesModule and v2 then ReactModule.createElement("UISizeConstraint", {
			MaxSize = v2:map(function(p2): Vector2
				-- upvalues: UseMemoResult1 (upval), p1 (upval), UseMemoResult (upval)
				return Vector2.new(math.max(0, p2 - (if UseMemoResult1 then 16 else 0) + 2 * (p1.titleOverhang or 0)), UseMemoResult.Y)
			end)
		}) elseif TileRef.current then ReactModule.createElement("UISizeConstraint", {
			MaxSize = Vector2.new(if UseMemoResult1 then TileRef.current.AbsoluteSize.X - 16 else TileRef.current.AbsoluteSize.X, UseMemoResult.Y)
		}) else nil
	end, {
		UseMemoResult,
		if FFlagSocialCarouselXXSmallTilesModule then p1.titleOverhang else nil,
		if FFlagSocialCarouselXXSmallTilesModule then v2 else nil,
		if FFlagSocialCarouselXXSmallTilesModule then UseMemoResult1 else nil
	})
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), ReactModule (upval), Text (upval), Label (copy)
		return if p1.subtitle then ReactModule.createElement(Text, {
			tag = "size-full-0 auto-y clip text-truncate-end",
			LayoutOrder = 3,
			fontStyle = Label,
			Text = p1.subtitle
		}) else nil
	end, {
		p1.subtitle,
		if FFlagSocialCarouselXSmallTileTextModule then Label else nil
	})
	local UseMemoResult4 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), ReactModule (upval), StatusIndicator (upval), StatusIndicatorVariant (upval), FIntSocalCarouselMaxNewRequestsCountModule (upval)
		return if p1.badge then ReactModule.createElement(StatusIndicator, {
			Position = UDim2.new(0.9, 0, 0.1, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			variant = StatusIndicatorVariant.Emphasis,
			value = tonumber(p1.badge),
			max = FIntSocalCarouselMaxNewRequestsCountModule
		}) else nil
	end, { p1.badge })
	
	return ReactModule.createElement(View, {
		tag = "auto-none",
		testId = p1.testId,
		Size = p1.itemSize,
		LayoutOrder = p1.index,
		ref = TileRef,
		onAbsoluteSizeChanged = UseResult1,
		onStateChanged = ReactModule.useCallback(function(Hover)
			-- upvalues: UseStateResult2 (copy), Enums (upval)
			UseStateResult2(Hover == Enums.ControlState.Hover or Hover == Enums.ControlState.Pressed)
		end, {}),
		onActivated = if IsLoading then nil else p1.onActivated,
		stateLayer = { affordance = Enums.StateLayerAffordance.None },
		selection = if FFlagSocialCarouselUnselectableSkeletonModule and IsLoading then { Selectable = false } elseif IsLoading or not p1.selectionOrder then nil else {
			SelectionOrder = p1.selectionOrder,
			Selectable = p1.selectable == nil or p1.selectable
		}
	}, {
		Content = ReactModule.createElement(View, { tag = "size-full col align-x-center gap-small" }, {
			Image = if IsLoading then ReactModule.createElement(View, { tag = "size-full aspect-1-1", LayoutOrder = 1 }, {
				AvatarSkeleton = ReactModule.createElement(Skeleton, { tag = "size-full", radius = Radius.Circle })
			}) else ReactModule.createElement(Image, {
				LayoutOrder = 1,
				Image = p1.image,
				tag = {
					["size-full"] = true,
					["aspect-1-1"] = true,
					["bg-shift-300"] = not UseStateResult and not p1.altBackground,
					["bg-system-neutral"] = not UseStateResult and p1.altBackground,
					["radius-circle"] = true,
					["bg-shift-400"] = UseStateResult and not p1.altBackground,
					["bg-system-contrast"] = UseStateResult and p1.altBackground,
					["align-x-center"] = true,
					["align-y-center"] = true,
					row = true
				},
				stroke = if FFlagSocialCarouselRemoveStrokeForAddFriendsModule then nil else {
					Color = UseTokensResult.Color.Stroke.Emphasis.Color3,
					Transparency = UseTokensResult.Color.Stroke.Emphasis.Transparency,
					Thickness = UseTokensResult.Stroke.Thick,
					BorderStrokePosition = Enum.BorderStrokePosition.Inner
				},
				onAbsoluteSizeChanged = if FFlagSocialCarouselXXSmallTilesModule and p1.iconScale then UseResult else nil
			}, {
				Icon = if p1.icon then ReactModule.createElement(Icon, {
					name = p1.icon,
					size = if FFlagSocialCarouselXXSmallTilesModule and p1.iconScale then v1 else IconSize.Large,
					variant = if FFlagSocialCarouselXXSmallTilesModule then p1.iconVariant else nil
				}) else nil
			}),
			TextContainer = ReactModule.createElement(View, {
				tag = "size-full-0 row auto-y gap-xsmall align-x-center align-y-center",
				LayoutOrder = 2
			}, {
				TitleIcon = if IsLoading then nil else UseMemoResult1,
				Title = if p1.title and not IsLoading then ReactModule.createElement(Text, {
					tag = "auto-xy text-align-x-left clip text-truncate-end",
					LayoutOrder = 2,
					fontStyle = Title,
					Text = p1.title
				}, { UISizeConstraint = UseMemoResult2 }) else ReactModule.createElement(Skeleton, {
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, 16),
					radius = if IsLoading then Radius.Small else nil
				})
			}),
			Subtitle = if IsLoading then nil else UseMemoResult3
		}),
		Badge = if IsLoading then nil else UseMemoResult4
	})
end