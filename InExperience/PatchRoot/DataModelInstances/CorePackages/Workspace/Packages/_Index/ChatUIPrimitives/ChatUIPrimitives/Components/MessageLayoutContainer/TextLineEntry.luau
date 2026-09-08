local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local foundationModule = require(parent.Foundation)
local _ = require(chatUIPrimitives.Types)
local useStableSignalModule = require(chatUIPrimitives.Hooks.useStableSignal)
local formatInlineIconModule = require(chatUIPrimitives.Utils.formatInlineIcon)
local textChannelWindowPerfTrackerModule = require(chatUIPrimitives.Telemetry.TextChannelWindowPerfTracker)
local rewriteToggleModule = require(script.Parent.RewriteToggle)
local iconName = foundationModule.Enums.IconName
local useSignalBinding = signalsReactModule.useSignalBinding

local function _(value)
	local ceiled = math.ceil(value)
	
	if ceiled % 2 == 1 then
		ceiled += 1
	end
	return math.max(0, ceiled)
end

local _ = function(value)
	local t = { weight = "700" }
	local ceiled = math.ceil(value * 3 / 4)
	
	if ceiled % 2 == 1 then
		ceiled += 1
	end
	t.size = tostring(math.max(0, ceiled))
	
	return t
end

return reactModule.memo(function(p1)
	-- upvalues: foundationModule (ref), reactModule (ref), signalsModule (ref), useStableSignalModule (ref), signalsReactModule (ref), textChannelWindowPerfTrackerModule (ref), useSignalBinding (ref), formatInlineIconModule (ref), iconName (ref), rewriteToggleModule (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local var2 = reactModule.useMemo(function()
		-- upvalues: var1 (ref)
		local color3 = var1.DarkMode.Content.Muted.Color3
		
		return string.format("<font color=\"rgb(%d,%d,%d)\">", math.round(color3.R * 255), math.round(color3.G * 255), math.round(color3.B * 255))
	end, { var1 })
	local var3 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p1 (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: p1 (copy)
			local messageId = p1.getMessageId(p2)
			
			return if messageId then p1.getMessagesMap(p2)[messageId] else nil
		end)
	end, { p1.getMessageId, p1.getMessagesMap })
	local var4, var5 = useStableSignalModule(false)
	local var6 = signalsReactModule.useSignalState(p1.getMessageId)
	reactModule.useEffect(function()
		-- upvalues: var5 (ref)
		var5(false)
	end, { var6, var5 })
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), textChannelWindowPerfTrackerModule (copy)
		if var6 then
			textChannelWindowPerfTrackerModule.finishMessageIntervals(var6)
		end
	end, { var6 })
	local var7 = useSignalBinding(var3)
	local var8 = useSignalBinding(p1.getLayoutOrder)
	local var9 = signalsReactModule.useSignalState(var4)
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local var10 = signalsReactModule.useSignalState(var3)
	local var11 = reactModule.useMemo(function()
		-- upvalues: var10 (write), formatInlineIconModule (copy), iconName (copy), var1 (ref)
		if not var10 or not var10.presetId or var10.presetId == "" then
			return ""
		end
		local var12 = formatInlineIconModule
		local lightningBolt = iconName.LightningBolt
		local t = { weight = "700" }
		local ceiled = math.ceil(var1.Typography.BodyLarge.FontSize * 3 / 4)
		
		if ceiled % 2 == 1 then
			ceiled += 1
		end
		t.size = tostring(math.max(0, ceiled))
		
		return var12(lightningBolt, t)
	end, { var10, var1 })
	
	return reactModule.createElement(foundationModule.View, {
		tag = "col gap-xsmall auto-y",
		Size = UDim2.new(1, 0, 0, 0),
		backgroundStyle = { Transparency = 1, Color3 = Color3.new(0, 0, 0) },
		LayoutOrder = var8,
		Visible = var10 ~= nil
	}, {
		label = reactModule.createElement(foundationModule.Text, {
			tag = "text-body-large text-wrap text-align-x-left text-align-y-top content-emphasis",
			RichText = true,
			LayoutOrder = 1,
			Text = reactModule.useMemo(function()
				-- upvalues: var10 (write), var11 (write), var2 (ref)
				if not var10 then
					return ""
				end
				local prefixText = var10.prefixText or ""
				
				if var10.messageType == "user" then
					local var12 = var11
					
					return if var12 == "" then prefixText .. " " .. var21.content else `{prefixText} {var10.content} {var12}`
				end
				return if var10.messageType == "system-roblox" then var10.content else var2 .. var21.content .. "</font>"
			end, { var10, var11, var2 }),
			fontStyle = reactModule.useMemo(function()
				-- upvalues: p1 (ref)
				return if p1.fontFace then { Font = p1.fontFace } else nil
			end, { p1.fontFace or false }),
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}),
		rewriteToggle = reactModule.createElement(rewriteToggleModule, {
			LayoutOrder = 2,
			messageBinding = var7,
			showOriginal = var9,
			onToggle = reactModule.useCallback(function()
				-- upvalues: var5 (ref), var4 (ref)
				var5(not var4())
			end, { var4, var5 })
		})
	})
end)