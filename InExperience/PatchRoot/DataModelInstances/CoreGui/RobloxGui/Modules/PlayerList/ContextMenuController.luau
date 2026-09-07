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
local var1 = builderIcon("person-plus")
local var2 = builderIcon("person-trash-can")
local var3 = builderIcon("circle-slash")
local var4 = builderIcon("speech-bubble-exclamation")
local var5 = builderIcon("magnifying-glass-plus")

local function _(p1, p2)
	-- upvalues: robloxTranslatorModule (ref)
	local ok, status = pcall(function()
		-- upvalues: robloxTranslatorModule (copy), p1 (ref)
		return robloxTranslatorModule:FormatByKey(p1)
	end)
	
	return if ok and status and status ~= "" then status else p2
end

local function getFriendLabelAndIcon(p1)
	-- upvalues: robloxTranslatorModule (ref), var2 (ref), var1 (ref)
	local ok, status
	if p1 == Enum.FriendStatus.Friend then
		local var6 = "InGame.PlayerDropDown.Unfriend"
		ok, status = pcall(function()
			-- upvalues: robloxTranslatorModule (copy), var6 (ref)
			return robloxTranslatorModule:FormatByKey(var6)
		end)
		
		return if ok and status and status ~= "" then status else "Unfriend", var2
	elseif p1 == Enum.FriendStatus.FriendRequestSent then
		local var7 = "InGame.PlayerDropDown.CancelRequest"
		ok, status = pcall(function()
			-- upvalues: robloxTranslatorModule (copy), var7 (ref)
			return robloxTranslatorModule:FormatByKey(var7)
		end)
		
		return if ok and status and status ~= "" then status else "Cancel request", var1
	elseif p1 == Enum.FriendStatus.FriendRequestReceived then
		local var8 = "InGame.PlayerDropDown.Accept"
		ok, status = pcall(function()
			-- upvalues: robloxTranslatorModule (copy), var8 (ref)
			return robloxTranslatorModule:FormatByKey(var8)
		end)
		
		return if ok and status and status ~= "" then status else "Accept request", var1
	end
	local var9 = "InGame.PlayerDropDown.Action.ConnectionRequest"
	ok, status = pcall(function()
		-- upvalues: robloxTranslatorModule (copy), var9 (ref)
		return robloxTranslatorModule:FormatByKey(var9)
	end)
	
	return if ok and status and status ~= "" then status else "Friend request", var1
end

local _ = function(p1)
	return if p1 == Enum.FriendStatus.Friend then "friend_remove" elseif p1 == Enum.FriendStatus.FriendRequestSent then "friend_cancel" elseif p1 == Enum.FriendStatus.FriendRequestReceived then "friend_accept" else "friend_send"
end

local function openReportDialog(p1)
	-- upvalues: robloxGui (ref)
	if require(robloxGui.Modules.isNewInGameMenuEnabled)() then
		require(robloxGui.Modules.InGameMenuInit).openReportDialog(p1, "PlayerListReskin")
		
		return
	end
	require(robloxGui.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage):ReportPlayer(p1, "PlayerListReskin")
end

local function assembleMenuItems(p1)
	-- upvalues: getFriendLabelAndIcon (ref), robloxTranslatorModule (ref), var2 (ref), var5 (ref), var3 (ref), var4 (ref)
	local t = {}
	
	if not p1.isSelf and not p1.isBlocked then
		local ok, status, var6
		local var7, var8 = getFriendLabelAndIcon(p1.friendStatus)
		local var9 = p1.friendStatus == Enum.FriendStatus.Friend
		local t_1 = {
			key = "friend",
			label = var7,
			icon = var8,
			onActivated = p1.actions.onFriend
		}
		local friendStatus = p1.friendStatus
		t_1.telemetryAction = if friendStatus == Enum.FriendStatus.Friend then "friend_remove" elseif friendStatus == Enum.FriendStatus.FriendRequestSent then "friend_cancel" elseif friendStatus == Enum.FriendStatus.FriendRequestReceived then "friend_accept" else "friend_send"
		t_1.requiresConfirm = if var9 then true else nil
		
		if var9 then
			local var10 = "InGame.PlayerDropDown.ConfirmUnfriend"
			ok, status = pcall(function()
				-- upvalues: robloxTranslatorModule (copy), var10 (ref)
				return robloxTranslatorModule:FormatByKey(var10)
			end)
			var6 = if ok and status and status ~= "" then status else "Tap to confirm unfriend"
		else
			var6 = nil
		end
		local ok, status
		t_1.confirmLabel = var6
		table.insert(t, t_1)
		
		if p1.friendStatus == Enum.FriendStatus.FriendRequestReceived then
			local t_2 = { key = "decline", telemetryAction = "friend_decline" }
			local var11 = "InGame.PlayerDropDown.Decline"
			ok, status = pcall(function()
				-- upvalues: robloxTranslatorModule (copy), var11 (ref)
				return robloxTranslatorModule:FormatByKey(var11)
			end)
			t_2.label = if ok and status and status ~= "" then status else "Decline"
			t_2.icon = var2
			t_2.onActivated = p1.actions.onDecline
			table.insert(t, t_2)
		end
	end
	if p1.inspectMenuEnabled then
		local t_1 = { key = "examine", telemetryAction = "avatar_examine" }
		local var12 = "InGame.PlayerDropDown.Examine"
		ok, status = pcall(function()
			-- upvalues: robloxTranslatorModule (copy), var12 (ref)
			return robloxTranslatorModule:FormatByKey(var12)
		end)
		t_1.label = if ok and status and status ~= "" then status else "Examine avatar"
		t_1.icon = var5
		t_1.onActivated = p1.actions.onExamine
		table.insert(t, t_1)
	end
	if not p1.isSelf then
		local var13
		local t_1 = { key = "block" }
		
		if p1.isBlocked then
			local var14 = "InGame.PlayerDropDown.UnBlock"
			ok, status = pcall(function()
				-- upvalues: robloxTranslatorModule (copy), var14 (ref)
				return robloxTranslatorModule:FormatByKey(var14)
			end)
			var13 = if ok and status and status ~= "" then status else "Unblock"
		else
			local var15 = "InGame.PlayerDropDown.Block"
			ok, status = pcall(function()
				-- upvalues: robloxTranslatorModule (copy), var15 (ref)
				return robloxTranslatorModule:FormatByKey(var15)
			end)
			var13 = if ok and status and status ~= "" then status else "Block"
		end
		t_1.label = var13
		t_1.icon = var3
		t_1.onActivated = p1.actions.onBlock
		t_1.telemetryAction = if p1.isBlocked then "user_unblock" else "user_block"
		table.insert(t, t_1)
		local t_2 = { key = "report", telemetryAction = "user_report" }
		local var16 = "InGame.PlayerDropDown.Report"
		ok, status = pcall(function()
			-- upvalues: robloxTranslatorModule (copy), var16 (ref)
			return robloxTranslatorModule:FormatByKey(var16)
		end)
		t_2.label = if ok and status and status ~= "" then status else "Report abuse"
		t_2.icon = var4
		t_2.onActivated = p1.actions.onReport
		table.insert(t, t_2)
	end
	return t
