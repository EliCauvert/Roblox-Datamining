local _ = require("./review_types")
local Patterns = {
	" · ",
	" • ",
	" | ",
	" / ",
	" – "
}
local config = { high = 1, medium = 2, low = 3 }
local Frozen = table.freeze({
	["joined-facts"] = "One text joins several facts with separators, so no fact leads and values cannot be compared. Give each fact its own element: the value in the numeral or strong role and its label in caption beside or under it. In a HUD region the player reads a value at a glance during play, so a joined line that leads its region is high. See the information-display reference in the use-facet skill.",
	["numbers-unemphasized"] = "The numbers on this screen are no larger or heavier than the text around them. Put the value that drives the decision in the numeral role, larger than body text, with its unit or label smaller. See the information-display reference in the use-facet skill.",
	["flat-hierarchy"] = "The largest text is close to the common text size, so nothing leads. Choose the one thing to see first and make it clearly larger (1.6 times body or more); quiet the rest.",
	["competing-peaks"] = "Two different texts share the largest size in one group, so they compete. Keep one peak per group: make one the lead and set the other as a label in caption or label.",
	["record-without-visual"] = "Repeated items have no visual, so the player reads every name to tell them apart. Give each item its image or model, or else a glyph from the theme icon set, beside its name. Rows that only compare facts belong in a Table. See the information-display reference in the use-facet skill.",
	["nested-surface"] = "A plate sits inside a plate of nearly the same color. Keep one plate per layer; separate groups with space or one hairline.",
	["zero-wall"] = "Most numbers on this screen are zero. Replace an all-zero record with its goal: what the player does next and how far it is.",
	["single-weight"] = "Every text uses one font and one weight. Give the lead and the values a heavier weight than labels and body text.",
	["stacked-choices"] = "Short choices are stacked in a narrow column inside a wide space, so the player scrolls past one option per row. Put color swatches, chips and filters in an HStack with wrap = true or a Grid that fills the width, and show a few peer actions in one row. AdaptiveStack turns into this column when its row does not fit.",
	["hollow-plate"] = "A plate is much larger than what it holds: the content uses a small corner and the rest is empty. Size the plate to its content, put repeated items in a Grid whose column count follows the width, or give the empty room to the subject.",
	["lopsided-page"] = "The page content sits on one side of a wide surface and leaves the other side empty. Center a bounded column (width = \"fill\" with maxWidth, align = \"center\" on the Screen), or use the room for a second pane such as the selected item's detail.",
	["floating-text"] = "Several texts sit straight on the 3D world with no plate, so the scene shows through and they collide with signs and bright objects. Group HUD readouts on a panel surface, or give each a stroke.",
	["touch-control-overlap"] = "A control covers the place where Roblox draws the Jump button on touch screens. On touch, raise the bottom of the Composition above the thumb controls with bottom padding, or move the control.",
	["composition-unfit"] = "A HUD Composition does not fit a phone screen: the named regions overlap there even at their last form. Give each of them a compact second form, such as one Menu circle for the destinations, or mayDrop = true for an optional region.",
	["unnamed-reveal"] = "A HUD region that the screen has no room for shows as a \"...\" mark, and the mark does not say what is behind it. Give the Region a label, an icon or both: the mark shows them, and the popover of several regions names each one. For a readout whose shorter form loses nothing, set reveal = false.",
	["overlapping-text"] = "Two texts are drawn over each other. Siblings placed by Position or AnchorPoint collide when the room shrinks. Put them in one VStack or HStack so that each keeps its own space, and use a Spacer or UI.fill() to push a group to the far edge.",
	["covered-text"] = "A plate or an image from another part covers a text at this size. The layers of a ZStack do not make room for each other, and a child that is wider than its slot in a stack runs over its neighbor. Put the parts that must not cover each other in one VStack, HStack or AdaptiveStack, let each part fit its slot, and keep the ZStack for the parts that are meant to overlap.",
	["collapsed-text"] = "A text has no width, so none of it is drawn. Its holder is as wide as its content, and the content waits for a width from the holder. Give the holder a width: a width in pixels or fill, a Size with a width, or align = \"stretch\" on the list that holds it.",
	["offscreen-text"] = "A text is outside the screen while the row or the stack that holds it is on the screen. The parts are wider than the room, so a neighbor pushed the text past the edge. Let the long text wrap or truncate, give the fixed parts smaller sizes, or let the row reflow with an AdaptiveStack or wrap = true on the HStack.",
	["escaped-text"] = "A text runs past the edge of the plate or the image that it sits on, or a clip cuts it. Let the text wrap or give it a maxWidth, let the backing grow with its content, or use a smaller type role at this size. For a label on art, keep it inside the painted area of the art.",
	["native-text"] = "Some texts are native labels, so they miss the theme's type roles, the player's text size and the ten-foot scale. Build each label with UI.Text and a textRole, and arrange it with a stack, a ZStack or a Grid.",
	["stranded-content"] = "The content fills a small part of a large surface and sits to one side. Bound the surface to its content or use the space for the subject."
})

local function clean(Text: string): string
	return (string.gsub(string.gsub(string.gsub(string.gsub(Text, "<[^>]+>", ""), "%s+", " "), "^ ", ""), " $", ""))
end

local function split(Text)
	-- upvalues: Patterns (copy)
	local Text1 = " " .. Text .. " "
	local List = {}
	local StartIndex = 1
	local Init = 1
	while true do
		local StartIndex2 = nil
		local EndIndex1 = nil
		local Pattern = nil
		for _, pattern in Patterns do
			local StartIndex1, EndIndex = string.find(Text1, pattern, Init, true)
			
			if StartIndex1 ~= nil and EndIndex ~= nil and (StartIndex2 == nil or StartIndex1 < StartIndex2) then
				StartIndex2 = StartIndex1
				EndIndex1 = EndIndex
				Pattern = pattern
			end
		end
		if StartIndex2 == nil or EndIndex1 == nil then break end
		local v1: number = assert(StartIndex2)
		local v2: number = assert(EndIndex1)
		local Segment = string.sub(Text1, v1 - 1, v1 - 1)
		local Segment1 = string.sub(Text1, v2 + 1, v2 + 1)
		
		if not (if Pattern == " / " then string.match(Segment, "%d") ~= nil and string.match(Segment1, "%d") ~= nil else Pattern == " – " and (string.match(Segment, "%d") ~= nil and string.match(Segment1, "%d") ~= nil)) then
			table.insert(List, (string.sub(Text1, StartIndex, v1 - 1)))
			StartIndex = v2 + 1
		end
		Init = v2 + 1
	end
	table.insert(List, (string.sub(Text1, StartIndex)))
	local List1 = {}
	
	for _, value in List do
		local Replaced = string.gsub(string.gsub(value, "^%s+", ""), "%s+$", "")
		
		if Replaced ~= "" then
			table.insert(List1, Replaced)
		end
	end
	return List1
end

local function lines(Text: string)
	local List = {}
	
	for i in string.gmatch(string.gsub(Text, "<[^>]+>", "") .. "\n", "([^\n]*)\n") do
		local Replaced = string.gsub(string.gsub(string.gsub(string.gsub(i, "%s+", " "), "^ ", ""), "^[•·%-%*] ", ""), " $", "")
		
		if Replaced ~= "" then
			table.insert(List, Replaced)
		end
	end
	return List
end

local function segments(p1)
	-- upvalues: lines (copy), split (copy)
	local LinesResult = lines(p1)
	
	return if #LinesResult == 1 then split(LinesResult[1]) elseif #LinesResult == 0 then {} else { p1 }
end

local function numbers(Text: string)
	local List = {}
	
	for i in string.gmatch(string.gsub(Text, "%d+:%d+[:%d%.]*", function(Text: string): string
		-- upvalues: List (copy)
		table.insert(List, if string.find(Text, "[1-9]") then 1 else 0)
		
		return " "
	end), "%d[%d,]*%.?%d*") do
		local Number: number? = tonumber((string.gsub(i, ",", "")))
		
		if Number ~= nil then
			table.insert(List, Number)
		end
	end
	return List
end

local function _(p1: number): number
	return if p1 <= 0.03928 then p1 / 12.92 else ((p1 + 0.055) / 1.055) ^ 2.4
end

local _ = function(p1): number
	local R: number = p1.r
	local G: number = p1.g
	local v3 = (if R <= 0.03928 then R / 12.92 else ((R + 0.055) / 1.055) ^ 2.4) * 0.2126 + (if G <= 0.03928 then G / 12.92 else ((G + 0.055) / 1.055) ^ 2.4) * 0.7152
	local B: number = p1.b
	
	return v3 + (if B <= 0.03928 then B / 12.92 else ((B + 0.055) / 1.055) ^ 2.4) * 0.0722
end

local _ = function(p1, p2): number
	local R: number = p1.r
	local G: number = p1.g
	local v3 = (if R <= 0.03928 then R / 12.92 else ((R + 0.055) / 1.055) ^ 2.4) * 0.2126 + (if G <= 0.03928 then G / 12.92 else ((G + 0.055) / 1.055) ^ 2.4) * 0.7152
	local B: number = p1.b
	local v4 = v3 + (if B <= 0.03928 then B / 12.92 else ((B + 0.055) / 1.055) ^ 2.4) * 0.0722
	local R1: number = p2.r
	local G1: number = p2.g
	local v5 = (if R1 <= 0.03928 then R1 / 12.92 else ((R1 + 0.055) / 1.055) ^ 2.4) * 0.2126 + (if G1 <= 0.03928 then G1 / 12.92 else ((G1 + 0.055) / 1.055) ^ 2.4) * 0.7152
	local B1: number = p2.b
	local v6 = v5 + (if B1 <= 0.03928 then B1 / 12.92 else ((B1 + 0.055) / 1.055) ^ 2.4) * 0.0722
	
	return (math.max(v4, v6) + 0.05) / (math.min(v4, v6) + 0.05)
