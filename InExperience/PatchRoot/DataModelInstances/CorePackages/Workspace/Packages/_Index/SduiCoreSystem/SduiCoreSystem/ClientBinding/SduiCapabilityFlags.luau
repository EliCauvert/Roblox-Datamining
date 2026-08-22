local sharedFlagsModule = require(script:FindFirstAncestor("SduiCoreSystem").Parent.SharedFlags)

local function _() --[[ line: 13 | named "isPinShortcutServiceEnabled" ]]
	return game:GetEngineFeature("PinShortcutServiceEnabled")
end

return {
	CAPABILITY_SUPPORTS_HYDRATION_CLIENT_HINTS = sharedFlagsModule.FFlagSduiHydrationClientHints,
	CAPABILITY_SUPPORTS_EDP_PERSISTENT_ACTION_BAR_PLAY_BUTTON = sharedFlagsModule.FFlagSduiEdpPersistentActionBarPlayButton,
	CAPABILITY_SUPPORTS_EDP_COMMUNITY_SECTION = sharedFlagsModule.FFlagSduiCommunitySectionSupport,
	CAPABILITY_SUPPORTS_EDP_BUILD_TAG = sharedFlagsModule.FFlagLuaAppEdpShowBuildTag,
	CAPABILITY_SUPPORTS_OPEN_EXPERIENCE_STORE_SEE_ALL_WITH_WEBVIEW_FALLBACK_ACTION = sharedFlagsModule.FFlagSduiCapabilityDevStoreSeeAllWebviewFallback,
	CAPABILITY_SUPPORTS_PIN_SHORTCUT_ACTION = (function() --[[ line: 17 | named "isPinShortcutAvailable" ]]
		-- upvalues: sharedFlagsModule (ref)
		if not sharedFlagsModule.FFlagSduiPinShortcutAction then
			return false
		elseif not game:GetEngineFeature("PinShortcutServiceEnabled") then
			return false
		end
		local var1 = nil
		pcall(function() --[[ line: 26 ]]
			-- upvalues: var1 (write)
			var1 = game:GetService("PinShortcutService")
		end)
		
		if var1 == nil then
			return false
		end
		local ok, status = pcall(function() --[[ line: 32 ]]
			-- upvalues: var1 (write)
			return var1:IsAvailable()
		end)
		
		return if ok then status == true else false
	end)(),
	CAPABILITY_SUPPORTS_EVENT_RSVP_FACE_PILE = sharedFlagsModule.FFlagSduiEventRsvpFacePile,
	CAPABILITY_SUPPORTS_SCALED_PLAY_BUTTON_AND_IMAGE_SIZES = sharedFlagsModule.FFlagSduiScalePlayButtonAndImageSizes
}