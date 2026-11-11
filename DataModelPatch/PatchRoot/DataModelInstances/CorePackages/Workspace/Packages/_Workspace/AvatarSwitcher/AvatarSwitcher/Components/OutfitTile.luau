local AvatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local Parent = AvatarSwitcher.Parent
local SessionService = game:GetService("SessionService")
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local AvatarExperienceAnalyticsModule = require(Parent.AvatarExperienceAnalytics)
local AddUnifiedEventLoggingFunction = AvatarExperienceAnalyticsModule.addUnifiedEventLogging
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local UnifiedLoggingSurface = require(Parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local GetAvatarSwitcherStoreModule = require(AvatarSwitcher.Stores.getAvatarSwitcherStore)
local _ = require(AvatarSwitcher.types)
local FFlagAvatarSwitcherUseAvatarInventoryEndpoint = require(Parent.AvatarExperienceFlags).FFlagAvatarSwitcherUseAvatarInventoryEndpoint
local FFlagAXBackgroundsInOutfitThumbnails = require(Parent.SharedFlags).FFlagAXBackgroundsInOutfitThumbnails

return ReactModule.memo(function(Frame)
	-- upvalues: SignalsReactModule (copy), GetAvatarSwitcherStoreModule (copy), ReactModule (copy), UseTokensFunction (copy), AddUnifiedEventLoggingFunction (copy), UnifiedEventLogEnums (copy), UnifiedLoggingSurface (copy), SessionService (copy), SignalsModule (copy), FoundationModule (copy), FFlagAvatarSwitcherUseAvatarInventoryEndpoint (copy), FFlagAXBackgroundsInOutfitThumbnails (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetAvatarSwitcherStoreModule)
	local UseRefResult = ReactModule.useRef(nil)
	local UseTokensResult = UseTokensFunction()
	local Id = Frame.outfitInfo.id
	ReactModule.useEffect(function()
		-- upvalues: AddUnifiedEventLoggingFunction (upval), UseRefResult (copy), UnifiedEventLogEnums (upval), UnifiedLoggingSurface (upval), Frame (copy), Id (copy), SessionService (upval)
		task.delay(0, function()
			-- upvalues: AddUnifiedEventLoggingFunction (upval), UseRefResult (upval), UnifiedEventLogEnums (upval), UnifiedLoggingSurface (upval), Frame (upval), Id (upval), SessionService (upval)
			AddUnifiedEventLoggingFunction(UseRefResult, {
				elementName = "OUTFIT_TILE",
				action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
				surface = UnifiedLoggingSurface.IN_EXPERIENCE_AVATAR_SWITCHER,
				gridPositionRow = Frame.gridPosition.row,
				gridPositionColumn = Frame.gridPosition.column,
				itemId = Id
			}, { sessionTagName = SessionService:GetSessionTag("level2a") })
		end)
	end, { Frame.gridPosition, Id })
	local NoDisabled: boolean = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), Id (copy), UseSignalStateResult (copy)
		return SignalsModule.createComputed(function(p1): boolean
			-- upvalues: Id (upval), UseSignalStateResult (upval)
			return Id ~= nil and UseSignalStateResult.getSelectedOutfitId(p1) == Id
		end)
	end, { UseSignalStateResult, Id }))) and not Frame.disabled
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseSignalStateResult (copy), Id (copy)
		UseSignalStateResult.selectOutfit(Id)
	end, { UseSignalStateResult, Id })
	
	return (ReactModule.createElement(FoundationModule.View, {
		tag = "col gap-small auto-y size-full-0",
		GroupTransparency = if Frame.disabled then 0.5 else nil,
		LayoutOrder = Frame.LayoutOrder
	}, {
		Thumbnail = Id and ReactModule.createElement(FoundationModule.Image, {
			LayoutOrder = 1,
			tag = {
				[if FFlagAvatarSwitcherUseAvatarInventoryEndpoint then "radius-medium bg-shift-200 padding-small" else "radius-medium bg-shift-200"] = true,
				["stroke-standard stroke-system-contrast"] = NoDisabled
			},
			Size = UDim2.fromScale(1, 1.5),
			SizeConstraint = Enum.SizeConstraint.RelativeXX,
			Image = if FFlagAXBackgroundsInOutfitThumbnails then `rbxthumb://type=Outfit&id={Id}&w=150&h=150&includeBackground=true` else `rbxthumb://type=Outfit&id={Id}&w=150&h=150`,
			ScaleType = Enum.ScaleType.Crop,
			onActivated = if Frame.disabled then nil else UseResult,
			ref = UseRefResult
		}, {
			WarningIcon = FFlagAvatarSwitcherUseAvatarInventoryEndpoint and (Frame.outfitInfo.hasWarning and ReactModule.createElement(FoundationModule.Image, {
				tag = "size-500",
				Image = "icons/actions/info",
				imageStyle = if NoDisabled then nil else { Transparency = 0.5 }
			}))
		}),
		ThumbnailShimmer = not Id and ReactModule.createElement(FoundationModule.View, {
			LayoutOrder = 1,
			Size = UDim2.fromScale(1, 1.5),
			SizeConstraint = Enum.SizeConstraint.RelativeXX
		}, {
			Shimmer = ReactModule.createElement(FoundationModule.Skeleton, { Size = UDim2.fromScale(1, 1) })
		}),
		NameLabel = Frame.outfitInfo.name and ReactModule.createElement(FoundationModule.Text, {
			tag = "size-full-0 auto-y text-align-x-left text-title-small content-emphasis text-wrap",
			LayoutOrder = 2,
			Text = Frame.outfitInfo.name
		}),
		NameLabelShimmer = not Frame.outfitInfo.name and ReactModule.createElement(FoundationModule.Skeleton, {
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, UseTokensResult.FontSize.FontSize_300)
		})
	}))
end)