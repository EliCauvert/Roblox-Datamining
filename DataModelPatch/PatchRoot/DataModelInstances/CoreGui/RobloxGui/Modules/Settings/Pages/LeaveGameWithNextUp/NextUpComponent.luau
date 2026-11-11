local CorePackages = game:GetService("CorePackages")
local RoactServiceTagsModule = require(CorePackages.Workspace.Packages.RoactServiceTags)
local SendGameImpressions = require(CorePackages.Workspace.Packages.GameCollections).SendGameImpressions
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseNextUpSortModule = require(script.Parent.useNextUpSort)
local NextUpTileModule = require(script.Parent.NextUpTile)
local NextUpStateModule = require(script.Parent.NextUpState)
local FFlagEnableNextUpImageLatencyTelemetryModule = require(script.Parent.Flags.FFlagEnableNextUpImageLatencyTelemetry)
local FFlagEnableInGameExitModalNextUpUiRequestCacheModule = require(script.Parent.Flags.FFlagEnableInGameExitModalNextUpUiRequestCache)
local FFlagInGameExitModalFixModalPaddingModule = require(script.Parent.Flags.FFlagInGameExitModalFixModalPadding)
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local AppEventIngestService = RoactServiceTagsModule.AppEventIngestService
local RoactAnalytics = RoactServiceTagsModule.RoactAnalytics
local View = FoundationModule.View
local Text = FoundationModule.Text
local Divider = FoundationModule.Divider
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization

local function tilePairComponent(Frame)
	-- upvalues: ReactModule (copy), View (copy)
	return ReactModule.createElement(View, {
		tag = "row flex-x-fill auto-y gap-medium no-wrap align-x-center",
		Size = UDim2.fromOffset(Frame.tilePairWidth, 0),
		LayoutOrder = Frame.LayoutOrder
	}, Frame.children)
end

local function getImpressionIndices(Entries)
	local List = {}
	
	for i = 1, math.min(4, #Entries) do
		table.insert(List, Entries[i].uiIndex)
	end
	return List
end

return ReactModule.memo(function(p1)
	-- upvalues: UseRoactServiceFunction (copy), AppEventIngestService (copy), RoactAnalytics (copy), UseTokensFunction (copy), UseLocalizationFunction (copy), FFlagEnableInGameExitModalNextUpUiRequestCacheModule (copy), UseNextUpSortModule (copy), ReactModule (copy), SendGameImpressions (copy), FFlagEnableNextUpImageLatencyTelemetryModule (copy), NextUpStateModule (copy), getImpressionIndices (copy), NextUpTileModule (copy), Divider (copy), View (copy), FFlagInGameExitModalFixModalPaddingModule (copy), Text (copy), tilePairComponent (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	local UseRoactServiceResult1 = UseRoactServiceFunction(RoactAnalytics)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		NextUpHeader = "CoreScripts.InGameMenu.NextUpExitMenu.Title"
	})
	local NextUpSort = if FFlagEnableInGameExitModalNextUpUiRequestCacheModule then p1.nextUpSort else UseNextUpSortModule()
	local Data = NextUpSort.data
	local Loading = NextUpSort.loading
	local UseResult = ReactModule.useCallback(function(p2, p3, p4)
		-- upvalues: SendGameImpressions (upval), UseRoactServiceResult (copy), UseRoactServiceResult1 (copy)
		SendGameImpressions.sendFromInGameExitModal(UseRoactServiceResult, UseRoactServiceResult1, p4, p2, p3)
	end, { UseRoactServiceResult, UseRoactServiceResult1 })
	
	if FFlagEnableNextUpImageLatencyTelemetryModule then
		ReactModule.useEffect(function()
			-- upvalues: NextUpStateModule (upval)
			NextUpStateModule.nextUpComponentShown()
			
			return function()
				-- upvalues: NextUpStateModule (upval)
				NextUpStateModule.resetNextUpLatencyTelemetry()
			end
		end, {})
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: Data (copy), UseStateResult2_1 (copy), getImpressionIndices (upval), UseStateResult2 (copy), FFlagEnableNextUpImageLatencyTelemetryModule (upval), NextUpStateModule (upval)
		if not Data then return end
		UseStateResult2_1((getImpressionIndices(Data.entries)))
		UseStateResult2(false)
		
		if FFlagEnableNextUpImageLatencyTelemetryModule then
			NextUpStateModule.nextUpComponentSortDataLoaded()
		else
			NextUpStateModule.setNextUpTilesLoaded(true)
		end
		return function()
			-- upvalues: UseStateResult2_1 (upval), FFlagEnableNextUpImageLatencyTelemetryModule (upval), NextUpStateModule (upval)
			UseStateResult2_1(nil)
			
			if not FFlagEnableNextUpImageLatencyTelemetryModule then
				NextUpStateModule.setNextUpTilesLoaded(false)
			end
		end
	end, { Data })
	ReactModule.useEffect(function()
		-- upvalues: Data (copy), UseStateResult1 (copy), UseStateResult (copy), UseStateResult2 (copy), UseResult (copy)
		if not Data or not UseStateResult1 then return end
		if not UseStateResult then
			UseStateResult2(true)
			UseResult(UseStateResult1, Data.entries, Data.topicId)
			
			return
		end
	end, { Data, UseStateResult1, UseStateResult, UseResult })
	local UseResult1 = ReactModule.useCallback(function(PositionIndex)
		-- upvalues: Data (copy), ReactModule (upval), NextUpTileModule (upval), FFlagEnableNextUpImageLatencyTelemetryModule (upval), NextUpStateModule (upval)
		local Entry = if Data then Data.entries[PositionIndex] else nil
		
		return ReactModule.createElement(NextUpTileModule, {
			entryData = Entry,
			topicId = if Data then Data.topicId else "",
			positionIndex = PositionIndex,
			onTileImageLoaded = if FFlagEnableNextUpImageLatencyTelemetryModule and Entry then function()
				-- upvalues: NextUpStateModule (upval), PositionIndex (copy)
				NextUpStateModule.nextUpTileImageTextureLoaded(PositionIndex)
			end else nil
		})
	end, { Data })
	
	return if Data or Loading then ReactModule.createElement(ReactModule.Fragment, nil, {
		divider = ReactModule.createElement(Divider, { LayoutOrder = 2 }),
		nextUpSection = ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = if FFlagInGameExitModalFixModalPaddingModule then "size-full-0 auto-y col gap-large" else "size-full-0 auto-y col gap-xxlarge"
		}, {
			header = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y row align-x-left gap-small",
				LayoutOrder = 1
			}, {
				text = ReactModule.createElement(Text, {
					tag = "text-heading-small text-wrap auto-xy shrink",
					Text = UseLocalizationResult.NextUpHeader,
					textStyle = UseTokensResult.Color.Extended.White.White_100
				})
			}),
			rowContainer = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y row gap-medium wrap align-x-center flex-x-fill",
				LayoutOrder = 2
			}, {
				tilesSection1 = ReactModule.createElement(tilePairComponent, { LayoutOrder = 1, tilePairWidth = p1.tilePairWidth }, { tile1 = UseResult1(1), tile2 = UseResult1(2) }),
				tilesSection2 = ReactModule.createElement(tilePairComponent, { LayoutOrder = 2, tilePairWidth = p1.tilePairWidth }, { tile3 = UseResult1(3), tile4 = UseResult1(4) })
			})
		})
	}) else ReactModule.None
end)