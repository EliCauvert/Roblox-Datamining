local parent = script:FindFirstAncestor("NotificationsCommon").Parent
local parent_1 = script.Parent.Parent
local dependenciesModule = require(parent_1.dependencies)
local useStyle = dependenciesModule.UIBlox.Core.Style.useStyle
local _ = require(parent_1.type)
local text = require(parent.AppCommonLib).Text
local react = dependenciesModule.React
local t = {
	highlight = function(p1)
		return "<b>" .. p0 .. "</b>"
	end,
	warning = function(p1)
		return "<b>" .. p1 .. "</b>"
	end
}

function utf8Sub(p1, p2, p3)
	local byteOffset = utf8.offset(p1, p2)
	local byteOffset_1 = utf8.offset(p1, p3 + 1)
	
	return if byteOffset == nil or byteOffset_1 == nil then string.sub(p1, p2, p3) else string.sub(p1, byteOffset, byteOffset_1 - 1)
end

local function formatString(p1)
	-- upvalues: t (ref), text (ref)
	local text_1 = p1.text .. " "
	local styledElements = p1.styledElements
	local list = {
		{ Position = 0, ReferenceCount = 0, Format = "highlight" },
		{
			ReferenceCount = 0,
			Format = "highlight",
			Position = utf8.len(p1.text)
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
	local var1 = ""
	
	for i_1 = 1, #list - 1 do
		local var2 = list[i_1]
		local var3 = list[i_1 + 1]
		
		if var2.Format then
			t_1[var2.Format] += var2.ReferenceCount
		end
		if var2.Position == var3.Position then
			continue
		end
		local var4 = utf8Sub(text_1, var2.Position + 1, var3.Position)
		
		for i_1, v in pairs(t) do
			if t_1[i_1] > 0 then
				var4 = v(var4)
			end
		end
		var1 ..= var4
	end
	return text.Trim(var1)
end

return function(p2)
	-- upvalues: useStyle (ref), formatString (ref), react (ref)
	local var5 = useStyle()
	
	return react.createElement("TextLabel", {
		RichText = true,
		BackgroundTransparency = 1,
		TextWrapped = true,
		Text = if p2.Text then formatString(p2.Text) else "",
		TextColor3 = p2.TextColor3 or var5.Theme.TextDefault.Color,
		TextTransparency = p2.TextTransparency or var5.Theme.TextDefault.Transparency,
		Font = p2.Font or var5.Font.Body.Font,
		AutomaticSize = p2.AutomaticSize,
		Size = p2.Size,
		TextSize = p2.TextSize,
		Position = p2.Position,
		AnchorPoint = p2.AnchorPoint,
		TextXAlignment = p2.TextXAlignment,
		LayoutOrder = p2.LayoutOrder
	})
end