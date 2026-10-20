local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local IXPService = game:GetService("IXPService")
local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui").RobloxGui
local LocalPlayer = Players.LocalPlayer
while LocalPlayer == nil do
	Players.ChildAdded:wait()
	LocalPlayer = Players.LocalPlayer
end
local Modules = RobloxGui.Modules
local PromptCreatorModule = require(Modules.PromptCreator)
local SocialUtilModule = require(Modules.SocialUtil)
local FriendingUtilityModule = require(Modules.FriendingUtility)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local UserRelationshipModalsModule = require(CorePackages.Workspace.Packages.UserRelationshipModals)
local LegacyThumbnailUrlsModule = require(Modules.Common.LegacyThumbnailUrls)
local FFlagRemoveHardCodedFriendLimitPromptModule = require(Modules.Flags.FFlagRemoveHardCodedFriendLimitPrompt)
local FriendRequestModalRevampV3 = game:DefineFastFlag("FriendRequestModalRevampV3", false)
local FriendRequestModalIxpEnabled = game:DefineFastFlag("FriendRequestModalIxpEnabled", false)
local FriendRequestModalIxpLayer = game:DefineFastString("FriendRequestModalIxpLayer", "")
local _ = LegacyThumbnailUrlsModule.Thumbnail
local _ = LegacyThumbnailUrlsModule.Bust
local Size150x150 = Enum.ThumbnailSize.Size150x150
local Size352x352 = Enum.ThumbnailSize.Size352x352
local HeadShot = Enum.ThumbnailType.HeadShot
local AvatarThumbnail = Enum.ThumbnailType.AvatarThumbnail

local function _(p1, p2)
	-- upvalues: RobloxTranslatorModule (copy)
	pcall(function()
		-- upvalues: p2 (ref), RobloxTranslatorModule (upval), p1 (copy)
		p2 = RobloxTranslatorModule:FormatByKey(p1)
	end)
	
	return p2
end

function createFetchImageFunction(...)
	-- upvalues: SocialUtilModule (copy)
	local list = { ... }
	
	return function(p1)
		-- upvalues: SocialUtilModule (upval), list (copy)
		spawn(function()
			-- upvalues: SocialUtilModule (upval), list (upval), p1 (copy)
			local PlayerImage = SocialUtilModule.GetPlayerImage(unpack(list))
			
			if p1 and p1.Parent then
				p1.Image = PlayerImage
			end
		end)
	end
end

function SendFriendRequest(Player)
	-- upvalues: RbxAnalyticsService (copy), LocalPlayer (ref)
	RbxAnalyticsService:ReportCounter("FriendPlayerPrompt-RequestFriendship")
	RbxAnalyticsService:TrackEvent("Game", "RequestFriendship", "FriendPlayerPrompt")
	
	return (pcall(function()
		-- upvalues: LocalPlayer (upval), Player (copy)
		LocalPlayer:RequestFriendship(Player)
	end))
end

function AtFriendLimit(Player): boolean
	-- upvalues: FFlagRemoveHardCodedFriendLimitPromptModule (copy), FriendingUtilityModule (copy)
	assert(not FFlagRemoveHardCodedFriendLimitPromptModule, "Should not call AtFriendLimit when FFlagRemoveHardCodedFriendLimitPrompt is enabled")
	local FriendCountAsync = FriendingUtilityModule:GetFriendCountAsync(Player.UserId)
	
	return FriendCountAsync ~= nil and FriendingUtilityModule:MaxFriendCount() <= FriendCountAsync
end

