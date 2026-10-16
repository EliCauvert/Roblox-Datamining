local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(script.Parent.Parent.Parent.Types)
local _ = require(script.Parent.Parent.groupMessages)
local UnpackContentModule = require(script.Parent.Parent.Parent.ContentKinds.unpackContent)

local function _(p1) --[[ Line: 31 | Named "hasIdentity" ]]
	return p1.message.author ~= nil and p1.groupPosition.isFirst
end

local function structureKeyOf(p1): string --[[ Line: 35 ]]
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

return function(Callback) --[[ Line: 47 | Named "useMessageInlineViewModel" ]]
	-- upvalues: ReactModule (copy), SignalsModule (copy), structureKeyOf (copy), SignalsReactModule (copy), UnpackContentModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 48 ]]
		-- upvalues: SignalsModule (upval), structureKeyOf (upval), Callback (copy)
		return SignalsModule.createComputed(function(p2) --[[ Line: 49 ]]
			-- upvalues: structureKeyOf (upval), Callback (upval)
			return (structureKeyOf(Callback(p2)))
		end)
	end, { Callback })))
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 74 ]]
		-- upvalues: Callback (copy), UnpackContentModule (upval)
		local CallbackResult = Callback(false)
		local Contents = {}
		
		for i, content in CallbackResult.message.contents do
			local UnpackContentModuleResult = UnpackContentModule(content)
			
			if UnpackContentModuleResult ~= nil then
				table.insert(Contents, {
					kind = UnpackContentModuleResult,
					getContent = function(p2) --[[ Line: 86 ]]
						-- upvalues: Callback (upval), i (copy), UnpackContentModule (upval), UnpackContentModuleResult (copy), content (copy)
						local Content = Callback(p2).message.contents[i]
						
						return if UnpackContentModule(Content) == UnpackContentModuleResult then Content else content
					end
				})
			end
		end
		return {
			hasIdentity = CallbackResult.message.author ~= nil and CallbackResult.groupPosition.isFirst,
			contents = Contents,
			deliveryState = CallbackResult.message.deliveryState
		}
	end, { Callback, UseSignalStateResult })
	
	return {
		structureKey = UseSignalStateResult,
		hasIdentity = UseMemoResult.hasIdentity,
		getIdentity = ReactModule.useMemo(function() --[[ Line: 57 ]]
			-- upvalues: Callback (copy)
			return function(p2) --[[ Line: 58 ]]
				-- upvalues: Callback (upval)
				local Author = Callback(p2).message.author
				
				return if Author == nil then nil else {
					isRobloxVerified = false,
					userId = Author.userId,
					displayName = Author.displayName,
					avatarContent = `rbxthumb://type=AvatarHeadShot&id={Author.userId}&w=150&h=150`
				}
			end
		end, { Callback }),
		contents = UseMemoResult.contents,
		deliveryState = UseMemoResult.deliveryState
	}
end