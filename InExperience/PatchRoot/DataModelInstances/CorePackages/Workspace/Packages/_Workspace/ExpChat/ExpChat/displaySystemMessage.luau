local parent = script:FindFirstAncestor("ExpChat").Parent
local list = require(parent.llama).List
local var0 = require(parent.ExpChatShared).Logger:new("ExpChat/" .. script.Name)
local sanitizeForRichTextModule = require(script.Parent.sanitizeForRichText)
local fFlagEnableClientSummarySystemMessageOnLua = require(parent.SharedFlags).FFlagEnableClientSummarySystemMessageOnLua

return function(p0, p1, p2, p3, p4, p5, p6) --[[ line: 12 | named "displaySystemMessage" ]]
	-- upvalues: var0 (ref), list (ref), fFlagEnableClientSummarySystemMessageOnLua (ref), sanitizeForRichTextModule (ref)
	var0:debug("Display system message: {}", p2)
	local var2 = nil
	
	if type(p0) ~= "string" then
		var2 = table.concat(list.map(p0, function(p7) --[[ line: 38 ]]
			-- upvalues: p3 (ref), p1 (ref)
			return p3:FormatByKey(p7, p1)
		end), "\n")
	elseif p0 ~= "" then
		local _ = nil
		local ok, status = pcall(function() --[[ line: 27 ]]
			-- upvalues: p3 (ref), p0 (ref), p1 (ref)
			return p3:FormatByKey(p0, p1)
		end)
		var2 = if not ok then p5 else status
	end
	if p4 and var2 then
		if fFlagEnableClientSummarySystemMessageOnLua then
			var2 = sanitizeForRichTextModule(var2)
			
			if p6 then
				var2 = p6(var2)
			end
			p4:DisplaySystemMessage(var2, p2)
			
			return
		else
			p4:DisplaySystemMessage(sanitizeForRichTextModule(var2), p2)
		end
	end
end