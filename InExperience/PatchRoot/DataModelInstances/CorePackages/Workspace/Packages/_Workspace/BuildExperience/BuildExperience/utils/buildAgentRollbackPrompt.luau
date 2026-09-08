local buildAgentRollbackVersionPrompt = game:DefineFastString("BuildAgentRollbackVersionPrompt", "<system_reminder>The user reverted the game to version {versionNumber}. Call restore_version.")
local buildAgentRollbackNotePrompt = game:DefineFastString("BuildAgentRollbackNotePrompt", " Add note title {title} and description {description}")

local function _(p1, p2)
	return p1:gsub("{(%w+)}", function(p3)
		-- upvalues: p2 (ref)
		return tostring(p2[p3])
	end)
end

return function(p1, p2, p3)
	-- upvalues: buildAgentRollbackVersionPrompt (ref), buildAgentRollbackNotePrompt (ref)
	local t = { versionNumber = p1 }
	local var1 = buildAgentRollbackVersionPrompt:gsub("{(%w+)}", function(p4)
		-- upvalues: t (ref)
		return tostring(t[p4])
	end)
	local var2 = ""
	
	if p2 ~= nil and p2 ~= "" and (p3 ~= nil and p3 ~= "") then
		local t_1 = { title = p2, description = p3 }
		var2 = buildAgentRollbackNotePrompt:gsub("{(%w+)}", function(p4)
			-- upvalues: t_1 (ref)
			return tostring(t_1[p4])
		end)
	end
	return var1 .. var4 .. "</system_reminder>"
end