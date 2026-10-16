local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Signals)
local _ = require(script.Parent.Parent.Types)

return function(p1, Callback) --[[ Line: 22 | Named "withMessageContent" ]]
	-- upvalues: ReactModule (copy)
	return function(Frame) --[[ Line: 26 | Named "MessageContentAdapter" ]]
		-- upvalues: ReactModule (upval), Callback (copy), p1 (copy)
		return ReactModule.createElement(p1, {
			getContent = ReactModule.useMemo(function() --[[ Line: 27 ]]
				-- upvalues: Callback (upval), Frame (copy)
				return function(p2) --[[ Line: 28 ]]
					-- upvalues: Callback (upval), Frame (upval)
					local CallbackResult = Callback(Frame.getContent(p2))
					assert(CallbackResult ~= nil, "Message content did not match its registered renderer")
					
					return CallbackResult
				end
			end, { Frame.getContent }),
			LayoutOrder = Frame.LayoutOrder
		})
	end
end