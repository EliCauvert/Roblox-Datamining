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
local t = {}
t.__index = t

function t.new() --[[ line: 23 ]]
	-- upvalues: t (ref)
	return setmetatable({}, t)
end

t.ToggleGameInviteModalEvent = Instance.new("BindableEvent")
t.isModalOpen = false
t.openTrigger = nil
t.customParams = nil
t.placeId = nil

function t:openModal(p0, p1) --[[ line: 37 ]]
	-- upvalues: isTriggerDDI (ref), getCustomizedInvitePromptParamsModule (ref), getCanSendAndCanCustomizeInvitesModule (ref), cryoModule (ref), gameInviteAnalyticsManagerModule (ref), contextActionService (ref)
	if self.isModalOpen then
		if isTriggerDDI(p0.trigger) then
			self:invokeGameInvitePromptClosed()
		end
		return
	else
		self.isModalOpen = true
		self.openTrigger = p0.trigger
		self.placeId = p0.rootPlaceId or tostring(game.PlaceId)
		local var9 = false
		local var10 = false
		local var11 = false
		
		if isTriggerDDI(p0.trigger) then
			self.ToggleGameInviteModalEvent:Fire(true, true, p0)
			local var12 = getCustomizedInvitePromptParamsModule(p1, p0.trigger, getCanSendAndCanCustomizeInvitesModule)
			self.customParams = var12
			
			if var12 then
				var9 = var12.launchData ~= nil and var12.launchData ~= ""
				var10 = var12.promptMessage ~= nil and var12.promptMessage ~= ""
				var11 = var12.inviteMessageId ~= nil and var12.inviteMessageId ~= ""
				self.ToggleGameInviteModalEvent:Fire(true, false, cryoModule.Dictionary.join(p0, var12))
				
				if game:GetFastFlag("GameInviteModalAnalyticsEmptyEventContextFix") then
					gameInviteAnalyticsManagerModule:sendGameInviteModalEvent(p0.trigger, {
						action_type = gameInviteAnalyticsManagerModule.ActionType.ModalOpen,
						is_launch_data_provided = var9,
						is_prompt_customized = var10,
						is_invite_message_id_provided = var11,
						place_id = p0.rootPlaceId,
						hideCloseButton = p0.hideCloseButton
					})
				end
			else
				self:closeModal()
			end
		else
			self.ToggleGameInviteModalEvent:Fire(true, false, p0)
			
			if game:GetFastFlag("GameInviteModalAnalyticsEmptyEventContextFix") then
				gameInviteAnalyticsManagerModule:sendGameInviteModalEvent(p0.trigger, {
					action_type = gameInviteAnalyticsManagerModule.ActionType.ModalOpen,
					is_launch_data_provided = var9,
					is_prompt_customized = var10,
					is_invite_message_id_provided = var11,
					place_id = p0.rootPlaceId
				})
			end
		end
		if not game:GetFastFlag("GameInviteModalAnalyticsEmptyEventContextFix") then
			gameInviteAnalyticsManagerModule:sendGameInviteModalEvent(p0.trigger, {
				action_type = gameInviteAnalyticsManagerModule.ActionType.ModalOpen,
				is_launch_data_provided = var9,
				is_prompt_customized = var10,
				is_invite_message_id_provided = var11,
				place_id = p0.rootPlaceId
			})
		end
		contextActionService:BindCoreAction("hideGameInviteModal", function(_, p2) --[[ line: 96 ]]
			-- upvalues: self (ref)
			if p2 == Enum.UserInputState.Begin then
				self:closeModal()
			end
		end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Backspace)
	end
end

function t:closeModal(p3) --[[ line: 109 ]]
	-- upvalues: isTriggerDDI (ref), gameInviteAnalyticsManagerModule (ref), contextActionService (ref)
	if self.isModalOpen then
		local var13 = false
		local var14 = false
		local var15 = false
		
		if isTriggerDDI(self.openTrigger) then
			if self.customParams then
				var13 = self.customParams.launchData ~= nil and self.customParams.launchData ~= ""
				var14 = self.customParams.promptMessage ~= nil and self.customParams.promptMessage ~= ""
				var15 = self.customParams.inviteMessageId ~= nil and self.customParams.inviteMessageId ~= ""
			end
			self:invokeGameInvitePromptClosed()
		end
		gameInviteAnalyticsManagerModule:sendGameInviteModalEvent(self.openTrigger, {
			action_type = gameInviteAnalyticsManagerModule.ActionType.ModalClose,
			is_launch_data_provided = var13,
			is_prompt_customized = var14,
			is_invite_message_id_provided = var15,
			max_recipient_row_number = p3,
			place_id = self.placeId
		})
		contextActionService:UnbindCoreAction("hideGameInviteModal")
		self.isModalOpen = false
		self.openTrigger = nil
		self.placeId = nil
	end
	self.ToggleGameInviteModalEvent:Fire(false)
end

function t:isGameModalOpen() --[[ line: 143 ]]
	return self.isModalOpen
end

function t.invokeGameInvitePromptClosed(_) --[[ line: 147 ]]
	-- upvalues: socialService (ref), playersService (ref)
	if socialService and playersService.LocalPlayer then
		socialService:InvokeGameInvitePromptClosed(playersService.LocalPlayer, {})
	end
end

return t.new()