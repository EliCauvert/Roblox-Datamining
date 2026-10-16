local ChatConstantsModule = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatConstants"))
local v1 = false
local Success, Result = pcall(function() --[[ Line: 11 ]]
	return UserSettings():IsUserFeatureEnabled("UserAddChatThrottlingToAllChannels")
end)

if Success then
	v1 = Result
end
local NoV1 = not v1
local t = {}
local t1 = {}
local ChatLocalizationModule = nil
pcall(function() --[[ Line: 33 ]]
	-- upvalues: ChatLocalizationModule (ref)
	ChatLocalizationModule = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)

if ChatLocalizationModule == nil then
	ChatLocalizationModule = {}
end
if not ChatLocalizationModule.FormatMessageToSend or not ChatLocalizationModule.LocalizeFormattedMessage then
	function ChatLocalizationModule:FormatMessageToSend(_, Formatted) --[[ Line: 37 ]]
		return Formatted
	end
end
local function _(List) --[[ Line: 40 | Named "EnterTimeIntoLog" ]]
	table.insert(List, tick() + 15)
end

return function(p1) --[[ Line: 44 | Named "Run" ]]
	-- upvalues: t1 (copy), t (copy), NoV1 (ref), ChatLocalizationModule (ref), ChatConstantsModule (copy)
	p1:RegisterProcessCommandsFunction("flood_detection", function(Key, _, p2): boolean --[[ Line: 45 | Named "FloodDetectionProcessCommandsFunction" ]]
		-- upvalues: t1 (upval), p1 (copy), t (upval), NoV1 (upval), ChatLocalizationModule (upval)
		if t1[Key] then
			return false
		end
		local Speaker = p1:GetSpeaker(Key)
		
		if not Speaker then
			return false
		end
		if not Speaker:GetPlayer() then
			return false
		end
		if not t[Key] then
			t[Key] = {}
		end
		local Entry = nil
		if NoV1 then
			if not t[Key][p2] then
				t[Key][p2] = {}
			end
			Entry = t[Key][p2]
		else
			Entry = t[Key]
		end
		local CurrentTime = tick()
		while #Entry > 0 and Entry[1] < CurrentTime do
			table.remove(Entry, 1)
		end
		if #Entry < 7 then
			table.insert(Entry, tick() + 15)
			
			return false
		else
			local Ceiled = math.ceil(Entry[1] - CurrentTime)
			Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_ChatFloodDetector_MessageDisplaySeconds", string.format("You must wait %d %s before sending another message!", Ceiled, if Ceiled > 1 then "seconds" else "second"), "RBX_NUMBER", (tostring(Ceiled))), p2)
			
			return true
		end
	end, ChatConstantsModule.LowPriority)
	p1.SpeakerRemoved:connect(function(Key) --[[ Line: 102 ]]
		-- upvalues: t (upval)
		t[Key] = nil
	end)
end