local textService = game:GetService("TextService")
local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local getMessageTextSize = require(parent.ChatUIPrimitives).Utils.getMessageTextSize
local useFinishChatWindowMessageRenderIntervals = require(parent.ChatUIPrimitives).Hooks.useFinishChatWindowMessageRenderIntervals
local _ = require(script.Parent.MessageDisplayStore.useMessageDisplayStore)

local function _(p1, p2)
	return p1 + p2 * (1 - p1)
end

local _ = function(p1)
	return p1 ~= nil and p1.displayStyle == "system"
end

return reactModule.memo(function(p1)
	-- upvalues: foundationModule (ref), getMessageTextSize (ref), reactModule (ref), signalsModule (ref), signalsReactModule (ref), useFinishChatWindowMessageRenderIntervals (ref), textService (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local chatWindowSettings = p1.chatWindowSettings
	local var2 = (if chatWindowSettings then chatWindowSettings.FontFace else nil) or var1.Typography.BodySmall.Font
	local var3 = if typeof(var2) == "Font" then var2 else Font.fromEnum(var2)
	local font = Font.new(var3.Family, Enum.FontWeight.SemiBold, var3.Style)
	local var4 = getMessageTextSize(chatWindowSettings, p1.isSpatialUIEnabled) or var1.Typography.BodySmall.FontSize
	local maxValue = math.max(1, var4 - 2)
	local var5 = if chatWindowSettings and chatWindowSettings.TextColor3 then chatWindowSettings.TextColor3 else var1.Color.Content.Default.Color3
	local color3 = var1.Color.Content.Muted.Color3
	local var6 = if chatWindowSettings then chatWindowSettings.TextStrokeColor3 else nil
	local var7 = if chatWindowSettings and chatWindowSettings.TextStrokeTransparency then chatWindowSettings.TextStrokeTransparency else 1
	local textTransparency = p1.textTransparency or reactModule.createBinding(0)
	local getDisplayId = p1.getDisplayId
	local getDisplayFromId = p1.getDisplayFromId
	local localize = p1.localize
	local var8 = reactModule.useMemo(function()
		-- upvalues: maxValue (ref), localize (ref)
		return { systemTextSize = maxValue, localize = localize }
	end, { maxValue, localize })
	local var9 = signalsReactModule.useSignalBinding(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), getDisplayFromId (ref), getDisplayId (ref), var8 (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: getDisplayFromId (copy), getDisplayId (copy), var8 (copy)
			return getDisplayFromId(getDisplayId(p2), p2, var8)
		end)
	end, { getDisplayId, getDisplayFromId, var8 }))
	local var10 = signalsReactModule.useSignalBinding(p1.getLayoutOrder)
	local var11 = useFinishChatWindowMessageRenderIntervals(reactModule.useCallback(function()
		-- upvalues: getDisplayId (ref)
		return getDisplayId(false)
	end, { getDisplayId }))
	local var12 = reactModule.useCallback(function(p2)
		-- upvalues: var11 (ref)
		if p2 and p2.Text and p2.Text ~= "" then
			var11()
		end
	end, { var11 })
	local var13 = reactModule.useMemo(function()
		-- upvalues: var4 (ref)
		return UDim2.fromOffset(math.floor(var4 * 3 / 2), var4)
	end, { var4 })
	local var14, var15 = reactModule.useBinding(var13)
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), var13 (ref)
		var15(var13)
	end, { var13 })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var4 (ref), textService (copy), var15 (ref)
		local var16 = false
		task.spawn(function()
			-- upvalues: var3 (copy), var4 (copy), textService (copy), var16 (write), var15 (copy)
			local getTextBoundsParams = Instance.new("GetTextBoundsParams")
			getTextBoundsParams.Text = "          "
			getTextBoundsParams.Font = var3
			getTextBoundsParams.Size = var4
			getTextBoundsParams.Width = 1e999
			local ok, status = pcall(function()
				-- upvalues: textService (copy), getTextBoundsParams (ref)
				return textService:GetTextBoundsAsync(getTextBoundsParams)
			end)
			
			if var16 or not ok or status == nil then
				return
			end
			var15(UDim2.fromOffset(status.X, status.Y))
		end)
		
		return function()
			-- upvalues: var16 (write)
			var16 = true
		end
	end, { var3, var4 })
	local var16 = var9:map(function(p2)
		return if p2 == nil then "" elseif p2.skeletonWidth == "prefix" then `          {p2.content}` else p2.content
	end)
	local t = { font = var3, textSize = var4, textColor = var5 }
	local t_1 = { font = font, textSize = maxValue, textColor = color3 }
	local var17 = var9:map(function(p2)
		-- upvalues: t_1 (ref), t (ref)
		return if p2 ~= nil and p2.displayStyle == "system" then t_1 else t
	end)
	local var18 = textTransparency:map(function(p2)
		-- upvalues: var7 (ref)
		return var7 + p2 * (1 - var7)
	end)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = var10,
		Visible = var9:map(function(p2)
			return p2 ~= nil
		end),
		ref = p1.guiObjectRef
	}, {
		body = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			FontFace = var17:map(function(p2)
				return p2.font
			end),
			TextSize = var17:map(function(p2)
				return p2.textSize
			end),
			TextColor3 = var17:map(function(p2)
				return p2.textColor
			end),
			TextStrokeColor3 = var6,
			TextStrokeTransparency = var18,
			TextTransparency = textTransparency,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			RichText = true,
			Text = var16,
			[reactModule.Change.Text] = var12
		}, {
			stroke = reactModule.createElement("UIStroke", {
				Color = var6 or Color3.fromRGB(0, 0, 0),
				Thickness = var1.Stroke.Thin,
				Transparency = var18
			})
		}),
		skeleton = reactModule.createElement(foundationModule.Skeleton, {
			Size = reactModule.joinBindings({ display = var9, placeholder = var14 }):map(function(p2)
				local display = p2.display
				
				return if display == nil or display.skeletonWidth ~= "full" then p2.placeholder else UDim2.new(1, 0, 0, p2.placeholder.Y.Offset)
			end),
			Position = UDim2.fromOffset(0, 0),
			AnchorPoint = Vector2.new(0, 0),
			Visible = reactModule.joinBindings({ display = var9, textTransparency = textTransparency }):map(function(p2)
				if p2.textTransparency >= 0.9 then
					return false
				end
				local display = p2.display
				
				return if display == nil then false elseif display.skeletonWidth ~= "prefix" then display.skeletonWidth == "full" else true
			end)
		})
	})
end)