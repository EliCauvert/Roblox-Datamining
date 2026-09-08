local parent = script:FindFirstAncestor("AppChat").Parent
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local sduiLoadTimer = sduiSharedUtilitiesModule.SduiLoadTimer
local sduiConstantsModule = require(script.Parent.SduiConstants)

local function _(p1)
	return p1 == nil or (if typeof(p1) == "string" then string.match(p1, "^%s*$") ~= nil else typeof(p1) == "table" and next(p1) == nil)
end

return function(p1, p2)
	-- upvalues: sduiConstantsModule (ref), getSduiApiStore (ref), parent (ref), sduiLoadTimer (ref)
	local var1
	local conversationTopModalConfigKey = sduiConstantsModule.getConversationTopModalConfigKey(p2)
	local var2 = getSduiApiStore()
	
	if p1 == nil then
		var1 = true
	elseif typeof(p1) == "string" then
		local _ = string.match(p1, "^%s*$") ~= nil
	elseif typeof(p1) == "table" then
		var1 = next(p1) == nil
		var1 = nil
	else
		var1 = false
	end
	if var1 then
		var2.clearConfigEntries(conversationTopModalConfigKey)
		
		return
	end
	local partyChatResponse = require(parent.ServiceContractsProto).apppageplatform.partychat.party_chat.PartyChatResponse
	var2.seedFromDecodedResponse({
		replace = true,
		surfaceKey = sduiConstantsModule.SurfaceKey,
		configKey = conversationTopModalConfigKey,
		decodedResponse = partyChatResponse.jsonDecode(p1),
		loadTimer = sduiLoadTimer.createLoadTimer(sduiConstantsModule.SurfaceKey),
		apiProto = partyChatResponse
	})
end