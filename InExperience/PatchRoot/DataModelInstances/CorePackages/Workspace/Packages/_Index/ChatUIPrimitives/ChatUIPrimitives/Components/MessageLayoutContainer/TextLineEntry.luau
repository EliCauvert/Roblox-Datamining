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

return reactModule.memo(function(p0)
	-- upvalues: foundationModule (ref), reactModule (ref), signalsModule (ref), useStableSignalModule (ref), signalsReactModule (ref), textChannelWindowPerfTrackerModule (ref), useSignalBinding (ref), fFlagExpChatPresetBoltInMessageLayoutModule (ref), formatInlineIconModule (ref), iconName (ref), rewriteToggleModule (ref)
	local var24, var25
	local var13 = foundationModule.Hooks.useTokens()
	local var14 = reactModule.useMemo(function()
		-- upvalues: var13 (ref)
		local color3 = var13.DarkMode.Content.Muted.Color3
		
		return string.format("<font color=\"rgb(%d,%d,%d)\">", math.round(color3.R * 255), math.round(color3.G * 255), math.round(color3.B * 255))
	end, { var13 })
	local var15 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p0 (ref)
		return signalsModule.createComputed(function(p1)
			-- upvalues: p0 (copy)
			local messageId = p0.getMessageId(p1)
			
			return if messageId then p0.getMessagesMap(p1)[messageId] else nil
		end)
	end, { p0.getMessageId, p0.getMessagesMap })
	local var16, var17 = useStableSignalModule(false)
	local var18 = signalsReactModule.useSignalState(p0.getMessageId)
	reactModule.useEffect(function()
		-- upvalues: var17 (ref)
		var17(false)
	end, { var18, var17 })
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), textChannelWindowPerfTrackerModule (copy)
		if var18 then
			textChannelWindowPerfTrackerModule.finishMessageIntervals(var18)
		end
	end, { var18 })
	local var19 = useSignalBinding(var15)
	local var20 = useSignalBinding(p0.getLayoutOrder)
	local var21 = signalsReactModule.useSignalState(var16)
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagExpChatPresetBoltInMessageLayoutModule then
		local var22 = signalsReactModule.useSignalState(var15)
		local var23 = reactModule.useMemo(function()
			-- upvalues: var22 (write), formatInlineIconModule (copy), iconName (copy), var13 (ref)
			if not var22 or not var22.presetId or var22.presetId == "" then
				return ""
			end
			local var27 = formatInlineIconModule
			local lightningBolt = iconName.LightningBolt
			local t = { weight = "700" }
			local ceiled = math.ceil(var13.Typography.BodyLarge.FontSize * 3 / 4)
			
			if ceiled % 2 == 1 then
				ceiled += 1
			end
			t.size = tostring(math.max(0, ceiled))
			
			return var27(lightningBolt, t)
		end, { var22, var13 })
		var24 = reactModule.useMemo(function()
			-- upvalues: var22 (write), var23 (write), var14 (ref)
			if not var22 then
				return ""
			end
			local prefixText = var22.prefixText or ""
			
			if var22.messageType == "user" then
				local var31 = var23
				
				return if var31 == "" then prefixText .. " " .. var22.content else `{prefixText} {var22.content} {var31}`
			end
			return if var22.messageType == "system-roblox" then var22.content else var14 .. var22.content .. "</font>"
		end, { var22, var23, var14 })
		local _ = var22 ~= nil
	else
		var25 = var19:map(function(p2)
			return p2 ~= nil
		end)
		var24 = var19:map(function(p3)
			-- upvalues: var14 (ref)
			return if p3 then if p3.messageType == "user" then (p3.prefixText or "") .. " " .. p3.content elseif p3.messageType == "system-roblox" then p3.content else var14 .. p3.content .. "</font>" else ""
		end)
	end
	return reactModule.createElement(foundationModule.View, {
		tag = "col gap-xsmall auto-y",
		Size = UDim2.new(1, 0, 0, 0),
		backgroundStyle = { Transparency = 1, Color3 = Color3.new(0, 0, 0) },
		LayoutOrder = var20,
		Visible = var25
	}, {
		label = reactModule.createElement(foundationModule.Text, {
			tag = "text-body-large text-wrap text-align-x-left text-align-y-top content-emphasis",
			RichText = true,
			LayoutOrder = 1,
			Text = var24,
			fontStyle = reactModule.useMemo(function()
				-- upvalues: p0 (ref)
				return if p0.fontFace then { Font = p0.fontFace } else nil
			end, { p0.fontFace or false }),
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}),
		rewriteToggle = reactModule.createElement(rewriteToggleModule, {
			LayoutOrder = 2,
			messageBinding = var19,
			showOriginal = var21,
			onToggle = reactModule.useCallback(function()
				-- upvalues: var17 (ref), var16 (ref)
				var17(not var16())
			end, { var16, var17 })
		})
	})
end)