local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
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
local BlockingUtilityModule = require(CorePackages.Workspace.Packages.BlockingUtility)
local OnBlockButtonActivatedModule = require(Modules.Settings.onBlockButtonActivated)
local Size150x150 = Enum.ThumbnailSize.Size150x150
local Size352x352 = Enum.ThumbnailSize.Size352x352
local HeadShot = Enum.ThumbnailType.HeadShot
local AvatarThumbnail = Enum.ThumbnailType.AvatarThumbnail

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

function DoPromptBlockPlayer(Player)
	-- upvalues: BlockingUtilityModule (copy), OnBlockButtonActivatedModule (copy)
	if not BlockingUtilityModule:IsPlayerBlockedByUserId(Player.UserId) then
		OnBlockButtonActivatedModule(Player)
		
		return
	end
end

function PromptBlockPlayer(Player: Player)
	-- upvalues: LocalPlayer (ref)
	if LocalPlayer.UserId < 0 then
		error("PromptBlockPlayer can not be called for guests!")
	end
	if typeof(Player) ~= "Instance" or not Player:IsA("Player") then
		error("Invalid argument to PromptBlockPlayer")
		
		return
	end
	if Player.UserId < 0 then
		error("PromptBlockPlayer can not be called on guests!")
	end
	if Player == LocalPlayer then
		error("PromptBlockPlayer: A user can not block themselves!")
	end
	DoPromptBlockPlayer(Player)
end

function DoPromptUnblockPlayer(Player: Player)
	-- upvalues: BlockingUtilityModule (copy), PromptCreatorModule (copy), Size150x150 (copy), HeadShot (copy), Size352x352 (copy), AvatarThumbnail (copy)
	local _ = not BlockingUtilityModule:IsPlayerBlockedByUserId(Player.UserId)
	PromptCreatorModule:CreatePrompt({
		WindowTitle = "Confirm Unblock",
		ConfirmationText = "Unblock",
		CancelText = "Cancel",
		CancelActive = true,
		Image = "",
		ImageConsoleVR = "",
		MainText = string.format("Would you like to unblock %s?", Player.Name),
		FetchImageFunction = createFetchImageFunction(Player.UserId, Size150x150, HeadShot),
		FetchImageFunctionConsoleVR = createFetchImageFunction(Player.UserId, Size352x352, AvatarThumbnail),
		PromptCompletedCallback = function(p1)
			-- upvalues: BlockingUtilityModule (upval), Player (copy), PromptCreatorModule (upval), Size150x150 (upval), HeadShot (upval), Size352x352 (upval), AvatarThumbnail (upval)
			if p1 and not BlockingUtilityModule:UnblockPlayerAsync(Player) then
				while PromptCreatorModule:IsCurrentlyPrompting() do
					wait()
				end
				PromptCreatorModule:CreatePrompt({
					WindowTitle = "Error Unblocking User",
					ConfirmationText = "Okay",
					Image = "",
					ImageConsoleVR = "",
					MainText = string.format("An error occurred while unblocking %s. Please try again later.", Player.Name),
					FetchImageFunction = createFetchImageFunction(Player.UserId, Size150x150, HeadShot),
					FetchImageFunctionConsoleVR = createFetchImageFunction(Player.UserId, Size352x352, AvatarThumbnail),
					StripeColor = Color3.fromRGB(183, 34, 54)
				})
			end
		end
	})
end

function PromptUnblockPlayer(Player: Player)
	-- upvalues: LocalPlayer (ref)
	if LocalPlayer.UserId < 0 then
		error("PromptUnblockPlayer can not be called for guests!")
	end
	if typeof(Player) ~= "Instance" or not Player:IsA("Player") then
		error("Invalid argument to PromptUnblockPlayer")
		
		return
	end
	if Player.UserId < 0 then
		error("PromptUnblockPlayer can not be called on guests!")
	end
	if Player == LocalPlayer then
		error("PromptUnblockPlayer: A user can not block themselves!")
	end
	DoPromptUnblockPlayer(Player)
end

function GetBlockedUserIds()
	-- upvalues: LocalPlayer (ref), BlockingUtilityModule (copy)
	if LocalPlayer.UserId < 0 then
		error("GetBlockedUserIds can not be called for guests!")
	end
	return BlockingUtilityModule:GetBlockedUserIdsAsync()
end

StarterGui:RegisterSetCore("PromptBlockPlayer", PromptBlockPlayer)
StarterGui:RegisterSetCore("PromptUnblockPlayer", PromptUnblockPlayer)
StarterGui:RegisterGetCore("GetBlockedUserIds", GetBlockedUserIds)