local Parent = script:FindFirstAncestor("AppChat").Parent
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local SduiLoadTimer = SduiSharedUtilitiesModule.SduiLoadTimer
local SduiConstantsModule = require(script.Parent.SduiConstants)

local function _(Text: string): boolean
	return Text == nil or (if typeof(Text) == "string" then string.match(Text, "^%s*$") ~= nil else typeof(Text) == "table" and next(Text) == nil)
end

return function(Text: string, p1)
	-- upvalues: SduiConstantsModule (copy), GetSduiApiStoreFunction (copy), Parent (copy), SduiLoadTimer (copy)
	local ConversationTopModalConfigKey = SduiConstantsModule.getConversationTopModalConfigKey(p1)
	local SduiApiStore = GetSduiApiStoreFunction()
	
	if Text == nil or (if typeof(Text) == "string" then string.match(Text, "^%s*$") ~= nil else typeof(Text) == "table" and next(Text) == nil) then
		SduiApiStore.clearConfigEntries(ConversationTopModalConfigKey)
		
		return
	else
		local PartyChatResponse = require(Parent.ServiceContractsProto).apppageplatform.partychat.party_chat.PartyChatResponse
		SduiApiStore.seedFromDecodedResponse({
			replace = true,
			surfaceKey = SduiConstantsModule.SurfaceKey,
			configKey = ConversationTopModalConfigKey,
			decodedResponse = PartyChatResponse.jsonDecode(Text),
			loadTimer = SduiLoadTimer.createLoadTimer(SduiConstantsModule.SurfaceKey),
			apiProto = PartyChatResponse
		})
	end
end