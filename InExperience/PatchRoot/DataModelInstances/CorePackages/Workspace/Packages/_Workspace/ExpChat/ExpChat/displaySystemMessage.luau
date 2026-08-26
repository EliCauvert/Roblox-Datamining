local parent = script:FindFirstAncestor("ExpChat").Parent
local list = require(parent.llama).List
local var1 = require(parent.ExpChatShared).Logger:new("ExpChat/" .. script.Name)
local sanitizeForRichTextModule = require(script.Parent.sanitizeForRichText)
local fFlagEnableClientSummarySystemMessageOnLua = require(parent.SharedFlags).FFlagEnableClientSummarySystemMessageOnLua

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: var1 (ref), list (ref), fFlagEnableClientSummarySystemMessageOnLua (ref), sanitizeForRichTextModule (ref)
	var1:debug("Display system message: {}", p3)
	local var2 = nil
	
	if type(p1) ~= "string" then
		var2 = table.concat(list.map(p1, function(p8)
			-- upvalues: p4 (ref), p2 (ref)
			return p4:FormatByKey(p8, p2)
		end), "\n")
	elseif p1 ~= "" then
		local _ = nil
		local ok, status = pcall(function()
			-- upvalues: p4 (ref), p1 (ref), p2 (ref)
			return p4:FormatByKey(p1, p2)
		end)
		var2 = if not ok then p6 else status
	end
	if p5 and var2 then
		if fFlagEnableClientSummarySystemMessageOnLua then
			var2 = sanitizeForRichTextModule(var2)
			
			if p7 then
				var2 = p7(var2)
			end
			p5:DisplaySystemMessage(var2, p3)
			
			return
		else
			p5:DisplaySystemMessage(sanitizeForRichTextModule(var2), p3)
		end
	end
end