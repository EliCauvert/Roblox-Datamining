local avatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local parent = avatarSwitcher.Parent
local sessionService = game:GetService("SessionService")
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local avatarExperienceAnalyticsModule = require(parent.AvatarExperienceAnalytics)
local addUnifiedEventLogging = avatarExperienceAnalyticsModule.addUnifiedEventLogging
local unifiedEventLogEnums = avatarExperienceAnalyticsModule.UnifiedEventLogEnums
local unifiedLoggingSurface = require(parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local getAvatarSwitcherStoreModule = require(avatarSwitcher.Stores.getAvatarSwitcherStore)
local _ = require(avatarSwitcher.types)
local fFlagAvatarSwitcherUseAvatarInventoryEndpoint = require(parent.AvatarExperienceFlags).FFlagAvatarSwitcherUseAvatarInventoryEndpoint
local fFlagAXBackgroundsInOutfitThumbnails = require(parent.SharedFlags).FFlagAXBackgroundsInOutfitThumbnails

return reactModule.memo(function(p0)
	-- upvalues: signalsReactModule (ref), getAvatarSwitcherStoreModule (ref), reactModule (ref), useTokens (ref), addUnifiedEventLogging (ref), unifiedEventLogEnums (ref), unifiedLoggingSurface (ref), sessionService (ref), signalsModule (ref), foundationModule (ref), fFlagAvatarSwitcherUseAvatarInventoryEndpoint (ref), fFlagAXBackgroundsInOutfitThumbnails (ref)
	local var8 = signalsReactModule.useSignalState(getAvatarSwitcherStoreModule)
	local var9 = reactModule.useRef(nil)
	local var10 = useTokens()
	local id = p0.outfitInfo.id
	reactModule.useEffect(function()
		-- upvalues: addUnifiedEventLogging (copy), var9 (ref), unifiedEventLogEnums (copy), unifiedLoggingSurface (copy), p0 (ref), id (ref), sessionService (copy)
		task.delay(0, function()
			-- upvalues: addUnifiedEventLogging (copy), var9 (copy), unifiedEventLogEnums (copy), unifiedLoggingSurface (copy), p0 (copy), id (copy), sessionService (copy)
			addUnifiedEventLogging(var9, {
				elementName = "OUTFIT_TILE",
				action = unifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
				surface = unifiedLoggingSurface.IN_EXPERIENCE_AVATAR_SWITCHER,
				gridPositionRow = p0.gridPosition.row,
				gridPositionColumn = p0.gridPosition.column,
				itemId = id
			}, { sessionTagName = sessionService:GetSessionTag("level2a") })
		end)
	end, { p0.gridPosition, id })
	local var11 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), id (ref), var8 (ref)
		return signalsModule.createComputed(function(p1)
			-- upvalues: id (copy), var8 (copy)
			return id ~= nil and var8.getSelectedOutfitId(p1) == id
		end)
	end, { var8, id })) and not p0.disabled
	
	return reactModule.createElement(foundationModule.View, {
		tag = "col gap-small auto-y size-full-0",
		GroupTransparency = if p0.disabled then 0.5 else nil,
		LayoutOrder = p0.LayoutOrder
	}, {
		Thumbnail = id and reactModule.createElement(foundationModule.Image, {
			LayoutOrder = 1,
			tag = {
				[if fFlagAvatarSwitcherUseAvatarInventoryEndpoint then "radius-medium bg-shift-200 padding-small" else "radius-medium bg-shift-200"] = true,
				["stroke-standard stroke-system-contrast"] = var11
			},
			Size = UDim2.fromScale(1, 1.5),
			SizeConstraint = Enum.SizeConstraint.RelativeXX,
			Image = if fFlagAXBackgroundsInOutfitThumbnails then `rbxthumb://type=Outfit&id={id}&w=150&h=150&includeBackground=true` else `rbxthumb://type=Outfit&id={id}&w=150&h=150`,
			ScaleType = Enum.ScaleType.Crop,
			onActivated = if p0.disabled then nil else reactModule.useCallback(function()
				-- upvalues: var8 (ref), id (ref)
				var8.selectOutfit(id)
			end, { var8, id }),
			ref = var9
		}, {
			WarningIcon = fFlagAvatarSwitcherUseAvatarInventoryEndpoint and (p0.outfitInfo.hasWarning and reactModule.createElement(foundationModule.Image, {
				tag = "size-500",
				Image = "icons/actions/info",
				imageStyle = if not var11 then { Transparency = 0.5 } else nil
			}))
		}),
		ThumbnailShimmer = not id and reactModule.createElement(foundationModule.View, {
			LayoutOrder = 1,
			Size = UDim2.fromScale(1, 1.5),
			SizeConstraint = Enum.SizeConstraint.RelativeXX
		}, {
			Shimmer = reactModule.createElement(foundationModule.Skeleton, { Size = UDim2.fromScale(1, 1) })
		}),
		NameLabel = p0.outfitInfo.name and reactModule.createElement(foundationModule.Text, {
			tag = "size-full-0 auto-y text-align-x-left text-title-small content-emphasis text-wrap",
			LayoutOrder = 2,
			Text = p0.outfitInfo.name
		}),
		NameLabelShimmer = not p0.outfitInfo.name and reactModule.createElement(foundationModule.Skeleton, {
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, var10.FontSize.FontSize_300)
		})
	})
end)