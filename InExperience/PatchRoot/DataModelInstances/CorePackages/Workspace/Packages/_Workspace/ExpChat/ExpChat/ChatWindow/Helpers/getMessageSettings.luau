local ExpChat = script:FindFirstAncestor("ExpChat")
local ConfigModule = require(ExpChat.Config)
local FFlagEnableInExpChatRewriteModule = require(ExpChat.Flags.FFlagEnableInExpChatRewrite)
local FFlagExpChatGlobalTabDefaultModule = require(ExpChat.Flags.FFlagExpChatGlobalTabDefault)
local FormatGlobalChatPrefixModule = require(ExpChat.formatGlobalChatPrefix)

local function _(p1): boolean
	return p1 == nil or p1 == ""
end

return (require(ExpChat.memoize)(function(p1, p2, p3)
	-- upvalues: FFlagExpChatGlobalTabDefaultModule (copy), FormatGlobalChatPrefixModule (copy), FFlagEnableInExpChatRewriteModule (copy), ConfigModule (copy)
	local config = {
		text = p1.text or "",
		prefixText = if FFlagExpChatGlobalTabDefaultModule then FormatGlobalChatPrefixModule(p1.prefixText or "", p1, p3) else p1.prefixText or "",
		translation = p1.translation or "",
		useTranslation = p1.useTranslation,
		bodyTextProperties = {},
		prefixTextProperties = {},
		wasRewritten = if FFlagEnableInExpChatRewriteModule then p1.wasRewritten or false else nil,
		originalText = if FFlagEnableInExpChatRewriteModule then p1.originalText or "" else nil
	}
	
	if p2 then
		for i, _ in pairs(ConfigModule.DefaultChatWindowMessagePropertiesInstanceSettings) do
			config.bodyTextProperties[i] = p2[i]
			config.prefixTextProperties[i] = p2[i]
		end
	end
	if p1.chatWindowMessageProperties then
		local ChatWindowMessageProperties = p1.chatWindowMessageProperties
		local Text = ChatWindowMessageProperties.Text
		local NoText: boolean = Text == nil or Text == ""
		config.text = if NoText then config.text else ChatWindowMessageProperties.Text
		local PrefixText = ChatWindowMessageProperties.PrefixText
		local NoPrefixText: boolean = PrefixText == nil or PrefixText == ""
		config.prefixText = if NoPrefixText then config.prefixText else ChatWindowMessageProperties.PrefixText
		local Translation = ChatWindowMessageProperties.Translation
		local NoTranslation: boolean = Translation == nil or Translation == ""
		config.translation = if NoTranslation then config.translation else ChatWindowMessageProperties.Translation
		
		for i1, _ in pairs(ConfigModule.DefaultChatWindowMessagePropertiesInstanceSettings) do
			config.bodyTextProperties[i1] = ChatWindowMessageProperties[i1]
			config.prefixTextProperties[i1] = ChatWindowMessageProperties[i1]
		end
		if ChatWindowMessageProperties.PrefixTextProperties then
			local PrefixTextProperties = ChatWindowMessageProperties.PrefixTextProperties
			local PrefixText1 = PrefixTextProperties.PrefixText
			local NoPrefixText1: boolean = PrefixText1 == nil or PrefixText1 == ""
			config.prefixText = if NoPrefixText1 then config.prefixText else PrefixTextProperties.PrefixText
			
			for i2, _ in pairs(ConfigModule.DefaultChatWindowMessagePropertiesInstanceSettings) do
				config.prefixTextProperties[i2] = PrefixTextProperties[i2]
			end
			local UIGradient = PrefixTextProperties:FindFirstChildOfClass("UIGradient")
			
			if UIGradient then
				local UIGradient1 = {}
				
				for i3, _ in pairs(ConfigModule.DefaultChatWindowChildrenCustomizationProperties.UIGradient) do
					UIGradient1[i3] = UIGradient[i3]
				end
				config.prefixTextProperties.UIGradient = UIGradient1
			end
		end
	end
	return config
end))