local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local ConstantsModule = require(script.Parent.Constants)
local InExperienceSideSheetModule = require(CorePackages.Workspace.Packages.InExperienceSideSheet)
local IsConnectDropdownEnabledModule = require(script:FindFirstAncestor("Chrome").Integrations.Connect.isConnectDropdownEnabled)
local IsSpatialFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local IsInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local ArgoPartyExperimentation = require(CorePackages.Workspace.Packages.SocialExperiments).ArgoPartyExperimentation
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableInExperienceAvatarSwitcher = SharedFlagsModule.FFlagEnableInExperienceAvatarSwitcher
local FFlagEnableSideSheet = SharedFlagsModule.FFlagEnableSideSheet
local FFlagAddInviteFriendsIntegration = SharedFlagsModule.FFlagAddInviteFriendsIntegration
local FFlagIntegrateTraversalHistoryInSideSheet = SharedFlagsModule.FFlagIntegrateTraversalHistoryInSideSheet
local FFlagEnableInExperienceShop = SharedFlagsModule.FFlagEnableInExperienceShop
local FFlagRemoveFriendsChatUnibarEntrypoints = SharedFlagsModule.FFlagRemoveFriendsChatUnibarEntrypoints
local FFlagExpChatEnableFriendsTab = SharedFlagsModule.FFlagExpChatEnableFriendsTab
local FIntSideSheetVariant = SharedFlagsModule.FIntSideSheetVariant
local Traversal = if FFlagIntegrateTraversalHistoryInSideSheet then require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon).Traversal else nil
local FFlagAddTraversalHistory = if Traversal then Traversal.Flags.FFlagAddTraversalHistory else false

local function _(p1, Key, p2)
	if p1[Key] ~= nil then
		p1[Key] = p2
	end
end

return function()
	-- upvalues: IsConnectDropdownEnabledModule (copy), FFlagRemoveFriendsChatUnibarEntrypoints (copy), ArgoPartyExperimentation (copy), FFlagExpChatEnableFriendsTab (copy), IsSpatialFunction (copy), GuiService (copy), IsInExperienceUIVREnabled (copy), FFlagAddTraversalHistory (copy), FFlagIntegrateTraversalHistoryInSideSheet (copy), FFlagAddInviteFriendsIntegration (copy), ConstantsModule (copy), FFlagEnableInExperienceAvatarSwitcher (copy), FFlagEnableInExperienceShop (copy), InExperienceSideSheetModule (copy), FFlagEnableSideSheet (copy), FIntSideSheetVariant (copy)
	local Inverted: boolean = IsConnectDropdownEnabledModule() and not (FFlagRemoveFriendsChatUnibarEntrypoints and (ArgoPartyExperimentation.getIsRenameEnabled() and FFlagExpChatEnableFriendsTab))
	local Inverted1: boolean = not IsSpatialFunction() and not GuiService:IsTenFootInterface()
	local NoIsInExperienceUIVREnabled: boolean = not IsInExperienceUIVREnabled or not IsSpatialFunction()
	local FFlagIntegrateTraversalHistoryInSideSheet1 = FFlagAddTraversalHistory and FFlagIntegrateTraversalHistoryInSideSheet
	local config = {
		invite_friends = if FFlagAddInviteFriendsIntegration then 10 else nil,
		people = 20,
		settings = 30,
		trust_and_safety = 40,
		connect_dropdown = if Inverted then 50 else nil,
		[ConstantsModule.AVATAR_SWITCHER_ID] = if FFlagEnableInExperienceAvatarSwitcher then 60 else nil,
		[ConstantsModule.IN_EXPERIENCE_SHOP_ID] = if FFlagEnableInExperienceShop then 70 else nil,
		leaderboard = 80,
		emotes = 90,
		backpack = 100,
		traversal_history = if FFlagIntegrateTraversalHistoryInSideSheet1 then 110 else nil,
		help = 120,
		camera_entrypoint = if NoIsInExperienceUIVREnabled then 130 else nil,
		gallery = 140,
		selfie_view = if NoIsInExperienceUIVREnabled then 150 else nil,
		music_entrypoint = if Inverted1 then 160 else nil,
		[InExperienceSideSheetModule.Enums.ActionBinding.Leave] = 180,
		[InExperienceSideSheetModule.Enums.ActionBinding.Respawn] = 190
	}
	
	if FFlagEnableSideSheet and FIntSideSheetVariant == 0 then
		if config.settings ~= nil then
			config.settings = 103
		end
		if config.trust_and_safety ~= nil then
			config.trust_and_safety = 106
		end
		local INEXPERIENCESHOPID = ConstantsModule.IN_EXPERIENCE_SHOP_ID
		
		if config[INEXPERIENCESHOPID] ~= nil then
			config[INEXPERIENCESHOPID] = 143
		end
		if config.backpack ~= nil then
			config.backpack = 146
		end
	end
	if not FFlagEnableSideSheet then
		if config.connect_dropdown ~= nil then
			config.connect_dropdown = 10
		end
		local INEXPERIENCESHOPID = ConstantsModule.IN_EXPERIENCE_SHOP_ID
		
		if config[INEXPERIENCESHOPID] ~= nil then
			config[INEXPERIENCESHOPID] = 20
		end
		if config.selfie_view ~= nil then
			config.selfie_view = 30
		end
		local AVATARSWITCHERID = ConstantsModule.AVATAR_SWITCHER_ID
		
		if config[AVATARSWITCHERID] ~= nil then
			config[AVATARSWITCHERID] = 40
		end
		if config.music_entrypoint ~= nil then
			config.music_entrypoint = 50
		end
		if config.camera_entrypoint ~= nil then
			config.camera_entrypoint = 60
		end
		if config.trust_and_safety ~= nil then
			config.trust_and_safety = 70
		end
		config.respawn = 110
		config.invite_friends = nil
		config.people = nil
		config.settings = nil
		config.traversal_history = nil
		config.help = nil
		config.gallery = nil
		config[InExperienceSideSheetModule.Enums.ActionBinding.Leave] = nil
		config[InExperienceSideSheetModule.Enums.ActionBinding.Respawn] = nil
	end
	local List = {}
	
	for i in config do
		table.insert(List, i)
	end
	table.sort(List, function(A, B): boolean
		-- upvalues: config (copy)
		return config[A] < config[B]
	end)
	
	return List
end