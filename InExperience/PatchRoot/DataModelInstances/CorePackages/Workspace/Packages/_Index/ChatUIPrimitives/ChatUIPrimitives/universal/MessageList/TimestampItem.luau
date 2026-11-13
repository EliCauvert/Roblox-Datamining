local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local UseRobloxLocaleModule = require(ChatUIPrimitives.Hooks.useRobloxLocale)
local _ = require(script.Parent.groupMessages)
local FormatTimestampModule = require(script.Parent.formatTimestamp)
local SizingModule = require(script.Parent.Parent.Sizing)
local FFlagExpChatLocalizeMessageTimestampModule = require(ChatUIPrimitives.Flags.FFlagExpChatLocalizeMessageTimestamp)

local function TimestampText(p1)
	-- upvalues: SizingModule (copy), FoundationModule (copy), ReactModule (copy)
	return ReactModule.createElement(FoundationModule.Text, {
		tag = FoundationModule.Hooks.useDefaultTags(SizingModule.useSizing().timestamp.tag, "size-full-0 auto-y text-align-x-center"),
		Text = p1.label
	})
end

local function TimestampItemLocalized(p1)
	-- upvalues: UseRobloxLocaleModule (copy), ReactModule (copy), SignalsModule (copy), FormatTimestampModule (copy), SignalsReactModule (copy), TimestampText (copy)
	local UseRobloxLocaleModuleResult = UseRobloxLocaleModule()
	local ItemSignalFunction = p1.itemSignal
	
	return ReactModule.createElement(TimestampText, {
		label = SignalsReactModule.useSignalBinding((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), ItemSignalFunction (copy), FormatTimestampModule (upval), UseRobloxLocaleModuleResult (copy)
			return SignalsModule.createComputed(function(p2)
				-- upvalues: ItemSignalFunction (upval), FormatTimestampModule (upval), UseRobloxLocaleModuleResult (upval)
				local ItemSignalResult = ItemSignalFunction(p2)
				
				return FormatTimestampModule(ItemSignalResult.displayUnixMilliseconds, ItemSignalResult.referenceUnixMilliseconds, UseRobloxLocaleModuleResult)
			end)
		end, { ItemSignalFunction, UseRobloxLocaleModuleResult })))
	})
end

local function TimestampItemDefault(p1)
	-- upvalues: SignalsReactModule (copy), FormatTimestampModule (copy), ReactModule (copy), TimestampText (copy)
	return ReactModule.createElement(TimestampText, {
		label = SignalsReactModule.useSignalBinding(function(p2)
			-- upvalues: p1 (copy), FormatTimestampModule (upval)
			local ItemSignalResult = p1.itemSignal(p2)
			
			return FormatTimestampModule(ItemSignalResult.displayUnixMilliseconds, ItemSignalResult.referenceUnixMilliseconds)
		end)
	})
end

return if FFlagExpChatLocalizeMessageTimestampModule then TimestampItemLocalized else TimestampItemDefault