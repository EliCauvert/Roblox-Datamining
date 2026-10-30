local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local DataSourceChangeTypeModule = require(ViewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(ViewRecycler.Core.Types)
local KeyUtilsModule = require(script.Parent.KeyUtils)
local TranslatedDataSourceModule = require(script.Parent.TranslatedDataSource)

return function(...)
	-- upvalues: TranslatedDataSourceModule (copy), KeyUtilsModule (copy), DataSourceChangeTypeModule (copy)
	local list = { ... }
	
	local function resolve(p1)
		-- upvalues: list (copy)
		for _, value in list do
			if p1 <= value.getItemCount() then
				return value, p1
			end
			p1 -= value.getItemCount()
		end
		error("DataSource.concat: index out of range")
	end
	
	local TranslatedDataSourceModuleResult = TranslatedDataSourceModule(function(): number
		-- upvalues: list (copy)
		local NewItemCount = 0
		
		for _, value in list do
			NewItemCount += value.getItemCount()
		end
		return NewItemCount
	end, function(p2)
		-- upvalues: resolve (copy)
		local ResolveResult, ResolveResult2 = resolve(p2)
		
		return ResolveResult.getItem(ResolveResult2)
	end, function(p2)
		-- upvalues: resolve (copy)
		local ResolveResult, ResolveResult2 = resolve(p2)
		
		return ResolveResult.getItemKey(ResolveResult2)
	end, function(Callback)
		-- upvalues: list (copy), KeyUtilsModule (upval), DataSourceChangeTypeModule (upval)
		local t = {}
		
		for i1, value in list do
			local Buffer = table.create(value.getItemCount())
			
			for i = 1, value.getItemCount() do
				Buffer[i] = value.getItemKey(i)
			end
			t[i1] = Buffer
		end
		local function collectAllKeys()
			-- upvalues: t (copy)
			local List = {}
			
			for _, value in t do
				for _, value1 in value do
					table.insert(List, value1)
				end
			end
			return List
		end
		
		local function _()
			-- upvalues: KeyUtilsModule (upval), collectAllKeys (copy)
			KeyUtilsModule.validateUnique(collectAllKeys(), "DataSource.concat")
		end
		
		local List = {}
		
		for i2, value1 in list do
			table.insert(List, value1.subscribe(function(p2)
				-- upvalues: i2 (copy), t (copy), DataSourceChangeTypeModule (upval), collectAllKeys (copy), KeyUtilsModule (upval), Callback (copy)
				local Total = 0
				
				for i = 1, i2 - 1 do
					Total += #t[i]
				end
				local PreviousItemCount = 0
				
				for _, value in t do
					PreviousItemCount += #value
				end
				local Entry = t[i2]
				local List = {}
				
				for _, change in p2.changes do
					if change.type == DataSourceChangeTypeModule.Insert then
						for i1, key in change.keys do
							table.insert(Entry, change.index + i1 - 1, key)
						end
						table.insert(List, {
							type = DataSourceChangeTypeModule.Insert,
							index = Total + change.index,
							keys = table.clone(change.keys)
						})
						continue
					else
						if change.type == DataSourceChangeTypeModule.Remove then
							for _ = 1, #change.keys do
								table.remove(Entry, change.index)
							end
							table.insert(List, {
								type = DataSourceChangeTypeModule.Remove,
								index = Total + change.index,
								keys = table.clone(change.keys)
							})
							continue
						elseif change.type == DataSourceChangeTypeModule.Update then
							table.insert(List, {
								type = DataSourceChangeTypeModule.Update,
								keys = table.clone(change.keys)
							})
						elseif change.type == DataSourceChangeTypeModule.Move then
							table.insert(Entry, change.toIndex, (table.remove(Entry, change.fromIndex)))
							table.insert(List, {
								type = DataSourceChangeTypeModule.Move,
								fromIndex = Total + change.fromIndex,
								toIndex = Total + change.toIndex,
								key = change.key
							})
						elseif change.type == DataSourceChangeTypeModule.Reorder then
							t[i2] = table.clone(change.keys)
							Entry = t[i2]
							table.insert(List, {
								type = DataSourceChangeTypeModule.Reorder,
								keys = collectAllKeys()
							})
						elseif change.type == DataSourceChangeTypeModule.Reset then
							t[i2] = table.clone(change.keys)
							Entry = t[i2]
							table.insert(List, {
								type = DataSourceChangeTypeModule.Reset,
								keys = collectAllKeys()
							})
						end
					end
				end
				KeyUtilsModule.validateUnique(collectAllKeys(), "DataSource.concat")
				Callback({
					changes = List,
					previousItemCount = PreviousItemCount,
					itemCount = #collectAllKeys()
				})
			end))
		end
		return function()
			-- upvalues: List (copy)
			for _, value in List do
				value()
			end
		end
	end)
	local ItemKeys = {}
	
	for i = 1, TranslatedDataSourceModuleResult.getItemCount() do
		ItemKeys[i] = TranslatedDataSourceModuleResult.getItemKey(i)
	end
	KeyUtilsModule.validateUnique(ItemKeys, "DataSource.concat")
	
	return TranslatedDataSourceModuleResult
end