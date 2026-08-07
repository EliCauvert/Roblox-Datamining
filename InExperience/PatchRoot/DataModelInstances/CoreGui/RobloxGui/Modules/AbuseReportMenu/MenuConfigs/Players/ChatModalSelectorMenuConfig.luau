local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local userService = game:GetService("UserService")
local getMessageText = require(corePackagesService.Workspace.Packages.ChatLineReporting).Helpers.getMessageText
local constantsModule = require(abuseReportMenu.Components.Constants)
local _ = require(abuseReportMenu.Components.Types)

return {
	componentType = "chatModalSelector",
	fieldLabel = "WhichChat",
	componentName = "ChatSelector",
	getIsVisible = function(p0) --[[ line: 19 ]]
		-- upvalues: constantsModule (ref)
		return p0.methodOfAbuse == constantsModule.AbuseMethods.TextChat
	end,
	getSelectedValue = function(p1) --[[ line: 27 ]]
		-- upvalues: getMessageText (ref)
		return p1.selectedMessage and getMessageText(p1.selectedMessage.useTranslation, p1.selectedMessage.translation, p1.selectedMessage.text) or nil
	end,
	onUpdateSelectedOption = function(p2, p3, p4, p5, p6) --[[ line: 42 ]]
		-- upvalues: constantsModule (ref), playersService (ref), userService (ref)
		p6.analyticsDispatch({
			type = constantsModule.AnalyticsActions.IncrementChatLineChanged
		})
		p5({
			type = constantsModule.PlayerMenuActions.UpdatedSelectedChatAndOrderedMessages,
			orderedMessages = p3,
			selectedMessage = p2
		})
		
		if p4.allegedAbuserId ~= nil then
			if p2 == nil or p2.userId == nil then
				p5({
					abuseId = nil,
					abuser = nil,
					type = constantsModule.PlayerMenuActions.UpdateAbuser
				})
				
				return
			end
			local var5 = tonumber(p2.userId)
			
			if var5 ~= nil then
				task.defer(function() --[[ line: 73 ]]
					-- upvalues: playersService (copy), var5 (ref), userService (copy), p5 (ref), constantsModule (copy), p2 (ref)
					local var6 = playersService:GetPlayerByUserId(var5)
					
					if var6 == nil then
						local _ = false
						local _ = nil
						local ok, status = pcall(function() --[[ line: 80 ]]
							-- upvalues: userService (copy), var5 (copy)
							return userService:GetUserInfosByUserIdsAsync({ var5 })
						end)
						local var7 = status
						
						if ok and var7 and var7[1] then
							var6 = {
								Name = var7[1].Username,
								DisplayName = var7[1].DisplayName
							}
						end
					end
					if var6 ~= nil then
						p5({
							type = constantsModule.PlayerMenuActions.UpdateAbuser,
							abuseId = p2.userId,
							abuser = var6
						})
					end
				end)
			end
		end
	end
}