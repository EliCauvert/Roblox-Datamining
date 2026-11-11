local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local DiscoveryTypesModule = require(CorePackages.Workspace.Packages.DiscoveryTypes)
local OmniFeedTypes = DiscoveryTypesModule.OmniFeedTypes
local OmniFeedConstants = DiscoveryTypesModule.OmniFeedConstants
local _ = require(CorePackages.Workspace.Packages.AppCommonLib)
local _ = require(CorePackages.Workspace.Packages.ServerDrivenUi)
local CryoModule = require(CorePackages.Packages.Cryo)
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local RobloxAppEnumsModule = require(CorePackages.Workspace.Packages.RobloxAppEnums)
local AppPage = RobloxAppEnumsModule.AppPage
local UiMode = RobloxAppEnumsModule.UiMode
local UseUiModeInfoFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local _ = require(CorePackages.Workspace.Packages.VideoUtils)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local OmniFeedItemModule = require(Modules.Personalization.OmniFeed.OmniFeedItem)
local FFlagUpdateDividerStartBoundsModule = require(Modules.Personalization.Flags.FFlagUpdateDividerStartBounds)
local Modules1 = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local FeedItemModel = Modules1.Personalization.OmniFeed.DataStore.FeedItemModel
local OmniFeedProps = Modules1.Personalization.OmniFeed.OmniFeedProps
local CompositionTags = require(CorePackages.Workspace.Packages.AppComposition).CompositionTags
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagRenameDeprecatedUIBloxTokens = SharedFlagsModule.FFlagRenameDeprecatedUIBloxTokens
local FFlagLuaAppCompositionAlways = SharedFlagsModule.FFlagLuaAppCompositionAlways
local FFlagLuaAppRemoveOmniFeedDividersAndExtraPadding = SharedFlagsModule.FFlagLuaAppRemoveOmniFeedDividersAndExtraPadding
local FFlagHomepagePromptsPaddingFix = SharedFlagsModule.FFlagHomepagePromptsPaddingFix
local FFlagLuaAppUseSortsWithDividersFString = SharedFlagsModule.FFlagLuaAppUseSortsWithDividersFString
local IsSubjectToDesktopPoliciesFunction = SharedFlagsModule.isSubjectToDesktopPolicies
local FStringLuaAppSortsWithDividers: string = SharedFlagsModule.FStringLuaAppSortsWithDividers
local FFlagUseOmniFeedDividerOverrides = SharedFlagsModule.FFlagUseOmniFeedDividerOverrides
local FIntOmniFeedDividerHeightOverride = SharedFlagsModule.FIntOmniFeedDividerHeightOverride
local FIntOmniFeedDividerPaddingOverride = SharedFlagsModule.FIntOmniFeedDividerPaddingOverride
local FFlagLuaAppEnableRelativeGuiHomeForAll = SharedFlagsModule.FFlagLuaAppEnableRelativeGuiHomeForAll
local FFlagLuaAppEnableRelativeGuiHomeWithIxp = SharedFlagsModule.FFlagLuaAppEnableRelativeGuiHomeWithIxp
local FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = SharedFlagsModule.FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local FFlagLuaAppHomeTouchAutoplay = SharedFlagsModule.FFlagLuaAppHomeTouchAutoplay
local FFlagLuaAppGameCarouselAmpUpsellAction = SharedFlagsModule.FFlagLuaAppGameCarouselAmpUpsellAction
local FFlagLuaAppsDefaultSelection = SharedFlagsModule.FFlagLuaAppsDefaultSelection
local t = {}

if FFlagLuaAppUseSortsWithDividersFString then
	for i in FStringLuaAppSortsWithDividers:gmatch("(%w+)") do
		t[i] = true
	end
end
local SORTINDEXSELECTIONORDERMULTIPLIER = DiscoveryTypesModule.Constants.SORT_INDEX_SELECTION_ORDER_MULTIPLIER
local SORTSELECTIONORDERBASE = DiscoveryTypesModule.Constants.SORT_SELECTION_ORDER_BASE

local function _(p1, p2)
	-- upvalues: FFlagRenameDeprecatedUIBloxTokens (copy)
	return p1 * (if FFlagRenameDeprecatedUIBloxTokens then p2.Stroke.Standard else p2.Global.Stroke_100)
end

