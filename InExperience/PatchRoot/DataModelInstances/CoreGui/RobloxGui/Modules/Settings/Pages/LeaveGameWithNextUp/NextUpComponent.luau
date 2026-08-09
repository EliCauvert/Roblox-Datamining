local corePackagesService = game:GetService("CorePackages")
local robloxAppHooksModule = require(corePackagesService.Workspace.Packages.RobloxAppHooks)
local roactServiceTagsModule = require(corePackagesService.Workspace.Packages.RoactServiceTags)
local sendGameImpressions = require(corePackagesService.Workspace.Packages.GameCollections).SendGameImpressions
local reactModule = require(corePackagesService.Packages.React)
local foundationModule = require(corePackagesService.Packages.Foundation)
local localizationModule = require(corePackagesService.Workspace.Packages.Localization)
local useNextUpSortModule = require(script.Parent.useNextUpSort)
local nextUpTileModule = require(script.Parent.NextUpTile)
local nextUpStateModule = require(script.Parent.NextUpState)
local fFlagEnableNextUpImageLatencyTelemetryModule = require(script.Parent.Flags.FFlagEnableNextUpImageLatencyTelemetry)
local fFlagEnableInGameExitModalNextUpUiRequestCacheModule = require(script.Parent.Flags.FFlagEnableInGameExitModalNextUpUiRequestCache)
local fFlagInGameExitModalFixModalPaddingModule = require(script.Parent.Flags.FFlagInGameExitModalFixModalPadding)
local useRoactService = robloxAppHooksModule.useRoactService
local appEventIngestService = roactServiceTagsModule.AppEventIngestService
local roactAnalytics = roactServiceTagsModule.RoactAnalytics
local view = foundationModule.View
local text = foundationModule.Text
local divider = foundationModule.Divider
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = localizationModule.Hooks.useLocalization

local function tilePairComponent(p0) --[[ line: 32 ]]
	-- upvalues: reactModule (ref), view (ref)
	return reactModule.createElement(view, {
		tag = "row flex-x-fill auto-y gap-medium no-wrap align-x-center",
		Size = UDim2.fromOffset(p0.tilePairWidth, 0),
		LayoutOrder = p0.LayoutOrder
	}, p0.children)
end

