local UltimateList = script:FindFirstAncestor("ultimate-list")
local _ = require(UltimateList.Dimensions)
local DimensionsMethodsModule = require(UltimateList.Dimensions.DimensionsMethods)
local ReactModule = require(UltimateList.Parent.React)
local AdjustPositionToScrollAxisModule = require(UltimateList.Dimensions.adjustPositionToScrollAxis)
local _ = require(UltimateList.createVirtualizedListController)
local JoinAndMapBindingsModule = require(UltimateList.Util.joinAndMapBindings)
local CreateElementFunction = ReactModule.createElement
local ReactBindingsRenderer = require(UltimateList.Util.createDebugLogger)("ReactBindingsRenderer")

local function getKeyDefault(_, p1): string --[[ Line: 15 ]]
	return (tostring(p1))
end

return (ReactModule.memo(function(p1) --[[ Line: 35 | Named "ReactBindingsRenderer" ]]
	-- upvalues: ReactModule (copy), DimensionsMethodsModule (copy), getKeyDefault (copy), ReactBindingsRenderer (copy), CreateElementFunction (copy), JoinAndMapBindingsModule (copy), AdjustPositionToScrollAxisModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function() --[[ Line: 48 ]]
		-- upvalues: DimensionsMethodsModule (upval), p1 (copy), ReactModule (upval)
		local List = {}
		local ElementsDisplayedHintResult = DimensionsMethodsModule.elementsDisplayedHint(p1.dimensions, p1.virtualizedListController.getWindowSize(), p1.direction)
		
		if ElementsDisplayedHintResult == nil then
			return List
		end
		for _ = 1, ElementsDisplayedHintResult do
			local Binding, Binding2 = ReactModule.createBinding({ contents = { type = "vacant" } })
			table.insert(List, { binding = Binding, set = Binding2 })
		end
		return List
	end)
	local GetKey = p1.getKey or getKeyDefault
	ReactModule.useEffect(function() --[[ Line: 79 ]]
		-- upvalues: p1 (copy), GetKey (copy), UseStateResult (copy), ReactBindingsRenderer (upval), ReactModule (upval), UseStateResult2 (copy)
		return p1.virtualizedListController.bindToUpdate(function() --[[ Line: 80 ]]
			-- upvalues: p1 (upval), GetKey (upval), UseStateResult (upval), ReactBindingsRenderer (upval), ReactModule (upval), UseStateResult2 (upval)
			local GetResult = p1.virtualizedListController.get()
			local Range = p1.virtualizedListController.getRange()
			local t = {}
			
			for i, value in GetResult do
				t[GetKey(value, i + (Range.X - 1))] = i
			end
			local List = {}
			local List1 = {}
			local List2 = {}
			
			for Key, value1 in UseStateResult do
				local Value = value1.binding:getValue()
				
				if Value.contents.type == "vacant" then
					table.insert(List1, value1.set)
				else
					local Key1 = Value.contents.key
					local Entry = t[Key1]
					
					if Entry == nil then
						ReactBindingsRenderer("%s is now dead", Key1)
						table.insert(List, value1.set)
					else
						t[Key1] = nil
						local GetResultEntry = GetResult[Entry]
						
						if Value.contents.value ~= GetResultEntry then
							ReactBindingsRenderer("%s existed, but changed", Key1)
							value1.set({
								contents = {
									type = "full",
									index = Entry + (Range.X - 1),
									key = Key1,
									value = GetResultEntry
								}
							})
						end
					end
				end
			end
			ReactBindingsRenderer("%d total setters, %d dead setters, %d vacant setters", #UseStateResult, #List, #List1)
			
			for Key, value2 in t do
				assert(value2 ~= nil, "Luau")
				local config = {
					contents = {
						type = "full",
						index = value2 + (Range.X - 1),
						key = Key,
						value = GetResult[value2]
					}
				}
				local Removed: (any) -> () = table.remove(List)
				
				if Removed ~= nil then
					ReactBindingsRenderer("%s is filling dead spot", Key)
					Removed(config)
					continue
				end
				local Removed1: (any) -> () = table.remove(List1)
				
				if Removed1 == nil then
					local Binding, Binding2 = ReactModule.createBinding(config)
					table.insert(List2, { binding = Binding, set = Binding2 })
				else
					ReactBindingsRenderer("%s is filling vacant spot", Key)
					Removed1(config)
				end
			end
			if #List2 > 0 then
				ReactBindingsRenderer("Needed to create %d more bindings to fit, there will be %d setters", #List2, #List2 + #UseStateResult)
				UseStateResult2(function(Tbl) --[[ Line: 177 ]]
					-- upvalues: List2 (copy)
					local Copy = table.clone(Tbl)
					table.move(List2, 1, #List2, #Copy + 1, Copy)
					
					return Copy
				end)
			end
			for _, value3 in List do
				value3({ contents = { type = "vacant" } })
			end
		end)
	end, { p1.virtualizedListController, GetKey, UseStateResult })
	local Frames = {}
	
	for i, value in UseStateResult do
		local Binding = value.binding
		local MapResult = Binding:map(function(p2) --[[ Line: 199 ]]
			-- upvalues: DimensionsMethodsModule (upval), p1 (copy)
			return if p2.contents.type == "vacant" then { size = UDim2.new(), position = UDim2.new() } else DimensionsMethodsModule.getUDimRect(p1.dimensions, p2.contents.value, p2.contents.index, p1.virtualizedListController.getWindowSize(), p1.direction)
		end)
		Frames[`Item{i}`] = CreateElementFunction("Frame", {
			BackgroundTransparency = 1,
			Position = JoinAndMapBindingsModule(function(p2, p3) --[[ Line: 219 ]]
				-- upvalues: AdjustPositionToScrollAxisModule (upval), p1 (copy)
				return AdjustPositionToScrollAxisModule(p2.position, p3, p1.direction)
			end, MapResult, p1.scrollAxisBinding),
			Size = MapResult:map(function(p2) --[[ Line: 223 ]]
				return p2.size
			end),
			Visible = Binding:map(function(p2): boolean --[[ Line: 227 ]]
				return p2.contents.type == "full"
			end)
		}, {
			Content = p1.callback(Binding:map(function(p2) --[[ Line: 231 ]]
				return if p2.contents.type == "full" then p2.contents.value else nil
			end))
		})
	end
	return CreateElementFunction(ReactModule.Fragment, {}, Frames)
end))