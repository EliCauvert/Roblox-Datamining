local textService = game:GetService("TextService")
local parent = script:FindFirstAncestor("ExpChat").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local userProfileStore = require(parent.UserProfiles).Stores.UserProfileStore
local getConversationMessageStoreModule = require(parent.AppChat.GetConversationMessageStore)
local computeNameColor = require(parent.ChatUIPrimitives).Utils.computeNameColor
local getMessageTextSize = require(parent.ChatUIPrimitives).Utils.getMessageTextSize
local useFinishChatWindowMessageRenderIntervals = require(parent.ChatUIPrimitives).Hooks.useFinishChatWindowMessageRenderIntervals

local function _(p0, p1) --[[ line: 51 | named "fadeTransparency" ]]
	return p1:map(function(p2) --[[ line: 52 ]]
		-- upvalues: p0 (ref)
		return p0 + p2 * (1 - p0)
	end)
end

local color = Color3.fromRGB(255, 255, 255)

local function resolveNameField(p3, p4, p5) --[[ line: 68 ]]
	-- upvalues: userProfileStore (ref)
	local var7 = p4(p3)
	
	if var7 == nil or var7.type == "system" then
		return nil
	end
	local senderUserId = var7.sender_user_id
	
	if senderUserId == nil then
		return nil
	end
	local var8 = userProfileStore.get().fetchNamesByUserIds({ tostring(senderUserId) })(p3)
	local var9 = if var8 and var8.data then var8.data[1] else nil
	
	if var9 == nil or var9.names == nil then
		return nil
	end
	local var10 = var9.names[p5]
	
	return if var10 then var10(p3) else nil
end

local _ = function(p6) --[[ line: 88 | named "makeDisplayNameGetter" ]]
	-- upvalues: resolveNameField (ref)
	return function(p7) --[[ line: 89 ]]
		-- upvalues: resolveNameField (copy), p6 (ref)
		return resolveNameField(p7, p6, "getDisplayName")
	end
end

local _ = function(p8) --[[ line: 94 | named "makeUsernameGetter" ]]
	-- upvalues: resolveNameField (ref)
	return function(p9) --[[ line: 95 ]]
		-- upvalues: resolveNameField (copy), p8 (ref)
		return resolveNameField(p9, p8, "getUsername")
	end
end

