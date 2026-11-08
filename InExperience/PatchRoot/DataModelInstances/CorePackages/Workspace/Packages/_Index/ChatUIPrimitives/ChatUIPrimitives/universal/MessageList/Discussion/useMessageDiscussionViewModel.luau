local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(script.Parent.Parent.Parent.Types)
local _ = require(script.Parent.Parent.groupMessages)
local UseMessageRowContentsModule = require(script.Parent.Parent.useMessageRowContents)

local function _(p1): string
	local Author = p1.message.author
	
	return `{p1.groupPosition.isFirst}|{if Author == nil then "" else Author.userId}`
end

return function(Callback)
	-- upvalues: UseMessageRowContentsModule (copy), ReactModule (copy), SignalsModule (copy), SignalsReactModule (copy)
	local UseMessageRowContentsModuleResult = UseMessageRowContentsModule(Callback)
	
	return {
		showIdentity = ReactModule.useMemo(function()
			-- upvalues: Callback (copy)
			local CallbackResult = Callback(false)
			
			return {
				showIdentity = CallbackResult.groupPosition.isFirst and CallbackResult.message.author ~= nil
			}
		end, {
			Callback,
			(SignalsReactModule.useSignalState((ReactModule.useMemo(function()
				-- upvalues: SignalsModule (upval), Callback (copy)
				return SignalsModule.createComputed(function(p2): string
					-- upvalues: Callback (upval)
					local CallbackResult = Callback(p2)
					local Author = CallbackResult.message.author
					
					return `{CallbackResult.groupPosition.isFirst}|{if Author == nil then "" else Author.userId}`
				end)
			end, { Callback }))))
		}).showIdentity,
		getIdentity = UseMessageRowContentsModuleResult.getIdentity,
		getSentAtUnixMilliseconds = ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), Callback (copy)
			return SignalsModule.createComputed(function(p2)
				-- upvalues: Callback (upval)
				return Callback(p2).message.sentAtUnixMilliseconds
			end)
		end, { Callback }),
		contents = UseMessageRowContentsModuleResult.contents
	}
end