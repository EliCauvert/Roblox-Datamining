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

local function _(p0, p1) --[[ line: 43 | named "translate" ]]
	-- upvalues: robloxTranslatorModule (ref)
	local ok, status = pcall(function() --[[ line: 44 ]]
		-- upvalues: robloxTranslatorModule (copy), p0 (ref)
		return robloxTranslatorModule:FormatByKey(p0)
	end)
	
	return if ok and status and status ~= "" then status else p1
end

local function getFriendLabelAndIcon(p2) --[[ line: 53 ]]
	-- upvalues: robloxTranslatorModule (ref), var11 (ref), var10 (ref)
	local ok, status
	if p2 == Enum.FriendStatus.Friend then
		local var18 = "InGame.PlayerDropDown.UnFriend"
		ok, status = pcall(function() --[[ line: 44 ]]
			-- upvalues: robloxTranslatorModule (copy), var18 (ref)
			return robloxTranslatorModule:FormatByKey(var18)
		end)
		
		return if ok and status and status ~= "" then status else "Unfriend", var11
	elseif p2 == Enum.FriendStatus.FriendRequestSent then
		local var19 = "InGame.PlayerDropDown.CancelRequest"
		ok, status = pcall(function() --[[ line: 44 ]]
			-- upvalues: robloxTranslatorModule (copy), var19 (ref)
			return robloxTranslatorModule:FormatByKey(var19)
		end)
		
		return if ok and status and status ~= "" then status else "Cancel request", var10
	elseif p2 == Enum.FriendStatus.FriendRequestReceived then
		local var20 = "InGame.PlayerDropDown.Accept"
		ok, status = pcall(function() --[[ line: 44 ]]
			-- upvalues: robloxTranslatorModule (copy), var20 (ref)
			return robloxTranslatorModule:FormatByKey(var20)
		end)
		
		return if ok and status and status ~= "" then status else "Accept request", var10
	end
	local var21 = "InGame.PlayerDropDown.Action.ConnectionRequest"
	ok, status = pcall(function() --[[ line: 44 ]]
		-- upvalues: robloxTranslatorModule (copy), var21 (ref)
		return robloxTranslatorModule:FormatByKey(var21)
	end)
	
	return if ok and status and status ~= "" then status else "Friend request", var10
end

local function openReportDialog(p3) --[[ line: 64 ]]
	-- upvalues: robloxGui (ref)
	if require(robloxGui.Modules.isNewInGameMenuEnabled)() then
		require(robloxGui.Modules.InGameMenuInit).openReportDialog(p3, "PlayerListReskin")
		
		return
	end
	require(robloxGui.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage):ReportPlayer(p3, "PlayerListReskin")
end

