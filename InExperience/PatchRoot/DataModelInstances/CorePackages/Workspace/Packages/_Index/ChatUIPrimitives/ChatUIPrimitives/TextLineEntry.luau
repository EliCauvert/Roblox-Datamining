local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local foundationModule = require(parent.Foundation)
local _ = require(script.Parent.Types)
local useSignalBinding = signalsReactModule.useSignalBinding

return reactModule.memo(function(p0) --[[ line: 21 | named "TextLineEntry" ]]
	-- upvalues: foundationModule (ref), reactModule (ref), signalsModule (ref), useSignalBinding (ref)
	local var4 = foundationModule.Hooks.useTokens()
	local var5 = reactModule.useMemo(function() --[[ line: 26 ]]
		-- upvalues: var4 (ref)
		local color3 = var4.DarkMode.Content.Muted.Color3
		
		return string.format("<font color=\"rgb(%d,%d,%d)\">", math.round(color3.R * 255), math.round(color3.G * 255), math.round(color3.B * 255))
	end, { var4 })
	local var6 = useSignalBinding(reactModule.useMemo(function() --[[ line: 36 ]]
		-- upvalues: signalsModule (copy), p0 (ref)
		return signalsModule.createComputed(function(p1) --[[ line: 37 ]]
			-- upvalues: p0 (copy)
			local messageId = p0.getMessageId(p1)
			
			return if messageId then p0.getMessagesMap(p1)[messageId] else nil
		end)
	end, { p0.getMessageId, p0.getMessagesMap }))
	
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-y",
		Size = UDim2.new(1, 0, 0, 0),
		backgroundStyle = { Transparency = 1, Color3 = Color3.new(0, 0, 0) },
		LayoutOrder = useSignalBinding(p0.getLayoutOrder),
		Visible = var6:map(function(p2) --[[ line: 49 ]]
			return p2 ~= nil
		end)
	}, {
		label = reactModule.createElement(foundationModule.Text, {
			tag = "text-caption-medium text-wrap text-align-x-left text-align-y-top content-emphasis",
			RichText = true,
			Text = var6:map(function(p3) --[[ line: 56 ]]
				-- upvalues: var5 (ref)
				return if p3 then if p3.messageType == "user" then (p3.prefixText or "") .. " " .. p3.content elseif p3.messageType == "system-roblox" then p3.content else var5 .. p3.content .. "</font>" else ""
			end),
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		})
	})
end)