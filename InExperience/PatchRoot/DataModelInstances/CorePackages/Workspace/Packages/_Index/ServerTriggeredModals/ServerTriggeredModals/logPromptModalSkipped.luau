local ServerTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local SendPromptModalSkippedEventModule = require(ServerTriggeredModals.sendPromptModalSkippedEvent)
local _ = require(ServerTriggeredModals.SduiV2.Types.PromptEntry)
local FFlagPromptsImpressionUsesTitle = require(ServerTriggeredModals.Parent.SharedFlags).FFlagPromptsImpressionUsesTitle
local Reason = {
	AlreadyShown = "alreadyShown",
	NotFocused = "notFocused",
	IncompleteEntry = "incompleteEntry",
	LegacyMetadata = "legacyMetadata"
}
local t = {}
local t1 = {}

local function _(p1)
	-- upvalues: FFlagPromptsImpressionUsesTitle (copy)
	return (if FFlagPromptsImpressionUsesTitle then p1.title else p1.robloxComponentType) or ""
end

local function log(Reason1, EntryPoint, p1)
	-- upvalues: FFlagPromptsImpressionUsesTitle (copy), t (ref), Reason (copy), t1 (ref), SendPromptModalSkippedEventModule (copy)
	local Identifier = p1.identifier or ""
	local Title = (if FFlagPromptsImpressionUsesTitle then p1.title else p1.robloxComponentType) or ""
	local Entry = t[EntryPoint]
	
	if Reason1 == Reason.AlreadyShown and Entry ~= nil and p1.identifier ~= nil and Entry.identifier == p1.identifier then return end
	local Text = EntryPoint .. "|" .. Identifier .. "|" .. Title .. "|" .. Reason1
	
	if not t1[Text] then
		t1[Text] = true
		SendPromptModalSkippedEventModule({
			reason = Reason1,
			modalId = Identifier,
			modalType = Title,
			entryPoint = EntryPoint,
			shownByModalId = Entry and Entry.identifier or "",
			shownByModalType = Entry and (if FFlagPromptsImpressionUsesTitle then Entry.title else Entry.robloxComponentType) or ""
		})
		
		return
	end
end

return {
	Reason = Reason,
	log = log,
	logAll = function(Reason, EntryPoint, List)
		-- upvalues: log (copy)
		for _, value in List do
			log(Reason, EntryPoint, value)
		end
	end,
	markShown = function(Key, p1)
		-- upvalues: t (ref)
		if t[Key] == nil then
			t[Key] = p1
		end
	end,
	resetForTests = function()
		-- upvalues: t (ref), t1 (ref)
		t = {}
		t1 = {}
	end
}