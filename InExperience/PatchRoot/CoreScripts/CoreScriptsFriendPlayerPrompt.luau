local starterGuiService = game:GetService("StarterGui")
local playersService = game:GetService("Players")
local coreGuiService = game:GetService("CoreGui")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local IXPService = game:GetService("IXPService")
local corePackagesService = game:GetService("CorePackages")
local robloxGui = coreGuiService.RobloxGui
local localPlayer = playersService.LocalPlayer
while localPlayer == nil do
	playersService.ChildAdded:wait()
	localPlayer = playersService.LocalPlayer
end
local modules = robloxGui.Modules
local promptCreatorModule = require(modules.PromptCreator)
local socialUtilModule = require(modules.SocialUtil)
local friendingUtilityModule = require(modules.FriendingUtility)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local userRelationshipModalsModule = require(corePackagesService.Workspace.Packages.UserRelationshipModals)
local legacyThumbnailUrlsModule = require(modules.Common.LegacyThumbnailUrls)
local fFlagRemoveHardCodedFriendLimitPromptModule = require(modules.Flags.FFlagRemoveHardCodedFriendLimitPrompt)
local friendRequestModalRevampV4 = game:DefineFastFlag("FriendRequestModalRevampV4", false)
local friendRequestModalIxpEnabled = game:DefineFastFlag("FriendRequestModalIxpEnabled", false)
local friendRequestModalIxpLayer = game:DefineFastString("FriendRequestModalIxpLayer", "")
local _ = legacyThumbnailUrlsModule.Thumbnail
local _ = legacyThumbnailUrlsModule.Bust
local size150x150 = Enum.ThumbnailSize.Size150x150
local size352x352 = Enum.ThumbnailSize.Size352x352
local headShot = Enum.ThumbnailType.HeadShot
local avatarThumbnail = Enum.ThumbnailType.AvatarThumbnail

local function _(p1, p2)
	-- upvalues: robloxTranslatorModule (ref)
	pcall(function()
		-- upvalues: p2 (write), robloxTranslatorModule (copy), p1 (ref)
		p2 = robloxTranslatorModule:FormatByKey(p1)
	end)
	
	return p2
end

function createFetchImageFunction(...)
	-- upvalues: socialUtilModule (ref)
	local list = { ... }
	
	return function(p1)
		-- upvalues: socialUtilModule (copy), list (ref)
		spawn(function()
			-- upvalues: socialUtilModule (copy), list (copy), p1 (ref)
			local playerImage = socialUtilModule.GetPlayerImage(unpack(list))
			
			if p1 and p1.Parent then
				p1.Image = playerImage
			end
		end)
	end
end

function SendFriendRequest(p1)
	-- upvalues: rbxAnalyticsService (ref), localPlayer (write)
	rbxAnalyticsService:ReportCounter("FriendPlayerPrompt-RequestFriendship")
	rbxAnalyticsService:TrackEvent("Game", "RequestFriendship", "FriendPlayerPrompt")
	
	return pcall(function()
		-- upvalues: localPlayer (copy), p1 (ref)
		localPlayer:RequestFriendship(p1)
	end)
end

function AtFriendLimit(p1)
	-- upvalues: fFlagRemoveHardCodedFriendLimitPromptModule (ref), friendingUtilityModule (ref)
	assert(not fFlagRemoveHardCodedFriendLimitPromptModule, "Should not call AtFriendLimit when FFlagRemoveHardCodedFriendLimitPrompt is enabled")
	local userIdFriendCountAsync = friendingUtilityModule:GetFriendCountAsync(p1.UserId)
	
	return if userIdFriendCountAsync == nil then false else friendingUtilityModule:MaxFriendCount() <= userIdFriendCountAsync
end

