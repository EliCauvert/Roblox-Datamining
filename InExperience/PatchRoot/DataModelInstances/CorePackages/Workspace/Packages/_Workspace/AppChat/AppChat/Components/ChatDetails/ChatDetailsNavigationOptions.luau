local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local domLocatorsModule = require(appChat.Utils.DomLocators)
local getFFlagAppChatEnableRootedNavigationModule = require(appChat.Flags.getFFlagAppChatEnableRootedNavigation)
local t = {
	getHeaderText = function() --[[ line: 29 ]]
		-- upvalues: getFFlagIsSquadEnabled (ref)
		return {
			shouldLocalize = true,
			raw = if getFFlagIsSquadEnabled() then "Feature.Chat.Label.Details" else "Feature.Chat.Label.ChatDetails"
		}
	end,
	getIsRooted = function(p0) --[[ line: 36 ]]
		-- upvalues: getFFlagAppChatEnableRootedNavigationModule (ref)
		return getFFlagAppChatEnableRootedNavigationModule() and (p0 and (p0.getParam and (p0.getParam("isRooted", false) or false)))
	end
}

function t.getNavigationOptions(p1, p2) --[[ line: 44 ]]
	-- upvalues: t (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), getFFlagAppChatEnableRootedNavigationModule (ref), cryoModule (ref)
	local navigation = p1 and p1.navigation
	local t_1 = {
		headerText = t.getHeaderText(),
		backButtonTestId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatDetailsTopBarActionButton("back") else nil
	}
	
	if getFFlagAppChatEnableRootedNavigationModule() then
		t_1 = cryoModule.Dictionary.join(t_1, {
			backButtonEnabled = true,
			isRoot = t.getIsRooted(navigation)
		})
	end
	return cryoModule.Dictionary.join(t_1, p2 or {})
end

function t.getTopBarConfig(p3) --[[ line: 64 ]]
	-- upvalues: t (ref), getFFlagAppChatEnableRootedNavigationModule (ref), cryoModule (ref)
	local t_1 = { backButtonEnabled = true, headerText = t.getHeaderText() }
	
	if getFFlagAppChatEnableRootedNavigationModule() then
		t_1 = cryoModule.Dictionary.join(t_1, { isRoot = t.getIsRooted(p3) })
	end
	return t_1
end

return t