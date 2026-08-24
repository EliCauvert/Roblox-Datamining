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

local function _(p0, p1)
	-- upvalues: robloxTranslatorModule (ref)
	pcall(function()
		-- upvalues: p1 (write), robloxTranslatorModule (copy), p0 (ref)
		p1 = robloxTranslatorModule:FormatByKey(p0)
	end)
	
	return p1
end

function createFetchImageFunction(...)
	-- upvalues: socialUtilModule (ref)
	local list = { ... }
	
	return function(p2)
		-- upvalues: socialUtilModule (copy), list (ref)
		spawn(function()
			-- upvalues: socialUtilModule (copy), list (copy), p2 (ref)
			local playerImage = socialUtilModule.GetPlayerImage(unpack(list))
			
			if p2 and p2.Parent then
				p2.Image = playerImage
			end
		end)
	end
end

function SendFriendRequest(p3)
	-- upvalues: rbxAnalyticsService (ref), localPlayer (write)
	rbxAnalyticsService:ReportCounter("FriendPlayerPrompt-RequestFriendship")
	rbxAnalyticsService:TrackEvent("Game", "RequestFriendship", "FriendPlayerPrompt")
	
	return pcall(function()
		-- upvalues: localPlayer (copy), p3 (ref)
		localPlayer:RequestFriendship(p3)
	end)
end

function AtFriendLimit(p4)
	-- upvalues: fFlagRemoveHardCodedFriendLimitPromptModule (ref), friendingUtilityModule (ref)
	assert(not fFlagRemoveHardCodedFriendLimitPromptModule, "Should not call AtFriendLimit when FFlagRemoveHardCodedFriendLimitPrompt is enabled")
	local userIdFriendCountAsync = friendingUtilityModule:GetFriendCountAsync(p4.UserId)
	
	return if userIdFriendCountAsync == nil then false else friendingUtilityModule:MaxFriendCount() <= userIdFriendCountAsync
end

function DoPromptRequestFriendPlayer(p5)
	-- upvalues: localPlayer (write), friendRequestModalIxpEnabled (ref), IXPService (ref), friendRequestModalIxpLayer (ref), friendRequestModalRevampV4 (ref), userRelationshipModalsModule (ref), fFlagRemoveHardCodedFriendLimitPromptModule (ref), promptCreatorModule (ref), size150x150 (ref), headShot (ref), size352x352 (ref), avatarThumbnail (ref), robloxTranslatorModule (ref)
	if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
		if localPlayer:IsFriendsWithAsync(p5.UserId) then return end
	elseif localPlayer:IsFriendsWith(p5.UserId) then return end
	if friendRequestModalIxpEnabled then
		IXPService:LogFlagLinkedUserLayerExposure(friendRequestModalIxpLayer)
	end
	if friendRequestModalRevampV4 then
		userRelationshipModalsModule.launchPromptFriendRequestModal(p5.UserId)
		
		return
	end
	promptCreatorModule:CreatePrompt({
		ConfirmationText = "Send Request",
		CancelText = "Cancel",
		CancelActive = true,
		Image = "",
		ImageConsoleVR = "",
		WindowTitle = robloxTranslatorModule:FormatByKey("InGame.FriendPlayerPrompt.Title.SendFriendRequest"),
		MainText = string.format("Would you like to send %s a Friend Request?", p5.Name),
		FetchImageFunction = createFetchImageFunction(p5.UserId, size150x150, headShot),
		FetchImageFunctionConsoleVR = createFetchImageFunction(p5.UserId, size352x352, avatarThumbnail),
		PromptCompletedCallback = function(p6)
			-- upvalues: fFlagRemoveHardCodedFriendLimitPromptModule (copy), localPlayer (copy), promptCreatorModule (copy), p5 (ref), size150x150 (copy), headShot (copy), size352x352 (copy), avatarThumbnail (copy)
			if p6 then
				if fFlagRemoveHardCodedFriendLimitPromptModule or not AtFriendLimit(localPlayer) then
					if not fFlagRemoveHardCodedFriendLimitPromptModule and AtFriendLimit(p5) then
						promptCreatorModule:CreatePrompt({
							WindowTitle = "Error Sending Friend Request",
							ConfirmationText = "Okay",
							CancelActive = false,
							Image = "",
							ImageConsoleVR = "",
							MainText = string.format("You can not send a friend request to %s because they are at the max friend limit.", p5.Name),
							FetchImageFunction = createFetchImageFunction(p5.UserId, size150x150, headShot),
							FetchImageFunctionConsoleVR = createFetchImageFunction(p5.UserId, size352x352, avatarThumbnail),
							StripeColor = Color3.fromRGB(183, 34, 54)
						})
						
						return
					elseif not SendFriendRequest(p5) then
						while promptCreatorModule:IsCurrentlyPrompting() do
							wait()
						end
						promptCreatorModule:CreatePrompt({
							WindowTitle = "Error Sending Friend Request",
							ConfirmationText = "Okay",
							CancelActive = false,
							Image = "",
							ImageConsoleVR = "",
							MainText = string.format("An error occurred while sending %s a friend request. Please try again later.", p5.Name),
							FetchImageFunction = createFetchImageFunction(p5.UserId, size150x150, headShot),
							FetchImageFunctionConsoleVR = createFetchImageFunction(p5.UserId, size352x352, avatarThumbnail),
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
						FetchImageFunction = createFetchImageFunction(p5.UserId, size150x150, headShot),
						FetchImageFunctionConsoleVR = createFetchImageFunction(p5.UserId, size352x352, avatarThumbnail),
						StripeColor = Color3.fromRGB(183, 34, 54)
					})
					
					return
				end
			end
		end
	})
