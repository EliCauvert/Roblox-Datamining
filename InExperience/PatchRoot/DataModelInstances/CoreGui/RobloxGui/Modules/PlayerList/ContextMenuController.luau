local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local playersService = game:GetService("Players")
local guiService = game:GetService("GuiService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local blockingUtilityModule = require(corePackagesService.Workspace.Packages.BlockingUtility)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local requestFriendshipModule = require(script.Parent.Thunks.RequestFriendship)
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local playerListVisibilityStore = playerListModule.PlayerListVisibilityStore
local playerContextualMenuStore = playerListModule.PlayerContextualMenuStore
local builderIcon = playerListModule.builderIcon
local buildMenuHeader = playerContextualMenuStore.buildMenuHeader
local localPlayer = playersService.LocalPlayer
local var10 = builderIcon("person-plus")
local var11 = builderIcon("person-trash-can")
local var12 = builderIcon("circle-slash")
local var13 = builderIcon("speech-bubble-exclamation")
local var14 = builderIcon("magnifying-glass-plus")

local function _(p0, p1) --[[ line: 45 | named "translate" ]]
	-- upvalues: robloxTranslatorModule (ref)
	local ok, status = pcall(function() --[[ line: 46 ]]
		-- upvalues: robloxTranslatorModule (copy), p0 (ref)
		return robloxTranslatorModule:FormatByKey(p0)
	end)
	
	return if ok and status and status ~= "" then status else p1
end

local function getFriendLabelAndIcon(p2) --[[ line: 55 ]]
	-- upvalues: robloxTranslatorModule (ref), var11 (ref), var10 (ref)
	local ok, status
	if p2 == Enum.FriendStatus.Friend then
		local var18 = "InGame.PlayerDropDown.Unfriend"
		ok, status = pcall(function() --[[ line: 46 ]]
			-- upvalues: robloxTranslatorModule (copy), var18 (ref)
			return robloxTranslatorModule:FormatByKey(var18)
		end)
		
		return if ok and status and status ~= "" then status else "Unfriend", var11
	elseif p2 == Enum.FriendStatus.FriendRequestSent then
		local var19 = "InGame.PlayerDropDown.CancelRequest"
		ok, status = pcall(function() --[[ line: 46 ]]
			-- upvalues: robloxTranslatorModule (copy), var19 (ref)
			return robloxTranslatorModule:FormatByKey(var19)
		end)
		
		return if ok and status and status ~= "" then status else "Cancel request", var10
	elseif p2 == Enum.FriendStatus.FriendRequestReceived then
		local var20 = "InGame.PlayerDropDown.Accept"
		ok, status = pcall(function() --[[ line: 46 ]]
			-- upvalues: robloxTranslatorModule (copy), var20 (ref)
			return robloxTranslatorModule:FormatByKey(var20)
		end)
		
		return if ok and status and status ~= "" then status else "Accept request", var10
	end
	local var21 = "InGame.PlayerDropDown.Action.ConnectionRequest"
	ok, status = pcall(function() --[[ line: 46 ]]
		-- upvalues: robloxTranslatorModule (copy), var21 (ref)
		return robloxTranslatorModule:FormatByKey(var21)
	end)
	
	return if ok and status and status ~= "" then status else "Friend request", var10
end

local _ = function(p3) --[[ line: 69 | named "getFriendTelemetryAction" ]]
	return if p3 == Enum.FriendStatus.Friend then "friend_remove" elseif p3 == Enum.FriendStatus.FriendRequestSent then "friend_cancel" elseif p3 == Enum.FriendStatus.FriendRequestReceived then "friend_accept" else "friend_send"
end

local function openReportDialog(p4) --[[ line: 80 ]]
	-- upvalues: robloxGui (ref)
	if require(robloxGui.Modules.isNewInGameMenuEnabled)() then
		require(robloxGui.Modules.InGameMenuInit).openReportDialog(p4, "PlayerListReskin")
		
		return
	end
	require(robloxGui.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage):ReportPlayer(p4, "PlayerListReskin")
end

local function assembleMenuItems(p5) --[[ line: 99 ]]
	-- upvalues: getFriendLabelAndIcon (ref), robloxTranslatorModule (ref), var11 (ref), var14 (ref), var12 (ref), var13 (ref)
	local t = {}
	
	if not p5.isSelf and not p5.isBlocked then
		local ok, status, var27
		local var23, var24 = getFriendLabelAndIcon(p5.friendStatus)
		local var25 = p5.friendStatus == Enum.FriendStatus.Friend
		local t_1 = {
			key = "friend",
			label = var23,
			icon = var24,
			onActivated = p5.actions.onFriend
		}
		local friendStatus = p5.friendStatus
		t_1.telemetryAction = if friendStatus == Enum.FriendStatus.Friend then "friend_remove" elseif friendStatus == Enum.FriendStatus.FriendRequestSent then "friend_cancel" elseif friendStatus == Enum.FriendStatus.FriendRequestReceived then "friend_accept" else "friend_send"
		t_1.requiresConfirm = if var25 then true else nil
		
		if var25 then
			local var28 = "InGame.PlayerDropDown.ConfirmUnfriend"
			ok, status = pcall(function() --[[ line: 46 ]]
				-- upvalues: robloxTranslatorModule (copy), var28 (ref)
				return robloxTranslatorModule:FormatByKey(var28)
			end)
			var27 = if ok and status and status ~= "" then status else "Tap to confirm unfriend"
		else
			var27 = nil
		end
		local ok, status
		t_1.confirmLabel = var27
		table.insert(t, t_1)
		
		if p5.friendStatus == Enum.FriendStatus.FriendRequestReceived then
			local t_2 = { key = "decline", telemetryAction = "friend_decline" }
			local var30 = "InGame.PlayerDropDown.Decline"
			ok, status = pcall(function() --[[ line: 46 ]]
				-- upvalues: robloxTranslatorModule (copy), var30 (ref)
				return robloxTranslatorModule:FormatByKey(var30)
			end)
			t_2.label = if ok and status and status ~= "" then status else "Decline"
			t_2.icon = var11
			t_2.onActivated = p5.actions.onDecline
			table.insert(t, t_2)
		end
	end
	if p5.inspectMenuEnabled then
		local t_1 = { key = "examine", telemetryAction = "avatar_examine" }
		local var32 = "InGame.PlayerDropDown.Examine"
		ok, status = pcall(function() --[[ line: 46 ]]
			-- upvalues: robloxTranslatorModule (copy), var32 (ref)
			return robloxTranslatorModule:FormatByKey(var32)
		end)
		t_1.label = if ok and status and status ~= "" then status else "Examine avatar"
		t_1.icon = var14
		t_1.onActivated = p5.actions.onExamine
		table.insert(t, t_1)
	end
	if not p5.isSelf then
		local var35
		local t_1 = { key = "block" }
		
		if p5.isBlocked then
			local var34 = "InGame.PlayerDropDown.UnBlock"
			ok, status = pcall(function() --[[ line: 46 ]]
				-- upvalues: robloxTranslatorModule (copy), var34 (ref)
				return robloxTranslatorModule:FormatByKey(var34)
			end)
			var35 = if ok and status and status ~= "" then status else "Unblock"
		else
			local var36 = "InGame.PlayerDropDown.Block"
			ok, status = pcall(function() --[[ line: 46 ]]
				-- upvalues: robloxTranslatorModule (copy), var36 (ref)
				return robloxTranslatorModule:FormatByKey(var36)
			end)
			var35 = if ok and status and status ~= "" then status else "Block"
		end
		t_1.label = var35
		t_1.icon = var12
		t_1.onActivated = p5.actions.onBlock
		t_1.telemetryAction = if p5.isBlocked then "user_unblock" else "user_block"
		table.insert(t, t_1)
		local t_2 = { key = "report", telemetryAction = "user_report" }
		local var38 = "InGame.PlayerDropDown.Report"
		ok, status = pcall(function() --[[ line: 46 ]]
			-- upvalues: robloxTranslatorModule (copy), var38 (ref)
			return robloxTranslatorModule:FormatByKey(var38)
		end)
		t_2.label = if ok and status and status ~= "" then status else "Report abuse"
		t_2.icon = var13
		t_2.onActivated = p5.actions.onReport
		table.insert(t, t_2)
	end
	return t
end

return {
	buildMenuData = function(p6, p7, p8) --[[ line: 167 ]]
		-- upvalues: localPlayer (ref), blockingUtilityModule (ref), assembleMenuItems (ref), guiService (ref), rbxAnalyticsService (ref), requestFriendshipModule (ref), playerContextualMenuStore (ref), playerListVisibilityStore (ref), robloxGui (ref), openReportDialog (ref), buildMenuHeader (ref)
		local userId = p6.UserId
		local var39 = localPlayer ~= nil and p6 == localPlayer
		local var40 = false
		local unknown = Enum.FriendStatus.Unknown
		
		if not var39 then
			pcall(function() --[[ line: 174 ]]
				-- upvalues: var40 (write), blockingUtilityModule (copy), userId (ref)
				var40 = blockingUtilityModule:IsPlayerBlockedByUserId(userId)
			end)
			pcall(function() --[[ line: 178 ]]
				-- upvalues: unknown (write), localPlayer (copy), p6 (ref)
				unknown = localPlayer:GetFriendStatus(p6)
			end)
		end
		return {
			player = p6,
			header = buildMenuHeader(p6),
			items = assembleMenuItems({
				isSelf = var39,
				isBlocked = var40,
				friendStatus = unknown,
				inspectMenuEnabled = guiService:GetInspectMenuEnabled(),
				actions = {
					onFriend = function() --[[ line: 190 ]]
						-- upvalues: unknown (write), rbxAnalyticsService (copy), localPlayer (copy), p6 (ref), requestFriendshipModule (copy), p7 (ref)
						if unknown == Enum.FriendStatus.Friend or unknown == Enum.FriendStatus.FriendRequestSent then
							rbxAnalyticsService:TrackEvent("Game", "RevokeFriendship", "PlayerDropDown")
							localPlayer:RevokeFriendship(p6)
						elseif unknown == Enum.FriendStatus.FriendRequestReceived then
							requestFriendshipModule(p6, true)()
						else
							requestFriendshipModule(p6)()
						end
						p7()
					end,
					onDecline = function() --[[ line: 201 ]]
						-- upvalues: rbxAnalyticsService (copy), localPlayer (copy), p6 (ref), p7 (ref)
						rbxAnalyticsService:TrackEvent("Game", "DeclineFriendship", "PlayerDropDown")
						localPlayer:RevokeFriendship(p6)
						p7()
					end,
					onExamine = function() --[[ line: 206 ]]
						-- upvalues: p8 (ref), playerContextualMenuStore (copy), playerListVisibilityStore (copy), guiService (copy), userId (ref), p7 (ref)
						if p8 then
							playerContextualMenuStore.setSuppressNextDismissRestore(true)
							playerListVisibilityStore.setVisible(false)
						end
						guiService:InspectPlayerFromUserIdWithCtx(userId, "leaderBoard")
						p7()
					end,
					onBlock = function() --[[ line: 214 ]]
						-- upvalues: p8 (ref), var40 (write), playerContextualMenuStore (copy), playerListVisibilityStore (copy), blockingUtilityModule (copy), p6 (ref), robloxGui (copy), p7 (ref)
						if p8 and not var40 then
							playerContextualMenuStore.setSuppressNextDismissRestore(true)
							playerListVisibilityStore.setVisible(false)
						end
						if var40 then
							coroutine.wrap(function() --[[ line: 220 ]]
								-- upvalues: blockingUtilityModule (copy), p6 (copy)
								blockingUtilityModule:UnblockPlayerAsync(p6)
							end)()
						else
							require(robloxGui.Modules.Settings.onBlockButtonActivated)(p6, nil, "PlayerListReskin", {})
						end
						p7()
					end,
					onReport = function() --[[ line: 229 ]]
						-- upvalues: p8 (ref), playerContextualMenuStore (copy), playerListVisibilityStore (copy), openReportDialog (copy), p6 (ref), p7 (ref)
						if p8 then
							playerContextualMenuStore.setSuppressNextDismissRestore(true)
							playerListVisibilityStore.setVisible(false)
						end
						openReportDialog(p6)
						p7()
					end
				}
			}),
			telemetry = {
				isSelf = var39,
				friendStatus = if var39 then nil else unknown.Name
			}
		}
	end,
	assembleMenuItems = assembleMenuItems,
	getFriendLabelAndIcon = getFriendLabelAndIcon
}