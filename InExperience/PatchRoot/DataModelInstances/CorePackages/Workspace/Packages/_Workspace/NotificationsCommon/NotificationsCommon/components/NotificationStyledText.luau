local parent = script:FindFirstAncestor("NotificationsCommon").Parent
local parent_1 = script.Parent.Parent
local dependenciesModule = require(parent_1.dependencies)
local useStyle = dependenciesModule.UIBlox.Core.Style.useStyle
local _ = require(parent_1.type)
local text = require(parent.AppCommonLib).Text
local react = dependenciesModule.React
local t = {
	highlight = function(p0)
		return "<b>" .. p0 .. "</b>"
	end,
	warning = function(p1)
		return "<b>" .. p1 .. "</b>"
	end
}

function utf8Sub(p2, p3, p4)
	local byteOffset = utf8.offset(p2, p3)
	local byteOffset_1 = utf8.offset(p2, p4 + 1)
	
	return if byteOffset == nil or byteOffset_1 == nil then string.sub(p2, p3, p4) else string.sub(p2, byteOffset, byteOffset_1 - 1)
end

local function formatString(p5)
	-- upvalues: t (ref), text (ref)
	local text_1 = p5.text .. " "
	local styledElements = p5.styledElements
	local list = {
		{ Position = 0, ReferenceCount = 0, Format = "highlight" },
		{
			ReferenceCount = 0,
			Format = "highlight",
			Position = utf8.len(p5.text)
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
	table.sort(list, function(p6, p7)
		return p6.Position < p7.Position
	end)
	local t_1 = {}
	
	for i in pairs(t) do
		t_1[i] = 0
	end
	local var8 = ""
	
	for i_1 = 1, #list - 1 do
		local var9 = list[i_1]
		local var10 = list[i_1 + 1]
		
		if var9.Format then
			t_1[var9.Format] += var9.ReferenceCount
		end
		if var9.Position == var10.Position then
			continue
		end
		local var11 = utf8Sub(text_1, var9.Position + 1, var10.Position)
		
		for i_1, v in pairs(t) do
			if t_1[i_1] > 0 then
				var11 = v(var11)
			end
		end
		var8 ..= var11
	end
	return text.Trim(var8)
end

return function(p8)
	-- upvalues: useStyle (ref), formatString (ref), react (ref)
	local var12 = useStyle()
	
	return react.createElement("TextLabel", {
		RichText = true,
		BackgroundTransparency = 1,
		TextWrapped = true,
		Text = if p8.Text then formatString(p8.Text) else "",
		TextColor3 = p8.TextColor3 or var12.Theme.TextDefault.Color,
		TextTransparency = p8.TextTransparency or var12.Theme.TextDefault.Transparency,
		Font = p8.Font or var12.Font.Body.Font,
		AutomaticSize = p8.AutomaticSize,
		Size = p8.Size,
		TextSize = p8.TextSize,
		Position = p8.Position,
		AnchorPoint = p8.AnchorPoint,
		TextXAlignment = p8.TextXAlignment,
		LayoutOrder = p8.LayoutOrder
	})
end