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
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local FFlagSduiCustomFormEnabled = require(Parent.SharedFlags).FFlagSduiCustomFormEnabled
local GroupAnnouncementsSduiModule = nil

local function _()
	-- upvalues: GroupAnnouncementsSduiModule (ref), Parent (copy)
	if GroupAnnouncementsSduiModule == nil then
		GroupAnnouncementsSduiModule = require(Parent.GroupAnnouncementsSdui)
	end
	return GroupAnnouncementsSduiModule
end

local function AnnouncementsSdui(p1)
	-- upvalues: GroupAnnouncementsSduiModule (ref), Parent (copy), UseComponentConfigFunction (copy), ReactModule (copy), HorizontalPageMargin (copy), SduiFeatureEntryPoint (copy)
	if GroupAnnouncementsSduiModule == nil then
		GroupAnnouncementsSduiModule = require(Parent.GroupAnnouncementsSdui)
	end
	local GroupAnnouncementsSduiModule1 = GroupAnnouncementsSduiModule
	local ConfigKey = GroupAnnouncementsSduiModule1.getConfigKey(p1.groupId)
	
	return if UseComponentConfigFunction(ConfigKey) == nil then nil else ReactModule.createElement(HorizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		size = UDim2.new(1, 0, 0, 0),
		layoutOrder = p1.layoutOrder
	}, {
		Sdui = ReactModule.createElement(SduiFeatureEntryPoint, {
			shouldDisplayLoading = false,
			shouldDisplayError = false,
			LayoutOrder = 1,
			appPage = GroupAnnouncementsSduiModule1.AppPage,
			configKey = ConfigKey
		})
	})
end

return ReactModule.memo(function(p1)
	-- upvalues: UseProfileWrapperContextModule (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), ReactModule (copy), PromiseModule (copy), GroupAnnouncementsSduiModule (ref), Parent (copy), FFlagSduiCustomFormEnabled (copy), RoactNavigationModule (copy), AnnouncementsSdui (copy)
	local ProfileId = UseProfileWrapperContextModule().profileId
	local IsNotProfileIdMatch: boolean = not (UsePreferredInputFunction() == ResponsiveModule.Input.Directional) and (ProfileId ~= nil and ProfileId ~= "")
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: PromiseModule (upval), GroupAnnouncementsSduiModule (upval), Parent (upval), ProfileId (copy)
		PromiseModule.try(function()
			-- upvalues: GroupAnnouncementsSduiModule (upval), Parent (upval), ProfileId (upval), p2 (copy)
			if GroupAnnouncementsSduiModule == nil then
				GroupAnnouncementsSduiModule = require(Parent.GroupAnnouncementsSdui)
			end
			return GroupAnnouncementsSduiModule.fetchGroupPeekPage(ProfileId, p2)
		end):catch(function() end)
	end, { ProfileId })
	ReactModule.useEffect(function()
		-- upvalues: IsNotProfileIdMatch (copy), FFlagSduiCustomFormEnabled (upval), GroupAnnouncementsSduiModule (upval), Parent (upval), UseResult (copy)
		if not IsNotProfileIdMatch then return end
		if FFlagSduiCustomFormEnabled then
			if GroupAnnouncementsSduiModule == nil then
				GroupAnnouncementsSduiModule = require(Parent.GroupAnnouncementsSdui)
			end
			GroupAnnouncementsSduiModule.registerGroupAnnouncementActions()
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
		Announcements = ReactModule.createElement(AnnouncementsSdui, { groupId = ProfileId, layoutOrder = p1.layoutOrder })
	}) else nil
end)