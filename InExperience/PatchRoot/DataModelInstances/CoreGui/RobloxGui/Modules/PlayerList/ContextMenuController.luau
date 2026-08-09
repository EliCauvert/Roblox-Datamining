local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local playersService = game:GetService("Players")
local guiService = game:GetService("GuiService")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local blockingUtilityModule = require(corePackagesService.Workspace.Packages.BlockingUtility)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local requestFriendshipModule = require(script.Parent.Thunks.RequestFriendship)
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local playerListVisibilityStore = playerListModule.PlayerListVisibilityStore
local builderIcon = playerListModule.builderIcon
local buildMenuHeader = playerListModule.PlayerContextualMenuStore.buildMenuHeader
local localPlayer = playersService.LocalPlayer
local var9 = builderIcon("person-plus")
local var10 = builderIcon("person-trash-can")
local var11 = builderIcon("circle-slash")
local var12 = builderIcon("speech-bubble-exclamation")
local var13 = builderIcon("magnifying-glass-plus")

local function _(p0, p1) --[[ line: 41 | named "translate" ]]
	-- upvalues: robloxTranslatorModule (ref)
	local ok, status = pcall(function() --[[ line: 42 ]]
		-- upvalues: robloxTranslatorModule (copy), p0 (ref)
		return robloxTranslatorModule:FormatByKey(p0)
	end)
	
	return if ok and status and status ~= "" then status else p1
end

local function getFriendLabelAndIcon(p2) --[[ line: 52 ]]
	-- upvalues: robloxTranslatorModule (ref), var10 (ref), var9 (ref)
	local ok, status
	if p2 == Enum.FriendStatus.Friend then
		local var17 = "InGame.PlayerDropDown.UnFriend"
		ok, status = pcall(function() --[[ line: 42 ]]
			-- upvalues: robloxTranslatorModule (copy), var17 (ref)
			return robloxTranslatorModule:FormatByKey(var17)
		end)
		
		return if ok and status and status ~= "" then status else "Unfriend", var10
	elseif p2 == Enum.FriendStatus.FriendRequestSent then
		local var18 = "InGame.PlayerDropDown.CancelRequest"
		ok, status = pcall(function() --[[ line: 42 ]]
			-- upvalues: robloxTranslatorModule (copy), var18 (ref)
			return robloxTranslatorModule:FormatByKey(var18)
		end)
		
		return if ok and status and status ~= "" then status else "Cancel request", var9
	elseif p2 == Enum.FriendStatus.FriendRequestReceived then
		local var19 = "InGame.PlayerDropDown.Accept"
		ok, status = pcall(function() --[[ line: 42 ]]
			-- upvalues: robloxTranslatorModule (copy), var19 (ref)
			return robloxTranslatorModule:FormatByKey(var19)
		end)
		
		return if ok and status and status ~= "" then status else "Accept request", var9
	end
	local var20 = "InGame.PlayerDropDown.Action.ConnectionRequest"
	ok, status = pcall(function() --[[ line: 42 ]]
		-- upvalues: robloxTranslatorModule (copy), var20 (ref)
		return robloxTranslatorModule:FormatByKey(var20)
	end)
	
	return if ok and status and status ~= "" then status else "Friend request", var9
end

local function openReportDialog(p3) --[[ line: 63 ]]
	-- upvalues: robloxGui (ref)
	if require(robloxGui.Modules.isNewInGameMenuEnabled)() then
		require(robloxGui.Modules.InGameMenuInit).openReportDialog(p3, "PlayerListReskin")
		
		return
	end
	require(robloxGui.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage):ReportPlayer(p3, "PlayerListReskin")
end