end

local _ = function(p1, p2): number
	return (math.max(math.abs(p1.r - p2.r), math.abs(p1.g - p2.g), (math.abs(p1.b - p2.b))))
end

local _ = function(Vector): number
	return math.max(0, Vector.width) * math.max(0, Vector.height)
end

local _ = function(Tbl)
	if #Tbl == 0 then
		return 0
	else
		local Copy = table.clone(Tbl)
		table.sort(Copy)
		local Value = (#Copy + 1) / 2
		
		return (Copy[math.floor(Value)] + Copy[math.ceil(Value)]) / 2
	end
end

local function quote(Text: string): string
	local Length: number = utf8.len(Text) or #Text
	local CountText: number = if Length > 48 then (utf8.offset(Text, 46) or 46) - 1 else #Text
	
	return "\"" .. (if Length > 48 then string.sub(Text, 1, CountText) .. "..." else Text) .. "\""
end

local _ = function(p1, p2, p3): boolean
	local _Rect = p1.rect
	
	return p1.visible and (_Rect.width > 0 and (_Rect.height > 0 and (_Rect.x < p2 and (_Rect.y < p3 and _Rect.x + _Rect.width > 0))) and _Rect.y + _Rect.height > 0)
end

local _ = function(p1): boolean
	return p1.fillTransparency < 0.4 and p1.rect.width >= 24 and p1.rect.height >= 24
end

local _ = function(p1)
	local Paint = p1.paint
	
	if Paint == nil or not p1.image or p1.fillTransparency < 0.4 and (p1.rect.width >= 24 and p1.rect.height >= 24) then
		return p1.rect
	else
		return Paint
	end
end

local _ = function(p1)
	local IsHeightAbove = p1.fillTransparency < 0.4 and (p1.rect.width >= 24 and p1.rect.height >= 24)
	
	if not IsHeightAbove then
		IsHeightAbove = p1.image
		
		if IsHeightAbove then
			local Paint = p1.paint
			local _Rect = if Paint == nil or not p1.image then p1.rect elseif p1.fillTransparency < 0.4 and (p1.rect.width >= 24 and p1.rect.height >= 24) then p1.rect else Paint
			IsHeightAbove = math.max(0, _Rect.width) * math.max(0, _Rect.height) > 0
		end
	end
	return IsHeightAbove
end

local function prepare(Vector)
	-- upvalues: clean (copy)
	local ByIndex = {}
	local Children = {}
	local Texts = {}
	local Plates = {}
	
	for _, element in Vector.elements do
		ByIndex[element.index] = element
	end
	local function parentOf(p1)
		local Parent = p1.parent
		
		return if Parent == nil or Parent >= p1.index then nil else Parent
	end
	
	for _, element1 in Vector.elements do
		local Width = Vector.width
		local Height = Vector.height
		local _Rect = element1.rect
		
		if element1.visible and (_Rect.width > 0 and (_Rect.height > 0 and (_Rect.x < Width and (_Rect.y < Height and (_Rect.x + _Rect.width > 0 and _Rect.y + _Rect.height > 0))))) then
			local Parent = element1.parent
			local Parent1 = if Parent == nil or Parent >= element1.index then nil else Parent
			
			if Parent1 ~= nil then
				local List = Children[Parent1]
				
				if List == nil then
					List = {}
					Children[Parent1] = List
				end
				table.insert(List, element1)
			end
			local Text = element1.text
			
			if Text ~= nil and Text.transparency < 0.95 and clean(Text.content) ~= "" then
				table.insert(Texts, element1)
			end
			if element1.fillTransparency < 0.4 and (element1.rect.width >= 24 and element1.rect.height >= 24) then
				table.insert(Plates, element1)
			end
		end
	end
	local function plateOf(p1)
		-- upvalues: ByIndex (copy), Vector (copy)
		local Parent = p1.parent
		local Parent1 = if Parent == nil or Parent >= p1.index then nil else Parent
		local ByIndexEntry = nil
		while Parent1 ~= nil do
			ByIndexEntry = ByIndex[Parent1]
			
			if ByIndexEntry == nil then
				return nil
			end
			if ByIndexEntry.fillTransparency < 0.4 and (ByIndexEntry.rect.width >= 24 and ByIndexEntry.rect.height >= 24) then
				local Width = Vector.width
				local Height = Vector.height
				local ByIndexEntryRect = ByIndexEntry.rect
				
				if ByIndexEntry.visible and (ByIndexEntryRect.width > 0 and (ByIndexEntryRect.height > 0 and (ByIndexEntryRect.x < Width and (ByIndexEntryRect.y < Height and (ByIndexEntryRect.x + ByIndexEntryRect.width > 0 and ByIndexEntryRect.y + ByIndexEntryRect.height > 0))))) then
					return ByIndexEntry
				end
			end
			local Parent2 = ByIndexEntry.parent
			Parent1 = if Parent2 == nil or Parent2 >= ByIndexEntry.index then nil else Parent2
		end
		return nil
	end
	
	local t = {}
	
	for _, text in Texts do
		local Parent = text.parent
		local Parent2 = if Parent == nil or Parent >= text.index then nil else Parent
		while Parent2 ~= nil do
			local List1 = t[Parent2]
			
			if List1 == nil then
				List1 = {}
				t[Parent2] = List1
			end
			table.insert(List1, text)
			local ByIndexEntry = ByIndex[Parent2]
			
			if ByIndexEntry then
				local Parent3 = ByIndexEntry.parent
				Parent2 = if Parent3 == nil or Parent3 >= ByIndexEntry.index then nil else Parent3
			else
				Parent2 = nil
			end
		end
	end
	local t1 = {}
	
	for _, element2 in Vector.elements do
		if element2.image then
			local Width = Vector.width
			local Height = Vector.height
			local ElementRect = element2.rect
			
			if element2.visible and (ElementRect.width > 0 and (ElementRect.height > 0 and (ElementRect.x < Width and (ElementRect.y < Height and (ElementRect.x + ElementRect.width > 0 and ElementRect.y + ElementRect.height > 0))))) and element2.rect.width >= 16 and element2.rect.height >= 16 then
				local Index = element2.index
				while Index ~= nil do
					local List2 = t1[Index]
					
					if List2 == nil then
						List2 = {}
						t1[Index] = List2
					end
					table.insert(List2, element2)
					local ByIndexEntry = ByIndex[Index]
					
					if ByIndexEntry then
						local Parent = ByIndexEntry.parent
						Index = if Parent == nil or Parent >= ByIndexEntry.index then nil else Parent
					else
						Index = nil
					end
				end
			end
		end
	end
	return {
		byIndex = ByIndex,
		children = Children,
		texts = Texts,
		plates = Plates,
		plateOf = plateOf,
		descendantTexts = function(p2)
			-- upvalues: t (copy), clean (upval)
			local Text = p2.text
			local Copy = table.clone(t[p2.index] or {})
			
			if Text ~= nil and clean(Text.content) ~= "" then
				table.insert(Copy, p2)
			end
			return Copy
		end,
		parentOf = parentOf,
		descendantImages = function(p2)
			-- upvalues: t1 (copy)
			return t1[p2.index] or {}
		end,
		hasImage = function(p2): boolean
			-- upvalues: t1 (copy)
			local Largest = math.max(32, p2.rect.height * 0.25)
			local Entry = t1[p2.index] or {}
			for _, value in Entry do
				if Largest <= value.rect.height and value.rect.width >= 32 then
					return true
				end
			end
			return false
		end
	}
end

local _ = function(p2)
	return p2.text
end

return table.freeze({
	analyze = function(Vector)
		-- upvalues: prepare (copy), clean (copy), lines (copy), segments (copy), quote (copy), numbers (copy), config (copy), Frozen (copy)
		assert(type(Vector) == "table" and type(Vector.elements) == "table", "Facet review needs a snapshot")
		local PrepareResult = prepare(Vector)
		local List3 = {}
		
		local function _(Rule, Severity, p2, Detail)
			-- upvalues: List3 (copy)
			table.insert(List3, {
				rule = Rule,
				severity = Severity,
				path = p2.path,
				detail = Detail,
				rect = p2.rect
			})
		end
		
		local Texts = PrepareResult.texts
		local List4 = {}
		local List5 = {}
		
		for _, text in Texts do
			local Size = text.text.size
			table.insert(List4, Size)
			
			if not table.find(List5, Size) then
				table.insert(List5, Size)
			end
		end
		table.sort(List5)
		local v3 = nil
		
		if #List4 == 0 then
			v3 = 0
		else
			local Copy = table.clone(List4)
			table.sort(Copy)
			local Value = (#Copy + 1) / 2
			v3 = (Copy[math.floor(Value)] + Copy[math.ceil(Value)]) / 2
		end
		local ParentOfResult = nil
		for _, text1 in Texts do
			local CleanResult = clean(text1.text.content)
			local v4: boolean = #CleanResult > 120 or #lines(text1.text.content) ~= 1
			local SegmentsResult = nil
			
			if not v4 then
				SegmentsResult = segments(CleanResult)
				v4 = #SegmentsResult < 2
			end
			if not v4 then
				local Flag = false
				
				for _, value2 in SegmentsResult do
					if string.find(value2, "%d") then
						Flag = true
					end
				end
				if not Flag then
					if #SegmentsResult >= 3 then
						table.insert(List3, {
							rule = "joined-facts",
							severity = "low",
							path = text1.path,
							detail = ("%s joins %d phrases"):format(quote(CleanResult), #SegmentsResult),
							rect = text1.rect
						})
						continue
					end
					continue
				end
				local v5 = nil
				ParentOfResult = PrepareResult.parentOf(text1)
				local ByIndexEntry = nil
				while true do
					local NoByIndexEntry: boolean = ParentOfResult == nil or v5 ~= nil
					if not NoByIndexEntry then
						ByIndexEntry = PrepareResult.byIndex[ParentOfResult]
						NoByIndexEntry = ByIndexEntry == nil
					end
					if NoByIndexEntry then break end
					if ByIndexEntry.region then
						v5 = ByIndexEntry
					end
					ParentOfResult = PrepareResult.parentOf(ByIndexEntry)
				end
				ParentOfResult = v5 ~= nil
				
				if v5 then
					for _, value4 in PrepareResult.descendantTexts(v5) do
						if text1.text.size < value4.text.size then
							ParentOfResult = false
							break
						end
					end
				end
				if ParentOfResult then
					table.insert(List3, {
						rule = "joined-facts",
						severity = "high",
						path = text1.path,
						detail = ("%s joins %d facts and leads a HUD region"):format(quote(CleanResult), #SegmentsResult),
						rect = text1.rect
					})
				else
					table.insert(List3, {
						rule = "joined-facts",
						severity = "medium",
						path = text1.path,
						detail = ("%s joins %d facts"):format(quote(CleanResult), #SegmentsResult),
						rect = text1.rect
					})
				end
			end
		end
		local List7 = {}
		
		for _, text2 in Texts do
			local CleanResult: string = clean(text2.text.content)
			
			if #CleanResult <= 60 and string.find(CleanResult, "%d") then
				table.insert(List7, text2)
			end
		end
		if #List7 >= 3 then
			local Largest2 = 0
			local v6 = false
			
			for _, value5 in List7 do
				local Text = value5.text
				Largest2 = math.max(Largest2, Text.size)
				v6 = v6 or Text.bold
			end
			if Largest2 <= v3 and not v6 then
				local Entry = List7[1]
				table.insert(List3, {
					rule = "numbers-unemphasized",
					severity = "medium",
					path = Entry.path,
					detail = ("%d texts carry numbers; the largest is %g px, the common size is %g px"):format(#List7, Largest2, v3),
					rect = Entry.rect
				})
			end
		end
		if #Texts >= 5 and v3 > 0 then
			local Text1 = Texts[1]
			
			for _, text3 in Texts do
				if Text1.text.size < text3.text.size then
					Text1 = text3
				end
			end
			local SizeRatio = Text1.text.size / v3
			
			if SizeRatio < 1.35 then
				table.insert(List3, {
					rule = "flat-hierarchy",
					severity = "medium",
					path = Text1.path,
					detail = ("the largest text %s is %.2f times the common size"):format(quote((clean(Text1.text.content))), SizeRatio),
					rect = Text1.rect
				})
			end
		end
		local PlateOfResults = {}
		
		for _, text4 in Texts do
			local PlateOfResult = PrepareResult.plateOf(text4)
			local Index = if PlateOfResult then PlateOfResult.index else 0
			PlateOfResult = PlateOfResults[Index]
			
			if PlateOfResult == nil then
				PlateOfResult = {}
				PlateOfResults[Index] = PlateOfResult
			end
			table.insert(PlateOfResult, text4)
		end
		for i2, plateOfResult in PlateOfResults do
			if i2 ~= 0 and #plateOfResult >= 3 then
				local Largest4 = 0
				
				for _, value8 in plateOfResult do
					Largest4 = math.max(Largest4, value8.text.size)
				end
				local List9 = {}
				
				for _, value6 in plateOfResult do
					local Size = value6.text.size
					
					if Size < Largest4 * 0.92 then
						table.insert(List9, Size)
					end
				end
				if #List9 ~= 0 then
					local EntryRatio = nil
					if #List9 == 0 then
						EntryRatio = 0
					else
						local Copy = table.clone(List9)
						table.sort(Copy)
						local Value1 = (#Copy + 1) / 2
						EntryRatio = (Copy[math.floor(Value1)] + Copy[math.ceil(Value1)]) / 2
					end
					if Largest4 >= EntryRatio * 1.25 then
						local List10 = {}
						local t2 = {}
						local t3 = {}
						
						for _, value7 in plateOfResult do
							local CleanResult = clean(value7.text.content)
							
							if value7.text.size >= Largest4 * 0.92 and not t2[CleanResult] then
								t2[CleanResult] = true
								local ParentOfResult1 = PrepareResult.parentOf(value7) or 0
								local ByIndexEntry = PrepareResult.byIndex[ParentOfResult1]
								local Text2 = value7.class .. "|" .. tostring(value7.text.size)
								
								if ByIndexEntry ~= nil then
									Text2 ..= ("|%d|%d|%d|%d"):format(math.floor((value7.rect.x - ByIndexEntry.rect.x) / 4 + 0.5), math.floor((value7.rect.y - ByIndexEntry.rect.y) / 4 + 0.5), math.floor(ByIndexEntry.rect.width / 4 + 0.5), (math.floor(ByIndexEntry.rect.height / 4 + 0.5)))
								end
								ByIndexEntry = t3[Text2]
								
								if ByIndexEntry == nil then
									t3[Text2] = { [ParentOfResult1] = true }
									table.insert(List10, value7)
								elseif ByIndexEntry[ParentOfResult1] then
									table.insert(List10, value7)
								else
									ByIndexEntry[ParentOfResult1] = true
								end
							end
						end
						if #List10 >= 2 then
							local List11 = {}
							
							for i3, value10 in List10 do
								if i3 > 3 then break end
								table.insert(List11, (quote((clean(value10.text.content)))))
							end
							local Entry = List10[1]
							table.insert(List3, {
								rule = "competing-peaks",
								severity = "medium",
								path = Entry.path,
								detail = ("%s share the lead size %g px"):format(table.concat(List11, " and "), Largest4),
								rect = Entry.rect
							})
							continue
						end
					end
				end
			end
		end
		for _, child in PrepareResult.children do
			local List6 = {}
			
			for _, value3 in child do
				local DescendantTextsResult = PrepareResult.descendantTexts(value3)
				local Text3 = value3.text
				
				if (Text3 == nil or clean(Text3.content) == "") and #DescendantTextsResult > 0 and (#DescendantTextsResult >= 2 or value3.rect.height >= 56) then
					table.insert(List6, value3)
				end
			end
			if #List6 >= 3 then
				local Width = List6[1].rect.width
				local List12 = {}
				
				for _, value12 in List6 do
					if math.abs(value12.rect.width - Width) <= 2 then
						table.insert(List12, value12)
					end
				end
				if #List12 >= 3 then
					local Count2 = 0
					local Count3 = 0
					local Count4 = 0
					
					for _, value13 in List12 do
						if PrepareResult.hasImage(value13) then
							Count2 += 1
						end
						if value13.fillTransparency < 0.4 and (value13.rect.width >= 24 and value13.rect.height >= 24) then
							Count3 += 1
						end
						if value13.interactive then
							Count4 += 1
						end
					end
					if (Count3 == #List12 or Count4 == #List12) and Count2 * 2 < #List12 then
						local Entry = List12[1]
						table.insert(List3, {
							rule = "record-without-visual",
							severity = "medium",
							path = Entry.path,
							detail = ("%d repeated records of %dx%d px%s; %d have a visual"):format(#List12, math.floor(Entry.rect.width), math.floor(Entry.rect.height), if Count3 == #List12 then " on identical plates" else "", Count2),
							rect = Entry.rect
						})
					end
				end
			end
		end
		for _, plate in PrepareResult.plates do
			local Interactive = plate.interactive
			local PlateOfResult = nil
			
			if not Interactive then
				PlateOfResult = PrepareResult.plateOf(plate)
				Interactive = PlateOfResult == nil or PlateOfResult.interactive
			end
			if not Interactive then
				local PlateRect = plate.rect
				local PlateOfResultRect = PlateOfResult.rect
				
				if math.max(0, PlateOfResultRect.width) * math.max(0, PlateOfResultRect.height) * 0.08 <= math.max(0, PlateRect.width) * math.max(0, PlateRect.height) and 0.4 * PlateOfResult.rect.width <= plate.rect.width then
					local Fill = plate.fill
					local Fill1 = PlateOfResult.fill
					
					if math.max(math.abs(Fill.r - Fill1.r), math.abs(Fill.g - Fill1.g), (math.abs(Fill.b - Fill1.b))) <= 0.12 and #PrepareResult.descendantTexts(plate) > 0 then
						table.insert(List3, {
							rule = "nested-surface",
							severity = "low",
							path = plate.path,
							detail = ("a plate of %dx%d px inside a plate of nearly the same color"):format(math.floor(plate.rect.width), (math.floor(plate.rect.height))),
							rect = plate.rect
						})
					end
				end
			end
		end
		local Count1 = 0
		local Count5 = 0
		
		for _, text5 in Texts do
			for _, value11 in numbers((clean(text5.text.content))) do
				Count5 += 1
				
				if value11 == 0 then
					Count1 += 1
				end
			end
		end
		if Count1 >= 3 and Count5 <= Count1 * 2 then
			local v7 = nil
			
			for _, text8 in Texts do
				if v7 == nil and table.find(numbers((clean(text8.text.content))), 0) then
					v7 = text8
				end
			end
			if v7 ~= nil then
				table.insert(List3, {
					rule = "zero-wall",
					severity = "low",
					path = v7.path,
					detail = ("%d of %d numbers are zero"):format(Count1, Count5),
					rect = v7.rect
				})
			end
		end
		if #Texts >= 6 then
			local Bold = Texts[1].text.bold
			local TextFont = Texts[1].text.font
			local Flag3 = true
			
			for _, text9 in Texts do
				local Text4 = text9.text
				
				if Text4.bold ~= Bold or Text4.font ~= TextFont then
					Flag3 = false
					break
				end
			end
			if Flag3 then
				local Text5 = Texts[1]
				table.insert(List3, {
					rule = "single-weight",
					severity = "low",
					path = Text5.path,
					detail = ("%d texts in one font and one weight"):format(#Texts),
					rect = Text5.rect
				})
			end
		end
		for i, child1 in PrepareResult.children do
			local ByIndexEntry = PrepareResult.byIndex[i]
			
			if ByIndexEntry ~= nil and ByIndexEntry.rect.width > 0 then
				local List14 = {}
				local Largest1 = 0
				
				for _, value1 in child1 do
					if value1.interactive then
						local DescendantTextsResult = PrepareResult.descendantTexts(value1)
						
						if #DescendantTextsResult == 1 and (utf8.len((clean(DescendantTextsResult[1].text.content))) or 0) <= 24 then
							table.insert(List14, value1)
							Largest1 = math.max(Largest1, value1.rect.width)
						end
					end
				end
				if #List14 >= 4 and 0.6 * ByIndexEntry.rect.width >= Largest1 then
					table.sort(List14, function(A, B): boolean
						return A.rect.y < B.rect.y
					end)
					local v8 = 1
					local Largest = 1
					
					for i1 = 2, #List14 do
						local _Rect = List14[i1 - 1].rect
						local _Rect3 = List14[i1].rect
						
						if (math.abs(_Rect.x - _Rect3.x) < 8 or math.abs(_Rect.x + _Rect.width / 2 - (_Rect3.x + _Rect3.width / 2)) < 8) and _Rect.y + _Rect.height - 2 <= _Rect3.y then
							v8 += 1
							Largest = math.max(Largest, v8)
						else
							v8 = 1
						end
					end
					if Largest >= 4 then
						table.insert(List3, {
							rule = "stacked-choices",
							severity = "medium",
							path = ByIndexEntry.path,
							detail = ("%d short choices stacked one per row in a %d px wide space; the widest is %d px"):format(Largest, math.floor(ByIndexEntry.rect.width), (math.floor(Largest1))),
							rect = ByIndexEntry.rect
						})
					end
				end
			end
		end
		local List16 = {}
		
		for _, element1 in Vector.elements do
			local Width = Vector.width
			local Height = Vector.height
			local _Rect = element1.rect
			
			if element1.visible and (_Rect.width > 0 and (_Rect.height > 0 and (_Rect.x < Width and (_Rect.y < Height and (_Rect.x + _Rect.width > 0 and _Rect.y + _Rect.height > 0))))) then
				local Text6 = element1.text
				
				if element1.interactive or element1.image and (element1.rect.width >= 16 and element1.rect.height >= 16) or Text6 ~= nil and Text6.transparency < 0.95 and clean(Text6.content) ~= "" then
					table.insert(List16, element1)
				end
			end
		end
		local _ = function(Vector, p2): boolean
			local NewX = p2.rect.x + p2.rect.width / 2
			local NewY = p2.rect.y + p2.rect.height / 2
			
			return Vector.x <= NewX and (NewX <= Vector.x + Vector.width and Vector.y <= NewY) and NewY <= Vector.y + Vector.height
		end
		
		local function ancestorOf(p2, p3): boolean
			-- upvalues: PrepareResult (copy)
			local ParentOfResult = PrepareResult.parentOf(p3)
			while ParentOfResult ~= nil do
				if ParentOfResult == p2.index then
					return true
				end
				local ByIndexEntry = PrepareResult.byIndex[ParentOfResult]
				ParentOfResult = if ByIndexEntry then PrepareResult.parentOf(ByIndexEntry) else nil
			end
			return false
		end
		
		local t = {}
		
		local function inside(p4)
			-- upvalues: t (copy), List16 (copy), ancestorOf (copy)
			local Entry = t[p4.index]
			
			if Entry ~= nil then
				return Entry
			end
			local List = {}
			
			for _, value in List16 do
				if value ~= p4 then
					local ValueRect = value.rect
					local _Rect = p4.rect
					
					if math.max(0, ValueRect.width) * math.max(0, ValueRect.height) < math.max(0, _Rect.width) * math.max(0, _Rect.height) then
						local _Rect1 = p4.rect
						local NewX = value.rect.x + value.rect.width / 2
						local NewY = value.rect.y + value.rect.height / 2
						
						if _Rect1.x <= NewX and (NewX <= _Rect1.x + _Rect1.width and (_Rect1.y <= NewY and NewY <= _Rect1.y + _Rect1.height)) and not ancestorOf(value, p4) then
							table.insert(List, value)
						end
					end
				end
			end
			t[p4.index] = List
			
			return List
		end
		
		local function bounds(List, Vector)
			local Smallest = 1e999
			local Smallest1 = 1e999
			local Largest = -1e999
			local Largest1 = -1e999
			
			for _, value in List do
				local _Rect = value.rect
				Smallest = math.min(Smallest, (math.max(_Rect.x, Vector.x)))
				Smallest1 = math.min(Smallest1, (math.max(_Rect.y, Vector.y)))
				Largest = math.max(Largest, (math.min(_Rect.x + _Rect.width, Vector.x + Vector.width)))
				Largest1 = math.max(Largest1, (math.min(_Rect.y + _Rect.height, Vector.y + Vector.height)))
			end
			return if Largest <= Smallest or Largest1 <= Smallest1 then nil else {
				x = Smallest,
				y = Smallest1,
				width = Largest - Smallest,
				height = Largest1 - Smallest1
			}
		end
		
		local Largest3 = math.max(1, Vector.width * Vector.height)
		local t4 = {}
		local List8 = {}
		
		for _, plate1 in PrepareResult.plates do
			if not plate1.interactive and plate1.rect.width >= 280 then
				local _Rect = plate1.rect
				local IsLargestBelow1 = math.max(0, _Rect.width) * math.max(0, _Rect.height) < 40000
				
				if not IsLargestBelow1 then
					local PlateRect = plate1.rect
					IsLargestBelow1 = Largest3 * 0.35 <= math.max(0, PlateRect.width) * math.max(0, PlateRect.height)
				end
				if not IsLargestBelow1 then
					local InsideResult = inside(plate1)
					local v9 = #InsideResult == 0
					local BoundsResult = nil
					
					if not v9 then
						BoundsResult = bounds(InsideResult, plate1.rect)
						v9 = BoundsResult == nil
					end
					if not v9 then
						local PlateRect = plate1.rect
						
						if math.max(0, BoundsResult.width) * math.max(0, BoundsResult.height) < math.max(0, PlateRect.width) * math.max(0, PlateRect.height) * 0.35 then
							local Text7: string = ("%d:%d"):format(math.floor(plate1.rect.width / 8), (math.floor(plate1.rect.height / 8)))
							local List15 = t4[Text7]
							
							if List15 == nil then
								List15 = {}
								t4[Text7] = List15
								table.insert(List8, Text7)
							end
							table.insert(List15, plate1)
						end
					end
				end
			end
		end
		for _, value15 in List8 do
			local Entry = t4[value15]
			local Entry1 = Entry[1]
			local BoundsResult = bounds(inside(Entry1), Entry1.rect)
			local EntryRect = Entry1.rect
			table.insert(List3, {
				rule = "hollow-plate",
				severity = "medium",
				path = Entry1.path,
				detail = ("%d plate(s) of %dx%d px; the content uses %d%% of each"):format(#Entry, math.floor(Entry1.rect.width), math.floor(Entry1.rect.height), (math.floor(math.max(0, BoundsResult.width) * math.max(0, BoundsResult.height) * 100 / (math.max(0, EntryRect.width) * math.max(0, EntryRect.height))))),
				rect = Entry1.rect
			})
		end
		if Vector.width >= 900 then
			for _, plate2 in PrepareResult.plates do
				local IsWidthBelow = plate2.rect.width < 0.8 * Vector.width
				
				if not IsWidthBelow then
					local PlateRect = plate2.rect
					IsWidthBelow = math.max(0, PlateRect.width) * math.max(0, PlateRect.height) < Largest3 * 0.6
				end
				local v10: boolean = IsWidthBelow
				local InsideResult = nil
				
				if not v10 then
					InsideResult = inside(plate2)
					v10 = #InsideResult < 3
				end
				if not v10 then
					local NewX = plate2.rect.x + plate2.rect.width / 2
					local v11 = 0
					local v12 = 0
					
					for _, value9 in InsideResult do
						local _Rect = value9.rect
						local _Rect1 = plate2.rect
						local Smallest = math.min(math.max(0, _Rect.width) * math.max(0, _Rect.height), math.max(0, _Rect1.width) * math.max(0, _Rect1.height))
						
						if value9.rect.x + value9.rect.width / 2 < NewX then
							v11 += Smallest
						else
							v12 += Smallest
						end
					end
					local v13 = v11 + v12
					
					if v13 > 0 and v13 * 0.85 <= math.max(v11, v12) then
						table.insert(List3, {
							rule = "lopsided-page",
							severity = "medium",
							path = plate2.path,
							detail = ("%d%% of the content sits in one half of a %d px wide surface"):format(math.floor(math.max(v11, v12) * 100 / v13), (math.floor(plate2.rect.width))),
							rect = plate2.rect
						})
					end
				end
			end
		end
		local function overlap(Vector, Vector1)
			local Largest = math.max(Vector.x, Vector1.x)
			local Largest1 = math.max(Vector.y, Vector1.y)
			local Smallest = math.min(Vector.x + Vector.width, Vector1.x + Vector1.width)
			local Smallest1 = math.min(Vector.y + Vector.height, Vector1.y + Vector1.height)
			
			return if Smallest <= Largest or Smallest1 <= Largest1 then nil else {
				x = Largest,
				y = Largest1,
				width = Smallest - Largest,
				height = Smallest1 - Largest1
			}
		end
		
		local function lineage(Element)
			-- upvalues: PrepareResult (copy)
			local ByIndexEntries = {}
			local ParentOfResult = PrepareResult.parentOf(Element)
			while ParentOfResult ~= nil do
				local ByIndexEntry = PrepareResult.byIndex[ParentOfResult]
				
				if ByIndexEntry == nil then break end
				table.insert(ByIndexEntries, ByIndexEntry)
				ParentOfResult = PrepareResult.parentOf(ByIndexEntry)
			end
			return ByIndexEntries
		end
		
		local function inkOf(Element, Chain)
			-- upvalues: overlap (copy)
			local Ink = Element.text.ink
			
			for _, value in Chain do
				if Ink == nil then break end
				if value.clips then
					Ink = overlap(Ink, value.rect)
				end
			end
			return Ink
		end
		
		local _ = function(p5, Vector): boolean
			-- upvalues: overlap (copy)
			local IsHeightAbove = p5.fillTransparency < 0.4 and (p5.rect.width >= 24 and p5.rect.height >= 24)
			
			if not IsHeightAbove then
				IsHeightAbove = p5.image
				
				if IsHeightAbove then
					local Paint = p5.paint
					local _Rect = if Paint == nil or not p5.image then p5.rect elseif p5.fillTransparency < 0.4 and (p5.rect.width >= 24 and p5.rect.height >= 24) then p5.rect else Paint
					IsHeightAbove = math.max(0, _Rect.width) * math.max(0, _Rect.height) > 0
				end
			end
			if IsHeightAbove then
				local Paint = p5.paint
				local OverlapResult = overlap(if Paint == nil or not p5.image then p5.rect elseif p5.fillTransparency < 0.4 and (p5.rect.width >= 24 and p5.rect.height >= 24) then p5.rect else Paint, Vector)
				
				return OverlapResult ~= nil and math.max(0, Vector.width) * math.max(0, Vector.height) * 0.9 <= math.max(0, OverlapResult.width) * math.max(0, OverlapResult.height)
			else
				return false
			end
		end
		
		local function covered(Chain, List, Vector): boolean
			-- upvalues: overlap (copy), PrepareResult (copy)
			for _, value in Chain do
				if table.find(List, value) then
					return false
				end
				local IsHeightAbove = value.fillTransparency < 0.4 and (value.rect.width >= 24 and value.rect.height >= 24)
				
				if not IsHeightAbove then
					IsHeightAbove = value.image
					
					if IsHeightAbove then
						local Paint = value.paint
						local ValueRect = if Paint == nil or not value.image then value.rect elseif value.fillTransparency < 0.4 and (value.rect.width >= 24 and value.rect.height >= 24) then value.rect else Paint
						IsHeightAbove = math.max(0, ValueRect.width) * math.max(0, ValueRect.height) > 0
					end
				end
				local IsLargestAbove = nil
				if IsHeightAbove then
					local Paint = value.paint
					local OverlapResult = overlap(if Paint == nil or not value.image then value.rect elseif value.fillTransparency < 0.4 and (value.rect.width >= 24 and value.rect.height >= 24) then value.rect else Paint, Vector)
					IsLargestAbove = OverlapResult ~= nil and math.max(0, OverlapResult.width) * math.max(0, OverlapResult.height) >= math.max(0, Vector.width) * math.max(0, Vector.height) * 0.9
				else
					IsLargestAbove = false
				end
				if IsLargestAbove then
					return true
				end
				local Child = PrepareResult.children[value.index]
				
				if Child ~= nil then
					for _, value1 in Child do
						local IsHeightAbove1 = value1.fillTransparency < 0.4 and (value1.rect.width >= 24 and value1.rect.height >= 24)
						
						if not IsHeightAbove1 then
							IsHeightAbove1 = value1.image
							
							if IsHeightAbove1 then
								local Paint = value1.paint
								local ValueRect = if Paint == nil or not value1.image then value1.rect elseif value1.fillTransparency < 0.4 and (value1.rect.width >= 24 and value1.rect.height >= 24) then value1.rect else Paint
								IsHeightAbove1 = math.max(0, ValueRect.width) * math.max(0, ValueRect.height) > 0
							end
						end
						local IsLargestAbove1 = nil
						if IsHeightAbove1 then
							local Paint = value1.paint
							local OverlapResult = overlap(if Paint == nil or not value1.image then value1.rect elseif value1.fillTransparency < 0.4 and (value1.rect.width >= 24 and value1.rect.height >= 24) then value1.rect else Paint, Vector)
							IsLargestAbove1 = OverlapResult ~= nil and math.max(0, OverlapResult.width) * math.max(0, OverlapResult.height) >= math.max(0, Vector.width) * math.max(0, Vector.height) * 0.9
						else
							IsLargestAbove1 = false
						end
						if IsLargestAbove1 then
							return true
						end
					end
				end
			end
			return false
		end
		
		local List17 = {}
		
		for _, text6 in Texts do
			local NoInkOfResult = text6.text.size < 8
			local LineageResult = nil
			local InkOfResult = nil
			
			if not NoInkOfResult then
				LineageResult = lineage(text6)
				InkOfResult = inkOf(text6, LineageResult)
				NoInkOfResult = InkOfResult == nil or (InkOfResult.width < 4 or InkOfResult.height < 4)
			end
			if not NoInkOfResult then
				table.insert(List17, {
					element = text6,
					ink = InkOfResult,
					chain = LineageResult
				})
			end
		end
		local Count6 = 0
		local Entry2 = nil
		local Entry = nil
		
		for i4 = 1, #List17 do
			if Count6 >= 3 then break end
			Entry = List17[i4]
			
			for i5 = i4 + 1, #List17 do
				Entry2 = List17[i5]
				local OverlapResult = overlap(Entry.ink, Entry2.ink)
				local NoOverlapResult = OverlapResult == nil or (OverlapResult.width < 4 or OverlapResult.height < 4)
				
				if not NoOverlapResult then
					local Ink = Entry.ink
					local Ink1 = Entry2.ink
					NoOverlapResult = math.max(0, OverlapResult.width) * math.max(0, OverlapResult.height) < math.min(math.max(0, Ink.width) * math.max(0, Ink.height), math.max(0, Ink1.width) * math.max(0, Ink1.height)) * 0.2 or (table.find(Entry.chain, Entry2.element) or table.find(Entry2.chain, Entry.element) or clean(Entry.element.text.content) == clean(Entry2.element.text.content) or covered(Entry.chain, Entry2.chain, OverlapResult) or covered(Entry2.chain, Entry.chain, OverlapResult))
				end
				if NoOverlapResult then
					continue
				end
				local Element1 = Entry.element
				table.insert(List3, {
					rule = "overlapping-text",
					severity = "high",
					path = Element1.path,
					detail = ("%s overlaps %s"):format(quote((clean(Entry.element.text.content))), (quote((clean(Entry2.element.text.content))))),
					rect = Element1.rect
				})
				Count6 += 1
				break
			end
		end
		local ScaledWidth = Vector.width * Vector.height * 0.35
		local t5 = {}
		local List13 = {}
		local Element2 = nil
		local v14 = nil
		
		for _, value16 in List17 do
			Element2 = value16.element
			
			for _, element3 in Vector.elements do
				if element3 ~= Element2 and element3.parent ~= Element2.parent and table.find(value16.chain, element3) == nil then
					local IsHeightAbove2 = element3.fillTransparency < 0.4 and (element3.rect.width >= 24 and element3.rect.height >= 24)
					
					if not IsHeightAbove2 then
						IsHeightAbove2 = element3.image
						
						if IsHeightAbove2 then
							local Paint = element3.paint
							local ElementRect = if Paint == nil or not element3.image then element3.rect elseif element3.fillTransparency < 0.4 and (element3.rect.width >= 24 and element3.rect.height >= 24) then element3.rect else Paint
							IsHeightAbove2 = math.max(0, ElementRect.width) * math.max(0, ElementRect.height) > 0
						end
					end
					if IsHeightAbove2 then
						local ElementRect = element3.rect
						
						if ScaledWidth > math.max(0, ElementRect.width) * math.max(0, ElementRect.height) and (element3.turn or 0) <= 10 then
							local Width = Vector.width
							local Height = Vector.height
							local ElementRect1 = element3.rect
							
							if element3.visible and (ElementRect1.width > 0 and (ElementRect1.height > 0 and (ElementRect1.x < Width and (ElementRect1.y < Height and (ElementRect1.x + ElementRect1.width > 0 and ElementRect1.y + ElementRect1.height > 0))))) then
								local Callback = overlap
								local Paint = element3.paint
								Callback = Callback(if Paint == nil or not element3.image then element3.rect elseif element3.fillTransparency < 0.4 and (element3.rect.width >= 24 and element3.rect.height >= 24) then element3.rect else Paint, value16.ink)
								local NoCallback = Callback == nil
								
								if not NoCallback then
									local Ink = value16.ink
									NoCallback = math.max(0, Callback.width) * math.max(0, Callback.height) < math.max(0, Ink.width) * math.max(0, Ink.height) * 0.5
								end
								if not NoCallback then
									local List1 = lineage(element3)
									v14 = nil
									local v15 = Element2
									
									for _, value19 in value16.chain do
										if table.find(List1, value19) then
											v14 = value19
											break
										else
											v15 = value19
											continue
										end
									end
									if v14 ~= nil and not v14.fan then
										local element6 = element3
										
										for _, value21 in List1 do
											if value21 == v14 then break end
											element6 = value21
										end
										local Z = v15.z or 1
										local Z1 = element6.z or 1
										
										if Z1 >= Z and (Z ~= Z1 or element6.index >= v15.index) then
											local List = t5[element3.index]
											
											if List == nil then
												List = {}
												t5[element3.index] = List
												table.insert(List13, element3)
											end
											table.insert(List, Element2)
											break
										end
									end
								end
							end
						end
					end
				end
			end
		end
		local Count8 = 0
		
		for _, value18 in List13 do
			local Entry3 = t5[value18.index]
			
			if #Entry3 <= 2 and Count8 < 3 then
				local Entry31 = Entry3[1]
				table.insert(List3, {
					rule = "covered-text",
					severity = "medium",
					path = Entry31.path,
					detail = ("%s is under %s"):format(quote((clean(Entry3[1].text.content))), (quote(string.match(value18.path, "[^%.]+$") or value18.class))),
					rect = Entry31.rect
				})
				Count8 += 1
			end
		end
		local t6 = {}
		
		local _ = function(p5)
			-- upvalues: t6 (copy), lineage (copy)
			local Entry = t6[p5.index]
			
			if Entry == nil then
				Entry = lineage(p5)
				t6[p5.index] = Entry
			end
			return Entry
		end
		
		local function beneath(Value, Value1): boolean
			-- upvalues: t6 (copy), lineage (copy)
			local Entry = t6[Value.index]
			
			if Entry == nil then
				Entry = lineage(Value)
				t6[Value.index] = Entry
			end
			local Entry1 = t6[Value1.index]
			
			if Entry1 == nil then
				Entry1 = lineage(Value1)
				t6[Value1.index] = Entry1
			end
			if table.find(Entry1, Value) then
				return true
			end
			if table.find(Entry, Value1) then
				return false
			end
			local Value2 = Value1
			
			for _, value in Entry1 do
				if not table.find(Entry, value) then
					Value2 = value
					continue
				end
				local Value3 = Value
				
				for _, value1 in Entry do
					if value1 == value then break end
					Value3 = value1
				end
				local Z = Value3.z or 1
				local Z1 = Value2.z or 1
				
				return Z < Z1 or Z == Z1 and Value3.index < Value2.index
			end
			return false
		end
		
		local _ = function(p5)
			-- upvalues: quote (upval)
			return (quote(string.match(p5.path, "[^%.]+$") or p5.class))
		end
		
		local function past(Ink, Vector, Size: number): boolean
			local Largest = math.max(Vector.y - Ink.y, Ink.y + Ink.height - Vector.y - Vector.height)
			
			return math.max(4, Size * 0.3) <= math.max(Vector.x - Ink.x, Ink.x + Ink.width - Vector.x - Vector.width) or math.max(3, Size * 0.25) <= Largest
		end
		
		local _ = function(p5, Vector)
			-- upvalues: overlap (copy)
			local Paint = p5.paint
			local _Rect = if Paint == nil or not p5.image then p5.rect elseif p5.fillTransparency < 0.4 and (p5.rect.width >= 24 and p5.rect.height >= 24) then p5.rect else Paint
			local OverlapResult = overlap(_Rect, Vector)
			
			return if OverlapResult == nil or math.max(0, Vector.width) * math.max(0, Vector.height) * 0.5 > math.max(0, OverlapResult.width) * math.max(0, OverlapResult.height) then p5.rect else _Rect
		end
		
		local _ = function(p5, List): boolean
			for i, value in List do
				if value == p5 or i <= 3 and value.index == p5.parent then
					return true
				end
			end
			return false
		end
		
		local _ = function(p6, List): boolean
			if p6.ground ~= true or not p6.image then
				return false
			end
			for _, value in List do
				if value.index == p6.parent then
					return true
				end
			end
			return false
		end
		
		local Count = 0
		local Flag = nil
		local Flag1 = nil
		local Flag2 = nil
		
		for _, value in List17 do
			if Count >= 3 then break end
			local Element3 = value.element
			
			if (Element3.turn or 0) <= 1 then
				local Text9 = Element3.text
				local v16 = nil
				local Vector2 = Text9.ink
				
				for _, value22 in value.chain do
					if Vector2 == nil then break end
					if value22.clips then
						local OverlapResult = overlap(Vector2, value22.rect)
						
						if v16 == nil and (value22.class ~= "ScrollingFrame" and past(Vector2, value22.rect, Text9.size)) then
							v16 = value22
						end
						Vector2 = OverlapResult
					end
				end
				if v16 == nil then
					local Ink = value.ink
					local IsHeightAbove: boolean = Element3.fillTransparency < 0.4 and Element3.rect.width >= 24 and Element3.rect.height >= 24
					local Element = if IsHeightAbove then Element3 else nil
					IsHeightAbove = false
					
					if Element == nil then
						for _, element4 in Vector.elements do
							if element4 ~= Element3 then
								local IsHeightAbove1 = element4.fillTransparency < 0.4 and (element4.rect.width >= 24 and element4.rect.height >= 24)
								
								if not IsHeightAbove1 then
									IsHeightAbove1 = element4.image
									
									if IsHeightAbove1 then
										local Paint = element4.paint
										local ElementRect = if Paint == nil or not element4.image then element4.rect elseif element4.fillTransparency < 0.4 and (element4.rect.width >= 24 and element4.rect.height >= 24) then element4.rect else Paint
										IsHeightAbove1 = math.max(0, ElementRect.width) * math.max(0, ElementRect.height) > 0
									end
								end
								if IsHeightAbove1 then
									local Width = Vector.width
									local Height = Vector.height
									local ElementRect = element4.rect
									
									if element4.visible and (ElementRect.width > 0 and (ElementRect.height > 0 and (ElementRect.x < Width and (ElementRect.y < Height and (ElementRect.x + ElementRect.width > 0 and ElementRect.y + ElementRect.height > 0))))) then
										local Chain1 = value.chain
										
										if element4.ground == true and element4.image then
											Flag2 = false
											
											for _, value14 in Chain1 do
												if value14.index == element4.parent then
													Flag2 = true
													break
												end
											end
										else
											Flag2 = false
										end
										Chain1 = overlap(element4.rect, Ink)
										
										if (Flag2 or Chain1 ~= nil and math.max(0, Chain1.width) * math.max(0, Chain1.height) >= math.max(0, Ink.width) * math.max(0, Ink.height) * 0.5) and beneath(element4, Element3) then
											local ElementRect1 = nil
											if Flag2 then
												local Paint = element4.paint
												ElementRect1 = if Paint == nil or not element4.image then element4.rect elseif element4.fillTransparency < 0.4 and (element4.rect.width >= 24 and element4.rect.height >= 24) then element4.rect else Paint
											else
												local Paint = element4.paint
												local ElementRect2 = if Paint == nil or not element4.image then element4.rect elseif element4.fillTransparency < 0.4 and (element4.rect.width >= 24 and element4.rect.height >= 24) then element4.rect else Paint
												Paint = overlap(ElementRect2, Ink)
												ElementRect1 = if Paint == nil or math.max(0, Ink.width) * math.max(0, Ink.height) * 0.5 > math.max(0, Paint.width) * math.max(0, Paint.height) then element4.rect else ElementRect2
											end
											local _Rect = element4.rect
											
											if math.max(0, _Rect.width) * math.max(0, _Rect.height) < ScaledWidth and not past(Ink, ElementRect1, Text9.size) then
												IsHeightAbove = true
											end
											if Element == nil or beneath(Element, element4) then
												Element = element4
											end
										end
									end
								end
							end
						end
					end
					if Element ~= nil and (not IsHeightAbove or Element == Element3) and (Element.turn or 0) <= 1 then
						local Chain = value.chain
						
						if Element.ground == true and Element.image then
							Flag = false
							
							for _, value20 in Chain do
								if value20.index == Element.parent then
									Flag = true
									break
								end
							end
						else
							Flag = false
						end
						local _Rect2 = nil
						if Flag then
							local Paint = Element.paint
							_Rect2 = if Paint == nil or not Element.image then Element.rect elseif Element.fillTransparency < 0.4 and (Element.rect.width >= 24 and Element.rect.height >= 24) then Element.rect else Paint
						else
							local Paint = Element.paint
							local _Rect = if Paint == nil or not Element.image then Element.rect elseif Element.fillTransparency < 0.4 and (Element.rect.width >= 24 and Element.rect.height >= 24) then Element.rect else Paint
							Paint = overlap(_Rect, Ink)
							_Rect2 = if Paint == nil or math.max(0, Ink.width) * math.max(0, Ink.height) * 0.5 > math.max(0, Paint.width) * math.max(0, Paint.height) then Element.rect else _Rect
						end
						local _Rect = Element.rect
						
						if ScaledWidth > math.max(0, _Rect.width) * math.max(0, _Rect.height) and past(Ink, _Rect2, Text9.size) then
							if Element ~= Element3 and ((Element.fillTransparency >= 0.4 or (Element.rect.width < 24 or Element.rect.height < 24)) and not Flag) then
								local Vector1 = overlap(Element.rect, Ink)
								
								if Vector1 ~= nil and math.max(0, Vector1.width) * math.max(0, Vector1.height) >= math.max(0, Ink.width) * math.max(0, Ink.height) * 0.7 then
									Flag1 = false
									
									for i6, value17 in value.chain do
										if value17 == Element or i6 <= 3 and value17.index == Element.parent then
											Flag1 = true
											break
										end
									end
									if not Flag1 then
										continue
									end
								else
									continue
								end
							end
							table.insert(List3, {
								rule = "escaped-text",
								severity = "medium",
								path = Element3.path,
								detail = ("%s runs past the edge of %s"):format(quote((clean(Text9.content))), (quote(string.match(Element.path, "[^%.]+$") or Element.class))),
								rect = Element3.rect
							})
							Count += 1
						end
					end
				else
					table.insert(List3, {
						rule = "escaped-text",
						severity = "medium",
						path = Element3.path,
						detail = ("%s is cut by %s"):format(quote((clean(Text9.content))), (quote(string.match(v16.path, "[^%.]+$") or v16.class))),
						rect = Element3.rect
					})
					Count += 1
				end
			end
		end
		local Vector3 = {
			x = 0,
			y = 0,
			width = Vector.width,
			height = Vector.height
		}
		local v17 = 0
		local Count7 = 0
		local Flag21 = nil
		
		for _, element in Vector.elements do
			if v17 >= 3 and Count7 >= 3 then break end
			local Text = element.text
			
			if Text ~= nil and element.visible and Text.size >= 8 and clean(Text.content) ~= "" then
				local IsHeightAbove: boolean = element.rect.width < 1 and element.rect.height >= 4
				local Ink = Text.ink or element.rect
				local OverlapResult1 = overlap(Ink, Vector3)
				local NoOverlapResult1: boolean = Ink.width >= 4 and (Ink.height >= 4 and (OverlapResult1 == nil or math.max(0, OverlapResult1.width) * math.max(0, OverlapResult1.height) < math.max(0, Ink.width) * math.max(0, Ink.height) * 0.5))
				
				if IsHeightAbove or NoOverlapResult1 then
					local LineageResult = lineage(element)
					local LineageResultEntry = if IsHeightAbove then nil else LineageResult[1]
					Flag21 = false
					
					for _, value23 in LineageResult do
						local _Rect = value23.rect
						local IsLargestBelow2 = math.max(0, _Rect.width) * math.max(0, _Rect.height) <= 0
						
						if not value23.visible or value23.clips and (IsLargestBelow2 or not IsHeightAbove) then
							Flag21 = true
							break
						elseif LineageResultEntry == nil and not IsLargestBelow2 then
							LineageResultEntry = value23
						end
					end
					LineageResult = if LineageResultEntry then overlap(LineageResultEntry.rect, Vector3) else nil
					local IsLargestBelow: boolean = Flag21 or LineageResultEntry == nil or LineageResult == nil
					
					if not IsLargestBelow then
						local _Rect = LineageResultEntry.rect
						IsLargestBelow = math.max(0, LineageResult.width) * math.max(0, LineageResult.height) < math.max(0, _Rect.width) * math.max(0, _Rect.height) * 0.5
					end
					if not IsLargestBelow then
						local QuoteResult = quote((clean(Text.content)))
						
						if IsHeightAbove and Count7 < 3 then
							table.insert(List3, {
								rule = "collapsed-text",
								severity = "high",
								path = element.path,
								detail = ("%s has no width"):format(QuoteResult),
								rect = element.rect
							})
							Count7 += 1
						elseif NoOverlapResult1 and v17 < 3 then
							table.insert(List3, {
								rule = "offscreen-text",
								severity = "high",
								path = element.path,
								detail = ("%s is outside the screen"):format(QuoteResult),
								rect = element.rect
							})
							v17 += 1
						end
					end
				end
			end
		end
		local List21 = {}
		
		for _, text7 in Texts do
			if text7.text.native == true and text7.text.size >= 8 then
				table.insert(List21, text7)
			end
		end
		if #List21 >= 3 then
			local v18 = List21[1]
			table.insert(List3, {
				rule = "native-text",
				severity = "medium",
				path = v18.path,
				detail = ("%d texts were not built with UI.Text, such as %s"):format(#List21, (quote((clean(List21[1].text.content))))),
				rect = v18.rect
			})
		end
		local List20 = {}
		
		for _, element5 in Vector.elements do
			if element5.image then
				local _Rect = element5.rect
				
				if Vector.width * Vector.height * 0.25 <= math.max(0, _Rect.width) * math.max(0, _Rect.height) then
					table.insert(List20, element5)
				end
			end
		end
		local List18 = {}
		
		for _, element2 in Vector.elements do
			if element2.image and element2.text == nil then
				local Width = Vector.width
				local Height = Vector.height
				local ElementRect = element2.rect
				
				if element2.visible and (ElementRect.width > 0 and (ElementRect.height > 0 and (ElementRect.x < Width and (ElementRect.y < Height and (ElementRect.x + ElementRect.width > 0 and ElementRect.y + ElementRect.height > 0))))) then
					table.insert(List18, element2)
				end
			end
		end
		local List19 = {}
		local HasPlateOfResult = nil
		
		for _, text10 in Texts do
			local Text10 = text10.text
			
			if Text10.size >= 12 and utf8.len((clean(Text10.content))) ~= nil and (utf8.len((clean(Text10.content))) or 0) >= 2 then
				HasPlateOfResult = PrepareResult.plateOf(text10) ~= nil
				
				if not HasPlateOfResult then
					for _, plate4 in PrepareResult.plates do
						local _Rect = plate4.rect
						local TextRect = text10.rect
						
						if math.max(0, TextRect.width) * math.max(0, TextRect.height) < math.max(0, _Rect.width) * math.max(0, _Rect.height) then
							local PlateRect = plate4.rect
							local NewX1 = text10.rect.x + text10.rect.width / 2
							local NewY = text10.rect.y + text10.rect.height / 2
							
							if PlateRect.x <= NewX1 and (NewX1 <= PlateRect.x + PlateRect.width and (PlateRect.y <= NewY and NewY <= PlateRect.y + PlateRect.height)) then
								HasPlateOfResult = true
								break
							end
						end
					end
				end
				if not HasPlateOfResult then
					for _, value26 in List20 do
						local _Rect = value26.rect
						local NewX2 = text10.rect.x + text10.rect.width / 2
						local NewY = text10.rect.y + text10.rect.height / 2
						
						if _Rect.x <= NewX2 and (NewX2 <= _Rect.x + _Rect.width and (_Rect.y <= NewY and NewY <= _Rect.y + _Rect.height)) then
							HasPlateOfResult = true
							break
						end
					end
				end
				if not HasPlateOfResult then
					for _, value28 in List18 do
						if value28 ~= text10 then
							local TextRect = text10.rect
							local ImageFunction = value28.fillTransparency < 0.4 and (value28.rect.width >= 24 and value28.rect.height >= 24)
							
							if not ImageFunction then
								ImageFunction = value28.image
								
								if ImageFunction then
									local Paint = value28.paint
									local ValueRect = if Paint == nil or not value28.image then value28.rect elseif value28.fillTransparency < 0.4 and (value28.rect.width >= 24 and value28.rect.height >= 24) then value28.rect else Paint
									ImageFunction = math.max(0, ValueRect.width) * math.max(0, ValueRect.height) > 0
								end
							end
							local IsLargestAbove = nil
							if ImageFunction then
								ImageFunction = overlap
								local Paint = value28.paint
								ImageFunction = ImageFunction(if Paint == nil or not value28.image then value28.rect elseif value28.fillTransparency < 0.4 and (value28.rect.width >= 24 and value28.rect.height >= 24) then value28.rect else Paint, TextRect)
								IsLargestAbove = ImageFunction ~= nil and math.max(0, ImageFunction.width) * math.max(0, ImageFunction.height) >= math.max(0, TextRect.width) * math.max(0, TextRect.height) * 0.9
							else
								IsLargestAbove = false
							end
							if IsLargestAbove and beneath(value28, text10) then
								HasPlateOfResult = true
								break
							end
						end
					end
				end
				local Interactive1 = HasPlateOfResult
				
				if not Interactive1 then
					local ParentOfResult1 = PrepareResult.parentOf(text10)
					local ByIndexEntry = if ParentOfResult1 == nil then nil else PrepareResult.byIndex[ParentOfResult1]
					Interactive1 = text10.interactive or ByIndexEntry ~= nil and ByIndexEntry.interactive
				end
				if not Interactive1 then
					table.insert(List19, text10)
				end
			end
		end
		if #List19 >= 3 then
			local Entry4 = List19[1]
			table.insert(List3, {
				rule = "floating-text",
				severity = "medium",
				path = Entry4.path,
				detail = ("%d texts on the world with no plate, such as %s"):format(#List19, (quote((clean(List19[1].text.content))))),
				rect = Entry4.rect
			})
		end
		local Count9 = 0
		
		for _, element8 in Vector.elements do
			if element8.unfit then
				table.insert(List3, {
					rule = "composition-unfit",
					severity = "high",
					path = element8.path,
					detail = `does not fit {element8.unfit}`,
					rect = element8.rect
				})
			end
			if element8.reveal and element8.visible and Count9 < 3 then
				local ElementRect = element8.rect
				
				if math.max(0, ElementRect.width) * math.max(0, ElementRect.height) > 0 then
					table.insert(List3, {
						rule = "unnamed-reveal",
						severity = "medium",
						path = element8.path,
						detail = `the mark does not say that it holds {element8.reveal}`,
						rect = element8.rect
					})
					Count9 += 1
				end
			end
		end
		if Vector.touch == true then
			local IsSmallestBelow = math.min(Vector.width, Vector.height) <= 500
			local Height: number = if IsSmallestBelow then 70 else 120
			local Vector4 = {
				x = Vector.width - (if IsSmallestBelow then 95 else 170),
				y = Vector.height - (if IsSmallestBelow then 90 else 210),
				width = Height,
				height = Height
			}
			local SmallestDelta1 = nil
			local ElementRect = nil
			local SmallestDelta = nil
			local IsScrollingFrame = nil
			
			for _, element7 in Vector.elements do
				if element7.interactive then
					local Width = Vector.width
					local Height1 = Vector.height
					local ElementRect3 = element7.rect
					
					if element7.visible and (ElementRect3.width > 0 and (ElementRect3.height > 0 and (ElementRect3.x < Width and (ElementRect3.y < Height1 and (ElementRect3.x + ElementRect3.width > 0 and ElementRect3.y + ElementRect3.height > 0))))) then
						IsScrollingFrame = false
						local ParentOfResult2 = PrepareResult.parentOf(element7)
						while ParentOfResult2 ~= nil and not IsScrollingFrame do
							local ByIndexEntry = PrepareResult.byIndex[ParentOfResult2]
							IsScrollingFrame = ByIndexEntry ~= nil and ByIndexEntry.class == "ScrollingFrame"
							ParentOfResult2 = if ByIndexEntry then PrepareResult.parentOf(ByIndexEntry) else nil
						end
						for _, plate5 in PrepareResult.plates do
							if plate5 ~= element7 then
								local PlateRect = plate5.rect
								
								if Largest3 * 0.35 <= math.max(0, PlateRect.width) * math.max(0, PlateRect.height) then
									local PlateRect1 = plate5.rect
									local NewX3 = element7.rect.x + element7.rect.width / 2
									local NewY = element7.rect.y + element7.rect.height / 2
									
									if PlateRect1.x <= NewX3 and (NewX3 <= PlateRect1.x + PlateRect1.width and (PlateRect1.y <= NewY and NewY <= PlateRect1.y + PlateRect1.height)) then
										IsScrollingFrame = true
										break
									end
								end
							end
						end
						if not IsScrollingFrame then
							ElementRect = element7.rect
							SmallestDelta = math.min(ElementRect.x + ElementRect.width, Vector4.x + Vector4.width) - math.max(ElementRect.x, Vector4.x)
							SmallestDelta1 = math.min(ElementRect.y + ElementRect.height, Vector4.y + Vector4.height) - math.max(ElementRect.y, Vector4.y)
							
							if SmallestDelta > 0 and SmallestDelta1 > 0 and Height * 0.2 * Height <= SmallestDelta * SmallestDelta1 then
								table.insert(List3, {
									rule = "touch-control-overlap",
									severity = "medium",
									path = element7.path,
									detail = ("a %dx%d px control covers %d%% of the Jump button area"):format(math.floor(ElementRect.width), math.floor(ElementRect.height), (math.floor(SmallestDelta * 100 * SmallestDelta1 / (Height * Height)))),
									rect = element7.rect
								})
								break
							end
						end
					end
				end
			end
		end
		local Largest = math.max(1, Vector.width * Vector.height)
		
		for _, plate3 in PrepareResult.plates do
			local PlateRect = plate3.rect
			local IsLargestBelow3 = math.max(0, PlateRect.width) * math.max(0, PlateRect.height) < Largest * 0.35
			local DescendantTextsResult = nil
			
			if not IsLargestBelow3 then
				DescendantTextsResult = PrepareResult.descendantTexts(plate3)
				IsLargestBelow3 = #DescendantTextsResult < 2
			end
			if not IsLargestBelow3 then
				for _, value24 in PrepareResult.descendantImages(plate3) do
					if value24 ~= plate3 then
						table.insert(DescendantTextsResult, value24)
					end
				end
				local v19 = 1e999
				local v20 = 1e999
				local MagnitudeRatio = -1e999
				local v21 = -1e999
				
				for _, value29 in DescendantTextsResult do
					v19 = math.min(v19, value29.rect.x)
					v20 = math.min(v20, value29.rect.y)
					MagnitudeRatio = math.max(MagnitudeRatio, value29.rect.x + value29.rect.width)
					v21 = math.max(v21, value29.rect.y + value29.rect.height)
				end
				local config1 = {
					x = v19,
					y = v20,
					width = MagnitudeRatio - v19,
					height = v21 - v20
				}
				local MagnitudeRatio1 = math.abs((v19 + MagnitudeRatio) / 2 - (plate3.rect.x + plate3.rect.width / 2)) / plate3.rect.width
				MagnitudeRatio = math.abs((v20 + v21) / 2 - (plate3.rect.y + plate3.rect.height / 2)) / plate3.rect.height
				local PlateRect2 = plate3.rect
				
				if math.max(0, config1.width) * math.max(0, config1.height) < math.max(0, PlateRect2.width) * math.max(0, PlateRect2.height) * 0.4 and (MagnitudeRatio1 > 0.25 or MagnitudeRatio > 0.25) then
					local _Rect = plate3.rect
					table.insert(List3, {
						rule = "stranded-content",
						severity = "low",
						path = plate3.path,
						detail = ("the content uses %d%% of a %dx%d px surface"):format(math.floor(math.max(0, config1.width) * math.max(0, config1.height) * 100 / (math.max(0, _Rect.width) * math.max(0, _Rect.height))), math.floor(plate3.rect.width), (math.floor(plate3.rect.height))),
						rect = plate3.rect
					})
				end
			end
		end
		table.sort(List3, function(A, B): boolean
			-- upvalues: config (upval)
			return if A.severity == B.severity then if A.rule == B.rule then if A.rect.y == B.rect.y then A.rect.x < B.rect.x else A.rect.y < B.rect.y else A.rule < B.rule else config[A.severity] < config[B.severity]
		end)
		local List22 = {}
		
		for _, text11 in Texts do
			local Text8 = text11.text
			local PlateOfResult = PrepareResult.plateOf(text11)
			local LargestRatio = nil
			
			if PlateOfResult then
				local Color = Text8.color
				local Fill = PlateOfResult.fill
				local R = Color.r
				local v22 = (if R <= 0.03928 then R / 12.92 else ((R + 0.055) / 1.055) ^ 2.4) * 0.2126
				local G = Color.g
				R = if G <= 0.03928 then G / 12.92 else ((G + 0.055) / 1.055) ^ 2.4
				local NewR = v22 + R * 0.7152
				R = Color.b
				local NewNewR = NewR + (if R <= 0.03928 then R / 12.92 else ((R + 0.055) / 1.055) ^ 2.4) * 0.0722
				R = Fill.r
				v22 = (if R <= 0.03928 then R / 12.92 else ((R + 0.055) / 1.055) ^ 2.4) * 0.2126
				G = Fill.g
				R = if G <= 0.03928 then G / 12.92 else ((G + 0.055) / 1.055) ^ 2.4
				NewR = v22 + R * 0.7152
				R = Fill.b
				local NewNewR1 = NewR + (if R <= 0.03928 then R / 12.92 else ((R + 0.055) / 1.055) ^ 2.4) * 0.0722
				LargestRatio = (math.max(NewNewR, NewNewR1) + 0.05) / (math.min(NewNewR, NewNewR1) + 0.05)
			else
				LargestRatio = 7
			end
			PlateOfResult = math.clamp((LargestRatio - 1) / 4, 0.35, 1)
			table.insert(List22, {
				path = text11.path,
				content = clean(Text8.content),
				size = Text8.size,
				role = Text8.role,
				bold = Text8.bold,
				score = math.floor(Text8.size * (if Text8.bold then 1.2 else 1) * PlateOfResult * 10 + 0.5) / 10
			})
		end
		table.sort(List22, function(A, B): boolean
			return if A.score == B.score then A.path < B.path else B.score < A.score
		end)
		while #List22 > 6 do
			table.remove(List22)
		end
		local Fixes = {}
		
		for _, value30 in List3 do
			Fixes[value30.rule] = Frozen[value30.rule]
		end
		local List23 = {
			("design review: %d finding(s), %d text size(s) in use"):format(#List3, #List5)
		}
		local List24 = {}
		local t7 = {}
		
		for _, value31 in List3 do
			local List2 = t7[value31.rule]
			
			if List2 == nil then
				List2 = {}
				t7[value31.rule] = List2
				table.insert(List24, value31.rule)
			end
			table.insert(List2, value31)
		end
		local Entry5 = nil
		for _, value32 in List24 do
			Entry5 = t7[value32]
			table.insert(List23, ("  %s %s (%d): %s"):format(Entry5[1].severity, value32, #Entry5, Frozen[value32] or ""))
			
			for i7, value25 in Entry5 do
				if i7 > 3 then
					table.insert(List23, ("      ... %d more"):format(#Entry5 - 3))
					break
				else
					table.insert(List23, "      " .. value25.detail)
					continue
				end
			end
		end
		table.insert(List23, "  most prominent text:")
		
		for i8, value27 in List22 do
			table.insert(List23, ("    %d. %s %g px%s%s"):format(i8, quote(value27.content), value27.size, if value27.bold then " bold" else "", if value27.role then " " .. value27.role else ""))
		end
		return {
			findings = List3,
			prominence = List22,
			sizes = List5,
			fixes = Fixes,
			text = table.concat(List23, "\n")
		}
	end,
	segments = segments,
	fixes = Frozen
})