function DoPromptRequestFriendPlayer(Player: Player)
	-- upvalues: LocalPlayer (ref), FriendRequestModalIxpEnabled (copy), IXPService (copy), FriendRequestModalIxpLayer (copy), FriendRequestModalRevampV3 (copy), UserRelationshipModalsModule (copy), FFlagRemoveHardCodedFriendLimitPromptModule (copy), PromptCreatorModule (copy), Size150x150 (copy), HeadShot (copy), Size352x352 (copy), AvatarThumbnail (copy), RobloxTranslatorModule (copy)
	if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
		if LocalPlayer:IsFriendsWithAsync(Player.UserId) then return end
	elseif LocalPlayer:IsFriendsWith(Player.UserId) then return end
	if FriendRequestModalIxpEnabled then
		IXPService:LogFlagLinkedUserLayerExposure(FriendRequestModalIxpLayer)
	end
	if FriendRequestModalRevampV3 then
		UserRelationshipModalsModule.launchPromptFriendRequestModal(Player.UserId)
		
		return
	else
		PromptCreatorModule:CreatePrompt({
			ConfirmationText = "Send Request",
			CancelText = "Cancel",
			CancelActive = true,
			Image = "",
			ImageConsoleVR = "",
			WindowTitle = RobloxTranslatorModule:FormatByKey("InGame.FriendPlayerPrompt.Title.SendFriendRequest"),
			MainText = string.format("Would you like to send %s a Friend Request?", Player.Name),
			FetchImageFunction = createFetchImageFunction(Player.UserId, Size150x150, HeadShot),
			FetchImageFunctionConsoleVR = createFetchImageFunction(Player.UserId, Size352x352, AvatarThumbnail),
			PromptCompletedCallback = function(p1)
				-- upvalues: FFlagRemoveHardCodedFriendLimitPromptModule (upval), LocalPlayer (upval), PromptCreatorModule (upval), Player (copy), Size150x150 (upval), HeadShot (upval), Size352x352 (upval), AvatarThumbnail (upval)
				if p1 then
					if not FFlagRemoveHardCodedFriendLimitPromptModule and AtFriendLimit(LocalPlayer) then
						while PromptCreatorModule:IsCurrentlyPrompting() do
							wait()
						end
						PromptCreatorModule:CreatePrompt({
							WindowTitle = "Friend Limit Reached",
							MainText = "You can not send a friend request because you are at the max friend limit.",
							ConfirmationText = "Okay",
							CancelActive = false,
							Image = "",
							ImageConsoleVR = "",
							FetchImageFunction = createFetchImageFunction(Player.UserId, Size150x150, HeadShot),
							FetchImageFunctionConsoleVR = createFetchImageFunction(Player.UserId, Size352x352, AvatarThumbnail),
							StripeColor = Color3.fromRGB(183, 34, 54)
						})
						
						return
					elseif not FFlagRemoveHardCodedFriendLimitPromptModule and AtFriendLimit(Player) then
						PromptCreatorModule:CreatePrompt({
							WindowTitle = "Error Sending Friend Request",
							ConfirmationText = "Okay",
							CancelActive = false,
							Image = "",
							ImageConsoleVR = "",
							MainText = string.format("You can not send a friend request to %s because they are at the max friend limit.", Player.Name),
							FetchImageFunction = createFetchImageFunction(Player.UserId, Size150x150, HeadShot),
							FetchImageFunctionConsoleVR = createFetchImageFunction(Player.UserId, Size352x352, AvatarThumbnail),
							StripeColor = Color3.fromRGB(183, 34, 54)
						})
						
						return
					else
						if not SendFriendRequest(Player) then
							while PromptCreatorModule:IsCurrentlyPrompting() do
								wait()
							end
							PromptCreatorModule:CreatePrompt({
								WindowTitle = "Error Sending Friend Request",
								ConfirmationText = "Okay",
								CancelActive = false,
								Image = "",
								ImageConsoleVR = "",
								MainText = string.format("An error occurred while sending %s a friend request. Please try again later.", Player.Name),
								FetchImageFunction = createFetchImageFunction(Player.UserId, Size150x150, HeadShot),
								FetchImageFunctionConsoleVR = createFetchImageFunction(Player.UserId, Size352x352, AvatarThumbnail),
								StripeColor = Color3.fromRGB(183, 34, 54)
							})
						end
					end
				end
			end
		})
	end
