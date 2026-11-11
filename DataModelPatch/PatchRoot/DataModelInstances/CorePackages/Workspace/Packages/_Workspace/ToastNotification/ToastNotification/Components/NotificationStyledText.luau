local Parent = script.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local UseStyleFunction = DependenciesModule.UIBlox.Core.Style.useStyle
local _ = require(Parent.type)
local React = DependenciesModule.React
local config = {
	highlight = function(Text): string
		return "<b>" .. Text .. "</b>"
	end
}

local function formatString(p1): string
	-- upvalues: config (copy)
	local Text: string = p1.text
	local StyledElements = p1.styledElements
	local List = {
		{ Position = 0, ReferenceCount = 0, Format = "highlight" },
		{
			ReferenceCount = 0,
			Format = "highlight",
			Position = #p1.text
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
	local Text1 = ""
	
	for i1 = 1, #List - 1 do
		local Entry = List[i1]
		local Entry1 = List[i1 + 1]
		
		if Entry.Format then
			local Format = Entry.Format
			NewReferenceCounts[Format] += Entry.ReferenceCount
		end
		if Entry.Position ~= Entry1.Position then
			local Segment = Text:sub(Entry.Position + 1, Entry1.Position)
			
			for i2, value in pairs(config) do
				if NewReferenceCounts[i2] > 0 then
					Segment = value(Segment)
				end
			end
			Text1 ..= Segment
		end
	end
	return Text1
end

return function(Label)
	-- upvalues: UseStyleFunction (copy), formatString (copy), React (copy)
	local UseStyleResult = UseStyleFunction()
	
	return React.createElement("TextLabel", {
		RichText = true,
		BackgroundTransparency = 1,
		TextWrapped = true,
		Text = if Label.Text then formatString(Label.Text) else "",
		TextColor3 = Label.TextColor3 or UseStyleResult.Theme.TextDefault.Color,
		TextTransparency = Label.TextTransparency or UseStyleResult.Theme.TextDefault.Transparency,
		Font = Label.Font or UseStyleResult.Font.Body.Font,
		AutomaticSize = Label.AutomaticSize,
		Size = Label.Size,
		TextSize = Label.TextSize,
		Position = Label.Position,
		AnchorPoint = Label.AnchorPoint,
		TextXAlignment = Label.TextXAlignment,
		TextTruncate = Enum.TextTruncate.AtEnd
	}, {
		UISizeConstraint = if Label.MaxSize then React.createElement("UISizeConstraint", { MaxSize = Label.MaxSize }) else nil
	})
end