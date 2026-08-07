local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local userProfileHeaderModule = require(profilePlatform.Components.UserProfileHeader)
local meTabUserProfileHeaderModule = require(profilePlatform.Components.UserProfileHeader.MeTabUserProfileHeader)
local aboutModule = require(profilePlatform.Components.About)
local contactDescriptionModule = require(profilePlatform.Components.ContactDescription)
local profileActionBarModule = require(profilePlatform.Components.ProfileActionBar)
local communityProfileHeaderModule = require(profilePlatform.Components.CommunityProfileHeader)
local coverPhotoModule = require(profilePlatform.Components.CoverPhoto)
local currentlyWearingModule = require(profilePlatform.Components.CurrentlyWearing)
local storeModule = require(profilePlatform.Components.Store)
local viewFullProfileModule = require(profilePlatform.Components.ViewFullProfile)
local inventoryModule = require(profilePlatform.Components.Inventory)
local favoriteExperiencesModule = require(profilePlatform.Components.FavoriteExperiences)
local contactProfileHeaderModule = require(profilePlatform.Components.ContactProfileHeader)
local experiencesModule = require(profilePlatform.Components.Experiences)
local experiencesWideCarouselModule = require(profilePlatform.Components.ExperiencesWideCarousel)
local socialLinksModule = require(profilePlatform.Components.SocialLinks)
local videosModule = require(profilePlatform.Components.Videos)
local communityLockedModule = require(profilePlatform.Components.CommunityLocked)
local eventsModule = require(profilePlatform.Components.Events)
local profileCompletionModule = require(profilePlatform.Components.ProfileCompletion)
local currentlyPlayingModule = require(profilePlatform.Components.CurrentlyPlaying)
local CTARowModule = require(profilePlatform.Components.CTARow)
local momentsModule = require(profilePlatform.Components.Moments)
local constantsModule = require(parent.ProfilePlatform.Common.Constants)
local enumsModule = require(parent.ProfilePlatform.Common.Enums)
local getPeekViewOpenHeightByProfileTypeModule = require(profilePlatform.Utils.getPeekViewOpenHeightByProfileType)
local fFlagProfilePlatformEnableFavoriteExperiencesModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableFavoriteExperiences)
local fFlagProfilePlatformEnableStore = require(parent.SharedFlags).FFlagProfilePlatformEnableStore
local fFlagAXEnableProfileTab = require(parent.SharedFlags).FFlagAXEnableProfileTab
local fFlagProfilePlatformEnableInventory = require(parent.SharedFlags).FFlagProfilePlatformEnableInventory
local fFlagAddSocialLinksToCommunityProfile = require(parent.SharedFlags).FFlagAddSocialLinksToCommunityProfile
local fFlagAddVideoToCommunityProfile = require(parent.SharedFlags).FFlagAddVideoToCommunityProfile
local fFlagAddCommunityLockedToCommunityProfile = require(parent.SharedFlags).FFlagAddCommunityLockedToCommunityProfile
local fFlagExperiencesOnProfile = require(parent.SharedFlags).FFlagExperiencesOnProfile
local fFlagEnableProfileCompletion = require(parent.SharedFlags).FFlagEnableProfileCompletion
local fFlagProfilePlatformEnableLazyLoadingComponentsModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableLazyLoadingComponents)
local fFlagAddEventsToCommunityProfileModule = require(profilePlatform.Flags.FFlagAddEventsToCommunityProfile)
local fFlagProfilePlatformAddCurrentlyPlayingModule = require(profilePlatform.Flags.FFlagProfilePlatformAddCurrentlyPlaying)
local fFlagAboutBeforeActionClientModule = require(profilePlatform.Flags.FFlagAboutBeforeActionClient)
local fFlagProfilePlatformCTAsRefactorModule = require(profilePlatform.Flags.FFlagProfilePlatformCTAsRefactor)
local fFlagProfilePlatformEnableMomentsModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableMoments)
local fixCTARowOnContactProfile = game:DefineFastFlag("FixCTARowOnContactProfile", false)

local function orderWithAboutBeforeActions(p0) --[[ line: 55 ]]
	-- upvalues: fFlagAboutBeforeActionClientModule (ref), enumsModule (ref), fFlagProfilePlatformAddCurrentlyPlayingModule (ref), cryoModule (ref)
	if not fFlagAboutBeforeActionClientModule then
		return p0
	end
	local var43 = nil
	local var44 = nil
	local var45 = nil
	
	for i, v in ipairs(p0) do
		if v == enumsModule.Components.About then
			var43 = i
		elseif v == enumsModule.Components.Actions then
			var44 = i
		elseif fFlagProfilePlatformAddCurrentlyPlayingModule and v == enumsModule.Components.CurrentlyPlaying then
			var45 = i
		end
	end
	if var43 == nil or var44 == nil or var43 < var44 then
		return p0
	end
	local var46 = cryoModule.List.join({}, p0)
	
	if fFlagProfilePlatformAddCurrentlyPlayingModule and var45 then
		local var47 = var46[var43]
		local var48 = var46[var45]
		local var49 = var46[var44]
		var46[var45] = var47
		var46[var44] = var48
		var46[var43] = var49
		
		return var46
	end
	local var50 = var46[var43]
	var46[var43] = var46[var44]
	var46[var44] = var50
	
	return var46
end

