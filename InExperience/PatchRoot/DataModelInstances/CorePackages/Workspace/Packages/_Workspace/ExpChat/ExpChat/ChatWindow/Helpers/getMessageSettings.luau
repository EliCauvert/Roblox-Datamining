local expChat = script:FindFirstAncestor("ExpChat")
local configModule = require(expChat.Config)
local memoizeModule = require(expChat.memoize)
local fFlagEnableInExpChatRewriteModule = require(expChat.Flags.FFlagEnableInExpChatRewrite)

local _ = function(p0) --[[ line: 7 ]]
	return if p0 ~= nil then p0 == "" else true
end

return memoizeModule(function(p1, p2) --[[ line: 11 ]]
	-- upvalues: fFlagEnableInExpChatRewriteModule (ref), configModule (ref)
	local t = {
		text = p1.text or "",
		prefixText = p1.prefixText or "",
		translation = p1.translation or "",
		useTranslation = p1.useTranslation,
		bodyTextProperties = {},
		prefixTextProperties = {},
		wasRewritten = if fFlagEnableInExpChatRewriteModule then p1.wasRewritten or false else nil,
		originalText = if fFlagEnableInExpChatRewriteModule then p1.originalText or "" else nil
	}
	
	if p2 then
		for i, v in pairs(configModule.DefaultChatWindowMessagePropertiesInstanceSettings) do
			t.bodyTextProperties[i] = p2[i]
			t.prefixTextProperties[i] = p2[i]
		end
	end
	if p1.chatWindowMessageProperties then
		local chatWindowMessageProperties = p1.chatWindowMessageProperties
		local text = chatWindowMessageProperties.Text
		t.text = if if text ~= nil then text == "" else true then t.text else chatWindowMessageProperties.Text
		local prefixText = chatWindowMessageProperties.PrefixText
		t.prefixText = if if prefixText ~= nil then prefixText == "" else true then t.prefixText else chatWindowMessageProperties.PrefixText
		local translation = chatWindowMessageProperties.Translation
		t.translation = if if translation ~= nil then translation == "" else true then t.translation else chatWindowMessageProperties.Translation
		
		for i, v in pairs(configModule.DefaultChatWindowMessagePropertiesInstanceSettings) do
			t.bodyTextProperties[i] = chatWindowMessageProperties[i]
			t.prefixTextProperties[i] = chatWindowMessageProperties[i]
		end
		if chatWindowMessageProperties.PrefixTextProperties then
			local prefixTextProperties = chatWindowMessageProperties.PrefixTextProperties
			local prefixText_1 = prefixTextProperties.PrefixText
			t.prefixText = if if prefixText_1 ~= nil then prefixText_1 == "" else true then t.prefixText else prefixTextProperties.PrefixText
			
			for i_1, v_1 in pairs(configModule.DefaultChatWindowMessagePropertiesInstanceSettings) do
				t.prefixTextProperties[i_1] = prefixTextProperties[i_1]
			end
			local UIGradient = prefixTextProperties:FindFirstChildOfClass("UIGradient")
			
			if UIGradient then
				local t_1 = {}
				
				for i_2, v_2 in pairs(configModule.DefaultChatWindowChildrenCustomizationProperties.UIGradient) do
					t_1[i_2] = UIGradient[i_2]
				end
				t.prefixTextProperties.UIGradient = t_1
			end
		end
	end
	return t
end)