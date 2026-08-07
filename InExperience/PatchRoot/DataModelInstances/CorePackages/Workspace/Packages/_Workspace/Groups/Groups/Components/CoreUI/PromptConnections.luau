local groups = script:FindFirstAncestor("Groups")
local parent = groups.Parent
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local userLibModule = require(parent.UserLib)
local getRbxthumbWithTypeSizeAndOptions = userLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local constants = userLibModule.Utils.Constants
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useContext = reactModule.useContext
local useEventConnection = reactUtilsModule.useEventConnection
local enumsModule = require(parent.ProfilePlatform.Enums)
local fetchGroupDetailsModule = require(groups.Common.fetchGroupDetails)
local postJoinGroupModule = require(groups.Common.postJoinGroup)
local fetchGroupActionsModule = require(groups.Common.fetchGroupActions)
local serviceOverrideContextModule = require(groups.Components.CoreUI.ServiceOverrideContext)
local _ = require(groups.Common.Types)
local THUMBNAIL_SIZE = require(groups.Common.constants).THUMBNAIL_SIZE

local function parseMembershipStatusFromActions(p0) --[[ line: 39 ]]
	-- upvalues: enumsModule (ref)
	local buttons = p0.buttons or {}
	local type = nil
	local disabledReason = nil
	
	if #buttons > 0 then
		type = buttons[1].type
		disabledReason = buttons[1].disabledReason
	end
	return {
		isAlreadyMember = (if type ~= enumsModule.ProfileActions.ViewCommunity then type == enumsModule.ProfileActions.ViewFullProfile else true) and not disabledReason,
		hasPendingRequest = type == enumsModule.ProfileActions.CancelJoinCommunityRequest,
		isEligible = (if type ~= enumsModule.ProfileActions.JoinCommunity then type == enumsModule.ProfileActions.Follow else true) and not disabledReason,
		disabledReason = disabledReason
	}
end

local function buildGroupJoinPromptData(p1) --[[ line: 72 ]]
	-- upvalues: parseMembershipStatusFromActions (ref)
	if p1 then
		local components = p1.components or {}
		local communityProfileHeader = components.CommunityProfileHeader or {}
		local var14 = parseMembershipStatusFromActions(components.Actions or {})
		
		return {
			groupName = communityProfileHeader.name,
			isGroupVerified = communityProfileHeader.isVerified,
			ownerName = communityProfileHeader.ownerName,
			ownerIsVerified = communityProfileHeader.ownerIsVerified,
			ownerUserId = communityProfileHeader.ownerUserId,
			membersCount = if communityProfileHeader.counts then communityProfileHeader.counts.membersCount else nil,
			isAlreadyMember = var14.isAlreadyMember,
			hasPendingRequest = var14.hasPendingRequest,
			isEligible = var14.isEligible,
			disabledReason = var14.disabledReason,
			hasSocialModules = communityProfileHeader.hasSocialModules
		}
	end
	return nil
end

