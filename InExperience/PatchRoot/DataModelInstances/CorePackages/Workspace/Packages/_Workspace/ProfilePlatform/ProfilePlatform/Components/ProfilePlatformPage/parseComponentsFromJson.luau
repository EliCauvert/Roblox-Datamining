local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local MeTabUserProfileHeaderModule = require(ProfilePlatform.Components.UserProfileHeader.MeTabUserProfileHeader)
local AboutModule = require(ProfilePlatform.Components.About)
local StoreModule = require(ProfilePlatform.Components.Store)
local ViewFullProfileModule = require(ProfilePlatform.Components.ViewFullProfile)
local InventoryModule = require(ProfilePlatform.Components.Inventory)
local FavoriteExperiencesModule = require(ProfilePlatform.Components.FavoriteExperiences)
local ExperiencesModule = require(ProfilePlatform.Components.Experiences)
local ExperiencesWideCarouselModule = require(ProfilePlatform.Components.ExperiencesWideCarousel)
local SocialLinksModule = require(ProfilePlatform.Components.SocialLinks)
local CommunityLockedModule = require(ProfilePlatform.Components.CommunityLocked)
local EventsModule = require(ProfilePlatform.Components.Events)
local AnnouncementsModule = require(ProfilePlatform.Components.Announcements)
local ProfileCompletionModule = require(ProfilePlatform.Components.ProfileCompletion)
local CurrentlyPlayingModule = require(ProfilePlatform.Components.CurrentlyPlaying)
local CTARowModule = require(ProfilePlatform.Components.CTARow)
local MomentsModule = require(ProfilePlatform.Components.Moments)
local ConstantsModule = require(Parent.ProfilePlatform.Common.Constants)
local EnumsModule = require(Parent.ProfilePlatform.Common.Enums)
local GetPeekViewOpenHeightByProfileTypeModule = require(ProfilePlatform.Utils.getPeekViewOpenHeightByProfileType)
local FFlagProfilePlatformEnableFavoriteExperiencesModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableFavoriteExperiences)
local FFlagProfilePlatformEnableStore = require(Parent.SharedFlags).FFlagProfilePlatformEnableStore
local FFlagAXEnableProfileTab = require(Parent.SharedFlags).FFlagAXEnableProfileTab
local FFlagProfilePlatformEnableInventory = require(Parent.SharedFlags).FFlagProfilePlatformEnableInventory
local FFlagAddSocialLinksToCommunityProfile = require(Parent.SharedFlags).FFlagAddSocialLinksToCommunityProfile
local FFlagAddCommunityLockedToCommunityProfile = require(Parent.SharedFlags).FFlagAddCommunityLockedToCommunityProfile
local FFlagEnableProfileCompletion = require(Parent.SharedFlags).FFlagEnableProfileCompletion
local FFlagProfilePlatformEnableLazyLoadingComponentsModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableLazyLoadingComponents)
local FFlagAddEventsToCommunityProfileModule = require(ProfilePlatform.Flags.FFlagAddEventsToCommunityProfile)
local FFlagGroupAnnouncementsSdui = require(Parent.SharedFlags).FFlagGroupAnnouncementsSdui
local FFlagProfilePlatformAddCurrentlyPlayingModule = require(ProfilePlatform.Flags.FFlagProfilePlatformAddCurrentlyPlaying)
local FFlagAboutBeforeActionClientModule = require(ProfilePlatform.Flags.FFlagAboutBeforeActionClient)
local FFlagProfilePlatformEnableMomentsModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableMoments)

local function orderWithAboutBeforeActions(Abouts)
	-- upvalues: FFlagAboutBeforeActionClientModule (copy), EnumsModule (copy), FFlagProfilePlatformAddCurrentlyPlayingModule (copy), CryoModule (copy)
	if not FFlagAboutBeforeActionClientModule then
		return Abouts
	end
	local v1 = nil
	local v2 = nil
	local v3 = nil
	
	for i, about in ipairs(Abouts) do
		if about == EnumsModule.Components.About then
			v1 = i
		elseif about == EnumsModule.Components.Actions then
			v2 = i
		elseif FFlagProfilePlatformAddCurrentlyPlayingModule and about == EnumsModule.Components.CurrentlyPlaying then
			v3 = i
		end
	end
	if v1 == nil or v2 == nil or v1 < v2 then
		return Abouts
	end
	local JoinResult = CryoModule.List.join({}, Abouts)
	
	if FFlagProfilePlatformAddCurrentlyPlayingModule and v3 then
		local JoinResultEntry = JoinResult[v3]
		local JoinResultEntry1 = JoinResult[v2]
		JoinResult[v3] = JoinResult[v1]
		JoinResult[v2] = JoinResultEntry
		JoinResult[v1] = JoinResultEntry1
		
		return JoinResult
	else
		local JoinResultEntry = JoinResult[v1]
		JoinResult[v1] = JoinResult[v2]
		JoinResult[v2] = JoinResultEntry
		
		return JoinResult
	end
end

local function moveMomentsToTop(List)
	-- upvalues: EnumsModule (copy), CryoModule (copy)
	local Index = nil
	
	for i, value in ipairs(List) do
		if value == EnumsModule.Components.Moments then
			Index = i
			break
		end
	end
	if Index == nil then
		return List
	end
	local JoinResult = CryoModule.List.join({}, List)
	table.remove(JoinResult, Index)
	local v4 = 1
	
	for i1, value1 in ipairs(JoinResult) do
		if value1 == EnumsModule.Components.CurrentlyWearing then
			v4 = i1
			break
		end
	end
	table.insert(JoinResult, v4, EnumsModule.Components.Moments)
	
	return JoinResult
