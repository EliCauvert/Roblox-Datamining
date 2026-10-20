local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local Players = game:GetService("Players")
local UserService = game:GetService("UserService")
local GetMessageTextFunction = require(game:GetService("CorePackages").Workspace.Packages.ChatLineReporting).Helpers.getMessageText
local ConstantsModule = require(AbuseReportMenu.Components.Constants)
local _ = require(AbuseReportMenu.Components.Types)

return {
	componentType = "chatModalSelector",
	fieldLabel = "WhichChat",
	componentName = "ChatSelector",
	getIsVisible = function(p1): boolean
		-- upvalues: ConstantsModule (copy)
		return p1.methodOfAbuse == ConstantsModule.AbuseMethods.TextChat
	end,
	getSelectedValue = function(p1)
		-- upvalues: GetMessageTextFunction (copy)
		return p1.selectedMessage and GetMessageTextFunction(p1.selectedMessage.useTranslation, p1.selectedMessage.translation, p1.selectedMessage.text) or nil
	end,
	onUpdateSelectedOption = function(SelectedMessage, OrderedMessages, p1, Callback: (any) -> (), p2)
		-- upvalues: ConstantsModule (copy), Players (copy), UserService (copy)
		p2.analyticsDispatch({
			type = ConstantsModule.AnalyticsActions.IncrementChatLineChanged
		})
		Callback({
			type = ConstantsModule.PlayerMenuActions.UpdatedSelectedChatAndOrderedMessages,
			orderedMessages = OrderedMessages,
			selectedMessage = SelectedMessage
		})
		
		if p1.allegedAbuserId ~= nil then
			if SelectedMessage == nil or SelectedMessage.userId == nil then
				Callback({
					abuseId = nil,
					abuser = nil,
					type = ConstantsModule.PlayerMenuActions.UpdateAbuser
				})
				
				return
			end
			local Number: number? = tonumber(SelectedMessage.userId)
			
			if Number ~= nil then
				task.defer(function()
					-- upvalues: Players (upval), Number (copy), UserService (upval), Callback (copy), ConstantsModule (upval), SelectedMessage (copy)
					local Player = Players:GetPlayerByUserId(Number)
					
					if Player == nil then
						local Success, Result = pcall(function()
							-- upvalues: UserService (upval), Number (upval)
							return UserService:GetUserInfosByUserIdsAsync({ Number })
						end)
						
						if Success and Result and Result[1] then
							Player = {
								Name = Result[1].Username,
								DisplayName = Result[1].DisplayName
							}
						end
					end
					if Player ~= nil then
						Callback({
							type = ConstantsModule.PlayerMenuActions.UpdateAbuser,
							abuseId = SelectedMessage.userId,
							abuser = Player
						})
					end
				end)
			end
		end
	end
}