end

function PromptRequestFriendPlayer(Player: Player)
	-- upvalues: LocalPlayer (ref)
	if LocalPlayer.UserId < 0 then
		error("PromptSendFriendRequest can not be called for guests!")
	end
	if typeof(Player) ~= "Instance" or not Player:IsA("Player") then
		error("Invalid argument to PromptSendFriendRequest")
		
		return
	end
	if Player.UserId < 0 then
		error("PromptSendFriendRequest can not be called on guests!")
	end
	if Player == LocalPlayer then
		error("PromptSendFriendRequest: A user can not friend themselves!")
	end
	DoPromptRequestFriendPlayer(Player)
end

function UnFriendPlayer(Player)
	-- upvalues: LocalPlayer (ref)
	return (pcall(function()
		-- upvalues: LocalPlayer (upval), Player (copy)
		LocalPlayer:RevokeFriendship(Player)
	end))
end

function DoPromptUnfriendPlayer(Player: Player)
	-- upvalues: LocalPlayer (ref), PromptCreatorModule (copy), Size150x150 (copy), HeadShot (copy), Size352x352 (copy), AvatarThumbnail (copy)
	if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
		if not LocalPlayer:IsFriendsWithAsync(Player.UserId) then return end
	elseif not LocalPlayer:IsFriendsWith(Player.UserId) then return end
	PromptCreatorModule:CreatePrompt({
		WindowTitle = "Unfriend Person?",
		ConfirmationText = "Unfriend",
		CancelText = "Cancel",
		CancelActive = true,
		Image = "",
		ImageConsoleVR = "",
		MainText = string.format("Would you like to remove %s from your friends list?", Player.Name),
		FetchImageFunction = createFetchImageFunction(Player.UserId, Size150x150, HeadShot),
		FetchImageFunctionConsoleVR = createFetchImageFunction(Player.UserId, Size352x352, AvatarThumbnail),
		PromptCompletedCallback = function(p1)
			-- upvalues: Player (copy), PromptCreatorModule (upval), Size150x150 (upval), HeadShot (upval), Size352x352 (upval), AvatarThumbnail (upval)
			if p1 and not UnFriendPlayer(Player) then
				while PromptCreatorModule:IsCurrentlyPrompting() do
					wait()
				end
				PromptCreatorModule:CreatePrompt({
					WindowTitle = "Error Unfriending Person",
					ConfirmationText = "Okay",
					CancelActive = false,
					Image = "",
					ImageConsoleVR = "",
					MainText = string.format("An error occurred while unfriending %s. Please try again later.", Player.Name),
					FetchImageFunction = createFetchImageFunction(Player.UserId, Size150x150, HeadShot),
					FetchImageFunctionConsoleVR = createFetchImageFunction(Player.UserId, Size352x352, AvatarThumbnail),
					StripeColor = Color3.fromRGB(183, 34, 54)
				})
			end
		end
	})
end

function PromptUnfriendPlayer(Player: Player)
	-- upvalues: LocalPlayer (ref)
	if LocalPlayer.UserId < 0 then
		error("PromptUnfriend can not be called for guests!")
	end
	if typeof(Player) ~= "Instance" or not Player:IsA("Player") then
		error("Invalid argument to PromptUnfriend")
		
		return
	end
	if Player.UserId < 0 then
		error("PromptUnfriend can not be called on guests!")
	end
	if Player == LocalPlayer then
		error("PromptUnfriend: A user can not unfriend themselves!")
	end
	DoPromptUnfriendPlayer(Player)
end

StarterGui:RegisterSetCore("PromptSendFriendRequest", PromptRequestFriendPlayer)
StarterGui:RegisterSetCore("PromptUnfriend", PromptUnfriendPlayer)