local Groups = script:FindFirstAncestor("Groups")
local Parent = Groups.Parent
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local ReactModule = require(Parent.React)
local UserLibModule = require(Parent.UserLib)
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local Constants = UserLibModule.Utils.Constants
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseContextFunction = ReactModule.useContext
local UseEventConnectionFunction = require(Parent.ReactUtils).useEventConnection
local EnumsModule = require(Parent.ProfilePlatform.Enums)
local FetchGroupDetailsModule = require(Groups.Common.fetchGroupDetails)
local PostJoinGroupModule = require(Groups.Common.postJoinGroup)
local FetchGroupActionsModule = require(Groups.Common.fetchGroupActions)
local ServiceOverrideContextModule = require(Groups.Components.CoreUI.ServiceOverrideContext)
local _ = require(Groups.Common.Types)
local THUMBNAILSIZE = require(Groups.Common.constants).THUMBNAIL_SIZE

local function parseMembershipStatusFromActions(Actions)
	-- upvalues: EnumsModule (copy)
	local Buttons = Actions.buttons or {}
	local Type = nil
	local DisabledReason = nil
	
	if #Buttons > 0 then
		Type = Buttons[1].type
		DisabledReason = Buttons[1].disabledReason
	end
	return {
		isAlreadyMember = (Type == EnumsModule.ProfileActions.ViewCommunity or Type == EnumsModule.ProfileActions.ViewFullProfile) and not DisabledReason,
		hasPendingRequest = Type == EnumsModule.ProfileActions.CancelJoinCommunityRequest,
		isEligible = (Type == EnumsModule.ProfileActions.JoinCommunity or Type == EnumsModule.ProfileActions.Follow) and not DisabledReason,
		disabledReason = DisabledReason
	}
end

local function buildGroupJoinPromptData(p1)
	-- upvalues: parseMembershipStatusFromActions (copy)
	if p1 then
		local Components = p1.components or {}
		local CommunityProfileHeader = Components.CommunityProfileHeader or {}
		local ParseMembershipStatusFromActionsResult = parseMembershipStatusFromActions(Components.Actions or {})
		
		return {
			groupName = CommunityProfileHeader.name,
			isGroupVerified = CommunityProfileHeader.isVerified,
			ownerName = CommunityProfileHeader.ownerName,
			ownerIsVerified = CommunityProfileHeader.ownerIsVerified,
			ownerUserId = CommunityProfileHeader.ownerUserId,
			membersCount = if CommunityProfileHeader.counts then CommunityProfileHeader.counts.membersCount else nil,
			isAlreadyMember = ParseMembershipStatusFromActionsResult.isAlreadyMember,
			hasPendingRequest = ParseMembershipStatusFromActionsResult.hasPendingRequest,
			isEligible = ParseMembershipStatusFromActionsResult.isEligible,
			disabledReason = ParseMembershipStatusFromActionsResult.disabledReason,
			hasSocialModules = CommunityProfileHeader.hasSocialModules
		}
	else
		return nil
	end
end