end

function PromptRequestFriendPlayer(p7)
	-- upvalues: localPlayer (write)
	if localPlayer.UserId < 0 then
		error("PromptSendFriendRequest can not be called for guests!")
	end
	if typeof(p7) ~= "Instance" or not p7:IsA("Player") then
		error("Invalid argument to PromptSendFriendRequest")
		
		return
	elseif p7.UserId < 0 then
		error("PromptSendFriendRequest can not be called on guests!")
	end
	if p7 == localPlayer then
		error("PromptSendFriendRequest: A user can not friend themselves!")
	end
	DoPromptRequestFriendPlayer(p7)
end

function UnFriendPlayer(p8)
	-- upvalues: localPlayer (write)
	return pcall(function()
		-- upvalues: localPlayer (copy), p8 (ref)
		localPlayer:RevokeFriendship(p8)
	end)
end

function DoPromptUnfriendPlayer(p9)
	-- upvalues: localPlayer (write), promptCreatorModule (ref), size150x150 (ref), headShot (ref), size352x352 (ref), avatarThumbnail (ref)
	if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
		if localPlayer:IsFriendsWithAsync(p9.UserId) then
			promptCreatorModule:CreatePrompt({
				WindowTitle = "Unfriend Person?",
				ConfirmationText = "Unfriend",
				CancelText = "Cancel",
				CancelActive = true,
				Image = "",
				ImageConsoleVR = "",
				MainText = string.format("Would you like to remove %s from your friends list?", p9.Name),
				FetchImageFunction = createFetchImageFunction(p9.UserId, size150x150, headShot),
				FetchImageFunctionConsoleVR = createFetchImageFunction(p9.UserId, size352x352, avatarThumbnail),
				PromptCompletedCallback = function(p10)
					-- upvalues: p9 (ref), promptCreatorModule (copy), size150x150 (copy), headShot (copy), size352x352 (copy), avatarThumbnail (copy)
					if p10 and not UnFriendPlayer(p9) then
						while promptCreatorModule:IsCurrentlyPrompting() do
							wait()
						end
						promptCreatorModule:CreatePrompt({
							WindowTitle = "Error Unfriending Person",
							ConfirmationText = "Okay",
							CancelActive = false,
							Image = "",
							ImageConsoleVR = "",
							MainText = string.format("An error occurred while unfriending %s. Please try again later.", p9.Name),
							FetchImageFunction = createFetchImageFunction(p9.UserId, size150x150, headShot),
							FetchImageFunctionConsoleVR = createFetchImageFunction(p9.UserId, size352x352, avatarThumbnail),
							StripeColor = Color3.fromRGB(183, 34, 54)
						})
					end
				end
			})
			
			return
		else
			return
		end
	elseif localPlayer:IsFriendsWith(p9.UserId) then
	else
	end
end

function PromptUnfriendPlayer(p11)
	-- upvalues: localPlayer (write)
	if localPlayer.UserId < 0 then
		error("PromptUnfriend can not be called for guests!")
	end
	if typeof(p11) ~= "Instance" or not p11:IsA("Player") then
		error("Invalid argument to PromptUnfriend")
		
		return
	elseif p11.UserId < 0 then
		error("PromptUnfriend can not be called on guests!")
	end
	if p11 == localPlayer then
		error("PromptUnfriend: A user can not unfriend themselves!")
	end
	DoPromptUnfriendPlayer(p11)
end

starterGuiService:RegisterSetCore("PromptSendFriendRequest", PromptRequestFriendPlayer)
starterGuiService:RegisterSetCore("PromptUnfriend", PromptUnfriendPlayer)