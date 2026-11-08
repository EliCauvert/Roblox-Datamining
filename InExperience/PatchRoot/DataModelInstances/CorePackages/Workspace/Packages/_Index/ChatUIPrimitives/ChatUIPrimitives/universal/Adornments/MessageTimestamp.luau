local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local UseInExperienceLocalizationModule = require(ChatUIPrimitives.Hooks.useInExperienceLocalization)
local UseRobloxLocaleModule = require(ChatUIPrimitives.Hooks.useRobloxLocale)
local FormatTimestampModule = require(script.Parent.Parent.MessageList.formatTimestamp)
local GetRelativeTimestampLabelModule = require(script.Parent.getRelativeTimestampLabel)
local MessageClockContextModule = require(script.Parent.MessageClockContext)
local UseMessageClockModule = require(script.Parent.useMessageClock)
local TimestampFormatContextModule = require(script.Parent.TimestampFormatContext)

return ReactModule.memo(function(Frame)
	-- upvalues: UseInExperienceLocalizationModule (copy), UseRobloxLocaleModule (copy), ReactModule (copy), MessageClockContextModule (copy), UseMessageClockModule (copy), TimestampFormatContextModule (copy), FormatTimestampModule (copy), SignalsModule (copy), GetRelativeTimestampLabelModule (copy), SignalsReactModule (copy), FoundationModule (copy)
	local UseInExperienceLocalizationModuleResult = UseInExperienceLocalizationModule()
	local UseRobloxLocaleModuleResult = UseRobloxLocaleModule()
	local UseContextResult = ReactModule.useContext(MessageClockContextModule)
	local UseMessageClockModuleResult = UseMessageClockModule({ enabled = UseContextResult == nil })
	local Callback = if UseContextResult == nil then UseMessageClockModuleResult else UseContextResult
	local GetSentAtUnixMillisecondsFunction = Frame.getSentAtUnixMilliseconds
	local IsAbsolute = ReactModule.useContext(TimestampFormatContextModule) == "absolute"
	
	return ReactModule.createElement(FoundationModule.Text, {
		tag = FoundationModule.Hooks.useDefaultTags(Frame.tag, "auto-xy"),
		Text = SignalsReactModule.useSignalBinding((ReactModule.useMemo(function()
			-- upvalues: FormatTimestampModule (upval), UseRobloxLocaleModuleResult (copy), SignalsModule (upval), GetSentAtUnixMillisecondsFunction (copy), Callback (copy), IsAbsolute (copy), GetRelativeTimestampLabelModule (upval), UseInExperienceLocalizationModuleResult (copy)
			local function formatAbsolute(p1, p2)
				-- upvalues: FormatTimestampModule (upval), UseRobloxLocaleModuleResult (upval)
				return FormatTimestampModule(p1, p2, UseRobloxLocaleModuleResult)
			end
			
			return SignalsModule.createComputed(function(p1)
				-- upvalues: GetSentAtUnixMillisecondsFunction (upval), Callback (upval), IsAbsolute (upval), formatAbsolute (copy), GetRelativeTimestampLabelModule (upval), UseInExperienceLocalizationModuleResult (upval)
				local SentAtUnixMilliseconds = GetSentAtUnixMillisecondsFunction(p1)
				local CallbackResult = Callback(p1)
				
				return if IsAbsolute then formatAbsolute(SentAtUnixMilliseconds, CallbackResult) else GetRelativeTimestampLabelModule(SentAtUnixMilliseconds, CallbackResult, UseInExperienceLocalizationModuleResult, formatAbsolute)
			end)
		end, {
			GetSentAtUnixMillisecondsFunction,
			Callback,
			UseInExperienceLocalizationModuleResult,
			UseRobloxLocaleModuleResult,
			IsAbsolute
		}))),
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	})
end)