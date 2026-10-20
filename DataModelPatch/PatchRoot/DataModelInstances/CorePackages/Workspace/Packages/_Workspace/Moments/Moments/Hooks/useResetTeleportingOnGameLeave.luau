local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local MessageBus = require(Parent.MessageBus).MessageBus
local GetMomentsPreferencesStoreModule = require(Moments.Stores.GetMomentsPreferencesStore)
local GetFFlagMomentsPauseAudioThroughTeleportModule = require(Moments.Flags.GetFFlagMomentsPauseAudioThroughTeleport)

local function gameLeaveMessageValidator(p1): boolean
	return typeof(p1) == "table"
end

return function()
	-- upvalues: ReactModule (copy), GetFFlagMomentsPauseAudioThroughTeleportModule (copy), MessageBus (copy), gameLeaveMessageValidator (copy), GetMomentsPreferencesStoreModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: GetFFlagMomentsPauseAudioThroughTeleportModule (upval), MessageBus (upval), gameLeaveMessageValidator (upval), GetMomentsPreferencesStoreModule (upval)
		if not GetFFlagMomentsPauseAudioThroughTeleportModule() then return end
		local NewResult = MessageBus.Subscriber.new()
		local GameMessageId = MessageBus.getMessageId("Game", "onGameLeave")
		NewResult:subscribe({
			mid = GameMessageId,
			validateParams = gameLeaveMessageValidator
		}, function(_)
			-- upvalues: GetMomentsPreferencesStoreModule (upval)
			GetMomentsPreferencesStoreModule(false).setTeleporting(false)
		end)
		
		return function()
			-- upvalues: NewResult (copy), GameMessageId (copy)
			NewResult:unsubscribeWithMsgId(GameMessageId)
		end
	end, {})
end