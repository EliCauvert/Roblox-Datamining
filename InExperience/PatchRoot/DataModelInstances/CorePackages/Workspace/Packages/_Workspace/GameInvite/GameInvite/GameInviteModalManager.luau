local playersService = game:GetService("Players")
local socialService = game:GetService("SocialService")
local contextActionService = game:GetService("ContextActionService")
local gameInvite = script:FindFirstAncestor("GameInvite")
local parent = gameInvite.Parent
local utils = gameInvite.utils
local _ = require(gameInvite.gameInviteModalType)
local cryoModule = require(parent.Cryo)
local gameInviteAnalyticsManagerModule = require(gameInvite.analytics.GameInviteAnalyticsManager)
local getCustomizedInvitePromptParamsModule = require(utils.getCustomizedInvitePromptParams)
local getCanSendAndCanCustomizeInvitesModule = require(utils.getCanSendAndCanCustomizeInvites)
local isTriggerDDI = require(utils.gameInviteModalHelper).isTriggerDDI
game:DefineFastFlag("GameInviteModalAnalyticsEmptyEventContextFix", false)
local fFlagGameInviteOpenModalWithoutBlockingOnCanPrompt = require(parent.SharedFlags).FFlagGameInviteOpenModalWithoutBlockingOnCanPrompt
local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref)
	return setmetatable({}, t)
end

t.ToggleGameInviteModalEvent = Instance.new("BindableEvent")
t.isModalOpen = false
t.openTrigger = nil
t.customParams = nil
t.placeId = nil
t.openSession = 0

local function openDeveloperInviteModalNonBlocking(p1, p2, p3)
	-- upvalues: contextActionService (ref), getCustomizedInvitePromptParamsModule (ref), getCanSendAndCanCustomizeInvitesModule (ref), cryoModule (ref), gameInviteAnalyticsManagerModule (ref)
	local openSession = p1.openSession
	p1.customParams = nil
	p1.ToggleGameInviteModalEvent:Fire(true, false, p2)
	contextActionService:BindCoreAction("hideGameInviteModal", function(_, p4)
		-- upvalues: p1 (ref)
		if p4 == Enum.UserInputState.Begin then
			p1:closeModal()
		end
	end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Backspace)
	task.spawn(function()
		-- upvalues: getCustomizedInvitePromptParamsModule (copy), p3 (ref), p2 (ref), getCanSendAndCanCustomizeInvitesModule (copy), p1 (ref), openSession (ref), cryoModule (copy), gameInviteAnalyticsManagerModule (copy)
		local var1 = getCustomizedInvitePromptParamsModule(p3, p2.trigger, getCanSendAndCanCustomizeInvitesModule)
		
		if not p1.isModalOpen or p1.openSession ~= openSession then return end
		p1.customParams = var1
		
		if not var1 then
			p1:closeModal()
			
			return
		end
		local var2 = var1.launchData ~= nil and var1.launchData ~= ""
		local var3 = var1.promptMessage ~= nil and var1.promptMessage ~= ""
		local var4 = var1.inviteMessageId ~= nil and var1.inviteMessageId ~= ""
		
		if var2 or var3 or var4 then
			p1.ToggleGameInviteModalEvent:Fire(true, false, cryoModule.Dictionary.join(p2, var1))
		end
		gameInviteAnalyticsManagerModule:sendGameInviteModalEvent(p2.trigger, {
			action_type = gameInviteAnalyticsManagerModule.ActionType.ModalOpen,
			is_launch_data_provided = var2,
			is_prompt_customized = var3,
			is_invite_message_id_provided = var4,
			place_id = p2.rootPlaceId
		})
	end)
end

