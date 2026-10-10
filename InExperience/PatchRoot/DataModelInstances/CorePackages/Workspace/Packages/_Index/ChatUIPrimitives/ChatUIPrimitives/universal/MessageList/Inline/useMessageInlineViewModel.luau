local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(script.Parent.Parent.Parent.Types)
local _ = require(script.Parent.Parent.groupMessages)
local unpackContentModule = require(script.Parent.Parent.Parent.ContentKinds.unpackContent)

local function _(p1)
	return p1.message.author ~= nil and p1.groupPosition.isFirst
end

local function structureKeyOf(p1)
	-- upvalues: unpackContentModule (ref)
	local t = {}
	
	for i, v in p1.message.contents do
		local var1 = unpackContentModule(v)
		
		if var1 ~= nil then
			table.insert(t, var1)
		end
	end
	return tostring(p1.message.author ~= nil and p1.groupPosition.isFirst) .. "|" .. table.concat(t, ",") .. (if p1.message.deliveryState ~= nil then "" else "|" .. p1.message.deliveryState)
end

return function(p2)
	-- upvalues: reactModule (ref), signalsModule (ref), structureKeyOf (ref), signalsReactModule (ref), unpackContentModule (ref)
	local var2 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), structureKeyOf (copy), p2 (ref)
		return signalsModule.createComputed(function(p3)
			-- upvalues: structureKeyOf (copy), p2 (copy)
			return structureKeyOf(p2(p3))
		end)
	end, { p2 }))
	local var3 = reactModule.useMemo(function()
		-- upvalues: p2 (ref), unpackContentModule (copy)
		local var4 = p2(false)
		local t = {}
		
		for i, v in var4.message.contents do
			local var5, var6 = unpackContentModule(v)
			
			if var5 ~= nil and var6 ~= nil then
				table.insert(t, {
					kind = var5,
					getContent = function(p3)
						-- upvalues: unpackContentModule (copy), p2 (copy), i (ref), var6 (ref)
						local _, var7 = unpackContentModule(p2(p3).message.contents[i])
						
						return if var7 == nil then var6 else var7
					end
				})
			end
		end
		return {
			hasIdentity = var4.message.author ~= nil and var4.groupPosition.isFirst,
			contents = t,
			deliveryState = var4.message.deliveryState
		}
	end, { p2, var2 })
	
	return {
		structureKey = var2,
		hasIdentity = var3.hasIdentity,
		getIdentity = reactModule.useMemo(function()
			-- upvalues: p2 (ref)
			return function(p3)
				-- upvalues: p2 (copy)
				local author = p2(p3).message.author
				
				return if author == nil then nil else {
					isRobloxVerified = false,
					userId = author.userId,
					displayName = author.displayName,
					avatarContent = `rbxthumb://type=AvatarHeadShot&id={author.userId}&w=150&h=150`
				}
			end
		end, { p2 }),
		contents = var3.contents,
		deliveryState = var3.deliveryState
	}
end