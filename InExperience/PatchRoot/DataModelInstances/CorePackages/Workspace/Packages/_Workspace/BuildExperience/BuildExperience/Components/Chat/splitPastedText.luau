local BuildExperience = script:FindFirstAncestor("BuildExperience")
local FIntBuildChatPasteAttachmentMinCharactersModule = require(BuildExperience.Flags.FIntBuildChatPasteAttachmentMinCharacters)
local FIntBuildChatPasteAttachmentMaxUtf16CodeUnitsModule = require(BuildExperience.Flags.FIntBuildChatPasteAttachmentMaxUtf16CodeUnits)

local function _(p1): number
	local Total = 0
	
	for _, value in utf8.codes(p1) do
		Total += if value > 65535 then 2 else 1
	end
	return Total
end

return function(p2, Text: string, StartIndex1: number)
	-- upvalues: FIntBuildChatPasteAttachmentMinCharactersModule (copy), FIntBuildChatPasteAttachmentMaxUtf16CodeUnitsModule (copy)
	local v1 = #Text - #p2
	local StartIndex = StartIndex1 - v1
	
	if v1 < FIntBuildChatPasteAttachmentMinCharactersModule or StartIndex < 1 then
		return nil
	end
	if string.sub(Text, 1, StartIndex - 1) .. string.sub(Text, StartIndex1) ~= p2 then
		return nil
	end
	local Segment = string.sub(Text, StartIndex, StartIndex1 - 1)
	local Length = utf8.len(Segment)
	
	if Length ~= nil and Length >= FIntBuildChatPasteAttachmentMinCharactersModule then
		local Total = 0
		
		for _, value in utf8.codes(Segment) do
			Total += if value > 65535 then 2 else 1
		end
		if FIntBuildChatPasteAttachmentMaxUtf16CodeUnitsModule >= Total then
			return { pastedText = Segment, cursorPosition = StartIndex }
		end
	end
	return nil
end