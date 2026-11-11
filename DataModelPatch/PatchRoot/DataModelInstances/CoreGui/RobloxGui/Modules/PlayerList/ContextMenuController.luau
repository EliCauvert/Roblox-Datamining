local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local BlockingUtilityModule = require(CorePackages.Workspace.Packages.BlockingUtility)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local RequestFriendshipModule = require(script.Parent.Thunks.RequestFriendship)
local PlayerListModule = require(CorePackages.Workspace.Packages.PlayerList)
local PlayerListVisibilityStore = PlayerListModule.PlayerListVisibilityStore
local PlayerContextualMenuStore = PlayerListModule.PlayerContextualMenuStore
local BuilderIconFunction = PlayerListModule.builderIcon
local BuildMenuHeaderFunction = PlayerContextualMenuStore.buildMenuHeader
local LocalPlayer = game:GetService("Players").LocalPlayer
local PersonPlus = BuilderIconFunction("person-plus")
local PersonTrashCan = BuilderIconFunction("person-trash-can")
local CircleSlash = BuilderIconFunction("circle-slash")
local SpeechBubbleExclamation = BuilderIconFunction("speech-bubble-exclamation")
local MagnifyingGlassPlus = BuilderIconFunction("magnifying-glass-plus")

local function _(p1, p2)
	-- upvalues: RobloxTranslatorModule (copy)
	local Success, Result = pcall(function()
		-- upvalues: RobloxTranslatorModule (upval), p1 (copy)
		return RobloxTranslatorModule:FormatByKey(p1)
	end)
	
	return if Success and Result and Result ~= "" then Result else p2
end

local function getFriendLabelAndIcon(FriendStatus)
	-- upvalues: RobloxTranslatorModule (copy), PersonTrashCan (copy), PersonPlus (copy)
	if FriendStatus == Enum.FriendStatus.Friend then
		local v1 = "InGame.PlayerDropDown.UnFriend"
		local Success, Result = pcall(function()
			-- upvalues: RobloxTranslatorModule (upval), v1 (copy)
			return RobloxTranslatorModule:FormatByKey(v1)
		end)
		
		return if Success and Result and Result ~= "" then Result else "Unfriend", PersonTrashCan
	elseif FriendStatus == Enum.FriendStatus.FriendRequestSent then
		local v2 = "InGame.PlayerDropDown.CancelRequest"
		local Success1, Result1 = pcall(function()
			-- upvalues: RobloxTranslatorModule (upval), v2 (copy)
			return RobloxTranslatorModule:FormatByKey(v2)
		end)
		
		return if Success1 and Result1 and Result1 ~= "" then Result1 else "Cancel request", PersonPlus
	elseif FriendStatus == Enum.FriendStatus.FriendRequestReceived then
		local v3 = "InGame.PlayerDropDown.Accept"
		local Success2, Result2 = pcall(function()
			-- upvalues: RobloxTranslatorModule (upval), v3 (copy)
			return RobloxTranslatorModule:FormatByKey(v3)
		end)
		
		return if Success2 and Result2 and Result2 ~= "" then Result2 else "Accept request", PersonPlus
	else
		local v4 = "InGame.PlayerDropDown.Action.ConnectionRequest"
		local Success3, Result3 = pcall(function()
			-- upvalues: RobloxTranslatorModule (upval), v4 (copy)
			return RobloxTranslatorModule:FormatByKey(v4)
		end)
		
		return if Success3 and Result3 and Result3 ~= "" then Result3 else "Friend request", PersonPlus
	end
end

local function openReportDialog(Player)
	-- upvalues: RobloxGui (copy)
	if require(RobloxGui.Modules.isNewInGameMenuEnabled)() then
		require(RobloxGui.Modules.InGameMenuInit).openReportDialog(Player, "PlayerListReskin")
		
		return
	else
		require(RobloxGui.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage):ReportPlayer(Player, "PlayerListReskin")
	end
end

