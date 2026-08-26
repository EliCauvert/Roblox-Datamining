local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local parent = socialCarousel.Parent
local textService = game:GetService("TextService")
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local enums = foundationModule.Enums
local image = foundationModule.Image
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local icon = foundationModule.Icon
local iconSize = foundationModule.Enums.IconSize
local flags = foundationModule.Utility.Flags
local statusIndicator = foundationModule.StatusIndicator
local statusIndicatorVariant = foundationModule.Enums.StatusIndicatorVariant
local radius = foundationModule.Enums.Radius
local fFlagSocialCarouselShowLoadingSkeletonModule = require(socialCarousel.Flags.FFlagSocialCarouselShowLoadingSkeleton)
local fFlagSocialCarouselRemoveStrokeForAddFriendsModule = require(socialCarousel.Flags.FFlagSocialCarouselRemoveStrokeForAddFriends)
local fIntSocalCarouselMaxNewRequestsCountModule = require(socialCarousel.Flags.FIntSocalCarouselMaxNewRequestsCount)

return function(p1)
	-- upvalues: reactModule (ref), useTokens (ref), fFlagSocialCarouselShowLoadingSkeletonModule (ref), textService (ref), view (ref), image (ref), enums (ref), text (ref), statusIndicator (ref), flags (ref), statusIndicatorVariant (ref), fIntSocalCarouselMaxNewRequestsCountModule (ref), skeleton (ref), radius (ref), fFlagSocialCarouselRemoveStrokeForAddFriendsModule (ref), icon (ref), iconSize (ref)
	local tileRef = p1.tileRef or reactModule.useRef(nil)
	local var1 = useTokens()
	local var2, var3 = reactModule.useState(false)
	local titleSmall = var1.Typography.TitleSmall
	local isLoading = fFlagSocialCarouselShowLoadingSkeletonModule and p1.isLoading
	local var4 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), textService (copy), titleSmall (ref)
		return if p1.title then textService:GetTextSize(p1.title, titleSmall.FontSize, titleSmall.Font, Vector2.new(500, 500)) else Vector2.new(0, 0)
	end, { p1.title })
	local var5 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), reactModule (copy), view (copy), image (copy)
		return if not (not p1.presenceIconEnabled and not p1.titleIcon) then if p1.presenceIconEnabled then reactModule.createElement(view, {
			tag = "size-300-300 bg-system-success radius-circle",
			LayoutOrder = 1
		}) elseif p1.titleIcon then reactModule.createElement(image, {
			tag = "size-300-300 radius-circle",
			LayoutOrder = 1,
			Image = p1.titleIcon
		}) else nil else nil
	end, { p1.titleIcon, p1.presenceIconEnabled })
	
	return reactModule.createElement(view, {
		tag = "auto-none",
		Size = p1.itemSize,
		LayoutOrder = p1.index,
		ref = tileRef,
		onStateChanged = reactModule.useCallback(function(p2)
			-- upvalues: var3 (ref), enums (copy)
			var3(if p2 ~= enums.ControlState.Hover then p2 == enums.ControlState.Pressed else true)
		end, {}),
		onActivated = if isLoading then nil else p1.onActivated,
		stateLayer = { affordance = enums.StateLayerAffordance.None },
		selection = if isLoading or not p1.selectionOrder then nil else {
			SelectionOrder = p1.selectionOrder,
			Selectable = p1.selectable ~= nil or p1.selectable
		}
	}, {
		Content = reactModule.createElement(view, { tag = "size-full col align-x-center gap-small" }, {
			Image = if isLoading then reactModule.createElement(view, { tag = "size-full aspect-1-1", LayoutOrder = 1 }, {
				AvatarSkeleton = reactModule.createElement(skeleton, { tag = "size-full", radius = radius.Circle })
			}) else reactModule.createElement(image, {
				LayoutOrder = 1,
				Image = p1.image,
				tag = {
					["size-full"] = true,
					["aspect-1-1"] = true,
					["bg-shift-300"] = not var2 and not p1.altBackground,
					["bg-system-neutral"] = not var2 and p1.altBackground,
					["radius-circle"] = true,
					["bg-shift-400"] = var2 and not p1.altBackground,
					["bg-system-contrast"] = var2 and p1.altBackground,
					["align-x-center"] = true,
					["align-y-center"] = true,
					row = true
				},
				stroke = if fFlagSocialCarouselRemoveStrokeForAddFriendsModule then nil else {
					Color = var1.Color.Stroke.Emphasis.Color3,
					Transparency = var1.Color.Stroke.Emphasis.Transparency,
					Thickness = var1.Stroke.Thick,
					BorderStrokePosition = Enum.BorderStrokePosition.Inner
				}
			}, {
				Icon = if p1.icon then reactModule.createElement(icon, { name = p1.icon, size = iconSize.Large }) else nil
			}),
			TextContainer = reactModule.createElement(view, {
				tag = "size-full-0 row auto-y gap-xsmall align-x-center align-y-center",
				LayoutOrder = 2
			}, {
				TitleIcon = if isLoading then nil else var5,
				Title = if p1.title and not isLoading then reactModule.createElement(text, {
					tag = "auto-xy text-align-x-left clip text-truncate-end",
					LayoutOrder = 2,
					fontStyle = var1.Typography.TitleSmall,
					Text = p1.title
				}, {
					UISizeConstraint = reactModule.useMemo(function()
						-- upvalues: tileRef (ref), var5 (ref), reactModule (copy), var4 (ref)
						return if tileRef.current then reactModule.createElement("UISizeConstraint", {
							MaxSize = Vector2.new(if var5 then tileRef.current.AbsoluteSize.X - 16 else tileRef.current.AbsoluteSize.X, var4.Y)
						}) else nil
					end, { var4 })
				}) else reactModule.createElement(skeleton, {
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, 16),
					radius = if isLoading then radius.Small else nil
				})
			}),
			Subtitle = if isLoading then nil else reactModule.useMemo(function()
				-- upvalues: p1 (ref), reactModule (copy), text (copy), var1 (ref)
				return if p1.subtitle then reactModule.createElement(text, {
					tag = "size-full-0 auto-y clip text-truncate-end",
					LayoutOrder = 3,
					fontStyle = var1.Typography.LabelSmall,
					Text = p1.subtitle
				}) else nil
			end, { p1.subtitle })
		}),
		Badge = if isLoading then nil else reactModule.useMemo(function()
			-- upvalues: p1 (ref), reactModule (copy), statusIndicator (copy), flags (copy), statusIndicatorVariant (copy), fIntSocalCarouselMaxNewRequestsCountModule (copy)
			return if p1.badge then reactModule.createElement(statusIndicator, {
				Position = UDim2.new(0.9, 0, 0.1, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				variant = if flags.FoundationStatusIndicatorVariantExperiment then statusIndicatorVariant.Alert else statusIndicatorVariant.Emphasis,
				value = tonumber(p1.badge),
				max = fIntSocalCarouselMaxNewRequestsCountModule
			}) else nil
		end, { p1.badge })
	})
end