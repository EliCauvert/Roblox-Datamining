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
	
	return function(p0)
		-- upvalues: socialUtilModule (copy), list (ref)
		spawn(function()
			-- upvalues: socialUtilModule (copy), list (copy), p0 (ref)
			local playerImage = socialUtilModule.GetPlayerImage(unpack(list))
			
			if p0 and p0.Parent then
				p0.Image = playerImage
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

function PromptBlockPlayer(p2)
	-- upvalues: localPlayer (write)
	if localPlayer.UserId < 0 then
		error("PromptBlockPlayer can not be called for guests!")
	end
	if typeof(p2) ~= "Instance" or not p2:IsA("Player") then
		error("Invalid argument to PromptBlockPlayer")
		
		return
	elseif p2.UserId < 0 then
		error("PromptBlockPlayer can not be called on guests!")
	end
	if p2 == localPlayer then
		error("PromptBlockPlayer: A user can not block themselves!")
	end
	DoPromptBlockPlayer(p2)
end

function DoPromptUnblockPlayer(p3)
	-- upvalues: blockingUtilityModule (ref), promptCreatorModule (ref), size150x150 (ref), headShot (ref), size352x352 (ref), avatarThumbnail (ref)
	local _ = not blockingUtilityModule:IsPlayerBlockedByUserId(p3.UserId)
	promptCreatorModule:CreatePrompt({
		WindowTitle = "Confirm Unblock",
		ConfirmationText = "Unblock",
		CancelText = "Cancel",
		CancelActive = true,
		Image = "",
		ImageConsoleVR = "",
		MainText = string.format("Would you like to unblock %s?", p3.Name),
		FetchImageFunction = createFetchImageFunction(p3.UserId, size150x150, headShot),
		FetchImageFunctionConsoleVR = createFetchImageFunction(p3.UserId, size352x352, avatarThumbnail),
		PromptCompletedCallback = function(p4)
			-- upvalues: blockingUtilityModule (copy), p3 (ref), promptCreatorModule (copy), size150x150 (copy), headShot (copy), size352x352 (copy), avatarThumbnail (copy)
			if p4 and not blockingUtilityModule:UnblockPlayerAsync(p3) then
				while promptCreatorModule:IsCurrentlyPrompting() do
					wait()
				end
				promptCreatorModule:CreatePrompt({
					WindowTitle = "Error Unblocking User",
					ConfirmationText = "Okay",
					Image = "",
					ImageConsoleVR = "",
					MainText = string.format("An error occurred while unblocking %s. Please try again later.", p3.Name),
					FetchImageFunction = createFetchImageFunction(p3.UserId, size150x150, headShot),
					FetchImageFunctionConsoleVR = createFetchImageFunction(p3.UserId, size352x352, avatarThumbnail),
					StripeColor = Color3.fromRGB(183, 34, 54)
				})
			end
		end
	})
end

function PromptUnblockPlayer(p5)
	-- upvalues: localPlayer (write)
	if localPlayer.UserId < 0 then
		error("PromptUnblockPlayer can not be called for guests!")
	end
	if typeof(p5) ~= "Instance" or not p5:IsA("Player") then
		error("Invalid argument to PromptUnblockPlayer")
		
		return
	elseif p5.UserId < 0 then
		error("PromptUnblockPlayer can not be called on guests!")
	end
	if p5 == localPlayer then
		error("PromptUnblockPlayer: A user can not block themselves!")
	end
	DoPromptUnblockPlayer(p5)
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