return function(p1)
	-- upvalues: UseRoactServiceFunction (copy), RoactNetworking (copy), UseContextFunction (copy), ServiceOverrideContextModule (copy), UseLocalizationFunction (copy), ReactModule (copy), PostJoinGroupModule (copy), FetchGroupActionsModule (copy), parseMembershipStatusFromActions (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy), THUMBNAILSIZE (copy), FetchGroupDetailsModule (copy), buildGroupJoinPromptData (copy), UseEventConnectionFunction (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseContextResult = UseContextFunction(ServiceOverrideContextModule)
	local GroupService = UseContextResult.groupService
	local GuiService = UseContextResult.guiService
	local UseLocalizationResult = UseLocalizationFunction({
		notificationJoined = "Feature.Groups.Notification.Joined",
		notificationFollowing = "Feature.Groups.Notification.Following",
		notificationJoinRequestPending = "Feature.Groups.Notification.JoinRequestPending",
		notificationFailedToLoad = "Feature.Groups.Notification.FailedToLoad",
		notificationFailedToJoin = "Feature.Groups.Notification.FailedToJoin",
		notificationFailedToFollow = "Feature.Groups.Notification.FailedToFollow",
		notificationGroupDoesNotExist = "Feature.Groups.Notification.GroupDoesNotExist",
		notificationGroupModerated = "Feature.Groups.Notification.GroupModerated"
	})
	local UseRefResult = ReactModule.useRef(nil)
	
	local function _()
		-- upvalues: UseRefResult (copy), p1 (copy)
		UseRefResult.current = nil
		p1.closePrompt()
	end
	
	local UseResult = ReactModule.useCallback(function(GroupId, ErrorMessage, Title)
		-- upvalues: GroupService (copy), GuiService (copy), UseRefResult (copy), p1 (copy)
		GroupService:PromptJoinCompleted(GroupId, false, Enum.GroupMembershipStatus.None, ErrorMessage)
		GuiService:SendNotification({
			Icon = "rbxasset://textures/ui/ErrorIcon.png",
			Title = Title
		})
		UseRefResult.current = nil
		p1.closePrompt()
	end, { GroupService, GuiService, p1.closePrompt })
	local UseResult1 = ReactModule.useCallback(function(p2, p3, p4, p5)
		-- upvalues: UseLocalizationResult (copy), UseResult (copy)
		UseResult(p2, p4, if p5 then UseLocalizationResult.notificationFailedToLoad elseif p3 then UseLocalizationResult.notificationFailedToJoin else UseLocalizationResult.notificationFailedToFollow)
	end, { UseResult })
	local UseResult2 = ReactModule.useCallback(function(GroupId, GroupJoinPromptData)
		-- upvalues: PostJoinGroupModule (upval), UseRoactServiceResult (copy), FetchGroupActionsModule (upval), UseResult1 (copy), parseMembershipStatusFromActions (upval), UseLocalizationResult (copy), GroupService (copy), UseRefResult (copy), p1 (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (upval), Constants (upval), THUMBNAILSIZE (upval), GuiService (copy)
		return function()
			-- upvalues: GroupJoinPromptData (copy), PostJoinGroupModule (upval), UseRoactServiceResult (upval), GroupId (copy), FetchGroupActionsModule (upval), UseResult1 (upval), parseMembershipStatusFromActions (upval), UseLocalizationResult (upval), GroupService (upval), UseRefResult (upval), p1 (upval), GetRbxthumbWithTypeSizeAndOptionsFunction (upval), Constants (upval), THUMBNAILSIZE (upval), GuiService (upval)
			local NoGroupJoinPromptData = not GroupJoinPromptData or GroupJoinPromptData.hasSocialModules == nil or GroupJoinPromptData.hasSocialModules
			local GroupName = GroupJoinPromptData and GroupJoinPromptData.groupName or ""
			PostJoinGroupModule(UseRoactServiceResult, GroupId):andThen(function()
				-- upvalues: FetchGroupActionsModule (upval), UseRoactServiceResult (upval), GroupId (upval), UseResult1 (upval), NoGroupJoinPromptData (copy), parseMembershipStatusFromActions (upval), UseLocalizationResult (upval), GroupService (upval), UseRefResult (upval), p1 (upval), GroupName (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (upval), Constants (upval), THUMBNAILSIZE (upval), GuiService (upval)
				return FetchGroupActionsModule(UseRoactServiceResult, GroupId):andThen(function(Result)
					-- upvalues: UseResult1 (upval), GroupId (upval), NoGroupJoinPromptData (upval), parseMembershipStatusFromActions (upval), UseLocalizationResult (upval), GroupService (upval), UseRefResult (upval), p1 (upval), GroupName (upval), GetRbxthumbWithTypeSizeAndOptionsFunction (upval), Constants (upval), THUMBNAILSIZE (upval), GuiService (upval)
					if Result.errors then
						UseResult1(GroupId, NoGroupJoinPromptData, "Network error on join prompt: Some group components failed to load", false)
						
						return
					end
					local ParseMembershipStatusFromActionsResult = parseMembershipStatusFromActions((Result.components or {}).Actions or {})
					local JoinRequestPending = nil
					local Text = nil
					
					if ParseMembershipStatusFromActionsResult.isAlreadyMember then
						JoinRequestPending = Enum.GroupMembershipStatus.Joined
						Text = if NoGroupJoinPromptData then UseLocalizationResult.notificationJoined else UseLocalizationResult.notificationFollowing
					else
						if not ParseMembershipStatusFromActionsResult.hasPendingRequest then
							UseResult1(GroupId, NoGroupJoinPromptData, "Unexpected membership status after join prompt", false)
							
							return
						end
						JoinRequestPending = Enum.GroupMembershipStatus.JoinRequestPending
						Text = UseLocalizationResult.notificationJoinRequestPending
					end
					GroupService:PromptJoinCompleted(GroupId, true, JoinRequestPending, "")
					UseRefResult.current = nil
					p1.closePrompt()
					GuiService:SendNotification({
						Title = string.gsub(Text, "{groupName}", GroupName),
						Icon = GetRbxthumbWithTypeSizeAndOptionsFunction(tostring(GroupId), Constants.RbxthumbTypes.GroupIcon, THUMBNAILSIZE)
					})
				end, function(p2)
					-- upvalues: UseResult1 (upval), GroupId (upval), NoGroupJoinPromptData (upval)
					UseResult1(GroupId, NoGroupJoinPromptData, "Network error on join prompt: " .. p2.StatusMessage, false)
				end)
			end, function(p2)
				-- upvalues: UseResult1 (upval), GroupId (upval), NoGroupJoinPromptData (copy)
				UseResult1(GroupId, NoGroupJoinPromptData, "Network error on join prompt: " .. p2.StatusMessage, false)
			end)
		end
	end, {
		UseRoactServiceResult, UseResult1, UseLocalizationResult, GroupService,
		GuiService, p1.closePrompt
	})
	local UseResult3 = ReactModule.useCallback(function(GroupId, GroupJoinPromptData)
		-- upvalues: GroupService (copy), UseRefResult (copy), p1 (copy)
		return function()
			-- upvalues: GroupJoinPromptData (copy), GroupService (upval), GroupId (copy), UseRefResult (upval), p1 (upval)
			local v1: boolean = if GroupJoinPromptData and GroupJoinPromptData.isAlreadyMember then true else false
			local v2: boolean = if GroupJoinPromptData and GroupJoinPromptData.hasPendingRequest then true else false
			GroupService:PromptJoinCompleted(GroupId, true, if v1 then Enum.GroupMembershipStatus.AlreadyMember elseif v2 then Enum.GroupMembershipStatus.JoinRequestPending else Enum.GroupMembershipStatus.None, "")
			UseRefResult.current = nil
			p1.closePrompt()
		end
	end, { GroupService, p1.closePrompt })
	UseEventConnectionFunction(GroupService.ShowJoinPrompt, (ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult (copy), UseResult2 (copy), UseResult3 (copy), p1 (copy), FetchGroupDetailsModule (upval), UseRoactServiceResult (copy), UseResult1 (copy), UseResult (copy), UseLocalizationResult (copy), buildGroupJoinPromptData (upval)
		local Current = {}
		UseRefResult.current = Current
		p1.openGroupJoinPrompt(p2, nil, {
			onJoin = UseResult2(p2, nil),
			onClose = UseResult3(p2, nil)
		})
		FetchGroupDetailsModule(UseRoactServiceResult, p2):andThen(function(Result)
			-- upvalues: UseRefResult (upval), Current (copy), UseResult1 (upval), p2 (copy), UseResult (upval), UseLocalizationResult (upval), buildGroupJoinPromptData (upval), UseResult2 (upval), UseResult3 (upval), p1 (upval)
			if UseRefResult.current ~= Current then return end
			local Components = Result.components or {}
			local HasNextEntry = next(Components) ~= nil
			local HasCommunityLocked = Components.CommunityLocked ~= nil
			local CommunityProfileHeader = Components.CommunityProfileHeader or {}
			local NoHasSocialModules = CommunityProfileHeader.hasSocialModules == nil or CommunityProfileHeader.hasSocialModules
			
			if Result.errors ~= nil then
				if UseRefResult.current == Current then
					UseResult1(p2, NoHasSocialModules, "Network error on join prompt: Some group components failed to load", true)
					
					return
				end
				return
			elseif HasNextEntry then
				if HasCommunityLocked then
					if UseRefResult.current == Current then
						UseResult(p2, "Group is currently moderated", UseLocalizationResult.notificationGroupModerated)
						
						return
					end
					return
				elseif UseRefResult.current == Current then
					local GroupJoinPromptData = buildGroupJoinPromptData(Result)
					p1.openGroupJoinPrompt(p2, GroupJoinPromptData, {
						onJoin = UseResult2(p2, GroupJoinPromptData),
						onClose = UseResult3(p2, GroupJoinPromptData)
					})
					
					return
				else
					return
				end
			elseif UseRefResult.current == Current then
				UseResult(p2, "Group does not exist", UseLocalizationResult.notificationGroupDoesNotExist)
				
				return
			else
			end
		end, function(p3)
			-- upvalues: UseRefResult (upval), Current (copy), UseResult (upval), p2 (copy), UseLocalizationResult (upval)
			if UseRefResult.current == Current then
				UseResult(p2, "Network error on join prompt: " .. p3.StatusMessage, UseLocalizationResult.notificationFailedToLoad)
				
				return
			end
		end)
	end, {
		p1.openGroupJoinPrompt, UseRoactServiceResult, UseLocalizationResult,
		UseResult2, UseResult3, UseResult, UseResult1
	})))
	
	return ReactModule.createElement(ReactModule.Fragment, {}, {})
end