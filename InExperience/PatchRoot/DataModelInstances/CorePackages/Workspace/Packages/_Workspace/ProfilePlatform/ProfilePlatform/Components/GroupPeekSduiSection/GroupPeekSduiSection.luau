local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local PromiseModule = require(Parent.Promise)
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local HorizontalPageMargin = require(Parent.UIBlox).App.Container.HorizontalPageMargin
local ResponsiveModule = require(Parent.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiFeatureEntryPoint = SduiSharedUtilitiesModule.SduiFeatureEntryPoint
local UseComponentConfigFunction = SduiSharedUtilitiesModule.useComponentConfig
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local FFlagSduiCustomFormEnabled = require(Parent.SharedFlags).FFlagSduiCustomFormEnabled
local GroupPeekSduiModule = nil

local function _()
	-- upvalues: GroupPeekSduiModule (ref), Parent (copy)
	if GroupPeekSduiModule == nil then
		GroupPeekSduiModule = require(Parent.GroupPeekSdui)
	end
	return GroupPeekSduiModule
end

local _ = function(p1, Announcements)
	-- upvalues: EnumsModule (copy)
	return if Announcements == EnumsModule.Components.Announcements then p1.Identifiers.Announcement else p1.Identifiers.ForumsDiscovery
end

local function SectionEntry(p1)
	-- upvalues: GroupPeekSduiModule (ref), Parent (copy), EnumsModule (copy), UseComponentConfigFunction (copy), ReactModule (copy), HorizontalPageMargin (copy), SduiFeatureEntryPoint (copy)
	if GroupPeekSduiModule == nil then
		GroupPeekSduiModule = require(Parent.GroupPeekSdui)
	end
	local GroupPeekSduiModule1 = GroupPeekSduiModule
	local ConfigKey = GroupPeekSduiModule1.getConfigKey(p1.groupId)
	local Announcement = if p1.section == EnumsModule.Components.Announcements then GroupPeekSduiModule1.Identifiers.Announcement else GroupPeekSduiModule1.Identifiers.ForumsDiscovery
	
	return if UseComponentConfigFunction(ConfigKey, Announcement) == nil then nil else ReactModule.createElement(HorizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		size = UDim2.new(1, 0, 0, 0),
		layoutOrder = p1.layoutOrder
	}, {
		Sdui = ReactModule.createElement(SduiFeatureEntryPoint, {
			shouldDisplayLoading = false,
			shouldDisplayError = false,
			LayoutOrder = 1,
			appPage = GroupPeekSduiModule1.AppPage,
			configKey = ConfigKey,
			identifier = Announcement
		})
	})
end

return ReactModule.memo(function(p1)
	-- upvalues: UseProfileWrapperContextModule (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), ReactModule (copy), PromiseModule (copy), GroupPeekSduiModule (ref), Parent (copy), FFlagSduiCustomFormEnabled (copy), RoactNavigationModule (copy), SectionEntry (copy)
	local ProfileId = UseProfileWrapperContextModule().profileId
	local IsNotProfileIdMatch: boolean = not (UsePreferredInputFunction() == ResponsiveModule.Input.Directional) and (ProfileId ~= nil and ProfileId ~= "")
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: PromiseModule (upval), GroupPeekSduiModule (upval), Parent (upval), ProfileId (copy)
		PromiseModule.try(function()
			-- upvalues: GroupPeekSduiModule (upval), Parent (upval), ProfileId (upval), p2 (copy)
			if GroupPeekSduiModule == nil then
				GroupPeekSduiModule = require(Parent.GroupPeekSdui)
			end
			return GroupPeekSduiModule.fetchGroupPeekPage(ProfileId, p2)
		end):catch(function() end)
	end, { ProfileId })
	ReactModule.useEffect(function()
		-- upvalues: IsNotProfileIdMatch (copy), FFlagSduiCustomFormEnabled (upval), GroupPeekSduiModule (upval), Parent (upval), UseResult (copy)
		if not IsNotProfileIdMatch then return end
		if FFlagSduiCustomFormEnabled then
			if GroupPeekSduiModule == nil then
				GroupPeekSduiModule = require(Parent.GroupPeekSdui)
			end
			GroupPeekSduiModule.registerGroupAnnouncementActions()
		end
		UseResult(false)
	end, { IsNotProfileIdMatch, UseResult })
	
	return if IsNotProfileIdMatch then ReactModule.createElement(ReactModule.Fragment, nil, {
		NavEvents = ReactModule.createElement(RoactNavigationModule.NavigationEvents, {
			onDidFocus = function()
				-- upvalues: UseResult (copy)
				UseResult(true)
			end
		}),
		Section = ReactModule.createElement(SectionEntry, {
			groupId = ProfileId,
			layoutOrder = p1.layoutOrder,
			section = p1.section
		})
	}) else nil
end)