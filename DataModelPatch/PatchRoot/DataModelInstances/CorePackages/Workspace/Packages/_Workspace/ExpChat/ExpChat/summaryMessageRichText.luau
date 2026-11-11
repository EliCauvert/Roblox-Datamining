local TextChatService = game:GetService("TextChatService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local FoundationModule = require(Parent.Foundation)
local UIBloxModule = require(Parent.UIBlox)
local ConfigModule = require(ExpChat.Config)
local FStringExpChatSummaryPrefixTextModule = require(ExpChat.Flags.FStringExpChatSummaryPrefixText)
local FFlagExpChatPolishSummaryMessageUIModule = require(ExpChat.Flags.FFlagExpChatPolishSummaryMessageUI)

local function _(Value: number): number
	local Ceiled = math.ceil(Value)
	
	if Ceiled % 2 == 1 then
		Ceiled += 1
	end
	return (math.max(0, Ceiled))
end

local _ = function(p1: number): number
	return (math.max(0, p1 - 2))
end

local _ = function(): number
	-- upvalues: TextChatService (copy), ConfigModule (copy)
	local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")
	
	return if ChatWindowConfiguration then math.max(0, ChatWindowConfiguration.TextSize - 2) else math.max(0, ConfigModule.ChatWindowTextSize - 2)
end

return {
	getSummaryIconPrefix = function(p1: number): string
		-- upvalues: FFlagExpChatPolishSummaryMessageUIModule (copy), TextChatService (copy), ConfigModule (copy), FoundationModule (copy), FStringExpChatSummaryPrefixTextModule (copy)
		if not FFlagExpChatPolishSummaryMessageUIModule then
			return `<font weight='600' family='rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json'>{FoundationModule.Enums.IconName.Nebula}</font>{FStringExpChatSummaryPrefixTextModule}`
		end
		local Largest = nil
		if p1 then
			Largest = math.max(0, p1 - 2)
		else
			local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")
			Largest = if ChatWindowConfiguration then math.max(0, ChatWindowConfiguration.TextSize - 2) else math.max(0, ConfigModule.ChatWindowTextSize - 2)
		end
		local Ceiled = math.ceil(Largest * 3 / 4)
		
		if Ceiled % 2 == 1 then
			Ceiled += 1
		end
		return `<font weight='600' size="{math.max(0, Ceiled)}" family='rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json'>{FoundationModule.Enums.IconName.Nebula}</font>{FStringExpChatSummaryPrefixTextModule}`
	end,
	wrapInSummaryMutedStyle = function(p1, p2, p3: number): string
		-- upvalues: FFlagExpChatPolishSummaryMessageUIModule (copy), UIBloxModule (copy), TextChatService (copy), ConfigModule (copy)
		if not FFlagExpChatPolishSummaryMessageUIModule then
			return `<font color='#{p3 or "BCBEC8"}' size="{ConfigModule.ChatWindowTextSize - 2}">{p1}</font>`
		end
		local Hex = UIBloxModule.App.Style.Colors.LightGrey:ToHex()
		local Largest = nil
		
		if p3 then
			Largest = math.max(0, p3 - 2)
		else
			local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")
			Largest = if ChatWindowConfiguration then math.max(0, ChatWindowConfiguration.TextSize - 2) else math.max(0, ConfigModule.ChatWindowTextSize - 2)
		end
		return `<font color='#{Hex}' weight='600' size="{Largest}">{p1}</font>`
	end
}