local function assembleMenuItems(p1)
	-- upvalues: getFriendLabelAndIcon (copy), RobloxTranslatorModule (copy), PersonTrashCan (copy), MagnifyingGlassPlus (copy), CircleSlash (copy), SpeechBubbleExclamation (copy)
	local List = {}
	
	if not p1.isSelf and not p1.isBlocked then
		local FriendLabelAndIcon, FriendLabelAndIcon2 = getFriendLabelAndIcon(p1.friendStatus)
		local IsFriendStatusMatch = p1.friendStatus == Enum.FriendStatus.Friend
		local config = {
			key = "friend",
			label = FriendLabelAndIcon,
			icon = FriendLabelAndIcon2,
			onActivated = p1.actions.onFriend,
			requiresConfirm = if IsFriendStatusMatch then true else nil
		}
		local Result1 = nil
		
		if IsFriendStatusMatch then
			local v1 = "InGame.PlayerDropDown.ConfirmUnFriend"
			local Success, Result = pcall(function()
				-- upvalues: RobloxTranslatorModule (upval), v1 (copy)
				return RobloxTranslatorModule:FormatByKey(v1)
			end)
			Result1 = if Success and Result and Result ~= "" then Result else "Tap to confirm unfriend"
		else
			Result1 = nil
		end
		config.confirmLabel = Result1
		table.insert(List, config)
		
		if p1.friendStatus == Enum.FriendStatus.FriendRequestReceived then
			local v2 = "InGame.PlayerDropDown.Decline"
			local Success1, Result2 = pcall(function()
				-- upvalues: RobloxTranslatorModule (upval), v2 (copy)
				return RobloxTranslatorModule:FormatByKey(v2)
			end)
			table.insert(List, {
				key = "decline",
				label = if Success1 and Result2 and Result2 ~= "" then Result2 else "Decline",
				icon = PersonTrashCan,
				onActivated = p1.actions.onDecline
			})
		end
	end
	if p1.inspectMenuEnabled then
		local v3 = "InGame.PlayerDropDown.Examine"
		local Success2, Result3 = pcall(function()
			-- upvalues: RobloxTranslatorModule (upval), v3 (copy)
			return RobloxTranslatorModule:FormatByKey(v3)
		end)
		table.insert(List, {
			key = "examine",
			label = if Success2 and Result3 and Result3 ~= "" then Result3 else "Examine avatar",
			icon = MagnifyingGlassPlus,
			onActivated = p1.actions.onExamine
		})
	end
	if not p1.isSelf then
		local config = { key = "block" }
		local Result5 = nil
		
		if p1.isBlocked then
			local v4 = "InGame.PlayerDropDown.UnBlock"
			local Success3, Result4 = pcall(function()
				-- upvalues: RobloxTranslatorModule (upval), v4 (copy)
				return RobloxTranslatorModule:FormatByKey(v4)
			end)
			Result5 = if Success3 and Result4 and Result4 ~= "" then Result4 else "Unblock"
		else
			local v5 = "InGame.PlayerDropDown.Block"
			local Success4, Result6 = pcall(function()
				-- upvalues: RobloxTranslatorModule (upval), v5 (copy)
				return RobloxTranslatorModule:FormatByKey(v5)
			end)
			Result5 = if Success4 and Result6 and Result6 ~= "" then Result6 else "Block"
		end
		config.label = Result5
		config.icon = CircleSlash
		config.onActivated = p1.actions.onBlock
		table.insert(List, config)
		local v6 = "InGame.PlayerDropDown.Report"
		local Success5, Result7 = pcall(function()
			-- upvalues: RobloxTranslatorModule (upval), v6 (copy)
			return RobloxTranslatorModule:FormatByKey(v6)
		end)
		table.insert(List, {
			key = "report",
			label = if Success5 and Result7 and Result7 ~= "" then Result7 else "Report abuse",
			icon = SpeechBubbleExclamation,
			onActivated = p1.actions.onReport
		})
	end
	return List
end

