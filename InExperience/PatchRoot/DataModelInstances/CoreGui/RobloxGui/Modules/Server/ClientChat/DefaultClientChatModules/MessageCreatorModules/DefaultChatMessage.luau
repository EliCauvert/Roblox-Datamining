local _ = false
local ok, status = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2")
end)
local status_1 = ok and status
local playersService = game:GetService("Players")
local parent = script.Parent.Parent
local chatSettingsModule = require(parent:WaitForChild("ChatSettings"))
local chatConstantsModule = require(parent:WaitForChild("ChatConstants"))
local utilModule = require(script.Parent:WaitForChild("Util"))
local char = utf8.char(57344)

function IsPlayerVerified(p1)
	-- upvalues: playersService (ref)
	local var1 = playersService:GetPlayerByUserId(p1)
	
	if not var1 then
		return false
	end
	local ok, status = pcall(function()
		-- upvalues: var1 (ref)
		return var1.HasVerifiedBadge
	end)
	
	return if ok then status else false
end

function AppendVerifiedBadge(p1)
	-- upvalues: char (ref)
	return p1 .. char
end

function CreateMessageLabel(p1, p2, p3)
	-- upvalues: chatSettingsModule (ref), utilModule (ref), status_1 (write)
	local fromSpeaker = p1.FromSpeaker
	local _ = nil
	local var1 = if chatSettingsModule.PlayerDisplayNamesEnabled and p1.SpeakerDisplayName then p1.SpeakerDisplayName else fromSpeaker
	
	if IsPlayerVerified(p1.SpeakerUserId) then
		var1 = AppendVerifiedBadge(var1)
	end
	local _ = p1.Message
	local extraData = p1.ExtraData or {}
	local font = extraData.Font or chatSettingsModule.DefaultFont
	local textSize = extraData.TextSize or chatSettingsModule.ChatWindowTextSize
	local nameColor = extraData.NameColor or chatSettingsModule.DefaultNameColor
	local chatColor = extraData.ChatColor or chatSettingsModule.DefaultMessageColor
	local channelColor = extraData.ChannelColor or chatColor
	local tags = extraData.Tags or {}
	local formattedText = string.format("[%s]:", var1)
	local _ = utilModule:GetStringTextBounds(formattedText, font, textSize)
	local var2 = utilModule:GetNumberOfSpaces(formattedText, font, textSize) + 1
	local var3, var4 = utilModule:CreateBaseMessage("", font, textSize, chatColor)
	local var5 = utilModule:AddNameButtonToBaseMessage(var4, nameColor, formattedText, fromSpeaker)
	local var6 = nil
	local uDim2 = UDim2.new(0, 0, 0, 0)
	
	if p2 ~= p1.OriginalChannel then
		local formattedText_1 = string.format("{%s}", p1.OriginalChannel)
		var6 = utilModule:AddChannelButtonToBaseMessage(var4, channelColor, formattedText_1, p1.OriginalChannel)
		uDim2 = UDim2.new(0, var6.Size.X.Offset + utilModule:GetStringTextBounds(" ", font, textSize).X, 0, 0)
		var2 = var2 + utilModule:GetNumberOfSpaces(formattedText_1, font, textSize) + 1
	end
	local changedConnection
	local t = {}
	
	for i, v in pairs(tags) do
		local formattedText_1 = string.format("[%s] ", v.TagText or "???")
		changedConnection = utilModule:AddTagLabelToBaseMessage(var4, v.TagColor or Color3.fromRGB(255, 0, 255), formattedText_1)
		changedConnection.Position = uDim2
		var2 += utilModule:GetNumberOfSpaces(formattedText_1, font, textSize)
		uDim2 += UDim2.new(0, changedConnection.Size.X.Offset, 0, 0)
		table.insert(t, changedConnection)
	end
	var5.Position = uDim2
	local var7 = false
	local var8 = nil
	
	if status_1 then
		pcall(function()
			-- upvalues: var8 (write), utilModule (copy), var4 (ref), uDim2 (write), var5 (ref)
			var8 = utilModule:AddTranslationButtonToBaseMessage(var4)
			uDim2 += UDim2.new(0, var5.Size.X.Offset + 2, 0, 0)
			var8.Position = uDim2
		end)
	end
	local function useOriginalText(p4)
		-- upvalues: var7 (write), p1 (ref), var4 (ref), utilModule (copy), var2 (write)
		var7 = false
		
		if p1.IsFiltered then
			var4.Text = utilModule:CreateLeadingSpaces(var2) .. utilModule:SanitizeForRichText(p4.Message)
			
			return
		end
		var4.Text = utilModule:CreateLeadingSpaces(var2) .. string.rep("_", p4.MessageLengthUtf8 or p4.MessageLength)
	end
	
	i = function(value)
		-- upvalues: var8 (write), var2 (write), var7 (write), useOriginalText (ref), var4 (ref), utilModule (copy)
		if var8 == nil then return end
		if var8.Visible == false then
			var2 += 6
		end
		var8.Visible = true
		var7 = true
		
		if value.TranslatedMessage == "" then
			useOriginalText(value)
			
			return
		end
		var4.Text = utilModule:CreateLeadingSpaces(var2) .. utilModule:SanitizeForRichText(value.TranslatedMessage)
	end
	
	local function _(p4)
		-- upvalues: p1 (ref), var8 (write), var2 (write), var7 (write), useOriginalText (ref), var4 (ref), utilModule (copy)
		p1.TranslatedMessage = p4.TranslatedMessage
		
		if not p4.TranslatedMessage then
			useOriginalText(p4)
			
			return
		elseif var8 == nil then return end
		if var8.Visible == false then
			var2 += 6
		end
		var8.Visible = true
		var7 = true
		
		if p4.TranslatedMessage == "" then
			useOriginalText(p4)
			
			return
		end
		var4.Text = utilModule:CreateLeadingSpaces(var2) .. utilModule:SanitizeForRichText(p4.TranslatedMessage)
	end
	
	local function UpdateTextFunction(p4)
		-- upvalues: status_1 (copy), p1 (ref), var8 (write), var2 (write), var7 (write), useOriginalText (ref), var4 (ref), utilModule (copy)
		if status_1 then
			p1.TranslatedMessage = p4.TranslatedMessage
			
			if not p4.TranslatedMessage then
				useOriginalText(p4)
				
				return
			elseif var8 == nil then return end
			if var8.Visible == false then
				var2 += 6
			end
			var8.Visible = true
			var7 = true
			
			if p4.TranslatedMessage == "" then
				useOriginalText(p4)
				
				return
			end
			var4.Text = utilModule:CreateLeadingSpaces(var2) .. utilModule:SanitizeForRichText(p4.TranslatedMessage)
			
			return
		elseif p1.IsFiltered then
			var4.Text = utilModule:CreateLeadingSpaces(var2) .. utilModule:SanitizeForRichText(p4.Message)
			
			return
		end
		var4.Text = utilModule:CreateLeadingSpaces(var2) .. string.rep("_", p4.MessageLengthUtf8 or p4.MessageLength)
	end
	
	local _ = function()
		-- upvalues: var7 (write), p1 (ref), var8 (write), var2 (write), useOriginalText (ref), var4 (ref), utilModule (copy), p3 (ref)
		if var7 or not p1.TranslatedMessage then
			useOriginalText(p1)
		else
			local var9 = p1
			
			if var8 ~= nil then
				if var8.Visible == false then
					var2 += 6
				end
				var8.Visible = true
				var7 = true
				
				if var9.TranslatedMessage == "" then
					useOriginalText(var9)
				else
					var4.Text = utilModule:CreateLeadingSpaces(var2) .. utilModule:SanitizeForRichText(var9.TranslatedMessage)
				end
			end
		end
		if p3 then
			p3()
		end
	end
	
	if status_1 and var8 ~= nil then
		local mouseButton1ClickConnection = var8.MouseButton1Click:connect(function()
			-- upvalues: var7 (write), p1 (ref), var8 (write), var2 (write), useOriginalText (ref), var4 (ref), utilModule (copy), p3 (ref)
			if var7 or not p1.TranslatedMessage then
				useOriginalText(p1)
			else
				local var9 = p1
				
				if var8 ~= nil then
					if var8.Visible == false then
						var2 += 6
					end
					var8.Visible = true
					var7 = true
					
					if var9.TranslatedMessage == "" then
						useOriginalText(var9)
					else
						var4.Text = utilModule:CreateLeadingSpaces(var2) .. utilModule:SanitizeForRichText(var9.TranslatedMessage)
					end
				end
			end
			if p3 then
				p3()
			end
		end)
		changedConnection = nil
		changedConnection = var8.Changed:connect(function(p4)
			-- upvalues: mouseButton1ClickConnection (ref), changedConnection (write)
			if p4 == "Parent" then
				mouseButton1ClickConnection:Disconnect()
				changedConnection:Disconnect()
			end
		end)
	end
	UpdateTextFunction(p1)
	
	local function GetHeightFunction(p4)
		-- upvalues: utilModule (copy), var4 (ref), var3 (ref)
		return utilModule:GetMessageHeight(var4, var3, p4)
	end
	
	changedConnection = {
		[var5] = {
			TextTransparency = { FadedIn = 0, FadedOut = 1 },
			TextStrokeTransparency = { FadedIn = 0.75, FadedOut = 1 }
		}
	}
	
	if status_1 and var8 ~= nil then
		changedConnection[var8] = { ImageTransparency = { FadedIn = 0, FadedOut = 1 } }
	end
	changedConnection[var4] = {
		TextTransparency = { FadedIn = 0, FadedOut = 1 },
		TextStrokeTransparency = { FadedIn = 0.75, FadedOut = 1 }
	}
	
	for i_1, v_1 in pairs(t) do
		local _ = string.format("Tag%d", i_1)
		changedConnection[v_1] = {
			TextTransparency = { FadedIn = 0, FadedOut = 1 },
			TextStrokeTransparency = { FadedIn = 0.75, FadedOut = 1 }
		}
	end
	if var6 then
		changedConnection[var6] = {
			TextTransparency = { FadedIn = 0, FadedOut = 1 },
			TextStrokeTransparency = { FadedIn = 0.75, FadedOut = 1 }
		}
	end
	local var9, var10, var11 = utilModule:CreateFadeFunctions(changedConnection)
	
	return {
		[utilModule.KEY_BASE_FRAME] = var3,
		[utilModule.KEY_BASE_MESSAGE] = var4,
		[utilModule.KEY_UPDATE_TEXT_FUNC] = UpdateTextFunction,
		[utilModule.KEY_GET_HEIGHT] = GetHeightFunction,
		[utilModule.KEY_FADE_IN] = var9,
		[utilModule.KEY_FADE_OUT] = var10,
		[utilModule.KEY_UPDATE_ANIMATION] = var11
	}
end

return {
	[utilModule.KEY_MESSAGE_TYPE] = chatConstantsModule.MessageTypeDefault,
	[utilModule.KEY_CREATOR_FUNCTION] = CreateMessageLabel
}