return function(p2) --[[ line: 98 ]]
	-- upvalues: useRoactService (ref), roactNetworking (ref), useContext (ref), serviceOverrideContextModule (ref), useLocalization (ref), reactModule (ref), postJoinGroupModule (ref), fetchGroupActionsModule (ref), parseMembershipStatusFromActions (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref), THUMBNAIL_SIZE (ref), fetchGroupDetailsModule (ref), buildGroupJoinPromptData (ref), useEventConnection (ref)
	local var15 = useRoactService(roactNetworking)
	local var16 = useContext(serviceOverrideContextModule)
	local groupService = var16.groupService
	local guiService = var16.guiService
	local var17 = useLocalization({
		notificationJoined = "Feature.Groups.Notification.Joined",
		notificationFollowing = "Feature.Groups.Notification.Following",
		notificationJoinRequestPending = "Feature.Groups.Notification.JoinRequestPending",
		notificationFailedToLoad = "Feature.Groups.Notification.FailedToLoad",
		notificationFailedToJoin = "Feature.Groups.Notification.FailedToJoin",
		notificationFailedToFollow = "Feature.Groups.Notification.FailedToFollow",
		notificationGroupDoesNotExist = "Feature.Groups.Notification.GroupDoesNotExist",
		notificationGroupModerated = "Feature.Groups.Notification.GroupModerated"
	})
	local var18 = reactModule.useRef(nil)
	
	local function _() --[[ line: 122 | named "closePrompt" ]]
		-- upvalues: var18 (ref), p2 (ref)
		var18.current = nil
		p2.closePrompt()
	end
	
	local var19 = reactModule.useCallback(function(p3, p4, p5) --[[ line: 129 ]]
		-- upvalues: groupService (ref), guiService (ref), var18 (ref), p2 (ref)
		groupService:PromptJoinCompleted(p3, false, Enum.GroupMembershipStatus.None, p4)
		guiService:SendNotification({
			Icon = "rbxasset://textures/ui/ErrorIcon.png",
			Title = p5
		})
		var18.current = nil
		p2.closePrompt()
	end, { groupService, guiService, p2.closePrompt })
	local var20 = reactModule.useCallback(function(p6, p7, p8, p9) --[[ line: 147 ]]
		-- upvalues: var17 (ref), var19 (ref)
		var19(p6, p8, if p9 then var17.notificationFailedToLoad elseif p7 then var17.notificationFailedToJoin else var17.notificationFailedToFollow)
	end, { var19 })
	local var21 = reactModule.useCallback(function(p10, p11) --[[ line: 162 ]]
		-- upvalues: postJoinGroupModule (copy), var15 (ref), fetchGroupActionsModule (copy), var20 (ref), parseMembershipStatusFromActions (copy), var17 (ref), groupService (ref), var18 (ref), p2 (ref), getRbxthumbWithTypeSizeAndOptions (copy), constants (copy), THUMBNAIL_SIZE (copy), guiService (ref)
		return function() --[[ line: 163 ]]
			-- upvalues: p11 (ref), postJoinGroupModule (copy), var15 (copy), p10 (ref), fetchGroupActionsModule (copy), var20 (copy), parseMembershipStatusFromActions (copy), var17 (copy), groupService (copy), var18 (copy), p2 (copy), getRbxthumbWithTypeSizeAndOptions (copy), constants (copy), THUMBNAIL_SIZE (copy), guiService (copy)
			local var23 = if p11 and p11.hasSocialModules ~= nil then p11.hasSocialModules else true
			local var24 = if p11 then p11.groupName or "" else ""
			postJoinGroupModule(var15, p10):andThen(function() --[[ line: 171 ]]
				-- upvalues: fetchGroupActionsModule (copy), var15 (copy), p10 (copy), var20 (copy), var23 (ref), parseMembershipStatusFromActions (copy), var17 (copy), groupService (copy), var18 (copy), p2 (copy), var24 (ref), getRbxthumbWithTypeSizeAndOptions (copy), constants (copy), THUMBNAIL_SIZE (copy), guiService (copy)
				return fetchGroupActionsModule(var15, p10):andThen(function(p12) --[[ line: 172 ]]
					-- upvalues: var20 (copy), p10 (copy), var23 (copy), parseMembershipStatusFromActions (copy), var17 (copy), groupService (copy), var18 (copy), p2 (copy), var24 (copy), getRbxthumbWithTypeSizeAndOptions (copy), constants (copy), THUMBNAIL_SIZE (copy), guiService (copy)
					if p12.errors then
						var20(p10, var23, "Network error on join prompt: Some group components failed to load", false)
						
						return
					end
					local var25 = parseMembershipStatusFromActions((p12.components or {}).Actions or {})
					local joinRequestPending = nil
					local notificationJoinRequestPending = nil
					
					if var25.isAlreadyMember then
						joinRequestPending = Enum.GroupMembershipStatus.Joined
						notificationJoinRequestPending = if var23 then var17.notificationJoined else var17.notificationFollowing
					elseif var25.hasPendingRequest then
						joinRequestPending = Enum.GroupMembershipStatus.JoinRequestPending
						notificationJoinRequestPending = var17.notificationJoinRequestPending
					else
						var20(p10, var23, "Unexpected membership status after join prompt", false)
						
						return
					end
					groupService:PromptJoinCompleted(p10, true, joinRequestPending, "")
					var18.current = nil
					p2.closePrompt()
					guiService:SendNotification({
						Title = string.gsub(notificationJoinRequestPending, "{groupName}", var24),
						Icon = getRbxthumbWithTypeSizeAndOptions(tostring(p10), constants.RbxthumbTypes.GroupIcon, THUMBNAIL_SIZE)
					})
				end, function(p13) --[[ line: 226 ]]
					-- upvalues: var20 (copy), p10 (copy), var23 (copy)
					var20(p10, var23, "Network error on join prompt: " .. p13.StatusMessage, false)
				end)
			end, function(p14) --[[ line: 234 ]]
				-- upvalues: var20 (copy), p10 (copy), var23 (ref)
				var20(p10, var23, "Network error on join prompt: " .. p14.StatusMessage, false)
			end)
		end
	end, {
		var15, var20, var17, groupService, guiService, p2.closePrompt
	})
	local var22 = reactModule.useCallback(function(p15, p16) --[[ line: 246 ]]
		-- upvalues: groupService (ref), var18 (ref), p2 (ref)
		return function() --[[ line: 247 ]]
			-- upvalues: p16 (ref), groupService (copy), p15 (ref), var18 (copy), p2 (copy)
			groupService:PromptJoinCompleted(p15, true, if if p16 and p16.isAlreadyMember then true else false then Enum.GroupMembershipStatus.AlreadyMember elseif if p16 and p16.hasPendingRequest then true else false then Enum.GroupMembershipStatus.JoinRequestPending else Enum.GroupMembershipStatus.None, "")
			var18.current = nil
			p2.closePrompt()
		end
	end, { groupService, p2.closePrompt })
	useEventConnection(groupService.ShowJoinPrompt, reactModule.useCallback(function(p17) --[[ line: 275 ]]
		-- upvalues: var18 (ref), var21 (ref), var22 (ref), p2 (ref), fetchGroupDetailsModule (copy), var15 (ref), var20 (ref), var19 (ref), var17 (ref), buildGroupJoinPromptData (copy)
		local t = {}
		var18.current = t
		p2.openGroupJoinPrompt(p17, nil, { onJoin = var21(p17, nil), onClose = var22(p17, nil) })
		fetchGroupDetailsModule(var15, p17):andThen(function(p18) --[[ line: 291 ]]
			-- upvalues: var18 (copy), t (ref), var20 (copy), p17 (ref), var19 (copy), var17 (copy), buildGroupJoinPromptData (copy), var21 (copy), var22 (copy), p2 (copy)
			if var18.current ~= t then return end
			local components = p18.components or {}
			local var28 = next(components) ~= nil
			local var29 = components.CommunityLocked ~= nil
			local var30 = p18.errors ~= nil
			local communityProfileHeader = components.CommunityProfileHeader or {}
			local var32 = communityProfileHeader.hasSocialModules ~= nil or communityProfileHeader.hasSocialModules
			
			if var30 then
				if var18.current == t then
					var20(p17, var32, "Network error on join prompt: Some group components failed to load", true)
					
					return
				end
				return
			elseif var28 then
				if var29 then
					if var18.current == t then
						var19(p17, "Group is currently moderated", var17.notificationGroupModerated)
						
						return
					end
					return
				elseif var18.current == t then
					local var33 = buildGroupJoinPromptData(p18)
					p2.openGroupJoinPrompt(p17, var33, { onJoin = var21(p17, var33), onClose = var22(p17, var33) })
					
					return
				end
				return
			elseif var18.current == t then
				var19(p17, "Group does not exist", var17.notificationGroupDoesNotExist)
				
				return
			end
		end, function(p19) --[[ line: 341 ]]
			-- upvalues: var18 (copy), t (ref), var19 (copy), p17 (ref), var17 (copy)
			if var18.current == t then
				var19(p17, "Network error on join prompt: " .. p19.StatusMessage, var17.notificationFailedToLoad)
				
				return
			end
		end)
	end, {
		p2.openGroupJoinPrompt, var15, var17, var21, var22, var19, var20
	}))
	
	return reactModule.createElement(reactModule.Fragment, {}, {})
end