local function assembleMenuItems(p4) --[[ line: 83 ]]
	-- upvalues: getFriendLabelAndIcon (ref), robloxTranslatorModule (ref), var11 (ref), var14 (ref), var12 (ref), var13 (ref)
	local t = {}
	
	if not p4.isSelf and not p4.isBlocked then
		local ok, status, var27
		local var23, var24 = getFriendLabelAndIcon(p4.friendStatus)
		local var25 = p4.friendStatus == Enum.FriendStatus.Friend
		local t_1 = {
			key = "friend",
			label = var23,
			icon = var24,
			onActivated = p4.actions.onFriend,
			requiresConfirm = if var25 then true else nil
		}
		
		if var25 then
			local var28 = "InGame.PlayerDropDown.ConfirmUnFriend"
			ok, status = pcall(function() --[[ line: 44 ]]
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
		
		if p4.friendStatus == Enum.FriendStatus.FriendRequestReceived then
			local t_2 = { key = "decline" }
			local var30 = "InGame.PlayerDropDown.Decline"
			ok, status = pcall(function() --[[ line: 44 ]]
				-- upvalues: robloxTranslatorModule (copy), var30 (ref)
				return robloxTranslatorModule:FormatByKey(var30)
			end)
			t_2.label = if ok and status and status ~= "" then status else "Decline"
			t_2.icon = var11
			t_2.onActivated = p4.actions.onDecline
			table.insert(t, t_2)
		end
	end
	if p4.inspectMenuEnabled then
		local t_1 = { key = "examine" }
		local var32 = "InGame.PlayerDropDown.Examine"
		ok, status = pcall(function() --[[ line: 44 ]]
			-- upvalues: robloxTranslatorModule (copy), var32 (ref)
			return robloxTranslatorModule:FormatByKey(var32)
		end)
		t_1.label = if ok and status and status ~= "" then status else "Examine avatar"
		t_1.icon = var14
		t_1.onActivated = p4.actions.onExamine
		table.insert(t, t_1)
	end
	if not p4.isSelf then
		local var35
		local t_1 = { key = "block" }
		
		if p4.isBlocked then
			local var34 = "InGame.PlayerDropDown.UnBlock"
			ok, status = pcall(function() --[[ line: 44 ]]
				-- upvalues: robloxTranslatorModule (copy), var34 (ref)
				return robloxTranslatorModule:FormatByKey(var34)
			end)
			var35 = if ok and status and status ~= "" then status else "Unblock"
		else
			local var36 = "InGame.PlayerDropDown.Block"
			ok, status = pcall(function() --[[ line: 44 ]]
				-- upvalues: robloxTranslatorModule (copy), var36 (ref)
				return robloxTranslatorModule:FormatByKey(var36)
			end)
			var35 = if ok and status and status ~= "" then status else "Block"
		end
		t_1.label = var35
		t_1.icon = var12
		t_1.onActivated = p4.actions.onBlock
		table.insert(t, t_1)
		local t_2 = { key = "report" }
		local var38 = "InGame.PlayerDropDown.Report"
		ok, status = pcall(function() --[[ line: 44 ]]
			-- upvalues: robloxTranslatorModule (copy), var38 (ref)
			return robloxTranslatorModule:FormatByKey(var38)
		end)
		t_2.label = if ok and status and status ~= "" then status else "Report abuse"
		t_2.icon = var13
		t_2.onActivated = p4.actions.onReport
		table.insert(t, t_2)
	end
	return t
end

return {
	buildMenuData = function(p5, p6, p7) --[[ line: 146 ]]
		-- upvalues: localPlayer (ref), blockingUtilityModule (ref), assembleMenuItems (ref), guiService (ref), rbxAnalyticsService (ref), requestFriendshipModule (ref), playerContextualMenuStore (ref), playerListVisibilityStore (ref), robloxGui (ref), openReportDialog (ref), buildMenuHeader (ref)
		local userId = p5.UserId
		local var39 = localPlayer ~= nil and p5 == localPlayer
		local var40 = false
		local unknown = Enum.FriendStatus.Unknown
		
		if not var39 then
			pcall(function() --[[ line: 153 ]]
				-- upvalues: var40 (write), blockingUtilityModule (copy), userId (ref)
				var40 = blockingUtilityModule:IsPlayerBlockedByUserId(userId)
			end)
			pcall(function() --[[ line: 157 ]]
				-- upvalues: unknown (write), localPlayer (copy), p5 (ref)
				unknown = localPlayer:GetFriendStatus(p5)
			end)
		end
		return {
			player = p5,
			header = buildMenuHeader(p5),
			items = assembleMenuItems({
				isSelf = var39,
				isBlocked = var40,
				friendStatus = unknown,
				inspectMenuEnabled = guiService:GetInspectMenuEnabled(),
				actions = {
					onFriend = function() --[[ line: 169 ]]
						-- upvalues: unknown (write), rbxAnalyticsService (copy), localPlayer (copy), p5 (ref), requestFriendshipModule (copy), p6 (ref)
						if unknown == Enum.FriendStatus.Friend or unknown == Enum.FriendStatus.FriendRequestSent then
							rbxAnalyticsService:TrackEvent("Game", "RevokeFriendship", "PlayerDropDown")
							localPlayer:RevokeFriendship(p5)
						elseif unknown == Enum.FriendStatus.FriendRequestReceived then
							requestFriendshipModule(p5, true)()
						else
							requestFriendshipModule(p5)()
						end
						p6()
					end,
					onDecline = function() --[[ line: 180 ]]
						-- upvalues: rbxAnalyticsService (copy), localPlayer (copy), p5 (ref), p6 (ref)
						rbxAnalyticsService:TrackEvent("Game", "DeclineFriendship", "PlayerDropDown")
						localPlayer:RevokeFriendship(p5)
						p6()
					end,
					onExamine = function() --[[ line: 185 ]]
						-- upvalues: p7 (ref), playerContextualMenuStore (copy), playerListVisibilityStore (copy), guiService (copy), userId (ref), p6 (ref)
						if p7 then
							playerContextualMenuStore.setSuppressNextDismissRestore(true)
							playerListVisibilityStore.setVisible(false)
						end
						guiService:InspectPlayerFromUserIdWithCtx(userId, "leaderBoard")
						p6()
					end,
					onBlock = function() --[[ line: 193 ]]
						-- upvalues: p7 (ref), var40 (write), playerContextualMenuStore (copy), playerListVisibilityStore (copy), blockingUtilityModule (copy), p5 (ref), robloxGui (copy), p6 (ref)
						if p7 and not var40 then
							playerContextualMenuStore.setSuppressNextDismissRestore(true)
							playerListVisibilityStore.setVisible(false)
						end
						if var40 then
							coroutine.wrap(function() --[[ line: 199 ]]
								-- upvalues: blockingUtilityModule (copy), p5 (copy)
								blockingUtilityModule:UnblockPlayerAsync(p5)
							end)()
						else
							require(robloxGui.Modules.Settings.onBlockButtonActivated)(p5, nil, "PlayerListReskin", {})
						end
						p6()
					end,
					onReport = function() --[[ line: 208 ]]
						-- upvalues: p7 (ref), playerContextualMenuStore (copy), playerListVisibilityStore (copy), openReportDialog (copy), p5 (ref), p6 (ref)
						if p7 then
							playerContextualMenuStore.setSuppressNextDismissRestore(true)
							playerListVisibilityStore.setVisible(false)
						end
						openReportDialog(p5)
						p6()
					end
				}
			})
		}
	end,
	assembleMenuItems = assembleMenuItems,
	getFriendLabelAndIcon = getFriendLabelAndIcon
}