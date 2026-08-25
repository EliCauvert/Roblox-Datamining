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
	function t_2.FormatMessageToSend(_, _, p0)
		return p0
	end
end
local function _(p1)
	table.insert(p1, tick() + 15)
end

return function(p2)
	-- upvalues: t_1 (ref), t (ref), var2 (write), t_2 (write), chatConstantsModule (ref)
	p2:RegisterProcessCommandsFunction("flood_detection", function(p3, _, p4)
		-- upvalues: t_1 (copy), p2 (ref), t (copy), var2 (copy), t_2 (copy)
		if t_1[p3] then
			return false
		end
		local var6 = p2:GetSpeaker(p3)
		
		if not var6 then
			return false
		elseif not var6:GetPlayer() then
			return false
		elseif not t[p3] then
			t[p3] = {}
		end
		local var7
		local _ = nil
		
		if var2 then
			if not t[p3][p4] then
				t[p3][p4] = {}
			end
			var7 = t[p3][p4]
		else
			var7 = t[p3]
		end
		local currentTime = tick()
		while #var7 > 0 and var7[1] < currentTime do
			table.remove(var7, 1)
		end
		if #var7 < 7 then
			table.insert(var7, tick() + 15)
			
			return false
		end
		local ceiled = math.ceil(var7[1] - currentTime)
		var6:SendSystemMessage(t_2:FormatMessageToSend("GameChat_ChatFloodDetector_MessageDisplaySeconds", string.format("You must wait %d %s before sending another message!", ceiled, if ceiled > 1 then "seconds" else "second"), "RBX_NUMBER", tostring(ceiled)), p4)
		
		return true
	end, chatConstantsModule.LowPriority)
	p2.SpeakerRemoved:connect(function(p5)
		-- upvalues: t (copy)
		t[p5] = nil
	end)
end