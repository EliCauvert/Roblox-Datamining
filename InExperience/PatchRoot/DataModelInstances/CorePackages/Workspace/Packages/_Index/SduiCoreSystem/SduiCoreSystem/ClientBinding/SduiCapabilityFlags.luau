local SharedFlagsModule = require(script:FindFirstAncestor("SduiCoreSystem").Parent.SharedFlags)

local function _()
	return game:GetEngineFeature("PinShortcutServiceEnabled")
end

return {
	CAPABILITY_SUPPORTS_HYDRATION_CLIENT_HINTS = true,
	CAPABILITY_SUPPORTS_MULTI_SIZE_POOL = SharedFlagsModule.FFlagSduiPerSectionPoolSizing,
	CAPABILITY_SUPPORTS_EDP_PERSISTENT_ACTION_BAR_PLAY_BUTTON = SharedFlagsModule.FFlagSduiEdpPersistentActionBarPlayButton,
	CAPABILITY_SUPPORTS_EDP_COMMUNITY_SECTION = SharedFlagsModule.FFlagSduiCommunitySectionSupport,
	CAPABILITY_SUPPORTS_EDP_BUILD_TAG = SharedFlagsModule.FFlagLuaAppEdpShowBuildTag,
	CAPABILITY_SUPPORTS_OPEN_EXPERIENCE_STORE_SEE_ALL_WITH_WEBVIEW_FALLBACK_ACTION = SharedFlagsModule.FFlagSduiCapabilityDevStoreSeeAllWebviewFallback,
	CAPABILITY_SUPPORTS_PIN_SHORTCUT_ACTION = (function(): boolean
		-- upvalues: SharedFlagsModule (copy)
		if not SharedFlagsModule.FFlagSduiPinShortcutAction then
			return false
		elseif not game:GetEngineFeature("PinShortcutServiceEnabled") then
			return false
		else
			local PinShortcutService = nil
			pcall(function()
				-- upvalues: PinShortcutService (ref)
				PinShortcutService = game:GetService("PinShortcutService")
			end)
			
			if PinShortcutService == nil then
				return false
			else
				local Success, Result = pcall(function()
					-- upvalues: PinShortcutService (ref)
					return PinShortcutService:IsAvailable()
				end)
				
				return if Success then Result == true else false
			end
		end
	end)(),
	CAPABILITY_SUPPORTS_EVENT_RSVP_FACE_PILE = SharedFlagsModule.FFlagSduiEventRsvpFacePile,
	CAPABILITY_SUPPORTS_SCALED_PLAY_BUTTON_AND_IMAGE_SIZES = SharedFlagsModule.FFlagSduiScalePlayButtonAndImageSizes,
	CAPABILITY_SUPPORTS_EXTENDED_CLIENT_CAPABILITIES = SharedFlagsModule.FFlagSduiAdvertiseRuntimeSupportSets,
	CAPABILITY_SUPPORTS_PREFERRED_TEXT_SIZE_LINE_BUDGETS = SharedFlagsModule.FFlagSduiPreferredTextSizeLineBudgets,
	CAPABILITY_SUPPORTS_CONTAINER_QUERIES = SharedFlagsModule.FFlagSduiContainerQueries,
	CAPABILITY_SUPPORTS_EDP_EARLY_ACCESS_UPSELL = SharedFlagsModule.FFlagEnableGameJoinEarlyAccess,
	CAPABILITY_SUPPORTS_EDP_INFO_TABLE_STABLE_ITEM_KEYS = SharedFlagsModule.FFlagInfoTableStableItemKeys,
	CAPABILITY_SUPPORTS_VIDEO_PLAYER_ACCESS_CONTEXT = SharedFlagsModule.FFlagLuaAppHomeMomentVideoFallback,
	CAPABILITY_SUPPORTS_GROUP_ANNOUNCEMENTS = SharedFlagsModule.FFlagGroupAnnouncementsSdui,
	CAPABILITY_SUPPORTS_EDP_MEDIA_GALLERY_MOMENT_VIDEO = SharedFlagsModule.FFlagLuaAppEdpMomentVideo
}