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

local function parseMembershipStatusFromActions(p1)
	-- upvalues: enumsModule (ref)
	local buttons = p1.buttons or {}
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

local function buildGroupJoinPromptData(p1)
	-- upvalues: parseMembershipStatusFromActions (ref)
	if p1 then
		local components = p1.components or {}
		local communityProfileHeader = components.CommunityProfileHeader or {}
		local var1 = parseMembershipStatusFromActions(components.Actions or {})
		
		return {
			groupName = communityProfileHeader.name,
			isGroupVerified = communityProfileHeader.isVerified,
			ownerName = communityProfileHeader.ownerName,
			ownerIsVerified = communityProfileHeader.ownerIsVerified,
			ownerUserId = communityProfileHeader.ownerUserId,
			membersCount = if communityProfileHeader.counts then communityProfileHeader.counts.membersCount else nil,
			isAlreadyMember = var1.isAlreadyMember,
			hasPendingRequest = var1.hasPendingRequest,
			isEligible = var1.isEligible,
			disabledReason = var1.disabledReason,
			hasSocialModules = communityProfileHeader.hasSocialModules
		}
	end
	return nil
end

return function(p1)
	-- upvalues: useRoactService (ref), roactNetworking (ref), useContext (ref), serviceOverrideContextModule (ref), useLocalization (ref), reactModule (ref), postJoinGroupModule (ref), fetchGroupActionsModule (ref), parseMembershipStatusFromActions (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref), THUMBNAIL_SIZE (ref), fetchGroupDetailsModule (ref), buildGroupJoinPromptData (ref), useEventConnection (ref)
	local var1 = useRoactService(roactNetworking)
	local var2 = useContext(serviceOverrideContextModule)
	local groupService = var2.groupService
	local guiService = var2.guiService
	local var3 = useLocalization({
		notificationJoined = "Feature.Groups.Notification.Joined",
		notificationFollowing = "Feature.Groups.Notification.Following",
		notificationJoinRequestPending = "Feature.Groups.Notification.JoinRequestPending",
		notificationFailedToLoad = "Feature.Groups.Notification.FailedToLoad",
		notificationFailedToJoin = "Feature.Groups.Notification.FailedToJoin",
		notificationFailedToFollow = "Feature.Groups.Notification.FailedToFollow",
		notificationGroupDoesNotExist = "Feature.Groups.Notification.GroupDoesNotExist",
		notificationGroupModerated = "Feature.Groups.Notification.GroupModerated"
	})
	local var4 = reactModule.useRef(nil)
	
	local function _()
		-- upvalues: var4 (ref), p1 (ref)
		var4.current = nil
		p1.closePrompt()
	end
	
	local var5 = reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: groupService (ref), guiService (ref), var4 (ref), p1 (ref)
		groupService:PromptJoinCompleted(p2, false, Enum.GroupMembershipStatus.None, p3)
		guiService:SendNotification({
			Icon = "rbxasset://textures/ui/ErrorIcon.png",
			Title = p4
		})
		var4.current = nil
		p1.closePrompt()
	end, { groupService, guiService, p1.closePrompt })
	local var6 = reactModule.useCallback(function(p2, p3, p4, p5)
		-- upvalues: var3 (ref), var5 (ref)
		var5(p2, p4, if p5 then var3.notificationFailedToLoad elseif p3 then var3.notificationFailedToJoin else var3.notificationFailedToFollow)
	end, { var5 })
	local var7 = reactModule.useCallback(function(p2, p3)
		-- upvalues: postJoinGroupModule (copy), var1 (ref), fetchGroupActionsModule (copy), var6 (ref), parseMembershipStatusFromActions (copy), var3 (ref), groupService (ref), var4 (ref), p1 (ref), getRbxthumbWithTypeSizeAndOptions (copy), constants (copy), THUMBNAIL_SIZE (copy), guiService (ref)
		return function()
			-- upvalues: p3 (ref), postJoinGroupModule (copy), var1 (copy), p2 (ref), fetchGroupActionsModule (copy), var6 (copy), parseMembershipStatusFromActions (copy), var3 (copy), groupService (copy), var4 (copy), p1 (copy), getRbxthumbWithTypeSizeAndOptions (copy), constants (copy), THUMBNAIL_SIZE (copy), guiService (copy)
			local var8 = if p3 and p3.hasSocialModules ~= nil then p3.hasSocialModules else true
			local var9 = if p3 then p3.groupName or "" else ""
			postJoinGroupModule(var1, p2):andThen(function()
				-- upvalues: fetchGroupActionsModule (copy), var1 (copy), p2 (copy), var6 (copy), var8 (ref), parseMembershipStatusFromActions (copy), var3 (copy), groupService (copy), var4 (copy), p1 (copy), var9 (ref), getRbxthumbWithTypeSizeAndOptions (copy), constants (copy), THUMBNAIL_SIZE (copy), guiService (copy)
				return fetchGroupActionsModule(var1, p2):andThen(function(p4)
					-- upvalues: var6 (copy), p2 (copy), var8 (copy), parseMembershipStatusFromActions (copy), var3 (copy), groupService (copy), var4 (copy), p1 (copy), var9 (copy), getRbxthumbWithTypeSizeAndOptions (copy), constants (copy), THUMBNAIL_SIZE (copy), guiService (copy)
					if p4.errors then
						var6(p2, var8, "Network error on join prompt: Some group components failed to load", false)
						
						return
					end
					local var10 = parseMembershipStatusFromActions((p4.components or {}).Actions or {})
					local joinRequestPending = nil
					local notificationJoinRequestPending = nil
					
					if var10.isAlreadyMember then
						joinRequestPending = Enum.GroupMembershipStatus.Joined
						notificationJoinRequestPending = if var8 then var3.notificationJoined else var3.notificationFollowing
					elseif var10.hasPendingRequest then
						joinRequestPending = Enum.GroupMembershipStatus.JoinRequestPending
						notificationJoinRequestPending = var3.notificationJoinRequestPending
					else
						var6(p2, var8, "Unexpected membership status after join prompt", false)
						
						return
					end
					groupService:PromptJoinCompleted(p2, true, joinRequestPending, "")
					var4.current = nil
					p1.closePrompt()
					guiService:SendNotification({
						Title = string.gsub(notificationJoinRequestPending, "{groupName}", var9),
						Icon = getRbxthumbWithTypeSizeAndOptions(tostring(p2), constants.RbxthumbTypes.GroupIcon, THUMBNAIL_SIZE)
					})
				end, function(p4)
					-- upvalues: var6 (copy), p2 (copy), var8 (copy)
					var6(p2, var8, "Network error on join prompt: " .. p13.StatusMessage, false)
				end)
			end, function(p4)
				-- upvalues: var6 (copy), p2 (copy), var8 (ref)
				var6(p2, var8, "Network error on join prompt: " .. p14.StatusMessage, false)
			end)
		end
	end, {
		var1, var6, var3, groupService, guiService, p1.closePrompt
	})
	local var8 = reactModule.useCallback(function(p2, p3)
		-- upvalues: groupService (ref), var4 (ref), p1 (ref)
		return function()
			-- upvalues: p3 (ref), groupService (copy), p2 (ref), var4 (copy), p1 (copy)
			groupService:PromptJoinCompleted(p2, true, if if p3 and p3.isAlreadyMember then true else false then Enum.GroupMembershipStatus.AlreadyMember elseif if p3 and p3.hasPendingRequest then true else false then Enum.GroupMembershipStatus.JoinRequestPending else Enum.GroupMembershipStatus.None, "")
			var4.current = nil
			p1.closePrompt()
		end
	end, { groupService, p1.closePrompt })
	useEventConnection(groupService.ShowJoinPrompt, reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref), var7 (ref), var8 (ref), p1 (ref), fetchGroupDetailsModule (copy), var1 (ref), var6 (ref), var5 (ref), var3 (ref), buildGroupJoinPromptData (copy)
		local t = {}
		var4.current = t
		p1.openGroupJoinPrompt(p2, nil, { onJoin = var7(p2, nil), onClose = var8(p2, nil) })
		fetchGroupDetailsModule(var1, p2):andThen(function(p3)
			-- upvalues: var4 (copy), t (ref), var6 (copy), p2 (ref), var5 (copy), var3 (copy), buildGroupJoinPromptData (copy), var7 (copy), var8 (copy), p1 (copy)
			if var4.current ~= t then return end
			local components = p3.components or {}
			local var9 = next(components) ~= nil
			local var10 = components.CommunityLocked ~= nil
			local var11 = p3.errors ~= nil
			local communityProfileHeader = components.CommunityProfileHeader or {}
			local var12 = communityProfileHeader.hasSocialModules ~= nil or communityProfileHeader.hasSocialModules
			
			if var11 then
				if var4.current == t then
					var6(p2, var12, "Network error on join prompt: Some group components failed to load", true)
					
					return
				end
				return
			elseif var9 then
				if var10 then
					if var4.current == t then
						var5(p2, "Group is currently moderated", var3.notificationGroupModerated)
						
						return
					end
					return
				elseif var4.current == t then
					local var13 = buildGroupJoinPromptData(p3)
					p1.openGroupJoinPrompt(p2, var13, { onJoin = var7(p2, var13), onClose = var8(p2, var13) })
					
					return
				end
				return
			elseif var4.current == t then
				var5(p2, "Group does not exist", var3.notificationGroupDoesNotExist)
				
				return
			end
		end, function(p3)
			-- upvalues: var4 (copy), t (ref), var5 (copy), p2 (ref), var3 (copy)
			if var4.current == t then
				var5(p2, "Network error on join prompt: " .. p19.StatusMessage, var3.notificationFailedToLoad)
				
				return
			end
		end)
	end, {
		p1.openGroupJoinPrompt, var1, var3, var7, var8, var5, var6
	}))
	
	return reactModule.createElement(reactModule.Fragment, {}, {})
end