local _ = function(p1): boolean
	-- upvalues: OmniFeedConstants (copy)
	local TopicLayout = p1.treatmentProps.topicLayoutData and p1.treatmentProps.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.ComponentType]
	
	return TopicLayout == OmniFeedConstants.ComponentTypeDataKeys.GridTile or TopicLayout == OmniFeedConstants.ComponentTypeDataKeys.EventTile
end

local function shouldAddDividerOrExtraPadding(p1, p2, ItemIndex: number, p3, OmniFeedItems, PageContext, IsUiModeMatch)
	-- upvalues: FFlagUpdateDividerStartBoundsModule (copy), FFlagLuaAppUseSortsWithDividersFString (copy), t (copy), OmniFeedTypes (copy), IsSubjectToDesktopPoliciesFunction (copy), OmniFeedConstants (copy), AppPage (copy)
	local Flag = false
	local Flag1 = false
	
	if (if FFlagUpdateDividerStartBoundsModule then 0 elseif IsUiModeMatch then 0 else 1) + p1 - 1 < ItemIndex and ItemIndex < p2 then
		local OmniFeedItem = OmniFeedItems[ItemIndex - 1]
		local OmniFeedItem1 = OmniFeedItems[ItemIndex]
		local OmniFeedItem2 = OmniFeedItems[ItemIndex + 1]
		
		if OmniFeedItem and OmniFeedItem.pageSection ~= OmniFeedItem1.pageSection then
			OmniFeedItem = nil
		end
		if OmniFeedItem2 and OmniFeedItem2.pageSection ~= OmniFeedItem1.pageSection then
			OmniFeedItem2 = nil
		end
		if FFlagLuaAppUseSortsWithDividersFString and (OmniFeedItem1.itemId and OmniFeedItem1.itemId.topicId and t[OmniFeedItem1.itemId.topicId] or OmniFeedItem2 and OmniFeedItem2.itemId and OmniFeedItem2.itemId.topicId and t[OmniFeedItem2.itemId.topicId]) then
			Flag1 = true
		end
		if p3.treatmentType == OmniFeedTypes.HomeGameGrid and OmniFeedItem2 and OmniFeedItem2.treatmentType ~= OmniFeedTypes.HomeGameGrid or p3.treatmentType ~= OmniFeedTypes.HomeGameGrid and OmniFeedItem and OmniFeedItem.treatmentType == OmniFeedTypes.HomeGameGrid and OmniFeedItem2 and OmniFeedItem2.treatmentType == OmniFeedTypes.HomeGameGrid then
			Flag1 = true
		elseif IsUiModeMatch then
			Flag = true
		elseif IsSubjectToDesktopPoliciesFunction() then
			local IsGridTileMatch = false
			
			if p3.treatmentType == OmniFeedTypes.Carousel then
				IsGridTileMatch = false
				
				if OmniFeedItem2 ~= nil then
					IsGridTileMatch = false
					
					if OmniFeedItem2.treatmentType == OmniFeedTypes.HomeGameGrid then
						local TopicLayout = p3.treatmentProps.topicLayoutData and p3.treatmentProps.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.ComponentType]
						IsGridTileMatch = TopicLayout == OmniFeedConstants.ComponentTypeDataKeys.GridTile or TopicLayout == OmniFeedConstants.ComponentTypeDataKeys.EventTile
						
						if IsGridTileMatch then
							local TopicLayout1 = OmniFeedItem2.treatmentProps.topicLayoutData and OmniFeedItem2.treatmentProps.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.ComponentType]
							IsGridTileMatch = TopicLayout1 == OmniFeedConstants.ComponentTypeDataKeys.GridTile or TopicLayout1 == OmniFeedConstants.ComponentTypeDataKeys.EventTile
						end
					end
				end
			end
			Flag = IsGridTileMatch
		end
	end
	if PageContext == AppPage.SearchPage and ItemIndex < p2 then
		Flag1 = true
	end
	return Flag1, Flag
end