local function moveMomentsToTop(p1) --[[ line: 83 ]]
	-- upvalues: enumsModule (ref), cryoModule (ref)
	local var51 = nil
	
	for i, v in ipairs(p1) do
		if v == enumsModule.Components.Moments then
			var51 = i
			break
		end
	end
	if var51 == nil then
		return p1
	end
	local var52 = cryoModule.List.join({}, p1)
	table.remove(var52, var51)
	local var53 = 1
	
	for i_1, v_1 in ipairs(var52) do
		if v_1 == enumsModule.Components.CurrentlyWearing then
			var53 = i_1
			break
		end
	end
	table.insert(var52, var53, enumsModule.Components.Moments)
	
	return var52
end

local t = {
	[enumsModule.Components.UserProfileHeader] = userProfileHeaderModule,
	[enumsModule.Components.CurrentlyWearing] = currentlyWearingModule,
	[enumsModule.Components.Actions] = if fFlagProfilePlatformCTAsRefactorModule then CTARowModule else profileActionBarModule,
	[enumsModule.Components.Experiences] = if fFlagExperiencesOnProfile then experiencesWideCarouselModule else experiencesModule,
	[enumsModule.Components.ViewFullProfile] = viewFullProfileModule,
	[enumsModule.Components.About] = aboutModule.About,
	[enumsModule.Components.FavoriteExperiences] = if fFlagProfilePlatformEnableFavoriteExperiencesModule then favoriteExperiencesModule else nil,
	[enumsModule.Components.Inventory] = if fFlagProfilePlatformEnableInventory then inventoryModule else nil,
	[enumsModule.Components.Store] = if fFlagProfilePlatformEnableStore then storeModule else nil,
	[enumsModule.Components.ProfileCompletion] = if fFlagEnableProfileCompletion then profileCompletionModule else nil,
	[enumsModule.Components.CurrentlyPlaying] = if fFlagProfilePlatformAddCurrentlyPlayingModule then currentlyPlayingModule else nil,
	[enumsModule.Components.Moments] = if fFlagProfilePlatformEnableMomentsModule then momentsModule else nil
}
local t_1 = {
	[enumsModule.Components.CoverPhoto] = coverPhotoModule,
	[enumsModule.Components.CommunityProfileHeader] = communityProfileHeaderModule,
	[enumsModule.Components.About] = aboutModule.About,
	[enumsModule.Components.Actions] = if fFlagProfilePlatformCTAsRefactorModule then CTARowModule else profileActionBarModule,
	[enumsModule.Components.Experiences] = experiencesModule,
	[enumsModule.Components.Store] = storeModule,
	[enumsModule.Components.SocialLinks] = if fFlagAddSocialLinksToCommunityProfile then socialLinksModule else nil,
	[enumsModule.Components.Videos] = if fFlagAddVideoToCommunityProfile then videosModule else nil,
	[enumsModule.Components.ViewFullProfile] = viewFullProfileModule,
	[enumsModule.Components.CommunityLocked] = if fFlagAddCommunityLockedToCommunityProfile then communityLockedModule else nil,
	[enumsModule.Components.Events] = if fFlagAddEventsToCommunityProfileModule then eventsModule else nil
}
local t_2 = {
	[enumsModule.Components.ContactProfileHeader] = contactProfileHeaderModule,
	[enumsModule.Components.ContactDescription] = contactDescriptionModule,
	[enumsModule.Components.Actions] = if fixCTARowOnContactProfile and fFlagProfilePlatformCTAsRefactorModule then CTARowModule else profileActionBarModule
}
local var42 = if fFlagAXEnableProfileTab then cryoModule.Dictionary.join(t, {
	[enumsModule.Components.UserProfileHeader] = meTabUserProfileHeaderModule,
	[enumsModule.Components.Actions] = cryoModule.None
}) else nil

return function(p2, p3, p4, p5, p6) --[[ line: 161 ]]
	-- upvalues: reactModule (ref), constantsModule (ref), cryoModule (ref), getPeekViewOpenHeightByProfileTypeModule (ref), enumsModule (ref), fFlagAXEnableProfileTab (ref), var42 (ref), t (ref), t_1 (ref), t_2 (ref), fFlagAboutBeforeActionClientModule (ref), orderWithAboutBeforeActions (ref), fFlagProfilePlatformEnableMomentsModule (ref), moveMomentsToTop (ref), fFlagProfilePlatformEnableLazyLoadingComponentsModule (ref)
	p3 = p3 or {}
	local t_3 = {
		Layout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, constantsModule.PAGE_PADDING)
		})
	}
	
	if cryoModule.isEmpty(p3) then
		t_3.loadingView = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, getPeekViewOpenHeightByProfileTypeModule(p4))
		})
		
		return t_3
	end
	local t_4 = {}
	
	if p4 == enumsModule.ProfileTypes.User then
		t_4 = if fFlagAXEnableProfileTab and p6 then var42 else t
	elseif p4 == enumsModule.ProfileTypes.Community then
		t_4 = t_1
	elseif p4 == enumsModule.ProfileTypes.Contact then
		t_4 = t_2
	end
	local var57 = if fFlagAboutBeforeActionClientModule and p4 == enumsModule.ProfileTypes.User then orderWithAboutBeforeActions(p3) else p3
	
	if fFlagProfilePlatformEnableMomentsModule and p4 == enumsModule.ProfileTypes.User and p5 == enumsModule.Sources.MomentsFeed then
		var57 = moveMomentsToTop(var57)
	end
	for i, v in var57 do
		local var58 = t_4[v]
		
		if fFlagProfilePlatformEnableLazyLoadingComponentsModule then
			if var58 ~= nil and p2[v] ~= nil then
				t_3[v] = reactModule.createElement(var58, { layoutOrder = i })
			end
		elseif var58 ~= nil then
			t_3[v] = reactModule.createElement(var58, { layoutOrder = i })
		end
	end
	return t_3
end