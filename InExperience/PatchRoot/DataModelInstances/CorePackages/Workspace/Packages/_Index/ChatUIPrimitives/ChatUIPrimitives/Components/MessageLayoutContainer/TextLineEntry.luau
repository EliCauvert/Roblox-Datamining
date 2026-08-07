local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local foundationModule = require(parent.Foundation)
local _ = require(chatUIPrimitives.Types)
local useStableSignalModule = require(chatUIPrimitives.Hooks.useStableSignal)
local rewriteToggleModule = require(script.Parent.RewriteToggle)
local textChannelWindowPerfTrackerModule = require(chatUIPrimitives.Telemetry.TextChannelWindowPerfTracker)
local useSignalBinding = signalsReactModule.useSignalBinding

return reactModule.memo(function(p0) --[[ line: 24 | named "TextLineEntry" ]]
	-- upvalues: foundationModule (ref), reactModule (ref), signalsModule (ref), useStableSignalModule (ref), signalsReactModule (ref), textChannelWindowPerfTrackerModule (ref), useSignalBinding (ref), rewriteToggleModule (ref)
	local var8 = foundationModule.Hooks.useTokens()
	local var9 = reactModule.useMemo(function() --[[ line: 29 ]]
		-- upvalues: var8 (ref)
		local color3 = var8.DarkMode.Content.Muted.Color3
		
		return string.format("<font color=\"rgb(%d,%d,%d)\">", math.round(color3.R * 255), math.round(color3.G * 255), math.round(color3.B * 255))
	end, { var8 })
	local var10 = reactModule.useMemo(function() --[[ line: 39 ]]
		-- upvalues: signalsModule (copy), p0 (ref)
		return signalsModule.createComputed(function(p1) --[[ line: 40 ]]
			-- upvalues: p0 (copy)
			local messageId = p0.getMessageId(p1)
			
			return if messageId then p0.getMessagesMap(p1)[messageId] else nil
		end)
	end, { p0.getMessageId, p0.getMessagesMap })
	local var11, var12 = useStableSignalModule(false)
	local var13 = signalsReactModule.useSignalState(p0.getMessageId)
	reactModule.useEffect(function() --[[ line: 54 ]]
		-- upvalues: var12 (ref)
		var12(false)
	end, { var13, var12 })
	reactModule.useEffect(function() --[[ line: 57 ]]
		-- upvalues: var13 (ref), textChannelWindowPerfTrackerModule (copy)
		if var13 then
			textChannelWindowPerfTrackerModule.finishMessageIntervals(var13)
		end
	end, { var13 })
	local var14 = useSignalBinding(var10)
	
	return reactModule.createElement(foundationModule.View, {
		tag = "col gap-xsmall auto-y",
		Size = UDim2.new(1, 0, 0, 0),
		backgroundStyle = { Transparency = 1, Color3 = Color3.new(0, 0, 0) },
		LayoutOrder = useSignalBinding(p0.getLayoutOrder),
		Visible = var14:map(function(p2) --[[ line: 67 ]]
			return p2 ~= nil
		end)
	}, {
		label = reactModule.createElement(foundationModule.Text, {
			tag = "text-body-large text-wrap text-align-x-left text-align-y-top content-emphasis",
			RichText = true,
			LayoutOrder = 1,
			Text = var14:map(function(p3) --[[ line: 74 ]]
				-- upvalues: var9 (ref)
				return if p3 then if p3.messageType == "user" then (p3.prefixText or "") .. " " .. p3.content elseif p3.messageType == "system-roblox" then p3.content else var9 .. p3.content .. "</font>" else ""
			end),
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}),
		rewriteToggle = reactModule.createElement(rewriteToggleModule, {
			LayoutOrder = 2,
			messageBinding = var14,
			showOriginal = signalsReactModule.useSignalState(var11),
			onToggle = reactModule.useCallback(function() --[[ line: 88 ]]
				-- upvalues: var12 (ref), var11 (ref)
				var12(not var11())
			end, { var11, var12 })
		})
	})
end)