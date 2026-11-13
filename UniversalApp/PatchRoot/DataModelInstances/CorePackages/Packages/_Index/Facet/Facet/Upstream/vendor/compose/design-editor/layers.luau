local _ = require("./ui")
local CoreModule = require("../core")
local DesignModule = require("../design")

return function(p1)
	-- upvalues: DesignModule (copy), CoreModule (copy)
	local v1 = require("./theme")(p1)
	local Color = v1.color
	local Size = v1.size
	
	local function row(Id)
		-- upvalues: v1 (copy), p1 (copy), Size (copy), Color (copy)
		local ButtonResult = v1.button(Id, "")
		p1.set(ButtonResult, "Size", p1.values.udim2(1, 0, 0, Size.row))
		p1.set(ButtonResult, "BackgroundColor3", Color.hover)
		v1.corner(ButtonResult, 4)
		local LabelResult = v1.label("", Color.tertiary, Size.small, v1.font.bold)
		p1.set(LabelResult, "Name", "Glyph")
		p1.set(LabelResult, "Size", p1.values.udim2(0, 16, 1, 0))
		p1.set(LabelResult, "TextXAlignment", p1.values.enum("TextXAlignment", "Center"))
		p1.set(LabelResult, "Parent", ButtonResult)
		local LabelResult1 = v1.label("", Color.secondary, Size.text)
		p1.set(LabelResult1, "Name", "Title")
		v1.place(LabelResult1, ButtonResult, p1.values.udim2(1, -74, 1, 0), p1.values.udim2(0, 22, 0, 0))
		
		return {
			button = ButtonResult,
			glyph = LabelResult,
			name = LabelResult1
		}
	end
	
	return function(p2, p3, p4)
		-- upvalues: v1 (copy), p1 (copy), Color (copy), DesignModule (upval), CoreModule (upval), row (copy), Size (copy)
		local Indent = (p4 or {}).indent or 16
		local DesignLayers = v1.scroller("DesignLayers")
		p1.set(DesignLayers, "Size", p1.values.udim2(1, 0, 1, 0))
		v1.list(DesignLayers, p1.values.enum("FillDirection", "Vertical"), 1)
		v1.pad(DesignLayers, 8, 8, 4, 8)
		p1.set(DesignLayers, "Parent", p3)
		local Tbl = {}
		local UserInputService = p1.service("UserInputService")
		local LayerContextMenu = v1.frame("LayerContextMenu", Color.panel)
		p1.set(LayerContextMenu, "Size", p1.values.udim2(0, 160, 0, 64))
		p1.set(LayerContextMenu, "Visible", false)
		p1.set(LayerContextMenu, "ZIndex", 30)
		p1.set(LayerContextMenu, "Parent", p3)
		local List = {}
		table.insert(List, p1.connect(UserInputService, "InputBegan", function(p5)
			-- upvalues: p1 (upval), v1 (upval), LayerContextMenu (copy)
			if p1.get(p5, "UserInputType") == p1.values.enum("UserInputType", "MouseButton1") then
				local PointResult = v1.point(p5)
				local AbsolutePosition = p1.xy(LayerContextMenu, "AbsolutePosition")
				local AbsoluteSize = p1.xy(LayerContextMenu, "AbsoluteSize")
				
				if PointResult.X < AbsolutePosition.X or PointResult.Y < AbsolutePosition.Y or AbsolutePosition.X + AbsoluteSize.X < PointResult.X or AbsolutePosition.Y + AbsoluteSize.Y < PointResult.Y then
					p1.set(LayerContextMenu, "Visible", false)
				end
			end
		end))
		
		for i, value in { "Wrap", "Unwrap" } do
			local ButtonResult = v1.button(value, value)
			p1.set(ButtonResult, "BackgroundColor3", Color.panel)
			p1.set(ButtonResult, "BackgroundTransparency", 0)
			p1.set(ButtonResult, "Size", p1.values.udim2(1, 0, 0, 32))
			p1.set(ButtonResult, "Position", p1.values.udim2(0, 0, 0, (i - 1) * 32))
			p1.set(ButtonResult, "ZIndex", 31)
			p1.set(ButtonResult, "Parent", LayerContextMenu)
			table.insert(List, p1.connect(ButtonResult, "Activated", function()
				-- upvalues: p1 (upval), LayerContextMenu (copy), value (copy), p2 (copy)
				p1.set(LayerContextMenu, "Visible", false)
				
				if value == "Wrap" then
					p2.wrap()
					
					return
				else
					p2.unwrap()
				end
			end))
		end
		local DropIndicator = v1.frame("DropIndicator", Color.accent)
		p1.set(DropIndicator, "Size", p1.values.udim2(1, -16, 0, 2))
		p1.set(DropIndicator, "Visible", false)
		p1.set(DropIndicator, "ZIndex", 10)
		p1.set(DropIndicator, "Parent", p3)
		local v2 = nil
		local Id = nil
		
		local function dropAt(PointResult, Value)
			-- upvalues: p2 (copy), Tbl (copy), p1 (upval), DesignModule (upval)
			local PeekResult = p2.document:peek()
			local AbsolutePosition = nil
			local AbsoluteSize = nil
			
			for Destination, value in Tbl do
				AbsolutePosition = p1.xy(value.button, "AbsolutePosition")
				AbsoluteSize = p1.xy(value.button, "AbsoluteSize")
				
				if AbsolutePosition.Y <= PointResult.Y and PointResult.Y < AbsolutePosition.Y + AbsoluteSize.Y then
					local FindResult, FindResult2, FindResult3 = DesignModule.document.find(PeekResult.root, Destination)
					local FindResult1 = DesignModule.document.find(PeekResult.root, Value)
					
					if FindResult == nil or FindResult1 == nil or DesignModule.document.find(FindResult1, Destination) then
						return nil, nil
					end
					local YRatio = (PointResult.Y - AbsolutePosition.Y) / AbsoluteSize.Y
					local IsList = p2.library.kinds[FindResult.kind].children == "list"
					
					if FindResult2 == nil or IsList and YRatio > 0.25 and YRatio < 0.75 then
						return if IsList then { before = nil, into = true, destination = Destination } else nil, value
					end
					local FindResult4 = if YRatio <= 0.5 then FindResult3 else (FindResult3 or 0) + 1
					local _, FindResult2_1, FindResult3_1 = DesignModule.document.find(PeekResult.root, Value)
					
					if FindResult2_1 == FindResult2 and FindResult3_1 and FindResult4 then
						local Count = 0
						
						for i, child in FindResult2.children do
							if i < FindResult4 and (child.id == Value or table.find(p2.selection:peek(), Value) and table.find(p2.selection:peek(), child.id)) then
								Count += 1
							end
						end
						FindResult4 -= Count
					end
					return {
						into = false,
						destination = FindResult2.id,
						before = FindResult4
					}, value
				end
			end
			return nil, nil
		end
		
		local function showDrop(Drop, p5, PointResult)
			-- upvalues: p1 (upval), DropIndicator (copy), p3 (copy)
			p1.set(DropIndicator, "Visible", false)
			
			if Drop == nil or p5 == nil then return end
			local AbsolutePosition = p1.xy(p3, "AbsolutePosition")
			local AbsolutePosition1 = p1.xy(p5.button, "AbsolutePosition")
			local AbsoluteSize = p1.xy(p5.button, "AbsoluteSize")
			
			if Drop.into then
				p1.set(DropIndicator, "Position", p1.values.udim2(0, AbsolutePosition1.X - AbsolutePosition.X, 0, AbsolutePosition1.Y - AbsolutePosition.Y))
				p1.set(DropIndicator, "Size", p1.values.udim2(0, AbsoluteSize.X, 0, AbsoluteSize.Y))
				p1.set(DropIndicator, "BackgroundTransparency", 0.8)
			else
				p1.set(DropIndicator, "Position", p1.values.udim2(0, AbsolutePosition1.X - AbsolutePosition.X, 0, (if (PointResult.Y - AbsolutePosition1.Y) / AbsoluteSize.Y <= 0.5 then AbsolutePosition1.Y else AbsolutePosition1.Y + AbsoluteSize.Y) - AbsolutePosition.Y - 1))
				p1.set(DropIndicator, "Size", p1.values.udim2(0, AbsoluteSize.X, 0, 2))
				p1.set(DropIndicator, "BackgroundTransparency", 0)
			end
			p1.set(DropIndicator, "Visible", true)
		end
		
		local List1 = {}
		
		local function clear()
			-- upvalues: List1 (copy), Tbl (copy), p1 (upval)
			for _, Connection in List1 do
				Connection:Disconnect()
			end
			table.clear(List1)
			
			for _, value in Tbl do
				p1.destroy(value.button)
			end
			table.clear(Tbl)
		end
		
		local function paint(List, PeekResult)
			-- upvalues: Tbl (copy), p1 (upval), Color (upval), v1 (upval)
			for i, value in Tbl do
				local HasFoundIndex = table.find(List, i) ~= nil
				p1.set(value.button, "BackgroundColor3", if HasFoundIndex then Color.accentSoft else Color.hover)
				p1.set(value.button, "BackgroundTransparency", if HasFoundIndex then 0 elseif i == PeekResult then 0.4 else 1)
				p1.set(value.name, "TextColor3", if HasFoundIndex then Color.text else Color.secondary)
				p1.set(value.name, "FontFace", if HasFoundIndex then v1.font.bold else v1.font.medium)
				p1.set(value.glyph, "TextColor3", if HasFoundIndex then Color.accent else Color.tertiary)
			end
		end
		
		local OwnResult = CoreModule.owner.own(p1.owner, CoreModule.createRootOwner(function()
			-- upvalues: CoreModule (upval), p2 (copy), p1 (upval), LayerContextMenu (copy), clear (copy), DesignModule (upval), row (upval), v1 (upval), Indent (copy), Size (upval), Color (upval), List1 (copy), Id (ref), v2 (ref), p3 (copy), Tbl (copy), DesignLayers (copy), paint (copy)
			CoreModule.watch(function(Callback)
				-- upvalues: p2 (upval), p1 (upval), LayerContextMenu (upval), clear (upval), DesignModule (upval), row (upval), v1 (upval), Indent (upval), Size (upval), Color (upval), List1 (upval), Id (upval), v2 (upval), p3 (upval), Tbl (upval), DesignLayers (upval), paint (upval)
				local CallbackResult = Callback(p2.document)
				p1.set(LayerContextMenu, "Visible", false)
				clear()
				
				for i, value in DesignModule.document.nodes(CallbackResult.root) do
					local Node = value.node
					local RowResult = row(Node.id)
					p1.set(RowResult.button, "LayoutOrder", i)
					p1.set(RowResult.glyph, "Text", v1.glyph[Node.kind] or "◇")
					p1.set(RowResult.name, "Text", Node.name)
					local UIPadding = p1.new("UIPadding")
					p1.set(UIPadding, "PaddingLeft", p1.values.udim(0, 6 + value.depth * Indent))
					p1.set(UIPadding, "PaddingRight", p1.values.udim(0, 6))
					p1.set(UIPadding, "Parent", RowResult.button)
					local Id1 = Node.id
					
					for i1, value1 in { "Hide", "Lock" } do
						local ButtonResult = v1.button(value1, "", nil, Size.small)
						local Hidden = if value1 == "Hide" then Node.hidden else Node.locked
						p1.set(ButtonResult, "Text", if value1 == "Hide" then if Hidden then "○" else "◉" elseif Hidden then "▣" else "□")
						p1.set(ButtonResult, "TextColor3", if Hidden then Color.accent else Color.tertiary)
						p1.set(ButtonResult, "Size", p1.values.udim2(0, 24, 1, 0))
						p1.set(ButtonResult, "Position", p1.values.udim2(1, -54 + (i1 - 1) * 24, 0, 0))
						p1.set(ButtonResult, "Parent", RowResult.button)
						table.insert(List1, p1.connect(ButtonResult, "Activated", function()
							-- upvalues: value1 (copy), p2 (upval), Id1 (copy), Hidden (copy)
							if value1 == "Hide" then
								p2.hide(Id1, not Hidden)
								
								return
							else
								p2.lock(Id1, not Hidden)
							end
						end))
					end
					table.insert(List1, p1.connect(RowResult.button, "Activated", function(p5)
						-- upvalues: Id (upval), Id1 (copy), v2 (upval), p1 (upval), p2 (upval)
						if Id == Id1 then
							Id = nil
							
							return
						end
						if not v2 or not v2.active then
							local ModifiedResult = p1.modified(p5, { "Shift" })
							p2.select(Id1, if p1.modified(p5, { "Ctrl", "Meta" }) then "toggle" elseif ModifiedResult then "range" else "replace")
							
							return
						end
					end))
					table.insert(List1, p1.connect(RowResult.button, "InputBegan", function(p5)
						-- upvalues: p1 (upval), p2 (upval), Id1 (copy), v1 (upval), p3 (upval), LayerContextMenu (upval), Node (copy), CallbackResult (copy), Id (upval), v2 (upval)
						if p1.get(p5, "UserInputType") == p1.values.enum("UserInputType", "MouseButton2") then
							if not table.find(p2.selection:peek(), Id1) then
								p2.select(Id1)
							end
							local PointResult = v1.point(p5)
							local AbsolutePosition = p1.xy(p3, "AbsolutePosition")
							local AbsoluteSize = p1.xy(p3, "AbsoluteSize")
							p1.set(LayerContextMenu, "Position", p1.values.udim2(0, math.clamp(PointResult.X - AbsolutePosition.X, 0, (math.max(0, AbsoluteSize.X - 160))), 0, (math.clamp(PointResult.Y - AbsolutePosition.Y, 0, (math.max(0, AbsoluteSize.Y - 64))))))
							p1.set(LayerContextMenu, "Visible", true)
							
							return
						elseif p1.get(p5, "UserInputType") == p1.values.enum("UserInputType", "MouseButton1") and Node.id ~= CallbackResult.root.id then
							Id = nil
							v2 = {
								active = false,
								drop = nil,
								id = Id1,
								start = v1.point(p5)
							}
						end
					end))
					table.insert(List1, p1.connect(RowResult.button, "MouseEnter", function()
						-- upvalues: p2 (upval), Id1 (copy)
						p2.hovered:set(Id1)
					end))
					table.insert(List1, p1.connect(RowResult.button, "MouseLeave", function()
						-- upvalues: p2 (upval), Id1 (copy)
						if p2.hovered:peek() == Id1 then
							p2.hovered:set(nil)
						end
					end))
					Tbl[Id1] = RowResult
					p1.set(RowResult.button, "Parent", DesignLayers)
				end
				paint(p2.selection:peek(), p2.hovered:peek())
			end)
			CoreModule.watch(function(Callback)
				-- upvalues: p2 (upval), paint (upval)
				Callback(p2.document)
				paint(Callback(p2.selection), Callback(p2.hovered))
			end)
		end, p1.runtime.reactor).dispose)
		local InputChanged = p1.connect(UserInputService, "InputChanged", function(p5)
			-- upvalues: v2 (ref), p1 (upval), v1 (upval), dropAt (copy), showDrop (copy)
			local v3 = v2
			
			if v3 == nil or p1.get(p5, "UserInputType") ~= p1.values.enum("UserInputType", "MouseMovement") then return end
			local PointResult = v1.point(p5)
			
			if v3.active or math.sqrt((PointResult.X - v3.start.X) ^ 2 + (PointResult.Y - v3.start.Y) ^ 2) >= 4 then
				v3.active = true
				local DropAtResult, DropAtResult2 = dropAt(PointResult, v3.id)
				v3.drop = DropAtResult
				showDrop(DropAtResult, DropAtResult2, PointResult)
				
				return
			end
		end)
		local InputEnded = p1.connect(UserInputService, "InputEnded", function(p5)
			-- upvalues: v2 (ref), p1 (upval), DropIndicator (copy), Id (ref), p2 (copy)
			local v3 = v2
			
			if v3 == nil or p1.get(p5, "UserInputType") ~= p1.values.enum("UserInputType", "MouseButton1") then return end
			v2 = nil
			p1.set(DropIndicator, "Visible", false)
			local Drop = v3.drop
			
			if v3.active and Drop then
				Id = v3.id
				p2.move(v3.id, Drop.destination, Drop.before)
			end
		end)
		
		return {
			root = DesignLayers,
			dispose = function()
				-- upvalues: OwnResult (copy), InputChanged (copy), InputEnded (copy), clear (copy), List (copy), p1 (upval), LayerContextMenu (copy), DropIndicator (copy), DesignLayers (copy)
				OwnResult()
				InputChanged:Disconnect()
				InputEnded:Disconnect()
				clear()
				
				for _, Connection in List do
					Connection:Disconnect()
				end
				p1.destroy(LayerContextMenu)
				p1.destroy(DropIndicator)
				p1.destroy(DesignLayers)
			end
		}
	end
end