return {
	buildMenuData = function(Player: Player, Callback, p1)
		-- upvalues: LocalPlayer (copy), BlockingUtilityModule (copy), assembleMenuItems (copy), GuiService (copy), RbxAnalyticsService (copy), RequestFriendshipModule (copy), PlayerContextualMenuStore (copy), PlayerListVisibilityStore (copy), RobloxGui (copy), openReportDialog (copy), BuildMenuHeaderFunction (copy)
		local UserId = Player.UserId
		local IsPlayerMatch: boolean = LocalPlayer ~= nil and Player == LocalPlayer
		local IsPlayerBlockedByUserId = false
		local Unknown = Enum.FriendStatus.Unknown
		
		if not IsPlayerMatch then
			pcall(function()
				-- upvalues: IsPlayerBlockedByUserId (ref), BlockingUtilityModule (upval), UserId (copy)
				IsPlayerBlockedByUserId = BlockingUtilityModule:IsPlayerBlockedByUserId(UserId)
			end)
			
			if not IsPlayerBlockedByUserId then
				pcall(function()
					-- upvalues: Unknown (ref), LocalPlayer (upval), Player (copy)
					Unknown = LocalPlayer:GetFriendStatus(Player)
				end)
			end
		end
		return {
			player = Player,
			header = BuildMenuHeaderFunction(Player),
			items = assembleMenuItems({
				isSelf = IsPlayerMatch,
				isBlocked = IsPlayerBlockedByUserId,
				friendStatus = Unknown,
				inspectMenuEnabled = GuiService:GetInspectMenuEnabled(),
				actions = {
					onFriend = function()
						-- upvalues: Unknown (ref), RbxAnalyticsService (upval), LocalPlayer (upval), Player (copy), RequestFriendshipModule (upval), Callback (copy)
						if Unknown == Enum.FriendStatus.Friend or Unknown == Enum.FriendStatus.FriendRequestSent then
							RbxAnalyticsService:TrackEvent("Game", "RevokeFriendship", "PlayerDropDown")
							LocalPlayer:RevokeFriendship(Player)
						elseif Unknown == Enum.FriendStatus.FriendRequestReceived then
							RequestFriendshipModule(Player, true)()
						else
							RequestFriendshipModule(Player)()
						end
						Callback()
					end,
					onDecline = function()
						-- upvalues: RbxAnalyticsService (upval), LocalPlayer (upval), Player (copy), Callback (copy)
						RbxAnalyticsService:TrackEvent("Game", "DeclineFriendship", "PlayerDropDown")
						LocalPlayer:RevokeFriendship(Player)
						Callback()
					end,
					onExamine = function()
						-- upvalues: p1 (copy), PlayerContextualMenuStore (upval), PlayerListVisibilityStore (upval), GuiService (upval), UserId (copy), Callback (copy)
						if p1 then
							PlayerContextualMenuStore.setSuppressNextDismissRestore(true)
							PlayerListVisibilityStore.setVisible(false)
						end
						GuiService:InspectPlayerFromUserIdWithCtx(UserId, "leaderBoard")
						Callback()
					end,
					onBlock = function()
						-- upvalues: p1 (copy), IsPlayerBlockedByUserId (ref), PlayerContextualMenuStore (upval), PlayerListVisibilityStore (upval), BlockingUtilityModule (upval), Player (copy), RobloxGui (upval), Callback (copy)
						if p1 and not IsPlayerBlockedByUserId then
							PlayerContextualMenuStore.setSuppressNextDismissRestore(true)
							PlayerListVisibilityStore.setVisible(false)
						end
						if IsPlayerBlockedByUserId then
							coroutine.wrap(function()
								-- upvalues: BlockingUtilityModule (upval), Player (upval)
								BlockingUtilityModule:UnblockPlayerAsync(Player)
							end)()
						else
							require(RobloxGui.Modules.Settings.onBlockButtonActivated)(Player, nil, "PlayerListReskin", {})
						end
						Callback()
					end,
					onReport = function()
						-- upvalues: p1 (copy), PlayerContextualMenuStore (upval), PlayerListVisibilityStore (upval), openReportDialog (upval), Player (copy), Callback (copy)
						if p1 then
							PlayerContextualMenuStore.setSuppressNextDismissRestore(true)
							PlayerListVisibilityStore.setVisible(false)
						end
						openReportDialog(Player)
						Callback()
					end
				}
			})
		}
	end,
	assembleMenuItems = assembleMenuItems,
	getFriendLabelAndIcon = getFriendLabelAndIcon
}