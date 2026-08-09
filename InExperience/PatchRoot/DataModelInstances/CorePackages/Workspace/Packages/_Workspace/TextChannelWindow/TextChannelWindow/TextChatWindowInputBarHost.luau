local parent = script.Parent.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local chatUIPrimitivesModule = require(parent.ChatUIPrimitives)
local getTargetTextChannelDisplayNameModule = require(script.Parent.getTargetTextChannelDisplayName)
local useInExperienceLocalizationModule = require(script.Parent.useInExperienceLocalization)
local useCanSendToChannel = require(script.Parent.useCanSendToChannel).useCanSendToChannel
local loggerModule = require(script.Parent.Logger)
local getFFlagExpChatProtectedChatInternalAPIs = require(parent.SharedFlags).getFFlagExpChatProtectedChatInternalAPIs
local chatInputBarView = chatUIPrimitivesModule.ChatInputBarView

return function(p0) --[[ line: 24 | named "TextChatWindowInputBarHost" ]]
	-- upvalues: foundationModule (ref), reactModule (ref), getTargetTextChannelDisplayNameModule (ref), useCanSendToChannel (ref), useInExperienceLocalizationModule (ref), getFFlagExpChatProtectedChatInternalAPIs (ref), loggerModule (ref), chatInputBarView (ref)
	local targetChannel = p0.targetChannel
	local var6 = foundationModule.Hooks.useTokens()
	local var7 = reactModule.useMemo(function() --[[ line: 28 ]]
		-- upvalues: getTargetTextChannelDisplayNameModule (copy), targetChannel (ref)
		return getTargetTextChannelDisplayNameModule(targetChannel)
	end, { targetChannel })
	local var8 = useCanSendToChannel(targetChannel, p0.localUserId)
	local var9 = useInExperienceLocalizationModule()
	local var10 = reactModule.useMemo(function() --[[ line: 35 ]]
		-- upvalues: var9 (ref)
		return {
			placeholder = var9("CoreScripts.TextChat.InputBar.Hint.Touch"),
			disabled = var9("CoreScripts.TextChat.InputBar.Hint.PrivacySettingsDisabled"),
			viewOnly = var9("CoreScripts.TextChat.ChatWindow.ChatDisabled.OnlyViewSystemMessages")
		}
	end, { var9 })
	local var11 = p0.canLocalUserChat ~= nil or p0.canLocalUserChat
	
	return reactModule.createElement(chatInputBarView, {
		maximumCharacterLimit = 200,
		onSend = reactModule.useCallback(function(p1) --[[ line: 43 ]]
			-- upvalues: var8 (ref), targetChannel (ref), getFFlagExpChatProtectedChatInternalAPIs (copy), loggerModule (copy)
			if not var8 then return end
			if targetChannel and p1 ~= "" then
				task.spawn(function() --[[ line: 48 ]]
					-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (copy), targetChannel (copy), p1 (ref), loggerModule (copy)
					local ok, status = pcall(function() --[[ line: 49 ]]
						-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (copy), targetChannel (copy), p1 (copy)
						if getFFlagExpChatProtectedChatInternalAPIs() then
							targetChannel:SendInternalAsync(p1)
							
							return
						end
						targetChannel:SendAsync(p1)
					end)
					
					if not ok then
						loggerModule:warning("SendAsync failed: {}", status)
					end
				end)
			end
		end, { targetChannel, var8 }),
		canLocalUserChat = var11 and var8,
		textSize = var6.Typography.CaptionMedium.FontSize,
		placeholderText = var10.placeholder,
		disabledChatPlaceholderText = if var11 and not var8 then var10.viewOnly else var10.disabled,
		sideChipText = var7
	})
end