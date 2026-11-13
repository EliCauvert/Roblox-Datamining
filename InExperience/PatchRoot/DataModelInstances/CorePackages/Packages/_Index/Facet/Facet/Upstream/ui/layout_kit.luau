local CoreModule = require("../vendor/compose/core")
local _ = require("./types")
local ExtentMatchModule = require("./extent_match")
local SizeFloorModule = require("./size_floor")
local _ = require("./theme_types")

local function plain(Object, Frame)
	if type(Frame) ~= "table" or Frame.BackgroundTransparency == nil then
		Object:AddTag("facet-layout")
	end
	return Object
end

return {
	of = function(p1)
		return (assert(p1.layoutKit, "Facet layout requires a controls context"))
	end,
	attach = function(p1)
		-- upvalues: plain (copy), SizeFloorModule (copy), CoreModule (copy), ExtentMatchModule (copy)
		local Host = p1.Host
		local ReadFunction = p1.read
		local Types = p1.types
		local Config = p1.config
		local Compose = p1.Compose
		local Runtime = p1.runtime
		local TypesEnum = Types.Enum
		
		local function _(Callback)
			-- upvalues: Compose (copy)
			return Compose.isValue(Callback) or type(Callback) == "function"
		end
		
		local function derive(Callback, ...)
			-- upvalues: Compose (copy)
			for i = 1, select("#", ...) do
				local Selected = select(i, ...)
				
				if Compose.isValue(Selected) or type(Selected) == "function" then
					return function(p2)
						-- upvalues: Callback (copy)
						return Callback(p2)
					end
				end
			end
			return Callback(nil)
		end
		
		local LayoutKit = {
			spacing = function(Gap, p2)
				-- upvalues: ReadFunction (copy), Config (copy), p1 (copy)
				local ReadResult: number = ReadFunction(Gap, p2)
				
				if ReadResult == nil then
					return 0
				elseif type(ReadResult) == "number" then
					assert(ReadResult >= 0 and ReadResult < 1e999, "Facet spacing must be a finite number of pixels, 0 or more")
					
					return ReadResult
				else
					assert(type(ReadResult) == "string", "Facet spacing must be a number or a spacing step")
					local ReadResult1 = ReadFunction(Config.theme, p2)
					local SpaceEntry = (if ReadResult1 and type(ReadResult1.metrics.space) == "table" then ReadResult1.metrics.space else p1.neutralMetrics(p2).space)[ReadResult] or p1.neutralMetrics(p2).space[ReadResult]
					assert(type(SpaceEntry) == "number", `Facet spacing step "{ReadResult}" is not in the theme; use xs, s, m, l, xl or a number`)
					
					return SpaceEntry
				end
			end
		}
		
		local _ = function(p2)
			-- upvalues: derive (copy), ReadFunction (copy), Types (copy), LayoutKit (copy), Config (copy)
			return derive(function(p3)
				-- upvalues: ReadFunction (upval), p2 (copy), Types (upval), LayoutKit (upval)
				local v1: number = ReadFunction(p2, p3)
				
				if type(v1) == "number" and v1 < 0 then
					assert(v1 > -1e999, "Facet gap must be a finite number of pixels")
					
					return Types.UDim.new(0, v1)
				else
					return Types.UDim.new(0, LayoutKit.spacing(p2, p3))
				end
			end, p2, if type(ReadFunction(p2)) == "string" then Config.theme else nil)
		end
		
		function LayoutKit.insets(Padding, CellResult)
			-- upvalues: ReadFunction (copy), derive (copy), Types (copy), LayoutKit (copy), Config (copy), Host (copy)
			if Padding == nil then
				return nil
			else
				local function side(p2)
					-- upvalues: ReadFunction (upval), Padding (copy), derive (upval), CellResult (copy), Types (upval), LayoutKit (upval), Config (upval)
					local function _(p3)
						-- upvalues: ReadFunction (upval), Padding (upval), p2 (copy)
						local ReadResult = ReadFunction(Padding, p3)
						
						return if type(ReadResult) == "table" then ReadResult[p2] else ReadResult
					end
					
					local function v40(Callback)
						-- upvalues: ReadFunction (upval), Padding (upval), p2 (copy), CellResult (upval), Types (upval), LayoutKit (upval)
						local ReadResult = ReadFunction(Padding, Callback)
						local ReadResultEntry = if type(ReadResult) == "table" then ReadResult[p2] else ReadResult
						local CallbackResult = if CellResult and Callback then Callback(CellResult) elseif CellResult then CellResult:peek() else nil
						local Top = if CallbackResult == nil then 0 elseif p2 == "top" then CallbackResult.top elseif p2 == "right" then CallbackResult.right elseif p2 == "bottom" then CallbackResult.bottom else CallbackResult.left
						
						return if typeof(ReadResultEntry) == "UDim" then if Top > 0 then Types.UDim.new(ReadResultEntry.Scale, ReadResultEntry.Offset + Top) else ReadResultEntry else Types.UDim.new(0, LayoutKit.spacing(ReadResultEntry, Callback) + Top)
					end
					
					local ReadResult = ReadFunction(Padding, nil)
					local ReadResultEntry = if type(ReadResult) == "table" then ReadResult[p2] else ReadResult
					
					return derive(v40, Padding, if type(ReadResultEntry) == "string" then Config.theme else nil, CellResult)
				end
				
				return Host.UIPadding({
					PaddingTop = side("top"),
					PaddingRight = side("right"),
					PaddingBottom = side("bottom"),
					PaddingLeft = side("left")
				})
			end
		end
		
		function LayoutKit.shadowRoom(Object, CellResult)
			-- upvalues: Compose (copy), Runtime (copy)
			local function measure()
				-- upvalues: Object (copy), CellResult (copy)
				local Top = 0
				local Right = 0
				local Bottom = 0
				local Left = 0
				
				for _, Gui in Object:GetChildren() do
					if Gui:IsA("GuiObject") and Gui.Visible then
						for _, UIShadow in Gui:GetChildren() do
							if UIShadow:IsA("UIShadow") and UIShadow.Enabled then
								local Offset = UIShadow.BlurRadius.Offset
								local Offset1 = UIShadow.Offset.X.Offset
								local Offset2 = UIShadow.Offset.Y.Offset
								local Offset3 = UIShadow.Spread.X.Offset
								local Offset4 = UIShadow.Spread.Y.Offset
								Top = math.max(Top, -Offset2 + Offset4 + Offset)
								Bottom = math.max(Bottom, Offset2 + Offset4 + Offset)
								Left = math.max(Left, -Offset1 + Offset3 + Offset)
								Right = math.max(Right, Offset1 + Offset3 + Offset)
							end
						end
					end
				end
				local PeekResult = CellResult:peek()
				
				if PeekResult.top ~= Top or PeekResult.right ~= Right or PeekResult.bottom ~= Bottom or PeekResult.left ~= Left then
					CellResult:set({ top = Top, right = Right, bottom = Bottom, left = Left })
				end
			end
			
			local FacetStackShadowRoomNeedsAnOwner = assert(Compose.currentOwner(), "Facet stack shadow room needs an owner")
			
			local function connect(Gui, p2, Measure)
				-- upvalues: Compose (upval), FacetStackShadowRoomNeedsAnOwner (copy), Runtime (upval)
				return Compose.withOwner(FacetStackShadowRoomNeedsAnOwner, function()
					-- upvalues: Runtime (upval), Gui (copy), p2 (copy), Measure (copy)
					return Runtime.connect(Gui, p2, Measure)
				end)
			end
			
			local t = {}
			
			local function _(Key)
				-- upvalues: t (copy)
				local Entry = t[Key]
				
				if Entry then
					for _, value in Entry do
						value()
					end
				end
				t[Key] = nil
			end
			
			local _ = function(UIShadow)
				-- upvalues: t (copy), connect (copy), measure (copy)
				if UIShadow:IsA("UIShadow") and t[UIShadow] == nil then
					t[UIShadow] = { connect(UIShadow, "Changed", measure) }
				end
			end
			
			local function watchChild(Gui)
				-- upvalues: t (copy), measure (copy), Compose (upval), FacetStackShadowRoomNeedsAnOwner (copy), Runtime (upval), connect (copy)
				if not Gui:IsA("GuiObject") or t[Gui] ~= nil then return end
				local function v72(p2)
					-- upvalues: measure (upval)
					if p2 == "Visible" then
						measure()
					end
				end
				
				local v1 = "Changed"
				
				local function v74(UIShadow)
					-- upvalues: t (upval), connect (upval), measure (upval)
					if UIShadow:IsA("UIShadow") then
						if UIShadow:IsA("UIShadow") and t[UIShadow] == nil then
							t[UIShadow] = { connect(UIShadow, "Changed", measure) }
						end
						measure()
					end
				end
				
				local v2 = "ChildAdded"
				t[Gui] = {
					Compose.withOwner(FacetStackShadowRoomNeedsAnOwner, function()
						-- upvalues: Runtime (upval), Gui (copy), v1 (copy), v72 (copy)
						return Runtime.connect(Gui, v1, v72)
					end),
					Compose.withOwner(FacetStackShadowRoomNeedsAnOwner, function()
						-- upvalues: Runtime (upval), Gui (copy), v2 (copy), v74 (copy)
						return Runtime.connect(Gui, v2, v74)
					end),
					connect(Gui, "ChildRemoved", function(UIShadow)
						-- upvalues: t (upval), measure (upval)
						if UIShadow:IsA("UIShadow") then
							local Entry = t[UIShadow]
							
							if Entry then
								for _, value in Entry do
									value()
								end
							end
							t[UIShadow] = nil
							measure()
						end
					end)
				}
				
				for _, UIShadow in Gui:GetChildren() do
					if UIShadow:IsA("UIShadow") and t[UIShadow] == nil then
						t[UIShadow] = { connect(UIShadow, "Changed", measure) }
					end
				end
			end
			
			for _, child in Object:GetChildren() do
				watchChild(child)
			end
			local function v55(Gui)
				-- upvalues: watchChild (copy), measure (copy)
				watchChild(Gui)
				measure()
			end
			
			local v3 = "ChildAdded"
			local _ = Compose.withOwner(FacetStackShadowRoomNeedsAnOwner, function()
				-- upvalues: Runtime (upval), Object (copy), v3 (copy), v55 (copy)
				return Runtime.connect(Object, v3, v55)
			end)
			
			local function v58(Gui)
				-- upvalues: t (copy), measure (copy)
				if Gui:IsA("GuiObject") then
					for _, child in Gui:GetChildren() do
						local Entry = t[child]
						
						if Entry then
							for _, value in Entry do
								value()
							end
						end
						t[child] = nil
					end
					local Entry = t[Gui]
					
					if Entry then
						for _, value1 in Entry do
							value1()
						end
					end
					t[Gui] = nil
					measure()
				end
			end
			
			local v4 = "ChildRemoved"
			local _ = Compose.withOwner(FacetStackShadowRoomNeedsAnOwner, function()
				-- upvalues: Runtime (upval), Object (copy), v4 (copy), v58 (copy)
				return Runtime.connect(Object, v4, v58)
			end)
			measure()
		end
		
		local _ = function(p2, p3): boolean
			return type(p2) == "string" and p3[p2] == true
		end
		
		local config = { fill = true, hug = true }
		
		local _ = function(p2: number): number
			-- upvalues: config (copy)
			if type(p2) == "number" and p2 == p2 then
				return (math.max(p2, 0))
			else
				assert(type(p2) == "string" and config[p2] == true, `Facet width and height must be fill, hug or a number of pixels, got {tostring(p2)}`)
				
				return p2
			end
		end
		
		function LayoutKit.extent(p2, p3, p4)
			-- upvalues: ReadFunction (copy), config (copy), derive (copy), Types (copy), TypesEnum (copy)
			local function _(p5)
				-- upvalues: ReadFunction (upval), p2 (copy), p3 (copy), config (upval), p4 (copy)
				local ReadResult = ReadFunction(p2.width, p5)
				local ReadResult1 = ReadFunction(p2.height, p5)
				local ReadResult2 = if ReadResult == nil then p3 else ReadResult
				local Largest = nil
				
				if type(ReadResult2) == "number" and ReadResult2 == ReadResult2 then
					Largest = math.max(ReadResult2, 0)
				else
					assert(type(ReadResult2) == "string" and config[ReadResult2] == true, `Facet width and height must be fill, hug or a number of pixels, got {tostring(ReadResult2)}`)
					Largest = ReadResult2
				end
				local ReadResult3 = if ReadResult1 == nil then p4 else ReadResult1
				
				if type(ReadResult3) == "number" and ReadResult3 == ReadResult3 then
					return Largest, (math.max(ReadResult3, 0))
				else
					assert(type(ReadResult3) == "string" and config[ReadResult3] == true, `Facet width and height must be fill, hug or a number of pixels, got {tostring(ReadResult3)}`)
					
					return Largest, ReadResult3
				end
			end
			
			local _ = function(p5): number
				return if p5 == "fill" then 1 else 0
			end
			
			local _ = function(p5)
				return if type(p5) == "number" then p5 else 0
			end
			
			return derive(function(p5)
				-- upvalues: ReadFunction (upval), p2 (copy), p3 (copy), config (upval), p4 (copy), Types (upval)
				local ReadResult = ReadFunction(p2.width, p5)
				local ReadResult1 = ReadFunction(p2.height, p5)
				local ReadResult2 = if ReadResult == nil then p3 else ReadResult
				local Largest = nil
				
				if type(ReadResult2) == "number" and ReadResult2 == ReadResult2 then
					Largest = math.max(ReadResult2, 0)
				else
					assert(type(ReadResult2) == "string" and config[ReadResult2] == true, `Facet width and height must be fill, hug or a number of pixels, got {tostring(ReadResult2)}`)
					Largest = ReadResult2
				end
				local ReadResult3 = if ReadResult1 == nil then p4 else ReadResult1
				local Largest1 = nil
				
				if type(ReadResult3) == "number" and ReadResult3 == ReadResult3 then
					Largest1 = math.max(ReadResult3, 0)
				else
					assert(type(ReadResult3) == "string" and config[ReadResult3] == true, `Facet width and height must be fill, hug or a number of pixels, got {tostring(ReadResult3)}`)
					Largest1 = ReadResult3
				end
				return Types.UDim2.new(if Largest == "fill" then 1 else 0, if type(Largest) == "number" then Largest else 0, if Largest1 == "fill" then 1 else 0, if type(Largest1) == "number" then Largest1 else 0)
			end, p2.width, p2.height), derive(function(p5)
				-- upvalues: ReadFunction (upval), p2 (copy), p3 (copy), config (upval), p4 (copy), TypesEnum (upval)
				local ReadResult = ReadFunction(p2.width, p5)
				local ReadResult1 = ReadFunction(p2.height, p5)
				local ReadResult2 = if ReadResult == nil then p3 else ReadResult
				local Largest = nil
				
				if type(ReadResult2) == "number" and ReadResult2 == ReadResult2 then
					Largest = math.max(ReadResult2, 0)
				else
					assert(type(ReadResult2) == "string" and config[ReadResult2] == true, `Facet width and height must be fill, hug or a number of pixels, got {tostring(ReadResult2)}`)
					Largest = ReadResult2
				end
				local ReadResult3 = if ReadResult1 == nil then p4 else ReadResult1
				local Largest1 = nil
				
				if type(ReadResult3) == "number" and ReadResult3 == ReadResult3 then
					Largest1 = math.max(ReadResult3, 0)
				else
					assert(type(ReadResult3) == "string" and config[ReadResult3] == true, `Facet width and height must be fill, hug or a number of pixels, got {tostring(ReadResult3)}`)
					Largest1 = ReadResult3
				end
				local IsHug = Largest == "hug"
				local IsHug1 = Largest1 == "hug"
				
				return if IsHug and IsHug1 then TypesEnum.AutomaticSize.XY elseif IsHug then TypesEnum.AutomaticSize.X elseif IsHug1 then TypesEnum.AutomaticSize.Y else TypesEnum.AutomaticSize.None
			end, p2.width, p2.height)
		end
		
		local _ = function(p2, p3, p4, p5)
			return if p2 == "center" then p4 elseif p2 == "end" then p5 else p3
		end
		
		function LayoutKit.list(p2, Callback, IsValue)
			-- upvalues: ReadFunction (copy), Compose (copy), derive (copy), TypesEnum (copy), Types (copy), LayoutKit (copy), Config (copy), Host (copy)
			local function _(p3): boolean
				-- upvalues: ReadFunction (upval), Callback (copy)
				return ReadFunction(Callback, p3) == true
			end
			
			local Inverted = not (Compose.isValue(Callback) or type(Callback) == "function")
			
			local _ = function(p3, p4): boolean
				-- upvalues: Inverted (copy), ReadFunction (upval), Callback (copy)
				return if Inverted then if ReadFunction(Callback, nil) == true then p3 ~= nil else p4 ~= nil else p3 ~= nil or p4 ~= nil
			end
			
			local config = {
				FillDirection = derive(function(p3)
					-- upvalues: ReadFunction (upval), Callback (copy), TypesEnum (upval)
					return if ReadFunction(Callback, p3) == true then TypesEnum.FillDirection.Vertical else TypesEnum.FillDirection.Horizontal
				end, Callback),
				SortOrder = TypesEnum.SortOrder.LayoutOrder
			}
			
			if p2.gap ~= nil then
				local Gap = p2.gap
				config.Padding = derive(function(p3)
					-- upvalues: ReadFunction (upval), Gap (copy), Types (upval), LayoutKit (upval)
					local v5: number = ReadFunction(Gap, p3)
					
					if type(v5) == "number" and v5 < 0 then
						assert(v5 > -1e999, "Facet gap must be a finite number of pixels")
						
						return Types.UDim.new(0, v5)
					else
						return Types.UDim.new(0, LayoutKit.spacing(Gap, p3))
					end
				end, Gap, if type(ReadFunction(Gap)) == "string" then Config.theme else nil)
			end
			if p2.wrap ~= nil then
				config.Wraps = p2.wrap
			end
			local HorizontalAlignment = TypesEnum.HorizontalAlignment
			local VerticalAlignment = TypesEnum.VerticalAlignment
			
			local function align(p3)
				-- upvalues: ReadFunction (upval), p2 (copy)
				local ReadResult = ReadFunction(p2.align, p3)
				local v5 = true
				
				if ReadResult ~= nil then
					local config = {
						start = true,
						center = true,
						["end"] = true,
						stretch = true
					}
					v5 = type(ReadResult) == "string" and config[ReadResult] == true
				end
				assert(v5, "Facet align must be start, center, end or stretch")
				
				return if ReadResult == nil then "start" else ReadResult
			end
			
			local config1 = {
				spaceBetween = TypesEnum.UIFlexAlignment.SpaceBetween,
				spaceAround = TypesEnum.UIFlexAlignment.SpaceAround,
				spaceEvenly = TypesEnum.UIFlexAlignment.SpaceEvenly
			}
			
			local function distribute(p3)
				-- upvalues: ReadFunction (upval), p2 (copy)
				local ReadResult = ReadFunction(p2.distribute, p3)
				local v5 = true
				
				if ReadResult ~= nil then
					local config = { start = true, center = true, ["end"] = true }
					v5 = type(ReadResult) == "string" and config[ReadResult] == true
					
					if not v5 then
						local config1 = {
							spaceBetween = true,
							spaceAround = true,
							spaceEvenly = true
						}
						v5 = type(ReadResult) == "string" and config1[ReadResult] == true
					end
				end
				assert(v5, "Facet distribute must be start, center, end, spaceBetween, spaceAround or spaceEvenly")
				
				return if ReadResult == nil then "start" else ReadResult
			end
			
			local Align = p2.align
			local Distribute = p2.distribute
			
			if if Inverted then if ReadFunction(Callback, nil) == true then Align ~= nil else Distribute ~= nil else Align ~= nil or Distribute ~= nil then
				config.HorizontalAlignment = derive(function(p3)
					-- upvalues: ReadFunction (upval), Callback (copy), align (copy), distribute (copy), HorizontalAlignment (copy)
					local IsReadResult = ReadFunction(Callback, p3) == true
					local AlignResult = if IsReadResult then align(p3) else distribute(p3)
					local Left = HorizontalAlignment.Left
					local Center = HorizontalAlignment.Center
					local Right = HorizontalAlignment.Right
					
					return if AlignResult == "center" then Center elseif AlignResult == "end" then Right else Left
				end, Callback, p2.align, p2.distribute)
			end
			local Distribute1 = p2.distribute
			local Align1 = p2.align
			local Align2 = nil
			
			if if Inverted then if ReadFunction(Callback, nil) == true then Distribute1 ~= nil else Align1 ~= nil else Distribute1 ~= nil or Align1 ~= nil then
				config.VerticalAlignment = derive(function(p3)
					-- upvalues: ReadFunction (upval), Callback (copy), distribute (copy), align (copy), VerticalAlignment (copy)
					local IsReadResult = ReadFunction(Callback, p3) == true
					local DistributeResult = if IsReadResult then distribute(p3) else align(p3)
					local Top = VerticalAlignment.Top
					local Center = VerticalAlignment.Center
					local Bottom = VerticalAlignment.Bottom
					
					return if DistributeResult == "center" then Center elseif DistributeResult == "end" then Bottom else Top
				end, Callback, p2.align, p2.distribute)
			end
			repeat
				if not IsValue and p2.align ~= nil then
					local AlignFunction = p2.align
					
					if Compose.isValue(AlignFunction) or type(AlignFunction) == "function" or align(nil) == "stretch" then
						Align2 = p2.align
						break
					end
				end
				Align2 = nil
				local Distribute2 = nil
			until true
			repeat
				if p2.distribute ~= nil then
					local DistributeFunction = p2.distribute
					
					if Compose.isValue(DistributeFunction) or type(DistributeFunction) == "function" or config1[distribute(nil)] then
						local Distribute2 = p2.distribute
						break
					end
				end
				local Distribute2 = nil
			until true
			if Align2 ~= nil then
				config.ItemLineAlignment = derive(function(p3)
					-- upvalues: align (copy), TypesEnum (upval)
					return if align(p3) == "stretch" then TypesEnum.ItemLineAlignment.Stretch else TypesEnum.ItemLineAlignment.Automatic
				end, p2.align)
			end
			local _ = function(p3, p4)
				-- upvalues: Align2 (copy), align (copy), TypesEnum (upval), Distribute2 (copy), config1 (copy), distribute (copy)
				if p4 then
					return if Align2 == nil or align(p3) ~= "stretch" then TypesEnum.UIFlexAlignment.None else TypesEnum.UIFlexAlignment.Fill
				end
				local Entry = nil
				if Distribute2 == nil then
					Entry = TypesEnum.UIFlexAlignment.None
				else
					Entry = config1[distribute(p3)]
					
					if not Entry then
						return TypesEnum.UIFlexAlignment.None
					end
				end
				return Entry
			end
			
			if if Inverted then if ReadFunction(Callback, nil) == true then Align2 ~= nil else Distribute2 ~= nil else Align2 ~= nil or Distribute2 ~= nil then
				config.HorizontalFlex = derive(function(p3)
					-- upvalues: ReadFunction (upval), Callback (copy), Align2 (copy), align (copy), TypesEnum (upval), Distribute2 (copy), config1 (copy), distribute (copy)
					if ReadFunction(Callback, p3) == true then
						return if Align2 == nil or align(p3) ~= "stretch" then TypesEnum.UIFlexAlignment.None else TypesEnum.UIFlexAlignment.Fill
					end
					local Entry = nil
					if Distribute2 == nil then
						Entry = TypesEnum.UIFlexAlignment.None
					else
						Entry = config1[distribute(p3)]
						
						if not Entry then
							return TypesEnum.UIFlexAlignment.None
						end
					end
					return Entry
				end, Callback, Align2, Distribute2)
			end
			if if Inverted then if ReadFunction(Callback, nil) == true then Distribute2 ~= nil else Align2 ~= nil else Distribute2 ~= nil or Align2 ~= nil then
				config.VerticalFlex = derive(function(p3)
					-- upvalues: ReadFunction (upval), Callback (copy), Align2 (copy), align (copy), TypesEnum (upval), Distribute2 (copy), config1 (copy), distribute (copy)
					if not (ReadFunction(Callback, p3) == true) then
						return if Align2 == nil or align(p3) ~= "stretch" then TypesEnum.UIFlexAlignment.None else TypesEnum.UIFlexAlignment.Fill
					end
					local Entry = nil
					if Distribute2 == nil then
						Entry = TypesEnum.UIFlexAlignment.None
					else
						Entry = config1[distribute(p3)]
						
						if not Entry then
							return TypesEnum.UIFlexAlignment.None
						end
					end
					return Entry
				end, Callback, Align2, Distribute2)
			end
			return Host.UIListLayout(config)
		end
		
		function LayoutKit.ordered(List, Callback: (any, any) -> ())
			-- upvalues: Compose (copy)
			local v5 = false
			
			for _, value in List do
				v5 = v5 or type(value) == "function"
			end
			local Guis = {}
			
			for i, Gui in List do
				local LayoutOrder = if v5 then i * 65536 else i
				
				if type(Gui) == "function" then
					Guis[i] = function(p2)
						-- upvalues: LayoutOrder (copy), Compose (upval), Gui (copy), Callback (copy), i (copy)
						local List = {}
						local LayoutOrders = {}
						local LayoutOrders1 = {}
						local Connections = {}
						
						local function _(Frame: Frame, LayoutOrder)
							-- upvalues: LayoutOrders (copy)
							LayoutOrders[Frame] = LayoutOrder
							
							if Frame:IsA("GuiObject") and Frame.LayoutOrder ~= LayoutOrder then
								Frame.LayoutOrder = LayoutOrder
							end
						end
						
						local function restamp()
							-- upvalues: LayoutOrders1 (copy), List (copy), LayoutOrder (upval), LayoutOrders (copy)
							local ClampedValue: number = if next(LayoutOrders1) == nil then math.clamp(math.floor(65535 / (#List + 1)), 1, 64) else 1
							for i, Frame in List do
								if Frame:IsA("GuiObject") then
									local NewLayoutOrder = LayoutOrder + (LayoutOrders1[Frame] or i * ClampedValue)
									LayoutOrders[Frame] = NewLayoutOrder
									
									if Frame:IsA("GuiObject") and Frame.LayoutOrder ~= NewLayoutOrder then
										Frame.LayoutOrder = NewLayoutOrder
									end
								end
							end
						end
						
						local function settle(p3: number)
							-- upvalues: List (copy), LayoutOrders1 (copy), restamp (copy), LayoutOrder (upval), LayoutOrders (copy)
							local Entry = List[p3]
							
							if next(LayoutOrders1) ~= nil or not Entry:IsA("GuiObject") then
								restamp()
								
								return
							end
							local LayoutOrder1: number = LayoutOrder
							local NewLayoutOrder = LayoutOrder + 65536
							local LayoutOrder2 = nil
							
							for i = p3 - 1, 1, -1 do
								LayoutOrder2 = LayoutOrders[List[i]]
								
								if not LayoutOrder2 then
									continue
								end
								LayoutOrder1 = LayoutOrder2
								break
							end
							local LayoutOrder3 = nil
							for i1 = p3 + 1, #List do
								LayoutOrder3 = LayoutOrders[List[i1]]
								
								if not LayoutOrder3 then
									continue
								end
								NewLayoutOrder = LayoutOrder3
								break
							end
							if NewLayoutOrder - LayoutOrder1 < 2 then
								restamp()
								
								return
							end
							if NewLayoutOrder == LayoutOrder + 65536 then
								local NewLayoutOrder1 = LayoutOrder1 + math.min(64, (NewLayoutOrder - LayoutOrder1) // 2)
								LayoutOrders[Entry] = NewLayoutOrder1
								
								if Entry:IsA("GuiObject") and Entry.LayoutOrder ~= NewLayoutOrder1 then
									Entry.LayoutOrder = NewLayoutOrder1
									
									return
								end
							else
								local NewLayoutOrder2 = LayoutOrder1 + (NewLayoutOrder - LayoutOrder1) // 2
								LayoutOrders[Entry] = NewLayoutOrder2
								
								if Entry:IsA("GuiObject") and Entry.LayoutOrder ~= NewLayoutOrder2 then
									Entry.LayoutOrder = NewLayoutOrder2
								end
							end
						end
						
						local _ = function(Value)
							-- upvalues: List (copy), Connections (copy), LayoutOrders (copy), LayoutOrders1 (copy)
							local FoundIndex: number? = table.find(List, Value)
							
							if FoundIndex then
								table.remove(List, FoundIndex)
							end
							if Connections[Value] then
								Connections[Value]:Disconnect()
							end
							Connections[Value] = nil
							LayoutOrders[Value] = nil
							LayoutOrders1[Value] = nil
						end
						
						Compose.cleanup(function()
							-- upvalues: Connections (copy), List (copy), LayoutOrders (copy), LayoutOrders1 (copy)
							for connection in Connections do
								local FoundIndex: number? = table.find(List, connection)
								
								if FoundIndex then
									table.remove(List, FoundIndex)
								end
								if Connections[connection] then
									Connections[connection]:Disconnect()
								end
								Connections[connection] = nil
								LayoutOrders[connection] = nil
								LayoutOrders1[connection] = nil
							end
						end)
						Gui({
							ordersChildren = true,
							parent = p2.parent,
							host = p2.host,
							count = p2.count,
							insert = function(Frame: Frame, p4)
								-- upvalues: List (copy), LayoutOrders1 (copy), Connections (copy), LayoutOrders (copy), restamp (copy), Callback (upval), i (upval), settle (copy), p2 (copy)
								table.insert(List, p4 or #List + 1, Frame)
								
								if Frame:IsA("GuiObject") then
									local LayoutOrder = Frame.LayoutOrder
									
									if LayoutOrder ~= 0 then
										LayoutOrders1[Frame] = LayoutOrder
									end
									Connections[Frame] = Frame:GetPropertyChangedSignal("LayoutOrder"):Connect(function()
										-- upvalues: Frame (copy), LayoutOrders (upval), LayoutOrders1 (upval), restamp (upval)
										local LayoutOrder = Frame.LayoutOrder
										
										if LayoutOrder ~= LayoutOrders[Frame] then
											LayoutOrders1[Frame] = LayoutOrder
											restamp()
										end
									end)
									
									if Callback then
										Callback(Frame, i)
									end
								end
								settle(p4 or #List)
								p2.insert(Frame, p4)
							end,
							moveTo = function(Value, p4)
								-- upvalues: List (copy), LayoutOrders (copy), settle (copy), p2 (copy)
								table.remove(List, assert(table.find(List, Value)))
								table.insert(List, p4, Value)
								LayoutOrders[Value] = nil
								settle(p4)
								
								if p2.ordersChildren then
									p2.moveTo(Value, p4)
								end
							end,
							remove = function(Value)
								-- upvalues: List (copy), Connections (copy), LayoutOrders (copy), LayoutOrders1 (copy), p2 (copy)
								local FoundIndex: number? = table.find(List, Value)
								
								if FoundIndex then
									table.remove(List, FoundIndex)
								end
								if Connections[Value] then
									Connections[Value]:Disconnect()
								end
								Connections[Value] = nil
								LayoutOrders[Value] = nil
								LayoutOrders1[Value] = nil
								p2.remove(Value)
							end
						})
					end
					
					continue
				end
				if type(Gui) == "table" and Gui.IsA == nil then
					error("Facet: a child is a plain list, not a node. Spread a list of nodes as the last entry with table.unpack(rows), or build repeated rows with Compose.keyed. table.unpack before other entries keeps only its first value.", 0)
				end
				if Gui:IsA("GuiObject") then
					Gui.LayoutOrder = LayoutOrder
					
					if Callback then
						Callback(Gui, i)
					end
				end
				Guis[i] = Gui
			end
			return Guis
		end
		
		function LayoutKit.assemble(p3, p4, p5, p6, p7)
			-- upvalues: LayoutKit (copy)
			for i = 1, #p5 do
				local v6 = p5[i]
				
				if v6 then
					p3[#p3 + 1] = v6
				end
			end
			local P65 = p4 or {}
			for i1, value in P65 do
				if type(i1) == "number" then
					p3[#p3 + 1] = value
				else
					p3[i1] = value
				end
			end
			for _, value1 in LayoutKit.ordered(p6, p7) do
				p3[#p3 + 1] = value1
			end
			return p3
		end
		
		LayoutKit.plain = plain
		
		function LayoutKit.stack(p8, p9, p10, Callback, p11, p12)
			-- upvalues: LayoutKit (copy), Compose (copy), ReadFunction (copy), Host (copy), p1 (copy)
			local ExtentResult, ExtentResult2 = LayoutKit.extent(p10, p11 or "hug", p12 or "hug")
			local config = {
				BorderSizePixel = 0,
				Size = ExtentResult,
				AutomaticSize = ExtentResult2
			}
			local CellResult = if p10.padding == nil then nil else Compose.cell({ top = 0, right = 0, bottom = 0, left = 0 })
			local IsValue = Compose.isValue(Callback) or type(Callback) == "function"
			local IsReadResult = if IsValue then nil else ReadFunction(Callback) == true
			local ReadResult = IsReadResult ~= nil and (if IsReadResult then ReadFunction(p10.width) or p11 else ReadFunction(p10.height) or p12)
			local IsStretch = p10.align == "stretch"
			local IsValue1 = nil
			
			if not IsStretch then
				local AlignFunction = p10.align
				IsValue1 = Compose.isValue(AlignFunction) or type(AlignFunction) == "function"
				IsStretch = IsValue1
			end
			if IsStretch then
				local NoReadResult = ReadResult == nil
				
				if not NoReadResult then
					IsValue1 = false
					NoReadResult = ReadResult == "hug"
				end
				if NoReadResult then
					local Width = if IsReadResult then p10.width else p10.height
					IsValue1 = not (Compose.isValue(Width) or type(Width) == "function")
				end
			end
			local ListResult = LayoutKit.list(p10, Callback, IsValue1)
			local FrameResult = Host.Frame(LayoutKit.assemble(config, p9, { ListResult, LayoutKit.insets(p10.padding, CellResult) }, p8))
			
			if CellResult then
				LayoutKit.shadowRoom(FrameResult, CellResult)
			end
			if IsValue1 then
				LayoutKit.match(FrameResult, IsReadResult == true, function(p13): boolean
					-- upvalues: ReadFunction (upval), p10 (copy)
					return ReadFunction(p10.align, p13) == "stretch"
				end)
			end
			if p10.wrap ~= nil and p10.wrap ~= false then
				local AbsoluteContentSizeResult = p1.observe.AbsoluteContentSize(ListResult)
				local WrapUnit = p1.layoutUnit(FrameResult, "WrapUnit")
				local X = LayoutKit.lifter(FrameResult, "x")
				local Y = LayoutKit.lifter(FrameResult, "y")
				Compose.watch(function(Callback1)
					-- upvalues: AbsoluteContentSizeResult (copy), WrapUnit (copy), CellResult (copy), ReadFunction (upval), p10 (copy), Callback (copy), X (copy), Y (copy)
					local CallbackResult = Callback1(AbsoluteContentSizeResult)
					local CallbackResult1 = Callback1(WrapUnit)
					local CallbackResult2 = if CellResult then Callback1(CellResult) else { top = 0, right = 0, bottom = 0, left = 0 }
					local IsReadResult = ReadFunction(p10.wrap, Callback1) == true
					local ReadResult = ReadFunction(Callback, Callback1)
					X(if IsReadResult and ReadResult then CallbackResult.X / CallbackResult1 + CallbackResult2.left + CallbackResult2.right else 0)
					Y(if IsReadResult and not ReadResult then CallbackResult.Y / CallbackResult1 + CallbackResult2.top + CallbackResult2.bottom else 0)
				end)
			end
			return LayoutKit.plain(FrameResult, p9)
		end
		
		local Tags = { "facet-panel", "facet-surface", "facet-pane" }
		
		local _ = function(Object): boolean
			-- upvalues: Tags (copy)
			for _, tag in Tags do
				if Object:HasTag(tag) then
					return true
				end
			end
			return false
		end
		
		function LayoutKit.liftTarget(p8)
			-- upvalues: Tags (copy)
			local Object = p8
			local Flag = nil
			while Object:IsA("Frame") do
				Flag = false
				
				for _, tag in Tags do
					if Object:HasTag(tag) then
						Flag = true
						break
					end
				end
				if Flag or not Object:FindFirstChildWhichIsA("UIGridStyleLayout") then break end
				local v7 = nil
				local Count = 0
				
				for _, Gui in Object:GetChildren() do
					if Gui:IsA("GuiObject") and Gui.Visible then
						Count += 1
						v7 = Gui
					end
				end
				if Count ~= 1 or v7 == nil then break end
				Object = assert(v7)
			end
			return Object
		end
		
		local self = setmetatable({}, { __mode = "k" })
		local config1 = { Lift = true, TargetFloor = true }
		
		local function floorOf(Object, FacetHoldNeedsAnOwner)
			-- upvalues: config1 (copy), SizeFloorModule (upval), Compose (copy), self (copy), Runtime (copy), Host (copy), Types (copy)
			for _, UISizeConstraint in Object:GetChildren() do
				if UISizeConstraint:IsA("UISizeConstraint") and not config1[UISizeConstraint.Name] then
					return nil
				end
			end
			local OfResult = SizeFloorModule.of(Object, Compose.cell)
			
			if not self[Object] and Object:FindFirstChild("TargetFloor") == nil then
				self[Object] = true
				Compose.withOwner(FacetHoldNeedsAnOwner, function()
					-- upvalues: Runtime (upval), Host (upval), Types (upval), OfResult (copy), Object (copy)
					Runtime.mount(function()
						-- upvalues: Host (upval), Types (upval), OfResult (upval)
						return Host.UISizeConstraint("Lift")({
							MinSize = function(Callback)
								-- upvalues: Types (upval), OfResult (upval)
								return Types.Vector2.new(Callback(OfResult.x), Callback(OfResult.y))
							end
						})
					end, Object)
				end)
			end
			return OfResult
		end
		
		local _ = function(p9, p10): boolean
			-- upvalues: SizeFloorModule (upval)
			local PeekResult = SizeFloorModule.peek(p9)
			
			return PeekResult ~= nil and (if p10 then PeekResult.x:peek() else PeekResult.y:peek()) > 0
		end
		
		local function rigid(Object, p9, Entry, Callback)
			-- upvalues: TypesEnum (copy), rigid (copy)
			if Object:HasTag("facet-fixed-width") then
				return Object.Size.X.Offset
			end
			local UIPadding = Object:FindFirstChildWhichIsA("UIPadding")
			local NewOffset = if UIPadding then UIPadding.PaddingLeft.Offset + UIPadding.PaddingRight.Offset else 0
			
			if (Object:IsA("TextLabel") or Object:IsA("TextButton") or Object:IsA("TextBox")) and Object.Text ~= "" then
				local TextScaled = Object.TextScaled or Object.TextTruncate ~= TypesEnum.TextTruncate.None
				
				if TextScaled or Object.TextWrapped then
					local CallbackResult = if Callback and not TextScaled then Callback(Object) else 0
					
					return if CallbackResult > 0 then math.min(math.ceil(CallbackResult) + 1, 320) + NewOffset else NewOffset
				else
					return Object.TextBounds.X / p9 + NewOffset
				end
			else
				if Object:IsA("ScrollingFrame") and Object.ScrollingDirection ~= TypesEnum.ScrollingDirection.Y then
					return 0
				end
				local UIListLayout = Object:FindFirstChildWhichIsA("UIListLayout")
				local IsFillDirectionMatch: boolean = UIListLayout ~= nil and UIListLayout.FillDirection == TypesEnum.FillDirection.Horizontal
				local Wraps = UIListLayout ~= nil and (IsFillDirectionMatch and (UIListLayout.Wraps or Object:HasTag("facet-row-spills")))
				local Largest = 0
				local Count = 0
				
				for _, Gui in Object:GetChildren() do
					if Entry[1] <= 0 then break end
					if Gui:IsA("GuiObject") and Gui.Visible then
						Entry[1] -= 1
						local RigidResult: number = rigid(Gui, p9, Entry, Callback)
						
						if IsFillDirectionMatch and not Wraps then
							Largest += RigidResult
							Count += 1
						else
							Largest = math.max(Largest, RigidResult)
						end
					end
				end
				if UIListLayout and IsFillDirectionMatch and not Wraps and Count > 1 then
					Largest += UIListLayout.Padding.Offset * (Count - 1)
				end
				return Largest + NewOffset
			end
		end
		
		function LayoutKit.rigid(p10, p11)
			-- upvalues: rigid (copy)
			return (rigid(p10, p11, { 128 }))
		end
		
		function LayoutKit.natural(p10, p11, p12)
			-- upvalues: rigid (copy)
			return (rigid(p10, p11, { 128 }, p12))
		end
		
		function LayoutKit.intrinsic(Object, IsFillDirectionMatch, p10): number
			-- upvalues: TypesEnum (copy), SizeFloorModule (upval), LayoutKit (copy)
			local function _(Vector)
				-- upvalues: IsFillDirectionMatch (copy), p10 (copy)
				return (if IsFillDirectionMatch then Vector.X else Vector.Y) / p10
			end
			
			local UIPadding = Object:FindFirstChildWhichIsA("UIPadding")
			local NewOffset = if UIPadding == nil then 0 elseif IsFillDirectionMatch then UIPadding.PaddingLeft.Offset + UIPadding.PaddingRight.Offset else UIPadding.PaddingTop.Offset + UIPadding.PaddingBottom.Offset
			local v8 = 0
			
			if (Object:IsA("TextLabel") or Object:IsA("TextButton") or Object:IsA("TextBox")) and Object.Text ~= "" then
				local TextBounds = Object.TextBounds
				v8 = (if IsFillDirectionMatch then TextBounds.X else TextBounds.Y) / p10
			end
			local UIListLayout = Object:FindFirstChildWhichIsA("UIListLayout")
			local IsIsFillDirectionMatchMatch: boolean = UIListLayout ~= nil and UIListLayout.FillDirection == TypesEnum.FillDirection.Horizontal == IsFillDirectionMatch
			local IsNotNoneMatch: boolean = if UIListLayout and not IsIsFillDirectionMatchMatch then (if UIListLayout.FillDirection == TypesEnum.FillDirection.Vertical then UIListLayout.HorizontalFlex else UIListLayout.VerticalFlex) ~= TypesEnum.UIFlexAlignment.None or UIListLayout.ItemLineAlignment == TypesEnum.ItemLineAlignment.Stretch else false
			local Largest = 0
			local Count = 0
			
			for _, Gui in Object:GetChildren() do
				if Gui:IsA("GuiObject") and Gui.Visible then
					local Size = Gui.Size
					local v9 = (if IsFillDirectionMatch then Size.X.Scale else Size.Y.Scale) ~= 0
					local IsNotNoneMatch1: boolean = UIListLayout ~= nil and (IsNotNoneMatch or IsIsFillDirectionMatchMatch and Gui:FindFirstChildWhichIsA("UIFlexItem") ~= nil)
					local V214: boolean = v9 or IsNotNoneMatch1
					
					if not V214 then
						local PeekResult = SizeFloorModule.peek(Gui)
						V214 = PeekResult ~= nil and (if IsFillDirectionMatch then PeekResult.x:peek() else PeekResult.y:peek()) > 0
					end
					local IntrinsicResult = nil
					if V214 then
						IntrinsicResult = LayoutKit.intrinsic(Gui, IsFillDirectionMatch, p10)
					else
						local AbsoluteSize = Gui.AbsoluteSize
						IntrinsicResult = (if IsFillDirectionMatch then AbsoluteSize.X else AbsoluteSize.Y) / p10
					end
					if UIListLayout and IsIsFillDirectionMatchMatch then
						Largest += IntrinsicResult
						Count += 1
					elseif UIListLayout then
						Largest = math.max(Largest, IntrinsicResult)
					else
						Largest = math.max(Largest, IntrinsicResult + math.max(0, if IsFillDirectionMatch then Gui.Position.X.Offset else Gui.Position.Y.Offset))
					end
				end
			end
			if UIListLayout and IsIsFillDirectionMatchMatch and Count > 1 then
				Largest += UIListLayout.Padding.Offset * (Count - 1)
			end
			return (math.max(if IsFillDirectionMatch then Object.Size.X.Offset else Object.Size.Y.Offset, v8 + NewOffset, Largest + NewOffset))
		end
		
		function LayoutKit.hold(p11)
			-- upvalues: Compose (copy), CoreModule (upval), floorOf (copy)
			local FacetHoldNeedsAnOwner = assert(Compose.currentOwner(), "Facet hold needs an owner")
			local v10 = nil
			Compose.cleanup(function()
				-- upvalues: v10 (ref)
				if v10 then
					v10.x:set(0)
				end
			end)
			
			return function(p12: number, p13): boolean
				-- upvalues: CoreModule (upval), FacetHoldNeedsAnOwner (copy), v10 (ref), floorOf (upval), p11 (copy)
				if CoreModule.owner.isDisposed(FacetHoldNeedsAnOwner) then
					return false
				end
				local Vector = v10
				
				if Vector == nil then
					if not p13 or p12 <= 0 then
						return false
					end
					Vector = floorOf(p11, FacetHoldNeedsAnOwner)
					v10 = Vector
				end
				if Vector == nil then
					return false
				end
				if Vector.x:peek() ~= p12 then
					Vector.x:set(p12)
				end
				return true
			end
		end
		
		function LayoutKit.lifter(FrameResult, X)
			-- upvalues: Compose (copy), TypesEnum (copy), CoreModule (upval), LayoutKit (copy), SizeFloorModule (upval), floorOf (copy)
			local FacetLiftNeedsAnOwner = assert(Compose.currentOwner(), "Facet lift needs an owner")
			local Frame = nil
			
			local function _(Frame, Vector, p11)
				-- upvalues: X (copy), TypesEnum (upval)
				local X1 = if X == "x" then Vector.x else Vector.y
				local IsPeekResultAbove = p11 < X1:peek()
				X1:set(p11)
				
				if IsPeekResultAbove then
					local AutomaticSize = Frame.AutomaticSize
					Frame.AutomaticSize = TypesEnum.AutomaticSize.None
					Frame.AutomaticSize = AutomaticSize
				end
			end
			
			local function aimed(p11: number)
				-- upvalues: CoreModule (upval), FacetLiftNeedsAnOwner (copy), LayoutKit (upval), FrameResult (copy), TypesEnum (upval), X (copy)
				if p11 <= 0 or CoreModule.owner.isDisposed(FacetLiftNeedsAnOwner) then
					return nil
				end
				local LiftTargetResult = LayoutKit.liftTarget(FrameResult)
				local AutomaticSize = LiftTargetResult.AutomaticSize
				
				if AutomaticSize == TypesEnum.AutomaticSize.XY or AutomaticSize == (if X == "x" then TypesEnum.AutomaticSize.X else TypesEnum.AutomaticSize.Y) then
					return LiftTargetResult
				else
					return nil
				end
			end
			
			Compose.cleanup(function()
				-- upvalues: Frame (ref), SizeFloorModule (upval), X (copy), TypesEnum (upval)
				local PeekResult = if Frame then SizeFloorModule.peek(Frame) else nil
				
				if PeekResult and Frame then
					local Frame1 = Frame
					local X1 = if X == "x" then PeekResult.x else PeekResult.y
					local IsPeekResultAbove = X1:peek() > 0
					X1:set(0)
					
					if IsPeekResultAbove then
						local AutomaticSize = Frame1.AutomaticSize
						Frame1.AutomaticSize = TypesEnum.AutomaticSize.None
						Frame1.AutomaticSize = AutomaticSize
					end
				end
				Frame = nil
			end)
			
			return function(p11): boolean
				-- upvalues: aimed (copy), floorOf (upval), FacetLiftNeedsAnOwner (copy), Frame (ref), SizeFloorModule (upval), X (copy), TypesEnum (upval)
				local AimedResult = aimed(p11)
				local FloorOfResult = if AimedResult then floorOf(AimedResult, FacetLiftNeedsAnOwner) else nil
				
				if AimedResult ~= Frame or FloorOfResult == nil then
					local PeekResult = if Frame then SizeFloorModule.peek(Frame) else nil
					
					if PeekResult and Frame then
						local Frame1 = Frame
						local X1 = if X == "x" then PeekResult.x else PeekResult.y
						local IsPeekResultAbove = X1:peek() > 0
						X1:set(0)
						
						if IsPeekResultAbove then
							local AutomaticSize = Frame1.AutomaticSize
							Frame1.AutomaticSize = TypesEnum.AutomaticSize.None
							Frame1.AutomaticSize = AutomaticSize
						end
					end
					Frame = nil
				end
				if AimedResult == nil or FloorOfResult == nil then
					return false
				end
				Frame = AimedResult
				local X2 = if X == "x" then FloorOfResult.x else FloorOfResult.y
				local IsPeekResultAbove = p11 < X2:peek()
				X2:set(p11)
				
				if IsPeekResultAbove then
					local AutomaticSize = AimedResult.AutomaticSize
					AimedResult.AutomaticSize = TypesEnum.AutomaticSize.None
					AimedResult.AutomaticSize = AutomaticSize
				end
				return true
			end
		end
		
		function LayoutKit.follow(p11, p12, Callback)
			-- upvalues: Config (copy), Compose (copy), LayoutKit (copy), CoreModule (upval), Runtime (copy)
			local RunService = Config.services and Config.services.RunService
			local FacetLiftNeedsAnOwner = assert(Compose.currentOwner(), "Facet lift needs an owner")
			local LifterResult = LayoutKit.lifter(p11, p12)
			local v10 = false
			local Flag = false
			
			local function _()
				-- upvalues: Flag (ref), CoreModule (upval), FacetLiftNeedsAnOwner (copy), v10 (ref), LifterResult (copy), Callback (copy)
				Flag = false
				
				if not CoreModule.owner.isDisposed(FacetLiftNeedsAnOwner) then
					v10 = LifterResult(Callback())
				end
			end
			
			local function later()
				-- upvalues: Flag (ref), RunService (copy), CoreModule (upval), FacetLiftNeedsAnOwner (copy), v10 (ref), LifterResult (copy), Callback (copy)
				if Flag then return end
				if RunService ~= nil then
					Flag = true
					local Connection = nil
					Connection = RunService.Heartbeat:Connect(function()
						-- upvalues: Connection (ref), Flag (upval), CoreModule (upval), FacetLiftNeedsAnOwner (upval), v10 (upval), LifterResult (upval), Callback (upval)
						if Connection then
							Connection:Disconnect()
						end
						Flag = false
						
						if not CoreModule.owner.isDisposed(FacetLiftNeedsAnOwner) then
							v10 = LifterResult(Callback())
						end
					end)
					
					return
				end
				Flag = false
				
				if not CoreModule.owner.isDisposed(FacetLiftNeedsAnOwner) then
					v10 = LifterResult(Callback())
				end
			end
			
			Compose.watch(function(p13)
				-- upvalues: v10 (ref), LifterResult (copy), Callback (copy)
				v10 = LifterResult(Callback(p13))
			end)
			Runtime.connect(p11, "DescendantAdded", later)
			Runtime.connect(p11, "DescendantRemoving", later)
			
			return function()
				-- upvalues: v10 (ref)
				return v10
			end
		end
		
		function LayoutKit.frameless(): boolean
			-- upvalues: Config (copy)
			return Config.services == nil or Config.services.RunService == nil
		end
		
		function LayoutKit.nextFrame(Callback: () -> ())
			-- upvalues: Config (copy)
			local RunService = Config.services and Config.services.RunService
			
			if RunService == nil then
				Callback()
				
				return function() end
			else
				local Connection = nil
				Connection = RunService.Heartbeat:Connect(function()
					-- upvalues: Connection (ref), Callback (copy)
					if Connection then
						Connection:Disconnect()
					end
					Callback()
				end)
				
				return function()
					-- upvalues: Connection (ref)
					if Connection then
						Connection:Disconnect()
					end
				end
			end
		end
		
		function LayoutKit.match(Object, p11, Callback)
			-- upvalues: Compose (copy), Config (copy), p1 (copy), ExtentMatchModule (upval), CoreModule (upval), LayoutKit (copy), Runtime (copy)
			local FacetStackMatchingNeedsAnOwner = assert(Compose.currentOwner(), "Facet stack matching needs an owner")
			local RunService = Config.services and Config.services.RunService
			local X: string = if p11 then "x" else "y"
			local self = setmetatable({}, { __mode = "k" })
			local self1 = setmetatable({}, { __mode = "k" })
			local MatchUnit = p1.layoutUnit(Object, "MatchUnit")
			
			local function _(Frame: Frame)
				-- upvalues: MatchUnit (copy), p11 (copy)
				local PeekResult: number = MatchUnit:peek()
				
				return (if p11 then Frame.AbsoluteSize.X else Frame.AbsoluteSize.Y) / (if PeekResult > 0 then PeekResult else 1)
			end
			
			local NewExtentMatch = ExtentMatchModule.new()
			local Count = 0
			local Tbl = {}
			
			local function check(): boolean
				-- upvalues: CoreModule (upval), FacetStackMatchingNeedsAnOwner (copy), MatchUnit (copy), Object (copy), self (copy), self1 (copy), p11 (copy), LayoutKit (upval), Tbl (copy), Callback (copy), Count (ref), ExtentMatchModule (upval), NewExtentMatch (copy), RunService (copy)
				if CoreModule.owner.isDisposed(FacetStackMatchingNeedsAnOwner) then
					return true
				end
				local Frames = {}
				local t = {}
				local IntrinsicResults = {}
				local PeekResult: number = MatchUnit:peek()
				local Flag = false
				
				for _, Gui in Object:GetChildren() do
					if Gui:IsA("GuiObject") and Gui.Visible and self[Gui] and not self1[Gui] then
						table.insert(Frames, Gui)
						local PeekResult1: number = MatchUnit:peek()
						t[Gui] = (if p11 then Gui.AbsoluteSize.X else Gui.AbsoluteSize.Y) / (if PeekResult1 > 0 then PeekResult1 else 1)
						local IntrinsicResult = LayoutKit.intrinsic(Gui, p11, if PeekResult > 0 then PeekResult else 1)
						IntrinsicResults[Gui] = IntrinsicResult
						local Entry = Tbl[Gui]
						
						if Entry == nil or math.abs(Entry - IntrinsicResult) >= 0.5 then
							Flag = true
						end
					end
				end
				local Count1 = 0
				
				for i in Tbl do
					Count1 += 1
					
					if IntrinsicResults[i] == nil then
						Flag = true
					end
				end
				if Count1 ~= #Frames then
					Flag = true
				end
				table.clear(Tbl)
				
				for i1, intrinsicResult in IntrinsicResults do
					Tbl[i1] = intrinsicResult
				end
				local CallbackResult = Callback()
				
				if Flag then
					Count = 0
				end
				if CallbackResult and Count >= 30 then
					return true
				end
				Count += 1
				local t1 = {}
				local v10 = true
				
				if CallbackResult then
					t1, v286 = ExtentMatchModule.step(NewExtentMatch, Frames, t, IntrinsicResults, if RunService then nil else 0)
				end
				for i2, value in self do
					local Inverted: boolean = i2.Parent == Object and (i2.Visible and not self1[i2])
					local Entry = Inverted and t1[i2] or 0
					
					if not value(Entry) and Entry > 0 then
						self1[i2] = true
						ExtentMatchModule.forget(NewExtentMatch, i2)
						Count = 0
					elseif Entry <= 0 and (not Inverted or not CallbackResult) then
						ExtentMatchModule.forget(NewExtentMatch, i2)
					end
				end
				return v10
			end
			
			local Flag = false
			
			local function schedule()
				-- upvalues: Flag (ref), CoreModule (upval), FacetStackMatchingNeedsAnOwner (copy), RunService (copy), check (copy), schedule (copy)
				if Flag or CoreModule.owner.isDisposed(FacetStackMatchingNeedsAnOwner) then return end
				if RunService == nil then
					check()
					
					return
				else
					Flag = true
					local Connection = nil
					Connection = RunService.Heartbeat:Connect(function()
						-- upvalues: Connection (ref), Flag (upval), check (upval), schedule (upval)
						if Connection then
							Connection:Disconnect()
						end
						Flag = false
						
						if not check() then
							schedule()
						end
					end)
				end
			end
			
			local function changed()
				-- upvalues: schedule (copy)
				schedule()
			end
			
			local Tbl1 = {}
			
			local function forget(Gui)
				-- upvalues: Tbl1 (copy), self (copy), self1 (copy), ExtentMatchModule (upval), NewExtentMatch (copy), schedule (copy)
				local Entry = Tbl1[Gui]
				
				if Entry then
					for _, Connection in Entry do
						Connection:Disconnect()
					end
				end
				Tbl1[Gui] = nil
				local SelfEntry: (any) -> () = if Gui:IsA("GuiObject") then self[Gui] else nil
				
				if SelfEntry then
					SelfEntry(0)
				end
				if Gui:IsA("GuiObject") then
					self1[Gui] = nil
				end
				ExtentMatchModule.forget(NewExtentMatch, Gui)
				schedule()
			end
			
			local function watch(Gui)
				-- upvalues: Tbl1 (copy), self (copy), Compose (upval), FacetStackMatchingNeedsAnOwner (copy), LayoutKit (upval), X (copy), changed (copy), schedule (copy)
				if Tbl1[Gui] or not Gui:IsA("GuiObject") then return end
				if self[Gui] == nil then
					self[Gui] = Compose.withOwner(FacetStackMatchingNeedsAnOwner, function()
						-- upvalues: LayoutKit (upval), Gui (copy), X (upval)
						return LayoutKit.lifter(Gui, X)
					end)
				end
				Tbl1[Gui] = {
					Gui:GetPropertyChangedSignal("AbsoluteSize"):Connect(changed),
					Gui:GetPropertyChangedSignal("Visible"):Connect(changed),
					Gui.DescendantAdded:Connect(changed),
					Gui.DescendantRemoving:Connect(changed)
				}
				schedule()
			end
			
			for _, child in Object:GetChildren() do
				watch(child)
			end
			Runtime.connect(Object, "ChildAdded", watch)
			Runtime.connect(Object, "ChildRemoved", forget)
			Compose.watch(function(p12)
				-- upvalues: Callback (copy), schedule (copy)
				Callback(p12)
				schedule()
			end)
			Compose.cleanup(function()
				-- upvalues: Tbl1 (copy)
				for _, value in Tbl1 do
					for _, Connection in value do
						Connection:Disconnect()
					end
				end
				table.clear(Tbl1)
			end)
		end
		
		function LayoutKit.touchClearance(p12, p13)
			-- upvalues: Config (copy), Compose (copy), CoreModule (upval), Runtime (copy), p1 (copy), ReadFunction (copy)
			local UserInputService = Config.userInputService
			
			if UserInputService ~= nil then
				local v11 = assert(Compose.currentOwner())
				local v12 = nil
				
				local function locate(Ancestor)
					-- upvalues: CoreModule (upval), v11 (copy), v12 (ref), p13 (copy), p12 (copy), Compose (upval), Runtime (upval), locate (copy), Config (upval), p1 (upval), UserInputService (copy), ReadFunction (upval)
					if CoreModule.owner.isDisposed(v11) then return end
					if v12 then
						CoreModule.owner.dispose(v12)
						v12 = nil
					end
					p13:set(0)
					local PlayerGui = p12:FindFirstAncestorWhichIsA("PlayerGui")
					
					if PlayerGui ~= nil and p12:FindFirstAncestorWhichIsA("ScreenGui") ~= nil then
						local Child = CoreModule.owner.createChild(v11)
						v12 = Child
						Compose.withOwner(Child, function()
							-- upvalues: Runtime (upval), PlayerGui (copy), locate (upval), Ancestor (copy), Config (upval), p1 (upval), UserInputService (upval), p12 (upval), Compose (upval), ReadFunction (upval), p13 (upval)
							Runtime.connect(PlayerGui, "DescendantAdded", function(Object)
								-- upvalues: locate (upval)
								if Object.Name == "TouchGui" or Object:FindFirstAncestor("TouchGui") then
									locate()
								end
							end)
							Runtime.connect(PlayerGui, "DescendantRemoving", function(Object)
								-- upvalues: locate (upval)
								if Object.Name == "TouchGui" or Object:FindFirstAncestor("TouchGui") then
									locate(Object)
								end
							end)
							local TouchGui = PlayerGui:FindFirstChild("TouchGui")
							local TouchGui1 = if TouchGui and TouchGui ~= Ancestor and TouchGui:IsA("ScreenGui") then TouchGui else nil
							
							if TouchGui1 == nil and Config.touchReservations == nil then return end
							local List = {}
							local Descendants = if TouchGui1 then TouchGui1:GetDescendants() else {}
							for _, descendant in Descendants do
								if (not Ancestor or descendant ~= Ancestor and not descendant:IsDescendantOf(Ancestor)) and (descendant:IsA("GuiButton") or descendant:IsA("GuiObject") and (descendant.Name == "ThumbstickFrame" or descendant.Name == "DynamicThumbstickFrame" or descendant.Name == "ThumbpadFrame")) then
									table.insert(List, descendant)
								end
							end
							local UchEnabled = p1.observe.TouchEnabled(UserInputService)
							local EnabledResult = if TouchGui1 then p1.observe.Enabled(TouchGui1) else nil
							local TouchControlsEnabled = if Config.guiService then Runtime.observe(Config.guiService, "TouchControlsEnabled") else nil
							local AbsolutePositionResult = p1.observe.AbsolutePosition(p12)
							local AbsoluteSizeResult = p1.observe.AbsoluteSize(p12)
							local LayoutUnitResult = p1.layoutUnit(p12)
							Compose.watch(function(Callback)
								-- upvalues: UchEnabled (copy), EnabledResult (copy), TouchControlsEnabled (copy), AbsolutePositionResult (copy), AbsoluteSizeResult (copy), LayoutUnitResult (copy), List (copy), p1 (upval), TouchGui1 (copy), ReadFunction (upval), Config (upval), PlayerGui (upval), p13 (upval)
								local CallbackResult = Callback(UchEnabled)
								local NoTouchControlsEnabled: boolean = CallbackResult and (EnabledResult ~= nil and (Callback(EnabledResult) and (TouchControlsEnabled == nil or Callback(TouchControlsEnabled) ~= false)))
								local CallbackResult1 = Callback(AbsolutePositionResult)
								local CallbackResult2 = Callback(AbsoluteSizeResult)
								local CallbackResult3 = Callback(LayoutUnitResult)
								local Largest = 0
								
								local function reserve(Vector, Vector1, p14)
									-- upvalues: CallbackResult (copy), CallbackResult1 (copy), CallbackResult2 (copy), Largest (ref), CallbackResult3 (copy)
									if CallbackResult and p14 and Vector1.X > 0 and Vector1.Y > 0 and Vector.X < CallbackResult1.X + CallbackResult2.X and CallbackResult1.X < Vector.X + Vector1.X and Vector.Y < CallbackResult1.Y + CallbackResult2.Y and CallbackResult1.Y < Vector.Y + Vector1.Y then
										Largest = math.max(Largest, math.min(CallbackResult2.Y, CallbackResult1.Y + CallbackResult2.Y - Vector.Y) / CallbackResult3)
									end
								end
								
								for _, value in List do
									local CallbackResult4 = Callback(p1.observe.AbsolutePosition(value))
									local CallbackResult5 = Callback(p1.observe.AbsoluteSize(value))
									local Flag = true
									local Gui = value
									while Gui and Gui ~= TouchGui1 do
										if Gui:IsA("GuiObject") and not Callback(p1.observe.Visible(Gui)) then
											Flag = false
										end
										Gui = Gui.Parent
									end
									reserve(CallbackResult4, CallbackResult5, Flag and NoTouchControlsEnabled)
								end
								local ReadResult = ReadFunction(Config.touchReservations, Callback) or {}
								for _, value1 in ReadResult do
									local ReadResult1 = ReadFunction(value1, Callback)
									
									if typeof(ReadResult1) == "Rect" then
										reserve(ReadResult1.Min, ReadResult1.Max - ReadResult1.Min, true)
									elseif ReadResult1 then
										local CallbackResult6 = Callback(p1.observe.AbsolutePosition(ReadResult1))
										local CallbackResult7 = Callback(p1.observe.AbsoluteSize(ReadResult1))
										local Flag = true
										local Flag1 = false
										local Object = ReadResult1
										while Object and Object ~= PlayerGui do
											if Object:IsA("GuiObject") and not Callback(p1.observe.Visible(Object)) then
												Flag = false
											elseif Object:IsA("ScreenGui") then
												Flag1 = true
												Flag = Callback(p1.observe.Enabled(Object)) and Flag
											end
											Object = Callback(p1.observe.Parent(Object))
										end
										reserve(CallbackResult6, CallbackResult7, Flag and (Flag1 and Object == PlayerGui))
									end
								end
								p13:set(Largest)
							end)
						end)
						
						return
					end
				end
				
				Runtime.connect(p12, "AncestryChanged", function()
					-- upvalues: locate (copy)
					locate()
				end)
				locate()
				
				return
			end
		end
		
		local t = {}
		local Count = 0
		local Y = nil
		local HeartbeatConnection = nil
		
		local _ = function(p14)
			local Success, Result = pcall(p14.GetGuiInset, p14)
			
			return if Success and typeof(Result) == "Vector2" then Result.Y else 0
		end
		
		local function watchInset(GuiService, Key)
			-- upvalues: Y (ref), t (copy), Count (ref), Config (copy), HeartbeatConnection (ref), Compose (copy)
			if Y == nil then
				local Success, Result = pcall(GuiService.GetGuiInset, GuiService)
				Y = if Success and typeof(Result) == "Vector2" then Result.Y else 0
			end
			t[Key] = true
			Count += 1
			local RunService = Config.services and Config.services.RunService
			
			if RunService and HeartbeatConnection == nil then
				HeartbeatConnection = RunService.Heartbeat:Connect(function()
					-- upvalues: GuiService (copy), Y (upval), t (upval)
					local Success, Result = pcall(GuiService.GetGuiInset, GuiService)
					local Y1 = if Success and typeof(Result) == "Vector2" then Result.Y else 0
					
					if Y1 ~= Y then
						Y = Y1
						
						for i in t do
							i()
						end
					end
				end)
			end
			Compose.cleanup(function()
				-- upvalues: t (upval), Key (copy), Count (upval), HeartbeatConnection (upval), Y (upval)
				if t[Key] then
					t[Key] = nil
					Count -= 1
					local Connection = HeartbeatConnection
					
					if Count == 0 and Connection then
						HeartbeatConnection = nil
						Y = nil
						Connection:Disconnect()
					end
				end
			end)
			
			return Y or 0
		end
		
		function LayoutKit.underTopbar(p14, p15)
			-- upvalues: Config (copy), p1 (copy), watchInset (copy), Compose (copy), Runtime (copy)
			local GuiService = Config.guiService
			
			if GuiService ~= nil then
				local PbarInset = p1.observe.TopbarInset(GuiService)
				local AbsolutePositionResult = p1.observe.AbsolutePosition(p14)
				local ParentResult = p1.observe.Parent(p14)
				local Y = nil
				local Y1 = 0
				local HasScreenGui = false
				
				local function locate()
					-- upvalues: HasScreenGui (ref), p14 (copy), Y (ref), GuiService (copy), Y1 (ref), p15 (copy)
					HasScreenGui = p14:FindFirstAncestorWhichIsA("ScreenGui") ~= nil
					local Largest = nil
					
					if Y == nil or not HasScreenGui then
						Largest = 0
					else
						local v13 = 0
						local Y2 = Y
						local Success, Result = pcall(GuiService.GetGuiInset, GuiService)
						Largest = math.max(v13, Y2 - (if Success and typeof(Result) == "Vector2" then Result.Y else 0) - Y1)
					end
					if p15:peek() ~= Largest then
						p15:set(Largest)
					end
				end
				
				watchInset(GuiService, function()
					-- upvalues: Y (ref), HasScreenGui (ref), GuiService (copy), Y1 (ref), p15 (copy)
					local Largest = nil
					if Y == nil or not HasScreenGui then
						Largest = 0
					else
						local v13 = 0
						local Y2 = Y
						local Success, Result = pcall(GuiService.GetGuiInset, GuiService)
						Largest = math.max(v13, Y2 - (if Success and typeof(Result) == "Vector2" then Result.Y else 0) - Y1)
					end
					if p15:peek() ~= Largest then
						p15:set(Largest)
					end
				end)
				Compose.watch(function(Callback)
					-- upvalues: ParentResult (copy), PbarInset (copy), Y (ref), Y1 (ref), AbsolutePositionResult (copy), HasScreenGui (ref), p14 (copy), GuiService (copy), p15 (copy)
					Callback(ParentResult)
					local CallbackResult = Callback(PbarInset)
					Y = if typeof(CallbackResult) == "Rect" then CallbackResult.Max.Y else nil
					Y1 = Callback(AbsolutePositionResult).Y
					HasScreenGui = p14:FindFirstAncestorWhichIsA("ScreenGui") ~= nil
					local Largest = nil
					
					if Y == nil or not HasScreenGui then
						Largest = 0
					else
						local v13 = 0
						local Y2 = Y
						local Success, Result = pcall(GuiService.GetGuiInset, GuiService)
						Largest = math.max(v13, Y2 - (if Success and typeof(Result) == "Vector2" then Result.Y else 0) - Y1)
					end
					if p15:peek() ~= Largest then
						p15:set(Largest)
					end
				end)
				Runtime.connect(p14, "AncestryChanged", locate)
				
				return
			end
		end
		
		p1.layoutKit = LayoutKit
		
		return LayoutKit
	end
}