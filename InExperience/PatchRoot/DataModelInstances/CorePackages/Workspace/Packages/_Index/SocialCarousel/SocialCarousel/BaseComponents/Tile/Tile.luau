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
local fFlagLuaAppCompositionSupport = require(parent.SharedFlags).FFlagLuaAppCompositionSupport
local fFlagSocialCarouselShowLoadingSkeletonModule = require(socialCarousel.Flags.FFlagSocialCarouselShowLoadingSkeleton)
local fIntSocalCarouselMaxNewRequestsCountModule = require(socialCarousel.Flags.FIntSocalCarouselMaxNewRequestsCount)

return function(p0) --[[ line: 44 | named "Tile" ]]
	-- upvalues: reactModule (ref), useTokens (ref), fFlagSocialCarouselShowLoadingSkeletonModule (ref), textService (ref), view (ref), image (ref), enums (ref), text (ref), statusIndicator (ref), flags (ref), statusIndicatorVariant (ref), fIntSocalCarouselMaxNewRequestsCountModule (ref), skeleton (ref), radius (ref), fFlagLuaAppCompositionSupport (ref), icon (ref), iconSize (ref)
	local tileRef = p0.tileRef or reactModule.useRef(nil)
	local var7 = useTokens()
	local var8, var9 = reactModule.useState(false)
	local titleSmall = var7.Typography.TitleSmall
	local isLoading = fFlagSocialCarouselShowLoadingSkeletonModule and p0.isLoading
	local var11 = reactModule.useMemo(function() --[[ line: 51 ]]
		-- upvalues: p0 (ref), textService (copy), titleSmall (ref)
		return if p0.title then textService:GetTextSize(p0.title, titleSmall.FontSize, titleSmall.Font, Vector2.new(500, 500)) else Vector2.new(0, 0)
	end, { p0.title })
	local var12 = reactModule.useMemo(function() --[[ line: 59 ]]
		-- upvalues: p0 (ref), reactModule (copy), view (copy), image (copy)
		return if not (not p0.presenceIconEnabled and not p0.titleIcon) then if p0.presenceIconEnabled then reactModule.createElement(view, {
			tag = "size-300-300 bg-system-success radius-circle",
			LayoutOrder = 1
		}) elseif p0.titleIcon then reactModule.createElement(image, {
			tag = "size-300-300 radius-circle",
			LayoutOrder = 1,
			Image = p0.titleIcon
		}) else nil else nil
	end, { p0.titleIcon, p0.presenceIconEnabled })
	
	return reactModule.createElement(view, {
		tag = "auto-none",
		Size = p0.itemSize,
		LayoutOrder = p0.index,
		ref = tileRef,
		onStateChanged = reactModule.useCallback(function(p1) --[[ line: 92 ]]
			-- upvalues: var9 (ref), enums (copy)
			var9(if p1 ~= enums.ControlState.Hover then p1 == enums.ControlState.Pressed else true)
		end, {}),
		onActivated = if isLoading then nil else p0.onActivated,
		stateLayer = { affordance = enums.StateLayerAffordance.None },
		selection = if isLoading or not p0.selectionOrder then nil else {
			SelectionOrder = p0.selectionOrder,
			Selectable = p0.selectable ~= nil or p0.selectable
		}
	}, {
		Content = reactModule.createElement(view, { tag = "size-full col align-x-center gap-small" }, {
			Image = if isLoading then reactModule.createElement(view, { tag = "size-full aspect-1-1", LayoutOrder = 1 }, {
				AvatarSkeleton = reactModule.createElement(skeleton, { tag = "size-full", radius = radius.Circle })
			}) else reactModule.createElement(image, {
				LayoutOrder = 1,
				Image = p0.image,
				tag = {
					["size-full"] = true,
					["aspect-1-1"] = true,
					["bg-shift-300"] = not var8 and not p0.altBackground,
					["bg-system-neutral"] = not var8 and p0.altBackground,
					["stroke-thick"] = not fFlagLuaAppCompositionSupport,
					["stroke-emphasis"] = not fFlagLuaAppCompositionSupport,
					["radius-circle"] = true,
					["bg-shift-400"] = var8 and not p0.altBackground,
					["bg-system-contrast"] = var8 and p0.altBackground,
					["align-x-center"] = true,
					["align-y-center"] = true,
					row = true
				},
				stroke = if fFlagLuaAppCompositionSupport then {
					Color = var7.Color.Stroke.Emphasis.Color3,
					Transparency = var7.Color.Stroke.Emphasis.Transparency,
					Thickness = var7.Stroke.Thick,
					BorderStrokePosition = Enum.BorderStrokePosition.Inner
				} else nil
			}, {
				Icon = if p0.icon then reactModule.createElement(icon, { name = p0.icon, size = iconSize.Large }) else nil
			}),
			TextContainer = reactModule.createElement(view, {
				tag = "size-full-0 row auto-y gap-xsmall align-x-center align-y-center",
				LayoutOrder = 2
			}, {
				TitleIcon = if isLoading then nil else var12,
				Title = if p0.title and not isLoading then reactModule.createElement(text, {
					tag = "auto-xy text-align-x-left clip text-truncate-end",
					LayoutOrder = 2,
					fontStyle = var7.Typography.TitleSmall,
					Text = p0.title
				}, {
					UISizeConstraint = reactModule.useMemo(function() --[[ line: 81 ]]
						-- upvalues: tileRef (ref), var12 (ref), reactModule (copy), var11 (ref)
						return if tileRef.current then reactModule.createElement("UISizeConstraint", {
							MaxSize = Vector2.new(if var12 then tileRef.current.AbsoluteSize.X - 16 else tileRef.current.AbsoluteSize.X, var11.Y)
						}) else nil
					end, { var11 })
				}) else reactModule.createElement(skeleton, {
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, 16),
					radius = if isLoading then radius.Small else nil
				})
			}),
			Subtitle = if isLoading then nil else reactModule.useMemo(function() --[[ line: 96 ]]
				-- upvalues: p0 (ref), reactModule (copy), text (copy), var7 (ref)
				return if p0.subtitle then reactModule.createElement(text, {
					tag = "size-full-0 auto-y clip text-truncate-end",
					LayoutOrder = 3,
					fontStyle = var7.Typography.LabelSmall,
					Text = p0.subtitle
				}) else nil
			end, { p0.subtitle })
		}),
		Badge = if isLoading then nil else reactModule.useMemo(function() --[[ line: 109 ]]
			-- upvalues: p0 (ref), reactModule (copy), statusIndicator (copy), flags (copy), statusIndicatorVariant (copy), fIntSocalCarouselMaxNewRequestsCountModule (copy)
			return if p0.badge then reactModule.createElement(statusIndicator, {
				Position = UDim2.new(0.9, 0, 0.1, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				variant = if flags.FoundationStatusIndicatorVariantExperiment then statusIndicatorVariant.Alert else statusIndicatorVariant.Emphasis,
				value = tonumber(p0.badge),
				max = fIntSocalCarouselMaxNewRequestsCountModule
			}) else nil
		end, { p0.badge })
	})
end