function t:openModal(p1, p2)
	-- upvalues: fFlagGameInviteOpenModalWithoutBlockingOnCanPrompt (ref), isTriggerDDI (ref), openDeveloperInviteModalNonBlocking (ref), getCustomizedInvitePromptParamsModule (ref), getCanSendAndCanCustomizeInvitesModule (ref), cryoModule (ref), gameInviteAnalyticsManagerModule (ref), contextActionService (ref)
	if self.isModalOpen then
		if isTriggerDDI(p1.trigger) then
			self:invokeGameInvitePromptClosed()
		end
		return
	else
		self.isModalOpen = true
		
		if fFlagGameInviteOpenModalWithoutBlockingOnCanPrompt then
			self.openSession += 1
		end
		self.openTrigger = p1.trigger
		self.placeId = p1.rootPlaceId or tostring(game.PlaceId)
		
		if isTriggerDDI(p1.trigger) and fFlagGameInviteOpenModalWithoutBlockingOnCanPrompt then
			openDeveloperInviteModalNonBlocking(self, p1, p2)
			
			return
		end
		local var1 = false
		local var2 = false
		local var3 = false
		
		if isTriggerDDI(p1.trigger) then
			self.ToggleGameInviteModalEvent:Fire(true, true, p1)
			local var4 = getCustomizedInvitePromptParamsModule(p2, p1.trigger, getCanSendAndCanCustomizeInvitesModule)
			self.customParams = var4
			
			if var4 then
				var1 = var4.launchData ~= nil and var4.launchData ~= ""
				var2 = var4.promptMessage ~= nil and var4.promptMessage ~= ""
				var3 = var4.inviteMessageId ~= nil and var4.inviteMessageId ~= ""
				self.ToggleGameInviteModalEvent:Fire(true, false, cryoModule.Dictionary.join(p1, var4))
				
				if game:GetFastFlag("GameInviteModalAnalyticsEmptyEventContextFix") then
					gameInviteAnalyticsManagerModule:sendGameInviteModalEvent(p1.trigger, {
						action_type = gameInviteAnalyticsManagerModule.ActionType.ModalOpen,
						is_launch_data_provided = var1,
						is_prompt_customized = var2,
						is_invite_message_id_provided = var3,
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
				gameInviteAnalyticsManagerModule:sendGameInviteModalEvent(p1.trigger, {
					action_type = gameInviteAnalyticsManagerModule.ActionType.ModalOpen,
					is_launch_data_provided = var1,
					is_prompt_customized = var2,
					is_invite_message_id_provided = var3,
					place_id = p1.rootPlaceId
				})
			end
		end
		if not game:GetFastFlag("GameInviteModalAnalyticsEmptyEventContextFix") then
			gameInviteAnalyticsManagerModule:sendGameInviteModalEvent(p1.trigger, {
				action_type = gameInviteAnalyticsManagerModule.ActionType.ModalOpen,
				is_launch_data_provided = var1,
				is_prompt_customized = var2,
				is_invite_message_id_provided = var3,
				place_id = p1.rootPlaceId
			})
		end
		contextActionService:BindCoreAction("hideGameInviteModal", function(_, p3)
			-- upvalues: self (ref)
			if p3 == Enum.UserInputState.Begin then
				self:closeModal()
			end
		end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Backspace)
	end
end

function t:closeModal(p1)
	-- upvalues: isTriggerDDI (ref), gameInviteAnalyticsManagerModule (ref), contextActionService (ref), fFlagGameInviteOpenModalWithoutBlockingOnCanPrompt (ref)
	if self.isModalOpen then
		local var1 = false
		local var2 = false
		local var3 = false
		
		if isTriggerDDI(self.openTrigger) then
			if self.customParams then
				var1 = self.customParams.launchData ~= nil and self.customParams.launchData ~= ""
				var2 = self.customParams.promptMessage ~= nil and self.customParams.promptMessage ~= ""
				var3 = self.customParams.inviteMessageId ~= nil and self.customParams.inviteMessageId ~= ""
			end
			self:invokeGameInvitePromptClosed()
		end
		gameInviteAnalyticsManagerModule:sendGameInviteModalEvent(self.openTrigger, {
			action_type = gameInviteAnalyticsManagerModule.ActionType.ModalClose,
			is_launch_data_provided = var1,
			is_prompt_customized = var2,
			is_invite_message_id_provided = var3,
			max_recipient_row_number = p1,
			place_id = self.placeId
		})
		contextActionService:UnbindCoreAction("hideGameInviteModal")
		self.isModalOpen = false
		
		if fFlagGameInviteOpenModalWithoutBlockingOnCanPrompt then
			self.openSession += 1
		end
		self.openTrigger = nil
		self.placeId = nil
	end
	self.ToggleGameInviteModalEvent:Fire(false)
end

function t:isGameModalOpen()
	return self.isModalOpen
end

function t.invokeGameInvitePromptClosed(_)
	-- upvalues: socialService (ref), playersService (ref)
	if socialService and playersService.LocalPlayer then
		socialService:InvokeGameInvitePromptClosed(playersService.LocalPlayer, {})
	end
end

return t.new()