end

local config = {
	[EnumsModule.Components.UserProfileHeader] = require(ProfilePlatform.Components.UserProfileHeader),
	[EnumsModule.Components.CurrentlyWearing] = require(ProfilePlatform.Components.CurrentlyWearing),
	[EnumsModule.Components.Actions] = CTARowModule,
	[EnumsModule.Components.Experiences] = if require(Parent.SharedFlags).FFlagExperiencesOnProfile then ExperiencesWideCarouselModule else ExperiencesModule,
	[EnumsModule.Components.ViewFullProfile] = ViewFullProfileModule,
	[EnumsModule.Components.About] = AboutModule.About,
	[EnumsModule.Components.FavoriteExperiences] = if FFlagProfilePlatformEnableFavoriteExperiencesModule then FavoriteExperiencesModule else nil,
	[EnumsModule.Components.Inventory] = if FFlagProfilePlatformEnableInventory then InventoryModule else nil,
	[EnumsModule.Components.Store] = if FFlagProfilePlatformEnableStore then StoreModule else nil,
	[EnumsModule.Components.ProfileCompletion] = if FFlagEnableProfileCompletion then ProfileCompletionModule else nil,
	[EnumsModule.Components.CurrentlyPlaying] = if FFlagProfilePlatformAddCurrentlyPlayingModule then CurrentlyPlayingModule else nil,
	[EnumsModule.Components.Moments] = if FFlagProfilePlatformEnableMomentsModule then MomentsModule else nil
}
local config1 = {
	[EnumsModule.Components.CoverPhoto] = require(ProfilePlatform.Components.CoverPhoto),
	[EnumsModule.Components.CommunityProfileHeader] = require(ProfilePlatform.Components.CommunityProfileHeader),
	[EnumsModule.Components.About] = AboutModule.About,
	[EnumsModule.Components.Actions] = CTARowModule,
	[EnumsModule.Components.Experiences] = ExperiencesModule,
	[EnumsModule.Components.Store] = StoreModule,
	[EnumsModule.Components.SocialLinks] = if FFlagAddSocialLinksToCommunityProfile then SocialLinksModule else nil,
	[EnumsModule.Components.ViewFullProfile] = ViewFullProfileModule,
	[EnumsModule.Components.CommunityLocked] = if FFlagAddCommunityLockedToCommunityProfile then CommunityLockedModule else nil,
	[EnumsModule.Components.Events] = if FFlagAddEventsToCommunityProfileModule then EventsModule else nil,
	[EnumsModule.Components.Announcements] = if FFlagGroupAnnouncementsSdui then AnnouncementsModule else nil
}
local config2 = {
	[EnumsModule.Components.ContactProfileHeader] = require(ProfilePlatform.Components.ContactProfileHeader),
	[EnumsModule.Components.ContactDescription] = require(ProfilePlatform.Components.ContactDescription),
	[EnumsModule.Components.Actions] = CTARowModule
}
local JoinResult = if FFlagAXEnableProfileTab then CryoModule.Dictionary.join(config, {
	[EnumsModule.Components.UserProfileHeader] = MeTabUserProfileHeaderModule,
	[EnumsModule.Components.Actions] = CryoModule.None
}) else nil

return function(p1, p2, User, MomentsFeed, p3)
	-- upvalues: ReactModule (copy), ConstantsModule (copy), CryoModule (copy), GetPeekViewOpenHeightByProfileTypeModule (copy), EnumsModule (copy), FFlagAXEnableProfileTab (copy), JoinResult (copy), config (copy), config1 (copy), config2 (copy), FFlagAboutBeforeActionClientModule (copy), orderWithAboutBeforeActions (copy), FFlagProfilePlatformEnableMomentsModule (copy), moveMomentsToTop (copy), FFlagProfilePlatformEnableLazyLoadingComponentsModule (copy)
	local P3 = p2 or {}
	local Elements = {
		Layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, ConstantsModule.PAGE_PADDING)
		})
	}
	
	if CryoModule.isEmpty(P3) then
		Elements.loadingView = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, GetPeekViewOpenHeightByProfileTypeModule(User))
		})
		
		return Elements
	end
	local JoinResult1 = if User == EnumsModule.ProfileTypes.User then if FFlagAXEnableProfileTab and p3 then JoinResult else config elseif User == EnumsModule.ProfileTypes.Community then config1 elseif User == EnumsModule.ProfileTypes.Contact then config2 else {}
	local OrderWithAboutBeforeActionsResult = if FFlagAboutBeforeActionClientModule and User == EnumsModule.ProfileTypes.User then orderWithAboutBeforeActions(P3) else P3
	
	if FFlagProfilePlatformEnableMomentsModule and User == EnumsModule.ProfileTypes.User and MomentsFeed == EnumsModule.Sources.MomentsFeed then
		OrderWithAboutBeforeActionsResult = moveMomentsToTop(OrderWithAboutBeforeActionsResult)
	end
	for LayoutOrder, value in OrderWithAboutBeforeActionsResult do
		local JoinResultEntry = JoinResult1[value]
		
		if FFlagProfilePlatformEnableLazyLoadingComponentsModule then
			if JoinResultEntry ~= nil and p1[value] ~= nil then
				Elements[value] = ReactModule.createElement(JoinResultEntry, { layoutOrder = LayoutOrder })
			end
		elseif JoinResultEntry ~= nil then
			Elements[value] = ReactModule.createElement(JoinResultEntry, { layoutOrder = LayoutOrder })
		end
	end
	return Elements
end