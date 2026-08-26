local starterGuiService = game:GetService("StarterGui")
local playersService = game:GetService("Players")
local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui").RobloxGui
local localPlayer = playersService.LocalPlayer
while localPlayer == nil do
	playersService.ChildAdded:wait()
	localPlayer = playersService.LocalPlayer
end
local modules = robloxGui.Modules
local promptCreatorModule = require(modules.PromptCreator)
local socialUtilModule = require(modules.SocialUtil)
local blockingUtilityModule = require(corePackagesService.Workspace.Packages.BlockingUtility)
local onBlockButtonActivatedModule = require(modules.Settings.onBlockButtonActivated)
local size150x150 = Enum.ThumbnailSize.Size150x150
local size352x352 = Enum.ThumbnailSize.Size352x352
local headShot = Enum.ThumbnailType.HeadShot
local avatarThumbnail = Enum.ThumbnailType.AvatarThumbnail

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

function DoPromptBlockPlayer(p1)
	-- upvalues: blockingUtilityModule (ref), onBlockButtonActivatedModule (ref)
	if blockingUtilityModule:IsPlayerBlockedByUserId(p1.UserId) then
		return
	end
	onBlockButtonActivatedModule(p1)
end

function PromptBlockPlayer(p1)
	-- upvalues: localPlayer (write)
	if localPlayer.UserId < 0 then
		error("PromptBlockPlayer can not be called for guests!")
	end
	if typeof(p1) ~= "Instance" or not p1:IsA("Player") then
		error("Invalid argument to PromptBlockPlayer")
		
		return
	elseif p1.UserId < 0 then
		error("PromptBlockPlayer can not be called on guests!")
	end
	if p1 == localPlayer then
		error("PromptBlockPlayer: A user can not block themselves!")
	end
	DoPromptBlockPlayer(p1)
end

function DoPromptUnblockPlayer(p1)
	-- upvalues: blockingUtilityModule (ref), promptCreatorModule (ref), size150x150 (ref), headShot (ref), size352x352 (ref), avatarThumbnail (ref)
	local _ = not blockingUtilityModule:IsPlayerBlockedByUserId(p1.UserId)
	promptCreatorModule:CreatePrompt({
		WindowTitle = "Confirm Unblock",
		ConfirmationText = "Unblock",
		CancelText = "Cancel",
		CancelActive = true,
		Image = "",
		ImageConsoleVR = "",
		MainText = string.format("Would you like to unblock %s?", p1.Name),
		FetchImageFunction = createFetchImageFunction(p1.UserId, size150x150, headShot),
		FetchImageFunctionConsoleVR = createFetchImageFunction(p1.UserId, size352x352, avatarThumbnail),
		PromptCompletedCallback = function(p2)
			-- upvalues: blockingUtilityModule (copy), p1 (ref), promptCreatorModule (copy), size150x150 (copy), headShot (copy), size352x352 (copy), avatarThumbnail (copy)
			if p2 and not blockingUtilityModule:UnblockPlayerAsync(p1) then
				while promptCreatorModule:IsCurrentlyPrompting() do
					wait()
				end
				promptCreatorModule:CreatePrompt({
					WindowTitle = "Error Unblocking User",
					ConfirmationText = "Okay",
					Image = "",
					ImageConsoleVR = "",
					MainText = string.format("An error occurred while unblocking %s. Please try again later.", p1.Name),
					FetchImageFunction = createFetchImageFunction(p1.UserId, size150x150, headShot),
					FetchImageFunctionConsoleVR = createFetchImageFunction(p1.UserId, size352x352, avatarThumbnail),
					StripeColor = Color3.fromRGB(183, 34, 54)
				})
			end
		end
	})
end

function PromptUnblockPlayer(p2)
	-- upvalues: localPlayer (write)
	if localPlayer.UserId < 0 then
		error("PromptUnblockPlayer can not be called for guests!")
	end
	if typeof(p2) ~= "Instance" or not p2:IsA("Player") then
		error("Invalid argument to PromptUnblockPlayer")
		
		return
	elseif p2.UserId < 0 then
		error("PromptUnblockPlayer can not be called on guests!")
	end
	if p2 == localPlayer then
		error("PromptUnblockPlayer: A user can not block themselves!")
	end
	DoPromptUnblockPlayer(p2)
end

function GetBlockedUserIds()
	-- upvalues: localPlayer (write), blockingUtilityModule (ref)
	if localPlayer.UserId < 0 then
		error("GetBlockedUserIds can not be called for guests!")
	end
	return blockingUtilityModule:GetBlockedUserIdsAsync()
end

starterGuiService:RegisterSetCore("PromptBlockPlayer", PromptBlockPlayer)
starterGuiService:RegisterSetCore("PromptUnblockPlayer", PromptUnblockPlayer)
starterGuiService:RegisterGetCore("GetBlockedUserIds", GetBlockedUserIds)