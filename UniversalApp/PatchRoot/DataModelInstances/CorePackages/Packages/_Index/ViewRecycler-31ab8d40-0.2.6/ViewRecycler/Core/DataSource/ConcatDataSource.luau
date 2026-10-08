local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(viewRecycler.Core.Types)
local keyUtilsModule = require(script.Parent.KeyUtils)
local translatedDataSourceModule = require(script.Parent.TranslatedDataSource)

return function(...)
	-- upvalues: translatedDataSourceModule (ref), keyUtilsModule (ref), dataSourceChangeTypeModule (ref)
	local list = { ... }
	
	local function resolve(p1)
		-- upvalues: list (ref)
		for i, v in list do
			if p1 > v.getItemCount() then
				p1 -= v.getItemCount()
				continue
			end
			return v, p1
		end
		error("DataSource.concat: index out of range")
	end
	
	local var1 = translatedDataSourceModule(function()
		-- upvalues: list (ref)
		local var2 = 0
		
		for i, v in list do
			var2 += v.getItemCount()
		end
		return var2
	end, function(p2)
		-- upvalues: resolve (ref)
		local var3, var4 = resolve(p2)
		
		return var3.getItem(var4)
	end, function(p2)
		-- upvalues: resolve (ref)
		local var3, var4 = resolve(p2)
		
		return var3.getItemKey(var4)
	end, function(p2)
		-- upvalues: list (ref), keyUtilsModule (copy), dataSourceChangeTypeModule (copy)
		local t = {}
		
		for i, v in list do
			local list_1 = table.create(v.getItemCount())
			
			for i_1 = 1, v.getItemCount() do
				list_1[i_1] = v.getItemKey(i_1)
			end
			t[i] = list_1
		end
		local function collectAllKeys()
			-- upvalues: t (ref)
			local t_1 = {}
			
			for i, v in t do
				for i_1, v_1 in v do
					table.insert(t_1, v_1)
				end
			end
			return t_1
		end
		
		local function _()
			-- upvalues: keyUtilsModule (copy), collectAllKeys (ref)
			keyUtilsModule.validateUnique(collectAllKeys(), "DataSource.concat")
		end
		
		local t_1 = {}
		
		for i_1, v_1 in list do
			table.insert(t_1, v_1.subscribe(function(p3)
				-- upvalues: i_1 (ref), t (ref), dataSourceChangeTypeModule (copy), collectAllKeys (ref), keyUtilsModule (copy), p2 (ref)
				local var3 = 0
				
				for i = 1, i_1 - 1 do
					var3 += #t[i]
				end
				local var4 = 0
				
				for i_2, v in t do
					var4 += #v
				end
				local var5 = t[i_1]
				local t_1 = {}
				
				for i_3, v_1 in p3.changes do
					if v_1.type ~= dataSourceChangeTypeModule.Insert then
						if v_1.type ~= dataSourceChangeTypeModule.Remove then
							if v_1.type == dataSourceChangeTypeModule.Update then
								table.insert(t_1, {
									type = dataSourceChangeTypeModule.Update,
									keys = table.clone(v_1.keys)
								})
							elseif v_1.type == dataSourceChangeTypeModule.Move then
								table.insert(var5, v_1.toIndex, table.remove(var5, v_1.fromIndex))
								table.insert(t_1, {
									type = dataSourceChangeTypeModule.Move,
									fromIndex = var3 + v_1.fromIndex,
									toIndex = var3 + v_1.toIndex,
									key = v_1.key
								})
							elseif v_1.type == dataSourceChangeTypeModule.Reorder then
								t[i_1] = table.clone(v_1.keys)
								var5 = t[i_1]
								table.insert(t_1, {
									type = dataSourceChangeTypeModule.Reorder,
									keys = collectAllKeys()
								})
							elseif v_1.type == dataSourceChangeTypeModule.Reset then
								t[i_1] = table.clone(v_1.keys)
								var5 = t[i_1]
								table.insert(t_1, {
									type = dataSourceChangeTypeModule.Reset,
									keys = collectAllKeys()
								})
							end
						end
						for _ = 1, #v_1.keys do
							table.remove(var5, v_1.index)
						end
						table.insert(t_1, {
							type = dataSourceChangeTypeModule.Remove,
							index = var3 + v_1.index,
							keys = table.clone(v_1.keys)
						})
					end
					for i_4, v_2 in v_1.keys do
						table.insert(var5, v_1.index + i_4 - 1, v_2)
					end
					table.insert(t_1, {
						type = dataSourceChangeTypeModule.Insert,
						index = var3 + v_1.index,
						keys = table.clone(v_1.keys)
					})
				end
				keyUtilsModule.validateUnique(collectAllKeys(), "DataSource.concat")
				p2({
					changes = t_1,
					previousItemCount = var4,
					itemCount = #collectAllKeys()
				})
			end))
		end
		return function()
			-- upvalues: t_1 (ref)
			for i, v in t_1 do
				v()
			end
		end
	end)
	local t = {}
	
	for i = 1, var1.getItemCount() do
		t[i] = var1.getItemKey(i)
	end
	keyUtilsModule.validateUnique(t, "DataSource.concat")
	
	return var1
end