function DoPromptRequestFriendPlayer(p1)
	-- upvalues: localPlayer (write), friendRequestModalIxpEnabled (ref), IXPService (ref), friendRequestModalIxpLayer (ref), friendRequestModalRevampV4 (ref), userRelationshipModalsModule (ref), fFlagRemoveHardCodedFriendLimitPromptModule (ref), promptCreatorModule (ref), size150x150 (ref), headShot (ref), size352x352 (ref), avatarThumbnail (ref), robloxTranslatorModule (ref)
	if localPlayer:IsFriendsWithAsync(p1.UserId) then return end
	if friendRequestModalIxpEnabled then
		IXPService:LogFlagLinkedUserLayerExposure(friendRequestModalIxpLayer)
	end
	if friendRequestModalRevampV4 then
		userRelationshipModalsModule.launchPromptFriendRequestModal(p1.UserId)
		
		return
	end
	promptCreatorModule:CreatePrompt({
		ConfirmationText = "Send Request",
		CancelText = "Cancel",
		CancelActive = true,
		Image = "",
		ImageConsoleVR = "",
		WindowTitle = robloxTranslatorModule:FormatByKey("InGame.FriendPlayerPrompt.Title.SendFriendRequest"),
		MainText = string.format("Would you like to send %s a Friend Request?", p1.Name),
		FetchImageFunction = createFetchImageFunction(p1.UserId, size150x150, headShot),
		FetchImageFunctionConsoleVR = createFetchImageFunction(p1.UserId, size352x352, avatarThumbnail),
		PromptCompletedCallback = function(p2)
			-- upvalues: fFlagRemoveHardCodedFriendLimitPromptModule (copy), localPlayer (copy), promptCreatorModule (copy), p1 (ref), size150x150 (copy), headShot (copy), size352x352 (copy), avatarThumbnail (copy)
			if p2 then
				if fFlagRemoveHardCodedFriendLimitPromptModule or not AtFriendLimit(localPlayer) then
					if not fFlagRemoveHardCodedFriendLimitPromptModule and AtFriendLimit(p1) then
						promptCreatorModule:CreatePrompt({
							WindowTitle = "Error Sending Friend Request",
							ConfirmationText = "Okay",
							CancelActive = false,
							Image = "",
							ImageConsoleVR = "",
							MainText = string.format("You can not send a friend request to %s because they are at the max friend limit.", p1.Name),
							FetchImageFunction = createFetchImageFunction(p1.UserId, size150x150, headShot),
							FetchImageFunctionConsoleVR = createFetchImageFunction(p1.UserId, size352x352, avatarThumbnail),
							StripeColor = Color3.fromRGB(183, 34, 54)
						})
						
						return
					elseif not SendFriendRequest(p1) then
						while promptCreatorModule:IsCurrentlyPrompting() do
							wait()
						end
						promptCreatorModule:CreatePrompt({
							WindowTitle = "Error Sending Friend Request",
							ConfirmationText = "Okay",
							CancelActive = false,
							Image = "",
							ImageConsoleVR = "",
							MainText = string.format("An error occurred while sending %s a friend request. Please try again later.", p1.Name),
							FetchImageFunction = createFetchImageFunction(p1.UserId, size150x150, headShot),
							FetchImageFunctionConsoleVR = createFetchImageFunction(p1.UserId, size352x352, avatarThumbnail),
							StripeColor = Color3.fromRGB(183, 34, 54)
						})
					end
				else
					while promptCreatorModule:IsCurrentlyPrompting() do
						wait()
					end
					promptCreatorModule:CreatePrompt({
						WindowTitle = "Friend Limit Reached",
						MainText = "You can not send a friend request because you are at the max friend limit.",
						ConfirmationText = "Okay",
						CancelActive = false,
						Image = "",
						ImageConsoleVR = "",
						FetchImageFunction = createFetchImageFunction(p1.UserId, size150x150, headShot),
						FetchImageFunctionConsoleVR = createFetchImageFunction(p1.UserId, size352x352, avatarThumbnail),
						StripeColor = Color3.fromRGB(183, 34, 54)
					})
					
					return
				end
			end
		end
	})
end

function PromptRequestFriendPlayer(p3)
	-- upvalues: localPlayer (write)
	if localPlayer.UserId < 0 then
		error("PromptSendFriendRequest can not be called for guests!")
	end
	if typeof(p3) ~= "Instance" or not p3:IsA("Player") then
		error("Invalid argument to PromptSendFriendRequest")
		
		return
	elseif p3.UserId < 0 then
		error("PromptSendFriendRequest can not be called on guests!")
	end
	if p3 == localPlayer then
		error("PromptSendFriendRequest: A user can not friend themselves!")
	end
	DoPromptRequestFriendPlayer(p3)
end

function UnFriendPlayer(p3)
	-- upvalues: localPlayer (write)
	return pcall(function()
		-- upvalues: localPlayer (copy), p3 (ref)
		localPlayer:RevokeFriendship(p3)
	end)
end

function DoPromptUnfriendPlayer(p3)
	-- upvalues: localPlayer (write), promptCreatorModule (ref), size150x150 (ref), headShot (ref), size352x352 (ref), avatarThumbnail (ref)
	if localPlayer:IsFriendsWithAsync(p3.UserId) then
		promptCreatorModule:CreatePrompt({
			WindowTitle = "Unfriend Person?",
			ConfirmationText = "Unfriend",
			CancelText = "Cancel",
			CancelActive = true,
			Image = "",
			ImageConsoleVR = "",
			MainText = string.format("Would you like to remove %s from your friends list?", p3.Name),
			FetchImageFunction = createFetchImageFunction(p3.UserId, size150x150, headShot),
			FetchImageFunctionConsoleVR = createFetchImageFunction(p3.UserId, size352x352, avatarThumbnail),
			PromptCompletedCallback = function(p4)
				-- upvalues: p3 (ref), promptCreatorModule (copy), size150x150 (copy), headShot (copy), size352x352 (copy), avatarThumbnail (copy)
				if p4 and not UnFriendPlayer(p3) then
					while promptCreatorModule:IsCurrentlyPrompting() do
						wait()
					end
					promptCreatorModule:CreatePrompt({
						WindowTitle = "Error Unfriending Person",
						ConfirmationText = "Okay",
						CancelActive = false,
						Image = "",
						ImageConsoleVR = "",
						MainText = string.format("An error occurred while unfriending %s. Please try again later.", p3.Name),
						FetchImageFunction = createFetchImageFunction(p3.UserId, size150x150, headShot),
						FetchImageFunctionConsoleVR = createFetchImageFunction(p3.UserId, size352x352, avatarThumbnail),
						StripeColor = Color3.fromRGB(183, 34, 54)
					})
				end
			end
		})
		
		return
	end
end

function PromptUnfriendPlayer(p4)
	-- upvalues: localPlayer (write)
	if localPlayer.UserId < 0 then
		error("PromptUnfriend can not be called for guests!")
	end
	if typeof(p4) ~= "Instance" or not p4:IsA("Player") then
		error("Invalid argument to PromptUnfriend")
		
		return
	elseif p4.UserId < 0 then
		error("PromptUnfriend can not be called on guests!")
	end
	if p4 == localPlayer then
		error("PromptUnfriend: A user can not unfriend themselves!")
	end
	DoPromptUnfriendPlayer(p4)
end

starterGuiService:RegisterSetCore("PromptSendFriendRequest", PromptRequestFriendPlayer)
starterGuiService:RegisterSetCore("PromptUnfriend", PromptUnfriendPlayer)