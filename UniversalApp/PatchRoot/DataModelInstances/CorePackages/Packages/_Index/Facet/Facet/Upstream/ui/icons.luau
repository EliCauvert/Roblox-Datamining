local IconsModule = {
	ART = table.freeze({
		["view.grid"] = table.freeze({ assetName = "facet_icon_view_grid", tintRole = "content" }),
		["view.list"] = table.freeze({ assetName = "facet_icon_view_list", tintRole = "content" }),
		["view.table"] = table.freeze({
			assetName = "facet_icon_view_table",
			tintRole = "content"
		}),
		settings = table.freeze({ assetName = "facet_icon_settings", tintRole = "content" }),
		["facet:search"] = table.freeze({ assetName = "facet_icon_search", tintRole = "content" }),
		["chevron.leading"] = table.freeze({
			assetName = "facet_icon_chevron_left",
			tintRole = "content"
		}),
		["chevron.trailing"] = table.freeze({
			assetName = "facet_icon_chevron_right",
			tintRole = "content"
		}),
		["chevron.up"] = table.freeze({
			assetName = "facet_icon_chevron_up",
			tintRole = "content"
		}),
		["chevron.down"] = table.freeze({
			assetName = "facet_icon_chevron_down",
			tintRole = "content"
		}),
		["chevron.up.chevron.down"] = table.freeze({
			assetName = "facet_icon_chevron_up_down",
			tintRole = "content"
		}),
		checkmark = table.freeze({ assetName = "facet_icon_check", tintRole = "content" }),
		check = table.freeze({ assetName = "facet_icon_check", tintRole = "content" }),
		["facet:selection.radio.off"] = table.freeze({ assetName = "facet_icon_radio_off", tintRole = "content" }),
		["facet:selection.radio.on"] = table.freeze({ assetName = "facet_icon_radio_on", tintRole = "content" }),
		["facet:selection.check.off"] = table.freeze({ assetName = "facet_icon_check_off", tintRole = "content" }),
		close = table.freeze({ assetName = "facet_icon_close", tintRole = "content" }),
		increment = table.freeze({ assetName = "facet_icon_plus", tintRole = "content" }),
		decrement = table.freeze({ assetName = "facet_icon_minus", tintRole = "content" }),
		menu = table.freeze({ assetName = "facet_icon_menu", tintRole = "content" }),
		more = table.freeze({ assetName = "facet_icon_more", tintRole = "content" }),
		edit = table.freeze({ assetName = "facet_icon_edit", tintRole = "content" }),
		trash = table.freeze({ assetName = "facet_icon_trash", tintRole = "content" }),
		flag = table.freeze({ assetName = "facet_icon_flag", tintRole = "content" }),
		["status.info"] = table.freeze({ assetName = "facet_icon_info", tintRole = "content" }),
		["status.success"] = table.freeze({ assetName = "facet_icon_success", tintRole = "content" }),
		["status.warning"] = table.freeze({ assetName = "facet_icon_warning", tintRole = "content" }),
		["status.error"] = table.freeze({ assetName = "facet_icon_error", tintRole = "content" }),
		calendar = table.freeze({ assetName = "facet_icon_calendar", tintRole = "content" }),
		clock = table.freeze({ assetName = "facet_icon_clock", tintRole = "content" }),
		["vote.up"] = table.freeze({ assetName = "facet_icon_thumb_up", tintRole = "content" }),
		["vote.down"] = table.freeze({
			assetName = "facet_icon_thumb_down",
			tintRole = "content"
		}),
		person = table.freeze({ assetName = "facet_icon_person", tintRole = "content" }),
		["chevron.first"] = table.freeze({
			assetName = "facet_icon_chevron_first",
			tintRole = "content"
		}),
		["chevron.last"] = table.freeze({
			assetName = "facet_icon_chevron_last",
			tintRole = "content"
		}),
		star = table.freeze({ assetName = "facet_icon_star", tintRole = "content" }),
		heart = table.freeze({ assetName = "facet_icon_heart", tintRole = "content" }),
		chat = table.freeze({ assetName = "facet_icon_chat", tintRole = "content" }),
		gift = table.freeze({ assetName = "facet_icon_gift", tintRole = "content" }),
		coin = table.freeze({ assetName = "facet_icon_coin", tintRole = "content" }),
		gem = table.freeze({ assetName = "facet_icon_gem", tintRole = "content" }),
		bag = table.freeze({ assetName = "facet_icon_bag", tintRole = "content" }),
		trophy = table.freeze({ assetName = "facet_icon_trophy", tintRole = "content" }),
		crown = table.freeze({ assetName = "facet_icon_crown", tintRole = "content" }),
		lock = table.freeze({ assetName = "facet_icon_lock", tintRole = "content" }),
		bolt = table.freeze({ assetName = "facet_icon_bolt", tintRole = "content" }),
		wrench = table.freeze({ assetName = "facet_icon_wrench", tintRole = "content" }),
		timer = table.freeze({ assetName = "facet_icon_timer", tintRole = "content" }),
		car = table.freeze({ assetName = "facet_icon_car", tintRole = "content" })
	}),
	BUILTIN = table.freeze({
		speaker = table.freeze({
			assetName = "roblox_speaker",
			contentId = "rbxasset://textures/ui/VoiceChat/SpeakerLight/Unmuted0.png",
			tintRole = "content"
		}),
		volume = table.freeze({
			assetName = "roblox_speaker",
			contentId = "rbxasset://textures/ui/VoiceChat/SpeakerLight/Unmuted0.png",
			tintRole = "content"
		}),
		mute = table.freeze({
			assetName = "roblox_speaker_muted",
			contentId = "rbxasset://textures/ui/VoiceChat/SpeakerLight/Muted.png",
			tintRole = "content"
		})
	})
}

function IconsModule.registered(Text: string): boolean
	-- upvalues: IconsModule (copy)
	local Match: string = string.match(Text, "^(.+)%.fill$") or Text
	
	return IconsModule.ART[Match] ~= nil or IconsModule.BUILTIN[Match] ~= nil
end

function IconsModule.resolve(p1)
	-- upvalues: IconsModule (copy)
	local ARTEntry = IconsModule.ART[p1] or IconsModule.BUILTIN[p1]
	
	return if ARTEntry == nil or type(ARTEntry.contentId) ~= "string" or ARTEntry.contentId == "" then nil else ARTEntry
end

return IconsModule