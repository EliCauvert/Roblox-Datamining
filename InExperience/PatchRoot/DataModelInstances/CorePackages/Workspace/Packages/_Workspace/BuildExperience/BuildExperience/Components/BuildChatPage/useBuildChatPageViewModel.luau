local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local _ = require(parent.DataHydration.CreatorAgentChat)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(buildExperience.Chat.chatTypes)
local useChatPlaytestFooterModule = require(buildExperience.Chat.useChatPlaytestFooter)
local useChatSessionCoreModule = require(buildExperience.Chat.useChatSessionCore)
local getBuildOverflowMenuStoreModule = require(buildExperience.Stores.GetBuildOverflowMenuStore)
local getCreatorAgentResumeStoreModule = require(buildExperience.Stores.GetCreatorAgentResumeStore)
local _ = require(script.Parent.BuildChatPageView)
local useTokens = foundationModule.Hooks.useTokens

local function _() --[[ line: 34 | named "getKeyboardTop" ]]
	-- upvalues: userInputService (ref), guiService (ref)
	return if userInputService.OnScreenKeyboardVisible then math.max(0, userInputService.OnScreenKeyboardPosition.Y - guiService:GetGuiInset().Y) else 0
end

return function(p0) --[[ line: 42 | named "useBuildChatPageViewModel" ]]
	-- upvalues: useTokens (ref), getBuildOverflowMenuStoreModule (ref), getCreatorAgentResumeStoreModule (ref), reactModule (ref), userInputService (ref), guiService (ref), useChatSessionCoreModule (ref), useChatPlaytestFooterModule (ref)
	local var9 = useTokens()
	local var10 = getBuildOverflowMenuStoreModule()
	local var11 = getCreatorAgentResumeStoreModule()
	local var12, var13 = reactModule.useState(nil)
	local var14, var15 = reactModule.useState(if not userInputService.OnScreenKeyboardVisible then 0 else math.max(0, userInputService.OnScreenKeyboardPosition.Y - guiService:GetGuiInset().Y))
	local var16, var17 = reactModule.useState(0)
	local var18 = reactModule.useCallback(function() --[[ line: 51 ]]
		-- upvalues: var15 (ref), userInputService (copy), guiService (copy)
		var15(if not userInputService.OnScreenKeyboardVisible then 0 else math.max(0, userInputService.OnScreenKeyboardPosition.Y - guiService:GetGuiInset().Y))
	end, {})
	reactModule.useEffect(function() --[[ line: 55 ]]
		-- upvalues: var18 (ref), userInputService (copy)
		var18()
		local var27 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(var18)
		local var28 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardSize"):Connect(var18)
		local var29 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(var18)
		
		return function() --[[ line: 63 ]]
			-- upvalues: var27 (ref), var28 (ref), var29 (ref)
			var27:Disconnect()
			var28:Disconnect()
			var29:Disconnect()
		end
	end, { var18 })
	local var19 = reactModule.useCallback(function(p1) --[[ line: 70 ]]
		-- upvalues: var17 (ref)
		var17(p1.AbsolutePosition.Y + p1.AbsoluteSize.Y)
	end, {})
	local var20 = if var14 <= 0 or var16 <= 0 then 0 else math.max(0, var16 - var14)
	local var21 = useChatSessionCoreModule({
		autoFocusComposer = false,
		universeId = p0.target.universeId,
		placeId = p0.target.placeId,
		sessionId = p0.target.sessionId
	})
	local var22 = useChatPlaytestFooterModule(var21, "BuildChatPlaytestCta")
	local subagentTaskState = var21.subagentTaskState
	local var23 = subagentTaskState ~= nil and #subagentTaskState.groups > 0
	local var24 = p0.target.isNewGameTarget == true
	local var25 = #var21.messages == 0
	reactModule.useEffect(function() --[[ line: 88 ]]
		-- upvalues: var11 (ref), p0 (ref)
		var11.setActiveTarget({
			universeId = p0.target.universeId,
			sessionId = p0.target.sessionId
		})
		
		return function() --[[ line: 93 ]]
			-- upvalues: var11 (copy)
			var11.setActiveTarget(nil)
		end
	end, { var11, p0.target.universeId, p0.target.sessionId })
	local var26 = reactModule.useCallback(function() --[[ line: 98 ]]
		-- upvalues: var21 (ref)
		if var21.textBoxRef.current then
			var21.textBoxRef.current.releaseFocus()
		end
	end, { var21.textBoxRef })
	
	return {
		target = p0.target,
		keyboardOverlap = var20,
		onPageMetricsChanged = var19,
		selectedChipGroupName = var12,
		onChipActivated = reactModule.useCallback(function(p2) --[[ line: 132 ]]
			-- upvalues: var26 (ref), var13 (ref)
			var26()
			var13(p2)
		end, { var26 }),
		onChipBottomSheetClose = function() --[[ line: 143 ]]
			-- upvalues: var13 (ref)
			var13(nil)
		end,
		onClose = reactModule.useCallback(function() --[[ line: 104 ]]
			-- upvalues: var26 (ref), p0 (ref)
			var26()
			p0.onClose()
		end, { var26, p0.onClose }),
		onOverflowMenuAction = reactModule.useCallback(function(p3) --[[ line: 109 ]]
			-- upvalues: var26 (ref), p0 (ref)
			if p3.type == "openPage" then
				var26()
				
				if p0.onOpenConfigurationPage then
					p0.onOpenConfigurationPage(p3.page)
				end
			end
		end, { var26, p0.onOpenConfigurationPage }),
		onPlayActivated = reactModule.useCallback(function() --[[ line: 118 ]]
			-- upvalues: var21 (ref)
			if var21.launchPlaytest then
				var21.launchPlaytest("BuildChatPage")
			end
		end, { var21.launchPlaytest }),
		onOpenAgentsPage = reactModule.useCallback(function() --[[ line: 124 ]]
			-- upvalues: subagentTaskState (ref), var26 (ref), p0 (ref)
			if subagentTaskState == nil then
				return
			end
			var26()
			p0.onOpenAgentsPage(subagentTaskState)
		end, { var26, p0.onOpenAgentsPage, subagentTaskState }),
		buildOverflowMenuStore = var10,
		messages = var21.messages,
		clockBinding = var21.clockBinding,
		onPlaytest = var22.onPlaytest,
		isPlaytestLoading = var22.isPlaytestLoading,
		isChatEmpty = var25,
		isNewGameTarget = var24,
		hasPublishedTurn = var21.hasPublishedTurn,
		hasTaskGroups = var23,
		taskState = subagentTaskState,
		scrollingFrameRef = var21.setScrollingFrame,
		composerText = var21.composerText,
		composerErrorText = var21.composerErrorText,
		onComposerChanged = var21.setComposerText,
		textBoxRef = var21.textBoxRef,
		isAssistantResponding = var21.isAssistantResponding,
		onSend = var21.sendMessage,
		onStop = var21.stopAssistantResponse,
		paddingLeft = var9.Padding.Medium,
		paddingRight = var9.Padding.Medium,
		paddingBottom = var9.Padding.Small + var20
	}
end