local Utf8RangeModule = require(script.Parent.utf8Range)

local function _(Text, p1)
	return if utf8.len(Text) == nil then nil else utf8.offset(Text, p1)
end

local _ = function(Text: string, p1: number)
	if p1 < 1 then
		return nil
	else
		local Length = utf8.len((string.sub(Text, 1, p1 - 1)))
		
		return if Length == nil then nil else Length + 1
	end
end

return {
	readCursor = function(TextBox)
		local Text: string = TextBox.Text
		local CursorPosition: number = TextBox.CursorPosition
		
		if CursorPosition < 1 then
			return nil
		else
			local Length = utf8.len((string.sub(Text, 1, CursorPosition - 1)))
			
			return if Length == nil then nil else Length + 1
		end
	end,
	placeCursor = function(p1, p2)
		local Text = p1.Text
		local OffsetResult = if utf8.len(Text) == nil then nil else utf8.offset(Text, p2)
		
		if OffsetResult ~= nil then
			p1.CursorPosition = OffsetResult
		end
	end,
	splice = function(p1, p2, p3, p4)
		-- upvalues: Utf8RangeModule (copy)
		local SpliceResult, SpliceResult2 = Utf8RangeModule.splice(p1.Text, p2, p3, p4)
		
		if SpliceResult == nil or SpliceResult2 == nil then
			return false, nil
		end
		p1.Text = SpliceResult
		local Text = p1.Text
		local OffsetResult = if utf8.len(Text) == nil then nil else utf8.offset(Text, SpliceResult2)
		
		if OffsetResult ~= nil then
			p1.CursorPosition = OffsetResult
		end
		return true, SpliceResult2
	end
}