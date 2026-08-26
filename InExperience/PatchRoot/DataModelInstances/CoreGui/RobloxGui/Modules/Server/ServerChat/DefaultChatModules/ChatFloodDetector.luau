local chatConstantsModule = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatConstants"))
local var1 = false
local ok, status = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserAddChatThrottlingToAllChannels")
end)

if ok then
	var1 = status
end
local var2 = var1
local t = {}
local t_1 = {}
local t_2 = nil
pcall(function()
	-- upvalues: t_2 (write)
	t_2 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)

if t_2 == nil then
	t_2 = {}
end
if not t_2.FormatMessageToSend or not t_2.LocalizeFormattedMessage then
	function t_2.FormatMessageToSend(_, _, p1)
		return p1
	end
end
local function _(p1)
	table.insert(p1, tick() + 15)
end

return function(p1)
	-- upvalues: t_1 (ref), t (ref), var2 (write), t_2 (write), chatConstantsModule (ref)
	p1:RegisterProcessCommandsFunction("flood_detection", function(p2, _, p3)
		-- upvalues: t_1 (copy), p1 (ref), t (copy), var2 (copy), t_2 (copy)
		if t_1[p2] then
			return false
		end
		local var3 = p1:GetSpeaker(p2)
		
		if not var3 then
			return false
		elseif not var3:GetPlayer() then
			return false
		elseif not t[p2] then
			t[p2] = {}
		end
		local var4
		local _ = nil
		
		if var2 then
			if not t[p2][p3] then
				t[p2][p3] = {}
			end
			var4 = t[p2][p3]
		else
			var4 = t[p2]
		end
		local currentTime = tick()
		while #var4 > 0 and var4[1] < currentTime do
			table.remove(var4, 1)
		end
		if #var4 < 7 then
			table.insert(var4, tick() + 15)
			
			return false
		end
		local ceiled = math.ceil(var4[1] - currentTime)
		var3:SendSystemMessage(t_2:FormatMessageToSend("GameChat_ChatFloodDetector_MessageDisplaySeconds", string.format("You must wait %d %s before sending another message!", ceiled, if ceiled > 1 then "seconds" else "second"), "RBX_NUMBER", tostring(ceiled)), p3)
		
		return true
	end, chatConstantsModule.LowPriority)
	p1.SpeakerRemoved:connect(function(p4)
		-- upvalues: t (copy)
		t[p4] = nil
	end)
end