return ReactModule.memo(function(p1)
	-- upvalues: UseDesignTokensFunction (copy), UseStyleFunction (copy), UseUiModeInfoFunction (copy), UiMode (copy), ReactModule (copy), FFlagUseOmniFeedDividerOverrides (copy), FIntOmniFeedDividerPaddingOverride (copy), FFlagRenameDeprecatedUIBloxTokens (copy), FIntOmniFeedDividerHeightOverride (copy), FeedItemModel (copy), SORTSELECTIONORDERBASE (copy), SORTINDEXSELECTIONORDERMULTIPLIER (copy), OmniFeedProps (copy), FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy), FFlagLuaAppHomeTouchAutoplay (copy), FFlagLuaAppGameCarouselAmpUpsellAction (copy), CryoModule (copy), FFlagHomepagePromptsPaddingFix (copy), OmniFeedTypes (copy), OmniFeedItemModule (copy), FFlagLuaAppsDefaultSelection (copy), FFlagLuaAppRemoveOmniFeedDividersAndExtraPadding (copy), shouldAddDividerOrExtraPadding (copy), FFlagLuaAppEnableRelativeGuiHomeForAll (copy), FFlagLuaAppEnableRelativeGuiHomeWithIxp (copy), FFlagLuaAppCompositionAlways (copy), CompositionTags (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local Color = UseStyleFunction().Theme.BackgroundContrast.Color
	local IsUiModeMatch = UseUiModeInfoFunction().uiMode == UiMode.TenFoot
	local Frames = {
		Layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical
		})
	}
	local LayoutOrder = 1
	local LayoutPadding = p1.layoutPadding or 0
	local YOffset: number = LayoutPadding
	local YOffset1 = LayoutPadding / 2
	
	if FFlagUseOmniFeedDividerOverrides then
		if FIntOmniFeedDividerPaddingOverride >= 0 then
			YOffset = FIntOmniFeedDividerPaddingOverride * (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Stroke.Standard else UseDesignTokensResult.Global.Stroke_100)
		end
		if FIntOmniFeedDividerHeightOverride >= 0 then
			YOffset1 = FIntOmniFeedDividerHeightOverride * (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Stroke.Standard else UseDesignTokensResult.Global.Stroke_100)
		end
	end
	local OmniFeedItems = p1.omniFeedItems
	local v1: number? = nil
	local v2: number? = nil
	
	for i = 1, #OmniFeedItems do
		if OmniFeedItems[i].pageSection == p1.omniFeedPageSection then
			if not v1 then
				v1 = i
			end
			v2 = i
		end
	end
	local V57 = v1 or 1
	local V58 = v2 or #OmniFeedItems
	local NumberOfItemsToBeRendered = p1.numberOfItemsToBeRendered or V58 - V57 + 1
	local Total: number? = 1
	local PageContext = p1.pageContext
	local TopMargin = p1.topMargin or 0
	local BottomMargin = p1.bottomMargin or 0
	local Flag = true
	
	for ItemIndex, omniFeedItem in OmniFeedItems do
		if NumberOfItemsToBeRendered < ItemIndex - V57 + 1 then break end
		local UniqueNameForAnalytics = FeedItemModel.getUniqueNameForAnalytics(omniFeedItem)
		local JoinResult = CryoModule.Dictionary.join({
			[OmniFeedProps.key] = OmniFeedProps.new(ItemIndex, Total, p1.onItemsUpdatedSignalRef and p1.onItemsUpdatedSignalRef.current, p1.refreshSignalRef and p1.refreshSignalRef.current, PageContext, p1.scrollingFrameRef, p1.sduiContext, SORTSELECTIONORDERBASE + ItemIndex * SORTINDEXSELECTIONORDERMULTIPLIER, p1.defaultContainerSize, p1.appCompositionEnabled, if FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p1.onTileImageLoaded else nil, if FFlagLuaAppHomeTouchAutoplay then p1.videoPlaybackContext else nil, if FFlagLuaAppGameCarouselAmpUpsellAction then p1.refreshFeed else nil)
		}, omniFeedItem.treatmentProps or {})
		
		if FFlagHomepagePromptsPaddingFix and omniFeedItem.treatmentType == OmniFeedTypes.Prompts then
			JoinResult = CryoModule.Dictionary.join(JoinResult, { topPadding = YOffset, bottomPadding = YOffset })
		end
		if Total then
			local NumberOfRows: number = FeedItemModel.getNumberOfRows(omniFeedItem)
			
			if NumberOfRows then
				Total += NumberOfRows
			else
				Total = nil
			end
		end
		if p1.omniFeedPageSection == omniFeedItem.pageSection then
			local NoFlag = not Flag
			local IsTreatmentTypeMatch = false
			
			if FFlagHomepagePromptsPaddingFix then
				IsTreatmentTypeMatch = omniFeedItem.treatmentType == OmniFeedTypes.Prompts
				local OmniFeedItem = OmniFeedItems[ItemIndex - 1]
				local IsTreatmentTypeMatch1: boolean = OmniFeedItem ~= nil and OmniFeedItem.treatmentType == OmniFeedTypes.Prompts
				NoFlag = NoFlag and (not IsTreatmentTypeMatch and not IsTreatmentTypeMatch1)
			end
			local IsTreatmentTypeMatch2: boolean = NoFlag and omniFeedItem.treatmentType == OmniFeedTypes.UpsellCard
			local SortIndex = if omniFeedItem.itemId then omniFeedItem.itemId.sortIndex else nil
			local Sorts = if SortIndex and p1.sortsData then p1.sortsData[SortIndex] else nil
			
			if Sorts and (not Sorts.topic or Sorts.topic == "") then
				NoFlag = false
			end
			if NoFlag then
				local config = {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = if IsTreatmentTypeMatch2 then UDim2.new(1, 0, 0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_300 else UseDesignTokensResult.Global.Space_150) else UDim2.new(1, 0, 0, YOffset)
				}
				config.LayoutOrder = LayoutOrder
				Frames["feedPaddingTop_" .. tostring(ItemIndex)] = ReactModule.createElement("Frame", config)
				LayoutOrder += 1
			end
			Frames["feedItem_" .. tostring(ItemIndex)] = ReactModule.createElement(OmniFeedItemModule, {
				omniFeedItemType = omniFeedItem.treatmentType,
				layoutOrder = LayoutOrder,
				feedItemNameId = UniqueNameForAnalytics,
				itemProps = JoinResult,
				itemIndex = ItemIndex,
				impressionsTag = p1.impressionsTag,
				zIndex = NumberOfItemsToBeRendered - ItemIndex,
				defaultFocusRef = if FFlagLuaAppsDefaultSelection and ItemIndex == 1 then p1.defaultFocusRef else nil
			})
			LayoutOrder += 1
			
			if not FFlagLuaAppRemoveOmniFeedDividersAndExtraPadding and (not FFlagHomepagePromptsPaddingFix or not IsTreatmentTypeMatch) then
				local ShouldAddDividerOrExtraPadding, ShouldAddDividerOrExtraPadding2 = shouldAddDividerOrExtraPadding(V57, V58, ItemIndex, omniFeedItem, OmniFeedItems, PageContext, IsUiModeMatch)
				
				if ShouldAddDividerOrExtraPadding or ShouldAddDividerOrExtraPadding2 then
					Frames["feedPaddingBottom_" .. tostring(ItemIndex)] = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Size = UDim2.new(1, 0, 0, YOffset),
						LayoutOrder = LayoutOrder
					})
					LayoutOrder += 1
				end
				if ShouldAddDividerOrExtraPadding then
					Frames["feedDivider_" .. tostring(ItemIndex)] = ReactModule.createElement("Frame", {
						BackgroundTransparency = 0,
						BorderSizePixel = 0,
						Size = UDim2.new(1, 0, 0, YOffset1),
						BackgroundColor3 = Color,
						LayoutOrder = LayoutOrder
					})
					LayoutOrder += 1
				end
			end
			if ItemIndex - V57 + 1 == NumberOfItemsToBeRendered and p1.hasNextPage then
				Frames["loadingBlank_" .. tostring(ItemIndex)] = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 10),
					LayoutOrder = LayoutOrder
				})
				LayoutOrder += 1
			end
			if Flag then
				Flag = false
			end
		end
	end
	Frames.Padding = ReactModule.createElement(ReactModule.Fragment, nil, {
		PaddingTop = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 0,
			Size = UDim2.new(1, 0, 0, TopMargin)
		}),
		PaddingBottom = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, BottomMargin),
			LayoutOrder = LayoutOrder
		})
	})
	
	return ReactModule.createElement(if (FFlagLuaAppEnableRelativeGuiHomeForAll or FFlagLuaAppEnableRelativeGuiHomeWithIxp) and p1.enableRelativeGui then "RelativeGui" else "Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[ReactModule.Tag] = if FFlagLuaAppCompositionAlways or p1.appCompositionEnabled then p1.contentTag or CompositionTags.ContentRegion.Body else nil
	}, Frames)
end)