local function getImpressionIndices(p1) --[[ line: 40 ]]
	local t = {}
	
	for i = 1, math.min(4, #p1) do
		table.insert(t, p1[i].uiIndex)
	end
	return t
end

return reactModule.memo(function(p2) --[[ line: 58 | named "NextUpComponent" ]]
	-- upvalues: useRoactService (ref), appEventIngestService (ref), roactAnalytics (ref), useTokens (ref), useLocalization (ref), fFlagEnableInGameExitModalNextUpUiRequestCacheModule (ref), useNextUpSortModule (ref), reactModule (ref), sendGameImpressions (ref), fFlagEnableNextUpImageLatencyTelemetryModule (ref), nextUpStateModule (ref), getImpressionIndices (ref), nextUpTileModule (ref), divider (ref), view (ref), fFlagInGameExitModalFixModalPaddingModule (ref), text (ref), tilePairComponent (ref)
	local var15 = useRoactService(appEventIngestService)
	local var16 = useRoactService(roactAnalytics)
	local var17 = useTokens()
	local var18 = useLocalization({
		NextUpHeader = "CoreScripts.InGameMenu.NextUpExitMenu.Title"
	})
	local var19 = if fFlagEnableInGameExitModalNextUpUiRequestCacheModule then p2.nextUpSort else useNextUpSortModule()
	local data = var19.data
	local loading = var19.loading
	local var20 = reactModule.useCallback(function(p3, p4, p5) --[[ line: 73 ]]
		-- upvalues: sendGameImpressions (copy), var15 (ref), var16 (ref)
		sendGameImpressions.sendFromInGameExitModal(var15, var16, p5, p3, p4)
	end, { var15, var16 })
	
	if fFlagEnableNextUpImageLatencyTelemetryModule then
		reactModule.useEffect(function() --[[ line: 86 ]]
			-- upvalues: nextUpStateModule (copy)
			nextUpStateModule.nextUpComponentShown()
			
			return function() --[[ line: 89 ]]
				-- upvalues: nextUpStateModule (copy)
				nextUpStateModule.resetNextUpLatencyTelemetry()
			end
		end, {})
	end
	local var21, var22 = reactModule.useState(false)
	local var23, var24 = reactModule.useState(nil)
	reactModule.useEffect(function() --[[ line: 98 ]]
		-- upvalues: data (ref), var24 (ref), getImpressionIndices (copy), var22 (ref), fFlagEnableNextUpImageLatencyTelemetryModule (copy), nextUpStateModule (copy)
		if not data then return end
		var24(getImpressionIndices(data.entries))
		var22(false)
		
		if fFlagEnableNextUpImageLatencyTelemetryModule then
			nextUpStateModule.nextUpComponentSortDataLoaded()
		else
			nextUpStateModule.setNextUpTilesLoaded(true)
		end
		return function() --[[ line: 111 ]]
			-- upvalues: var24 (copy), fFlagEnableNextUpImageLatencyTelemetryModule (copy), nextUpStateModule (copy)
			var24(nil)
			
			if not fFlagEnableNextUpImageLatencyTelemetryModule then
				nextUpStateModule.setNextUpTilesLoaded(false)
			end
		end
	end, { data })
	reactModule.useEffect(function() --[[ line: 120 ]]
		-- upvalues: data (ref), var23 (ref), var21 (ref), var22 (ref), var20 (ref)
		if not data or not var23 then return end
		if var21 then
			return
		end
		var22(true)
		var20(var23, data.entries, data.topicId)
	end, { data, var23, var21, var20 })
	local var25 = reactModule.useCallback(function(p6) --[[ line: 140 ]]
		-- upvalues: data (ref), reactModule (copy), nextUpTileModule (copy), fFlagEnableNextUpImageLatencyTelemetryModule (copy), nextUpStateModule (copy)
		local var26 = if data then data.entries[p6] else nil
		
		return reactModule.createElement(nextUpTileModule, {
			entryData = var26,
			topicId = if data then data.topicId else "",
			positionIndex = p6,
			onTileImageLoaded = if fFlagEnableNextUpImageLatencyTelemetryModule and var26 then function() --[[ line: 147 ]]
				-- upvalues: nextUpStateModule (copy), p6 (ref)
				nextUpStateModule.nextUpTileImageTextureLoaded(p6)
			end else nil
		})
	end, { data })
	
	return if data or loading then reactModule.createElement(reactModule.Fragment, nil, {
		divider = reactModule.createElement(divider, { LayoutOrder = 2 }),
		nextUpSection = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = if fFlagInGameExitModalFixModalPaddingModule then "size-full-0 auto-y col gap-large" else "size-full-0 auto-y col gap-xxlarge"
		}, {
			header = reactModule.createElement(view, {
				tag = "size-full-0 auto-y row align-x-left gap-small",
				LayoutOrder = 1
			}, {
				text = reactModule.createElement(text, {
					tag = "text-heading-small text-wrap auto-xy shrink",
					Text = var18.NextUpHeader,
					textStyle = var17.Color.Extended.White.White_100
				})
			}),
			rowContainer = reactModule.createElement(view, {
				tag = "size-full-0 auto-y row gap-medium wrap align-x-center flex-x-fill",
				LayoutOrder = 2
			}, {
				tilesSection1 = reactModule.createElement(tilePairComponent, { LayoutOrder = 1, tilePairWidth = p2.tilePairWidth }, { tile1 = var25(1), tile2 = var25(2) }),
				tilesSection2 = reactModule.createElement(tilePairComponent, { LayoutOrder = 2, tilePairWidth = p2.tilePairWidth }, { tile3 = var25(3), tile4 = var25(4) })
			})
		})
	}) else reactModule.None
end)