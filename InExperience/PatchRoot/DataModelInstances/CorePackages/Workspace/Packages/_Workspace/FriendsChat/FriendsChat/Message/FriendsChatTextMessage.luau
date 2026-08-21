local textService = game:GetService("TextService")
local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local getMessageTextSize = require(parent.ChatUIPrimitives).Utils.getMessageTextSize
local useFinishChatWindowMessageRenderIntervals = require(parent.ChatUIPrimitives).Hooks.useFinishChatWindowMessageRenderIntervals
local _ = require(script.Parent.MessageDisplayStore.useMessageDisplayStore)

local function _(p0, p1) --[[ line: 51 | named "fadeTransparency" ]]
	return p0 + p1 * (1 - p0)
end

local _ = function(p2) --[[ line: 64 | named "isSystemDisplay" ]]
	return p2 ~= nil and p2.displayStyle == "system"
end

return reactModule.memo(function(p3) --[[ line: 88 | named "FriendsChatTextMessage" ]]
	-- upvalues: foundationModule (ref), getMessageTextSize (ref), reactModule (ref), signalsModule (ref), signalsReactModule (ref), useFinishChatWindowMessageRenderIntervals (ref), textService (ref)
	local var5 = foundationModule.Hooks.useTokens()
	local chatWindowSettings = p3.chatWindowSettings
	local var6 = (if chatWindowSettings then chatWindowSettings.FontFace else nil) or var5.Typography.BodySmall.Font
	local var7 = if typeof(var6) == "Font" then var6 else Font.fromEnum(var6)
	local font = Font.new(var7.Family, Enum.FontWeight.SemiBold, var7.Style)
	local var9 = getMessageTextSize(chatWindowSettings, p3.isSpatialUIEnabled) or var5.Typography.BodySmall.FontSize
	local maxValue = math.max(1, var9 - 2)
	local var11 = if chatWindowSettings and chatWindowSettings.TextColor3 then chatWindowSettings.TextColor3 else var5.Color.Content.Default.Color3
	local color3 = var5.Color.Content.Muted.Color3
	local var12 = if chatWindowSettings then chatWindowSettings.TextStrokeColor3 else nil
	local var13 = if chatWindowSettings and chatWindowSettings.TextStrokeTransparency then chatWindowSettings.TextStrokeTransparency else 1
	local textTransparency = p3.textTransparency or reactModule.createBinding(0)
	local getDisplayId = p3.getDisplayId
	local getDisplayFromId = p3.getDisplayFromId
	local localize = p3.localize
	local var15 = reactModule.useMemo(function() --[[ line: 126 ]]
		-- upvalues: maxValue (ref), localize (ref)
		return { systemTextSize = maxValue, localize = localize }
	end, { maxValue, localize })
	local var16 = signalsReactModule.useSignalBinding(reactModule.useMemo(function() --[[ line: 129 ]]
		-- upvalues: signalsModule (copy), getDisplayFromId (ref), getDisplayId (ref), var15 (ref)
		return signalsModule.createComputed(function(p4) --[[ line: 130 ]]
			-- upvalues: getDisplayFromId (copy), getDisplayId (copy), var15 (copy)
			return getDisplayFromId(getDisplayId(p4), p4, var15)
		end)
	end, { getDisplayId, getDisplayFromId, var15 }))
	local var17 = signalsReactModule.useSignalBinding(p3.getLayoutOrder)
	local var18 = useFinishChatWindowMessageRenderIntervals(reactModule.useCallback(function() --[[ line: 144 ]]
		-- upvalues: getDisplayId (ref)
		return getDisplayId(false)
	end, { getDisplayId }))
	local var19 = reactModule.useCallback(function(p5) --[[ line: 148 ]]
		-- upvalues: var18 (ref)
		if p5 and p5.Text and p5.Text ~= "" then
			var18()
		end
	end, { var18 })
	local var20 = reactModule.useMemo(function() --[[ line: 160 ]]
		-- upvalues: var9 (ref)
		return UDim2.fromOffset(math.floor(var9 * 3 / 2), var9)
	end, { var9 })
	local var21, var22 = reactModule.useBinding(var20)
	reactModule.useEffect(function() --[[ line: 167 ]]
		-- upvalues: var22 (ref), var20 (ref)
		var22(var20)
	end, { var20 })
	reactModule.useEffect(function() --[[ line: 171 ]]
		-- upvalues: var7 (ref), var9 (ref), textService (copy), var22 (ref)
		local var28 = false
		task.spawn(function() --[[ line: 173 ]]
			-- upvalues: var7 (copy), var9 (copy), textService (copy), var28 (write), var22 (copy)
			local getTextBoundsParams = Instance.new("GetTextBoundsParams")
			getTextBoundsParams.Text = "          "
			getTextBoundsParams.Font = var7
			getTextBoundsParams.Size = var9
			getTextBoundsParams.Width = 1e999
			local ok, status = pcall(function() --[[ line: 179 ]]
				-- upvalues: textService (copy), getTextBoundsParams (ref)
				return textService:GetTextBoundsAsync(getTextBoundsParams)
			end)
			
			if var28 or not ok or status == nil then
				return
			end
			var22(UDim2.fromOffset(status.X, status.Y))
		end)
		
		return function() --[[ line: 187 ]]
			-- upvalues: var28 (write)
			var28 = true
		end
	end, { var7, var9 })
	local var23 = var16:map(function(p6) --[[ line: 192 ]]
		return if p6 == nil then "" elseif p6.skeletonWidth == "prefix" then `          {p6.content}` else p6.content
	end)
	local t = { font = var7, textSize = var9, textColor = var11 }
	local t_1 = { font = font, textSize = maxValue, textColor = color3 }
	local var26 = var16:map(function(p7) --[[ line: 218 ]]
		-- upvalues: t_1 (ref), t (ref)
		return if p7 ~= nil and p7.displayStyle == "system" then t_1 else t
	end)
	local var27 = textTransparency:map(function(p8) --[[ line: 234 ]]
		-- upvalues: var13 (ref)
		return var13 + p8 * (1 - var13)
	end)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = var17,
		Visible = var16:map(function(p9) --[[ line: 266 ]]
			return p9 ~= nil
		end)
	}, {
		body = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			FontFace = var26:map(function(p10) --[[ line: 222 ]]
				return p10.font
			end),
			TextSize = var26:map(function(p11) --[[ line: 226 ]]
				return p11.textSize
			end),
			TextColor3 = var26:map(function(p12) --[[ line: 230 ]]
				return p12.textColor
			end),
			TextStrokeColor3 = var12,
			TextStrokeTransparency = var27,
			TextTransparency = textTransparency,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			RichText = true,
			Text = var23,
			[reactModule.Change.Text] = var19
		}, {
			stroke = reactModule.createElement("UIStroke", {
				Color = var12 or Color3.fromRGB(0, 0, 0),
				Thickness = var5.Stroke.Thin,
				Transparency = var27
			})
		}),
		skeleton = reactModule.createElement(foundationModule.Skeleton, {
			Size = reactModule.joinBindings({ display = var16, placeholder = var21 }):map(function(p13) --[[ line: 258 ]]
				local display = p13.display
				
				return if display == nil or display.skeletonWidth ~= "full" then p13.placeholder else UDim2.new(1, 0, 0, p13.placeholder.Y.Offset)
			end),
			Position = UDim2.fromOffset(0, 0),
			AnchorPoint = Vector2.new(0, 0),
			Visible = reactModule.joinBindings({ display = var16, textTransparency = textTransparency }):map(function(p14) --[[ line: 244 ]]
				if p14.textTransparency >= 0.9 then
					return false
				end
				local display = p14.display
				
				return if display == nil then false elseif display.skeletonWidth ~= "prefix" then display.skeletonWidth == "full" else true
			end)
		})
	})
end)