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

function IsPlayerVerified(p0)
	-- upvalues: playersService (ref)
	local var6 = playersService:GetPlayerByUserId(p0)
	
	if not var6 then
		return false
	end
	local ok, status = pcall(function()
		-- upvalues: var6 (ref)
		return var6.HasVerifiedBadge
	end)
	
	return if ok then status else false
end

function AppendVerifiedBadge(p1)
	-- upvalues: char (ref)
	return p1 .. char
end

function CreateMessageLabel(p2, p3, p4)
	-- upvalues: chatSettingsModule (ref), utilModule (ref), status_1 (write)
	local fromSpeaker = p2.FromSpeaker
	local _ = nil
	local var7 = if chatSettingsModule.PlayerDisplayNamesEnabled and p2.SpeakerDisplayName then p2.SpeakerDisplayName else fromSpeaker
	
	if IsPlayerVerified(p2.SpeakerUserId) then
		var7 = AppendVerifiedBadge(var7)
	end
	local _ = p2.Message
	local extraData = p2.ExtraData or {}
	local font = extraData.Font or chatSettingsModule.DefaultFont
	local textSize = extraData.TextSize or chatSettingsModule.ChatWindowTextSize
	local nameColor = extraData.NameColor or chatSettingsModule.DefaultNameColor
	local chatColor = extraData.ChatColor or chatSettingsModule.DefaultMessageColor
	local channelColor = extraData.ChannelColor or chatColor
	local tags = extraData.Tags or {}
	local formattedText = string.format("[%s]:", var7)
	local _ = utilModule:GetStringTextBounds(formattedText, font, textSize)
	local var16 = utilModule:GetNumberOfSpaces(formattedText, font, textSize) + 1
	local var17, var18 = utilModule:CreateBaseMessage("", font, textSize, chatColor)
	local var19 = utilModule:AddNameButtonToBaseMessage(var18, nameColor, formattedText, fromSpeaker)
	local var20 = nil
	local uDim2 = UDim2.new(0, 0, 0, 0)
	
	if p3 ~= p2.OriginalChannel then
		local formattedText_1 = string.format("{%s}", p2.OriginalChannel)
		var20 = utilModule:AddChannelButtonToBaseMessage(var18, channelColor, formattedText_1, p2.OriginalChannel)
		uDim2 = UDim2.new(0, var20.Size.X.Offset + utilModule:GetStringTextBounds(" ", font, textSize).X, 0, 0)
		var16 = var16 + utilModule:GetNumberOfSpaces(formattedText_1, font, textSize) + 1
	end
	local changedConnection
	local t = {}
	
	for i, v in pairs(tags) do
		local formattedText_1 = string.format("[%s] ", v.TagText or "???")
		changedConnection = utilModule:AddTagLabelToBaseMessage(var18, v.TagColor or Color3.fromRGB(255, 0, 255), formattedText_1)
		changedConnection.Position = uDim2
		var16 += utilModule:GetNumberOfSpaces(formattedText_1, font, textSize)
		uDim2 += UDim2.new(0, changedConnection.Size.X.Offset, 0, 0)
		table.insert(t, changedConnection)
	end
	var19.Position = uDim2
	local var24 = false
	local var25 = nil
	
	if status_1 then
		pcall(function()
			-- upvalues: var25 (write), utilModule (copy), var18 (ref), uDim2 (write), var19 (ref)
			var25 = utilModule:AddTranslationButtonToBaseMessage(var18)
			uDim2 += UDim2.new(0, var19.Size.X.Offset + 2, 0, 0)
			var25.Position = uDim2
		end)
	end
	local function useOriginalText(p5)
		-- upvalues: var24 (write), p2 (ref), var18 (ref), utilModule (copy), var16 (write)
		var24 = false
		
		if p2.IsFiltered then
			var18.Text = utilModule:CreateLeadingSpaces(var16) .. utilModule:SanitizeForRichText(p5.Message)
			
			return
		end
		var18.Text = utilModule:CreateLeadingSpaces(var16) .. string.rep("_", p5.MessageLengthUtf8 or p5.MessageLength)
	end
	
	i = function(value)
		-- upvalues: var25 (write), var16 (write), var24 (write), useOriginalText (ref), var18 (ref), utilModule (copy)
		if var25 == nil then return end
		if var25.Visible == false then
			var16 += 6
		end
		var25.Visible = true
		var24 = true
		
		if value.TranslatedMessage == "" then
			useOriginalText(value)
			
			return
		end
		var18.Text = utilModule:CreateLeadingSpaces(var16) .. utilModule:SanitizeForRichText(value.TranslatedMessage)
	end
	
	local function _(p6)
		-- upvalues: p2 (ref), var25 (write), var16 (write), var24 (write), useOriginalText (ref), var18 (ref), utilModule (copy)
		p2.TranslatedMessage = p6.TranslatedMessage
		
		if not p6.TranslatedMessage then
			useOriginalText(p6)
			
			return
		elseif var25 == nil then return end
		if var25.Visible == false then
			var16 += 6
		end
		var25.Visible = true
		var24 = true
		
		if p6.TranslatedMessage == "" then
			useOriginalText(p6)
			
			return
		end
		var18.Text = utilModule:CreateLeadingSpaces(var16) .. utilModule:SanitizeForRichText(p6.TranslatedMessage)
	end
	
	local function UpdateTextFunction(p7)
		-- upvalues: status_1 (copy), p2 (ref), var25 (write), var16 (write), var24 (write), useOriginalText (ref), var18 (ref), utilModule (copy)
		if status_1 then
			p2.TranslatedMessage = p7.TranslatedMessage
			
			if not p7.TranslatedMessage then
				useOriginalText(p7)
				
				return
			elseif var25 == nil then return end
			if var25.Visible == false then
				var16 += 6
			end
			var25.Visible = true
			var24 = true
			
			if p7.TranslatedMessage == "" then
				useOriginalText(p7)
				
				return
			end
			var18.Text = utilModule:CreateLeadingSpaces(var16) .. utilModule:SanitizeForRichText(p7.TranslatedMessage)
			
			return
		elseif p2.IsFiltered then
			var18.Text = utilModule:CreateLeadingSpaces(var16) .. utilModule:SanitizeForRichText(p7.Message)
			
			return
		end
		var18.Text = utilModule:CreateLeadingSpaces(var16) .. string.rep("_", p7.MessageLengthUtf8 or p7.MessageLength)
	end
	
	local _ = function()
		-- upvalues: var24 (write), p2 (ref), var25 (write), var16 (write), useOriginalText (ref), var18 (ref), utilModule (copy), p4 (ref)
		if var24 or not p2.TranslatedMessage then
			useOriginalText(p2)
		else
			local var35 = p2
			
			if var25 ~= nil then
				if var25.Visible == false then
					var16 += 6
				end
				var25.Visible = true
				var24 = true
				
				if var35.TranslatedMessage == "" then
					useOriginalText(var35)
				else
					var18.Text = utilModule:CreateLeadingSpaces(var16) .. utilModule:SanitizeForRichText(var35.TranslatedMessage)
				end
			end
		end
		if p4 then
			p4()
		end
	end
	
	if status_1 and var25 ~= nil then
		local mouseButton1ClickConnection = var25.MouseButton1Click:connect(function()
			-- upvalues: var24 (write), p2 (ref), var25 (write), var16 (write), useOriginalText (ref), var18 (ref), utilModule (copy), p4 (ref)
			if var24 or not p2.TranslatedMessage then
				useOriginalText(p2)
			else
				local var36 = p2
				
				if var25 ~= nil then
					if var25.Visible == false then
						var16 += 6
					end
					var25.Visible = true
					var24 = true
					
					if var36.TranslatedMessage == "" then
						useOriginalText(var36)
					else
						var18.Text = utilModule:CreateLeadingSpaces(var16) .. utilModule:SanitizeForRichText(var36.TranslatedMessage)
					end
				end
			end
			if p4 then
				p4()
			end
		end)
		changedConnection = nil
		changedConnection = var25.Changed:connect(function(p8)
			-- upvalues: mouseButton1ClickConnection (ref), changedConnection (write)
			if p8 == "Parent" then
				mouseButton1ClickConnection:Disconnect()
				changedConnection:Disconnect()
			end
		end)
	end
	UpdateTextFunction(p2)
	
	local function GetHeightFunction(p9)
		-- upvalues: utilModule (copy), var18 (ref), var17 (ref)
		return utilModule:GetMessageHeight(var18, var17, p9)
	end
	
	changedConnection = {
		[var19] = {
			TextTransparency = { FadedIn = 0, FadedOut = 1 },
			TextStrokeTransparency = { FadedIn = 0.75, FadedOut = 1 }
		}
	}
	
	if status_1 and var25 ~= nil then
		changedConnection[var25] = { ImageTransparency = { FadedIn = 0, FadedOut = 1 } }
	end
	changedConnection[var18] = {
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
	if var20 then
		changedConnection[var20] = {
			TextTransparency = { FadedIn = 0, FadedOut = 1 },
			TextStrokeTransparency = { FadedIn = 0.75, FadedOut = 1 }
		}
	end
	local var31, var32, var33 = utilModule:CreateFadeFunctions(changedConnection)
	
	return {
		[utilModule.KEY_BASE_FRAME] = var17,
		[utilModule.KEY_BASE_MESSAGE] = var18,
		[utilModule.KEY_UPDATE_TEXT_FUNC] = UpdateTextFunction,
		[utilModule.KEY_GET_HEIGHT] = GetHeightFunction,
		[utilModule.KEY_FADE_IN] = var31,
		[utilModule.KEY_FADE_OUT] = var32,
		[utilModule.KEY_UPDATE_ANIMATION] = var33
	}
end

return {
	[utilModule.KEY_MESSAGE_TYPE] = chatConstantsModule.MessageTypeDefault,
	[utilModule.KEY_CREATOR_FUNCTION] = CreateMessageLabel
}