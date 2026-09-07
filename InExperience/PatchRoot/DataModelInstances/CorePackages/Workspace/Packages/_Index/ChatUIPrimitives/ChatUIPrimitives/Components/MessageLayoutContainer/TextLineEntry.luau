local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local foundationModule = require(parent.Foundation)
local fFlagExpChatPresetBoltInMessageLayoutModule = require(chatUIPrimitives.Flags.FFlagExpChatPresetBoltInMessageLayout)
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
	-- upvalues: foundationModule (ref), reactModule (ref), signalsModule (ref), useStableSignalModule (ref), signalsReactModule (ref), textChannelWindowPerfTrackerModule (ref), useSignalBinding (ref), fFlagExpChatPresetBoltInMessageLayoutModule (ref), formatInlineIconModule (ref), iconName (ref), rewriteToggleModule (ref)
	local var1, var2
	local var3 = foundationModule.Hooks.useTokens()
	local var4 = reactModule.useMemo(function()
		-- upvalues: var3 (ref)
		local color3 = var3.DarkMode.Content.Muted.Color3
		
		return string.format("<font color=\"rgb(%d,%d,%d)\">", math.round(color3.R * 255), math.round(color3.G * 255), math.round(color3.B * 255))
	end, { var3 })
	local var5 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p1 (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: p1 (copy)
			local messageId = p1.getMessageId(p2)
			
			return if messageId then p1.getMessagesMap(p2)[messageId] else nil
		end)
	end, { p1.getMessageId, p1.getMessagesMap })
	local var6, var7 = useStableSignalModule(false)
	local var8 = signalsReactModule.useSignalState(p1.getMessageId)
	reactModule.useEffect(function()
		-- upvalues: var7 (ref)
		var7(false)
	end, { var8, var7 })
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), textChannelWindowPerfTrackerModule (copy)
		if var8 then
			textChannelWindowPerfTrackerModule.finishMessageIntervals(var8)
		end
	end, { var8 })
	local var9 = useSignalBinding(var5)
	local var10 = useSignalBinding(p1.getLayoutOrder)
	local var11 = signalsReactModule.useSignalState(var6)
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagExpChatPresetBoltInMessageLayoutModule then
		local var12 = signalsReactModule.useSignalState(var5)
		local var13 = reactModule.useMemo(function()
			-- upvalues: var12 (write), formatInlineIconModule (copy), iconName (copy), var3 (ref)
			if not var12 or not var12.presetId or var12.presetId == "" then
				return ""
			end
			local var14 = formatInlineIconModule
			local lightningBolt = iconName.LightningBolt
			local t = { weight = "700" }
			local ceiled = math.ceil(var3.Typography.BodyLarge.FontSize * 3 / 4)
			
			if ceiled % 2 == 1 then
				ceiled += 1
			end
			t.size = tostring(math.max(0, ceiled))
			
			return var14(lightningBolt, t)
		end, { var12, var3 })
		var1 = reactModule.useMemo(function()
			-- upvalues: var12 (write), var13 (write), var4 (ref)
			if not var12 then
				return ""
			end
			local prefixText = var12.prefixText or ""
			
			if var12.messageType == "user" then
				local var14 = var13
				
				return if var14 == "" then prefixText .. " " .. var22.content else `{prefixText} {var12.content} {var14}`
			end
			return if var12.messageType == "system-roblox" then var12.content else var4 .. var22.content .. "</font>"
		end, { var12, var13, var4 })
		local _ = var12 ~= nil
	else
		var2 = var9:map(function(p2)
			return p2 ~= nil
		end)
		var1 = var9:map(function(p2)
			-- upvalues: var4 (ref)
			return if p2 then if p2.messageType == "user" then (p2.prefixText or "") .. " " .. p3.content elseif p2.messageType == "system-roblox" then p2.content else var4 .. p3.content .. "</font>" else ""
		end)
	end
	return reactModule.createElement(foundationModule.View, {
		tag = "col gap-xsmall auto-y",
		Size = UDim2.new(1, 0, 0, 0),
		backgroundStyle = { Transparency = 1, Color3 = Color3.new(0, 0, 0) },
		LayoutOrder = var10,
		Visible = var2
	}, {
		label = reactModule.createElement(foundationModule.Text, {
			tag = "text-body-large text-wrap text-align-x-left text-align-y-top content-emphasis",
			RichText = true,
			LayoutOrder = 1,
			Text = var1,
			fontStyle = reactModule.useMemo(function()
				-- upvalues: p1 (ref)
				return if p1.fontFace then { Font = p1.fontFace } else nil
			end, { p1.fontFace or false }),
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}),
		rewriteToggle = reactModule.createElement(rewriteToggleModule, {
			LayoutOrder = 2,
			messageBinding = var9,
			showOriginal = var11,
			onToggle = reactModule.useCallback(function()
				-- upvalues: var7 (ref), var6 (ref)
				var7(not var6())
			end, { var6, var7 })
		})
	})
end)