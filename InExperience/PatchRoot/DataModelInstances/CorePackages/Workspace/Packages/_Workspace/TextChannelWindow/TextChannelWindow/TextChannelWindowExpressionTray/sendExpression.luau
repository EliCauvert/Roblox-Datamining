local TextChannelWindow = script:FindFirstAncestor("TextChannelWindow")
local LoggerModule = require(TextChannelWindow.Logger)
local FFlagExpChatTextChannelWindowExpressionTrayEmojiModule = require(TextChannelWindow.Flags.FFlagExpChatTextChannelWindowExpressionTrayEmoji)
local SendTextToChannelModule = require(TextChannelWindow.sendTextToChannel)
local SendPresetModule = require(script.Parent.sendPreset)

local function sendEmojiExpression(p1, p2, p3)
	-- upvalues: LoggerModule (copy), SendTextToChannelModule (copy)
	local Unicode = p1.unicode
	
	if not p3 or Unicode == nil or Unicode == "" then
		return false
	elseif p2 == nil then
		LoggerModule:warning("Emoji not sent: no target channel")
		
		return false
	else
		return SendTextToChannelModule(p2, Unicode)
	end
end

local function _(p1, p2): boolean
	-- upvalues: SendPresetModule (copy), LoggerModule (copy)
	local SendPresetModuleResult = SendPresetModule(p1.presetId, p2)
	
	if SendPresetModuleResult == "Sent" then
		return true
	end
	if SendPresetModuleResult == "NoChannel" then
		LoggerModule:warning("Preset not sent: no reachable channel")
	end
	return false
end

return function(p1, p2, p3)
	-- upvalues: SendPresetModule (copy), LoggerModule (copy), FFlagExpChatTextChannelWindowExpressionTrayEmojiModule (copy), sendEmojiExpression (copy)
	if p1.kind ~= "preset" then
		return if FFlagExpChatTextChannelWindowExpressionTrayEmojiModule and p1.kind == "emoji" then sendEmojiExpression(p1, p2, p3) else false
	end
	local SendPresetModuleResult = SendPresetModule(p1.presetId, p2)
	
	if SendPresetModuleResult == "Sent" then
		return true
	end
	if SendPresetModuleResult == "NoChannel" then
		LoggerModule:warning("Preset not sent: no reachable channel")
	end
	return false
end