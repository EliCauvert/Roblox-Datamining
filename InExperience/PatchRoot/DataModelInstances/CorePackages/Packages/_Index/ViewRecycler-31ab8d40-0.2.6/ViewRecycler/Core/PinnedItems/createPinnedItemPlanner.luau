local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(ViewRecycler.Core.DataSource)
local PlacementTypesModule = require(ViewRecycler.Core.Placement.PlacementTypes)
local ShallowTableModule = require(ViewRecycler.Internal.ShallowTable)
local _ = require(ViewRecycler.Core.Types)
local BuildPlacementPlanModule = require(ViewRecycler.Core.PinnedItems.buildPlacementPlan)
local StickyIndexResolverModule = require(ViewRecycler.Core.PinnedItems.StickyIndexResolver)
local Frozen = table.freeze({ "key", "value", "itemViewType" })

local function _(p1, p2)
	-- upvalues: ShallowTableModule (copy), Frozen (copy)
	return p1 == p2 or p1 ~= nil and (p2 ~= nil and ShallowTableModule.containsEqual(p1, p2, Frozen))
end

return function(p1, Options)
	-- upvalues: StickyIndexResolverModule (copy), ShallowTableModule (copy), Frozen (copy), BuildPlacementPlanModule (copy), PlacementTypesModule (copy)
	local Options1 = Options
	local StickyIndexResolverModuleResult = StickyIndexResolverModule(p1, Options1.isItemStickyHeader)
	local config = {
		revision = 1,
		length = 0,
		item = Options1.pinnedStartItem
	}
	local config1 = { revision = 1, length = 0, item = Options1.pinnedEndItem }
	
	local function _(p2, Item): boolean
		-- upvalues: ShallowTableModule (upval), Frozen (upval)
		local Item1 = p2.item
		
		if Item1 == Item or Item1 ~= nil and (Item ~= nil and ShallowTableModule.containsEqual(Item1, Item, Frozen)) then
			return false
		else
			p2.item = Item
			p2.revision += 1
			p2.length = 0
			
			return true
		end
	end
	
	local _ = function(p2, Position)
		local Item = p2.item
		
		return if Item == nil then nil else {
			key = Item.key,
			value = Item.value,
			itemViewType = Item.itemViewType,
			revision = p2.revision,
			length = p2.length,
			position = Position
		}
	end
	
	return {
		getContentInsets = function()
			-- upvalues: config (copy), config1 (copy)
			return {
				start = if config.item == nil then 0 else config.length,
				finish = if config1.item == nil then 0 else config1.length
			}
		end,
		update = function(p2)
			-- upvalues: StickyIndexResolverModuleResult (copy), BuildPlacementPlanModule (upval), config (copy), PlacementTypesModule (upval), config1 (copy)
			StickyIndexResolverModuleResult.setDataSource(p2.dataSource)
			local Start = PlacementTypesModule.PinnedPosition.Start
			local Item = config.item
			local Config = if Item == nil then nil else {
				key = Item.key,
				value = Item.value,
				itemViewType = Item.itemViewType,
				revision = config.revision,
				length = config.length,
				position = Start
			}
			local Finish = PlacementTypesModule.PinnedPosition.Finish
			local Item1 = config1.item
			
			return BuildPlacementPlanModule({
				dataSource = p2.dataSource,
				layout = p2.layout,
				stickyIndices = StickyIndexResolverModuleResult.resolve(),
				scrollOffset = p2.scrollOffset,
				viewportLength = p2.viewportLength,
				contentStartOffset = p2.contentStartOffset,
				pinnedStartItem = Config,
				pinnedEndItem = if Item1 == nil then nil else {
					key = Item1.key,
					value = Item1.value,
					itemViewType = Item1.itemViewType,
					revision = config1.revision,
					length = config1.length,
					position = Finish
				}
			})
		end,
		applyDataSourceChange = function(p2)
			-- upvalues: StickyIndexResolverModuleResult (copy)
			StickyIndexResolverModuleResult.applyDataSourceChange(p2)
		end,
		updatePinnedMeasurement = function(Start, Key, Revision, Length: number)
			-- upvalues: PlacementTypesModule (upval), config (copy), config1 (copy)
			assert(Length >= 0 and Length < 1e999, "PinnedItems: measured length must be finite and non-negative")
			local Config = if Start == PlacementTypesModule.PinnedPosition.Start then config else config1
			local Item = Config.item
			
			if Item == nil or Item.key ~= Key or Config.revision ~= Revision or Config.length == Length then
				return nil
			else
				Config.length = Length
				
				return {
					start = if config.item == nil then 0 else config.length,
					finish = if config1.item == nil then 0 else config1.length
				}
			end
		end,
		setOptions = function(Value)
			-- upvalues: Options1 (ref), StickyIndexResolverModuleResult (copy), config (copy), ShallowTableModule (upval), Frozen (upval), config1 (copy)
			Options1 = Value
			local SetPredicateResult = StickyIndexResolverModuleResult.setPredicate(Value.isItemStickyHeader)
			local PinnedStartItem = Value.pinnedStartItem
			local Item = config.item
			local Flag = nil
			
			if Item == PinnedStartItem or Item ~= nil and (PinnedStartItem ~= nil and ShallowTableModule.containsEqual(Item, PinnedStartItem, Frozen)) then
				Flag = false
			else
				config.item = PinnedStartItem
				config.revision += 1
				config.length = 0
				Flag = true
			end
			local Flag1 = Flag or SetPredicateResult
			local PinnedEndItem = Value.pinnedEndItem
			local Item1 = config1.item
			local Flag2 = nil
			
			if Item1 == PinnedEndItem or Item1 ~= nil and (PinnedEndItem ~= nil and ShallowTableModule.containsEqual(Item1, PinnedEndItem, Frozen)) then
				Flag2 = false
			else
				config1.item = PinnedEndItem
				config1.revision += 1
				config1.length = 0
				Flag2 = true
			end
			return Flag2 or Flag1
		end,
		setDataSource = StickyIndexResolverModuleResult.setDataSource,
		destroy = function() end
	}
end