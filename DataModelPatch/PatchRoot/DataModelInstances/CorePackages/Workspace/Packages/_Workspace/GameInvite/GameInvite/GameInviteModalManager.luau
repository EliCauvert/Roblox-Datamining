local Players = game:GetService("Players")
local SocialService = game:GetService("SocialService")
local ContextActionService = game:GetService("ContextActionService")
local GameInvite = script:FindFirstAncestor("GameInvite")
local Utils = GameInvite.utils
local _ = require(GameInvite.gameInviteModalType)
local CryoModule = require(GameInvite.Parent.Cryo)
local GameInviteAnalyticsManagerModule = require(GameInvite.analytics.GameInviteAnalyticsManager)
local GetCustomizedInvitePromptParamsModule = require(Utils.getCustomizedInvitePromptParams)
local GetCanSendAndCanCustomizeInvitesModule = require(Utils.getCanSendAndCanCustomizeInvites)
local IsTriggerDDIFunction = require(Utils.gameInviteModalHelper).isTriggerDDI
game:DefineFastFlag("GameInviteModalAnalyticsEmptyEventContextFix", false)
local Module = {}
Module.__index = Module

function Module.new()
	-- upvalues: Module (copy)
	return (setmetatable({}, Module))
end

Module.ToggleGameInviteModalEvent = Instance.new("BindableEvent")
Module.isModalOpen = false
Module.openTrigger = nil
Module.customParams = nil
Module.placeId = nil

function Module:openModal(p1, p2)
	-- upvalues: IsTriggerDDIFunction (copy), GetCustomizedInvitePromptParamsModule (copy), GetCanSendAndCanCustomizeInvitesModule (copy), CryoModule (copy), GameInviteAnalyticsManagerModule (copy), ContextActionService (copy)
	if not self.isModalOpen then
		self.isModalOpen = true
		self.openTrigger = p1.trigger
		self.placeId = p1.rootPlaceId or tostring(game.PlaceId)
		local Is_launch_data_provided = false
		local Is_prompt_customized = false
		local Is_invite_message_id_provided = false
		
		if IsTriggerDDIFunction(p1.trigger) then
			self.ToggleGameInviteModalEvent:Fire(true, true, p1)
			local CustomizedInvitePromptParamsModule = GetCustomizedInvitePromptParamsModule(p2, p1.trigger, GetCanSendAndCanCustomizeInvitesModule)
			self.customParams = CustomizedInvitePromptParamsModule
			
			if CustomizedInvitePromptParamsModule then
				Is_launch_data_provided = CustomizedInvitePromptParamsModule.launchData ~= nil and CustomizedInvitePromptParamsModule.launchData ~= ""
				Is_prompt_customized = CustomizedInvitePromptParamsModule.promptMessage ~= nil and CustomizedInvitePromptParamsModule.promptMessage ~= ""
				Is_invite_message_id_provided = CustomizedInvitePromptParamsModule.inviteMessageId ~= nil and CustomizedInvitePromptParamsModule.inviteMessageId ~= ""
				self.ToggleGameInviteModalEvent:Fire(true, false, CryoModule.Dictionary.join(p1, CustomizedInvitePromptParamsModule))
				
				if game:GetFastFlag("GameInviteModalAnalyticsEmptyEventContextFix") then
					GameInviteAnalyticsManagerModule:sendGameInviteModalEvent(p1.trigger, {
						action_type = GameInviteAnalyticsManagerModule.ActionType.ModalOpen,
						is_launch_data_provided = Is_launch_data_provided,
						is_prompt_customized = Is_prompt_customized,
						is_invite_message_id_provided = Is_invite_message_id_provided,
						place_id = p1.rootPlaceId,
						hideCloseButton = p1.hideCloseButton
					})
				end
			else
				self:closeModal()
			end
		else
			self.ToggleGameInviteModalEvent:Fire(true, false, p1)
			
			if game:GetFastFlag("GameInviteModalAnalyticsEmptyEventContextFix") then
				GameInviteAnalyticsManagerModule:sendGameInviteModalEvent(p1.trigger, {
					action_type = GameInviteAnalyticsManagerModule.ActionType.ModalOpen,
					is_launch_data_provided = Is_launch_data_provided,
					is_prompt_customized = Is_prompt_customized,
					is_invite_message_id_provided = Is_invite_message_id_provided,
					place_id = p1.rootPlaceId
				})
			end
		end
		if not game:GetFastFlag("GameInviteModalAnalyticsEmptyEventContextFix") then
			GameInviteAnalyticsManagerModule:sendGameInviteModalEvent(p1.trigger, {
				action_type = GameInviteAnalyticsManagerModule.ActionType.ModalOpen,
				is_launch_data_provided = Is_launch_data_provided,
				is_prompt_customized = Is_prompt_customized,
				is_invite_message_id_provided = Is_invite_message_id_provided,
				place_id = p1.rootPlaceId
			})
		end
		ContextActionService:BindCoreAction("hideGameInviteModal", function(_, UserInputState)
			-- upvalues: self (copy)
			if UserInputState == Enum.UserInputState.Begin then
				self:closeModal()
			end
		end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Backspace)
		
		return
	elseif IsTriggerDDIFunction(p1.trigger) then
		self:invokeGameInvitePromptClosed()
	end
end

function Module:closeModal(Max_recipient_row_number)
	-- upvalues: IsTriggerDDIFunction (copy), GameInviteAnalyticsManagerModule (copy), ContextActionService (copy)
	if self.isModalOpen then
		local IsNotLaunchDataMatch = false
		local IsNotPromptMessageMatch = false
		local IsNotInviteMessageIdMatch = false
		
		if IsTriggerDDIFunction(self.openTrigger) then
			if self.customParams then
				IsNotLaunchDataMatch = self.customParams.launchData ~= nil and self.customParams.launchData ~= ""
				IsNotPromptMessageMatch = self.customParams.promptMessage ~= nil and self.customParams.promptMessage ~= ""
				IsNotInviteMessageIdMatch = self.customParams.inviteMessageId ~= nil and self.customParams.inviteMessageId ~= ""
			end
			self:invokeGameInvitePromptClosed()
		end
		GameInviteAnalyticsManagerModule:sendGameInviteModalEvent(self.openTrigger, {
			action_type = GameInviteAnalyticsManagerModule.ActionType.ModalClose,
			is_launch_data_provided = IsNotLaunchDataMatch,
			is_prompt_customized = IsNotPromptMessageMatch,
			is_invite_message_id_provided = IsNotInviteMessageIdMatch,
			max_recipient_row_number = Max_recipient_row_number,
			place_id = self.placeId
		})
		ContextActionService:UnbindCoreAction("hideGameInviteModal")
		self.isModalOpen = false
		self.openTrigger = nil
		self.placeId = nil
	end
	self.ToggleGameInviteModalEvent:Fire(false)
end

function Module:isGameModalOpen()
	return self.isModalOpen
end

function Module:invokeGameInvitePromptClosed()
	-- upvalues: SocialService (copy), Players (copy)
	if SocialService and Players.LocalPlayer then
		SocialService:InvokeGameInvitePromptClosed(Players.LocalPlayer, {})
	end
end

return Module.new()