local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("./navigation_props")

return function(p1)
	local ReadFunction = p1.read
	local config = {
		fixed = { px = true },
		fill = { weight = true, min = true, max = true },
		hug = { min = true, max = true },
		percent = { fraction = true, offset = true, min = true, max = true },
		content = {},
		minMax = { min = true, preferred = true, max = true }
	}
	
	local function _(Value: number): boolean
		return type(Value) == "number" and Value == Value and math.abs(Value) < 1e999
	end
	
	local _ = function(p2, p3)
		-- upvalues: p1 (copy)
		return if p2 == nil then nil elseif type(p2) == "string" then p1.metric(p2, p3) else p2
	end
	
	local function menuItems(p2, p3)
		-- upvalues: ReadFunction (copy), menuItems (copy)
		assert(type(p2) == "table", "Menu.items must be an array")
		local List = {}
		local t = {}
		
		for i = 1, #p2 do
			local Tbl = p2[i]
			local Copy = table.clone(Tbl)
			local Id = Tbl.id or tostring(i)
			Copy.id = Id
			assert(not t[Id], `Facet UI.Menu: two items at one level share the id '{Id}'`)
			t[Id] = true
			
			if Copy.divider ~= true and Copy.avatar ~= nil then
				for i1 in Copy.avatar do
					if i1 ~= "name" and i1 ~= "image" and i1 ~= "userId" then
						error(`Facet UI.Menu: an avatar takes name, image and userId, not '{i1}'`, 0)
					end
				end
			end
			if not Copy.divider then
				assert(type(ReadFunction(Copy.label, p3)) == "string" and string.find(ReadFunction(Copy.label, p3), "%S") ~= nil, "Menu items require nonempty labels")
				assert(not (Copy.children and Copy.onSelect), "A menu item cannot have both children and onSelect")
				assert(Copy.children or (Copy.onSelect or (Copy.checked or Copy.selected)), "Menu items require an action, submenu, or selection state")
				assert(not (Copy.checked and Copy.selected), "A menu item cannot be both checked and selected")
				
				if Copy.children then
					Copy.children = menuItems(ReadFunction(Copy.children, p3), p3)
				end
			end
			table.insert(List, Copy)
		end
		return List
	end
	
	local function advice(List1, ChildrenName, p4: number, List)
		-- upvalues: ReadFunction (copy), advice (copy)
		local Count = 0
		local Count1 = nil
		
		for i, value in List1 do
			if value.divider ~= true then
				Count += 1
				
				if ReadFunction(value.role) == "destructive" then
					Count1 = i
				end
				if value.children then
					local Id = value.id or tostring(i)
					
					if p4 + 1 >= 2 then
						table.insert(List, `Facet UI.Menu: submenu '{Id}' nests {p4 + 1} levels deep. The platform guidance advises a single level.`)
					end
					advice(ReadFunction(value.children), `{ChildrenName}[{i}].children`, p4 + 1, List)
				end
			end
		end
		if Count > 5 then
			table.insert(List, `Facet UI.Menu: {ChildrenName} holds {Count} items; past about five, consider a new menu.`)
		end
		if Count1 and Count1 ~= #List1 then
			table.insert(List, `Facet UI.Menu: {ChildrenName}[{Count1}] is destructive but not last; put destructive items at the end of the menu.`)
		end
		return List
	end
	
	return {
		checkWidth = function(Value: number)
			-- upvalues: config (copy)
			if Value == nil then return end
			if type(Value) == "number" then
				assert(type(Value) == "number" and (Value == Value and math.abs(Value) < 1e999 and Value > 0), "Facet UI.Menu: width must be a finite number of pixels above 0, a UDim, a UDim2 or a dimension table")
				
				return
			end
			if typeof(Value) == "UDim" or typeof(Value) == "UDim2" then return end
			assert(type(Value) == "table", "Facet UI.Menu: width must be a number of pixels, a UDim, a UDim2 or a dimension table")
			local Entry = config[tostring(Value.type)]
			
			if Entry == nil then
				error(`Facet UI.Menu: width.type must be fixed, fill, hug, percent, content or minMax (got {tostring(Value.type)})`, 0)
			end
			for i, value in Value do
				if i ~= "type" then
					if not Entry[i] then
						error(`Facet UI.Menu: a {tostring(Value.type)} width does not take '{tostring(i)}'`, 0)
					end
					if (type(value) ~= "number" or (value ~= value or math.abs(value) >= 1e999)) and (type(value) ~= "string" or i == "fraction" or i == "weight") then
						error(`Facet UI.Menu: width.{tostring(i)} must be a finite number or a theme metric name`, 0)
					end
				end
			end
			if Value.type == "fixed" then
				assert(Value.px ~= nil, "Facet UI.Menu: a fixed width requires px")
				
				return
			end
			if Value.type == "percent" then
				assert(Value.fraction ~= nil, "Facet UI.Menu: a percent width requires fraction")
			end
		end,
		resolveWidth = function(p4, p5, p6, p7)
			-- upvalues: p1 (copy)
			if type(p4) == "number" then
				return p4
			end
			if typeof(p4) == "UDim" then
				return p4.Scale * p6 + p4.Offset
			end
			if typeof(p4) == "UDim2" then
				local X = p4.X
				
				return X.Scale * p6 + X.Offset
			end
			local Min = p4.min
			local MetricResult = (if Min == nil then nil elseif type(Min) == "string" then p1.metric(Min, p7) else Min) or 0
			local Max = p4.max
			local MetricResult1 = (if Max == nil then nil elseif type(Max) == "string" then p1.metric(Max, p7) else Max) or 1e999
			local Value = nil
			
			if p4.type == "fixed" then
				local Px = p4.px
				Value = assert(if Px == nil then nil elseif type(Px) == "string" then p1.metric(Px, p7) else Px)
			elseif p4.type == "fill" then
				Value = p6
			elseif p4.type == "percent" then
				Value = (p4.fraction or 0) * p6 + (p4.offset or 0)
			elseif p4.type == "minMax" then
				local Preferred = p4.preferred
				Value = (if Preferred == nil then nil elseif type(Preferred) == "string" then p1.metric(Preferred, p7) else Preferred) or p5
			else
				Value = p5
			end
			return (math.max(0, (math.clamp(Value, MetricResult, (math.max(MetricResult, MetricResult1))))))
		end,
		actionItem = function(p4)
			assert(p4.divider ~= true, "Menu action cannot be a divider")
			
			return p4
		end,
		commitItem = function(p4): boolean
			-- upvalues: ReadFunction (copy)
			if ReadFunction(p4.enabled) == false then
				return false
			end
			if p4.checked then
				p4.checked:set(not p4.checked:peek())
				
				if p4.onChange then
					p4.onChange(p4.checked:peek())
				end
			elseif p4.selected then
				p4.selected:set(p4.value)
				
				if p4.onChange then
					p4.onChange(p4.value)
				end
			end
			local OnSelectFunction: () -> () = p4.onSelect
			
			if OnSelectFunction then
				OnSelectFunction()
			end
			return true
		end,
		menuItems = menuItems,
		advice = advice
	}
end