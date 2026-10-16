local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local FoundationModule = require(Parent.Foundation)
local _ = require(ChatUIPrimitives.Types)
local UseStableSignalModule = require(ChatUIPrimitives.Hooks.useStableSignal)
local FormatInlineIconModule = require(ChatUIPrimitives.Utils.formatInlineIcon)
local ResolveDisplayTextModule = require(ChatUIPrimitives.Translation.resolveDisplayText)
local UseTranslateToggleModule = require(ChatUIPrimitives.Translation.useTranslateToggle)
local TextChannelWindowPerfTrackerModule = require(ChatUIPrimitives.Telemetry.TextChannelWindowPerfTracker)
local RewriteToggleModule = require(script.Parent.RewriteToggle)
local TranslateHitOverlayModule = require(script.Parent.TranslateHitOverlay)
local FFlagTCWTranslationSupportModule = require(ChatUIPrimitives.Flags.FFlagTCWTranslationSupport)
local SelectableUsernameModule = require(script.Parent.SelectableUsername)
local IconName = FoundationModule.Enums.IconName
local UseSignalBindingFunction = SignalsReactModule.useSignalBinding
local Signal = SignalsModule.createSignal(nil)

local function noop() --[[ Line: 50 ]] end

local config = {
	affordance = FoundationModule.Enums.StateLayerAffordance.None
}

local function _(Value: number): number --[[ Line: 54 | Named "ceilToEven" ]]
	local Ceiled = math.ceil(Value)
	
	if Ceiled % 2 == 1 then
		Ceiled += 1
	end
	return (math.max(0, Ceiled))
end

local _ = function(p1: number): string --[[ Line: 63 | Named "builderIconSize" ]]
	local Ceiled = math.ceil(p1 * 3 / 4)
	
	if Ceiled % 2 == 1 then
		Ceiled += 1
	end
	return (tostring((math.max(0, Ceiled))))
end

local _ = function(p1: number) --[[ Line: 67 | Named "getPresetBoltIconAttributes" ]]
	local config = { weight = "700" }
	local Ceiled = math.ceil(p1 * 3 / 4)
	
	if Ceiled % 2 == 1 then
		Ceiled += 1
	end
	config.size = tostring((math.max(0, Ceiled)))
	
	return config
end

