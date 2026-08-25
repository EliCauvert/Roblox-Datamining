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

local function openDeveloperInviteModalNonBlocking(p0, p1, p2)
	-- upvalues: contextActionService (ref), getCustomizedInvitePromptParamsModule (ref), getCanSendAndCanCustomizeInvitesModule (ref), cryoModule (ref), gameInviteAnalyticsManagerModule (ref)
	local openSession = p0.openSession
	p0.customParams = nil
	p0.ToggleGameInviteModalEvent:Fire(true, false, p1)
	contextActionService:BindCoreAction("hideGameInviteModal", function(_, p3)
		-- upvalues: p0 (ref)
		if p3 == Enum.UserInputState.Begin then
			p0:closeModal()
		end
	end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Backspace)
	task.spawn(function()
		-- upvalues: getCustomizedInvitePromptParamsModule (copy), p2 (ref), p1 (ref), getCanSendAndCanCustomizeInvitesModule (copy), p0 (ref), openSession (ref), cryoModule (copy), gameInviteAnalyticsManagerModule (copy)
		local var10 = getCustomizedInvitePromptParamsModule(p2, p1.trigger, getCanSendAndCanCustomizeInvitesModule)
		
		if not p0.isModalOpen or p0.openSession ~= openSession then return end
		p0.customParams = var10
		
		if not var10 then
			p0:closeModal()
			
			return
		end
		local var11 = var10.launchData ~= nil and var10.launchData ~= ""
		local var12 = var10.promptMessage ~= nil and var10.promptMessage ~= ""
		local var13 = var10.inviteMessageId ~= nil and var10.inviteMessageId ~= ""
		
		if var11 or var12 or var13 then
			p0.ToggleGameInviteModalEvent:Fire(true, false, cryoModule.Dictionary.join(p1, var10))
		end
		gameInviteAnalyticsManagerModule:sendGameInviteModalEvent(p1.trigger, {
			action_type = gameInviteAnalyticsManagerModule.ActionType.ModalOpen,
			is_launch_data_provided = var11,
			is_prompt_customized = var12,
			is_invite_message_id_provided = var13,
			place_id = p1.rootPlaceId
		})
	end)
end

function t:openModal(p4, p5)
	-- upvalues: fFlagGameInviteOpenModalWithoutBlockingOnCanPrompt (ref), isTriggerDDI (ref), openDeveloperInviteModalNonBlocking (ref), getCustomizedInvitePromptParamsModule (ref), getCanSendAndCanCustomizeInvitesModule (ref), cryoModule (ref), gameInviteAnalyticsManagerModule (ref), contextActionService (ref)
	if self.isModalOpen then
		if isTriggerDDI(p4.trigger) then
			self:invokeGameInvitePromptClosed()
		end
		return
	else
		self.isModalOpen = true
		
		if fFlagGameInviteOpenModalWithoutBlockingOnCanPrompt then
			self.openSession += 1
		end
		self.openTrigger = p4.trigger
		self.placeId = p4.rootPlaceId or tostring(game.PlaceId)
		
		if isTriggerDDI(p4.trigger) and fFlagGameInviteOpenModalWithoutBlockingOnCanPrompt then
			openDeveloperInviteModalNonBlocking(self, p4, p5)
			
			return
		end
		local var14 = false
		local var15 = false
		local var16 = false
		
		if isTriggerDDI(p4.trigger) then
			self.ToggleGameInviteModalEvent:Fire(true, true, p4)
			local var17 = getCustomizedInvitePromptParamsModule(p5, p4.trigger, getCanSendAndCanCustomizeInvitesModule)
			self.customParams = var17
			
			if var17 then
				var14 = var17.launchData ~= nil and var17.launchData ~= ""
				var15 = var17.promptMessage ~= nil and var17.promptMessage ~= ""
				var16 = var17.inviteMessageId ~= nil and var17.inviteMessageId ~= ""
				self.ToggleGameInviteModalEvent:Fire(true, false, cryoModule.Dictionary.join(p4, var17))
				
				if game:GetFastFlag("GameInviteModalAnalyticsEmptyEventContextFix") then
					gameInviteAnalyticsManagerModule:sendGameInviteModalEvent(p4.trigger, {
						action_type = gameInviteAnalyticsManagerModule.ActionType.ModalOpen,
						is_launch_data_provided = var14,
						is_prompt_customized = var15,
						is_invite_message_id_provided = var16,
						place_id = p4.rootPlaceId,
						hideCloseButton = p4.hideCloseButton
					})
				end
			else
				self:closeModal()
			end
		else
			self.ToggleGameInviteModalEvent:Fire(true, false, p4)
			
			if game:GetFastFlag("GameInviteModalAnalyticsEmptyEventContextFix") then
				gameInviteAnalyticsManagerModule:sendGameInviteModalEvent(p4.trigger, {
					action_type = gameInviteAnalyticsManagerModule.ActionType.ModalOpen,
					is_launch_data_provided = var14,
					is_prompt_customized = var15,
					is_invite_message_id_provided = var16,
					place_id = p4.rootPlaceId
				})
			end
		end
		if not game:GetFastFlag("GameInviteModalAnalyticsEmptyEventContextFix") then
			gameInviteAnalyticsManagerModule:sendGameInviteModalEvent(p4.trigger, {
				action_type = gameInviteAnalyticsManagerModule.ActionType.ModalOpen,
				is_launch_data_provided = var14,
				is_prompt_customized = var15,
				is_invite_message_id_provided = var16,
				place_id = p4.rootPlaceId
			})
		end
		contextActionService:BindCoreAction("hideGameInviteModal", function(_, p6)
			-- upvalues: self (ref)
			if p6 == Enum.UserInputState.Begin then
				self:closeModal()
			end
		end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Backspace)
	end
end

function t:closeModal(p7)
	-- upvalues: isTriggerDDI (ref), gameInviteAnalyticsManagerModule (ref), contextActionService (ref), fFlagGameInviteOpenModalWithoutBlockingOnCanPrompt (ref)
	if self.isModalOpen then
		local var18 = false
		local var19 = false
		local var20 = false
		
		if isTriggerDDI(self.openTrigger) then
			if self.customParams then
				var18 = self.customParams.launchData ~= nil and self.customParams.launchData ~= ""
				var19 = self.customParams.promptMessage ~= nil and self.customParams.promptMessage ~= ""
				var20 = self.customParams.inviteMessageId ~= nil and self.customParams.inviteMessageId ~= ""
			end
			self:invokeGameInvitePromptClosed()
		end
		gameInviteAnalyticsManagerModule:sendGameInviteModalEvent(self.openTrigger, {
			action_type = gameInviteAnalyticsManagerModule.ActionType.ModalClose,
			is_launch_data_provided = var18,
			is_prompt_customized = var19,
			is_invite_message_id_provided = var20,
			max_recipient_row_number = p7,
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