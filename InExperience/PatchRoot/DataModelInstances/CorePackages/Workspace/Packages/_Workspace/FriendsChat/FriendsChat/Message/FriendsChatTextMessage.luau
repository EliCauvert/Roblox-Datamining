local textService = game:GetService("TextService")
local friendsChat = script:FindFirstAncestor("FriendsChat")
local parent = friendsChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local getMessageTextSize = require(parent.ChatUIPrimitives).Utils.getMessageTextSize
local useFinishChatWindowMessageRenderIntervals = require(parent.ChatUIPrimitives).Hooks.useFinishChatWindowMessageRenderIntervals
local _ = require(script.Parent.MessageDisplayStore.useMessageDisplayStore)
local fFlagFriendsChatMessageSendPerfTrackingModule = require(friendsChat.Flags.FFlagFriendsChatMessageSendPerfTracking)

local function _(p0, p1)
	return p0 + p1 * (1 - p0)
end

local _ = function(p2)
	return p2 ~= nil and p2.displayStyle == "system"
end

return reactModule.memo(function(p3)
	-- upvalues: foundationModule (ref), getMessageTextSize (ref), reactModule (ref), signalsModule (ref), signalsReactModule (ref), fFlagFriendsChatMessageSendPerfTrackingModule (ref), useFinishChatWindowMessageRenderIntervals (ref), textService (ref)
	local var7 = foundationModule.Hooks.useTokens()
	local chatWindowSettings = p3.chatWindowSettings
	local var8 = (if chatWindowSettings then chatWindowSettings.FontFace else nil) or var7.Typography.BodySmall.Font
	local var9 = if typeof(var8) == "Font" then var8 else Font.fromEnum(var8)
	local font = Font.new(var9.Family, Enum.FontWeight.SemiBold, var9.Style)
	local var11 = getMessageTextSize(chatWindowSettings, p3.isSpatialUIEnabled) or var7.Typography.BodySmall.FontSize
	local maxValue = math.max(1, var11 - 2)
	local var13 = if chatWindowSettings and chatWindowSettings.TextColor3 then chatWindowSettings.TextColor3 else var7.Color.Content.Default.Color3
	local color3 = var7.Color.Content.Muted.Color3
	local var14 = if chatWindowSettings then chatWindowSettings.TextStrokeColor3 else nil
	local var15 = if chatWindowSettings and chatWindowSettings.TextStrokeTransparency then chatWindowSettings.TextStrokeTransparency else 1
	local textTransparency = p3.textTransparency or reactModule.createBinding(0)
	local getDisplayId = p3.getDisplayId
	local getDisplayFromId = p3.getDisplayFromId
	local localize = p3.localize
	local var17 = reactModule.useMemo(function()
		-- upvalues: maxValue (ref), localize (ref)
		return { systemTextSize = maxValue, localize = localize }
	end, { maxValue, localize })
	local var18 = signalsReactModule.useSignalBinding(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), getDisplayFromId (ref), getDisplayId (ref), var17 (ref)
		return signalsModule.createComputed(function(p4)
			-- upvalues: getDisplayFromId (copy), getDisplayId (copy), var17 (copy)
			return getDisplayFromId(getDisplayId(p4), p4, var17)
		end)
	end, { getDisplayId, getDisplayFromId, var17 }))
	local var19 = signalsReactModule.useSignalBinding(p3.getLayoutOrder)
	local getMessageIdFromDisplayId = p3.getMessageIdFromDisplayId
	local var20 = useFinishChatWindowMessageRenderIntervals(reactModule.useCallback(function()
		-- upvalues: fFlagFriendsChatMessageSendPerfTrackingModule (copy), getMessageIdFromDisplayId (ref), getDisplayId (ref)
		return if fFlagFriendsChatMessageSendPerfTrackingModule and getMessageIdFromDisplayId then getMessageIdFromDisplayId(getDisplayId(false)) else getDisplayId(false)
	end, { getDisplayId, getMessageIdFromDisplayId }))
	local var21 = reactModule.useRef(nil)
	local var22 = reactModule.useCallback(function(p5)
		-- upvalues: var20 (ref)
		if p5 and p5.Text and p5.Text ~= "" then
			var20()
		end
	end, { var20 })
	reactModule.useEffect(function()
		-- upvalues: fFlagFriendsChatMessageSendPerfTrackingModule (copy), var21 (ref), var20 (ref)
		if not fFlagFriendsChatMessageSendPerfTrackingModule then return end
		local current = var21.current
		
		if current ~= nil and current.Text ~= "" then
			var20()
		end
	end, { var20 })
	local var23 = reactModule.useMemo(function()
		-- upvalues: var11 (ref)
		return UDim2.fromOffset(math.floor(var11 * 3 / 2), var11)
	end, { var11 })
	local var24, var25 = reactModule.useBinding(var23)
	reactModule.useEffect(function()
		-- upvalues: var25 (ref), var23 (ref)
		var25(var23)
	end, { var23 })
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var11 (ref), textService (copy), var25 (ref)
		local var31 = false
		task.spawn(function()
			-- upvalues: var9 (copy), var11 (copy), textService (copy), var31 (write), var25 (copy)
			local getTextBoundsParams = Instance.new("GetTextBoundsParams")
			getTextBoundsParams.Text = "          "
			getTextBoundsParams.Font = var9
			getTextBoundsParams.Size = var11
			getTextBoundsParams.Width = 1e999
			local ok, status = pcall(function()
				-- upvalues: textService (copy), getTextBoundsParams (ref)
				return textService:GetTextBoundsAsync(getTextBoundsParams)
			end)
			
			if var31 or not ok or status == nil then
				return
			end
			var25(UDim2.fromOffset(status.X, status.Y))
		end)
		
		return function()
			-- upvalues: var31 (write)
			var31 = true
		end
	end, { var9, var11 })
	local var26 = var18:map(function(p6)
		return if p6 == nil then "" elseif p6.skeletonWidth == "prefix" then `          {p6.content}` else p6.content
	end)
	local t = { font = var9, textSize = var11, textColor = var13 }
	local t_1 = { font = font, textSize = maxValue, textColor = color3 }
	local var29 = var18:map(function(p7)
		-- upvalues: t_1 (ref), t (ref)
		return if p7 ~= nil and p7.displayStyle == "system" then t_1 else t
	end)
	local var30 = textTransparency:map(function(p8)
		-- upvalues: var15 (ref)
		return var15 + p8 * (1 - var15)
	end)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = var19,
		Visible = var18:map(function(p9)
			return p9 ~= nil
		end),
		ref = p3.guiObjectRef
	}, {
		body = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			FontFace = var29:map(function(p10)
				return p10.font
			end),
			TextSize = var29:map(function(p11)
				return p11.textSize
			end),
			TextColor3 = var29:map(function(p12)
				return p12.textColor
			end),
			TextStrokeColor3 = var14,
			TextStrokeTransparency = var30,
			TextTransparency = textTransparency,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			RichText = true,
			Text = var26,
			ref = var21,
			[reactModule.Change.Text] = var22
		}, {
			stroke = reactModule.createElement("UIStroke", {
				Color = var14 or Color3.fromRGB(0, 0, 0),
				Thickness = var7.Stroke.Thin,
				Transparency = var30
			})
		}),
		skeleton = reactModule.createElement(foundationModule.Skeleton, {
			Size = reactModule.joinBindings({ display = var18, placeholder = var24 }):map(function(p13)
				local display = p13.display
				
				return if display == nil or display.skeletonWidth ~= "full" then p13.placeholder else UDim2.new(1, 0, 0, p13.placeholder.Y.Offset)
			end),
			Position = UDim2.fromOffset(0, 0),
			AnchorPoint = Vector2.new(0, 0),
			Visible = reactModule.joinBindings({ display = var18, textTransparency = textTransparency }):map(function(p14)
				if p14.textTransparency >= 0.9 then
					return false
				end
				local display = p14.display
				
				return if display == nil then false elseif display.skeletonWidth ~= "prefix" then display.skeletonWidth == "full" else true
			end)
		})
	})
end)