end

return {
	buildMenuData = function(p1, p2, p3)
		-- upvalues: localPlayer (ref), blockingUtilityModule (ref), assembleMenuItems (ref), guiService (ref), rbxAnalyticsService (ref), requestFriendshipModule (ref), playerContextualMenuStore (ref), playerListVisibilityStore (ref), robloxGui (ref), openReportDialog (ref), buildMenuHeader (ref)
		local userId = p1.UserId
		local var6 = localPlayer ~= nil and p1 == localPlayer
		local var7 = false
		local unknown = Enum.FriendStatus.Unknown
		
		if not var6 then
			pcall(function()
				-- upvalues: var7 (write), blockingUtilityModule (copy), userId (ref)
				var7 = blockingUtilityModule:IsPlayerBlockedByUserId(userId)
			end)
			pcall(function()
				-- upvalues: unknown (write), localPlayer (copy), p1 (ref)
				unknown = localPlayer:GetFriendStatus(p1)
			end)
		end
		return {
			player = p1,
			header = buildMenuHeader(p1),
			items = assembleMenuItems({
				isSelf = var6,
				isBlocked = var7,
				friendStatus = unknown,
				inspectMenuEnabled = guiService:GetInspectMenuEnabled(),
				actions = {
					onFriend = function()
						-- upvalues: unknown (write), rbxAnalyticsService (copy), localPlayer (copy), p1 (ref), requestFriendshipModule (copy), p2 (ref)
						if unknown == Enum.FriendStatus.Friend or unknown == Enum.FriendStatus.FriendRequestSent then
							rbxAnalyticsService:TrackEvent("Game", "RevokeFriendship", "PlayerDropDown")
							localPlayer:RevokeFriendship(p1)
						elseif unknown == Enum.FriendStatus.FriendRequestReceived then
							requestFriendshipModule(p1, true)()
						else
							requestFriendshipModule(p1)()
						end
						p2()
					end,
					onDecline = function()
						-- upvalues: rbxAnalyticsService (copy), localPlayer (copy), p1 (ref), p2 (ref)
						rbxAnalyticsService:TrackEvent("Game", "DeclineFriendship", "PlayerDropDown")
						localPlayer:RevokeFriendship(p1)
						p2()
					end,
					onExamine = function()
						-- upvalues: p3 (ref), playerContextualMenuStore (copy), playerListVisibilityStore (copy), guiService (copy), userId (ref), p2 (ref)
						if p3 then
							playerContextualMenuStore.setSuppressNextDismissRestore(true)
							playerListVisibilityStore.setVisible(false)
						end
						guiService:InspectPlayerFromUserIdWithCtx(userId, "leaderBoard")
						p2()
					end,
					onBlock = function()
						-- upvalues: p3 (ref), var7 (write), playerContextualMenuStore (copy), playerListVisibilityStore (copy), blockingUtilityModule (copy), p1 (ref), robloxGui (copy), p2 (ref)
						if p3 and not var7 then
							playerContextualMenuStore.setSuppressNextDismissRestore(true)
							playerListVisibilityStore.setVisible(false)
						end
						if var7 then
							coroutine.wrap(function()
								-- upvalues: blockingUtilityModule (copy), p1 (copy)
								blockingUtilityModule:UnblockPlayerAsync(p1)
							end)()
						else
							require(robloxGui.Modules.Settings.onBlockButtonActivated)(p1, nil, "PlayerListReskin", {})
						end
						p2()
					end,
					onReport = function()
						-- upvalues: p3 (ref), playerContextualMenuStore (copy), playerListVisibilityStore (copy), openReportDialog (copy), p1 (ref), p2 (ref)
						if p3 then
							playerContextualMenuStore.setSuppressNextDismissRestore(true)
							playerListVisibilityStore.setVisible(false)
						end
						openReportDialog(p1)
						p2()
					end
				}
			}),
			telemetry = {
				isSelf = var6,
				friendStatus = if var6 then nil else unknown.Name
			}
		}
	end,
	assembleMenuItems = assembleMenuItems,
	getFriendLabelAndIcon = getFriendLabelAndIcon
}