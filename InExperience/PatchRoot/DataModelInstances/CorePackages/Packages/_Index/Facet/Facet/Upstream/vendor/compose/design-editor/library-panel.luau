local _ = require("./ui")
local _ = require("../core")
local _ = require("../design")

return function(p1)
	local v1 = require("./theme")(p1)
	local Color = v1.color
	local Size = v1.size
	
	return function(p2, p3)
		-- upvalues: v1 (copy), p1 (copy), Size (copy), Color (copy)
		local Library = p2.library
		local List2 = {}
		local DesignLibrary = v1.frame("DesignLibrary")
		v1.place(DesignLibrary, p3, p1.values.udim2(1, 0, 1, 0))
		local FieldResult = v1.field("")
		p1.set(FieldResult, "Name", "Search")
		p1.set(FieldResult, "Position", p1.values.udim2(0, 8, 0, 4))
		p1.set(FieldResult, "Size", p1.values.udim2(1, -16, 0, Size.row))
		p1.set(FieldResult, "PlaceholderText", "Search")
		p1.set(FieldResult, "Parent", DesignLibrary)
		local Kinds = v1.scroller("Kinds")
		p1.set(Kinds, "Position", p1.values.udim2(0, 0, 0, Size.row + 8))
		p1.set(Kinds, "Size", p1.values.udim2(1, 0, 1, -(Size.row + 8)))
		v1.list(Kinds, p1.values.enum("FillDirection", "Vertical"), 1)
		v1.pad(Kinds, 8, 8, 4, 8)
		p1.set(Kinds, "Parent", DesignLibrary)
		local t = {}
		local List3 = {}
		
		for i, kind in Library.kinds do
			local Category = kind.category or "Library"
			local List = t[Category]
			
			if List == nil then
				List = {}
				t[Category] = List
				table.insert(List3, Category)
			end
			table.insert(List, i)
		end
		local Categories = Library.categories or {}
		table.sort(List3, function(Value, Value1): boolean
			-- upvalues: Categories (copy)
			local FoundIndex: number? = table.find(Categories, Value)
			local FoundIndex1: number? = table.find(Categories, Value1)
			
			return if FoundIndex and FoundIndex1 then FoundIndex < FoundIndex1 elseif FoundIndex or FoundIndex1 then FoundIndex ~= nil else Value < Value1
		end)
		local List4 = {}
		local LabelResults = {}
		local Count = 0
		
		for _, value in List3 do
			local List1 = t[value]
			table.sort(List1)
			Count += 1
			local LabelResult = v1.label(value, Color.tertiary, Size.small, v1.font.bold)
			p1.set(LabelResult, "Name", value)
			p1.set(LabelResult, "Size", p1.values.udim2(1, 0, 0, Size.row))
			p1.set(LabelResult, "LayoutOrder", Count)
			p1.set(LabelResult, "Parent", Kinds)
			LabelResults[value] = LabelResult
			
			for _, Name in List1 do
				Count += 1
				local ButtonResult = v1.button(Name, "")
				p1.set(ButtonResult, "Size", p1.values.udim2(1, 0, 0, Size.row))
				p1.set(ButtonResult, "BackgroundColor3", Color.hover)
				p1.set(ButtonResult, "LayoutOrder", Count)
				v1.corner(ButtonResult, 4)
				local LabelResult1 = v1.label(v1.glyph[Name] or "◇", Color.tertiary, Size.small, v1.font.bold)
				p1.set(LabelResult1, "Name", "Glyph")
				p1.set(LabelResult1, "Size", p1.values.udim2(0, 16, 1, 0))
				p1.set(LabelResult1, "TextXAlignment", p1.values.enum("TextXAlignment", "Center"))
				p1.set(LabelResult1, "Parent", ButtonResult)
				local LabelResult2 = v1.label(Name, Color.secondary, Size.text)
				p1.set(LabelResult2, "Name", "Title")
				v1.place(LabelResult2, ButtonResult, p1.values.udim2(1, -22, 1, 0), p1.values.udim2(0, 22, 0, 0))
				p1.set(ButtonResult, "Parent", Kinds)
				
				for _, value1 in v1.hover(ButtonResult, Color.panel, Color.hover, 1) do
					table.insert(List2, value1)
				end
				table.insert(List2, p1.connect(ButtonResult, "Activated", function()
					-- upvalues: p2 (copy), Name (copy)
					p2.insert(Name)
				end))
				table.insert(List4, { name = Name, button = ButtonResult, header = LabelResult })
			end
		end
		local function filter(Text: string)
			-- upvalues: List4 (copy), p1 (upval), LabelResults (copy)
			local Lowered = string.lower(Text)
			local t = {}
			
			for _, value in List4 do
				local IsLoweredMatch: boolean = Lowered == "" or string.find(string.lower(value.name), Lowered, 1, true) ~= nil
				p1.set(value.button, "Visible", IsLoweredMatch)
				
				if IsLoweredMatch then
					t[value.header] = true
				end
			end
			for _, labelResult in LabelResults do
				p1.set(labelResult, "Visible", t[labelResult] == true)
			end
		end
		
		table.insert(List2, p1.changed(FieldResult, "Text", function()
			-- upvalues: filter (copy), p1 (upval), FieldResult (copy)
			filter(p1.text(FieldResult, "Text"))
		end))
		
		return {
			root = DesignLibrary,
			filter = filter,
			dispose = function()
				-- upvalues: List2 (copy), p1 (upval), DesignLibrary (copy)
				for _, Connection in List2 do
					Connection:Disconnect()
				end
				table.clear(List2)
				p1.destroy(DesignLibrary)
			end
		}
	end
end