local function assembleMenuItems(p4) --[[ line: 86 ]]
	-- upvalues: getFriendLabelAndIcon (ref), robloxTranslatorModule (ref), var13 (ref), var11 (ref), var12 (ref)
	local ok, status
	local t = {}
	
	if not p4.isSelf and not p4.isBlocked then
		local var22, var23 = getFriendLabelAndIcon(p4.friendStatus)
		table.insert(t, {
			key = "friend",
			label = var22,
			icon = var23,
			onActivated = p4.actions.onFriend
		})
	end
	if p4.inspectMenuEnabled then
		local t_1 = { key = "examine" }
		local var25 = "InGame.PlayerDropDown.Examine"
		ok, status = pcall(function() --[[ line: 42 ]]
			-- upvalues: robloxTranslatorModule (copy), var25 (ref)
			return robloxTranslatorModule:FormatByKey(var25)
		end)
		t_1.label = if ok and status and status ~= "" then status else "Examine avatar"
		t_1.icon = var13
		t_1.onActivated = p4.actions.onExamine
		table.insert(t, t_1)
	end
	if not p4.isSelf then
		local var28
		local t_1 = { key = "block" }
		
		if p4.isBlocked then
			local var27 = "InGame.PlayerDropDown.UnBlock"
			ok, status = pcall(function() --[[ line: 42 ]]
				-- upvalues: robloxTranslatorModule (copy), var27 (ref)
				return robloxTranslatorModule:FormatByKey(var27)
			end)
			var28 = if ok and status and status ~= "" then status else "Unblock"
		else
			local var29 = "InGame.PlayerDropDown.Block"
			ok, status = pcall(function() --[[ line: 42 ]]
				-- upvalues: robloxTranslatorModule (copy), var29 (ref)
				return robloxTranslatorModule:FormatByKey(var29)
			end)
			var28 = if ok and status and status ~= "" then status else "Block"
		end
		t_1.label = var28
		t_1.icon = var11
		t_1.onActivated = p4.actions.onBlock
		table.insert(t, t_1)
		local t_2 = { key = "report" }
		local var31 = "InGame.PlayerDropDown.Report"
		ok, status = pcall(function() --[[ line: 42 ]]
			-- upvalues: robloxTranslatorModule (copy), var31 (ref)
			return robloxTranslatorModule:FormatByKey(var31)
		end)
		t_2.label = if ok and status and status ~= "" then status else "Report abuse"
		t_2.icon = var12
		t_2.onActivated = p4.actions.onReport
		table.insert(t, t_2)
	end
	return t
end

return {
	buildMenuData = function(p5, p6, p7) --[[ line: 138 ]]
		-- upvalues: localPlayer (ref), blockingUtilityModule (ref), assembleMenuItems (ref), guiService (ref), requestFriendshipModule (ref), playerListVisibilityStore (ref), robloxGui (ref), openReportDialog (ref), buildMenuHeader (ref)
		local userId = p5.UserId
		local var32 = localPlayer ~= nil and p5 == localPlayer
		local var33 = false
		local unknown = Enum.FriendStatus.Unknown
		
		if not var32 then
			pcall(function() --[[ line: 147 ]]
				-- upvalues: var33 (write), blockingUtilityModule (copy), userId (ref)
				var33 = blockingUtilityModule:IsPlayerBlockedByUserId(userId)
			end)
			pcall(function() --[[ line: 151 ]]
				-- upvalues: unknown (write), localPlayer (copy), p5 (ref)
				unknown = localPlayer:GetFriendStatus(p5)
			end)
		end
		return {
			player = p5,
			header = buildMenuHeader(p5),
			items = assembleMenuItems({
				isSelf = var32,
				isBlocked = var33,
				friendStatus = unknown,
				inspectMenuEnabled = guiService:GetInspectMenuEnabled(),
				actions = {
					onFriend = function() --[[ line: 163 ]]
						-- upvalues: unknown (write), localPlayer (copy), p5 (ref), requestFriendshipModule (copy), p6 (ref)
						if unknown == Enum.FriendStatus.Friend or unknown == Enum.FriendStatus.FriendRequestSent then
							localPlayer:RevokeFriendship(p5)
						elseif unknown == Enum.FriendStatus.FriendRequestReceived then
							requestFriendshipModule(p5, true)()
						else
							requestFriendshipModule(p5)()
						end
						p6()
					end,
					onExamine = function() --[[ line: 173 ]]
						-- upvalues: guiService (copy), userId (ref), p6 (ref), p7 (ref), playerListVisibilityStore (copy)
						guiService:InspectPlayerFromUserIdWithCtx(userId, "leaderBoard")
						p6()
						
						if p7 then
							playerListVisibilityStore.setVisible(false)
						end
					end,
					onBlock = function() --[[ line: 180 ]]
						-- upvalues: var33 (write), blockingUtilityModule (copy), p5 (ref), robloxGui (copy), p6 (ref)
						if var33 then
							coroutine.wrap(function() --[[ line: 182 ]]
								-- upvalues: blockingUtilityModule (copy), p5 (copy)
								blockingUtilityModule:UnblockPlayerAsync(p5)
							end)()
						else
							require(robloxGui.Modules.Settings.onBlockButtonActivated)(p5, nil, "PlayerListReskin", {})
						end
						p6()
					end,
					onReport = function() --[[ line: 191 ]]
						-- upvalues: openReportDialog (copy), p5 (ref), p6 (ref)
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