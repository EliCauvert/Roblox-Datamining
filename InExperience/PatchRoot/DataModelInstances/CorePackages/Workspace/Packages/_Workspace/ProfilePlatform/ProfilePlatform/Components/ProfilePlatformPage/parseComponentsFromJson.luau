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

local function orderWithAboutBeforeActions(p1)
	-- upvalues: fFlagAboutBeforeActionClientModule (ref), enumsModule (ref), fFlagProfilePlatformAddCurrentlyPlayingModule (ref), cryoModule (ref)
	if not fFlagAboutBeforeActionClientModule then
		return p1
	end
	local var1 = nil
	local var2 = nil
	local var3 = nil
	
	for i, v in ipairs(p1) do
		if v == enumsModule.Components.About then
			var1 = i
		elseif v == enumsModule.Components.Actions then
			var2 = i
		elseif fFlagProfilePlatformAddCurrentlyPlayingModule and v == enumsModule.Components.CurrentlyPlaying then
			var3 = i
		end
	end
	if var1 == nil or var2 == nil or var1 < var2 then
		return p1
	end
	local var4 = cryoModule.List.join({}, p1)
	
	if fFlagProfilePlatformAddCurrentlyPlayingModule and var3 then
		local var5 = var4[var1]
		local var6 = var4[var3]
		local var7 = var4[var2]
		var4[var3] = var5
		var4[var2] = var6
		var4[var1] = var7
		
		return var4
	end
	local var8 = var4[var1]
	var4[var1] = var4[var2]
	var4[var2] = var8
	
	return var4
end

local function moveMomentsToTop(p2)
	-- upvalues: enumsModule (ref), cryoModule (ref)
	local var9 = nil
	
	for i, v in ipairs(p2) do
		if v == enumsModule.Components.Moments then
			var9 = i
			break
		end
	end
	if var9 == nil then
		return p2
	end
	local var10 = cryoModule.List.join({}, p2)
	table.remove(var10, var9)
	local var11 = 1
	
	for i_1, v_1 in ipairs(var10) do
		if v_1 == enumsModule.Components.CurrentlyWearing then
			var11 = i_1
			break
		end
	end
	table.insert(var10, var11, enumsModule.Components.Moments)
	
	return var10
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
	[enumsModule.Components.Actions] = if fFlagProfilePlatformCTAsRefactorModule then CTARowModule else profileActionBarModule
}
local var12 = if fFlagAXEnableProfileTab then cryoModule.Dictionary.join(t, {
	[enumsModule.Components.UserProfileHeader] = meTabUserProfileHeaderModule,
	[enumsModule.Components.Actions] = cryoModule.None
}) else nil

return function(p3, p4, p5, p6, p7)
	-- upvalues: reactModule (ref), constantsModule (ref), cryoModule (ref), getPeekViewOpenHeightByProfileTypeModule (ref), enumsModule (ref), fFlagAXEnableProfileTab (ref), var12 (ref), t (ref), t_1 (ref), t_2 (ref), fFlagAboutBeforeActionClientModule (ref), orderWithAboutBeforeActions (ref), fFlagProfilePlatformEnableMomentsModule (ref), moveMomentsToTop (ref), fFlagProfilePlatformEnableLazyLoadingComponentsModule (ref)
	p4 = p4 or {}
	local t_3 = {
		Layout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, constantsModule.PAGE_PADDING)
		})
	}
	
	if cryoModule.isEmpty(p4) then
		t_3.loadingView = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, getPeekViewOpenHeightByProfileTypeModule(p5))
		})
		
		return t_3
	end
	local t_4 = {}
	
	if p5 == enumsModule.ProfileTypes.User then
		t_4 = if fFlagAXEnableProfileTab and p7 then var12 else t
	elseif p5 == enumsModule.ProfileTypes.Community then
		t_4 = t_1
	elseif p5 == enumsModule.ProfileTypes.Contact then
		t_4 = t_2
	end
	local var13 = if fFlagAboutBeforeActionClientModule and p5 == enumsModule.ProfileTypes.User then orderWithAboutBeforeActions(p4) else p4
	
	if fFlagProfilePlatformEnableMomentsModule and p5 == enumsModule.ProfileTypes.User and p6 == enumsModule.Sources.MomentsFeed then
		var13 = moveMomentsToTop(var13)
	end
	for i, v in var13 do
		local var14 = t_4[v]
		
		if fFlagProfilePlatformEnableLazyLoadingComponentsModule then
			if var14 ~= nil and p3[v] ~= nil then
				t_3[v] = reactModule.createElement(var14, { layoutOrder = i })
			end
		elseif var14 ~= nil then
			t_3[v] = reactModule.createElement(var14, { layoutOrder = i })
		end
	end
	return t_3
end