local textChatService = game:GetService("TextChatService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local foundationModule = require(parent.Foundation)
local UIBloxModule = require(parent.UIBlox)
local configModule = require(expChat.Config)
local fStringExpChatSummaryPrefixTextModule = require(expChat.Flags.FStringExpChatSummaryPrefixText)
local fFlagExpChatPolishSummaryMessageUIModule = require(expChat.Flags.FFlagExpChatPolishSummaryMessageUI)

local function _(value)
	local ceiled = math.ceil(value)
	
	if ceiled % 2 == 1 then
		ceiled += 1
	end
	return math.max(0, ceiled)
end

local _ = function(p0)
	return math.max(0, p0 - 2)
end

local _ = function()
	-- upvalues: textChatService (ref), configModule (ref)
	local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
	
	return if chatWindowConfiguration then math.max(0, chatWindowConfiguration.TextSize - 2) else math.max(0, configModule.ChatWindowTextSize - 2)
end

return {
	getSummaryIconPrefix = function(p1)
		-- upvalues: fFlagExpChatPolishSummaryMessageUIModule (ref), textChatService (ref), configModule (ref), foundationModule (ref), fStringExpChatSummaryPrefixTextModule (ref)
		local maxValue
		if not fFlagExpChatPolishSummaryMessageUIModule then
			return `<font weight='600' family='rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json'>{foundationModule.Enums.IconName.Nebula}</font>{fStringExpChatSummaryPrefixTextModule}`
		elseif p1 then
			maxValue = math.max(0, p1 - 2)
		else
			local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
			maxValue = if chatWindowConfiguration then math.max(0, chatWindowConfiguration.TextSize - 2) else math.max(0, configModule.ChatWindowTextSize - 2)
		end
		local ceiled = math.ceil(maxValue * 3 / 4)
		
		if ceiled % 2 == 1 then
			ceiled += 1
		end
		return `<font weight='600' size="{math.max(0, ceiled)}" family='rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json'>{foundationModule.Enums.IconName.Nebula}</font>{fStringExpChatSummaryPrefixTextModule}`
	end,
	wrapInSummaryMutedStyle = function(p2, p3, p4)
		-- upvalues: fFlagExpChatPolishSummaryMessageUIModule (ref), UIBloxModule (ref), textChatService (ref), configModule (ref)
		if not fFlagExpChatPolishSummaryMessageUIModule then
			return `<font color='#{p3 or "BCBEC8"}' size="{configModule.ChatWindowTextSize - 2}">{p2}</font>`
		end
		local maxValue
		local var12 = UIBloxModule.App.Style.Colors.LightGrey:ToHex()
		
		if p4 then
			maxValue = math.max(0, p4 - 2)
		else
			local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
			maxValue = if chatWindowConfiguration then math.max(0, chatWindowConfiguration.TextSize - 2) else math.max(0, configModule.ChatWindowTextSize - 2)
		end
		return `<font color='#{var12}' weight='600' size="{maxValue}">{p2}</font>`
	end
}