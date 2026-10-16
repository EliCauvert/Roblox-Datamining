local BuildAgentRollbackVersionPrompt = game:DefineFastString("BuildAgentRollbackVersionPrompt", "<system_reminder>The user reverted the game to version {versionNumber}. Call restore_version.")
local BuildAgentRollbackNotePrompt = game:DefineFastString("BuildAgentRollbackNotePrompt", " Add note title {title} and description {description}")

local function _(Text: string, p1): string --[[ Line: 8 | Named "fill" ]]
	return (Text:gsub("{(%w+)}", function(p2): string --[[ Line: 9 ]]
		-- upvalues: p1 (copy)
		return (tostring(p1[p2]))
	end))
end

return function(VersionNumber, Title, Description): string --[[ Line: 14 | Named "buildAgentRollbackPrompt" ]]
	-- upvalues: BuildAgentRollbackVersionPrompt (copy), BuildAgentRollbackNotePrompt (copy)
	local config = { versionNumber = VersionNumber }
	local W = BuildAgentRollbackVersionPrompt:gsub("{(%w+)}", function(p1): string --[[ Line: 9 ]]
		-- upvalues: config (copy)
		return (tostring(config[p1]))
	end)
	local W1 = ""
	
	if Title ~= nil and Title ~= "" and Description ~= nil and Description ~= "" then
		local config1 = { title = Title, description = Description }
		W1 = BuildAgentRollbackNotePrompt:gsub("{(%w+)}", function(p1): string --[[ Line: 9 ]]
			-- upvalues: config1 (copy)
			return (tostring(config1[p1]))
		end)
	end
	return W .. W1 .. "</system_reminder>"
end