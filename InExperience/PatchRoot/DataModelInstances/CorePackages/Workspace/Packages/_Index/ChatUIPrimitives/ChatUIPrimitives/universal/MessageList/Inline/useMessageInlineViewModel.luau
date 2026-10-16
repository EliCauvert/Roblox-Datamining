local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(script.Parent.Parent.Parent.Types)
local _ = require(script.Parent.Parent.groupMessages)
local UnpackContentModule = require(script.Parent.Parent.Parent.ContentKinds.unpackContent)
local UseMessageRowContentsModule = require(script.Parent.Parent.useMessageRowContents)

local function _(p1) --[[ Line: 27 | Named "hasIdentity" ]]
	return p1.message.author ~= nil and p1.groupPosition.isFirst
end

local function structureKeyOf(p1): string --[[ Line: 31 ]]
	-- upvalues: UnpackContentModule (copy)
	local List = {}
	
	for _, content in p1.message.contents do
		local UnpackContentModuleResult = UnpackContentModule(content)
		
		if UnpackContentModuleResult ~= nil then
			table.insert(List, UnpackContentModuleResult)
		end
	end
	return tostring(p1.message.author ~= nil and p1.groupPosition.isFirst) .. "|" .. table.concat(List, ",") .. (if p1.message.deliveryState == nil then "" else "|" .. p1.message.deliveryState)
end

return function(Callback) --[[ Line: 43 | Named "useMessageInlineViewModel" ]]
	-- upvalues: ReactModule (copy), SignalsModule (copy), structureKeyOf (copy), SignalsReactModule (copy), UseMessageRowContentsModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 44 ]]
		-- upvalues: SignalsModule (upval), structureKeyOf (upval), Callback (copy)
		return SignalsModule.createComputed(function(p2) --[[ Line: 45 ]]
			-- upvalues: structureKeyOf (upval), Callback (upval)
			return (structureKeyOf(Callback(p2)))
		end)
	end, { Callback })))
	local UseMessageRowContentsModuleResult = UseMessageRowContentsModule(Callback)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 54 ]]
		-- upvalues: Callback (copy)
		local CallbackResult = Callback(false)
		
		return {
			hasIdentity = CallbackResult.message.author ~= nil and CallbackResult.groupPosition.isFirst,
			deliveryState = CallbackResult.message.deliveryState
		}
	end, { Callback, UseSignalStateResult })
	
	return {
		structureKey = UseSignalStateResult,
		hasIdentity = UseMemoResult.hasIdentity,
		getIdentity = UseMessageRowContentsModuleResult.getIdentity,
		contents = UseMessageRowContentsModuleResult.contents,
		deliveryState = UseMemoResult.deliveryState
	}
end