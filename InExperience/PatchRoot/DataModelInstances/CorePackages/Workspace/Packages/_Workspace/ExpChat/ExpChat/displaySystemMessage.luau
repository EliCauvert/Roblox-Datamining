local Parent = script:FindFirstAncestor("ExpChat").Parent
local List = require(Parent.llama).List
local NewResult = require(Parent.ExpChatShared).Logger:new("ExpChat/" .. script.Name)
local SanitizeForRichTextModule = require(script.Parent.sanitizeForRichText)
local FFlagEnableClientSummarySystemMessageOnLua = require(Parent.SharedFlags).FFlagEnableClientSummarySystemMessageOnLua

return function(p1, p2, Metadata, Translator, TextChannel, p3, Callback) --[[ Line: 12 | Named "displaySystemMessage" ]]
	-- upvalues: NewResult (copy), List (copy), FFlagEnableClientSummarySystemMessageOnLua (copy), SanitizeForRichTextModule (copy)
	NewResult:debug("Display system message: {}", Metadata)
	local Joined = nil
	
	if type(p1) == "string" then
		if p1 ~= "" then
			local Success
			Success, Joined = pcall(function() --[[ Line: 27 ]]
				-- upvalues: Translator (copy), p1 (copy), p2 (copy)
				return Translator:FormatByKey(p1, p2)
			end)
			
			if not Success then
				Joined = p3
			end
		end
	else
		Joined = table.concat(List.map(p1, function(p4) --[[ Line: 38 ]]
			-- upvalues: Translator (copy), p2 (copy)
			return Translator:FormatByKey(p4, p2)
		end), "\n")
	end
	if TextChannel and Joined then
		if FFlagEnableClientSummarySystemMessageOnLua then
			Joined = SanitizeForRichTextModule(Joined)
			
			if Callback then
				Joined = Callback(Joined)
			end
			TextChannel:DisplaySystemMessage(Joined, Metadata)
			
			return
		else
			TextChannel:DisplaySystemMessage(SanitizeForRichTextModule(Joined), Metadata)
		end
	end
end