return reactModule.memo(function(p10) --[[ line: 108 | named "FriendsChatTextMessage" ]]
	-- upvalues: foundationModule (ref), getMessageTextSize (ref), reactModule (ref), getConversationMessageStoreModule (ref), resolveNameField (ref), signalsReactModule (ref), useFinishChatWindowMessageRenderIntervals (ref), textService (ref), computeNameColor (ref), color (ref)
	local var11 = foundationModule.Hooks.useTokens()
	local chatWindowSettings = p10.chatWindowSettings
	local var12 = (if chatWindowSettings then chatWindowSettings.FontFace else nil) or var11.Typography.BodySmall.Font
	local var13 = getMessageTextSize(chatWindowSettings, p10.isSpatialUIEnabled) or var11.Typography.BodySmall.FontSize
	local var14 = if chatWindowSettings and chatWindowSettings.TextColor3 then chatWindowSettings.TextColor3 else var11.Color.Content.Default.Color3
	local var15 = if chatWindowSettings then chatWindowSettings.TextStrokeColor3 else nil
	local var16 = if chatWindowSettings and chatWindowSettings.TextStrokeTransparency then chatWindowSettings.TextStrokeTransparency else 1
	local textTransparency = p10.textTransparency or reactModule.createBinding(0)
	local var18 = reactModule.useMemo(function() --[[ line: 130 ]]
		-- upvalues: p10 (ref), getConversationMessageStoreModule (copy)
		return function(p11) --[[ line: 131 ]]
			-- upvalues: p10 (copy), getConversationMessageStoreModule (copy)
			local messageId = p10.getMessageId(p11)
			
			return if messageId == nil then nil else getConversationMessageStoreModule(p11).getMessage(messageId, p11)
		end
	end, { p10.getMessageId })
	local var19 = reactModule.useMemo(function() --[[ line: 140 ]]
		-- upvalues: var18 (ref), resolveNameField (copy)
		return {
			displayName = function(p12) --[[ line: 89 ]]
				-- upvalues: resolveNameField (copy), var18 (ref)
				return resolveNameField(p12, var18, "getDisplayName")
			end,
			username = function(p13) --[[ line: 95 ]]
				-- upvalues: resolveNameField (copy), var18 (ref)
				return resolveNameField(p13, var18, "getUsername")
			end
		}
	end, { var18 })
	local var20 = signalsReactModule.useSignalBinding(var18)
	local var21 = signalsReactModule.useSignalBinding(p10.getLayoutOrder)
	local var22 = signalsReactModule.useSignalBinding(var19.displayName)
	local var23 = signalsReactModule.useSignalBinding(var19.username)
	local var24 = useFinishChatWindowMessageRenderIntervals(reactModule.useCallback(function() --[[ line: 158 ]]
		-- upvalues: p10 (ref)
		return p10.getMessageId(false)
	end, { p10.getMessageId }))
	local var25 = reactModule.useCallback(function(p14) --[[ line: 162 ]]
		-- upvalues: var24 (ref)
		if p14 and p14.Text and p14.Text ~= "" then
			var24()
		end
	end, { var24 })
	local var26 = reactModule.useMemo(function() --[[ line: 177 ]]
		-- upvalues: var13 (ref)
		return UDim2.fromOffset(math.floor(var13 * 3 / 2), var13)
	end, { var13 })
	local var27, var28 = reactModule.useBinding(var26)
	reactModule.useEffect(function() --[[ line: 188 ]]
		-- upvalues: var28 (ref), var26 (ref)
		var28(var26)
	end, { var26 })
	reactModule.useEffect(function() --[[ line: 192 ]]
		-- upvalues: var12 (ref), var13 (ref), textService (copy), var28 (ref)
		local var30 = false
		task.spawn(function() --[[ line: 194 ]]
			-- upvalues: var12 (copy), var13 (copy), textService (copy), var30 (write), var28 (copy)
			local var31 = if typeof(var12) == "Font" then var12 elseif typeof(var12) == "EnumItem" then Font.fromEnum(var12) else nil
			
			if var31 == nil then return end
			local getTextBoundsParams = Instance.new("GetTextBoundsParams")
			getTextBoundsParams.Text = "          "
			getTextBoundsParams.Font = var31
			getTextBoundsParams.Size = var13
			getTextBoundsParams.Width = 1e999
			local ok, status = pcall(function() --[[ line: 206 ]]
				-- upvalues: textService (copy), getTextBoundsParams (ref)
				return textService:GetTextBoundsAsync(getTextBoundsParams)
			end)
			
			if var30 or not ok or status == nil then
				return
			end
			var28(UDim2.fromOffset(status.X, status.Y))
		end)
		
		return function() --[[ line: 214 ]]
			-- upvalues: var30 (write)
			var30 = true
		end
	end, { var12, var13 })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = var21,
		Visible = var20:map(function(p15) --[[ line: 266 ]]
			return p15 ~= nil
		end)
	}, {
		body = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			FontFace = if typeof(var12) == "Font" then var12 else nil,
			Font = if typeof(var12) == "Font" then nil else var12,
			TextSize = var13,
			TextColor3 = var14,
			TextStrokeColor3 = var15,
			TextStrokeTransparency = textTransparency:map(function(p16) --[[ line: 52 ]]
				-- upvalues: var16 (ref)
				return var16 + p16 * (1 - var16)
			end),
			TextTransparency = textTransparency,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			RichText = true,
			Text = reactModule.joinBindings({ message = var20, displayName = var22, username = var23 }):map(function(p17) --[[ line: 223 ]]
				-- upvalues: computeNameColor (copy), color (copy)
				local message = p17.message
				
				if message == nil then
					return ""
				end
				local richContent = message.richContent or ""
				
				if message.type == "system" or message.sender_user_id == nil then
					return richContent
				end
				local displayName = p17.displayName
				
				if displayName == nil or displayName == "" then
					return `          : {richContent}`
				end
				local username = p17.username
				
				return string.format("<font color=\"#%s\">%s</font>: %s", (if username == nil or username == "" then color else computeNameColor(username)):ToHex(), displayName, richContent)
			end),
			[reactModule.Change.Text] = var25
		}),
		skeleton = reactModule.createElement(foundationModule.Skeleton, {
			Size = var27,
			Position = UDim2.fromOffset(0, 0),
			AnchorPoint = Vector2.new(0, 0),
			Visible = reactModule.joinBindings({
				message = var20,
				displayName = var22,
				textTransparency = textTransparency
			}):map(function(p18) --[[ line: 251 ]]
				if p18.textTransparency >= 0.9 then
					return false
				end
				local message = p18.message
				
				if message == nil then
					return false
				elseif message.type == "system" or message.sender_user_id == nil then
					return false
				end
				local displayName = p18.displayName
				
				return if displayName ~= nil then displayName == "" else true
			end)
		})
	})
end)