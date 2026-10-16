local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(script.Parent.Parent.Types)
local _ = require(script.Parent.groupMessages)
local UnpackContentModule = require(script.Parent.Parent.ContentKinds.unpackContent)

local function contentKindsKey(p1): string --[[ Line: 26 ]]
	-- upvalues: UnpackContentModule (copy)
	local List = {}
	
	for _, content in p1.message.contents do
		local UnpackContentModuleResult = UnpackContentModule(content)
		
		if UnpackContentModuleResult ~= nil then
			table.insert(List, UnpackContentModuleResult)
		end
	end
	return table.concat(List, ",")
end

return function(Callback) --[[ Line: 37 | Named "useMessageRowContents" ]]
	-- upvalues: ReactModule (copy), SignalsModule (copy), contentKindsKey (copy), SignalsReactModule (copy), UnpackContentModule (copy)
	return {
		getIdentity = ReactModule.useMemo(function() --[[ Line: 38 ]]
			-- upvalues: Callback (copy)
			return function(p2) --[[ Line: 39 ]]
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
		contents = ReactModule.useMemo(function() --[[ Line: 60 ]]
			-- upvalues: Callback (copy), UnpackContentModule (upval)
			local List = {}
			
			for i, content in Callback(false).message.contents do
				local UnpackContentModuleResult = UnpackContentModule(content)
				
				if UnpackContentModuleResult ~= nil then
					table.insert(List, {
						kind = UnpackContentModuleResult,
						getContent = function(p2) --[[ Line: 72 ]]
							-- upvalues: Callback (upval), i (copy), UnpackContentModule (upval), UnpackContentModuleResult (copy), content (copy)
							local Content = Callback(p2).message.contents[i]
							
							return if UnpackContentModule(Content) == UnpackContentModuleResult then Content else content
						end
					})
				end
			end
			return List
		end, {
			Callback,
			(SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 53 ]]
				-- upvalues: SignalsModule (upval), contentKindsKey (upval), Callback (copy)
				return SignalsModule.createComputed(function(p2) --[[ Line: 54 ]]
					-- upvalues: contentKindsKey (upval), Callback (upval)
					return contentKindsKey(Callback(p2))
				end)
			end, { Callback }))))
		})
	}
end