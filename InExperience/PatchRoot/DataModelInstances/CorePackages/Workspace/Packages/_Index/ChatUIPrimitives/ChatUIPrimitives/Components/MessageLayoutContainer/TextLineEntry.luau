local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local foundationModule = require(parent.Foundation)
local _ = require(chatUIPrimitives.Types)
local useStableSignalModule = require(chatUIPrimitives.Hooks.useStableSignal)
local formatInlineIconModule = require(chatUIPrimitives.Utils.formatInlineIcon)
local resolveDisplayTextModule = require(chatUIPrimitives.Translation.resolveDisplayText)
local useTranslateToggleModule = require(chatUIPrimitives.Translation.useTranslateToggle)
local textChannelWindowPerfTrackerModule = require(chatUIPrimitives.Telemetry.TextChannelWindowPerfTracker)
local rewriteToggleModule = require(script.Parent.RewriteToggle)
local translateHitOverlayModule = require(script.Parent.TranslateHitOverlay)
local fFlagTCWTranslationSupportModule = require(chatUIPrimitives.Flags.FFlagTCWTranslationSupport)
local selectableUsernameModule = require(script.Parent.SelectableUsername)
local iconName = foundationModule.Enums.IconName
local useSignalBinding = signalsReactModule.useSignalBinding
local var1 = signalsModule.createSignal(nil)

local function noop() end

local t = {
	affordance = foundationModule.Enums.StateLayerAffordance.None
}

local function _(value)
	local ceiled = math.ceil(value)
	
	if ceiled % 2 == 1 then
		ceiled += 1
	end
	return math.max(0, ceiled)
end

