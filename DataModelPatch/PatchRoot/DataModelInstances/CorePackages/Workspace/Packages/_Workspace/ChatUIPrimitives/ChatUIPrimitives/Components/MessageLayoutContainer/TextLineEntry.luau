local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local FoundationModule = require(Parent.Foundation)
local _ = require(ChatUIPrimitives.Types)
local UseStableSignalModule = require(ChatUIPrimitives.Hooks.useStableSignal)
local RewriteToggleModule = require(script.Parent.RewriteToggle)
local UseSignalBindingFunction = SignalsReactModule.useSignalBinding

return ReactModule.memo(function(p1)
	-- upvalues: FoundationModule (copy), ReactModule (copy), SignalsModule (copy), UseStableSignalModule (copy), SignalsReactModule (copy), UseSignalBindingFunction (copy), RewriteToggleModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseMemoResult = ReactModule.useMemo(function(): string
		-- upvalues: UseTokensResult (copy)
		local MutedColor3 = UseTokensResult.DarkMode.Content.Muted.Color3
		
		return string.format("<font color=\"rgb(%d,%d,%d)\">", math.round(MutedColor3.R * 255), math.round(MutedColor3.G * 255), (math.round(MutedColor3.B * 255)))
	end, { UseTokensResult })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), p1 (copy)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: p1 (upval)
			local MessageId = p1.getMessageId(p2)
			
			return if MessageId then p1.getMessagesMap(p2)[MessageId] else nil
		end)
	end, { p1.getMessageId, p1.getMessagesMap })
	local UseStableSignalModuleResult, UseStableSignalModuleResult2 = UseStableSignalModule(false)
	ReactModule.useEffect(function()
		-- upvalues: UseStableSignalModuleResult2 (copy)
		UseStableSignalModuleResult2(false)
	end, {
		SignalsReactModule.useSignalState(p1.getMessageId),
		UseStableSignalModuleResult2
	})
	local UseSignalBindingResult = UseSignalBindingFunction(UseMemoResult1)
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "col gap-xsmall auto-y",
		Size = UDim2.new(1, 0, 0, 0),
		backgroundStyle = { Transparency = 1, Color3 = Color3.new(0, 0, 0) },
		LayoutOrder = UseSignalBindingFunction(p1.getLayoutOrder),
		Visible = UseSignalBindingResult:map(function(p2): boolean
			return p2 ~= nil
		end)
	}, {
		label = ReactModule.createElement(FoundationModule.Text, {
			tag = "text-body-large text-wrap text-align-x-left text-align-y-top content-emphasis",
			RichText = true,
			LayoutOrder = 1,
			Text = UseSignalBindingResult:map(function(p2)
				-- upvalues: UseMemoResult (copy)
				if p2 then
					local PrefixText = p2.prefixText or ""
					
					return if p2.messageType == "user" then PrefixText .. " " .. p2.content elseif p2.messageType == "system-roblox" then p2.content else UseMemoResult .. p2.content .. "</font>"
				else
					return ""
				end
			end),
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}),
		rewriteToggle = ReactModule.createElement(RewriteToggleModule, {
			LayoutOrder = 2,
			messageBinding = UseSignalBindingResult,
			showOriginal = SignalsReactModule.useSignalState(UseStableSignalModuleResult),
			onToggle = ReactModule.useCallback(function()
				-- upvalues: UseStableSignalModuleResult2 (copy), UseStableSignalModuleResult (copy)
				UseStableSignalModuleResult2(not UseStableSignalModuleResult())
			end, {
				UseStableSignalModuleResult,
				UseStableSignalModuleResult2
			})
		})
	})
end)