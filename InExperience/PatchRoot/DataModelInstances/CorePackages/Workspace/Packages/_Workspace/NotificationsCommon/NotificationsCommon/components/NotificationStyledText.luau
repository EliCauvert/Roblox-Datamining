local Parent = script:FindFirstAncestor("NotificationsCommon").Parent
local Parent1 = script.Parent.Parent
local DependenciesModule = require(Parent1.dependencies)
local UseStyleFunction = DependenciesModule.UIBlox.Core.Style.useStyle
local _ = require(Parent1.type)
local Text = require(Parent.AppCommonLib).Text
local React = DependenciesModule.React
local FoundationFontFaceMigration = require(Parent.Foundation).Utility.Flags.FoundationFontFaceMigration
local EnableNotificationStyledTextUtf16Offsets = game:DefineFastFlag("EnableNotificationStyledTextUtf16Offsets", false)
local config = {
	highlight = function(Text): string
		return "<b>" .. Text .. "</b>"
	end,
	warning = function(Text): string
		return "<b>" .. Text .. "</b>"
	end
}

function utf8Sub(Text: string, StartIndex: number, EndIndex: number): string
	local OffsetResult = utf8.offset(Text, StartIndex)
	local OffsetResult1 = utf8.offset(Text, EndIndex + 1)
	
	return if OffsetResult == nil or OffsetResult1 == nil then string.sub(Text, StartIndex, EndIndex) else string.sub(Text, OffsetResult, OffsetResult1 - 1)
end

local function utf16IndexToCodepointIndex(p1, Offset): number
	local Total = 0
	local Count = 0
	
	for _, value in utf8.codes(p1) do
		if Offset <= Total then break end
		Total += if value > 65535 then 2 else 1
		Count += 1
	end
	return Count
end

local function formatString(p2)
	-- upvalues: EnableNotificationStyledTextUtf16Offsets (copy), config (copy), Text (copy), utf16IndexToCodepointIndex (copy)
	if EnableNotificationStyledTextUtf16Offsets then
		local Text2 = p2.text
		local Length = utf8.len(Text2)
		
		if Length == nil then
			return Text2
		end
		local StyledElements = p2.styledElements
		local List = {
			{ Position = 0, ReferenceCount = 0, Format = "highlight" },
			{
				ReferenceCount = 0,
				Format = "highlight",
				Position = Length
			}
		}
		
		if StyledElements then
			for _, styledElement1 in pairs(StyledElements) do
				table.insert(List, {
					ReferenceCount = 1,
					Position = utf16IndexToCodepointIndex(Text2, styledElement1.offset),
					Format = styledElement1.styledElementType
				})
				table.insert(List, {
					ReferenceCount = -1,
					Position = utf16IndexToCodepointIndex(Text2, styledElement1.offset + styledElement1.length),
					Format = styledElement1.styledElementType
				})
			end
		end
		table.sort(List, function(A, B): boolean
			return A.Position < B.Position
		end)
		local NewReferenceCounts = {}
		
		for i4 in pairs(config) do
			NewReferenceCounts[i4] = 0
		end
		local Text4 = ""
		
		for i5 = 1, #List - 1 do
			local Entry = List[i5]
			local Entry2 = List[i5 + 1]
			
			if Entry.Format then
				local Format = Entry.Format
				NewReferenceCounts[Format] += Entry.ReferenceCount
			end
			if Entry.Position ~= Entry2.Position then
				local Utf8SubResult = utf8Sub(Text2, Entry.Position + 1, Entry2.Position)
				
				for i3, value1 in pairs(config) do
					if NewReferenceCounts[i3] > 0 then
						Utf8SubResult = value1(Utf8SubResult)
					end
				end
				Text4 ..= Utf8SubResult
			end
		end
		return Text.Trim(Text4)
	else
		local Text1 = p2.text .. " "
		local StyledElements = p2.styledElements
		local List = {
			{ Position = 0, ReferenceCount = 0, Format = "highlight" },
			{
				ReferenceCount = 0,
				Format = "highlight",
				Position = utf8.len(p2.text)
			}
		}
		
		if StyledElements then
			for _, styledElement in pairs(StyledElements) do
				table.insert(List, {
					ReferenceCount = 1,
					Position = styledElement.offset,
					Format = styledElement.styledElementType
				})
				table.insert(List, {
					ReferenceCount = -1,
					Position = styledElement.offset + styledElement.length,
					Format = styledElement.styledElementType
				})
			end
		end
		table.sort(List, function(A, B): boolean
			return A.Position < B.Position
		end)
		local NewReferenceCounts = {}
		
		for i in pairs(config) do
			NewReferenceCounts[i] = 0
		end
		local Text3 = ""
		
		for i1 = 1, #List - 1 do
			local Entry = List[i1]
			local Entry1 = List[i1 + 1]
			
			if Entry.Format then
				local Format = Entry.Format
				NewReferenceCounts[Format] += Entry.ReferenceCount
			end
			if Entry.Position ~= Entry1.Position then
				local Utf8SubResult = utf8Sub(Text1, Entry.Position + 1, Entry1.Position)
				
				for i2, value in pairs(config) do
					if NewReferenceCounts[i2] > 0 then
						Utf8SubResult = value(Utf8SubResult)
					end
				end
				Text3 ..= Utf8SubResult
			end
		end
		return Text.Trim(Text3)
	end
end

return function(Label)
	-- upvalues: UseStyleFunction (copy), formatString (copy), React (copy), FoundationFontFaceMigration (copy)
	local UseStyleResult = UseStyleFunction()
	
	return React.createElement("TextLabel", {
		RichText = true,
		BackgroundTransparency = 1,
		TextWrapped = true,
		Text = if Label.Text then formatString(Label.Text) else "",
		TextColor3 = Label.TextColor3 or UseStyleResult.Theme.TextDefault.Color,
		TextTransparency = Label.TextTransparency or UseStyleResult.Theme.TextDefault.Transparency,
		Font = if FoundationFontFaceMigration and Label.FontFace then nil else Label.Font or UseStyleResult.Font.Body.Font,
		FontFace = if FoundationFontFaceMigration then Label.FontFace else nil,
		AutomaticSize = Label.AutomaticSize,
		Size = Label.Size,
		TextSize = Label.TextSize,
		Position = Label.Position,
		AnchorPoint = Label.AnchorPoint,
		TextXAlignment = Label.TextXAlignment,
		LayoutOrder = Label.LayoutOrder
	})
end