return ReactModule.memo(function(p1) --[[ Line: 71 | Named "TextLineEntry" ]]
	-- upvalues: FoundationModule (copy), ReactModule (copy), SignalsModule (copy), UseStableSignalModule (copy), SignalsReactModule (copy), TextChannelWindowPerfTrackerModule (copy), UseSignalBindingFunction (copy), Signal (copy), FFlagTCWTranslationSupportModule (copy), UseTranslateToggleModule (copy), FormatInlineIconModule (copy), IconName (copy), ResolveDisplayTextModule (copy), RewriteToggleModule (copy), SelectableUsernameModule (copy), TranslateHitOverlayModule (copy), noop (copy), config (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseMemoResult = ReactModule.useMemo(function(): string --[[ Line: 76 ]]
		-- upvalues: UseTokensResult (copy)
		local MutedColor3 = UseTokensResult.DarkMode.Content.Muted.Color3
		
		return string.format("<font color=\"rgb(%d,%d,%d)\">", math.round(MutedColor3.R * 255), math.round(MutedColor3.G * 255), (math.round(MutedColor3.B * 255)))
	end, { UseTokensResult })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 86 ]]
		-- upvalues: SignalsModule (upval), p1 (copy)
		return SignalsModule.createComputed(function(p2) --[[ Line: 87 ]]
			-- upvalues: p1 (upval)
			local MessageId = p1.getMessageId(p2)
			
			return if MessageId then p1.getMessagesMap(p2)[MessageId] else nil
		end)
	end, { p1.getMessageId, p1.getMessagesMap })
	local UseStableSignalModuleResult, UseStableSignalModuleResult2 = UseStableSignalModule(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState(p1.getMessageId)
	ReactModule.useEffect(function() --[[ Line: 101 ]]
		-- upvalues: UseStableSignalModuleResult2 (copy)
		UseStableSignalModuleResult2(false)
	end, { UseSignalStateResult, UseStableSignalModuleResult2 })
	ReactModule.useEffect(function() --[[ Line: 104 ]]
		-- upvalues: UseSignalStateResult (copy), TextChannelWindowPerfTrackerModule (upval)
		if UseSignalStateResult then
			TextChannelWindowPerfTrackerModule.finishMessageIntervals(UseSignalStateResult)
		end
	end, { UseSignalStateResult })
	local UseSignalBindingResult = UseSignalBindingFunction(UseMemoResult1)
	local UseSignalBindingResult1 = UseSignalBindingFunction(p1.getLayoutOrder)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseStableSignalModuleResult)
	local UseSignalStateResult2 = nil
	local UseMemoResult2 = nil
	UseSignalStateResult2 = SignalsReactModule.useSignalState(UseMemoResult1)
	local UseRefResult = ReactModule.useRef(nil)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(p1.getLatestMessageId or Signal)
	local IsUseSignalStateResultMatch: boolean = UseSignalStateResult ~= nil and UseSignalStateResult == UseSignalStateResult3
	local ReportLatestUsernameFunction = p1.reportLatestUsername
	ReactModule.useEffect(function() --[[ Line: 126 ]]
		-- upvalues: ReportLatestUsernameFunction (copy), IsUseSignalStateResultMatch (copy), UseRefResult (copy)
		if ReportLatestUsernameFunction == nil or not IsUseSignalStateResultMatch then return end
		ReportLatestUsernameFunction(UseRefResult.current)
		
		return function() --[[ Line: 131 ]]
			-- upvalues: ReportLatestUsernameFunction (upval)
			ReportLatestUsernameFunction(nil)
		end
	end, {
		IsUseSignalStateResultMatch,
		ReportLatestUsernameFunction
	})
	local UseTranslateToggleModuleResult = if FFlagTCWTranslationSupportModule then UseTranslateToggleModule(UseSignalStateResult2, UseSignalStateResult, p1.isTranslationSettingEnabled == true) else nil
	local IsOffered = UseTranslateToggleModuleResult ~= nil and UseTranslateToggleModuleResult.isOffered
	local ShouldShowTranslation = UseTranslateToggleModuleResult ~= nil and UseTranslateToggleModuleResult.shouldShowTranslation
	UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 143 ]]
		-- upvalues: UseSignalStateResult2 (ref), FormatInlineIconModule (upval), IconName (upval), UseTokensResult (copy)
		if not UseSignalStateResult2 or not UseSignalStateResult2.presetId or UseSignalStateResult2.presetId == "" then
			return ""
		end
		local LightningBolt = IconName.LightningBolt
		local config = { weight = "700" }
		local Ceiled = math.ceil(UseTokensResult.Typography.BodyLarge.FontSize * 3 / 4)
		
		if Ceiled % 2 == 1 then
			Ceiled += 1
		end
		config.size = tostring((math.max(0, Ceiled)))
		
		return FormatInlineIconModule(LightningBolt, config)
	end, { UseSignalStateResult2, UseTokensResult })
	local UseMemoResult3 = ReactModule.useMemo(function() --[[ Line: 153 ]]
		-- upvalues: UseSignalStateResult2 (ref), FormatInlineIconModule (upval), UseTokensResult (copy)
		if not UseSignalStateResult2 or not UseSignalStateResult2.iconName or UseSignalStateResult2.iconName == "" then
			return ""
		end
		local IconName = UseSignalStateResult2.iconName
		local config = { weight = "600" }
		local Ceiled = math.ceil(UseTokensResult.Typography.BodyLarge.FontSize * 3 / 4)
		
		if Ceiled % 2 == 1 then
			Ceiled += 1
		end
		config.size = tostring((math.max(0, Ceiled)))
		
		return FormatInlineIconModule(IconName, config)
	end, { UseSignalStateResult2, UseTokensResult })
	local UseMemoResult4 = ReactModule.useMemo(function() --[[ Line: 167 ]]
		-- upvalues: UseSignalStateResult2 (ref), FFlagTCWTranslationSupportModule (upval), ResolveDisplayTextModule (upval), IsOffered (copy), ShouldShowTranslation (copy), UseMemoResult2 (ref), UseMemoResult3 (copy), UseMemoResult (copy)
		if not UseSignalStateResult2 then
			return ""
		end
		local ResolveDisplayTextModuleResult = if FFlagTCWTranslationSupportModule then ResolveDisplayTextModule(UseSignalStateResult2, IsOffered and ShouldShowTranslation) else UseSignalStateResult2.content
		local PrefixText = UseSignalStateResult2.prefixText or ""
		
		if UseSignalStateResult2.messageType == "user" then
			local v1: string = if IsOffered then "     " else ""
			local UseMemoResult1 = UseMemoResult2
			
			return if UseMemoResult1 == "" then `{PrefixText} {v1}{ResolveDisplayTextModuleResult}` else `{PrefixText} {v1}{ResolveDisplayTextModuleResult} {UseMemoResult1}`
		else
			return if UseSignalStateResult2.messageType == "system-roblox" then ResolveDisplayTextModuleResult elseif UseMemoResult3 == "" then UseMemoResult .. ResolveDisplayTextModuleResult .. "</font>" else UseMemoResult .. UseMemoResult3 .. " " .. ResolveDisplayTextModuleResult .. "</font>"
		end
	end, {
		UseSignalStateResult2, UseMemoResult2, UseMemoResult3, UseMemoResult,
		ShouldShowTranslation, IsOffered
	})
	local HasUseSignalStateResult = UseSignalStateResult2 ~= nil
	local UseResult = ReactModule.useCallback(function() --[[ Line: 195 ]]
		-- upvalues: UseStableSignalModuleResult2 (copy), UseStableSignalModuleResult (copy)
		UseStableSignalModuleResult2(not UseStableSignalModuleResult())
	end, {
		UseStableSignalModuleResult,
		UseStableSignalModuleResult2
	})
	local UseMemoResult5 = ReactModule.useMemo(function() --[[ Line: 200 ]]
		-- upvalues: p1 (copy)
		return if p1.fontFace then { Font = p1.fontFace } else nil
	end, { p1.fontFace or false })
	local PrefixText = UseSignalStateResult2 and UseSignalStateResult2.prefixText or ""
	local IsNotPrefixTextMatch: boolean = p1.selectableRows == true and (UseSignalStateResult2 ~= nil and (UseSignalStateResult2.messageType == "user" and PrefixText ~= ""))
	local NoIsNotPrefixTextMatch: boolean = p1.selectableRows == true and not IsNotPrefixTextMatch
	local FontFace = p1.fontFace
	
	if FontFace == nil then
		local BodyLargeFont = UseTokensResult.Typography.BodyLarge.Font
		
		if typeof(BodyLargeFont) == "Font" then
			FontFace = BodyLargeFont
		elseif typeof(BodyLargeFont) == "EnumItem" then
			FontFace = Font.fromEnum(BodyLargeFont)
		end
	end
	local Element = ReactModule.createElement(FoundationModule.Text, {
		tag = "size-full-0 auto-y text-body-large text-wrap text-align-x-left text-align-y-top content-emphasis",
		RichText = true,
		LayoutOrder = 1,
		Text = UseMemoResult4,
		fontStyle = UseMemoResult5
	})
	local config1 = {
		rewriteToggle = ReactModule.createElement(RewriteToggleModule, {
			LayoutOrder = 2,
			messageBinding = UseSignalBindingResult,
			showOriginal = UseSignalStateResult1,
			onToggle = UseResult
		})
	}
	local HasUseTranslateToggleModuleResult: boolean = IsOffered and UseTranslateToggleModuleResult ~= nil
	
	if IsNotPrefixTextMatch or HasUseTranslateToggleModuleResult then
		config1.messageRow = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			label = Element,
			usernameSelection = if IsNotPrefixTextMatch then ReactModule.createElement(SelectableUsernameModule, {
				prefixText = PrefixText,
				fontFace = FontFace,
				textSize = UseTokensResult.Typography.BodyLarge.FontSize,
				selectionCursor = p1.selectionCursor,
				buttonRef = UseRefResult
			}) else nil,
			translateHit = if HasUseTranslateToggleModuleResult then ReactModule.createElement(TranslateHitOverlayModule, {
				prefixText = PrefixText,
				fontFace = FontFace,
				textSize = UseTokensResult.Typography.BodyLarge.FontSize,
				onActivated = UseTranslateToggleModuleResult.onToggle
			}) else nil
		})
	else
		config1.label = Element
	end
	return ReactModule.createElement(FoundationModule.View, {
		tag = "col gap-xsmall size-full-0 auto-y",
		backgroundStyle = { Transparency = 1, Color3 = Color3.new(0, 0, 0) },
		LayoutOrder = UseSignalBindingResult1,
		Visible = HasUseSignalStateResult,
		onActivated = if NoIsNotPrefixTextMatch then noop else nil,
		stateLayer = if NoIsNotPrefixTextMatch then config else nil,
		selection = if NoIsNotPrefixTextMatch then {
			Selectable = HasUseSignalStateResult,
			SelectionImageObject = p1.selectionCursor
		} else nil
	}, config1)
end)