local _ = function(p1)
	local ceiled = math.ceil(p1 * 3 / 4)
	
	if ceiled % 2 == 1 then
		ceiled += 1
	end
	return tostring(math.max(0, ceiled))
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
	-- upvalues: foundationModule (ref), reactModule (ref), signalsModule (ref), useStableSignalModule (ref), signalsReactModule (ref), textChannelWindowPerfTrackerModule (ref), useSignalBinding (ref), var1 (ref), fFlagTCWTranslationSupportModule (ref), useTranslateToggleModule (ref), formatInlineIconModule (ref), iconName (ref), resolveDisplayTextModule (ref), rewriteToggleModule (ref), selectableUsernameModule (ref), translateHitOverlayModule (ref), noop (ref), t (ref)
	local var2 = foundationModule.Hooks.useTokens()
	local var3 = reactModule.useMemo(function()
		-- upvalues: var2 (ref)
		local color3 = var2.DarkMode.Content.Muted.Color3
		
		return string.format("<font color=\"rgb(%d,%d,%d)\">", math.round(color3.R * 255), math.round(color3.G * 255), math.round(color3.B * 255))
	end, { var2 })
	local var4 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p1 (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: p1 (copy)
			local messageId = p1.getMessageId(p2)
			
			return if messageId then p1.getMessagesMap(p2)[messageId] else nil
		end)
	end, { p1.getMessageId, p1.getMessagesMap })
	local var5, var6 = useStableSignalModule(false)
	local var7 = signalsReactModule.useSignalState(p1.getMessageId)
	reactModule.useEffect(function()
		-- upvalues: var6 (ref)
		var6(false)
	end, { var7, var6 })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), textChannelWindowPerfTrackerModule (copy)
		if var7 then
			textChannelWindowPerfTrackerModule.finishMessageIntervals(var7)
		end
	end, { var7 })
	local var8 = useSignalBinding(var4)
	local var9 = useSignalBinding(p1.getLayoutOrder)
	local var10 = signalsReactModule.useSignalState(var5)
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local var11 = signalsReactModule.useSignalState(var4)
	local var12 = reactModule.useRef(nil)
	local var13 = var7 ~= nil and var7 == signalsReactModule.useSignalState(p1.getLatestMessageId or var1)
	local reportLatestUsername = p1.reportLatestUsername
	reactModule.useEffect(function()
		-- upvalues: reportLatestUsername (ref), var13 (ref), var12 (ref)
		if reportLatestUsername == nil or not var13 then
			return
		end
		reportLatestUsername(var12.current)
		
		return function()
			-- upvalues: reportLatestUsername (copy)
			reportLatestUsername(nil)
		end
	end, { var13, reportLatestUsername })
	local var14 = if fFlagTCWTranslationSupportModule then useTranslateToggleModule(var11, var7, p1.isTranslationSettingEnabled == true) else nil
	local var15 = var14 ~= nil and var14.isOffered
	local var16 = var14 ~= nil and var14.shouldShowTranslation
	local var17 = reactModule.useMemo(function()
		-- upvalues: var11 (write), formatInlineIconModule (copy), iconName (copy), var2 (ref)
		if not var11 or not var11.presetId or var11.presetId == "" then
			return ""
		end
		local var18 = formatInlineIconModule
		local lightningBolt = iconName.LightningBolt
		local t = { weight = "700" }
		local ceiled = math.ceil(var2.Typography.BodyLarge.FontSize * 3 / 4)
		
		if ceiled % 2 == 1 then
			ceiled += 1
		end
		t.size = tostring(math.max(0, ceiled))
		
		return var18(lightningBolt, t)
	end, { var11, var2 })
	local var18 = reactModule.useMemo(function()
		-- upvalues: var11 (write), formatInlineIconModule (copy), var2 (ref)
		if not var11 or not var11.iconName or var11.iconName == "" then
			return ""
		end
		local var19 = formatInlineIconModule
		local iconName = var11.iconName
		local t = { weight = "600" }
		local ceiled = math.ceil(var2.Typography.BodyLarge.FontSize * 3 / 4)
		
		if ceiled % 2 == 1 then
			ceiled += 1
		end
		t.size = tostring(math.max(0, ceiled))
		
		return var19(iconName, t)
	end, { var11, var2 })
	local var19 = reactModule.useMemo(function()
		-- upvalues: var11 (write), fFlagTCWTranslationSupportModule (copy), resolveDisplayTextModule (copy), var15 (ref), var16 (ref), var17 (write), var18 (ref), var3 (ref)
		if not var11 then
			return ""
		end
		local var20 = if fFlagTCWTranslationSupportModule then resolveDisplayTextModule(var11, var15 and var16) else var11.content
		local prefixText = var11.prefixText or ""
		
		if var11.messageType == "user" then
			local var21 = if var15 then "     " else ""
			local var22 = var17
			
			return if var22 == "" then `{prefixText} {var21}{var20}` else `{prefixText} {var21}{var20} {var22}`
		end
		return if var11.messageType == "system-roblox" then var20 elseif var18 == "" then var3 .. var55 .. "</font>" else var3 .. var37 .. " " .. var55 .. "</font>"
	end, {
		var11, var17, var18, var3, var16, var15
	})
	local var20 = var11 ~= nil
	local var21 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), var5 (ref)
		var6(not var5())
	end, { var5, var6 })
	local var22 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		return if p1.fontFace then { Font = p1.fontFace } else nil
	end, { p1.fontFace or false })
	local var23 = if var11 then var11.prefixText or "" else ""
	local var24 = p1.selectableRows == true and (var11 ~= nil and (var11.messageType == "user" and var23 ~= ""))
	local var25 = p1.selectableRows == true and not var24
	local fontFace = p1.fontFace
	
	if fontFace == nil then
		local font = var2.Typography.BodyLarge.Font
		
		if typeof(font) == "Font" then
			fontFace = font
		elseif typeof(font) == "EnumItem" then
			fontFace = Font.fromEnum(font)
		end
	end
	local var26 = reactModule.createElement(foundationModule.Text, {
		tag = "size-full-0 auto-y text-body-large text-wrap text-align-x-left text-align-y-top content-emphasis",
		RichText = true,
		LayoutOrder = 1,
		Text = var19,
		fontStyle = var22
	})
	local t_1 = {
		rewriteToggle = reactModule.createElement(rewriteToggleModule, {
			LayoutOrder = 2,
			messageBinding = var8,
			showOriginal = var10,
			onToggle = var21
		})
	}
	local var27 = var15 and var14 ~= nil
	
	if var24 or var27 then
		t_1.messageRow = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			label = var26,
			usernameSelection = if var24 then reactModule.createElement(selectableUsernameModule, {
				prefixText = var23,
				fontFace = fontFace,
				textSize = var2.Typography.BodyLarge.FontSize,
				selectionCursor = p1.selectionCursor,
				buttonRef = var12
			}) else nil,
			translateHit = if var27 then reactModule.createElement(translateHitOverlayModule, {
				prefixText = var23,
				fontFace = fontFace,
				textSize = var2.Typography.BodyLarge.FontSize,
				onActivated = var14.onToggle
			}) else nil
		})
	else
		t_1.label = var26
	end
	return reactModule.createElement(foundationModule.View, {
		tag = "col gap-xsmall size-full-0 auto-y",
		backgroundStyle = { Transparency = 1, Color3 = Color3.new(0, 0, 0) },
		LayoutOrder = var9,
		Visible = var20,
		onActivated = if var25 then noop else nil,
		stateLayer = if var25 then t else nil,
		selection = if var25 then {
			Selectable = var20,
			SelectionImageObject = p1.selectionCursor
		} else nil
	}, t_1)
end)