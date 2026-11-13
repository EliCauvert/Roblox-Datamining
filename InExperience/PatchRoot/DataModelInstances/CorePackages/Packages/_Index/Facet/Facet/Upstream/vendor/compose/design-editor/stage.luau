local _ = require("./ui")
local MathModule = require("./math")
local CoreModule = require("../core")
local DesignModule = require("../design")
local RenderPreviewModule = require("./render-preview")

return function(p1)
	-- upvalues: CoreModule (copy), DesignModule (copy), MathModule (copy), RenderPreviewModule (copy)
	local v1 = require("./theme")(p1)
	
	local function _(p2)
		-- upvalues: p1 (copy)
		local Frame = p1.new("Frame")
		p1.set(Frame, "Name", p2)
		p1.set(Frame, "BackgroundTransparency", 1)
		p1.set(Frame, "BorderSizePixel", 0)
		
		return Frame
	end
	
	local function contains(OptionalNodeResult, Vector, DesignSurface): boolean
		-- upvalues: p1 (copy)
		local OptionalNodeResult1 = OptionalNodeResult
		while OptionalNodeResult1 and p1.isA(OptionalNodeResult1, "GuiObject") do
			if not p1.get(OptionalNodeResult1, "Visible") then
				return false
			end
			if OptionalNodeResult1 == OptionalNodeResult or p1.get(OptionalNodeResult1, "ClipsDescendants") then
				local AbsolutePosition = p1.xy(OptionalNodeResult1, "AbsolutePosition")
				local AbsoluteSize = p1.xy(OptionalNodeResult1, "AbsoluteSize")
				
				if Vector.X < AbsolutePosition.X or Vector.Y < AbsolutePosition.Y or AbsolutePosition.X + AbsoluteSize.X < Vector.X or AbsolutePosition.Y + AbsoluteSize.Y < Vector.Y then
					return false
				end
			end
			if OptionalNodeResult1 == DesignSurface then break end
			OptionalNodeResult1 = p1.optionalNode(p1.get(OptionalNodeResult1, "Parent"))
		end
		return true
	end
	
	local function depthOf(p2, DesignSurface): number
		-- upvalues: p1 (copy)
		local Count = 0
		local Parent = p1.get(p2, "Parent")
		while Parent and Parent ~= DesignSurface do
			Count += 1
			Parent = p1.get(Parent, "Parent")
		end
		return Count
	end
	
	local function scaleOf(DesignOverlay): number
		-- upvalues: p1 (copy)
		local ScaledScale = 1
		local OptionalNodeResult = DesignOverlay
		while OptionalNodeResult do
			local FindFirstChildWhichIsA = p1.call(OptionalNodeResult, "FindFirstChildWhichIsA", "UIScale")
			
			if FindFirstChildWhichIsA then
				ScaledScale *= p1.number(FindFirstChildWhichIsA, "Scale")
			end
			OptionalNodeResult = p1.optionalNode(p1.get(OptionalNodeResult, "Parent"))
		end
		return ScaledScale
	end
	
	return function(p3, p4, p5)
		-- upvalues: v1 (copy), p1 (copy), CoreModule (upval), DesignModule (upval), MathModule (upval), scaleOf (copy), contains (copy), depthOf (copy), RenderPreviewModule (upval)
		local Library = p5.library or p3.library
		local Accent = p5.accent or v1.color.accent
		local X = p5.size.X
		local Y = p5.size.Y
		local Frame = p1.new("Frame")
		p1.set(Frame, "Name", "DesignStage")
		p1.set(Frame, "BackgroundTransparency", 1)
		p1.set(Frame, "BorderSizePixel", 0)
		p1.set(Frame, "Size", p1.values.udim2(1, 0, 1, 0))
		p1.set(Frame, "AnchorPoint", p1.values.vector2(0.5, 0.5))
		p1.set(Frame, "Position", p1.values.udim2(0.5, 0, 0.5, 0))
		local UIScale = p1.new("UIScale")
		p1.set(UIScale, "Parent", Frame)
		local CellResult = CoreModule.cell(1)
		local AddResult = { X = 0, Y = 0 }
		
		local function centered(p6, p7)
			-- upvalues: p1 (upval), X (copy), Y (copy)
			local Frame = p1.new("Frame")
			p1.set(Frame, "Name", p6)
			p1.set(Frame, "BackgroundTransparency", 1)
			p1.set(Frame, "BorderSizePixel", 0)
			p1.set(Frame, "AnchorPoint", p1.values.vector2(0.5, 0.5))
			p1.set(Frame, "Position", p1.values.udim2(0.5, 0, 0.5, 0))
			p1.set(Frame, "Size", p1.values.udim2(0, X + p7, 0, Y + p7))
			
			return Frame
		end
		
		for i, value in { 24, 12, 4 } do
			local Shadow = centered("Shadow", value)
			p1.set(Shadow, "Position", p1.values.udim2(0.5, 0, 0.5, value / 3))
			p1.set(Shadow, "BackgroundColor3", v1.color.shadow)
			p1.set(Shadow, "BackgroundTransparency", 0.94 - i * 0.06)
			p1.set(Shadow, "ZIndex", 0)
			v1.corner(Shadow, 4 + value / 2)
			p1.set(Shadow, "Parent", Frame)
		end
		local DesignSurface = centered("DesignSurface", 0)
		p1.set(DesignSurface, "ClipsDescendants", true)
		p1.set(DesignSurface, "BackgroundTransparency", 0)
		p1.set(DesignSurface, "BackgroundColor3", p1.rgb(18, 20, 26))
		p1.set(DesignSurface, "ZIndex", 1)
		local LabelResult = v1.label("", v1.color.secondary, v1.size.small, v1.font.bold)
		p1.set(LabelResult, "Name", "ArtboardTitle")
		p1.set(LabelResult, "AnchorPoint", p1.values.vector2(0.5, 1))
		p1.set(LabelResult, "Position", p1.values.udim2(0.5, 0, 0.5, -Y / 2 - 6))
		p1.set(LabelResult, "Size", p1.values.udim2(0, X, 0, 24))
		local UIScale1 = p1.new("UIScale")
		p1.set(UIScale1, "Parent", LabelResult)
		p1.set(LabelResult, "Parent", Frame)
		local LabelResult1 = v1.label(`{X} × {Y}`, v1.color.tertiary, v1.size.small)
		p1.set(LabelResult1, "Name", "ArtboardSize")
		p1.set(LabelResult1, "TextXAlignment", p1.values.enum("TextXAlignment", "Right"))
		v1.place(LabelResult1, LabelResult, p1.values.udim2(1, 0, 1, 0))
		local DesignOverlay = centered("DesignOverlay", 0)
		p1.set(DesignOverlay, "ZIndex", 2)
		p1.set(DesignOverlay, "Active", true)
		p1.set(DesignSurface, "Parent", Frame)
		p1.set(DesignOverlay, "Parent", Frame)
		p1.set(Frame, "Parent", p4)
		local Tbl = {}
		local UserInputService = p1.service("UserInputService")
		
		local function blocked(Id): boolean
			-- upvalues: DesignModule (upval), p3 (copy)
			local FindResult, FindResult2 = DesignModule.document.find(p3.document:peek().root, Id)
			while FindResult do
				if FindResult.locked or FindResult.hidden then
					return true
				end
				FindResult = FindResult2
				
				if not FindResult then continue end
				local _, FindResult2_1 = DesignModule.document.find(p3.document:peek().root, FindResult.id)
				FindResult2 = FindResult2_1
			end
			return false
		end
		
		local Config = nil
		
		local function toGui(p6)
			-- upvalues: v1 (upval)
			return v1.point(p6)
		end
		
		local List = {}
		
		local function gripAt(PointResult)
			-- upvalues: List (copy), p1 (upval), MathModule (upval)
			for _, value in List do
				local Frame = value.frame
				
				if p1.get(Frame, "Visible") and p1.get(Frame, "Parent") and p1.isA(p1.get(Frame, "Parent"), "GuiObject") and p1.get(p1.get(Frame, "Parent"), "Visible") and MathModule.length(MathModule.sub(PointResult, (MathModule.add(p1.xy(Frame, "AbsolutePosition"), MathModule.scale(p1.xy(Frame, "AbsoluteSize"), 0.5))))) <= 8 then
					return value
				end
			end
			return nil
		end
		
		local function resizable(PeekResult)
			-- upvalues: DesignModule (upval), p3 (copy)
			local FindResult = if PeekResult then DesignModule.document.find(p3.document:peek().root, PeekResult) else nil
			local Kind = if FindResult then p3.library.kinds[FindResult.kind] else nil
			
			if Kind == nil then
				return nil
			end
			local Fields = Kind.fields
			
			if Fields.width == nil or Fields.height == nil then
				local Size = Fields.Size
				
				return if Size == nil or Size.type ~= "datatype" or Size.datatype ~= "UDim2" then nil else "size"
			else
				return "fields"
			end
		end
		
		local Config1 = nil
		local Config2 = nil
		local Frame1 = p1.new("Frame")
		p1.set(Frame1, "Name", "DesignMarquee")
		p1.set(Frame1, "BackgroundTransparency", 1)
		p1.set(Frame1, "BorderSizePixel", 0)
		p1.set(Frame1, "BackgroundColor3", Accent)
		p1.set(Frame1, "BackgroundTransparency", 0.85)
		p1.set(Frame1, "Visible", false)
		p1.set(Frame1, "ZIndex", 2005)
		v1.stroke(Frame1, Accent, 1)
		p1.set(Frame1, "Parent", DesignOverlay)
		
		local function updateMarquee(AddResult)
			-- upvalues: Config2 (ref), p1 (upval), DesignOverlay (copy), scaleOf (upval), Frame1 (copy)
			local Config = Config2
			
			if Config ~= nil then
				Config.to = AddResult
				local Smallest = math.min(Config.from.X, AddResult.X)
				local Smallest1 = math.min(Config.from.Y, AddResult.Y)
				local Largest = math.max(Config.from.X, AddResult.X)
				local Largest1 = math.max(Config.from.Y, AddResult.Y)
				local AbsolutePosition = p1.xy(DesignOverlay, "AbsolutePosition")
				local ScaleOfResult = scaleOf(DesignOverlay)
				p1.set(Frame1, "Position", p1.values.udim2(0, (Smallest - AbsolutePosition.X) / ScaleOfResult, 0, (Smallest1 - AbsolutePosition.Y) / ScaleOfResult))
				p1.set(Frame1, "Size", p1.values.udim2(0, (Largest - Smallest) / ScaleOfResult, 0, (Largest1 - Smallest1) / ScaleOfResult))
				p1.set(Frame1, "Visible", true)
				
				return
			end
		end
		
		local function finishMarquee()
			-- upvalues: Config2 (ref), p1 (upval), Frame1 (copy), MathModule (upval), Tbl (copy), p3 (copy), blocked (copy), DesignSurface (copy)
			local Config = Config2
			Config2 = nil
			p1.set(Frame1, "Visible", false)
			
			if Config == nil then return end
			local Copy = table.clone(Config.base)
			
			if MathModule.length(MathModule.sub(Config.to, Config.from)) >= 4 then
				local Smallest = math.min(Config.from.X, Config.to.X)
				local Smallest1 = math.min(Config.from.Y, Config.to.Y)
				local Largest = math.max(Config.from.X, Config.to.X)
				local Largest1 = math.max(Config.from.Y, Config.to.Y)
				
				for i, value in Tbl do
					if i ~= p3.document:peek().root.id and not blocked(i) and p1.get(value, "Parent") then
						local AbsolutePosition = p1.xy(value, "AbsolutePosition")
						local AbsoluteSize = p1.xy(value, "AbsoluteSize")
						local Largest2 = math.max(AbsolutePosition.X, Smallest)
						local Largest3 = math.max(AbsolutePosition.Y, Smallest1)
						local Smallest2 = math.min(AbsolutePosition.X + AbsoluteSize.X, Largest)
						local Smallest21 = math.min(AbsolutePosition.Y + AbsoluteSize.Y, Largest1)
						local OptionalNodeResult = value
						local IsVisible = true
						while OptionalNodeResult and p1.isA(OptionalNodeResult, "GuiObject") do
							IsVisible = IsVisible and p1.get(OptionalNodeResult, "Visible") ~= false
							
							if p1.get(OptionalNodeResult, "ClipsDescendants") then
								local AbsolutePosition1 = p1.xy(OptionalNodeResult, "AbsolutePosition")
								local AbsoluteSize1 = p1.xy(OptionalNodeResult, "AbsoluteSize")
								Largest2 = math.max(Largest2, AbsolutePosition1.X)
								Largest3 = math.max(Largest3, AbsolutePosition1.Y)
								Smallest2 = math.min(Smallest2, AbsolutePosition1.X + AbsoluteSize1.X)
								Smallest21 = math.min(Smallest21, AbsolutePosition1.Y + AbsoluteSize1.Y)
							end
							if OptionalNodeResult == DesignSurface then break end
							OptionalNodeResult = p1.optionalNode(p1.get(OptionalNodeResult, "Parent"))
						end
						if IsVisible and Largest2 <= Smallest2 and Largest3 <= Smallest21 then
							table.insert(Copy, i)
						end
					end
				end
			end
			p3.selectMany(Copy)
		end
		
		local Frame2 = p1.new("Frame")
		p1.set(Frame2, "Name", "DesignDropMarker")
		p1.set(Frame2, "BackgroundTransparency", 1)
		p1.set(Frame2, "BorderSizePixel", 0)
		p1.set(Frame2, "BackgroundTransparency", 0)
		p1.set(Frame2, "BackgroundColor3", Accent)
		p1.set(Frame2, "ZIndex", 2004)
		p1.set(Frame2, "Visible", false)
		p1.set(Frame2, "Parent", DesignOverlay)
		
		local function _(p6): boolean
			-- upvalues: p1 (upval)
			local FindFirstChildWhichIsA = p1.call(p6, "FindFirstChildWhichIsA", "UIListLayout")
			
			return FindFirstChildWhichIsA ~= nil and p1.get(FindFirstChildWhichIsA, "FillDirection") == p1.values.enum("FillDirection", "Horizontal")
		end
		
		local function dropAt(Vector, Id)
			-- upvalues: p3 (copy), DesignModule (upval), Tbl (copy), blocked (copy), p1 (upval), contains (upval), DesignSurface (copy), depthOf (upval), DesignOverlay (copy)
			local PeekResult = p3.document:peek()
			local FindResult = DesignModule.document.find(PeekResult.root, Id)
			
			if FindResult == nil then
				return nil
			end
			local v2 = nil
			local v3 = -1
			
			for i, value in Tbl do
				local FindResult1 = DesignModule.document.find(PeekResult.root, i)
				local Kind = if FindResult1 then p3.library.kinds[FindResult1.kind] else nil
				
				if FindResult1 and Kind and Kind.children == "list" and Kind.leaf ~= true and not blocked(i) and not table.find(p3.selection:peek(), i) and DesignModule.document.find(FindResult, i) == nil and p1.get(value, "Parent") and contains(value, Vector, DesignSurface) then
					local DepthOfResult = depthOf(value, DesignSurface)
					
					if v3 < DepthOfResult then
						v2 = FindResult1
						v3 = DepthOfResult
					end
				end
			end
			local v4 = v2
			
			if v4 == nil then
				return nil
			end
			local Entry = Tbl[v4.id]
			local FindFirstChildWhichIsA = p1.call(Entry, "FindFirstChildWhichIsA", "UIListLayout")
			local IsFillDirectionMatch: boolean = FindFirstChildWhichIsA ~= nil and p1.get(FindFirstChildWhichIsA, "FillDirection") == p1.values.enum("FillDirection", "Horizontal")
			local AbsolutePosition = p1.xy(DesignOverlay, "AbsolutePosition")
			local AbsolutePosition1 = p1.xy(Entry, "AbsolutePosition")
			local AbsoluteSize = p1.xy(Entry, "AbsoluteSize")
			local Before = 1
			local Count = 0
			local X = if IsFillDirectionMatch then AbsolutePosition1.X else AbsolutePosition1.Y
			for _, child in v4.children do
				if child.id ~= Id and not table.find(p3.selection:peek(), child.id) then
					Count += 1
					local Entry1 = Tbl[child.id]
					
					if Entry1 then
						local AbsolutePosition2 = p1.xy(Entry1, "AbsolutePosition")
						local AbsoluteSize1 = p1.xy(Entry1, "AbsoluteSize")
						
						if (if IsFillDirectionMatch then AbsolutePosition2.X + AbsoluteSize1.X / 2 else AbsolutePosition2.Y + AbsoluteSize1.Y / 2) < (if IsFillDirectionMatch then Vector.X else Vector.Y) then
							Before = Count + 1
							X = if IsFillDirectionMatch then AbsolutePosition2.X + AbsoluteSize1.X else AbsolutePosition2.Y + AbsoluteSize1.Y
						end
					end
				end
			end
			return {
				destination = v4.id,
				before = Before,
				edge = if IsFillDirectionMatch then {
					X = X - AbsolutePosition.X,
					Y = AbsolutePosition1.Y - AbsolutePosition.Y
				} else {
					X = AbsolutePosition1.X - AbsolutePosition.X,
					Y = X - AbsolutePosition.Y
				},
				along = if IsFillDirectionMatch then { X = 2, Y = AbsoluteSize.Y } else { Y = 2, X = AbsoluteSize.X }
			}
		end
		
		local function carry(Vector)
			-- upvalues: Config1 (ref), MathModule (upval), dropAt (copy), p1 (upval), Frame2 (copy)
			local Config = Config1
			
			if Config == nil then return end
			if not Config.active and MathModule.length(MathModule.sub(Vector, Config.start)) < 4 then return end
			Config.active = true
			local DropAtResult = dropAt(Vector, Config.id)
			Config.drop = DropAtResult
			p1.set(Frame2, "Visible", DropAtResult ~= nil)
			
			if DropAtResult then
				p1.set(Frame2, "Position", p1.values.udim2(0, DropAtResult.edge.X, 0, DropAtResult.edge.Y))
				p1.set(Frame2, "Size", p1.values.udim2(0, DropAtResult.along.X, 0, DropAtResult.along.Y))
			end
		end
		
		local function finishCarry()
			-- upvalues: Config1 (ref), p1 (upval), Frame2 (copy), p3 (copy)
			local Config = Config1
			Config1 = nil
			p1.set(Frame2, "Visible", false)
			local Drop = if Config and Config.active then Config.drop else nil
			
			if Config and Drop then
				p3.move(Config.id, Drop.destination, Drop.before)
				
				return
			end
			if Config and not Config.active then
				p3.select(Config.id)
			end
		end
		
		local function startResize(Corner, From)
			-- upvalues: p3 (copy), blocked (copy), Tbl (copy), DesignModule (upval), resizable (copy), Config (ref), MathModule (upval), p1 (upval), scaleOf (upval)
			local PeekResult = p3.selected:peek()
			
			if #p3.selection:peek() ~= 1 or blocked(PeekResult) then return end
			local Entry = Tbl[PeekResult]
			local FindResult = DesignModule.document.find(p3.document:peek().root, PeekResult)
			
			if Entry == nil or FindResult == nil then return end
			if resizable(PeekResult) ~= nil then
				Config = {
					result = nil,
					corner = Corner,
					from = From,
					size = MathModule.scale(p1.xy(Entry, "AbsoluteSize"), 1 / scaleOf(Entry)),
					instance = Entry
				}
				
				return
			end
		end
		
		local function updateResize(p6)
			-- upvalues: Config (ref), MathModule (upval), scaleOf (upval), p1 (upval), UserInputService (copy)
			local Config1 = Config
			
			if Config1 == nil then return end
			local ScaleResult = MathModule.scale(MathModule.sub(p6, Config1.from), 1 / scaleOf(Config1.instance))
			local Vector = {
				X = ScaleResult.X * (Config1.corner.X * 2 - 1),
				Y = ScaleResult.Y * (Config1.corner.Y * 2 - 1)
			}
			local Largest = math.max(1, (math.round(Config1.size.X + Vector.X)))
			local Largest1 = math.max(1, (math.round(Config1.size.Y + Vector.Y)))
			
			if p1.call(UserInputService, "IsKeyDown", p1.values.enum("KeyCode", "LeftShift")) == true and Config1.size.Y > 0 then
				local XRatio = Config1.size.X / Config1.size.Y
				
				if math.abs(Vector.Y) < math.abs(Vector.X) then
					Largest1 = math.max(1, (math.round(Largest / XRatio)))
				else
					Largest = math.max(1, (math.round(Largest1 * XRatio)))
				end
			end
			Config1.result = { X = Largest, Y = Largest1 }
			p1.set(Config1.instance, "AutomaticSize", p1.values.enum("AutomaticSize", "None"))
			p1.set(Config1.instance, "Size", p1.values.udim2(0, Largest, 0, Largest1))
		end
		
		local function finishResize()
			-- upvalues: Config (ref), p3 (copy), DesignModule (upval), resizable (copy)
			local Config1 = Config
			Config = nil
			local Result = if Config1 then Config1.result else nil
			
			if Result == nil then return end
			local PeekResult = p3.selected:peek()
			local FindResult = DesignModule.document.find(p3.document:peek().root, PeekResult)
			
			if FindResult == nil then return end
			local Fields = p3.library.kinds[FindResult.kind].fields
			
			if resizable(PeekResult) == "size" then
				p3.change("Size", { literal = { 0, Result.X, 0, Result.Y } })
				
				return
			end
			local config = {
				width = { literal = Result.X },
				height = { literal = Result.Y }
			}
			
			if Fields.fillWidth then
				config.fillWidth = { literal = false }
			end
			if Fields.fillHeight then
				config.fillHeight = { literal = false }
			end
			p3.changeMany(config)
		end
		
		local Runtime = p1.runtime
		local Callback = nil
		
		local function pick(From)
			-- upvalues: Tbl (copy), blocked (copy), p1 (upval), contains (upval), DesignSurface (copy), depthOf (upval)
			local v5 = nil
			local v6 = -1
			
			for i, value in Tbl do
				if not blocked(i) and p1.get(value, "Parent") and contains(value, From, DesignSurface) then
					local DepthOfResult = depthOf(value, DesignSurface)
					
					if v6 < DepthOfResult then
						v5 = i
						v6 = DepthOfResult
					end
				end
			end
			return v5
		end
		
		local function outline(DesignSelectedName, p6, p7, Callback)
			-- upvalues: p1 (upval), v1 (upval), Accent (copy), List (copy), DesignOverlay (copy), DesignSurface (copy), scaleOf (upval), MathModule (upval), UIScale (copy), CoreModule (upval), Tbl (copy), DesignModule (upval), p3 (copy), Library (copy), resizable (copy), blocked (copy)
			local Frame = p1.new("Frame")
			p1.set(Frame, "Name", DesignSelectedName)
			p1.set(Frame, "BackgroundTransparency", 1)
			p1.set(Frame, "BorderSizePixel", 0)
			p1.set(Frame, "Visible", false)
			p1.set(Frame, "Interactable", false)
			p1.set(Frame, "ZIndex", 2001)
			local StrokeResult = v1.stroke(Frame, Accent, p6)
			local v7 = nil
			local Frames = {}
			local UIScale1 = if p7 then p1.new("UIScale") else nil
			
			if p7 then
				for _, AddResult in {
					{ X = 0, Y = 0 },
					{ X = 1, Y = 0 },
					{ X = 0, Y = 1 },
					{ X = 1, Y = 1 }
				} do
					local Frame1 = p1.new("Frame")
					p1.set(Frame1, "Name", "Handle")
					p1.set(Frame1, "BackgroundTransparency", 1)
					p1.set(Frame1, "BorderSizePixel", 0)
					p1.set(Frame1, "AnchorPoint", p1.values.vector2(0.5, 0.5))
					p1.set(Frame1, "Position", p1.values.udim2(AddResult.X, 0, AddResult.Y, 0))
					p1.set(Frame1, "Size", p1.values.udim2(0, 7, 0, 7))
					p1.set(Frame1, "BackgroundTransparency", 0)
					p1.set(Frame1, "BackgroundColor3", v1.color.white)
					p1.set(Frame1, "ZIndex", 2002)
					v1.stroke(Frame1, Accent, 1)
					p1.set(Frame1, "Parent", Frame)
					table.insert(Frames, Frame1)
					table.insert(List, { frame = Frame1, corner = AddResult })
				end
				local LabelResult = v1.label("", v1.color.white, v1.size.small, v1.font.bold)
				p1.set(LabelResult, "Name", "SizeBadge")
				p1.set(LabelResult, "TextTruncate", p1.values.enum("TextTruncate", "None"))
				p1.set(LabelResult, "AutomaticSize", p1.values.enum("AutomaticSize", "X"))
				p1.set(LabelResult, "AnchorPoint", p1.values.vector2(0.5, 0))
				p1.set(LabelResult, "Position", p1.values.udim2(0.5, 0, 1, 8))
				p1.set(LabelResult, "Size", p1.values.udim2(0, 0, 0, 24))
				p1.set(LabelResult, "BackgroundTransparency", 0)
				p1.set(LabelResult, "BackgroundColor3", Accent)
				p1.set(LabelResult, "TextXAlignment", p1.values.enum("TextXAlignment", "Center"))
				p1.set(LabelResult, "ZIndex", 2003)
				v1.corner(LabelResult, 4)
				v1.pad(LabelResult, 6)
				p1.set(UIScale1, "Parent", LabelResult)
				p1.set(LabelResult, "Parent", Frame)
				v7 = LabelResult
			end
			p1.set(Frame, "Parent", DesignOverlay)
			local List1 = {}
			
			local function release()
				-- upvalues: List1 (copy)
				for _, Connection in List1 do
					Connection:Disconnect()
				end
				table.clear(List1)
			end
			
			local List2 = {}
			
			local function visible(OptionalNodeResult): boolean
				-- upvalues: DesignSurface (upval), p1 (upval)
				local OptionalNodeResult1 = OptionalNodeResult
				while OptionalNodeResult1 and OptionalNodeResult1 ~= DesignSurface do
					if p1.isA(OptionalNodeResult1, "GuiObject") and p1.get(OptionalNodeResult1, "Visible") == false then
						return false
					end
					OptionalNodeResult1 = p1.optionalNode(p1.get(OptionalNodeResult1, "Parent"))
				end
				return OptionalNodeResult1 == DesignSurface
			end
			
			local function place()
				-- upvalues: List2 (copy), visible (copy), p1 (upval), Frame (copy), scaleOf (upval), DesignOverlay (upval), MathModule (upval), StrokeResult (copy), p6 (copy), Frames (copy), UIScale1 (copy), v7 (ref), UIScale (upval)
				local List = {}
				
				for _, value in List2 do
					if visible(value) then
						table.insert(List, value)
					end
				end
				local Entry = List[1]
				
				if Entry == nil then
					p1.set(Frame, "Visible", false)
					
					return
				end
				local ScaleOfResult: number = scaleOf(DesignOverlay)
				local ScaleResult = MathModule.scale(MathModule.sub(p1.xy(Entry, "AbsolutePosition"), p1.xy(DesignOverlay, "AbsolutePosition")), 1 / ScaleOfResult)
				local ScaleResult1 = MathModule.scale(p1.xy(Entry, "AbsoluteSize"), 1 / ScaleOfResult)
				local X = ScaleResult.X
				local Y = ScaleResult.Y
				local NewX = ScaleResult.X + ScaleResult1.X
				local NewY = ScaleResult.Y + ScaleResult1.Y
				
				for _, value1 in List do
					local ScaleResult2 = MathModule.scale(MathModule.sub(p1.xy(value1, "AbsolutePosition"), p1.xy(DesignOverlay, "AbsolutePosition")), 1 / ScaleOfResult)
					local ScaleResult21 = MathModule.scale(p1.xy(value1, "AbsoluteSize"), 1 / ScaleOfResult)
					X = math.min(X, ScaleResult2.X)
					Y = math.min(Y, ScaleResult2.Y)
					NewX = math.max(NewX, ScaleResult2.X + ScaleResult21.X)
					NewY = math.max(NewY, ScaleResult2.Y + ScaleResult21.Y)
				end
				local Vector = { X = NewX - X, Y = NewY - Y }
				p1.set(Frame, "Position", p1.values.udim2(0, X, 0, Y))
				p1.set(Frame, "Size", p1.values.udim2(0, Vector.X, 0, Vector.Y))
				p1.set(Frame, "Visible", true)
				p1.set(StrokeResult, "Thickness", p6 / ScaleOfResult)
				
				for _, frame in Frames do
					p1.set(frame, "Size", p1.values.udim2(0, 7 / ScaleOfResult, 0, 7 / ScaleOfResult))
				end
				if UIScale1 then
					p1.set(UIScale1, "Scale", 1 / ScaleOfResult)
				end
				if v7 then
					p1.set(v7, "Position", p1.values.udim2(0.5, 0, 1, 8 / ScaleOfResult))
					p1.set(v7, "Text", `{math.round(Vector.X / p1.number(UIScale, "Scale") * ScaleOfResult)} × {math.round(Vector.Y / p1.number(UIScale, "Scale") * ScaleOfResult)}`)
				end
			end
			
			CoreModule.watch(function(p8)
				-- upvalues: List1 (copy), Callback (copy), List2 (copy), Tbl (upval), DesignModule (upval), p3 (upval), Library (upval), p1 (upval), resizable (upval), blocked (upval), Frames (copy), place (copy), DesignSurface (upval), DesignOverlay (upval)
				for _, Connection in List1 do
					Connection:Disconnect()
				end
				table.clear(List1)
				local CallbackResult = Callback(p8)
				table.clear(List2)
				
				for _, value in CallbackResult do
					local Entry = Tbl[value]
					local FindResult = DesignModule.document.find(p3.document:peek().root, value)
					local Kind = if FindResult then Library.kinds[FindResult.kind] else nil
					local SelectionTarget = if Kind then Kind.selectionTarget else nil
					local OptionalNodeResult = if Entry then p1.optionalNode(if SelectionTarget then SelectionTarget(Entry, p8) else Entry) else nil
					
					if OptionalNodeResult and p1.isA(OptionalNodeResult, "GuiObject") then
						table.insert(List2, OptionalNodeResult)
					end
				end
				local CallbackResultEntry = CallbackResult[1]
				local Inverted: boolean = #CallbackResult == 1 and (resizable(CallbackResultEntry) ~= nil and not blocked(CallbackResultEntry))
				for _, frame in Frames do
					p1.set(frame, "Visible", Inverted)
				end
				for _, value1 in List2 do
					table.insert(List1, p1.changed(value1, "AbsolutePosition", place))
					table.insert(List1, p1.changed(value1, "AbsoluteSize", place))
					table.insert(List1, p1.connect(value1, "AncestryChanged", place))
					local OptionalNodeResult = value1
					while OptionalNodeResult and OptionalNodeResult ~= DesignSurface do
						if p1.isA(OptionalNodeResult, "GuiObject") then
							table.insert(List1, p1.changed(OptionalNodeResult, "Visible", place))
						end
						OptionalNodeResult = p1.optionalNode(p1.get(OptionalNodeResult, "Parent"))
					end
					table.insert(List1, p1.changed(DesignOverlay, "AbsolutePosition", place))
					table.insert(List1, p1.changed(DesignOverlay, "AbsoluteSize", place))
				end
				place()
			end)
			CoreModule.cleanup(release)
			
			return Frame
		end
		
		local Flag = false
		local t = {}
		local RootOwner = CoreModule.createRootOwner(function()
			-- upvalues: p5 (copy), Runtime (copy), p1 (upval), DesignSurface (copy), CoreModule (upval), p3 (copy), LabelResult (copy), Callback (ref), Tbl (copy), Library (copy), DesignModule (upval), RenderPreviewModule (upval), t (ref), Flag (ref), outline (copy)
			local BackdropFunction = p5.backdrop
			
			if BackdropFunction then
				Runtime.mount(function()
					-- upvalues: p1 (upval), BackdropFunction (copy)
					return p1.node(BackdropFunction())
				end, DesignSurface)
			end
			CoreModule.watch(function(Callback1)
				-- upvalues: p3 (upval), p1 (upval), LabelResult (upval), Callback (upval), Tbl (upval), Runtime (upval), p5 (upval), Library (upval), DesignModule (upval), RenderPreviewModule (upval), t (upval), Flag (upval), DesignSurface (upval)
				local CallbackResult = Callback1(p3.document)
				p1.set(LabelResult, "Text", CallbackResult.name)
				
				if Callback then
					Callback()
				end
				table.clear(Tbl)
				Callback = Runtime.mountFragment(function()
					-- upvalues: CallbackResult (copy), p5 (upval), Library (upval), Callback1 (copy), DesignModule (upval), RenderPreviewModule (upval), t (upval), p1 (upval), Runtime (upval), Tbl (upval), Flag (upval), p3 (upval)
					local Success, Result = pcall(function()
						-- upvalues: CallbackResult (upval), p5 (upval), Library (upval), Callback1 (upval), DesignModule (upval), RenderPreviewModule (upval), t (upval), p1 (upval), Runtime (upval), Tbl (upval)
						local CallbackResult1 = CallbackResult
						local Bindings = p5.bindings
						
						if p5.renderPreview then
							CallbackResult1, Bindings = p5.renderPreview(CallbackResult, Library, Callback1)
						end
						return DesignModule.render(CallbackResult1, Library, {
							use = Callback1,
							exclude = function(p9): boolean
								return p9.hidden == true
							end,
							inputs = p5.inputs,
							bindings = RenderPreviewModule.bindings(CallbackResult1, Bindings, Callback1),
							outputs = p5.outputs,
							slots = p5.slots,
							token = p5.token,
							resolveToken = p5.resolveToken,
							players = function(p9)
								-- upvalues: t (upval)
								t = p9
							end,
							decorate = function(NodeResult, p9)
								-- upvalues: p1 (upval), Runtime (upval), Tbl (upval)
								local NodeResult1 = p1.node(p9)
								
								if p1.isA(NodeResult1, "GuiObject") then
									Runtime.decorate(NodeResult1, { Attributes = { ComposeDesignNode = NodeResult.id } })
									Tbl[NodeResult.id] = NodeResult1
								end
							end
						})
					end)
					
					if Success then
						local ProvideFunction = Library.provide
						
						return {
							p1.node(if ProvideFunction then ProvideFunction(Result) else Result)
						}
					end
					if not Flag then
						error(Result, 0)
					end
					table.clear(Tbl)
					p3.problem:set(`This design does not render: {Result}`)
					
					return {}
				end, DesignSurface)
			end)
			outline("DesignHover", 1, false, function(Callback)
				-- upvalues: p3 (upval)
				local CallbackResult = Callback(p3.hovered)
				
				return if CallbackResult and not table.find(Callback(p3.selection), CallbackResult) then { CallbackResult } else {}
			end)
			outline("DesignSelected", 1.5, true, function(Callback)
				-- upvalues: p3 (upval)
				Callback(p3.document)
				
				return Callback(p3.selection)
			end)
			local List = {}
			CoreModule.watch(function(Callback)
				-- upvalues: p3 (upval), List (copy), p1 (upval), outline (upval)
				Callback(p3.document)
				local CallbackResult = Callback(p3.selection)
				
				for _, value in List do
					p1.destroy(value)
				end
				table.clear(List)
				
				if #CallbackResult > 1 then
					for _, value1 in CallbackResult do
						table.insert(List, (outline(`DesignSelected_{value1}`, 1, false, function(Callback: (any) -> ())
							-- upvalues: p3 (upval), value1 (copy)
							Callback(p3.document)
							
							return { value1 }
						end)))
					end
				end
			end)
		end, Runtime.reactor)
		Flag = true
		local OwnResult = CoreModule.owner.own(p1.owner, RootOwner.dispose)
		
		local function apply()
			-- upvalues: CellResult (copy), p1 (upval), UIScale (copy), UIScale1 (copy), LabelResult (copy), X (copy), Y (copy), Frame (copy), AddResult (ref)
			local PeekResult: number = CellResult:peek()
			p1.set(UIScale, "Scale", PeekResult)
			p1.set(UIScale1, "Scale", 1 / PeekResult)
			p1.set(LabelResult, "Size", p1.values.udim2(0, X * PeekResult, 0, 24))
			p1.set(LabelResult, "Position", p1.values.udim2(0.5, 0, 0.5, -Y / 2 - 6 / PeekResult))
			p1.set(Frame, "Position", p1.values.udim2(0.5, AddResult.X, 0.5, AddResult.Y))
		end
		
		local function zoomTo(Value: number, p9)
			-- upvalues: CellResult (copy), p1 (upval), Frame (copy), MathModule (upval), AddResult (ref), apply (copy)
			local PeekResult = CellResult:peek()
			local ClampedValue = math.clamp(Value, 0.02, 8)
			
			if p9 and p1.get(Frame, "Parent") and p1.isA(p1.get(Frame, "Parent"), "GuiObject") then
				local Parent = p1.get(Frame, "Parent")
				AddResult = MathModule.add(AddResult, MathModule.scale(MathModule.sub(p9, (MathModule.add(MathModule.add(p1.xy(Parent, "AbsolutePosition"), MathModule.scale(p1.xy(Parent, "AbsoluteSize"), 0.5)), AddResult))), 1 - ClampedValue / PeekResult))
			end
			CellResult:set(ClampedValue)
			apply()
		end
		
		local function fit()
			-- upvalues: AddResult (ref), p1 (upval), Frame (copy), MathModule (upval), p5 (copy), CellResult (copy), X (copy), Y (copy), apply (copy)
			AddResult = { X = 0, Y = 0 }
			local Parent = p1.get(Frame, "Parent")
			
			if Parent and p1.isA(Parent, "GuiObject") and p1.xy(Parent, "AbsoluteSize").X > 0 then
				local SubResult = MathModule.sub(p1.xy(Parent, "AbsoluteSize"), if p5.compact then { X = 32, Y = 56 } else { X = 96, Y = 120 })
				CellResult:set((math.clamp(math.min(SubResult.X / X, SubResult.Y / Y), 0.02, 1)))
			else
				CellResult:set(1)
			end
			apply()
		end
		
		local PointResult = nil
		
		local function beginMarquee(PointResult, p9)
			-- upvalues: pick (copy), p3 (copy), p1 (upval), Config2 (ref)
			local PickResult = pick(PointResult)
			
			if PickResult == nil or PickResult == p3.document:peek().root.id then
				Config2 = {
					from = PointResult,
					to = PointResult,
					base = if p1.modified(p9, { "Shift", "Ctrl", "Meta" }) then table.clone(p3.selection:peek()) else {}
				}
			end
		end
		
		local List1 = {}
		
		if p1.isA(p4, "GuiObject") then
			table.insert(List1, p1.connect(p4, "InputChanged", function(p9)
				-- upvalues: p1 (upval), zoomTo (copy), CellResult (copy), toGui (copy)
				if p1.get(p9, "UserInputType") == p1.values.enum("UserInputType", "MouseWheel") then
					zoomTo(CellResult:peek() * (if p1.xyz(p9, "Position").Z > 0 then 1.15 else 0.8695652173913044), toGui(p9))
				end
			end))
			table.insert(List1, p1.connect(p4, "InputBegan", function(p9)
				-- upvalues: p5 (copy), p1 (upval), UserInputService (copy), PointResult (ref), v1 (upval), beginMarquee (copy)
				if p5.readOnly then return end
				local IsIsKeyDown: boolean = p1.get(p9, "UserInputType") == p1.values.enum("UserInputType", "MouseButton1") and p1.call(UserInputService, "IsKeyDown", p1.values.enum("KeyCode", "Space")) == true
				
				if p1.get(p9, "UserInputType") == p1.values.enum("UserInputType", "MouseButton3") or IsIsKeyDown then
					PointResult = v1.point(p9)
					
					return
				end
				if p1.get(p9, "UserInputType") == p1.values.enum("UserInputType", "MouseButton1") then
					beginMarquee(v1.point(p9), p9)
				end
			end))
		end
		local function onPointerChanged(p9)
			-- upvalues: Config2 (ref), p1 (upval), updateMarquee (copy), toGui (copy), Config (ref), updateResize (copy), Config1 (ref), carry (copy), PointResult (ref), v1 (upval), AddResult (ref), MathModule (upval), apply (copy)
			if Config2 and p1.get(p9, "UserInputType") == p1.values.enum("UserInputType", "MouseMovement") then
				updateMarquee(toGui(p9))
				
				return
			end
			if Config and p1.get(p9, "UserInputType") == p1.values.enum("UserInputType", "MouseMovement") then
				updateResize(toGui(p9))
				
				return
			end
			if Config1 and p1.get(p9, "UserInputType") == p1.values.enum("UserInputType", "MouseMovement") then
				carry(toGui(p9))
				
				return
			end
			local PointResult1 = PointResult
			
			if PointResult1 and p1.get(p9, "UserInputType") == p1.values.enum("UserInputType", "MouseMovement") then
				local PointResult2 = v1.point(p9)
				AddResult = MathModule.add(AddResult, MathModule.sub(PointResult2, PointResult1))
				PointResult = PointResult2
				apply()
			end
		end
		
		local function onPointerEnded(p9)
			-- upvalues: p1 (upval), Config2 (ref), finishMarquee (copy), PointResult (ref), Config (ref), finishResize (copy), Config1 (ref), finishCarry (copy)
			if p1.get(p9, "UserInputType") == p1.values.enum("UserInputType", "MouseButton1") and Config2 then
				finishMarquee()
			end
			if p1.get(p9, "UserInputType") == p1.values.enum("UserInputType", "MouseButton3") or p1.get(p9, "UserInputType") == p1.values.enum("UserInputType", "MouseButton1") then
				PointResult = nil
			end
			if p1.get(p9, "UserInputType") == p1.values.enum("UserInputType", "MouseButton1") and Config then
				finishResize()
			end
			if p1.get(p9, "UserInputType") == p1.values.enum("UserInputType", "MouseButton1") and Config1 then
				finishCarry()
			end
		end
		
		for _, value1 in { UserInputService, p4 } do
			if value1 == UserInputService or p1.isA(value1, "GuiObject") then
				table.insert(List1, p1.connect(value1, "InputChanged", onPointerChanged))
				table.insert(List1, p1.connect(value1, "InputEnded", onPointerEnded))
			end
		end
		local InputBegan = p1.connect(DesignOverlay, "InputBegan", function(p9)
			-- upvalues: p5 (copy), p1 (upval), v1 (upval), gripAt (copy), startResize (copy), UserInputService (copy), pick (copy), p3 (copy), beginMarquee (copy), blocked (copy), Config1 (ref)
			if p5.readOnly then return end
			if p1.get(p9, "UserInputType") == p1.values.enum("UserInputType", "MouseButton1") or p1.get(p9, "UserInputType") == p1.values.enum("UserInputType", "Touch") then
				local PointResult = v1.point(p9)
				local GripAtResult = gripAt(PointResult)
				
				if GripAtResult then
					startResize(GripAtResult.corner, PointResult)
					
					return
				end
				if p1.call(UserInputService, "IsKeyDown", p1.values.enum("KeyCode", "Space")) ~= true then
					local PickResult = pick(PointResult)
					
					if PickResult == nil or PickResult == p3.document:peek().root.id then
						beginMarquee(PointResult, p9)
						
						return
					end
					local ModifiedResult = p1.modified(p9, { "Shift", "Ctrl", "Meta" })
					
					if ModifiedResult then
						p3.select(PickResult, "toggle")
					elseif not table.find(p3.selection:peek(), PickResult) then
						p3.select(PickResult)
					end
					if not ModifiedResult then
						local List = {}
						
						for _, value in p3.selection:peek() do
							if not blocked(value) then
								table.insert(List, value)
							end
						end
						p3.selectMany(List)
						Config1 = {
							active = false,
							drop = nil,
							id = PickResult,
							start = PointResult
						}
					end
				end
			end
		end)
		local InputChanged = p1.connect(DesignOverlay, "InputChanged", function(p10)
			-- upvalues: p1 (upval), p3 (copy), pick (copy), toGui (copy)
			if p1.get(p10, "UserInputType") == p1.values.enum("UserInputType", "MouseMovement") then
				p3.hovered:set((pick(toGui(p10))))
			end
		end)
		local MouseLeave = p1.connect(DesignOverlay, "MouseLeave", function()
			-- upvalues: p3 (copy)
			p3.hovered:set(nil)
		end)
		
		return {
			surface = DesignSurface,
			overlay = DesignOverlay,
			nodes = Tbl,
			zoom = CellResult,
			fit = fit,
			zoomTo = zoomTo,
			pan = function(Vector)
				-- upvalues: AddResult (ref), MathModule (upval), apply (copy)
				assert(Vector.X == Vector.X and (Vector.Y == Vector.Y and math.abs(Vector.X) < 1e999) and math.abs(Vector.Y) < 1e999, "Pan requires finite pixel offsets")
				AddResult = MathModule.add(AddResult, Vector)
				apply()
			end,
			play = function(p10)
				-- upvalues: t (ref)
				assert(t[p10], "Unknown Design sequence").play()
			end,
			dispose = function()
				-- upvalues: List1 (copy), InputBegan (copy), InputChanged (copy), MouseLeave (copy), Callback (ref), OwnResult (copy), p1 (upval), Frame (copy)
				for _, Connection in List1 do
					Connection:Disconnect()
				end
				InputBegan:Disconnect()
				InputChanged:Disconnect()
				MouseLeave:Disconnect()
				
				if Callback then
					Callback()
				end
				OwnResult()
				p1.destroy(Frame)
			end
		}
	end
end