local Parent = script:FindFirstAncestor("DsaIllegalContentReporting").Parent
local GuiService = game:GetService("GuiService")
local HttpService = game:GetService("HttpService")
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local ControlState = FoundationModule.Enums.ControlState
local Text = FoundationModule.Text
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View

return ReactModule.memo(function() --[[ Line: 24 | Named "OSAReportLink" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), UseLocalizationFunction (copy), HttpService (copy), GuiService (copy), ControlState (copy), View (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseIsSpatialResult = ResponsiveModule.useIsSpatial()
	local IsUsePreferredInputResultMatch = UsePreferredInputFunction() == ResponsiveModule.Input.Directional or UseIsSpatialResult
	local UseLocalizationResult = UseLocalizationFunction({
		HelpPageTitle = "Feature.ReportAbuse.DSAIllegal.ReportPageTitle",
		OSACopy1 = "Feature.ReportAbuse.Message.OSACopy1",
		OSACopy2 = "Feature.ReportAbuse.Message.OSACopy2",
		OSACopy3 = "Feature.ReportAbuse.Message.OSACopy3",
		OSACopy4 = "Feature.ReportAbuse.Message.OSACopy4",
		OSACopyReadOnly = "Feature.ReportAbuse.Message.OSACopyReadOnly"
	})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 40 ]]
		-- upvalues: HttpService (upval), UseLocalizationResult (copy), GuiService (upval)
		GuiService:BroadcastNotification(HttpService:JSONEncode({
			presentationStyle = nil,
			visible = true,
			url = "https://www.roblox.com/illegal-content-reporting",
			title = UseLocalizationResult.HelpPageTitle
		}), 20)
	end, {})
	local UseResult1 = ReactModule.useCallback(function(Hover) --[[ Line: 50 ]]
		-- upvalues: ControlState (upval), UseStateResult2 (copy), UseTokensResult (copy)
		if Hover == ControlState.Hover then
			UseStateResult2(UseTokensResult.Color.State.Hover)
			
			return
		end
		if Hover == ControlState.Pressed then
			UseStateResult2(UseTokensResult.Color.State.Press)
			
			return
		else
			UseStateResult2(nil)
		end
	end, {})
	
	return ReactModule.createElement(View, { tag = "size-full col gap-small" }, {
		OSALink = ReactModule.createElement(Text, {
			RichText = true,
			TextWrapped = true,
			tag = "auto-xy radius-small padding-xsmall",
			LayoutOrder = 2,
			Text = if IsUsePreferredInputResultMatch then `<b>{UseLocalizationResult.OSACopyReadOnly}</b>` else `<b>{UseLocalizationResult.OSACopy4}</b>`,
			backgroundStyle = UseStateResult,
			fontStyle = UseTokensResult.Typography.BodySmall,
			textStyle = UseTokensResult.Color.Content.Emphasis,
			TextXAlignment = Enum.TextXAlignment.Left,
			onActivated = if IsUsePreferredInputResultMatch then nil else UseResult,
			onStateChanged = if IsUsePreferredInputResultMatch then nil else UseResult1
		})
	})
end)