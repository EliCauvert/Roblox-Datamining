local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local ConstantsModule = require(script.Parent.Constants)
local InExperienceSideSheetModule = require(CorePackages.Workspace.Packages.InExperienceSideSheet)
local IsConnectDropdownEnabledModule = require(Chrome.Integrations.Connect.isConnectDropdownEnabled)
local IsSpatialFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local IsTenFootInterfaceFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isTenFootInterface
local IsInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local ArgoPartyExperimentation = require(CorePackages.Workspace.Packages.SocialExperiments).ArgoPartyExperimentation
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableInExperienceAvatarSwitcher = SharedFlagsModule.FFlagEnableInExperienceAvatarSwitcher
local IsSideSheetEnabledModule = require(CorePackages.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local FFlagAddInviteFriendsIntegration = SharedFlagsModule.FFlagAddInviteFriendsIntegration
local FFlagIntegrateTraversalHistoryInSideSheet = SharedFlagsModule.FFlagIntegrateTraversalHistoryInSideSheet
local FFlagEnableInExperienceShop = SharedFlagsModule.FFlagEnableInExperienceShop
local FFlagRemoveFriendsChatUnibarEntrypoints = SharedFlagsModule.FFlagRemoveFriendsChatUnibarEntrypoints
local FFlagExpChatCanShowFriendsTab = SharedFlagsModule.FFlagExpChatCanShowFriendsTab
local FFlagShowSwitchServerButton = SharedFlagsModule.FFlagShowSwitchServerButton
local IsPioneerLaunchFunction = require(CorePackages.Workspace.Packages.PioneerUtils).isPioneerLaunch
local FFlagEnableSideSheetRobuxWidgetModule = require(Chrome.Flags.FFlagEnableSideSheetRobuxWidget)
local Traversal = if FFlagIntegrateTraversalHistoryInSideSheet then require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon).Traversal else nil
local FFlagAddTraversalHistory = if Traversal then Traversal.Flags.FFlagAddTraversalHistory else false

local function _(p1, Key, p2)
	if p1[Key] ~= nil then
		p1[Key] = p2
	end
end

return function()
	-- upvalues: IsConnectDropdownEnabledModule (copy), FFlagRemoveFriendsChatUnibarEntrypoints (copy), ArgoPartyExperimentation (copy), FFlagExpChatCanShowFriendsTab (copy), IsSpatialFunction (copy), IsTenFootInterfaceFunction (copy), IsInExperienceUIVREnabled (copy), FFlagAddTraversalHistory (copy), FFlagIntegrateTraversalHistoryInSideSheet (copy), FFlagEnableSideSheetRobuxWidgetModule (copy), IsSideSheetEnabledModule (copy), FFlagAddInviteFriendsIntegration (copy), ConstantsModule (copy), FFlagEnableInExperienceAvatarSwitcher (copy), FFlagShowSwitchServerButton (copy), IsPioneerLaunchFunction (copy), FFlagEnableInExperienceShop (copy), InExperienceSideSheetModule (copy)
	local Inverted: boolean = IsConnectDropdownEnabledModule() and not (FFlagRemoveFriendsChatUnibarEntrypoints and (ArgoPartyExperimentation.getIsRenameEnabled() and FFlagExpChatCanShowFriendsTab))
	local Inverted1: boolean = not IsSpatialFunction() and not IsTenFootInterfaceFunction()
	local NoIsInExperienceUIVREnabled: boolean = not IsInExperienceUIVREnabled or not IsSpatialFunction()
	local FFlagIntegrateTraversalHistoryInSideSheet1 = FFlagAddTraversalHistory and FFlagIntegrateTraversalHistoryInSideSheet
	local config = {
		RobuxWidget = if FFlagEnableSideSheetRobuxWidgetModule and IsSideSheetEnabledModule then 5 else nil,
		invite_friends = if FFlagAddInviteFriendsIntegration then 10 else nil,
		people = 20,
		settings = 30,
		trust_and_safety = 40,
		connect_dropdown = if Inverted then 50 else nil,
		[ConstantsModule.AVATAR_SWITCHER_ID] = if FFlagEnableInExperienceAvatarSwitcher then 60 else nil,
		[ConstantsModule.SWITCH_SERVER_ID] = if FFlagShowSwitchServerButton or IsPioneerLaunchFunction() then 65 else nil,
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
		AccountUpsell = if IsPioneerLaunchFunction() then 170 else nil,
		[InExperienceSideSheetModule.Enums.ActionBinding.Leave] = 180,
		[InExperienceSideSheetModule.Enums.ActionBinding.Respawn] = 190
	}
	
	if IsPioneerLaunchFunction() then
		config.connect_dropdown = nil
		config[ConstantsModule.AVATAR_SWITCHER_ID] = nil
		config.emotes = nil
		config.traversal_history = nil
		config.camera_entrypoint = nil
		config.gallery = nil
		local SWITCHSERVERID = ConstantsModule.SWITCH_SERVER_ID
		
		if config[SWITCHSERVERID] ~= nil then
			config[SWITCHSERVERID] = 200
		end
	elseif not IsSideSheetEnabledModule then
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
		config[ConstantsModule.SWITCH_SERVER_ID] = nil
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