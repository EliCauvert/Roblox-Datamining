local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./collection_types")
local _ = require("./collection_table_metrics")

return function(p1, p2, p3, p4, p5, p6, Callback, Callback1, p7)
	local Compose = p1.Compose
	local Host = p1.Host
	local ReadFunction = p1.read
	local ReadSourceFunction = p1.readSource
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local TypesEnum = p1.types.Enum
	local IsNotFunction: boolean = not Compose.isValue(p2.columns) and type(p2.columns) ~= "function"
	
	if IsNotFunction then
		for _, value in ReadFunction(p2.columns) do
			if value.width == nil or value.minWidth ~= nil or value.maxWidth ~= nil then
				IsNotFunction = false
				break
			end
		end
	end
	local CellResult = Compose.cell(0)
	local CellResult1 = Compose.cell(0)
	local CellResult2 = Compose.cell(0)
	local Keys = {}
	local t = {}
	local KeyedCache = Compose.createKeyedCache({
		maxRetained = 512,
		build = function(_)
			return { width = 0 }
		end,
		destroy = function(_) end
	})
	local FontFaceResult = p1.observeStyled.FontFace(p5.textInsets)
	local TextSizeResult = p1.observeStyled.TextSize(p5.textInsets)
	
	local function _(p8, p9, p10): string
		return `{p8.Family}:{p8.Weight.Value}:{p8.Style.Value}:{p9}:{p10}`
	end
	
	local _ = function(p8, p9): string
		return `{#p8}:{p8}:{p9}`
	end
	
	local function setPrimaryMeasure(Key, Key1)
		-- upvalues: Keys (copy), t (copy), CellResult2 (copy)
		local Key2 = Keys[Key]
		
		if Key2 == Key1 then return end
		if Key2 then
			local v1 = (t[Key2] or 0) - 1
			t[Key2] = if v1 > 0 then v1 else nil
		end
		Keys[Key] = Key1
		
		if Key1 then
			t[Key1] = (t[Key1] or 0) + 1
		end
		local PeekResult = CellResult2:peek()
		
		if Key1 and PeekResult < Key1 then
			CellResult2:set(Key1)
			
			return
		end
		if Key2 == PeekResult and t[PeekResult] == nil then
			local Largest = 0
			
			for i in t do
				Largest = math.max(Largest, i)
			end
			CellResult2:set(Largest)
		end
	end
	
	local function minimumOf(p8)
		return p8.minWidth or 48
	end
	
	Compose.watch(function(Callback2)
		-- upvalues: ReadFunction (copy), p2 (copy), Keys (copy), FontFaceResult (copy), TextSizeResult (copy), p7 (copy), p5 (copy), p6 (copy), KeyedCache (copy), Callback (copy), Callback1 (copy), setPrimaryMeasure (copy), t (copy), CellResult2 (copy)
		local ReadResultEntry = ReadFunction(p2.columns, Callback2)[1]
		
		if (ReadResultEntry == nil or ReadResultEntry.render ~= nil or ReadResultEntry.editor ~= nil) and next(Keys) == nil then return end
		local CallbackResult = Callback2(FontFaceResult)
		local Text: string = `{CallbackResult.Family}:{CallbackResult.Weight.Value}:{CallbackResult.Style.Value}:{Callback2(TextSizeResult)}:{Callback2(p7)}`
		local UIPadding = p5.textInsets:FindFirstChildWhichIsA("UIPadding")
		local NewOffset = if UIPadding then UIPadding:GetStyled("PaddingLeft").Offset + UIPadding:GetStyled("PaddingRight").Offset else math.max(p5.cellPadding, Callback2(p5.textInsetSize).X / Callback2(p7))
		local CallbackResult1 = Callback2(p6)
		
		if KeyedCache.size() == 0 then return end
		local t1 = {}
		
		for i, value in CallbackResult1 do
			local CallbackResult2 = Callback(value, i)
			t1[CallbackResult2] = true
			local CallbackResult11 = if ReadResultEntry then Callback1(value, ReadResultEntry) else nil
			local Text1: string = if CallbackResult11 == nil then "" else tostring(CallbackResult11)
			local PeekResult = if ReadResultEntry and ReadResultEntry.render == nil and ReadResultEntry.editor == nil then KeyedCache.peek(`{#Text1}:{Text1}:{Text}`) else nil
			setPrimaryMeasure(CallbackResult2, if PeekResult then PeekResult.width + NewOffset else nil)
		end
		for key in Keys do
			local Entry = t1[key]
			local Key = nil
			
			if not Entry then
				Key = Keys[key]
				Entry = Key == nil
			end
			if not Entry then
				if Key then
					local v2 = (t[Key] or 0) - 1
					t[Key] = if v2 > 0 then v2 else nil
				end
				Keys[key] = nil
				local PeekResult = CellResult2:peek()
				
				if Key == PeekResult and t[PeekResult] == nil then
					local Largest = 0
					
					for i1 in t do
						Largest = math.max(Largest, i1)
					end
					CellResult2:set(Largest)
				end
			end
		end
	end)
	
	local _ = function(p8, Value: number): number
		return (math.clamp(Value, p8.minWidth or 48, p8.maxWidth or 1000000))
	end
	
	local FormulaResult = Compose.formula(function(Callback)
		-- upvalues: ReadFunction (copy), p2 (copy), CellResult (copy), ReadSourceFunction (copy), p3 (copy), CellResult2 (copy)
		local ReadResult = ReadFunction(p2.columns, Callback)
		local CallbackResult = Callback(CellResult)
		local Source = ReadSourceFunction(p3, Callback)
		local t = {}
		local List = {}
		local Total = 0
		
		for i, value in ReadResult do
			local SourceEntry = Source[value.id] or value.width
			local ClampedValue = math.clamp(SourceEntry or (value.minWidth or 48), value.minWidth or 48, value.maxWidth or 1000000)
			Total += if i == 1 and SourceEntry == nil then math.clamp(math.max(ClampedValue, Callback(CellResult2)), value.minWidth or 48, value.maxWidth or 1000000) else ClampedValue
			
			if i > 1 and type(value.priority) == "number" then
				table.insert(List, {
					id = value.id,
					width = ClampedValue,
					priority = value.priority
				})
			end
		end
		table.sort(List, function(A, B): boolean
			return B.priority < A.priority
		end)
		
		if CallbackResult > 0 then
			for _, value1 in List do
				if Total <= CallbackResult then break end
				if next(t) == nil then
					CallbackResult -= 48
				end
				t[value1.id] = true
				Total -= value1.width
			end
		end
		return t
	end, function(List, List1): boolean
		if List == nil then
			return false
		end
		for i, value in List do
			if List1[i] ~= value then
				return false
			end
		end
		for i1, value1 in List1 do
			if List[i1] ~= value1 then
				return false
			end
		end
		return true
	end)
	local FormulaResult1 = Compose.formula(function(Callback): number
		-- upvalues: FormulaResult (copy), p4 (copy)
		if next(Callback(FormulaResult)) ~= nil then
			return 48
		end
		for _, value in Callback(p4) do
			if next(value) ~= nil then
				return 48
			end
		end
		return 0
	end)
	local v3 = assert(Compose.currentOwner())
	local FormulaResult2 = Compose.formula(function(Callback)
		-- upvalues: CellResult1 (copy), CellResult (copy), ReadFunction (copy), p2 (copy), FormulaResult (copy), ReadSourceFunction (copy), p3 (copy), FormulaResult1 (copy), CellResult2 (copy)
		local CallbackResult: number = Callback(CellResult1)
		local CallbackResult1 = if CallbackResult > 0 then CallbackResult else Callback(CellResult)
		
		if CallbackResult1 <= 0 then
			return {}
		end
		local ClampedValues = {}
		local List = {}
		local Total = 0
		local ReadResult = ReadFunction(p2.columns, Callback)
		local CallbackResult2 = Callback(FormulaResult)
		local Source = ReadSourceFunction(p3, Callback)
		
		for _, value in ReadResult do
			if not CallbackResult2[value.id] then
				local SourceEntry = Source[value.id] or value.width
				local ClampedValue = math.clamp(SourceEntry or (value.minWidth or 48), value.minWidth or 48, value.maxWidth or 1000000)
				ClampedValues[value.id] = ClampedValue
				Total += ClampedValue
				
				if SourceEntry == nil then
					table.insert(List, value)
				end
			end
		end
		local Floored = math.floor((math.max(0, CallbackResult1 - Callback(FormulaResult1) - Total)))
		local ReadResultEntry = ReadResult[1]
		local Amount = nil
		
		if ReadResultEntry and ClampedValues[ReadResultEntry.id] and Source[ReadResultEntry.id] == nil and ReadResultEntry.width == nil then
			local Floored1 = math.floor((math.min(Floored, (math.max(0, math.min(ReadResultEntry.maxWidth or 1e999, Callback(CellResult2)) - ClampedValues[ReadResultEntry.id])))))
			local Id = ReadResultEntry.id
			ClampedValues[Id] += Floored1
			Floored -= Floored1
		end
		while Floored > 0 and #List > 0 do
			local NewLargest = 0
			
			for _, value1 in List do
				NewLargest += 1 / (math.max(0, if type(value1.priority) == "number" then value1.priority else 0) + 1)
			end
			Amount = 0
			local List1 = {}
			
			for _, value3 in List do
				local Floored2 = math.floor((math.min(Floored / NewLargest / (math.max(0, if type(value3.priority) == "number" then value3.priority else 0) + 1), (math.max(0, (value3.maxWidth or 1e999) - ClampedValues[value3.id])))))
				local Id = value3.id
				ClampedValues[Id] += Floored2
				Amount += Floored2
				
				if ClampedValues[value3.id] < (value3.maxWidth or 1e999) then
					table.insert(List1, value3)
				end
			end
			if Amount <= 0 then
				for _, value2 in List1 do
					if ClampedValues[value2.id] + 1 <= (value2.maxWidth or 1e999) then
						local Id = value2.id
						ClampedValues[Id] += 1
						Amount = 1
						break
					end
				end
				if Amount <= 0 then break end
			end
			Floored -= Amount
			List = List1
		end
		return ClampedValues
	end)
	local WithOwnerResults = {}
	
	return {
		viewportWidth = CellResult,
		fillWidth = CellResult1,
		setPrimaryMeasure = function(p8, p9, Width: number, p10: number)
			-- upvalues: p7 (copy), KeyedCache (copy), FontFaceResult (copy), TextSizeResult (copy), setPrimaryMeasure (copy)
			if Width <= 0 then return end
			local FontFaceStyled = p9:GetStyled("FontFace")
			local Text: string = `{FontFaceStyled.Family}:{FontFaceStyled.Weight.Value}:{FontFaceStyled.Style.Value}:{p9:GetStyled("TextSize")}:{p7:peek()}`
			local Text1 = p9.Text
			KeyedCache.get(`{#Text1}:{Text1}:{Text}`).width = Width
			local PeekResult = FontFaceResult:peek()
			
			if Text == `{PeekResult.Family}:{PeekResult.Weight.Value}:{PeekResult.Style.Value}:{TextSizeResult:peek()}:{p7:peek()}` then
				setPrimaryMeasure(p8, Width + p10)
			end
		end,
		minimumOf = minimumOf,
		collapsed = FormulaResult,
		disclosureWidth = FormulaResult1,
		disclosureShare = Compose.formula(function(Callback)
			-- upvalues: FormulaResult (copy), ReadSourceFunction (copy), p3 (copy), ReadFunction (copy), p2 (copy), FormulaResult1 (copy)
			if next(Callback(FormulaResult)) ~= nil then
				return 0
			end
			local CallbackResult = Callback(FormulaResult)
			local Source = ReadSourceFunction(p3, Callback)
			local Count = 0
			
			for _, value in ReadFunction(p2.columns, Callback) do
				if not CallbackResult[value.id] and Source[value.id] == nil and value.width == nil then
					Count += 1
				end
			end
			return if Count > 0 then Callback(FormulaResult1) / Count else 0
		end),
		narrowest = Compose.formula(function(Callback): number
			-- upvalues: FormulaResult (copy), ReadSourceFunction (copy), p3 (copy), ReadFunction (copy), p2 (copy)
			local CallbackResult = Callback(FormulaResult)
			local Source = ReadSourceFunction(p3, Callback)
			local NewClampedValue = 0
			
			for _, value in ReadFunction(p2.columns, Callback) do
				if not CallbackResult[value.id] then
					NewClampedValue += math.clamp(Source[value.id] or (value.width or (value.minWidth or 48)), value.minWidth or 48, value.maxWidth or 1000000)
				end
			end
			return NewClampedValue
		end),
		textWrap = function(p8, p9)
			-- upvalues: p5 (copy)
			local Wrap = p8.wrap
			assert(Wrap == nil or type(Wrap) == "boolean", "Facet.Table column.wrap must be a boolean")
			
			return if Wrap == nil then p5.touchRows(p9) else Wrap
		end,
		columnFrame = function(p8, LayoutOrder, p9, p10, p11)
			-- upvalues: p1 (copy), WithOwnerResults (copy), Compose (copy), v3 (copy), ReadFunction (copy), p2 (copy), ReadSourceFunction (copy), p3 (copy), FormulaResult (copy), TypesUDim2 (copy), FormulaResult2 (copy), TypesVector2 (copy), TypesEnum (copy), IsNotFunction (ref), Host (copy)
			local Id = p1.read(p8).id
			local WithOwnerResult = WithOwnerResults[Id]
			
			if WithOwnerResult == nil then
				WithOwnerResult = Compose.withOwner(v3, function()
					-- upvalues: Compose (upval), ReadFunction (upval), p2 (upval), Id (copy), ReadSourceFunction (upval), p3 (upval), FormulaResult (upval), TypesUDim2 (upval), FormulaResult2 (upval), TypesVector2 (upval), TypesEnum (upval)
					local FormulaResult1 = Compose.formula(function(p12)
						-- upvalues: ReadFunction (upval), p2 (upval), Id (upval)
						for _, value in ReadFunction(p2.columns, p12) do
							if value.id == Id then
								return {
									id = Id,
									width = value.width,
									minWidth = value.minWidth,
									maxWidth = value.maxWidth
								}
							end
						end
						return { id = Id }
					end)
					local FormulaResult3 = Compose.formula(function(Callback)
						-- upvalues: FormulaResult1 (copy), ReadSourceFunction (upval), p3 (upval), Id (upval)
						local CallbackResult = Callback(FormulaResult1)
						local SourceEntry = ReadSourceFunction(p3, Callback)[Id] or CallbackResult.width
						
						return if SourceEntry then math.clamp(SourceEntry, CallbackResult.minWidth or 48, CallbackResult.maxWidth or 1000000) else nil
					end)
					
					return {
						visible = Compose.formula(function(Callback): boolean
							-- upvalues: FormulaResult (upval), Id (upval)
							return not Callback(FormulaResult)[Id]
						end),
						size = Compose.formula(function(Callback)
							-- upvalues: TypesUDim2 (upval), FormulaResult2 (upval), Id (upval), FormulaResult3 (copy)
							return TypesUDim2.new(0, Callback(FormulaResult2)[Id] or (Callback(FormulaResult3) or 0), 1, 0)
						end),
						minimum = Compose.formula(function(Callback)
							-- upvalues: TypesVector2 (upval), FormulaResult1 (copy)
							return TypesVector2.new(Callback(FormulaResult1).minWidth or 48, 0)
						end),
						maximum = Compose.formula(function(Callback)
							-- upvalues: TypesVector2 (upval), FormulaResult2 (upval), Id (upval), FormulaResult1 (copy)
							return TypesVector2.new(math.min(Callback(FormulaResult2)[Id] or 1000000, Callback(FormulaResult1).maxWidth or 1000000), 1000000)
						end),
						flex = Compose.formula(function(Callback)
							-- upvalues: FormulaResult3 (copy), TypesEnum (upval)
							return if Callback(FormulaResult3) == nil then TypesEnum.UIFlexMode.Fill else TypesEnum.UIFlexMode.None
						end)
					}
				end)
				WithOwnerResults[Id] = WithOwnerResult
			end
			local WithOwnerResult1 = WithOwnerResult
			local List = {
				Name = Id,
				Visible = WithOwnerResult1.visible,
				LayoutOrder = LayoutOrder,
				BackgroundTransparency = 1,
				Size = WithOwnerResult1.size,
				p9
			}
			
			if p10 then
				table.insert(List, p10)
			end
			if p11 then
				table.insert(List, p11)
			end
			if not IsNotFunction then
				table.insert(List, Host.UISizeConstraint({
					MinSize = WithOwnerResult1.minimum,
					MaxSize = WithOwnerResult1.maximum
				}))
				table.insert(List, Host.UIFlexItem({ FlexMode = WithOwnerResult1.flex }))
			end
			return Host.Frame(List)
		end
	}
end