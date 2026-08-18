local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local constantsModule = require(script.Parent.Constants)
local inExperienceSideSheetModule = require(corePackagesService.Workspace.Packages.InExperienceSideSheet)
local isConnectDropdownEnabledModule = require(chrome.Integrations.Connect.isConnectDropdownEnabled)
local isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local argoPartyExperimentation = require(corePackagesService.Workspace.Packages.SocialExperiments).ArgoPartyExperimentation
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagEnableInExperienceAvatarSwitcher = sharedFlagsModule.FFlagEnableInExperienceAvatarSwitcher
local fFlagEnableSideSheet = sharedFlagsModule.FFlagEnableSideSheet
local fFlagAddInviteFriendsIntegration = sharedFlagsModule.FFlagAddInviteFriendsIntegration
local fFlagIntegrateTraversalHistoryInSideSheet = sharedFlagsModule.FFlagIntegrateTraversalHistoryInSideSheet
local fFlagEnableInExperienceShop = sharedFlagsModule.FFlagEnableInExperienceShop
local fFlagRemoveFriendsChatUnibarEntrypoints = sharedFlagsModule.FFlagRemoveFriendsChatUnibarEntrypoints
local fFlagExpChatCanShowFriendsTab = sharedFlagsModule.FFlagExpChatCanShowFriendsTab
local fIntSideSheetVariant = sharedFlagsModule.FIntSideSheetVariant
local fFlagDebugEnablePioneerUX = sharedFlagsModule.FFlagDebugEnablePioneerUX
local var7 = if fFlagIntegrateTraversalHistoryInSideSheet then require(corePackagesService.Workspace.Packages.CoreScriptsRoactCommon).Traversal else nil
local var8 = if var7 then var7.Flags.FFlagAddTraversalHistory else false

local function _(p0, p1, p2) --[[ line: 34 | named "reorder" ]]
	if p0[p1] ~= nil then
		p0[p1] = p2
	end
end

return function() --[[ line: 41 | named "buildMenuOrder" ]]
	-- upvalues: isConnectDropdownEnabledModule (ref), fFlagRemoveFriendsChatUnibarEntrypoints (ref), argoPartyExperimentation (ref), fFlagExpChatCanShowFriendsTab (ref), isSpatial (ref), guiService (ref), isInExperienceUIVREnabled (ref), var8 (ref), fFlagIntegrateTraversalHistoryInSideSheet (ref), fFlagAddInviteFriendsIntegration (ref), constantsModule (ref), fFlagEnableInExperienceAvatarSwitcher (ref), fFlagEnableInExperienceShop (ref), inExperienceSideSheetModule (ref), fFlagEnableSideSheet (ref), fIntSideSheetVariant (ref), fFlagDebugEnablePioneerUX (ref)
	local var9 = isConnectDropdownEnabledModule()
	
	if var9 then
		var9 = not (fFlagRemoveFriendsChatUnibarEntrypoints and (argoPartyExperimentation.getIsRenameEnabled() and fFlagExpChatCanShowFriendsTab))
	end
	local var10 = not isInExperienceUIVREnabled or not isSpatial()
	local t = {
		invite_friends = if fFlagAddInviteFriendsIntegration then 10 else nil,
		people = 20,
		settings = 30,
		trust_and_safety = 40,
		connect_dropdown = if var9 then 50 else nil,
		[constantsModule.AVATAR_SWITCHER_ID] = if fFlagEnableInExperienceAvatarSwitcher then 60 else nil,
		[constantsModule.IN_EXPERIENCE_SHOP_ID] = if fFlagEnableInExperienceShop then 70 else nil,
		leaderboard = 80,
		emotes = 90,
		backpack = 100,
		traversal_history = if var8 and fFlagIntegrateTraversalHistoryInSideSheet then 110 else nil,
		help = 120,
		camera_entrypoint = if var10 then 130 else nil,
		gallery = 140,
		selfie_view = if var10 then 150 else nil,
		music_entrypoint = if not isSpatial() and not guiService:IsTenFootInterface() then 160 else nil,
		[inExperienceSideSheetModule.Enums.ActionBinding.Leave] = 180,
		[inExperienceSideSheetModule.Enums.ActionBinding.Respawn] = 190
	}
	
	if fFlagEnableSideSheet then
		if fIntSideSheetVariant == 0 then
			if t.settings ~= nil then
				t.settings = 103
			end
			if t.trust_and_safety ~= nil then
				t.trust_and_safety = 106
			end
			local iNEXPERIENCESHOPID = constantsModule.IN_EXPERIENCE_SHOP_ID
			
			if t[iNEXPERIENCESHOPID] ~= nil then
				t[iNEXPERIENCESHOPID] = 143
			end
			if t.backpack ~= nil then
				t.backpack = 146
			end
		end
		if fFlagDebugEnablePioneerUX then
			t.connect_dropdown = nil
			t.invite_friends = nil
			t[constantsModule.AVATAR_SWITCHER_ID] = nil
			t.emotes = nil
			t.traversal_history = nil
		end
	elseif t.connect_dropdown ~= nil then
		t.connect_dropdown = 10
	end
	local iNEXPERIENCESHOPID = constantsModule.IN_EXPERIENCE_SHOP_ID
	
	if t[iNEXPERIENCESHOPID] ~= nil then
		t[iNEXPERIENCESHOPID] = 20
	end
	if t.selfie_view ~= nil then
		t.selfie_view = 30
	end
	local AVATAR_SWITCHER_ID = constantsModule.AVATAR_SWITCHER_ID
	
	if t[AVATAR_SWITCHER_ID] ~= nil then
		t[AVATAR_SWITCHER_ID] = 40
	end
	if t.music_entrypoint ~= nil then
		t.music_entrypoint = 50
	end
	if t.camera_entrypoint ~= nil then
		t.camera_entrypoint = 60
	end
	if t.trust_and_safety ~= nil then
		t.trust_and_safety = 70
	end
	t.respawn = 110
	t.invite_friends = nil
	t.people = nil
	t.settings = nil
	t.traversal_history = nil
	t.help = nil
	t.gallery = nil
	t[inExperienceSideSheetModule.Enums.ActionBinding.Leave] = nil
	t[inExperienceSideSheetModule.Enums.ActionBinding.Respawn] = nil
	local t_1 = {}
	
	for i in t do
		table.insert(t_1, i)
	end
	table.sort(t_1, function(p3, p4) --[[ line: 118 ]]
		-- upvalues: t (ref)
		return t[p3] < t[p4]
	end)
	
	return t_1
end