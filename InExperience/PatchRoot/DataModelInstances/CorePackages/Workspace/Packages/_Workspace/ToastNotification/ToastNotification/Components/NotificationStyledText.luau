local parent = script.Parent.Parent
local dependenciesModule = require(parent.dependencies)
local useStyle = dependenciesModule.UIBlox.Core.Style.useStyle
local _ = require(parent.type)
local react = dependenciesModule.React
local t = {
	highlight = function(p0)
		return "<b>" .. p0 .. "</b>"
	end
}

local function formatString(p1)
	-- upvalues: t (ref)
	local text = p1.text
	local styledElements = p1.styledElements
	local list = {
		{ Position = 0, ReferenceCount = 0, Format = "highlight" },
		{
			ReferenceCount = 0,
			Format = "highlight",
			Position = #p1.text
		}
	}
	
	if styledElements then
		for i, v in pairs(styledElements) do
			table.insert(list, {
				ReferenceCount = 1,
				Position = v.offset,
				Format = v.styledElementType
			})
			table.insert(list, {
				ReferenceCount = -1,
				Position = v.offset + v.length,
				Format = v.styledElementType
			})
		end
	end
	table.sort(list, function(p2, p3)
		return p2.Position < p3.Position
	end)
	local t_1 = {}
	
	for i in pairs(t) do
		t_1[i] = 0
	end
	local var5 = ""
	
	for i_1 = 1, #list - 1 do
		local var6 = list[i_1]
		local var7 = list[i_1 + 1]
		
		if var6.Format then
			t_1[var6.Format] += var6.ReferenceCount
		end
		if var6.Position == var7.Position then
			continue
		end
		local var8 = text:sub(var6.Position + 1, var7.Position)
		
		for i_1, v in pairs(t) do
			if t_1[i_1] > 0 then
				var8 = v(var8)
			end
		end
		var5 ..= var8
	end
	return var5
end

return function(p4)
	-- upvalues: useStyle (ref), formatString (ref), react (ref)
	local var9 = useStyle()
	
	return react.createElement("TextLabel", {
		RichText = true,
		BackgroundTransparency = 1,
		TextWrapped = true,
		Text = if p4.Text then formatString(p4.Text) else "",
		TextColor3 = p4.TextColor3 or var9.Theme.TextDefault.Color,
		TextTransparency = p4.TextTransparency or var9.Theme.TextDefault.Transparency,
		Font = p4.Font or var9.Font.Body.Font,
		AutomaticSize = p4.AutomaticSize,
		Size = p4.Size,
		TextSize = p4.TextSize,
		Position = p4.Position,
		AnchorPoint = p4.AnchorPoint,
		TextXAlignment = p4.TextXAlignment,
		TextTruncate = Enum.TextTruncate.AtEnd
	}, {
		UISizeConstraint = if p4.MaxSize then react.createElement("UISizeConstraint", { MaxSize = p4.MaxSize }) else nil
	})
end