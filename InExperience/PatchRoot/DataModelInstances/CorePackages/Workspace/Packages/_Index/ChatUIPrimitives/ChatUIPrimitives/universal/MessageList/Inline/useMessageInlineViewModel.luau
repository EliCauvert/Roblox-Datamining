local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(script.Parent.Parent.Parent.Types)
local _ = require(script.Parent.Parent.groupMessages)
local UseMessageRowContentsModule = require(script.Parent.Parent.useMessageRowContents)

local function _(p1) --[[ Line: 22 | Named "hasIdentity" ]]
	return p1.message.author ~= nil and p1.groupPosition.isFirst
end

local _ = function(p1): string --[[ Line: 29 | Named "renderKeyOf" ]]
	return `{p1.message.author ~= nil and p1.groupPosition.isFirst}|{if p1.message.deliveryState == nil then "" else p1.message.deliveryState}`
end

return function(Callback) --[[ Line: 34 | Named "useMessageInlineViewModel" ]]
	-- upvalues: UseMessageRowContentsModule (copy), ReactModule (copy), SignalsModule (copy), SignalsReactModule (copy)
	local UseMessageRowContentsModuleResult = UseMessageRowContentsModule(Callback)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 43 ]]
		-- upvalues: Callback (copy)
		local CallbackResult = Callback(false)
		
		return {
			hasIdentity = CallbackResult.message.author ~= nil and CallbackResult.groupPosition.isFirst,
			deliveryState = CallbackResult.message.deliveryState
		}
	end, {
		Callback,
		(SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 36 ]]
			-- upvalues: SignalsModule (upval), Callback (copy)
			return SignalsModule.createComputed(function(p2): string --[[ Line: 37 ]]
				-- upvalues: Callback (upval)
				local CallbackResult = Callback(p2)
				
				return `{CallbackResult.message.author ~= nil and CallbackResult.groupPosition.isFirst}|{if CallbackResult.message.deliveryState == nil then "" else CallbackResult.message.deliveryState}`
			end)
		end, { Callback }))))
	})
	
	return {
		hasIdentity = UseMemoResult.hasIdentity,
		getIdentity = UseMessageRowContentsModuleResult.getIdentity,
		contents = UseMessageRowContentsModuleResult.contents,
		deliveryState = UseMemoResult.deliveryState
	}
end